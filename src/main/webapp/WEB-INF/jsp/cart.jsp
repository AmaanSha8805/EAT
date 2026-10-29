<%@ page import="com.eat.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% List<CartItem> cart = (List<CartItem>) request.getAttribute("cart"); %>
<% Object totalObj = request.getAttribute("total");
   double total = totalObj != null ? (Double) totalObj : 0.0; %>
<% String cartError = (String) session.getAttribute("cartError");
   if (cartError != null) session.removeAttribute("cartError"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>Your Cart</h2>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <% if (cartError != null) { %>
            <div class="alert alert-danger">
                <%= cartError %>
            </div>
        <% } %>

        <% if (cart == null || cart.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-state-icon">&#128722;</div>
                <h3>Your cart is empty</h3>
                <p>Add some delicious food to get started!</p>
                <a href="<%= request.getContextPath() %>/home" class="btn btn-primary">Browse Restaurants</a>
            </div>
        <% } else { %>
            <div class="row">
                <div class="col-8">
                    <% for (CartItem item : cart) { %>
                    <div class="cart-item" style="background-color: var(--white); border: 1px solid var(--gray-200);">
                        <img src="<%= item.getFoodImageUrl() != null ? item.getFoodImageUrl() : "" %>"
                             alt="<%= item.getFoodName() %>" class="cart-item-image"
                             onerror="this.src='https://via.placeholder.com/80x80?text=Food'">
                        <div class="cart-item-info">
                            <h4 class="cart-item-name"><%= item.getFoodName() %></h4>
                            <p class="text-muted" style="font-size: 0.875rem;"><%= item.getRestaurantName() %></p>
                            <p class="cart-item-price">&#8377;<%= String.format("%.2f", item.getPrice()) %></p>
                            <form action="<%= request.getContextPath() %>/cart" method="POST" class="cart-item-controls">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="foodId" value="<%= item.getFoodId() %>">
                                <button type="submit" name="quantity" value="<%= item.getQuantity() - 1 %>" class="quantity-btn">-</button>
                                <span class="quantity-display"><%= item.getQuantity() %></span>
                                <button type="submit" name="quantity" value="<%= item.getQuantity() + 1 %>" class="quantity-btn">+</button>
                                <button type="button" onclick="document.getElementById('removeForm<%= item.getFoodId() %>').submit()"
                                        class="btn btn-danger btn-sm" style="margin-left: auto;">Remove</button>
                            </form>
                            <form id="removeForm<%= item.getFoodId() %>"
                                  action="<%= request.getContextPath() %>/cart" method="POST" style="display: none;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="foodId" value="<%= item.getFoodId() %>">
                            </form>
                        </div>
                    </div>
                    <% } %>

                    <form action="<%= request.getContextPath() %>/cart" method="POST" class="mt-3">
                        <input type="hidden" name="action" value="clear">
                        <button type="submit" class="btn btn-ghost">Clear Cart</button>
                    </form>
                </div>

                <div class="col-4">
                    <div class="cart-total" style="background-color: var(--white); border: 1px solid var(--gray-200);">
                        <div class="cart-total-row">
                            <span>Subtotal</span>
                            <span>&#8377;<%= String.format("%.2f", total) %></span>
                        </div>
                        <div class="cart-total-row">
                            <span>Delivery Fee</span>
                            <span>&#8377;30</span>
                        </div>
                        <div class="cart-total-row total">
                            <span>Total</span>
                            <span>&#8377;<%= String.format("%.2f", total + 30) %></span>
                        </div>
                        <a href="<%= request.getContextPath() %>/checkout" class="btn btn-primary w-100 mt-3">Proceed to Checkout</a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</section>

<%@ include file="footer.jsp" %>
