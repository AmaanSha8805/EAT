package com.eat.service;

import com.eat.dao.FoodItemDAO;
import com.eat.model.FoodItem;

import java.util.List;

public class FoodItemService {
    private FoodItemDAO foodItemDAO;

    public FoodItemService() {
        this.foodItemDAO = new FoodItemDAO();
    }

    public FoodItem getFoodItemById(int foodId) {
        return foodItemDAO.findById(foodId);
    }

    public List<FoodItem> getFoodItemsByRestaurant(int restaurantId) {
        return foodItemDAO.findByRestaurant(restaurantId);
    }

    public List<FoodItem> getAllFoodItemsByRestaurant(int restaurantId) {
        return foodItemDAO.findAllIncludingUnavailable(restaurantId);
    }

    public List<FoodItem> getTrendingFoodItems() {
        return foodItemDAO.findTrending();
    }

    public List<FoodItem> getAllFoodItems() {
        return foodItemDAO.findAll();
    }

    public List<FoodItem> getFoodItemsByCategory(String categoryName, int limit) {
        return foodItemDAO.findByCategory(categoryName, limit);
    }

    public List<FoodItem> getAllFoodItemsByCategory(String categoryName) {
        return foodItemDAO.findAllByCategory(categoryName);
    }

    public List<FoodItem> getFoodItemsByCollection(String collectionType, int limit) {
        return foodItemDAO.findByCollection(collectionType, limit);
    }

    public List<FoodItem> getAllFoodItemsByCollection(String collectionType) {
        return foodItemDAO.findAllByCollection(collectionType);
    }

    public boolean createFoodItem(FoodItem foodItem) {
        return foodItemDAO.create(foodItem);
    }

    public boolean updateFoodItem(FoodItem foodItem) {
        return foodItemDAO.update(foodItem);
    }

    public boolean deleteFoodItem(int foodId) {
        return foodItemDAO.delete(foodId);
    }
}
