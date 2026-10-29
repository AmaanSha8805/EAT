<%@ page import="com.eat.model.Order, com.eat.model.OrderItem" %>
<%@ page import="java.util.List" %>
<%@ include file="../header.jsp" %>

<% Order order = (Order) request.getAttribute("order"); %>
<% List<OrderItem> orderItems = order.getOrderItems(); %>

<section class="section">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Order Details #<%= order.getOrderId() %></h2>
            <a href="<%= request.getContextPath() %>/admin/orders" class="btn btn-outline">Back to Orders</a>
        </div>
        
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
                        <h3>Order Information</h3>
                        <p><strong>Customer:</strong> <%= order.getUserName() %></p>
                        <p><strong>Restaurant:</strong> <%= order.getRestaurantName() %></p>
                        <p><strong>Status:</strong> 
                            <span class="badge <%= "cancelled".equals(order.getStatus()) ? "badge-danger" : "badge-trending" %>">
                                <%= order.getDisplayStatus() %>
                            </span>
                        </p>
                        <p><strong>Payment Method:</strong> <%= order.getPaymentMethod().toUpperCase() %></p>
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
                
                <div class="card mt-3">
                    <div class="card-body">
                        <h3>Update Status</h3>
                        <form action="<%= request.getContextPath() %>/admin/order-details" method="POST">
                            <input type="hidden" name="action" value="updateStatus">
                            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                            <div class="form-group">
                                <label class="form-label">Order Status</label>
                                <select name="status" class="form-control">
                                    <option value="placed" <%= "placed".equals(order.getStatus()) ? "selected" : "" %>>Placed</option>
                                    <option value="confirmed" <%= "confirmed".equals(order.getStatus()) ? "selected" : "" %>>Confirmed</option>
                                    <option value="preparing" <%= "preparing".equals(order.getStatus()) ? "selected" : "" %>>Preparing</option>
                                    <option value="out_for_delivery" <%= "out_for_delivery".equals(order.getStatus()) ? "selected" : "" %>>Out for Delivery</option>
                                    <option value="delivered" <%= "delivered".equals(order.getStatus()) ? "selected" : "" %>>Delivered</option>
                                    <option value="cancelled" <%= "cancelled".equals(order.getStatus()) ? "selected" : "" %>>Cancelled</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Update Status</button>
                        </form>
                        
                        <hr>
                        
                        <form action="<%= request.getContextPath() %>/admin/order-details" method="POST">
                            <input type="hidden" name="action" value="updatePayment">
                            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                            <div class="form-group">
                                <label class="form-label">Payment Status</label>
                                <select name="paymentStatus" class="form-control">
                                    <option value="pending" <%= "pending".equals(order.getPaymentStatus()) ? "selected" : "" %>>Pending</option>
                                    <option value="paid" <%= "paid".equals(order.getPaymentStatus()) ? "selected" : "" %>>Paid</option>
                                    <option value="failed" <%= "failed".equals(order.getPaymentStatus()) ? "selected" : "" %>>Failed</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-secondary w-100">Update Payment</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
