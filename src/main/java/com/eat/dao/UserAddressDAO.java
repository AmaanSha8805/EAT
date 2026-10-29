package com.eat.dao;

import com.eat.model.UserAddress;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserAddressDAO {

    public boolean create(UserAddress address) {
        String sql = "INSERT INTO user_addresses (user_id, address_type, address_line1, address_line2, " +
                     "landmark, city, state, pincode, phone, is_default) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, address.getUserId());
            stmt.setString(2, address.getAddressType());
            stmt.setString(3, address.getAddressLine1());
            stmt.setString(4, address.getAddressLine2());
            stmt.setString(5, address.getLandmark());
            stmt.setString(6, address.getCity());
            stmt.setString(7, address.getState());
            stmt.setString(8, address.getPincode());
            stmt.setString(9, address.getPhone());
            stmt.setBoolean(10, address.isDefault());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        address.setAddressId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public UserAddress findById(int addressId) {
        String sql = "SELECT * FROM user_addresses WHERE address_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, addressId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return extractUserAddress(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<UserAddress> findByUserId(int userId) {
        String sql = "SELECT * FROM user_addresses WHERE user_id = ? ORDER BY is_default DESC, created_at DESC";
        List<UserAddress> addresses = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                addresses.add(extractUserAddress(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addresses;
    }

    public UserAddress findDefaultByUserId(int userId) {
        String sql = "SELECT * FROM user_addresses WHERE user_id = ? AND is_default = true";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return extractUserAddress(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean update(UserAddress address) {
        String sql = "UPDATE user_addresses SET address_type = ?, address_line1 = ?, address_line2 = ?, " +
                     "landmark = ?, city = ?, state = ?, pincode = ?, phone = ?, is_default = ? " +
                     "WHERE address_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, address.getAddressType());
            stmt.setString(2, address.getAddressLine1());
            stmt.setString(3, address.getAddressLine2());
            stmt.setString(4, address.getLandmark());
            stmt.setString(5, address.getCity());
            stmt.setString(6, address.getState());
            stmt.setString(7, address.getPincode());
            stmt.setString(8, address.getPhone());
            stmt.setBoolean(9, address.isDefault());
            stmt.setInt(10, address.getAddressId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean setDefault(int userId, int addressId) {
        String sql1 = "UPDATE user_addresses SET is_default = false WHERE user_id = ?";
        String sql2 = "UPDATE user_addresses SET is_default = true WHERE address_id = ? AND user_id = ?";

        try (Connection conn = DatabaseUtil.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement stmt1 = conn.prepareStatement(sql1);
                 PreparedStatement stmt2 = conn.prepareStatement(sql2)) {

                stmt1.setInt(1, userId);
                stmt1.executeUpdate();

                stmt2.setInt(1, addressId);
                stmt2.setInt(2, userId);
                stmt2.executeUpdate();

                conn.commit();
                return true;
            } catch (SQLException e) {
                conn.rollback();
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(int addressId) {
        String sql = "DELETE FROM user_addresses WHERE address_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, addressId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private UserAddress extractUserAddress(ResultSet rs) throws SQLException {
        UserAddress address = new UserAddress();
        address.setAddressId(rs.getInt("address_id"));
        address.setUserId(rs.getInt("user_id"));
        address.setAddressType(rs.getString("address_type"));
        address.setAddressLine1(rs.getString("address_line1"));
        address.setAddressLine2(rs.getString("address_line2"));
        address.setLandmark(rs.getString("landmark"));
        address.setCity(rs.getString("city"));
        address.setState(rs.getString("state"));
        address.setPincode(rs.getString("pincode"));
        address.setPhone(rs.getString("phone"));
        address.setDefault(rs.getBoolean("is_default"));
        address.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        address.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        return address;
    }
}
