package com.eat.dao;

import com.eat.model.Restaurant;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class RestaurantDAO {

    public boolean create(Restaurant restaurant) {
        String sql = "INSERT INTO restaurants (name, description, cuisine_type, address, phone, email, image_url, " +
                     "rating, review_count, price_range, is_active, is_trending, is_student_friendly, " +
                     "is_family_special, is_couple_special, opening_time, closing_time, delivery_fee, " +
                     "minimum_order_amount, estimated_delivery_time, is_pure_veg) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, restaurant.getName());
            stmt.setString(2, restaurant.getDescription());
            stmt.setString(3, restaurant.getCuisineType());
            stmt.setString(4, restaurant.getAddress());
            stmt.setString(5, restaurant.getPhone());
            stmt.setString(6, restaurant.getEmail());
            stmt.setString(7, restaurant.getImageUrl());
            stmt.setDouble(8, restaurant.getRating());
            stmt.setInt(9, restaurant.getReviewCount());
            stmt.setString(10, restaurant.getPriceRange());
            stmt.setBoolean(11, restaurant.isActive());
            stmt.setBoolean(12, restaurant.isTrending());
            stmt.setBoolean(13, restaurant.isStudentFriendly());
            stmt.setBoolean(14, restaurant.isFamilySpecial());
            stmt.setBoolean(15, restaurant.isCoupleSpecial());
            stmt.setTime(16, Time.valueOf(restaurant.getOpeningTime()));
            stmt.setTime(17, Time.valueOf(restaurant.getClosingTime()));
            stmt.setDouble(18, restaurant.getDeliveryFee());
            stmt.setDouble(19, restaurant.getMinimumOrderAmount());
            stmt.setInt(20, restaurant.getEstimatedDeliveryTime());
            stmt.setBoolean(21, restaurant.isPureVeg());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        restaurant.setRestaurantId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Restaurant findById(int restaurantId) {
        String sql = "SELECT * FROM restaurants WHERE restaurant_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, restaurantId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractRestaurant(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Restaurant> findAll() {
        String sql = "SELECT * FROM restaurants WHERE is_active = true ORDER BY rating DESC";
        List<Restaurant> restaurants = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> findAllIncludingInactive() {
        String sql = "SELECT * FROM restaurants ORDER BY restaurant_id";
        List<Restaurant> restaurants = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> findTrending() {
        String sql = "SELECT * FROM restaurants WHERE is_active = true AND is_trending = true ORDER BY rating DESC";
        List<Restaurant> restaurants = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> findByCategory(int categoryId) {
        String sql = "SELECT r.* FROM restaurants r " +
                     "JOIN restaurant_categories rc ON r.restaurant_id = rc.restaurant_id " +
                     "WHERE rc.category_id = ? AND r.is_active = true";
        List<Restaurant> restaurants = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> findByBestFor(int bestForId) {
        String sql = "SELECT r.* FROM restaurants r " +
                     "JOIN restaurant_best_for rb ON r.restaurant_id = rb.restaurant_id " +
                     "WHERE rb.best_for_id = ? AND r.is_active = true";
        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, bestForId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> findByBestForWithLimit(int bestForId, int limit) {
        String sql = "SELECT r.* FROM restaurants r " +
                     "JOIN restaurant_best_for rb ON r.restaurant_id = rb.restaurant_id " +
                     "WHERE rb.best_for_id = ? AND r.is_active = true " +
                     "ORDER BY r.rating DESC LIMIT ?";
        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, bestForId);
            stmt.setInt(2, limit);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> search(String query) {
        String sql = "SELECT * FROM restaurants WHERE is_active = true AND " +
                     "(name LIKE ? OR cuisine_type LIKE ? OR description LIKE ?) ORDER BY rating DESC";
        List<Restaurant> restaurants = new ArrayList<>();
        String searchTerm = "%" + query + "%";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, searchTerm);
            stmt.setString(2, searchTerm);
            stmt.setString(3, searchTerm);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> findStudentFriendly() {
        String sql = "SELECT * FROM restaurants WHERE is_active = true AND is_student_friendly = true ORDER BY rating DESC";
        List<Restaurant> restaurants = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> findFamilySpecial() {
        String sql = "SELECT * FROM restaurants WHERE is_active = true AND is_family_special = true ORDER BY rating DESC";
        List<Restaurant> restaurants = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> findCoupleSpecial() {
        String sql = "SELECT * FROM restaurants WHERE is_active = true AND is_couple_special = true ORDER BY rating DESC";
        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> findPureVeg() {
        String sql = "SELECT * FROM restaurants WHERE is_active = true AND is_pure_veg = true ORDER BY rating DESC";
        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public List<Restaurant> searchWithFilters(String query, Boolean pureVeg, String cuisine) {
        StringBuilder sql = new StringBuilder("SELECT * FROM restaurants WHERE is_active = true");
        List<Object> params = new ArrayList<>();

        if (query != null && !query.trim().isEmpty()) {
            sql.append(" AND (name LIKE ? OR cuisine_type LIKE ? OR description LIKE ?)");
            String searchTerm = "%" + query + "%";
            params.add(searchTerm);
            params.add(searchTerm);
            params.add(searchTerm);
        }

        if (pureVeg != null && pureVeg) {
            sql.append(" AND is_pure_veg = true");
        }

        if (cuisine != null && !cuisine.trim().isEmpty()) {
            sql.append(" AND cuisine_type LIKE ?");
            params.add("%" + cuisine + "%");
        }

        sql.append(" ORDER BY rating DESC");

        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                stmt.setObject(i + 1, params.get(i));
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    public boolean update(Restaurant restaurant) {
        String sql = "UPDATE restaurants SET name = ?, description = ?, cuisine_type = ?, address = ?, " +
                     "phone = ?, email = ?, image_url = ?, rating = ?, review_count = ?, price_range = ?, " +
                     "is_active = ?, is_trending = ?, is_student_friendly = ?, is_family_special = ?, " +
                     "is_couple_special = ?, opening_time = ?, closing_time = ?, delivery_fee = ?, " +
                     "minimum_order_amount = ?, estimated_delivery_time = ?, is_pure_veg = ? WHERE restaurant_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, restaurant.getName());
            stmt.setString(2, restaurant.getDescription());
            stmt.setString(3, restaurant.getCuisineType());
            stmt.setString(4, restaurant.getAddress());
            stmt.setString(5, restaurant.getPhone());
            stmt.setString(6, restaurant.getEmail());
            stmt.setString(7, restaurant.getImageUrl());
            stmt.setDouble(8, restaurant.getRating());
            stmt.setInt(9, restaurant.getReviewCount());
            stmt.setString(10, restaurant.getPriceRange());
            stmt.setBoolean(11, restaurant.isActive());
            stmt.setBoolean(12, restaurant.isTrending());
            stmt.setBoolean(13, restaurant.isStudentFriendly());
            stmt.setBoolean(14, restaurant.isFamilySpecial());
            stmt.setBoolean(15, restaurant.isCoupleSpecial());
            stmt.setTime(16, Time.valueOf(restaurant.getOpeningTime()));
            stmt.setTime(17, Time.valueOf(restaurant.getClosingTime()));
            stmt.setDouble(18, restaurant.getDeliveryFee());
            stmt.setDouble(19, restaurant.getMinimumOrderAmount());
            stmt.setInt(20, restaurant.getEstimatedDeliveryTime());
            stmt.setBoolean(21, restaurant.isPureVeg());
            stmt.setInt(22, restaurant.getRestaurantId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(int restaurantId) {
        String sql = "DELETE FROM restaurants WHERE restaurant_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, restaurantId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Restaurant extractRestaurant(ResultSet rs) throws SQLException {
        Restaurant restaurant = new Restaurant();
        restaurant.setRestaurantId(rs.getInt("restaurant_id"));
        restaurant.setName(rs.getString("name"));
        restaurant.setDescription(rs.getString("description"));
        restaurant.setCuisineType(rs.getString("cuisine_type"));
        restaurant.setAddress(rs.getString("address"));
        restaurant.setPhone(rs.getString("phone"));
        restaurant.setEmail(rs.getString("email"));
        restaurant.setImageUrl(rs.getString("image_url"));
        restaurant.setRating(rs.getDouble("rating"));
        restaurant.setReviewCount(rs.getInt("review_count"));
        restaurant.setPriceRange(rs.getString("price_range"));
        restaurant.setActive(rs.getBoolean("is_active"));
        restaurant.setTrending(rs.getBoolean("is_trending"));
        restaurant.setStudentFriendly(rs.getBoolean("is_student_friendly"));
        restaurant.setFamilySpecial(rs.getBoolean("is_family_special"));
        restaurant.setCoupleSpecial(rs.getBoolean("is_couple_special"));
        restaurant.setOpeningTime(rs.getTime("opening_time").toLocalTime());
        restaurant.setClosingTime(rs.getTime("closing_time").toLocalTime());
        restaurant.setDeliveryFee(rs.getDouble("delivery_fee"));
        restaurant.setMinimumOrderAmount(rs.getDouble("minimum_order_amount"));
        restaurant.setEstimatedDeliveryTime(rs.getInt("estimated_delivery_time"));
        restaurant.setPureVeg(rs.getBoolean("is_pure_veg"));
        restaurant.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        restaurant.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        return restaurant;
    }
}
