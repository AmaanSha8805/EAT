package com.eat.servlet;

import com.eat.model.FoodItem;
import com.eat.model.Restaurant;
import com.eat.model.Review;
import com.eat.service.FoodItemService;
import com.eat.service.RestaurantService;
import com.eat.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {
    private RestaurantService restaurantService;
    private FoodItemService foodItemService;
    private ReviewService reviewService;

    @Override
    public void init() {
        restaurantService = new RestaurantService();
        foodItemService = new FoodItemService();
        reviewService = new ReviewService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String restaurantIdStr = request.getParameter("id");
        if (restaurantIdStr == null || restaurantIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        
        int restaurantId = Integer.parseInt(restaurantIdStr);
        Restaurant restaurant = restaurantService.getRestaurantById(restaurantId);
        
        if (restaurant == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        List<FoodItem> foodItems = foodItemService.getFoodItemsByRestaurant(restaurantId);
        List<Review> reviews = reviewService.getReviewsByRestaurant(restaurantId);
        
        request.setAttribute("restaurant", restaurant);
        request.setAttribute("foodItems", foodItems);
        request.setAttribute("reviews", reviews);
        
        request.getRequestDispatcher("/WEB-INF/jsp/restaurant.jsp").forward(request, response);
    }
}
