import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { AuthProvider } from './context/AuthContext';
import { CartProvider } from './context/CartContext';
import { ToastProvider } from './context/ToastContext';
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import Toast from './components/Toast';
import Home from './pages/Home';
import Restaurants from './pages/Restaurants';
import RestaurantDetails from './pages/RestaurantDetails';
import FoodItems from './pages/FoodItems';
import Categories from './pages/Categories';
import CategoryDetails from './pages/CategoryDetails';
import BestForDetails from './pages/BestForDetails';
import CollectionDetails from './pages/CollectionDetails';
import Login from './pages/Login';
import Signup from './pages/Signup';
import Cart from './pages/Cart';
import Checkout from './pages/Checkout';
import OrderSuccess from './pages/OrderSuccess';
import Orders from './pages/Orders';
import OrderDetails from './pages/OrderDetails';
import AdminDashboard from './pages/AdminDashboard';
import './index.css';

function App() {
  return (
    <AuthProvider>
      <CartProvider>
        <ToastProvider>
          <Router>
            <div className="app">
              <Navbar />
              <main className="main-content">
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/restaurants" element={<Restaurants />} />
                  <Route path="/restaurant/:id" element={<RestaurantDetails />} />
                  <Route path="/food-items" element={<FoodItems />} />
                  <Route path="/categories" element={<Categories />} />
                  <Route path="/category/:id" element={<CategoryDetails />} />
                  <Route path="/best-for/:id" element={<BestForDetails />} />
                  <Route path="/collection/:type" element={<CollectionDetails />} />
                  <Route path="/login" element={<Login />} />
                  <Route path="/signup" element={<Signup />} />
                  <Route path="/cart" element={<Cart />} />
                  <Route path="/checkout" element={<Checkout />} />
                  <Route path="/order-success/:orderId" element={<OrderSuccess />} />
                  <Route path="/orders" element={<Orders />} />
                  <Route path="/order/:id" element={<OrderDetails />} />
                  <Route path="/admin" element={<AdminDashboard />} />
                </Routes>
              </main>
              <Footer />
              <Toast />
            </div>
          </Router>
        </ToastProvider>
      </CartProvider>
    </AuthProvider>
  );
}

export default App
