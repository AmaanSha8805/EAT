package com.eat.servlet;

import com.eat.model.*;
import com.eat.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        
        double total = cart.stream().mapToDouble(CartItem::getSubtotal).sum();
        
        request.setAttribute("cart", cart);
        request.setAttribute("total", total);
        request.setAttribute("user", user);
        
        request.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // For guest checkout, user may be null. Use nullable userId.
        int userId = (user != null) ? user.getUserId() : -1; // -1 indicates guest; will be stored as NULL
        // Adjust order creation below accordingly.

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        
        String guestName = request.getParameter("guestName");
        String deliveryAddress = request.getParameter("deliveryAddress");
        String deliveryPhone = request.getParameter("deliveryPhone");
        String specialInstructions = request.getParameter("specialInstructions");
        String paymentMethod = request.getParameter("paymentMethod");
        
        if (user == null && (guestName == null || guestName.trim().isEmpty())) {
            request.setAttribute("error", "Please enter your name");
            request.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
            return;
        }
        
        if (deliveryAddress == null || deliveryAddress.trim().isEmpty() ||
            deliveryPhone == null || deliveryPhone.trim().isEmpty()) {
            request.setAttribute("error", "Please fill in all required fields");
            request.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
            return;
        }
        
        double total = cart.stream().mapToDouble(CartItem::getSubtotal).sum();
        
        Order order = new Order();
        // Set userId only if logged in; otherwise leave null for guest.
        order.setUserId(user != null ? user.getUserId() : null);
        order.setGuestName(user != null ? null : guestName);
        order.setRestaurantId(cart.get(0).getRestaurantId());
        order.setTotalAmount(total);
        order.setStatus("placed");
        order.setPaymentMethod(paymentMethod);
        order.setPaymentStatus("cod".equals(paymentMethod) ? "pending" : "paid");
        order.setDeliveryAddress(deliveryAddress);
        order.setDeliveryPhone(deliveryPhone);
        order.setSpecialInstructions(specialInstructions);
        
        if (orderService.createOrder(order, cart)) {
            session.removeAttribute("cart");
            session.setAttribute("cartCount", 0);
            response.sendRedirect(request.getContextPath() + "/order-success?id=" + order.getOrderId());
        } else {
            request.setAttribute("error", "Failed to place order. Please try again.");
            request.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
        }
    }
}
