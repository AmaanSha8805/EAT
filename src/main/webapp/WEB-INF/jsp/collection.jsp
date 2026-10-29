<%@ page import="com.eat.model.FoodItem" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% String collectionType = (String) request.getAttribute("collectionType"); %>
<% String collectionTitle = (String) request.getAttribute("collectionTitle"); %>
<% String collectionDescription = (String) request.getAttribute("collectionDescription"); %>
<% List<FoodItem> foodItems = (List<FoodItem>) request.getAttribute("foodItems"); %>
<% Boolean viewAll = (Boolean) request.getAttribute("viewAll"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2><%= collectionTitle %></h2>
            <p><%= collectionDescription %></p>
        </div>

        <% if (foodItems == null || foodItems.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M11 9H9a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm8 0h-2a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm-8 8H9a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm8 0h-2a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2z"/>
                    </svg>
                </div>
                <h3>No items found</h3>
                <p>No items available in this collection at the moment.</p>
            </div>
        <% } else { %>
            <div class="grid grid-4">
                <% for (FoodItem food : foodItems) { %>
                <div class="food-card">
                    <img src="<%= food.getImageUrl() %>" alt="<%= food.getName() %>" class="food-image" onerror="this.src='https://via.placeholder.com/300x200?text=Image+Not+Available'">
                    <div class="food-info">
                        <h4 class="food-name"><%= food.getName() %></h4>
                        <% if (food.getCategory() != null && !food.getCategory().isEmpty()) { %>
                            <p class="food-category"><%= food.getCategory() %></p>
                        <% } %>
                        <p class="food-price">₹<%= String.format("%.2f", food.getPrice()) %></p>
                        <div class="food-meta">
                            <% if (food.isTrending()) { %>
                                <span class="badge badge-trending">Trending</span>
                            <% } %>
                            <% if (food.isVegetarian()) { %>
                                <span class="badge badge-vegetarian">Veg</span>
                            <% } %>
                        </div>
                        <form action="<%= request.getContextPath() %>/cart" method="POST" class="mt-2">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="foodId" value="<%= food.getFoodId() %>">
                            <button type="submit" class="btn btn-primary btn-sm w-100">Add to Cart</button>
                        </form>
                    </div>
                </div>
                <% } %>
            </div>

            <% if (viewAll == null || !viewAll) { %>
                <div class="text-center mt-4">
                    <a href="<%= request.getContextPath() %>/collection?type=<%= collectionType %>&viewAll=true" class="btn btn-outline">View More</a>
                </div>
            <% } %>
        <% } %>
    </div>
</section>

<%@ include file="footer.jsp" %>
