import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useCart } from '../context/CartContext';
import { useAuth } from '../context/AuthContext';
import { orderAPI } from '../services/api';

const Checkout = () => {
  const { cart, cartTotal, restaurantId, clearCart } = useCart();
  const { user } = useAuth();
  const navigate = useNavigate();

  const [formData, setFormData] = useState({
    delivery_address: user?.address || '',
    delivery_phone: user?.phone || '',
    payment_method: 'cod',
    special_instructions: '',
    // Payment-specific fields
    upi_id: '',
    upi_app: '',
    card_number: '',
    card_expiry: '',
    card_cvv: '',
    card_type: 'credit',
    bank_name: '',
  });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleCardNumberChange = (e) => {
    // Format card number with spaces every 4 digits
    const value = e.target.value.replace(/\s/g, '').replace(/\D/g, '');
    const formatted = value.match(/.{1,4}/g)?.join(' ') || value;
    setFormData({ ...formData, card_number: formatted });
  };

  const handleCardExpiryChange = (e) => {
    // Format expiry as MM/YY
    const value = e.target.value.replace(/\D/g, '');
    if (value.length >= 2) {
      setFormData({ ...formData, card_expiry: value.substring(0, 2) + '/' + value.substring(2, 4) });
    } else {
      setFormData({ ...formData, card_expiry: value });
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setLoading(true);

    try {
      const orderData = {
        restaurant_id: restaurantId,
        total_amount: parseFloat(cartTotal) + 40,
        payment_method: formData.payment_method,
        delivery_address: formData.delivery_address,
        delivery_phone: formData.delivery_phone,
        special_instructions: formData.special_instructions,
        // Payment-specific fields
        upi_id: formData.upi_id,
        upi_app: formData.upi_app,
        card_number: formData.card_number,
        card_expiry: formData.card_expiry,
        card_cvv: formData.card_cvv,
        card_type: formData.card_type,
        bank_name: formData.bank_name,
        items: cart.map((item) => ({
          foodId: item.foodId,
          quantity: item.quantity,
          price: item.price,
          subtotal: item.subtotal,
        })),
      };

      const response = await orderAPI.create(orderData);

      if (response.data.payment_status === 'failed') {
        setError('Payment failed. Please try another payment method.');
        setLoading(false);
        return;
      }

      clearCart();
      navigate(`/order-success/${response.data.orderId}`);
    } catch (err) {
      setError(err.response?.data?.message || 'Failed to place order');
    } finally {
      setLoading(false);
    }
  };

  if (cart.length === 0) {
    return (
      <div className="page">
        <div className="container">
          <h1 className="page-title">Checkout</h1>
          <p>Your cart is empty</p>
          <button onClick={() => navigate('/restaurants')} className="button">
            Browse Restaurants
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="page">
      <div className="container">
        <h1 className="page-title">Checkout</h1>

        {error && <div className="error-message">{error}</div>}

        <form onSubmit={handleSubmit} className="checkout-form">
          <div className="form-section">
            <h2>Delivery Details</h2>
            <div className="form-group">
              <label>Delivery Address</label>
              <textarea
                name="delivery_address"
                value={formData.delivery_address}
                onChange={handleChange}
                required
                rows="3"
                placeholder="Enter your delivery address"
              />
            </div>
            <div className="form-group">
              <label>Phone Number</label>
              <input
                type="tel"
                name="delivery_phone"
                value={formData.delivery_phone}
                onChange={handleChange}
                required
                placeholder="Enter your phone number"
              />
            </div>
          </div>

          <div className="form-section">
            <h2>Payment Method</h2>

            {/* Cash on Delivery */}
            <div className={`payment-option ${formData.payment_method === 'cod' ? 'selected' : ''}`}>
              <label>
                <input
                  type="radio"
                  name="payment_method"
                  value="cod"
                  checked={formData.payment_method === 'cod'}
                  onChange={handleChange}
                />
                <span className="payment-icon">💵</span>
                <span className="payment-label">Cash on Delivery</span>
                <span className="payment-desc">Pay when your order arrives</span>
              </label>
            </div>

            {/* UPI Payment */}
            <div className={`payment-option ${formData.payment_method === 'upi' ? 'selected' : ''}`}>
              <label>
                <input
                  type="radio"
                  name="payment_method"
                  value="upi"
                  checked={formData.payment_method === 'upi'}
                  onChange={handleChange}
                />
                <span className="payment-icon">📱</span>
                <span className="payment-label">UPI Payment</span>
                <span className="payment-desc">Pay using PhonePe, GPay, Paytm</span>
              </label>

              {formData.payment_method === 'upi' && (
                <div className="payment-details">
                  <div className="form-group">
                    <label>Select UPI App</label>
                    <div className="app-options">
                      {['phonepe', 'gpay', 'paytm', 'other'].map((app) => (
                        <button
                          key={app}
                          type="button"
                          className={`app-option ${formData.upi_app === app ? 'selected' : ''}`}
                          onClick={() => setFormData({ ...formData, upi_app: app })}
                        >
                          {app.charAt(0).toUpperCase() + app.slice(1)}
                        </button>
                      ))}
                    </div>
                  </div>
                  <div className="form-group">
                    <label>UPI ID *</label>
                    <input
                      type="text"
                      name="upi_id"
                      value={formData.upi_id}
                      onChange={handleChange}
                      required
                      placeholder="e.g., mobile@upi"
                    />
                  </div>
                </div>
              )}
            </div>

            {/* Card Payment */}
            <div className={`payment-option ${formData.payment_method === 'card' ? 'selected' : ''}`}>
              <label>
                <input
                  type="radio"
                  name="payment_method"
                  value="card"
                  checked={formData.payment_method === 'card'}
                  onChange={handleChange}
                />
                <span className="payment-icon">💳</span>
                <span className="payment-label">Card Payment</span>
                <span className="payment-desc">Credit or Debit Card</span>
              </label>

              {formData.payment_method === 'card' && (
                <div className="payment-details">
                  <div className="form-group">
                    <label>Card Type</label>
                    <div className="app-options">
                      {['credit', 'debit'].map((type) => (
                        <button
                          key={type}
                          type="button"
                          className={`app-option ${formData.card_type === type ? 'selected' : ''}`}
                          onClick={() => setFormData({ ...formData, card_type: type })}
                        >
                          {type.charAt(0).toUpperCase() + type.slice(1)} Card
                        </button>
                      ))}
                    </div>
                  </div>
                  <div className="form-group">
                    <label>Card Number *</label>
                    <input
                      type="text"
                      name="card_number"
                      value={formData.card_number}
                      onChange={handleCardNumberChange}
                      required
                      placeholder="1234 5678 9012 3456"
                      maxLength="19"
                    />
                  </div>
                  <div className="form-row">
                    <div className="form-group">
                      <label>Expiry *</label>
                      <input
                        type="text"
                        name="card_expiry"
                        value={formData.card_expiry}
                        onChange={handleCardExpiryChange}
                        required
                        placeholder="MM/YY"
                        maxLength="5"
                      />
                    </div>
                    <div className="form-group">
                      <label>CVV *</label>
                      <input
                        type="password"
                        name="card_cvv"
                        value={formData.card_cvv}
                        onChange={handleChange}
                        required
                        placeholder="123"
                        maxLength="4"
                      />
                    </div>
                  </div>
                </div>
              )}
            </div>

            {/* Net Banking */}
            <div className={`payment-option ${formData.payment_method === 'net_banking' ? 'selected' : ''}`}>
              <label>
                <input
                  type="radio"
                  name="payment_method"
                  value="net_banking"
                  checked={formData.payment_method === 'net_banking'}
                  onChange={handleChange}
                />
                <span className="payment-icon">🏦</span>
                <span className="payment-label">Net Banking</span>
                <span className="payment-desc">Pay directly from your bank account</span>
              </label>

              {formData.payment_method === 'net_banking' && (
                <div className="payment-details">
                  <div className="form-group">
                    <label>Select Your Bank</label>
                    <div className="bank-options">
                      {['SBI', 'HDFC', 'ICICI', 'Axis', 'Kotak', 'PNB'].map((bank) => (
                        <button
                          key={bank}
                          type="button"
                          className={`bank-option ${formData.bank_name === bank ? 'selected' : ''}`}
                          onClick={() => setFormData({ ...formData, bank_name: bank })}
                        >
                          {bank}
                        </button>
                      ))}
                    </div>
                  </div>
                </div>
              )}
            </div>

            {/* Online Payment (Legacy) */}
            <div className={`payment-option ${formData.payment_method === 'online' ? 'selected' : ''}`}>
              <label>
                <input
                  type="radio"
                  name="payment_method"
                  value="online"
                  checked={formData.payment_method === 'online'}
                  onChange={handleChange}
                />
                <span className="payment-icon">💻</span>
                <span className="payment-label">Online Payment (Demo)</span>
                <span className="payment-desc">Simulated payment for demonstration</span>
              </label>
            </div>
          </div>

          <div className="secure-badge">
            <span className="secure-icon">🔒</span>
            <span>100% Secure Payments</span>
          </div>

          <div className="form-section">
            <h2>Special Instructions</h2>
            <div className="form-group">
              <textarea
                name="special_instructions"
                value={formData.special_instructions}
                onChange={handleChange}
                rows="2"
                placeholder="Any special requests?"
              />
            </div>
          </div>

          <div className="order-summary">
            <h2>Order Summary</h2>
            <div className="summary-row">
              <span>Subtotal</span>
              <span>₹{parseFloat(cartTotal).toFixed(2)}</span>
            </div>
            <div className="summary-row">
              <span>Delivery Fee</span>
              <span>₹40</span>
            </div>
            <div className="summary-row total">
              <span>Total</span>
              <span>₹{(parseFloat(cartTotal) + 40).toFixed(2)}</span>
            </div>
          </div>

          <button type="submit" className="button" disabled={loading}>
            {loading ? 'Placing Order...' : `Place Order - ₹${(parseFloat(cartTotal) + 40).toFixed(2)}`}
          </button>
        </form>
      </div>
    </div>
  );
};

export default Checkout;
