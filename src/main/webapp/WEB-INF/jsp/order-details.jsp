<%@ page import="com.eat.model.Order, com.eat.model.OrderItem" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% Order order = (Order) request.getAttribute("order"); %>
<% List<OrderItem> orderItems = order.getOrderItems(); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>Order Details #<%= order.getOrderId() %></h2>
        </div>
        
        <% if ("cannot_cancel".equals(request.getParameter("error"))) { %>
            <div class="alert alert-danger">
                This order cannot be cancelled at this stage.
            </div>
        <% } %>
        
        <div class="row">
            <div class="col-8">
                <div class="card">
                    <div class="card-body">
                        <h3>Order Items</h3>
                        <% for (OrderItem item : orderItems) { %>
                        <div class="cart-item" style="padding: var(--spacing-sm); margin-bottom: var(--spacing-sm);">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h4 style="font-size: 1rem;"><%= item.getFoodName() %></h4>
                                    <p class="text-muted" style="font-size: 0.875rem;">Qty: <%= item.getQuantity() %> × ₹<%= item.getPriceAtOrder() %></p>
                                </div>
                                <span class="food-price">₹<%= item.getSubtotal() %></span>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            
            <div class="col-4">
                <div class="card">
                    <div class="card-body">
                        <h3>Order Info</h3>
                        <p><strong>Restaurant:</strong> <%= order.getRestaurantName() %></p>
                        <p><strong>Status:</strong> 
                            <span class="badge <%= "cancelled".equals(order.getStatus()) ? "badge-danger" : "badge-trending" %>">
                                <%= order.getDisplayStatus() %>
                            </span>
                        </p>
                        <p><strong>Payment:</strong> <%= "cod".equals(order.getPaymentMethod()) ? "Cash on Delivery" : "Online Payment" %></p>
                        <p><strong>Payment Status:</strong> <%= order.getPaymentStatus().toUpperCase() %></p>
                        <hr>
                        <p><strong>Subtotal:</strong> ₹<%= order.getTotalAmount() %></p>
                        <p><strong>Delivery Fee:</strong> ₹30</p>
                        <p class="food-price" style="font-size: 1.25rem;"><strong>Total:</strong> ₹<%= order.getTotalAmount() + 30 %></p>
                    </div>
                </div>
                
                <div class="card mt-3">
                    <div class="card-body">
                        <h3>Delivery Details</h3>
                        <p><strong>Address:</strong><br><%= order.getDeliveryAddress() %></p>
                        <p><strong>Phone:</strong> <%= order.getDeliveryPhone() %></p>
                        <% if (order.getSpecialInstructions() != null && !order.getSpecialInstructions().isEmpty()) { %>
                            <p><strong>Instructions:</strong><br><%= order.getSpecialInstructions() %></p>
                        <% } %>
                    </div>
                </div>
                
                <% if (order.canCancel()) { %>
                    <form action="<%= request.getContextPath() %>/order-details" method="POST" class="mt-3">
                        <input type="hidden" name="action" value="cancel">
                        <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                        <button type="submit" class="btn btn-danger w-100" 
                                onclick="return confirm('Are you sure you want to cancel this order?');">
                            Cancel Order
                        </button>
                    </form>
                <% } %>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
