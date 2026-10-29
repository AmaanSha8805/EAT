package com.eat.servlet.admin;

import com.eat.model.Order;
import com.eat.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String status = request.getParameter("status");
        List<Order> orders;
        
        if (status != null && !status.isEmpty()) {
            orders = orderService.getOrdersByStatus(status);
            request.setAttribute("selectedStatus", status);
        } else {
            orders = orderService.getAllOrders();
        }
        
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/WEB-INF/jsp/admin/orders.jsp").forward(request, response);
    }
}

@WebServlet("/admin/order-details")
class AdminOrderDetailsServlet extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String orderIdStr = request.getParameter("id");
        int orderId = Integer.parseInt(orderIdStr);
        Order order = orderService.getOrderById(orderId);
        
        request.setAttribute("order", order);
        request.getRequestDispatcher("/WEB-INF/jsp/admin/order-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        String orderIdStr = request.getParameter("orderId");
        int orderId = Integer.parseInt(orderIdStr);
        
        if ("updateStatus".equals(action)) {
            String status = request.getParameter("status");
            orderService.updateOrderStatus(orderId, status);
        } else if ("updatePayment".equals(action)) {
            String paymentStatus = request.getParameter("paymentStatus");
            orderService.updatePaymentStatus(orderId, paymentStatus);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/order-details?id=" + orderId);
    }
}
