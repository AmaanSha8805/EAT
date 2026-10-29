<%@ page import="com.eat.model.CartItem, com.eat.model.User" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% List<CartItem> cart = (List<CartItem>) request.getAttribute("cart"); %>
<% double total = (Double) request.getAttribute("total"); %>
<% User user = (User) request.getAttribute("user"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>Checkout</h2>
        </div>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <div class="row">
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                        <h3>Delivery Details</h3>
                        <form action="<%= request.getContextPath() %>/checkout" method="POST">
                            <% if (user == null) { %>
                            <div class="form-group">
                                <label class="form-label">Your Name *</label>
                                <input type="text" name="guestName" class="form-control" required placeholder="Enter your name">
                            </div>
                            <% } %>
                            
                            <div class="form-group">
                                <label class="form-label">Delivery Address *</label>
                                <textarea name="deliveryAddress" class="form-control" rows="3" required><%= user != null && user.getAddress() != null ? user.getAddress() : "" %></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">Delivery Phone *</label>
                                <input type="tel" name="deliveryPhone" class="form-control" required value="<%= user != null && user.getPhone() != null ? user.getPhone() : "" %>">
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">Special Instructions (Optional)</label>
                                <textarea name="specialInstructions" class="form-control" rows="2" placeholder="Any special requests..."></textarea>
                            </div>
                            
                            <h3 class="mt-4">Payment Method</h3>
                            <div class="form-group">
                                <label class="form-check">
                                    <input type="radio" name="paymentMethod" value="cod" class="form-check-input" checked>
                                    <span class="form-check-label">Cash on Delivery</span>
                                </label>
                                <label class="form-check">
                                    <input type="radio" name="paymentMethod" value="online" class="form-check-input">
                                    <span class="form-check-label">Online Payment (Simulated)</span>
                                </label>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100 mt-3">Place Order</button>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                        <h3>Order Summary</h3>
                        <% for (CartItem item : cart) { %>
                        <div class="cart-item" style="padding: var(--spacing-sm); margin-bottom: var(--spacing-sm);">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h4 style="font-size: 1rem;"><%= item.getFoodName() %></h4>
                                    <p class="text-muted" style="font-size: 0.875rem;">Qty: <%= item.getQuantity() %></p>
                                </div>
                                <span class="food-price">₹<%= item.getSubtotal() %></span>
                            </div>
                        </div>
                        <% } %>
                        
                        <div class="cart-total-row mt-3">
                            <span>Subtotal</span>
                            <span>₹<%= total %></span>
                        </div>
                        <div class="cart-total-row">
                            <span>Delivery Fee</span>
                            <span>₹30</span>
                        </div>
                        <div class="cart-total-row total">
                            <span>Total</span>
                            <span>₹<%= total + 30 %></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
