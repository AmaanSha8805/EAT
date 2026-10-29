package com.eat.dao;

import com.eat.model.Favorite;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FavoriteDAO {

    public boolean create(Favorite favorite) {
        String sql = "INSERT INTO favorites (user_id, restaurant_id, food_item_id) VALUES (?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, favorite.getUserId());
            if (favorite.getRestaurantId() != null) {
                stmt.setInt(2, favorite.getRestaurantId());
            } else {
                stmt.setNull(2, Types.INTEGER);
            }
            if (favorite.getFoodItemId() != null) {
                stmt.setInt(3, favorite.getFoodItemId());
            } else {
                stmt.setNull(3, Types.INTEGER);
            }

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        favorite.setFavoriteId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Favorite findById(int favoriteId) {
        String sql = "SELECT * FROM favorites WHERE favorite_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, favoriteId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return extractFavorite(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Favorite> findByUserId(int userId) {
        String sql = "SELECT f.*, r.name as restaurant_name, fi.name as food_item_name " +
                     "FROM favorites f " +
                     "LEFT JOIN restaurants r ON f.restaurant_id = r.restaurant_id " +
                     "LEFT JOIN food_items fi ON f.food_item_id = fi.food_id " +
                     "WHERE f.user_id = ? ORDER BY f.created_at DESC";
        List<Favorite> favorites = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Favorite fav = extractFavorite(rs);
                fav.setRestaurantName(rs.getString("restaurant_name"));
                fav.setFoodItemName(rs.getString("food_item_name"));
                favorites.add(fav);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return favorites;
    }

    public boolean isRestaurantFavorite(int userId, int restaurantId) {
        String sql = "SELECT COUNT(*) FROM favorites WHERE user_id = ? AND restaurant_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, restaurantId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isFoodItemFavorite(int userId, int foodItemId) {
        String sql = "SELECT COUNT(*) FROM favorites WHERE user_id = ? AND food_item_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, foodItemId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(int favoriteId) {
        String sql = "DELETE FROM favorites WHERE favorite_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, favoriteId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteByUserAndRestaurant(int userId, int restaurantId) {
        String sql = "DELETE FROM favorites WHERE user_id = ? AND restaurant_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, restaurantId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteByUserAndFoodItem(int userId, int foodItemId) {
        String sql = "DELETE FROM favorites WHERE user_id = ? AND food_item_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, foodItemId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Favorite extractFavorite(ResultSet rs) throws SQLException {
        Favorite favorite = new Favorite();
        favorite.setFavoriteId(rs.getInt("favorite_id"));
        favorite.setUserId(rs.getInt("user_id"));
        int restaurantId = rs.getInt("restaurant_id");
        if (rs.wasNull()) {
            favorite.setRestaurantId(null);
        } else {
            favorite.setRestaurantId(restaurantId);
        }
        int foodItemId = rs.getInt("food_item_id");
        if (rs.wasNull()) {
            favorite.setFoodItemId(null);
        } else {
            favorite.setFoodItemId(foodItemId);
        }
        favorite.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        return favorite;
    }
}
