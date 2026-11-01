<%@ page import="com.eat.model.Order" %>
<%@ include file="header.jsp" %>

<% Order order = (Order) request.getAttribute("order"); %>

<style>
.success-icon {
    font-size: 5rem;
    color: var(--success);
    margin-bottom: var(--spacing-lg);
}

.success-card {
    max-width: 500px;
    margin: var(--spacing-xl) auto;
    text-align: center;
}

.order-details {
    background: var(--gray-100);
    border-radius: var(--radius-md);
    padding: var(--spacing-lg);
    margin: var(--spacing-lg) 0;
    text-align: left;
}

.payment-status {
    display: inline-flex;
    align-items: center;
    gap: var(--spacing-sm);
    padding: var(--spacing-sm) var(--spacing-md);
    border-radius: var(--radius-full);
    font-weight: 600;
    font-size: 0.875rem;
}

.payment-status.paid {
    background: var(--success-bg);
    color: var(--success);
}

.payment-status.pending {
    background: var(--warning-bg);
    color: var(--warning);
}

.payment-info {
    background: var(--info-bg);
    border-left: 4px solid var(--info);
    padding: var(--spacing-md);
    margin: var(--spacing-md) 0;
    border-radius: var(--radius-sm);
}

.action-buttons {
    display: flex;
    gap: var(--spacing-md);
    justify-content: center;
    margin-top: var(--spacing-xl);
}
</style>

<section class="section">
    <div class="container">
        <div class="card success-card">
            <div class="card-body">
                <div class="success-icon">✓</div>
                <h1 class="mt-3">Order Placed Successfully!</h1>
                <p class="text-muted">Your order has been received and is being processed.</p>

                <div class="order-details">
                    <h3>Order #<%= order.getOrderId() %></h3>
                    <p><strong>Restaurant:</strong> <%= order.getRestaurantName() %></p>
                    <p><strong>Status:</strong> <span class="badge badge-trending"><%= order.getDisplayStatus() %></span></p>
                    <p><strong>Total Amount:</strong> ₹<%= order.getTotalAmount() + 30 %></p>
                    <p><strong>Payment Method:</strong> <%= order.getDisplayPaymentMethod() %></p>
                    <p><strong>Payment Status:</strong>
                        <span class="payment-status <%= order.getPaymentStatus() %>">
                            <%= order.getDisplayPaymentStatus() %>
                        </span>
                    </p>

                    <% if ("pending".equals(order.getPaymentStatus())) { %>
                        <div class="payment-info">
                            <strong>Pay on Delivery:</strong> Please keep ₹<%= order.getTotalAmount() + 30 %> ready when your order arrives.
                        </div>
                    <% } else if ("paid".equals(order.getPaymentStatus())) { %>
                        <div class="payment-info">
                            <strong>Payment Successful:</strong> Your payment has been processed successfully.
                            <% if (order.getPaymentTransactionId() != null) { %>
                                <br>Transaction ID: <%= order.getPaymentTransactionId() %>
                            <% } %>
                        </div>
                    <% } %>

                    <p><strong>Delivery Address:</strong> <%= order.getDeliveryAddress() %></p>
                    <p><strong>Delivery Phone:</strong> <%= order.getDeliveryPhone() %></p>
                    <% if (order.getSpecialInstructions() != null && !order.getSpecialInstructions().isEmpty()) { %>
                        <p><strong>Special Instructions:</strong> <%= order.getSpecialInstructions() %></p>
                    <% } %>
                </div>

                <div class="action-buttons">
                    <a href="<%= request.getContextPath() %>/orders" class="btn btn-primary">View My Orders</a>
                    <a href="<%= request.getContextPath() %>/home" class="btn btn-outline">Continue Shopping</a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
