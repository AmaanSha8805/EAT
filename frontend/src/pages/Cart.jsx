import { Link } from 'react-router-dom';
import { useCart } from '../context/CartContext';

const Cart = () => {
  const { cart, cartTotal, updateQuantity, removeFromCart, clearCart } = useCart();

  if (cart.length === 0) {
    return (
      <div className="page">
        <div className="container">
          <h1 className="page-title">Your Cart</h1>
          <div className="empty-cart">
            <div className="empty-cart-icon">🍽️</div>
            <h2>Your cart is empty</h2>
            <p>Add delicious food items to get started</p>
            <Link to="/restaurants" className="button">
              Browse Restaurants
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="page">
      <div className="container">
        <h1 className="page-title">Your Cart</h1>

        <div className="cart-container">
          <div className="cart-items">
            {cart.map((item) => (
              <div key={item.foodId} className="cart-item">
                <img
                  src={item.image_url || '/placeholder-food.jpg'}
                  alt={item.name}
                  className="cart-item-image"
                />
                <div className="cart-item-details">
                  <h3 className="cart-item-name">{item.name}</h3>
                  <p className="cart-item-price">₹{item.price}</p>
                </div>
                <div className="cart-item-actions">
                  <div className="quantity-controls">
                    <button
                      onClick={() => updateQuantity(item.foodId, item.quantity - 1)}
                      className="qty-btn"
                      aria-label="Decrease quantity"
                    >
                      −
                    </button>
                    <span className="qty-value">{item.quantity}</span>
                    <button
                      onClick={() => updateQuantity(item.foodId, item.quantity + 1)}
                      className="qty-btn"
                      aria-label="Increase quantity"
                    >
                      +
                    </button>
                  </div>
                  <p className="cart-item-subtotal">₹{item.subtotal}</p>
                  <button
                    onClick={() => removeFromCart(item.foodId)}
                    className="remove-button"
                  >
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <path d="M3 6h18" />
                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                      <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                    </svg>
                    Remove
                  </button>
                </div>
              </div>
            ))}
          </div>

          <div className="cart-summary">
            <h2>Order Summary</h2>
            <div className="summary-row">
              <span>Subtotal</span>
              <span>₹{cartTotal}</span>
            </div>
            <div className="summary-row">
              <span>Delivery Fee</span>
              <span>₹40</span>
            </div>
            <div className="summary-row total">
              <span>Total</span>
              <span>₹{cartTotal + 40}</span>
            </div>
            <Link to="/checkout" className="button checkout-button">
              Proceed to Checkout
            </Link>
            <button onClick={clearCart} className="button clear-cart-button">
              Clear Cart
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Cart;
