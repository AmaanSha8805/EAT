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
    private PaymentService paymentService;

    @Override
    public void init() {
        orderService = new OrderService();
        paymentService = new PaymentService();
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

        // Payment-specific parameters
        String upiId = request.getParameter("upiId");
        String upiApp = request.getParameter("upiApp");
        String cardNumber = request.getParameter("cardNumber");
        String cardExpiry = request.getParameter("cardExpiry");
        String cardCvv = request.getParameter("cardCvv");
        String cardType = request.getParameter("cardType");
        String bankName = request.getParameter("bankName");

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

        // Validate payment method specific fields
        if ("upi".equals(paymentMethod)) {
            if (upiId == null || upiId.trim().isEmpty() || !paymentService.validateUPIId(upiId)) {
                request.setAttribute("error", "Please enter a valid UPI ID (e.g., mobile@upi)");
                request.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
                return;
            }
        } else if ("card".equals(paymentMethod)) {
            if (cardNumber == null || !paymentService.validateCardNumber(cardNumber) ||
                cardExpiry == null || !paymentService.validateExpiryDate(cardExpiry) ||
                cardCvv == null || !paymentService.validateCVV(cardCvv)) {
                request.setAttribute("error", "Please enter valid card details");
                request.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
                return;
            }
        } else if ("net_banking".equals(paymentMethod)) {
            if (bankName == null || bankName.trim().isEmpty()) {
                request.setAttribute("error", "Please select a bank");
                request.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
                return;
            }
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
        order.setDeliveryAddress(deliveryAddress);
        order.setDeliveryPhone(deliveryPhone);
        order.setSpecialInstructions(specialInstructions);

        // Set payment-specific details
        if ("upi".equals(paymentMethod)) {
            order.setUpiId(upiId);
            order.setUpiApp(upiApp);
        } else if ("card".equals(paymentMethod)) {
            // Store only last 4 digits for security
            String cleanedCardNumber = cardNumber.replaceAll("[\\s-]", "");
            order.setCardLastFour(cleanedCardNumber.substring(cleanedCardNumber.length() - 4));
            order.setCardType(cardType);
        } else if ("net_banking".equals(paymentMethod)) {
            order.setBankName(bankName);
        }

        // Process payment
        boolean paymentProcessed = paymentService.processPayment(order);

        if (!paymentProcessed) {
            request.setAttribute("error", "Payment processing failed. Please try another payment method.");
            request.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
            return;
        }

        // Create order with payment details
        if (orderService.createOrder(order, cart)) {
            session.removeAttribute("cart");
            session.setAttribute("cartCount", 0);

            // If payment failed, redirect to payment failure page
            if ("failed".equals(order.getPaymentStatus())) {
                response.sendRedirect(request.getContextPath() + "/payment-failure?id=" + order.getOrderId());
            } else {
                response.sendRedirect(request.getContextPath() + "/order-success?id=" + order.getOrderId());
            }
        } else {
            request.setAttribute("error", "Failed to place order. Please try again.");
            request.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
        }
    }
}
