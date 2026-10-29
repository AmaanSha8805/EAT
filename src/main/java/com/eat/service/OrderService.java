package com.eat.service;

import com.eat.dao.OrderDAO;
import com.eat.model.CartItem;
import com.eat.model.Order;
import com.eat.model.OrderItem;

import java.util.List;

public class OrderService {
    private OrderDAO orderDAO;

    public OrderService() {
        this.orderDAO = new OrderDAO();
    }

    public Order getOrderById(int orderId) {
        return orderDAO.findById(orderId);
    }

    public List<Order> getOrdersByUserId(int userId) {
        return orderDAO.findByUserId(userId);
    }

    public List<Order> getAllOrders() {
        return orderDAO.findAll();
    }

    public List<Order> getOrdersByStatus(String status) {
        return orderDAO.findByStatus(status);
    }

    /**
     * Create order and all order items in a single database transaction.
     * If any item fails, the entire order is rolled back.
     */
    public boolean createOrder(Order order, List<CartItem> cartItems) {
        return orderDAO.createOrderWithItems(order, cartItems);
    }

    public boolean updateOrderStatus(int orderId, String status) {
        return orderDAO.updateStatus(orderId, status);
    }

    public boolean updatePaymentStatus(int orderId, String paymentStatus) {
        return orderDAO.updatePaymentStatus(orderId, paymentStatus);
    }

    public boolean cancelOrder(int orderId) {
        Order order = getOrderById(orderId);
        if (order != null && order.canCancel()) {
            return updateOrderStatus(orderId, "cancelled");
        }
        return false;
    }
}
