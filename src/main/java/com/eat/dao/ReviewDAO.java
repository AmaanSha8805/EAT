package com.eat.dao;

import com.eat.model.Review;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    public boolean create(Review review) {
        String sql = "INSERT INTO reviews (user_id, restaurant_id, food_rating, ambience_rating, " +
                     "service_rating, value_rating, overall_rating, comment, is_approved) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, review.getUserId());
            stmt.setInt(2, review.getRestaurantId());
            stmt.setInt(3, review.getFoodRating());
            stmt.setInt(4, review.getAmbienceRating());
            stmt.setInt(5, review.getServiceRating());
            stmt.setInt(6, review.getValueRating());
            stmt.setDouble(7, review.getOverallRating());
            stmt.setString(8, review.getComment());
            stmt.setBoolean(9, review.isApproved());
            
            int rows = stmt.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        review.setReviewId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Review findById(int reviewId) {
        String sql = "SELECT r.*, u.full_name as user_name, res.name as restaurant_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "JOIN restaurants res ON r.restaurant_id = res.restaurant_id " +
                     "WHERE r.review_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, reviewId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Review review = extractReview(rs);
                review.setUserName(rs.getString("user_name"));
                review.setRestaurantName(rs.getString("restaurant_name"));
                return review;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Review findByUserAndRestaurant(int userId, int restaurantId) {
        String sql = "SELECT * FROM reviews WHERE user_id = ? AND restaurant_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            stmt.setInt(2, restaurantId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractReview(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Review> findByRestaurant(int restaurantId) {
        String sql = "SELECT r.*, u.full_name as user_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "WHERE r.restaurant_id = ? AND r.is_approved = true " +
                     "ORDER BY r.created_at DESC";
        List<Review> reviews = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, restaurantId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Review review = extractReview(rs);
                review.setUserName(rs.getString("user_name"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public List<Review> findAllPending() {
        String sql = "SELECT r.*, u.full_name as user_name, res.name as restaurant_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "JOIN restaurants res ON r.restaurant_id = res.restaurant_id " +
                     "WHERE r.is_approved = false ORDER BY r.created_at DESC";
        List<Review> reviews = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Review review = extractReview(rs);
                review.setUserName(rs.getString("user_name"));
                review.setRestaurantName(rs.getString("restaurant_name"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public List<Review> findAll() {
        String sql = "SELECT r.*, u.full_name as user_name, res.name as restaurant_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "JOIN restaurants res ON r.restaurant_id = res.restaurant_id " +
                     "ORDER BY r.created_at DESC";
        List<Review> reviews = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Review review = extractReview(rs);
                review.setUserName(rs.getString("user_name"));
                review.setRestaurantName(rs.getString("restaurant_name"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public boolean updateApproval(int reviewId, boolean approved) {
        String sql = "UPDATE reviews SET is_approved = ? WHERE review_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setBoolean(1, approved);
            stmt.setInt(2, reviewId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateRestaurantRating(int restaurantId) {
        String sql = "UPDATE restaurants r SET " +
                     "rating = (SELECT AVG(overall_rating) FROM reviews WHERE restaurant_id = r.restaurant_id AND is_approved = true), " +
                     "review_count = (SELECT COUNT(*) FROM reviews WHERE restaurant_id = r.restaurant_id AND is_approved = true) " +
                     "WHERE r.restaurant_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, restaurantId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Review extractReview(ResultSet rs) throws SQLException {
        Review review = new Review();
        review.setReviewId(rs.getInt("review_id"));
        review.setUserId(rs.getInt("user_id"));
        review.setRestaurantId(rs.getInt("restaurant_id"));
        review.setFoodRating(rs.getInt("food_rating"));
        review.setAmbienceRating(rs.getInt("ambience_rating"));
        review.setServiceRating(rs.getInt("service_rating"));
        review.setValueRating(rs.getInt("value_rating"));
        review.setOverallRating(rs.getDouble("overall_rating"));
        review.setComment(rs.getString("comment"));
        review.setApproved(rs.getBoolean("is_approved"));
        review.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        review.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        return review;
    }
}
