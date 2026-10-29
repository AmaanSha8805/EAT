package com.eat.servlet.admin;

import com.eat.model.FoodItem;
import com.eat.service.FoodItemService;
import com.eat.service.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/food")
public class AdminFoodServlet extends HttpServlet {
    private FoodItemService foodItemService;
    private RestaurantService restaurantService;

    @Override
    public void init() {
        foodItemService = new FoodItemService();
        restaurantService = new RestaurantService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        String restaurantIdStr = request.getParameter("restaurantId");
        
        if ("edit".equals(action)) {
            String foodIdStr = request.getParameter("id");
            FoodItem foodItem = foodItemService.getFoodItemById(Integer.parseInt(foodIdStr));
            request.setAttribute("foodItem", foodItem);
            request.setAttribute("restaurantId", foodItem.getRestaurantId());
            request.getRequestDispatcher("/WEB-INF/jsp/admin/food-form.jsp").forward(request, response);
        } else if ("add".equals(action)) {
            int restaurantId = Integer.parseInt(restaurantIdStr);
            request.setAttribute("restaurantId", restaurantId);
            request.getRequestDispatcher("/WEB-INF/jsp/admin/food-form.jsp").forward(request, response);
        } else if (restaurantIdStr != null && !restaurantIdStr.isEmpty()) {
            int restaurantId = Integer.parseInt(restaurantIdStr);
            List<FoodItem> foodItems = foodItemService.getAllFoodItemsByRestaurant(restaurantId);
            request.setAttribute("foodItems", foodItems);
            request.setAttribute("restaurantId", restaurantId);
            request.setAttribute("restaurant", restaurantService.getRestaurantById(restaurantId));
            request.getRequestDispatcher("/WEB-INF/jsp/admin/food-items.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/restaurants");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl");
        String category = request.getParameter("category");
        boolean isVegetarian = Boolean.parseBoolean(request.getParameter("isVegetarian"));
        boolean isAvailable = Boolean.parseBoolean(request.getParameter("isAvailable"));
        boolean isTrending = Boolean.parseBoolean(request.getParameter("isTrending"));
        int preparationTime = Integer.parseInt(request.getParameter("preparationTime"));
        
        FoodItem foodItem = new FoodItem();
        foodItem.setRestaurantId(restaurantId);
        foodItem.setName(name);
        foodItem.setDescription(description);
        foodItem.setPrice(price);
        foodItem.setImageUrl(imageUrl);
        foodItem.setCategory(category);
        foodItem.setVegetarian(isVegetarian);
        foodItem.setAvailable(isAvailable);
        foodItem.setTrending(isTrending);
        foodItem.setPreparationTime(preparationTime);
        
        if ("update".equals(action)) {
            int foodId = Integer.parseInt(request.getParameter("foodId"));
            foodItem.setFoodId(foodId);
            foodItemService.updateFoodItem(foodItem);
        } else {
            foodItemService.createFoodItem(foodItem);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/food?restaurantId=" + restaurantId);
    }
}

@WebServlet("/admin/food/delete")
class AdminFoodDeleteServlet extends HttpServlet {
    private FoodItemService foodItemService;

    @Override
    public void init() {
        foodItemService = new FoodItemService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int foodId = Integer.parseInt(request.getParameter("id"));
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        
        foodItemService.deleteFoodItem(foodId);
        
        response.sendRedirect(request.getContextPath() + "/admin/food?restaurantId=" + restaurantId);
    }
}
