<%@ page import="com.eat.model.Order" %>
<%@ include file="header.jsp" %>

<% Order order = (Order) request.getAttribute("order"); %>

<style>
.failure-icon {
    font-size: 5rem;
    color: var(--danger);
    margin-bottom: var(--spacing-lg);
}

.failure-card {
    max-width: 500px;
    margin: var(--spacing-xl) auto;
    text-align: center;
}

.error-details {
    background: var(--danger-bg);
    border: 1px solid var(--danger);
    border-radius: var(--radius-md);
    padding: var(--spacing-lg);
    margin: var(--spacing-lg) 0;
    text-align: left;
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
        <div class="card failure-card">
            <div class="card-body">
                <div class="failure-icon">✕</div>
                <h1 class="mt-3">Payment Failed</h1>
                <p class="text-muted">We were unable to process your payment. Please try again with a different payment method.</p>

                <div class="error-details">
                    <h4>Order Details</h4>
                    <p><strong>Order #:</strong> <%= order.getOrderId() %></p>
                    <p><strong>Amount:</strong> ₹<%= order.getTotalAmount() + 30 %></p>
                    <p><strong>Payment Method:</strong> <%= order.getDisplayPaymentMethod() %></p>
                    <p><strong>Transaction ID:</strong> <%= order.getPaymentTransactionId() != null ? order.getPaymentTransactionId() : "N/A" %></p>
                </div>

                <div class="action-buttons">
                    <a href="<%= request.getContextPath() %>/cart" class="btn btn-primary">Try Again</a>
                    <a href="<%= request.getContextPath() %>/home" class="btn btn-outline">Continue Shopping</a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
