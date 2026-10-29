package com.eat.servlet;

import com.eat.model.Order;
import com.eat.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderIdStr = request.getParameter("id");
        if (orderIdStr == null || orderIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/orders");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(orderIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/orders");
            return;
        }

        Order order = orderService.getOrderById(orderId);

        if (order == null) {
            response.sendRedirect(request.getContextPath() + "/orders");
            return;
        }

        request.setAttribute("order", order);
        request.getRequestDispatcher("/WEB-INF/jsp/order-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String orderIdStr = request.getParameter("orderId");

        if (orderIdStr == null || orderIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/orders");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(orderIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/orders");
            return;
        }

        if ("cancel".equals(action)) {
            if (orderService.cancelOrder(orderId)) {
                response.sendRedirect(request.getContextPath() + "/orders?cancelled=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/order-details?id=" + orderId + "&error=cannot_cancel");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/orders");
        }
    }
}
