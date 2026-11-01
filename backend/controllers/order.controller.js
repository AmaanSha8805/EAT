const db = require('../config/db');
const auth = require('../middleware/auth.middleware');
const paymentService = require('../services/payment.service');

// Create new order
const createOrder = async (req, res) => {
  const client = await db.connect();

  try {
    console.log('=== ORDER CREATION START ===');
    console.log('Request body:', JSON.stringify(req.body, null, 2));
    console.log('User from auth:', req.user);

    const {
      restaurant_id,
      total_amount,
      payment_method,
      delivery_address,
      delivery_phone,
      special_instructions,
      guest_name,
      items,
      // Payment-specific fields
      upi_id,
      upi_app,
      card_number,
      card_expiry,
      card_cvv,
      card_type,
      bank_name
    } = req.body;

    // Get user ID from auth middleware (if logged in), otherwise null for guest
    const userId = req.user ? req.user.userId : null;
    console.log('User ID:', userId);
    console.log('Restaurant ID:', restaurant_id);
    console.log('Total amount:', total_amount);
    console.log('Payment method:', payment_method);
    console.log('Items count:', items?.length);

    // Process payment
    console.log('Processing payment...');
    const paymentResult = await paymentService.processPayment({
      payment_method,
      upi_id,
      upi_app,
      card_number,
      card_expiry,
      card_cvv,
      card_type,
      bank_name
    });

    console.log('Payment result:', paymentResult);

    if (!paymentResult.success) {
      return res.status(400).json({
        success: false,
        message: paymentResult.error || 'Payment processing failed',
        payment_status: paymentResult.payment_status
      });
    }

    await client.query('BEGIN');
    console.log('Transaction started');

    // Extract payment details
    const paymentDetails = {
      upi_id: upi_id || null,
      upi_app: upi_app || null,
      card_last_four: paymentResult.card_last_four || null,
      card_type: card_type || null,
      bank_name: bank_name || null,
      payment_transaction_id: paymentResult.payment_transaction_id || null,
      payment_gateway_response: paymentResult.payment_gateway_response || null
    };

    // Insert order with payment details
    console.log('Inserting order...');
    const orderResult = await client.query(
      `INSERT INTO orders (user_id, restaurant_id, total_amount, status, payment_method, payment_status, delivery_address, delivery_phone, special_instructions, upi_id, upi_app, card_last_four, card_type, bank_name, payment_transaction_id, payment_gateway_response)
       VALUES ($1, $2, $3, 'placed', $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16)
       RETURNING order_id`,
      [
        userId,
        restaurant_id,
        total_amount,
        payment_method,
        paymentResult.payment_status,
        delivery_address,
        delivery_phone,
        special_instructions,
        paymentDetails.upi_id,
        paymentDetails.upi_app,
        paymentDetails.card_last_four,
        paymentDetails.card_type,
        paymentDetails.bank_name,
        paymentDetails.payment_transaction_id,
        paymentDetails.payment_gateway_response
      ]
    );

    const orderId = orderResult.rows[0].order_id;
    console.log('Order inserted with ID:', orderId);

    // Insert order items
    console.log('Inserting order items...');
    for (const item of items) {
      console.log('Inserting item:', item);
      await client.query(
        `INSERT INTO order_items (order_id, food_id, quantity, price_at_order, subtotal)
         VALUES ($1, $2, $3, $4, $5)`,
        [orderId, item.foodId, item.quantity, item.price, item.subtotal]
      );
    }
    console.log('All items inserted');

    await client.query('COMMIT');

    res.status(201).json({
      success: true,
      message: 'Order placed successfully',
      orderId,
      payment_status: paymentResult.payment_status,
      payment_transaction_id: paymentResult.payment_transaction_id
    });
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Create order error:', error);
    console.error('Error details:', error.message);
    console.error('Error code:', error.code);
    console.error('Request body:', req.body);
    res.status(500).json({
      success: false,
      message: 'Server error during order placement',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  } finally {
    client.release();
  }
};

// Get orders by user
const getOrdersByUser = async (req, res) => {
  try {
    const userId = req.user.userId;

    const result = await db.query(
      `SELECT o.*, r.name as restaurant_name, r.image_url as restaurant_image
       FROM orders o
       JOIN restaurants r ON o.restaurant_id = r.restaurant_id
       WHERE o.user_id = $1 AND o.is_deleted = false
       ORDER BY o.created_at DESC`,
      [userId]
    );

    res.json({
      success: true,
      orders: result.rows
    });
  } catch (error) {
    console.error('Get orders error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get order by ID
const getOrderById = async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.userId;

    const orderResult = await db.query(
      `SELECT o.*, r.name as restaurant_name, r.image_url as restaurant_image, r.address as restaurant_address
       FROM orders o
       JOIN restaurants r ON o.restaurant_id = r.restaurant_id
       WHERE o.order_id = $1 AND (o.user_id = $2 OR $2 IS NULL) AND o.is_deleted = false
       ORDER BY o.created_at DESC`,
      [id, userId]
    );

    if (orderResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Order not found'
      });
    }

    const order = orderResult.rows[0];

    // Get order items
    const itemsResult = await db.query(
      `SELECT oi.*, fi.name as food_name, fi.image_url as food_image
       FROM order_items oi
       JOIN food_items fi ON oi.food_id = fi.food_id
       WHERE oi.order_id = $1`,
      [id]
    );

    res.json({
      success: true,
      order: {
        ...order,
        items: itemsResult.rows
      }
    });
  } catch (error) {
    console.error('Get order error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Delete order (soft delete)
const deleteOrder = async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.userId;

    // First, check if order exists and belongs to user
    const orderResult = await db.query(
      `SELECT * FROM orders WHERE order_id = $1 AND user_id = $2`,
      [id, userId]
    );

    if (orderResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Order not found'
      });
    }

    const order = orderResult.rows[0];

    // Safety check: only allow deletion of delivered or cancelled orders
    const eligibleStatuses = ['delivered', 'cancelled'];
    if (!eligibleStatuses.includes(order.status)) {
      return res.status(400).json({
        success: false,
        message: `Cannot delete order with status: ${order.status}. Only delivered or cancelled orders can be removed.`
      });
    }

    // Check if already deleted
    if (order.is_deleted) {
      return res.status(400).json({
        success: false,
        message: 'Order has already been removed'
      });
    }

    // Soft delete: set is_deleted to true
    await db.query(
      `UPDATE orders SET is_deleted = true WHERE order_id = $1`,
      [id]
    );

    res.json({
      success: true,
      message: 'Order removed successfully'
    });
  } catch (error) {
    console.error('Delete order error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

module.exports = {
  createOrder,
  getOrdersByUser,
  getOrderById,
  deleteOrder
};
