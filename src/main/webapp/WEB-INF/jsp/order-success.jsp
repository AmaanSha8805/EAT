<%@ page import="com.eat.model.Order" %>
<%@ include file="header.jsp" %>

<% Order order = (Order) request.getAttribute("order"); %>

<section class="section">
    <div class="container">
        <div class="card" style="text-align: center; padding: var(--spacing-xl);">
            <div style="font-size: 4rem; color: var(--success);">✓</div>
            <h1 class="mt-3">Order Placed Successfully!</h1>
            <p class="text-muted">Your order has been received and is being processed.</p>
            
            <div class="card mt-4" style="max-width: 500px; margin: var(--spacing-lg) auto; text-align: left;">
                <div class="card-body">
                    <h3>Order #<%= order.getOrderId() %></h3>
                    <p><strong>Restaurant:</strong> <%= order.getRestaurantName() %></p>
                    <p><strong>Status:</strong> <span class="badge badge-trending"><%= order.getDisplayStatus() %></span></p>
                    <p><strong>Total Amount:</strong> ₹<%= order.getTotalAmount() + 30 %></p>
                    <p><strong>Payment Method:</strong> <%= "cod".equals(order.getPaymentMethod()) ? "Cash on Delivery" : "Online Payment" %></p>
                    <p><strong>Delivery Address:</strong> <%= order.getDeliveryAddress() %></p>
                    <p><strong>Delivery Phone:</strong> <%= order.getDeliveryPhone() %></p>
                    <% if (order.getSpecialInstructions() != null && !order.getSpecialInstructions().isEmpty()) { %>
                        <p><strong>Special Instructions:</strong> <%= order.getSpecialInstructions() %></p>
                    <% } %>
                </div>
            </div>
            
            <div class="mt-4">
                <a href="<%= request.getContextPath() %>/orders" class="btn btn-primary">View My Orders</a>
                <a href="<%= request.getContextPath() %>/home" class="btn btn-outline">Continue Shopping</a>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
