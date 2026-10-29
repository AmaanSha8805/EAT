package com.eat.dao;

import com.eat.model.FoodItem;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodItemDAO {

    public boolean create(FoodItem foodItem) {
        String sql = "INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, " +
                     "is_vegetarian, is_available, is_trending, preparation_time, portion_size, customization_options) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, foodItem.getRestaurantId());
            stmt.setString(2, foodItem.getName());
            stmt.setString(3, foodItem.getDescription());
            stmt.setDouble(4, foodItem.getPrice());
            stmt.setString(5, foodItem.getImageUrl());
            stmt.setString(6, foodItem.getCategory());
            stmt.setBoolean(7, foodItem.isVegetarian());
            stmt.setBoolean(8, foodItem.isAvailable());
            stmt.setBoolean(9, foodItem.isTrending());
            stmt.setInt(10, foodItem.getPreparationTime());
            stmt.setString(11, foodItem.getPortionSize());
            stmt.setString(12, foodItem.getCustomizationOptions());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        foodItem.setFoodId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public FoodItem findById(int foodId) {
        String sql = "SELECT * FROM food_items WHERE food_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, foodId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractFoodItem(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<FoodItem> findByRestaurant(int restaurantId) {
        String sql = "SELECT * FROM food_items WHERE restaurant_id = ? AND is_available = true ORDER BY category, name";
        List<FoodItem> foodItems = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, restaurantId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                foodItems.add(extractFoodItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    public List<FoodItem> findAllIncludingUnavailable(int restaurantId) {
        String sql = "SELECT * FROM food_items WHERE restaurant_id = ? ORDER BY category, name";
        List<FoodItem> foodItems = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, restaurantId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                foodItems.add(extractFoodItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    public List<FoodItem> findTrending() {
        String sql = "SELECT fi.* FROM food_items fi " +
                     "JOIN restaurants r ON fi.restaurant_id = r.restaurant_id " +
                     "WHERE fi.is_trending = true AND fi.is_available = true AND r.is_active = true " +
                     "ORDER BY fi.restaurant_id, fi.category";
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                foodItems.add(extractFoodItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    public List<FoodItem> findAll() {
        String sql = "SELECT fi.* FROM food_items fi " +
                     "JOIN restaurants r ON fi.restaurant_id = r.restaurant_id " +
                     "WHERE fi.is_available = true AND r.is_active = true " +
                     "ORDER BY fi.restaurant_id, fi.category";
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                foodItems.add(extractFoodItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    public List<FoodItem> findByCategory(String categoryName, int limit) {
        String sql = "SELECT fi.* FROM food_items fi " +
                     "JOIN restaurants r ON fi.restaurant_id = r.restaurant_id " +
                     "WHERE fi.category = ? AND fi.is_available = true AND r.is_active = true " +
                     "ORDER BY fi.is_trending DESC LIMIT ?";
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoryName);
            stmt.setInt(2, limit);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                foodItems.add(extractFoodItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    public List<FoodItem> findAllByCategory(String categoryName) {
        String sql = "SELECT fi.* FROM food_items fi " +
                     "JOIN restaurants r ON fi.restaurant_id = r.restaurant_id " +
                     "WHERE fi.category = ? AND fi.is_available = true AND r.is_active = true " +
                     "ORDER BY fi.is_trending DESC, fi.restaurant_id, fi.name";
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoryName);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                foodItems.add(extractFoodItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    public List<FoodItem> findByCollection(String collectionType, int limit) {
        StringBuilder sql = new StringBuilder("SELECT fi.* FROM food_items fi " +
                     "JOIN restaurants r ON fi.restaurant_id = r.restaurant_id " +
                     "WHERE fi.is_available = true AND r.is_active = true ");

        switch (collectionType) {
            case "student_friendly":
                sql.append("AND r.is_student_friendly = true AND fi.price <= 150 ");
                break;
            case "budget_meals":
                sql.append("AND fi.price <= 200 ");
                break;
            case "family_feast":
                sql.append("AND r.is_family_special = true ");
                break;
            case "party_packs":
                sql.append("AND fi.price >= 300 ");
                break;
            case "best_offers":
                sql.append("AND fi.is_trending = true ");
                break;
            case "quick_bites":
                sql.append("AND (fi.category LIKE '%Junk Food%' OR fi.category LIKE '%Burgers%' OR fi.category LIKE '%Rolls%' OR fi.category LIKE '%Sandwiches%' OR fi.category LIKE '%Snacks%') ");
                break;
            default:
                sql.append("AND 1=0 ");
        }

        sql.append("ORDER BY fi.is_trending DESC, fi.price ASC LIMIT ?");

        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            stmt.setInt(1, limit);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                foodItems.add(extractFoodItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    public List<FoodItem> findAllByCollection(String collectionType) {
        StringBuilder sql = new StringBuilder("SELECT fi.* FROM food_items fi " +
                     "JOIN restaurants r ON fi.restaurant_id = r.restaurant_id " +
                     "WHERE fi.is_available = true AND r.is_active = true ");

        switch (collectionType) {
            case "student_friendly":
                sql.append("AND r.is_student_friendly = true AND fi.price <= 150 ");
                break;
            case "budget_meals":
                sql.append("AND fi.price <= 200 ");
                break;
            case "family_feast":
                sql.append("AND r.is_family_special = true ");
                break;
            case "party_packs":
                sql.append("AND fi.price >= 300 ");
                break;
            case "best_offers":
                sql.append("AND fi.is_trending = true ");
                break;
            case "quick_bites":
                sql.append("AND (fi.category LIKE '%Junk Food%' OR fi.category LIKE '%Burgers%' OR fi.category LIKE '%Rolls%' OR fi.category LIKE '%Sandwiches%' OR fi.category LIKE '%Snacks%') ");
                break;
            default:
                sql.append("AND 1=0 ");
        }

        sql.append("ORDER BY fi.is_trending DESC, fi.price ASC");

        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                foodItems.add(extractFoodItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    public List<FoodItem> findWithoutImages(int limit) {
        String sql = "SELECT fi.*, r.cuisine_type FROM food_items fi " +
                     "JOIN restaurants r ON fi.restaurant_id = r.restaurant_id " +
                     "WHERE (fi.image_url IS NULL OR fi.image_url = '' OR fi.image_url = 'null') " +
                     "AND fi.is_available = true " +
                     "ORDER BY fi.food_id " +
                     "LIMIT ?";
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, limit);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                FoodItem foodItem = extractFoodItem(rs);
                // Store cuisine_type temporarily for prompt generation
                foodItem.setCategory(rs.getString("cuisine_type"));
                foodItems.add(foodItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodItems;
    }

    public boolean updateImageUrl(int foodId, String imageUrl) {
        String sql = "UPDATE food_items SET image_url = ? WHERE food_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, imageUrl);
            stmt.setInt(2, foodId);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean update(FoodItem foodItem) {
        String sql = "UPDATE food_items SET name = ?, description = ?, price = ?, image_url = ?, " +
                     "category = ?, is_vegetarian = ?, is_available = ?, is_trending = ?, " +
                     "preparation_time = ?, portion_size = ?, customization_options = ? WHERE food_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, foodItem.getName());
            stmt.setString(2, foodItem.getDescription());
            stmt.setDouble(3, foodItem.getPrice());
            stmt.setString(4, foodItem.getImageUrl());
            stmt.setString(5, foodItem.getCategory());
            stmt.setBoolean(6, foodItem.isVegetarian());
            stmt.setBoolean(7, foodItem.isAvailable());
            stmt.setBoolean(8, foodItem.isTrending());
            stmt.setInt(9, foodItem.getPreparationTime());
            stmt.setString(10, foodItem.getPortionSize());
            stmt.setString(11, foodItem.getCustomizationOptions());
            stmt.setInt(12, foodItem.getFoodId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(int foodId) {
        String sql = "DELETE FROM food_items WHERE food_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, foodId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private FoodItem extractFoodItem(ResultSet rs) throws SQLException {
        FoodItem foodItem = new FoodItem();
        foodItem.setFoodId(rs.getInt("food_id"));
        foodItem.setRestaurantId(rs.getInt("restaurant_id"));
        foodItem.setName(rs.getString("name"));
        foodItem.setDescription(rs.getString("description"));
        foodItem.setPrice(rs.getDouble("price"));
        foodItem.setImageUrl(rs.getString("image_url"));
        foodItem.setCategory(rs.getString("category"));
        foodItem.setVegetarian(rs.getBoolean("is_vegetarian"));
        foodItem.setAvailable(rs.getBoolean("is_available"));
        foodItem.setTrending(rs.getBoolean("is_trending"));
        foodItem.setPreparationTime(rs.getInt("preparation_time"));
        foodItem.setPortionSize(rs.getString("portion_size"));
        foodItem.setCustomizationOptions(rs.getString("customization_options"));
        foodItem.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        foodItem.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        return foodItem;
    }
}
