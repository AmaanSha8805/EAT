package com.eat.service;

import com.eat.dao.OrderDAO;
import com.eat.model.Order;

import java.util.UUID;

/**
 * Service for handling payment processing
 * For this college project, payments are simulated for demonstration purposes
 * In production, this would integrate with actual payment gateways like Razorpay, Stripe, etc.
 */
public class PaymentService {
    private OrderDAO orderDAO;

    public PaymentService() {
        this.orderDAO = new OrderDAO();
    }

    /**
     * Process payment based on the selected payment method
     * For COD: Mark as pending (pay on delivery)
     * For UPI/Card/Net Banking: Simulate payment processing
     *
     * @param order The order with payment details
     * @return true if payment processing succeeds, false otherwise
     */
    public boolean processPayment(Order order) {
        String paymentMethod = order.getPaymentMethod();

        switch (paymentMethod) {
            case "cod":
                // COD orders are marked as pending payment
                order.setPaymentStatus("pending");
                return true;

            case "upi":
                return processUPIPayment(order);

            case "card":
                return processCardPayment(order);

            case "net_banking":
                return processNetBankingPayment(order);

            default:
                // Legacy 'online' payment method - treat as simulated
                return processSimulatedPayment(order);
        }
    }

    /**
     * Process UPI payment (simulated)
     */
    private boolean processUPIPayment(Order order) {
        // Validate UPI ID
        if (order.getUpiId() == null || order.getUpiId().trim().isEmpty()) {
            return false;
        }

        // Generate a transaction ID
        String transactionId = generateTransactionId("UPI");
        order.setPaymentTransactionId(transactionId);

        // Simulate payment processing (90% success rate for demo)
        boolean success = simulatePaymentSuccess();

        if (success) {
            order.setPaymentStatus("paid");
            order.setPaymentGatewayResponse("{\"status\":\"success\",\"transaction_id\":\"" + transactionId + "\"}");
        } else {
            order.setPaymentStatus("failed");
            order.setPaymentGatewayResponse("{\"status\":\"failed\",\"error\":\"Payment failed\",\"transaction_id\":\"" + transactionId + "\"}");
        }

        return success;
    }

    /**
     * Process card payment (simulated)
     */
    private boolean processCardPayment(Order order) {
        // Validate card details
        if (order.getCardLastFour() == null || order.getCardLastFour().trim().isEmpty()) {
            return false;
        }

        // Generate a transaction ID
        String transactionId = generateTransactionId("CARD");
        order.setPaymentTransactionId(transactionId);

        // Simulate payment processing (90% success rate for demo)
        boolean success = simulatePaymentSuccess();

        if (success) {
            order.setPaymentStatus("paid");
            order.setPaymentGatewayResponse("{\"status\":\"success\",\"transaction_id\":\"" + transactionId + "\"}");
        } else {
            order.setPaymentStatus("failed");
            order.setPaymentGatewayResponse("{\"status\":\"failed\",\"error\":\"Payment declined\",\"transaction_id\":\"" + transactionId + "\"}");
        }

        return success;
    }

    /**
     * Process net banking payment (simulated)
     */
    private boolean processNetBankingPayment(Order order) {
        // Validate bank name
        if (order.getBankName() == null || order.getBankName().trim().isEmpty()) {
            return false;
        }

        // Generate a transaction ID
        String transactionId = generateTransactionId("NB");
        order.setPaymentTransactionId(transactionId);

        // Simulate payment processing (90% success rate for demo)
        boolean success = simulatePaymentSuccess();

        if (success) {
            order.setPaymentStatus("paid");
            order.setPaymentGatewayResponse("{\"status\":\"success\",\"transaction_id\":\"" + transactionId + "\"}");
        } else {
            order.setPaymentStatus("failed");
            order.setPaymentGatewayResponse("{\"status\":\"failed\",\"error\":\"Bank authorization failed\",\"transaction_id\":\"" + transactionId + "\"}");
        }

        return success;
    }

    /**
     * Process simulated payment (for legacy 'online' method)
     */
    private boolean processSimulatedPayment(Order order) {
        // Generate a transaction ID
        String transactionId = generateTransactionId("SIM");
        order.setPaymentTransactionId(transactionId);

        // Simulate payment processing (always success for demo)
        order.setPaymentStatus("paid");
        order.setPaymentGatewayResponse("{\"status\":\"success\",\"transaction_id\":\"" + transactionId + "\"}");

        return true;
    }

    /**
     * Generate a unique transaction ID
     */
    private String generateTransactionId(String prefix) {
        String uuid = UUID.randomUUID().toString().substring(0, 8).toUpperCase();
        return prefix + "_" + System.currentTimeMillis() + "_" + uuid;
    }

    /**
     * Simulate payment success/failure for demo purposes
     * 90% success rate to demonstrate both scenarios
     */
    private boolean simulatePaymentSuccess() {
        // For demonstration, return true 90% of the time
        // In production, this would be replaced with actual payment gateway integration
        return Math.random() < 0.9;
    }

    /**
     * Validate UPI ID format
     */
    public boolean validateUPIId(String upiId) {
        if (upiId == null || upiId.trim().isEmpty()) {
            return false;
        }
        // Basic UPI ID validation: should contain @
        return upiId.contains("@");
    }

    /**
     * Validate card number (basic validation)
     */
    public boolean validateCardNumber(String cardNumber) {
        if (cardNumber == null || cardNumber.trim().isEmpty()) {
            return false;
        }
        // Remove spaces and dashes
        String cleaned = cardNumber.replaceAll("[\\s-]", "");
        // Basic check: should be 13-19 digits
        return cleaned.matches("\\d{13,19}");
    }

    /**
     * Validate CVV
     */
    public boolean validateCVV(String cvv) {
        if (cvv == null || cvv.trim().isEmpty()) {
            return false;
        }
        // CVV should be 3 or 4 digits
        return cvv.matches("\\d{3,4}");
    }

    /**
     * Validate expiry date format (MM/YY)
     */
    public boolean validateExpiryDate(String expiry) {
        if (expiry == null || expiry.trim().isEmpty()) {
            return false;
        }
        // Should match MM/YY format
        return expiry.matches("(0[1-9]|1[0-2])/\\d{2}");
    }
}
