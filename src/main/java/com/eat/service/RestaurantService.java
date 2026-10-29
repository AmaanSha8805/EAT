package com.eat.service;

import com.eat.dao.RestaurantDAO;
import com.eat.model.Restaurant;

import java.util.List;

public class RestaurantService {
    private RestaurantDAO restaurantDAO;

    public RestaurantService() {
        this.restaurantDAO = new RestaurantDAO();
    }

    public Restaurant getRestaurantById(int restaurantId) {
        return restaurantDAO.findById(restaurantId);
    }

    public List<Restaurant> getAllRestaurants() {
        return restaurantDAO.findAll();
    }

    public List<Restaurant> getAllRestaurantsIncludingInactive() {
        return restaurantDAO.findAllIncludingInactive();
    }

    public List<Restaurant> getTrendingRestaurants() {
        return restaurantDAO.findTrending();
    }

    public List<Restaurant> getRestaurantsByCategory(int categoryId) {
        return restaurantDAO.findByCategory(categoryId);
    }

    public List<Restaurant> getRestaurantsByBestFor(int bestForId) {
        return restaurantDAO.findByBestFor(bestForId);
    }

    public List<Restaurant> getRestaurantsByBestForWithLimit(int bestForId, int limit) {
        return restaurantDAO.findByBestForWithLimit(bestForId, limit);
    }

    public List<Restaurant> searchRestaurants(String query) {
        if (query == null || query.trim().isEmpty()) {
            return getAllRestaurants();
        }
        return restaurantDAO.search(query);
    }

    public List<Restaurant> getStudentFriendlyRestaurants() {
        return restaurantDAO.findStudentFriendly();
    }

    public List<Restaurant> getFamilySpecialRestaurants() {
        return restaurantDAO.findFamilySpecial();
    }

    public List<Restaurant> getCoupleSpecialRestaurants() {
        return restaurantDAO.findCoupleSpecial();
    }

    public List<Restaurant> getPureVegRestaurants() {
        return restaurantDAO.findPureVeg();
    }

    public List<Restaurant> searchRestaurantsWithFilters(String query, Boolean pureVeg, String cuisine) {
        return restaurantDAO.searchWithFilters(query, pureVeg, cuisine);
    }

    public boolean createRestaurant(Restaurant restaurant) {
        return restaurantDAO.create(restaurant);
    }

    public boolean updateRestaurant(Restaurant restaurant) {
        return restaurantDAO.update(restaurant);
    }

    public boolean deleteRestaurant(int restaurantId) {
        return restaurantDAO.delete(restaurantId);
    }
}
