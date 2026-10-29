package com.eat.servlet.admin;

import com.eat.dao.UserDAO;
import com.eat.dao.OrderDAO;
import com.eat.dao.RestaurantDAO;
import com.eat.dao.ReviewDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private UserDAO userDAO;
    private OrderDAO orderDAO;
    private RestaurantDAO restaurantDAO;
    private ReviewDAO reviewDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
        orderDAO = new OrderDAO();
        restaurantDAO = new RestaurantDAO();
        reviewDAO = new ReviewDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int totalUsers = userDAO.findAllCustomers().size();
        int totalRestaurants = restaurantDAO.findAllIncludingInactive().size();
        int totalOrders = orderDAO.findAll().size();
        int pendingReviews = reviewDAO.findAllPending().size();
        
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalRestaurants", totalRestaurants);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("pendingReviews", pendingReviews);
        
        request.getRequestDispatcher("/WEB-INF/jsp/admin/dashboard.jsp").forward(request, response);
    }
}
