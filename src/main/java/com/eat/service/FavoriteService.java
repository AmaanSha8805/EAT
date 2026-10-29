package com.eat.service;

import com.eat.dao.FavoriteDAO;
import com.eat.model.Favorite;

import java.util.List;

public class FavoriteService {
    private FavoriteDAO favoriteDAO;

    public FavoriteService() {
        this.favoriteDAO = new FavoriteDAO();
    }

    public boolean addFavorite(Favorite favorite) {
        return favoriteDAO.create(favorite);
    }

    public Favorite getFavoriteById(int favoriteId) {
        return favoriteDAO.findById(favoriteId);
    }

    public List<Favorite> getUserFavorites(int userId) {
        return favoriteDAO.findByUserId(userId);
    }

    public boolean isRestaurantFavorite(int userId, int restaurantId) {
        return favoriteDAO.isRestaurantFavorite(userId, restaurantId);
    }

    public boolean isFoodItemFavorite(int userId, int foodItemId) {
        return favoriteDAO.isFoodItemFavorite(userId, foodItemId);
    }

    public boolean removeFavorite(int favoriteId) {
        return favoriteDAO.delete(favoriteId);
    }

    public boolean removeRestaurantFavorite(int userId, int restaurantId) {
        return favoriteDAO.deleteByUserAndRestaurant(userId, restaurantId);
    }

    public boolean removeFoodItemFavorite(int userId, int foodItemId) {
        return favoriteDAO.deleteByUserAndFoodItem(userId, foodItemId);
    }
}
