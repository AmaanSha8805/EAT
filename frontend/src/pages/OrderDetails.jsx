import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { orderAPI } from '../services/api';

const OrderDetails = () => {
  const { id } = useParams();
  const [order, setOrder] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchOrder();
  }, [id]);

  const fetchOrder = async () => {
    try {
      const response = await orderAPI.getById(id);
      setOrder(response.data.order);
    } catch (error) {
      console.error('Error fetching order:', error);
    } finally {
      setLoading(false);
    }
  };

  const getPaymentMethodName = (method) => {
    const names = {
      'cod': 'Cash on Delivery',
      'upi': 'UPI',
      'card': 'Card Payment',
      'net_banking': 'Net Banking',
      'online': 'Online Payment'
    };
    return names[method] || method;
  };

  const getPaymentStatusName = (status) => {
    const names = {
      'pending': 'Pending',
      'paid': 'Paid',
      'failed': 'Failed'
    };
    return names[status] || status;
  };

  if (loading) {
    return <div className="loading">Loading...</div>;
  }

  if (!order) {
    return (
      <div className="page">
        <div className="container">
          <p>Order not found</p>
          <Link to="/orders" className="button">
            Back to Orders
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="page">
      <div className="container">
        <Link to="/orders" className="back-link">
          ← Back to Orders
        </Link>

        <h1 className="page-title">Order #{order.order_id}</h1>

        <div className="order-details-page">
          <div className="order-info">
            <div className="info-section">
              <h2>Order Status</h2>
              <span className={`status large ${order.status}`}>{order.status}</span>
            </div>

            <div className="info-section">
              <h2>Restaurant</h2>
              <p>{order.restaurant_name}</p>
              <p>{order.restaurant_address}</p>
            </div>

            <div className="info-section">
              <h2>Payment Information</h2>
              <p><strong>Payment Method:</strong> {getPaymentMethodName(order.payment_method)}</p>
              <p><strong>Payment Status:</strong>
                <span className={`payment-status-badge ${order.payment_status}`}>
                  {getPaymentStatusName(order.payment_status)}
                </span>
              </p>

              {order.payment_method === 'upi' && order.upi_id && (
                <>
                  <p><strong>UPI ID:</strong> {order.upi_id}</p>
                  {order.upi_app && <p><strong>UPI App:</strong> {order.upi_app.toUpperCase()}</p>}
                </>
              )}

              {order.payment_method === 'card' && order.card_last_four && (
                <>
                  <p><strong>Card:</strong> **** {order.card_last_four}
                    {order.card_type && <span> ({order.card_type.toUpperCase()})</span>}
                  </p>
                </>
              )}

              {order.payment_method === 'net_banking' && order.bank_name && (
                <p><strong>Bank:</strong> {order.bank_name}</p>
              )}

              {order.payment_transaction_id && (
                <p className="transaction-id"><strong>Transaction ID:</strong> {order.payment_transaction_id}</p>
              )}
            </div>

            <div className="info-section">
              <h2>Delivery Details</h2>
              <p><strong>Address:</strong> {order.delivery_address}</p>
              <p><strong>Phone:</strong> {order.delivery_phone}</p>
            </div>

            <div className="info-section">
              <h2>Order Date</h2>
              <p>{new Date(order.created_at).toLocaleString()}</p>
            </div>

            {order.special_instructions && (
              <div className="info-section">
                <h2>Special Instructions</h2>
                <p>{order.special_instructions}</p>
              </div>
            )}
          </div>

          <div className="order-items">
            <h2>Order Items</h2>
            {order.items.map((item) => (
              <div key={item.order_item_id} className="order-item">
                <img
                  src={item.food_image || '/placeholder-food.jpg'}
                  alt={item.food_name}
                />
                <div className="item-details">
                  <h4>{item.food_name}</h4>
                  <p>Qty: {item.quantity} × ₹{item.price_at_order}</p>
                  <p className="subtotal">₹{item.subtotal}</p>
                </div>
              </div>
            ))}

            <div className="order-total">
              <div className="summary-row">
                <span>Subtotal</span>
                <span>₹{parseFloat(order.total_amount) - 40}</span>
              </div>
              <div className="summary-row">
                <span>Delivery Fee</span>
                <span>₹40</span>
              </div>
              <div className="summary-row total">
                <span>Total</span>
                <span>₹{parseFloat(order.total_amount).toFixed(2)}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default OrderDetails;
