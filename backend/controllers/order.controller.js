const db = require('../config/db');
const auth = require('../middleware/auth.middleware');

// Create new order
const createOrder = async (req, res) => {
  const client = await db.connect();

  try {
    const {
      restaurant_id,
      total_amount,
      payment_method,
      delivery_address,
      delivery_phone,
      special_instructions,
      guest_name,
      items
    } = req.body;

    // Get user ID from auth middleware (if logged in), otherwise null for guest
    const userId = req.user ? req.user.userId : null;

    await client.query('BEGIN');

    // Insert order
    const orderResult = await client.query(
      `INSERT INTO orders (user_id, restaurant_id, total_amount, status, payment_method, payment_status, delivery_address, delivery_phone, special_instructions)
       VALUES ($1, $2, $3, 'placed', $4, 'pending', $5, $6, $7)
       RETURNING order_id`,
      [userId, restaurant_id, total_amount, payment_method, delivery_address, delivery_phone, special_instructions]
    );

    const orderId = orderResult.rows[0].order_id;

    // Insert order items
    for (const item of items) {
      await client.query(
        `INSERT INTO order_items (order_id, food_id, quantity, price_at_order, subtotal)
         VALUES ($1, $2, $3, $4, $5)`,
        [orderId, item.foodId, item.quantity, item.price, item.subtotal]
      );
    }

    await client.query('COMMIT');

    res.status(201).json({
      success: true,
      message: 'Order placed successfully',
      orderId
    });
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Create order error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error during order placement'
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
       WHERE o.user_id = $1
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
       WHERE o.order_id = $1 AND (o.user_id = $2 OR $2 IS NULL)
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

module.exports = {
  createOrder,
  getOrdersByUser,
  getOrderById
};
