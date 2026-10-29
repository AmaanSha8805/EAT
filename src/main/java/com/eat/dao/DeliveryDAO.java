package com.eat.dao;

import com.eat.model.Delivery;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDAO {

    public boolean create(Delivery delivery) {
        String sql = "INSERT INTO deliveries (order_id, delivery_person_id, status) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, delivery.getOrderId());
            if (delivery.getDeliveryPersonId() != null) {
                stmt.setInt(2, delivery.getDeliveryPersonId());
            } else {
                stmt.setNull(2, Types.INTEGER);
            }
            stmt.setString(3, delivery.getStatus());
            
            int rows = stmt.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        delivery.setDeliveryId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Delivery findById(int deliveryId) {
        String sql = "SELECT d.*, dp.name as delivery_person_name " +
                     "FROM deliveries d " +
                     "LEFT JOIN delivery_persons dp ON d.delivery_person_id = dp.delivery_person_id " +
                     "WHERE d.delivery_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, deliveryId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Delivery delivery = extractDelivery(rs);
                delivery.setDeliveryPersonName(rs.getString("delivery_person_name"));
                return delivery;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Delivery findByOrderId(int orderId) {
        String sql = "SELECT d.*, dp.name as delivery_person_name " +
                     "FROM deliveries d " +
                     "LEFT JOIN delivery_persons dp ON d.delivery_person_id = dp.delivery_person_id " +
                     "WHERE d.order_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Delivery delivery = extractDelivery(rs);
                delivery.setDeliveryPersonName(rs.getString("delivery_person_name"));
                return delivery;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Delivery> findAll() {
        String sql = "SELECT d.*, dp.name as delivery_person_name " +
                     "FROM deliveries d " +
                     "LEFT JOIN delivery_persons dp ON d.delivery_person_id = dp.delivery_person_id " +
                     "ORDER BY d.assigned_at DESC";
        List<Delivery> deliveries = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Delivery delivery = extractDelivery(rs);
                delivery.setDeliveryPersonName(rs.getString("delivery_person_name"));
                deliveries.add(delivery);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deliveries;
    }

    public boolean assignDeliveryPerson(int deliveryId, int deliveryPersonId) {
        String sql = "UPDATE deliveries SET delivery_person_id = ?, status = 'assigned' WHERE delivery_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, deliveryPersonId);
            stmt.setInt(2, deliveryId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateStatus(int deliveryId, String status) {
        String sql;
        PreparedStatement stmt;
        
        try (Connection conn = DatabaseUtil.getConnection()) {
            
            if ("delivered".equals(status)) {
                sql = "UPDATE deliveries SET status = ?, delivered_at = CURRENT_TIMESTAMP WHERE delivery_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, status);
                stmt.setInt(2, deliveryId);
            } else {
                sql = "UPDATE deliveries SET status = ? WHERE delivery_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, status);
                stmt.setInt(2, deliveryId);
            }
            
            int result = stmt.executeUpdate();
            stmt.close();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Delivery extractDelivery(ResultSet rs) throws SQLException {
        Delivery delivery = new Delivery();
        delivery.setDeliveryId(rs.getInt("delivery_id"));
        delivery.setOrderId(rs.getInt("order_id"));
        int deliveryPersonId = rs.getInt("delivery_person_id");
        if (rs.wasNull()) {
            delivery.setDeliveryPersonId(null);
        } else {
            delivery.setDeliveryPersonId(deliveryPersonId);
        }
        delivery.setStatus(rs.getString("status"));
        delivery.setAssignedAt(rs.getTimestamp("assigned_at").toLocalDateTime());
        Timestamp deliveredAt = rs.getTimestamp("delivered_at");
        if (deliveredAt != null) {
            delivery.setDeliveredAt(deliveredAt.toLocalDateTime());
        }
        return delivery;
    }
}
