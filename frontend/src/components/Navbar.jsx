import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { useCart } from '../context/CartContext';

const Navbar = () => {
  const { user, logout } = useAuth();
  const { cartCount } = useCart();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout();
    navigate('/');
  };

  return (
    <nav className="navbar">
      <div className="navbar-container">
        <Link to="/" className="navbar-logo">
          <span className="logo-text">EAT</span>
          <span className="logo-subtitle">Explore Amazing Taste</span>
        </Link>

        <div className="navbar-links">
          <Link to="/" className="nav-link">Home</Link>
          <Link to="/restaurants" className="nav-link">Restaurants</Link>
          <Link to="/categories" className="nav-link">Categories</Link>
          <Link to="/orders" className="nav-link">My Orders</Link>
          {user && user.role === 'admin' && (
            <Link to="/admin" className="nav-link">Admin</Link>
          )}
        </div>

        <div className="navbar-actions">
          <Link to="/cart" className="cart-button">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M9 20a1 1 0 1 0 0 2 1 1 0 1 0 0-2z" />
              <path d="M20 20a1 1 0 1 0 0 2 1 1 0 1 0 0-2z" />
              <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6" />
            </svg>
            {cartCount > 0 && <span className="cart-count">{cartCount}</span>}
          </Link>

          {user ? (
            <div className="user-menu">
              <span className="user-name">{user.fullName}</span>
              <button onClick={handleLogout} className="logout-button">Logout</button>
            </div>
          ) : (
            <div className="auth-buttons">
              <Link to="/login" className="auth-button login">Login</Link>
              <Link to="/signup" className="auth-button signup">Sign Up</Link>
            </div>
          )}
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
