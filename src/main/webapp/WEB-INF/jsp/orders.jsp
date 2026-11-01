<%@ page import="com.eat.model.Order" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% List<Order> orders = (List<Order>) request.getAttribute("orders"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>My Orders</h2>
        </div>
        
        <% if ("true".equals(request.getParameter("cancelled"))) { %>
            <div class="alert alert-success">
                Order cancelled successfully.
            </div>
        <% } %>
        
        <% if (orders == null || orders.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/>
                        <polyline points="3.27 6.96 12 12.01 20.73 6.96"/>
                        <line x1="12" y1="22.08" x2="12" y2="12"/>
                    </svg>
                </div>
                <h3>No orders yet</h3>
                <p>Start ordering delicious food!</p>
                <a href="<%= request.getContextPath() %>/home" class="btn btn-primary">Browse Restaurants</a>
            </div>
        <% } else { %>
            <div class="grid grid-2">
                <% for (Order order : orders) { %>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <h4>Order #<%= order.getOrderId() %></h4>
                            <span class="badge <%= "cancelled".equals(order.getStatus()) ? "badge-danger" : "badge-trending" %>">
                                <%= order.getDisplayStatus() %>
                            </span>
                        </div>
                        <p class="text-muted mt-2"><%= order.getRestaurantName() %></p>
                        <p><strong>Total:</strong> ₹<%= order.getTotalAmount() + 30 %></p>
                        <p><strong>Payment:</strong> <%= order.getDisplayPaymentMethod() %>
                            <span class="badge <%= "paid".equals(order.getPaymentStatus()) ? "badge-success" : "badge-warning" %>">
                                <%= order.getDisplayPaymentStatus() %>
                            </span>
                        </p>
                        <p class="text-muted" style="font-size: 0.875rem;">
                            Placed on: <%= order.getCreatedAt().toLocalDate() %>
                        </p>
                        <div class="mt-3">
                            <a href="<%= request.getContextPath() %>/order-details?id=<%= order.getOrderId() %>"
                               class="btn btn-outline btn-sm">View Details</a>
                            <% if (order.canCancel()) { %>
                                <form action="<%= request.getContextPath() %>/order-details" method="POST" style="display: inline;">
                                    <input type="hidden" name="action" value="cancel">
                                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                                    <button type="submit" class="btn btn-danger btn-sm"
                                            onclick="return confirm('Are you sure you want to cancel this order?');">
                                        Cancel Order
                                    </button>
                                </form>
                            <% } %>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        <% } %>
    </div>
</section>

<%@ include file="footer.jsp" %>
