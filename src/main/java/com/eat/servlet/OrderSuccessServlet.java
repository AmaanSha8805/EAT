package com.eat.servlet;

import com.eat.model.Order;
import com.eat.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/order-success")
public class OrderSuccessServlet extends HttpServlet {
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
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        
        int orderId = Integer.parseInt(orderIdStr);
        Order order = orderService.getOrderById(orderId);
        
        if (order == null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        
        request.setAttribute("order", order);
        request.getRequestDispatcher("/WEB-INF/jsp/order-success.jsp").forward(request, response);
    }
}
