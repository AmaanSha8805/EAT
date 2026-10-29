package com.eat.dao;

import com.eat.model.Coupon;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO {

    public boolean create(Coupon coupon) {
        String sql = "INSERT INTO coupons (code, description, discount_type, discount_value, minimum_order_amount, " +
                     "max_discount_amount, usage_limit, valid_from, valid_until, is_active) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, coupon.getCode());
            stmt.setString(2, coupon.getDescription());
            stmt.setString(3, coupon.getDiscountType());
            stmt.setDouble(4, coupon.getDiscountValue());
            stmt.setDouble(5, coupon.getMinimumOrderAmount());
            if (coupon.getMaxDiscountAmount() != null) {
                stmt.setDouble(6, coupon.getMaxDiscountAmount());
            } else {
                stmt.setNull(6, Types.NUMERIC);
            }
            if (coupon.getUsageLimit() != null) {
                stmt.setInt(7, coupon.getUsageLimit());
            } else {
                stmt.setNull(7, Types.INTEGER);
            }
            stmt.setTimestamp(8, Timestamp.valueOf(coupon.getValidFrom()));
            stmt.setTimestamp(9, Timestamp.valueOf(coupon.getValidUntil()));
            stmt.setBoolean(10, coupon.isActive());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        coupon.setCouponId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Coupon findById(int couponId) {
        String sql = "SELECT * FROM coupons WHERE coupon_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, couponId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return extractCoupon(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Coupon findByCode(String code) {
        String sql = "SELECT * FROM coupons WHERE code = ? AND is_active = true " +
                     "AND valid_from <= CURRENT_TIMESTAMP AND valid_until >= CURRENT_TIMESTAMP";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, code);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return extractCoupon(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Coupon> findAllActive() {
        String sql = "SELECT * FROM coupons WHERE is_active = true " +
                     "AND valid_from <= CURRENT_TIMESTAMP AND valid_until >= CURRENT_TIMESTAMP " +
                     "ORDER BY created_at DESC";
        List<Coupon> coupons = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                coupons.add(extractCoupon(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coupons;
    }

    public List<Coupon> findAll() {
        String sql = "SELECT * FROM coupons ORDER BY created_at DESC";
        List<Coupon> coupons = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                coupons.add(extractCoupon(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coupons;
    }

    public boolean update(Coupon coupon) {
        String sql = "UPDATE coupons SET code = ?, description = ?, discount_type = ?, discount_value = ?, " +
                     "minimum_order_amount = ?, max_discount_amount = ?, usage_limit = ?, used_count = ?, " +
                     "valid_from = ?, valid_until = ?, is_active = ? WHERE coupon_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, coupon.getCode());
            stmt.setString(2, coupon.getDescription());
            stmt.setString(3, coupon.getDiscountType());
            stmt.setDouble(4, coupon.getDiscountValue());
            stmt.setDouble(5, coupon.getMinimumOrderAmount());
            if (coupon.getMaxDiscountAmount() != null) {
                stmt.setDouble(6, coupon.getMaxDiscountAmount());
            } else {
                stmt.setNull(6, Types.NUMERIC);
            }
            if (coupon.getUsageLimit() != null) {
                stmt.setInt(7, coupon.getUsageLimit());
            } else {
                stmt.setNull(7, Types.INTEGER);
            }
            stmt.setInt(8, coupon.getUsedCount());
            stmt.setTimestamp(9, Timestamp.valueOf(coupon.getValidFrom()));
            stmt.setTimestamp(10, Timestamp.valueOf(coupon.getValidUntil()));
            stmt.setBoolean(11, coupon.isActive());
            stmt.setInt(12, coupon.getCouponId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean incrementUsedCount(int couponId) {
        String sql = "UPDATE coupons SET used_count = used_count + 1 WHERE coupon_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, couponId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(int couponId) {
        String sql = "DELETE FROM coupons WHERE coupon_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, couponId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Coupon extractCoupon(ResultSet rs) throws SQLException {
        Coupon coupon = new Coupon();
        coupon.setCouponId(rs.getInt("coupon_id"));
        coupon.setCode(rs.getString("code"));
        coupon.setDescription(rs.getString("description"));
        coupon.setDiscountType(rs.getString("discount_type"));
        coupon.setDiscountValue(rs.getDouble("discount_value"));
        coupon.setMinimumOrderAmount(rs.getDouble("minimum_order_amount"));
        double maxDiscount = rs.getDouble("max_discount_amount");
        if (rs.wasNull()) {
            coupon.setMaxDiscountAmount(null);
        } else {
            coupon.setMaxDiscountAmount(maxDiscount);
        }
        int usageLimit = rs.getInt("usage_limit");
        if (rs.wasNull()) {
            coupon.setUsageLimit(null);
        } else {
            coupon.setUsageLimit(usageLimit);
        }
        coupon.setUsedCount(rs.getInt("used_count"));
        coupon.setValidFrom(rs.getTimestamp("valid_from").toLocalDateTime());
        coupon.setValidUntil(rs.getTimestamp("valid_until").toLocalDateTime());
        coupon.setActive(rs.getBoolean("is_active"));
        coupon.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        coupon.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        return coupon;
    }
}
