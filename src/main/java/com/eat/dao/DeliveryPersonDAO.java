package com.eat.dao;

import com.eat.model.DeliveryPerson;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeliveryPersonDAO {

    public boolean create(DeliveryPerson deliveryPerson) {
        String sql = "INSERT INTO delivery_persons (name, phone, vehicle_number, is_available) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, deliveryPerson.getName());
            stmt.setString(2, deliveryPerson.getPhone());
            stmt.setString(3, deliveryPerson.getVehicleNumber());
            stmt.setBoolean(4, deliveryPerson.isAvailable());
            
            int rows = stmt.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        deliveryPerson.setDeliveryPersonId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public DeliveryPerson findById(int deliveryPersonId) {
        String sql = "SELECT * FROM delivery_persons WHERE delivery_person_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, deliveryPersonId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractDeliveryPerson(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<DeliveryPerson> findAll() {
        String sql = "SELECT * FROM delivery_persons ORDER BY name";
        List<DeliveryPerson> deliveryPersons = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                deliveryPersons.add(extractDeliveryPerson(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deliveryPersons;
    }

    public List<DeliveryPerson> findAvailable() {
        String sql = "SELECT * FROM delivery_persons WHERE is_available = true ORDER BY name";
        List<DeliveryPerson> deliveryPersons = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                deliveryPersons.add(extractDeliveryPerson(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deliveryPersons;
    }

    public boolean update(DeliveryPerson deliveryPerson) {
        String sql = "UPDATE delivery_persons SET name = ?, phone = ?, vehicle_number = ?, is_available = ? WHERE delivery_person_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, deliveryPerson.getName());
            stmt.setString(2, deliveryPerson.getPhone());
            stmt.setString(3, deliveryPerson.getVehicleNumber());
            stmt.setBoolean(4, deliveryPerson.isAvailable());
            stmt.setInt(5, deliveryPerson.getDeliveryPersonId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(int deliveryPersonId) {
        String sql = "DELETE FROM delivery_persons WHERE delivery_person_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, deliveryPersonId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private DeliveryPerson extractDeliveryPerson(ResultSet rs) throws SQLException {
        DeliveryPerson deliveryPerson = new DeliveryPerson();
        deliveryPerson.setDeliveryPersonId(rs.getInt("delivery_person_id"));
        deliveryPerson.setName(rs.getString("name"));
        deliveryPerson.setPhone(rs.getString("phone"));
        deliveryPerson.setVehicleNumber(rs.getString("vehicle_number"));
        deliveryPerson.setAvailable(rs.getBoolean("is_available"));
        deliveryPerson.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        deliveryPerson.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        return deliveryPerson;
    }
}
