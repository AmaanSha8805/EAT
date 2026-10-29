package com.eat.servlet.admin;

import com.eat.model.Restaurant;
import com.eat.service.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalTime;
import java.util.List;

@WebServlet("/admin/restaurants")
public class AdminRestaurantServlet extends HttpServlet {
    private RestaurantService restaurantService;

    @Override
    public void init() {
        restaurantService = new RestaurantService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("edit".equals(action)) {
            String restaurantIdStr = request.getParameter("id");
            Restaurant restaurant = restaurantService.getRestaurantById(Integer.parseInt(restaurantIdStr));
            request.setAttribute("restaurant", restaurant);
            request.getRequestDispatcher("/WEB-INF/jsp/admin/restaurant-form.jsp").forward(request, response);
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/jsp/admin/restaurant-form.jsp").forward(request, response);
        } else {
            List<Restaurant> restaurants = restaurantService.getAllRestaurantsIncludingInactive();
            request.setAttribute("restaurants", restaurants);
            request.getRequestDispatcher("/WEB-INF/jsp/admin/restaurants.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String cuisineType = request.getParameter("cuisineType");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String imageUrl = request.getParameter("imageUrl");
        String priceRange = request.getParameter("priceRange");
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        boolean isTrending = Boolean.parseBoolean(request.getParameter("isTrending"));
        boolean isStudentFriendly = Boolean.parseBoolean(request.getParameter("isStudentFriendly"));
        boolean isFamilySpecial = Boolean.parseBoolean(request.getParameter("isFamilySpecial"));
        boolean isCoupleSpecial = Boolean.parseBoolean(request.getParameter("isCoupleSpecial"));
        String openingTimeStr = request.getParameter("openingTime");
        String closingTimeStr = request.getParameter("closingTime");
        
        Restaurant restaurant = new Restaurant();
        restaurant.setName(name);
        restaurant.setDescription(description);
        restaurant.setCuisineType(cuisineType);
        restaurant.setAddress(address);
        restaurant.setPhone(phone);
        restaurant.setEmail(email);
        restaurant.setImageUrl(imageUrl);
        restaurant.setRating(0.0);
        restaurant.setReviewCount(0);
        restaurant.setPriceRange(priceRange);
        restaurant.setActive(isActive);
        restaurant.setTrending(isTrending);
        restaurant.setStudentFriendly(isStudentFriendly);
        restaurant.setFamilySpecial(isFamilySpecial);
        restaurant.setCoupleSpecial(isCoupleSpecial);
        restaurant.setOpeningTime(LocalTime.parse(openingTimeStr));
        restaurant.setClosingTime(LocalTime.parse(closingTimeStr));
        
        if ("update".equals(action)) {
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
            restaurant.setRestaurantId(restaurantId);
            restaurantService.updateRestaurant(restaurant);
        } else {
            restaurantService.createRestaurant(restaurant);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/restaurants");
    }
}

@WebServlet("/admin/restaurants/delete")
class AdminRestaurantDeleteServlet extends HttpServlet {
    private RestaurantService restaurantService;

    @Override
    public void init() {
        restaurantService = new RestaurantService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int restaurantId = Integer.parseInt(request.getParameter("id"));
        restaurantService.deleteRestaurant(restaurantId);
        
        response.sendRedirect(request.getContextPath() + "/admin/restaurants");
    }
}
