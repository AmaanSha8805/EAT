package com.eat.servlet;

import com.eat.model.Restaurant;
import com.eat.model.BestForCategory;
import com.eat.service.RestaurantService;
import com.eat.service.BestForCategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/bestfor")
public class BestForServlet extends HttpServlet {
    private RestaurantService restaurantService;
    private BestForCategoryService bestForCategoryService;

    @Override
    public void init() {
        restaurantService = new RestaurantService();
        bestForCategoryService = new BestForCategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bestForIdStr = request.getParameter("id");
        String viewAll = request.getParameter("viewAll");

        if (bestForIdStr == null || bestForIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        int bestForId;
        try {
            bestForId = Integer.parseInt(bestForIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        BestForCategory bestForCategory = bestForCategoryService.getBestForCategoryById(bestForId);
        if (bestForCategory == null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        List<Restaurant> restaurants;
        if ("true".equals(viewAll)) {
            restaurants = restaurantService.getRestaurantsByBestFor(bestForId);
            request.setAttribute("viewAll", true);
        } else {
            restaurants = restaurantService.getRestaurantsByBestForWithLimit(bestForId, 4);
        }

        request.setAttribute("bestForCategory", bestForCategory);
        request.setAttribute("restaurants", restaurants);

        request.getRequestDispatcher("/WEB-INF/jsp/bestfor.jsp").forward(request, response);
    }
}
