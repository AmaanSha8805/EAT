package com.eat.servlet;

import com.eat.model.Favorite;
import com.eat.model.User;
import com.eat.service.FavoriteService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/favorites")
public class FavoriteServlet extends HttpServlet {
    private FavoriteService favoriteService;

    @Override
    public void init() {
        favoriteService = new FavoriteService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        List<Favorite> favorites = favoriteService.getUserFavorites(user.getUserId());

        request.setAttribute("favorites", favorites);
        request.getRequestDispatcher("/WEB-INF/jsp/favorites.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String restaurantIdStr = request.getParameter("restaurantId");
            String foodItemIdStr = request.getParameter("foodItemId");

            Favorite favorite = new Favorite();
            favorite.setUserId(user.getUserId());

            if (restaurantIdStr != null && !restaurantIdStr.isEmpty()) {
                favorite.setRestaurantId(Integer.parseInt(restaurantIdStr));
            }
            if (foodItemIdStr != null && !foodItemIdStr.isEmpty()) {
                favorite.setFoodItemId(Integer.parseInt(foodItemIdStr));
            }

            favoriteService.addFavorite(favorite);

        } else if ("remove".equals(action)) {
            String favoriteIdStr = request.getParameter("favoriteId");
            if (favoriteIdStr != null && !favoriteIdStr.isEmpty()) {
                favoriteService.removeFavorite(Integer.parseInt(favoriteIdStr));
            }

            String restaurantIdStr = request.getParameter("restaurantId");
            String foodItemIdStr = request.getParameter("foodItemId");

            if (restaurantIdStr != null && !restaurantIdStr.isEmpty()) {
                favoriteService.removeRestaurantFavorite(user.getUserId(), Integer.parseInt(restaurantIdStr));
            }
            if (foodItemIdStr != null && !foodItemIdStr.isEmpty()) {
                favoriteService.removeFoodItemFavorite(user.getUserId(), Integer.parseInt(foodItemIdStr));
            }
        }

        String referer = request.getHeader("referer");
        if (referer != null) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect(request.getContextPath() + "/favorites");
        }
    }
}
