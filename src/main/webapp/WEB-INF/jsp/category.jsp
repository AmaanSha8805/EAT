<%@ page import="com.eat.model.FoodItem, com.eat.model.Category" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% Category category = (Category) request.getAttribute("category"); %>
<% List<FoodItem> foodItems = (List<FoodItem>) request.getAttribute("foodItems"); %>
<% Boolean viewAll = (Boolean) request.getAttribute("viewAll"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2><%= category.getName() %></h2>
            <% if (category.getDescription() != null && !category.getDescription().isEmpty()) { %>
                <p><%= category.getDescription() %></p>
            <% } else { %>
                <p>Delicious <%= category.getName() %> dishes from top restaurants</p>
            <% } %>
        </div>

        <% if (foodItems == null || foodItems.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M11 9H9a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm8 0h-2a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm-8 8H9a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm8 0h-2a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2z"/>
                    </svg>
                </div>
                <h3>No food items found</h3>
                <p>No <%= category.getName() %> dishes available at the moment.</p>
            </div>
        <% } else { %>
            <div class="grid grid-4">
                <% for (FoodItem food : foodItems) { %>
                <div class="food-card">
                    <img src="<%= food.getImageUrl() != null && !food.getImageUrl().isEmpty() ? food.getImageUrl() : "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80" %>"
                         alt="<%= food.getName() %>"
                         class="food-image"
                         loading="lazy"
                         onerror="this.src='https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80'">
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
                    <a href="<%= request.getContextPath() %>/category?id=<%= category.getCategoryId() %>&viewAll=true" class="btn btn-outline">View More</a>
                </div>
            <% } %>
        <% } %>
    </div>
</section>

<%@ include file="footer.jsp" %>
