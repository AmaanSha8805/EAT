package com.eat.dao;

import com.eat.model.BestForCategory;
import com.eat.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BestForCategoryDAO {

    public List<BestForCategory> findAll() {
        String sql = "SELECT * FROM best_for_categories ORDER BY name";
        List<BestForCategory> categories = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                categories.add(extractBestForCategory(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public BestForCategory findById(int bestForId) {
        String sql = "SELECT * FROM best_for_categories WHERE best_for_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, bestForId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractBestForCategory(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private BestForCategory extractBestForCategory(ResultSet rs) throws SQLException {
        BestForCategory category = new BestForCategory();
        category.setBestForId(rs.getInt("best_for_id"));
        category.setName(rs.getString("name"));
        category.setDescription(rs.getString("description"));
        category.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        return category;
    }
}
