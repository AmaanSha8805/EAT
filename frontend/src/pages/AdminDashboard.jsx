import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { restaurantAPI, orderAPI } from '../services/api';

const AdminDashboard = () => {
  const { user } = useAuth();
  const [stats, setStats] = useState({
    restaurants: 0,
    orders: 0,
    users: 0,
    revenue: 0,
  });
  const [recentOrders, setRecentOrders] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user && user.role === 'admin') {
      fetchDashboardData();
    }
  }, [user]);

  const fetchDashboardData = async () => {
    try {
      const [restaurantsRes, ordersRes] = await Promise.all([
        restaurantAPI.getAll(),
        orderAPI.getByUser(),
      ]);

      const orders = ordersRes.data.orders || [];
      const totalRevenue = orders.reduce((sum, order) => sum + order.total_amount, 0);

      setStats({
        restaurants: restaurantsRes.data.restaurants.length,
        orders: orders.length,
        users: 100, // Placeholder - would need user API
        revenue: totalRevenue,
      });

      setRecentOrders(orders.slice(0, 5));
    } catch (error) {
      console.error('Error fetching dashboard data:', error);
    } finally {
      setLoading(false);
    }
  };

  if (!user || user.role !== 'admin') {
    return (
      <div className="page">
        <div className="container">
          <h1 className="page-title">Admin Dashboard</h1>
          <p>Access denied. Admin only.</p>
          <Link to="/" className="button">
            Back to Home
          </Link>
        </div>
      </div>
    );
  }

  if (loading) {
    return <div className="loading">Loading...</div>;
  }

  return (
    <div className="page">
      <div className="container">
        <h1 className="page-title">Admin Dashboard</h1>

        <div className="stats-grid">
          <div className="stat-card">
            <h3>Restaurants</h3>
            <p className="stat-number">{stats.restaurants}</p>
          </div>
          <div className="stat-card">
            <h3>Total Orders</h3>
            <p className="stat-number">{stats.orders}</p>
          </div>
          <div className="stat-card">
            <h3>Users</h3>
            <p className="stat-number">{stats.users}</p>
          </div>
          <div className="stat-card">
            <h3>Total Revenue</h3>
            <p className="stat-number">₹{stats.revenue}</p>
          </div>
        </div>

        <div className="dashboard-section">
          <h2>Recent Orders</h2>
          {recentOrders.length === 0 ? (
            <p>No orders yet</p>
          ) : (
            <div className="orders-table">
              <table>
                <thead>
                  <tr>
                    <th>Order ID</th>
                    <th>Restaurant</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Date</th>
                  </tr>
                </thead>
                <tbody>
                  {recentOrders.map((order) => (
                    <tr key={order.order_id}>
                      <td>#{order.order_id}</td>
                      <td>{order.restaurant_name}</td>
                      <td>₹{order.total_amount}</td>
                      <td>
                        <span className={`status ${order.status}`}>
                          {order.status}
                        </span>
                      </td>
                      <td>{new Date(order.created_at).toLocaleDateString()}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        <div className="dashboard-section">
          <h2>Quick Actions</h2>
          <div className="action-buttons">
            <Link to="/restaurants" className="button">
              Manage Restaurants
            </Link>
            <Link to="/orders" className="button">
              View All Orders
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminDashboard;
