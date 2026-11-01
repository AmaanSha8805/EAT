package com.eat.model;

import java.time.LocalDateTime;
import java.util.List;

public class Order {
    private int orderId;
    private Integer userId; // Nullable for guest checkout
    private int restaurantId;
    private double totalAmount;
    private String status;
    private String paymentMethod;
    private String paymentStatus;
    private String deliveryAddress;
    private String deliveryPhone;
    private String specialInstructions;
    private String guestName; // For guest checkout
    private String upiId; // UPI ID for UPI payments
    private String upiApp; // UPI app used: phonepe, gpay, paytm, other
    private String cardLastFour; // Last 4 digits of card
    private String cardType; // credit or debit
    private String bankName; // Bank name for net banking
    private String paymentTransactionId; // Transaction ID from payment gateway
    private String paymentGatewayResponse; // Full response from payment gateway
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    private List<OrderItem> orderItems;
    private String restaurantName;
    private String userName;

    public Order() {}

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getDeliveryPhone() {
        return deliveryPhone;
    }

    public void setDeliveryPhone(String deliveryPhone) {
        this.deliveryPhone = deliveryPhone;
    }

    public String getSpecialInstructions() {
        return specialInstructions;
    }

    public void setSpecialInstructions(String specialInstructions) {
        this.specialInstructions = specialInstructions;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUpiId() {
        return upiId;
    }

    public void setUpiId(String upiId) {
        this.upiId = upiId;
    }

    public String getUpiApp() {
        return upiApp;
    }

    public void setUpiApp(String upiApp) {
        this.upiApp = upiApp;
    }

    public String getCardLastFour() {
        return cardLastFour;
    }

    public void setCardLastFour(String cardLastFour) {
        this.cardLastFour = cardLastFour;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getPaymentTransactionId() {
        return paymentTransactionId;
    }

    public void setPaymentTransactionId(String paymentTransactionId) {
        this.paymentTransactionId = paymentTransactionId;
    }

    public String getPaymentGatewayResponse() {
        return paymentGatewayResponse;
    }

    public void setPaymentGatewayResponse(String paymentGatewayResponse) {
        this.paymentGatewayResponse = paymentGatewayResponse;
    }

    public boolean canCancel() {
        return "placed".equals(status) || "confirmed".equals(status);
    }

    public String getDisplayStatus() {
        switch (status) {
            case "placed": return "Order Placed";
            case "confirmed": return "Confirmed";
            case "preparing": return "Preparing";
            case "out_for_delivery": return "Out for Delivery";
            case "delivered": return "Delivered";
            case "cancelled": return "Cancelled";
            default: return status;
        }
    }

    public String getDisplayPaymentMethod() {
        switch (paymentMethod) {
            case "cod": return "Cash on Delivery";
            case "upi": return "UPI";
            case "card": return "Card Payment";
            case "net_banking": return "Net Banking";
            case "online": return "Online Payment";
            default: return paymentMethod;
        }
    }

    public String getDisplayPaymentStatus() {
        switch (paymentStatus) {
            case "pending": return "Pending";
            case "paid": return "Paid";
            case "failed": return "Failed";
            default: return paymentStatus;
        }
    }
}
