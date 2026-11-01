import { useParams, Link } from 'react-router-dom';
import { useState, useEffect } from 'react';
import { orderAPI } from '../services/api';

const OrderSuccess = () => {
  const { orderId } = useParams();
  const [order, setOrder] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchOrderDetails();
  }, [orderId]);

  const fetchOrderDetails = async () => {
    try {
      const response = await orderAPI.getById(orderId);
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
    return (
      <div className="page">
        <div className="container">
          <div className="loading">Loading...</div>
        </div>
      </div>
    );
  }

  return (
    <div className="page">
      <div className="container">
        <div className="success-message">
          <div className="success-icon">✓</div>
          <h1>Order Placed Successfully!</h1>
          <p>Your order has been received and is being processed.</p>

          {order && (
            <div className="order-details-card">
              <h3>Order #{orderId}</h3>
              <p><strong>Restaurant:</strong> {order.restaurant_name}</p>
              <p><strong>Status:</strong> <span className="status-badge">{order.status}</span></p>
              <p><strong>Total Amount:</strong> ₹{parseFloat(order.total_amount).toFixed(2)}</p>
              <p><strong>Payment Method:</strong> {getPaymentMethodName(order.payment_method)}</p>
              <p><strong>Payment Status:</strong>
                <span className={`payment-status ${order.payment_status}`}>
                  {getPaymentStatusName(order.payment_status)}
                </span>
              </p>

              {order.payment_status === 'pending' && (
                <div className="payment-info">
                  <strong>Pay on Delivery:</strong> Please keep ₹{parseFloat(order.total_amount).toFixed(2)} ready when your order arrives.
                </div>
              )}

              {order.payment_status === 'paid' && (
                <div className="payment-info">
                  <strong>Payment Successful:</strong> Your payment has been processed successfully.
                  {order.payment_transaction_id && (
                    <span><br />Transaction ID: {order.payment_transaction_id}</span>
                  )}
                </div>
              )}

              <p><strong>Delivery Address:</strong> {order.delivery_address}</p>
              <p><strong>Delivery Phone:</strong> {order.delivery_phone}</p>
              {order.special_instructions && (
                <p><strong>Special Instructions:</strong> {order.special_instructions}</p>
              )}
            </div>
          )}

          <Link to="/orders" className="button">
            View My Orders
          </Link>
          <Link to="/" className="button secondary">
            Back to Home
          </Link>
        </div>
      </div>
    </div>
  );
};

export default OrderSuccess;
