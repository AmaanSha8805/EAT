package com.eat.dao;

import com.eat.model.Order;
import com.eat.model.OrderItem;
import com.eat.model.CartItem;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    /**
     * Create order and all order items in a single transaction.
     * Returns true if the full order (header + items) was committed.
     * On any failure the transaction is rolled back and the cart is preserved.
     */
    public boolean createOrderWithItems(Order order, List<CartItem> cartItems) {
        String orderSql = "INSERT INTO orders (user_id, restaurant_id, total_amount, status, payment_method, " +
                     "payment_status, delivery_address, delivery_phone, special_instructions, guest_name) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String itemSql = "INSERT INTO order_items (order_id, food_id, quantity, price_at_order, subtotal) " +
                     "VALUES (?, ?, ?, ?, ?)";

        Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);

            // Insert order header
            try (PreparedStatement stmt = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                if (order.getUserId() != null) {
                    stmt.setInt(1, order.getUserId());
                } else {
                    stmt.setNull(1, Types.INTEGER);
                }
                stmt.setInt(2, order.getRestaurantId());
                stmt.setDouble(3, order.getTotalAmount());
                stmt.setString(4, order.getStatus());
                stmt.setString(5, order.getPaymentMethod());
                stmt.setString(6, order.getPaymentStatus());
                stmt.setString(7, order.getDeliveryAddress());
                stmt.setString(8, order.getDeliveryPhone());
                stmt.setString(9, order.getSpecialInstructions());
                stmt.setString(10, order.getGuestName());

                int rows = stmt.executeUpdate();
                if (rows == 0) {
                    conn.rollback();
                    return false;
                }
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        order.setOrderId(rs.getInt(1));
                    } else {
                        conn.rollback();
                        return false;
                    }
                }
            }

            // Insert all order items
            try (PreparedStatement stmt = conn.prepareStatement(itemSql)) {
                for (CartItem cartItem : cartItems) {
                    stmt.setInt(1, order.getOrderId());
                    stmt.setInt(2, cartItem.getFoodId());
                    stmt.setInt(3, cartItem.getQuantity());
                    stmt.setDouble(4, cartItem.getPrice());
                    stmt.setDouble(5, cartItem.getSubtotal());
                    stmt.addBatch();
                }
                int[] results = stmt.executeBatch();
                for (int r : results) {
                    if (r == Statement.EXECUTE_FAILED) {
                        conn.rollback();
                        return false;
                    }
                }
            }

            conn.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            return false;
        } finally {
            if (conn != null) {
                try { conn.setAutoCommit(true); } catch (SQLException e) { e.printStackTrace(); }
                DatabaseUtil.closeConnection(conn);
            }
        }
    }

    // Legacy method kept for backward compatibility
    public boolean create(Order order) {
        String sql = "INSERT INTO orders (user_id, restaurant_id, total_amount, status, payment_method, " +
                     "payment_status, delivery_address, delivery_phone, special_instructions, guest_name) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            if (order.getUserId() != null) {
                stmt.setInt(1, order.getUserId());
            } else {
                stmt.setNull(1, Types.INTEGER);
            }
            stmt.setInt(2, order.getRestaurantId());
            stmt.setDouble(3, order.getTotalAmount());
            stmt.setString(4, order.getStatus());
            stmt.setString(5, order.getPaymentMethod());
            stmt.setString(6, order.getPaymentStatus());
            stmt.setString(7, order.getDeliveryAddress());
            stmt.setString(8, order.getDeliveryPhone());
            stmt.setString(9, order.getSpecialInstructions());
            stmt.setString(10, order.getGuestName());
            
            int rows = stmt.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        order.setOrderId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean createOrderItem(OrderItem orderItem) {
        String sql = "INSERT INTO order_items (order_id, food_id, quantity, price_at_order, subtotal) " +
                     "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, orderItem.getOrderId());
            stmt.setInt(2, orderItem.getFoodId());
            stmt.setInt(3, orderItem.getQuantity());
            stmt.setDouble(4, orderItem.getPriceAtOrder());
            stmt.setDouble(5, orderItem.getSubtotal());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Order findById(int orderId) {
        // LEFT JOIN users to handle guest orders (user_id = NULL)
        String sql = "SELECT o.*, r.name as restaurant_name, " +
                     "COALESCE(u.full_name, o.guest_name, 'Guest') as user_name " +
                     "FROM orders o " +
                     "JOIN restaurants r ON o.restaurant_id = r.restaurant_id " +
                     "LEFT JOIN users u ON o.user_id = u.user_id " +
                     "WHERE o.order_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Order order = extractOrder(rs);
                order.setRestaurantName(rs.getString("restaurant_name"));
                order.setUserName(rs.getString("user_name"));
                order.setOrderItems(findOrderItemsByOrderId(orderId));
                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Order> findByUserId(int userId) {
        String sql = "SELECT o.*, r.name as restaurant_name, " +
                     "COALESCE(u.full_name, o.guest_name, 'Guest') as user_name " +
                     "FROM orders o " +
                     "JOIN restaurants r ON o.restaurant_id = r.restaurant_id " +
                     "LEFT JOIN users u ON o.user_id = u.user_id " +
                     "WHERE o.user_id = ? ORDER BY o.created_at DESC";
        List<Order> orders = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = extractOrder(rs);
                order.setRestaurantName(rs.getString("restaurant_name"));
                order.setUserName(rs.getString("user_name"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> findAll() {
        String sql = "SELECT o.*, r.name as restaurant_name, " +
                     "COALESCE(u.full_name, o.guest_name, 'Guest') as user_name " +
                     "FROM orders o " +
                     "JOIN restaurants r ON o.restaurant_id = r.restaurant_id " +
                     "LEFT JOIN users u ON o.user_id = u.user_id " +
                     "ORDER BY o.created_at DESC";
        List<Order> orders = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = extractOrder(rs);
                order.setRestaurantName(rs.getString("restaurant_name"));
                order.setUserName(rs.getString("user_name"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> findByStatus(String status) {
        String sql = "SELECT o.*, r.name as restaurant_name, " +
                     "COALESCE(u.full_name, o.guest_name, 'Guest') as user_name " +
                     "FROM orders o " +
                     "JOIN restaurants r ON o.restaurant_id = r.restaurant_id " +
                     "LEFT JOIN users u ON o.user_id = u.user_id " +
                     "WHERE o.status = ? ORDER BY o.created_at DESC";
        List<Order> orders = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = extractOrder(rs);
                order.setRestaurantName(rs.getString("restaurant_name"));
                order.setUserName(rs.getString("user_name"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public boolean updateStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            stmt.setInt(2, orderId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePaymentStatus(int orderId, String paymentStatus) {
        String sql = "UPDATE orders SET payment_status = ? WHERE order_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, paymentStatus);
            stmt.setInt(2, orderId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private List<OrderItem> findOrderItemsByOrderId(int orderId) {
        String sql = "SELECT oi.*, fi.name as food_name, fi.image_url as food_image_url " +
                     "FROM order_items oi " +
                     "JOIN food_items fi ON oi.food_id = fi.food_id " +
                     "WHERE oi.order_id = ?";
        List<OrderItem> orderItems = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                OrderItem orderItem = extractOrderItem(rs);
                orderItem.setFoodName(rs.getString("food_name"));
                orderItem.setFoodImageUrl(rs.getString("food_image_url"));
                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }

    private Order extractOrder(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setOrderId(rs.getInt("order_id"));
        int uid = rs.getInt("user_id");
        order.setUserId(rs.wasNull() ? null : uid);
        order.setRestaurantId(rs.getInt("restaurant_id"));
        order.setTotalAmount(rs.getDouble("total_amount"));
        order.setStatus(rs.getString("status"));
        order.setPaymentMethod(rs.getString("payment_method"));
        order.setPaymentStatus(rs.getString("payment_status"));
        order.setDeliveryAddress(rs.getString("delivery_address"));
        order.setDeliveryPhone(rs.getString("delivery_phone"));
        order.setSpecialInstructions(rs.getString("special_instructions"));
        order.setGuestName(rs.getString("guest_name"));
        order.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        order.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        return order;
    }

    private OrderItem extractOrderItem(ResultSet rs) throws SQLException {
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderItemId(rs.getInt("order_item_id"));
        orderItem.setOrderId(rs.getInt("order_id"));
        orderItem.setFoodId(rs.getInt("food_id"));
        orderItem.setQuantity(rs.getInt("quantity"));
        orderItem.setPriceAtOrder(rs.getDouble("price_at_order"));
        orderItem.setSubtotal(rs.getDouble("subtotal"));
        return orderItem;
    }
}
