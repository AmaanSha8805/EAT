package com.eat.servlet;

import com.eat.model.*;
import com.eat.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private RestaurantService restaurantService;
    private FoodItemService foodItemService;
    private CategoryService categoryService;
    private BestForCategoryService bestForCategoryService;

    @Override
    public void init() {
        restaurantService = new RestaurantService();
        foodItemService = new FoodItemService();
        categoryService = new CategoryService();
        bestForCategoryService = new BestForCategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchQuery = request.getParameter("search");
        String categoryIdStr = request.getParameter("category");
        String bestForIdStr = request.getParameter("bestFor");
        String pureVegStr = request.getParameter("pureVeg");
        String cuisine = request.getParameter("cuisine");
        String viewAllRestaurants = request.getParameter("viewAllRestaurants");
        String viewAllFoodItems = request.getParameter("viewAllFoodItems");

        List<Restaurant> restaurants;
        List<FoodItem> trendingFoodItems;
        List<Restaurant> trendingRestaurants;
        List<Category> categories;
        List<BestForCategory> bestForCategories;

        Boolean pureVeg = pureVegStr != null && pureVegStr.equals("true");

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            restaurants = restaurantService.searchRestaurantsWithFilters(searchQuery, pureVeg, cuisine);
            request.setAttribute("searchQuery", searchQuery);
            if (pureVeg) request.setAttribute("pureVeg", true);
            if (cuisine != null) request.setAttribute("cuisine", cuisine);
        } else if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            int categoryId = Integer.parseInt(categoryIdStr);
            restaurants = restaurantService.getRestaurantsByCategory(categoryId);
            request.setAttribute("selectedCategory", categoryId);
        } else if (bestForIdStr != null && !bestForIdStr.isEmpty()) {
            int bestForId = Integer.parseInt(bestForIdStr);
            restaurants = restaurantService.getRestaurantsByBestFor(bestForId);
            request.setAttribute("selectedBestFor", bestForId);
        } else if ("true".equals(viewAllRestaurants)) {
            restaurants = restaurantService.getAllRestaurants();
            request.setAttribute("viewAllRestaurants", true);
        } else if (pureVeg) {
            restaurants = restaurantService.getPureVegRestaurants();
            request.setAttribute("pureVeg", true);
        } else {
            restaurants = restaurantService.getAllRestaurants();
        }

        trendingRestaurants = restaurantService.getTrendingRestaurants();

        if ("true".equals(viewAllFoodItems)) {
            trendingFoodItems = foodItemService.getAllFoodItems();
            request.setAttribute("viewAllFoodItems", true);
        } else {
            trendingFoodItems = foodItemService.getTrendingFoodItems();
        }

        categories = categoryService.getAllCategories();
        bestForCategories = bestForCategoryService.getAllBestForCategories();

        request.setAttribute("restaurants", restaurants);
        request.setAttribute("trendingRestaurants", trendingRestaurants);
        request.setAttribute("trendingFoodItems", trendingFoodItems);
        request.setAttribute("categories", categories);
        request.setAttribute("bestForCategories", bestForCategories);

        request.getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
    }
}
