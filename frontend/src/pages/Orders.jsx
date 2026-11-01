import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { orderAPI } from '../services/api';

const Orders = () => {
  const { user } = useAuth();
  const [orders, setOrders] = useState([]);
  const [filteredOrders, setFilteredOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState('all');
  const [searchQuery, setSearchQuery] = useState('');
  const [showDeleteDialog, setShowDeleteDialog] = useState(false);
  const [orderToDelete, setOrderToDelete] = useState(null);
  const [deleteSuccess, setDeleteSuccess] = useState(false);

  useEffect(() => {
    if (user) {
      fetchOrders();
    }
  }, [user]);

  useEffect(() => {
    applyFiltersAndSearch();
  }, [orders, filter, searchQuery]);

  const fetchOrders = async () => {
    try {
      const response = await orderAPI.getByUser();
      setOrders(response.data.orders);
    } catch (error) {
      console.error('Error fetching orders:', error);
    } finally {
      setLoading(false);
    }
  };

  const applyFiltersAndSearch = () => {
    let filtered = [...orders];

    // Apply status filter
    if (filter === 'active') {
      filtered = filtered.filter(order => 
        ['placed', 'confirmed', 'preparing', 'out_for_delivery'].includes(order.status)
      );
    } else if (filter === 'delivered') {
      filtered = filtered.filter(order => order.status === 'delivered');
    } else if (filter === 'cancelled') {
      filtered = filtered.filter(order => order.status === 'cancelled');
    }

    // Apply search
    if (searchQuery.trim()) {
      const query = searchQuery.toLowerCase();
      filtered = filtered.filter(order =>
        order.order_id.toString().includes(query) ||
        order.restaurant_name.toLowerCase().includes(query)
      );
    }

    setFilteredOrders(filtered);
  };

  const handleDeleteClick = (order) => {
    setOrderToDelete(order);
    setShowDeleteDialog(true);
  };

  const handleDeleteConfirm = async () => {
    if (!orderToDelete) return;

    try {
      await orderAPI.delete(orderToDelete.order_id);
      setOrders(orders.filter(o => o.order_id !== orderToDelete.order_id));
      setShowDeleteDialog(false);
      setOrderToDelete(null);
      setDeleteSuccess(true);
      setTimeout(() => setDeleteSuccess(false), 3000);
    } catch (error) {
      console.error('Error deleting order:', error);
      alert(error.response?.data?.message || 'Failed to delete order');
    }
  };

  const handleDeleteCancel = () => {
    setShowDeleteDialog(false);
    setOrderToDelete(null);
  };

  const canDeleteOrder = (order) => {
    return ['delivered', 'cancelled'].includes(order.status);
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

  const getOrderStatusName = (status) => {
    const names = {
      'placed': 'Placed',
      'confirmed': 'Confirmed',
      'preparing': 'Preparing',
      'out_for_delivery': 'Out for Delivery',
      'delivered': 'Delivered',
      'cancelled': 'Cancelled'
    };
    return names[status] || status;
  };

  const getOrderStatusColor = (status) => {
    const colors = {
      'placed': 'warning',
      'confirmed': 'info',
      'preparing': 'primary',
      'out_for_delivery': 'primary',
      'delivered': 'success',
      'cancelled': 'error'
    };
    return colors[status] || 'default';
  };

  if (!user) {
    return (
      <div className="page">
        <div className="container">
          <h1 className="page-title">My Orders</h1>
          <div className="empty-state">
            <div className="empty-cart-icon">🔒</div>
            <h2>Please login to view your orders</h2>
            <Link to="/login" className="button">
              Login
            </Link>
          </div>
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
        <h1 className="page-title">My Orders</h1>

        {/* Filters and Search */}
        <div className="orders-toolbar">
          <div className="order-filters">
            <button
              className={`filter-button ${filter === 'all' ? 'active' : ''}`}
              onClick={() => setFilter('all')}
            >
              All Orders
            </button>
            <button
              className={`filter-button ${filter === 'active' ? 'active' : ''}`}
              onClick={() => setFilter('active')}
            >
              Active
            </button>
            <button
              className={`filter-button ${filter === 'delivered' ? 'active' : ''}`}
              onClick={() => setFilter('delivered')}
            >
              Delivered
            </button>
            <button
              className={`filter-button ${filter === 'cancelled' ? 'active' : ''}`}
              onClick={() => setFilter('cancelled')}
            >
              Cancelled
            </button>
          </div>
          <div className="order-search">
            <input
              type="text"
              placeholder="Search by order ID or restaurant..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="search-input"
            />
          </div>
        </div>

        {deleteSuccess && (
          <div className="success-message toast">
            Order removed successfully
          </div>
        )}

        {filteredOrders.length === 0 ? (
          <div className="empty-state">
            <div className="empty-cart-icon">📦</div>
            <h2>
              {orders.length === 0 ? 'No orders yet' : 'No orders match your criteria'}
            </h2>
            <p>
              {orders.length === 0 
                ? 'Start ordering from your favorite restaurants' 
                : 'Try adjusting your filters or search query'}
            </p>
            {orders.length === 0 && (
              <Link to="/restaurants" className="button">
                Order Now
              </Link>
            )}
          </div>
        ) : (
          <div className="orders-list">
            {filteredOrders.map((order) => (
              <div key={order.order_id} className="order-card">
                <div className="order-card-header">
                  <div className="order-restaurant">
                    <img
                      src={order.restaurant_image || '/placeholder-food.jpg'}
                      alt={order.restaurant_name}
                      className="order-restaurant-image"
                    />
                    <div className="order-restaurant-info">
                      <h3 className="order-restaurant-name">{order.restaurant_name}</h3>
                      <p className="order-id">Order #{order.order_id}</p>
                      <p className="order-date">
                        {new Date(order.created_at).toLocaleDateString('en-US', {
                          year: 'numeric',
                          month: 'short',
                          day: 'numeric',
                          hour: '2-digit',
                          minute: '2-digit'
                        })}
                      </p>
                    </div>
                  </div>
                  <span className={`status-badge status-${getOrderStatusColor(order.status)}`}>
                    {getOrderStatusName(order.status)}
                  </span>
                </div>

                <div className="order-card-body">
                  <div className="order-summary">
                    <div className="order-summary-item">
                      <span className="label">Total Amount</span>
                      <span className="value">₹{parseFloat(order.total_amount).toFixed(2)}</span>
                    </div>
                    <div className="order-summary-item">
                      <span className="label">Payment Method</span>
                      <span className="value">{getPaymentMethodName(order.payment_method)}</span>
                    </div>
                    <div className="order-summary-item">
                      <span className="label">Payment Status</span>
                      <span className={`payment-status-badge ${order.payment_status}`}>
                        {getPaymentStatusName(order.payment_status)}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="order-card-footer">
                  <Link
                    to={`/order/${order.order_id}`}
                    className="order-action-button primary"
                  >
                    View Details
                  </Link>
                  {['confirmed', 'preparing', 'out_for_delivery'].includes(order.status) && (
                    <button className="order-action-button secondary">
                      Track Order
                    </button>
                  )}
                  {canDeleteOrder(order) && (
                    <button
                      onClick={() => handleDeleteClick(order)}
                      className="order-action-button danger"
                    >
                      Remove
                    </button>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Delete Confirmation Dialog */}
      {showDeleteDialog && (
        <div className="modal-overlay">
          <div className="modal">
            <div className="modal-header">
              <h3>Remove Order</h3>
              <button onClick={handleDeleteCancel} className="modal-close">×</button>
            </div>
            <div className="modal-body">
              <p>Are you sure you want to remove this order from your order history?</p>
              <p className="modal-subtext">Order #{orderToDelete?.order_id} from {orderToDelete?.restaurant_name}</p>
            </div>
            <div className="modal-footer">
              <button onClick={handleDeleteCancel} className="button secondary">
                Cancel
              </button>
              <button onClick={handleDeleteConfirm} className="button danger">
                Remove Order
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default Orders;
