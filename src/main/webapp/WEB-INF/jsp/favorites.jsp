<%@ page import="com.eat.model.Favorite" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% List<Favorite> favorites = (List<Favorite>) request.getAttribute("favorites"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>My Favourites</h2>
            <p>Your saved restaurants and food items</p>
        </div>

        <% if (favorites == null || favorites.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                    </svg>
                </div>
                <h3>No favourites yet</h3>
                <p>Start adding restaurants and food items to your favourites!</p>
                <a href="<%= request.getContextPath() %>/home" class="btn btn-primary">Browse Restaurants</a>
            </div>
        <% } else { %>
            <div class="grid grid-3">
                <% for (Favorite fav : favorites) { %>
                <div class="card">
                    <div class="card-body">
                        <% if (fav.getRestaurantId() > 0) { %>
                            <div style="display: flex; justify-content: space-between; align-items: flex-start;">
                                <div>
                                    <span class="badge badge-trending" style="margin-bottom: var(--spacing-sm);">Restaurant</span>
                                    <h4><%= fav.getRestaurantName() != null ? fav.getRestaurantName() : "Restaurant #" + fav.getRestaurantId() %></h4>
                                </div>
                            </div>
                            <div class="mt-3" style="display: flex; gap: var(--spacing-sm);">
                                <a href="<%= request.getContextPath() %>/restaurant?id=<%= fav.getRestaurantId() %>"
                                   class="btn btn-outline btn-sm">View Restaurant</a>
                                <form action="<%= request.getContextPath() %>/favorites" method="POST" style="display: inline;">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="restaurantId" value="<%= fav.getRestaurantId() %>">
                                    <button type="submit" class="btn btn-ghost btn-sm">Remove</button>
                                </form>
                            </div>
                        <% } else if (fav.getFoodItemId() > 0) { %>
                            <div style="display: flex; justify-content: space-between; align-items: flex-start;">
                                <div>
                                    <span class="badge badge-vegetarian" style="margin-bottom: var(--spacing-sm);">Food Item</span>
                                    <h4><%= fav.getFoodItemName() != null ? fav.getFoodItemName() : "Food Item #" + fav.getFoodItemId() %></h4>
                                </div>
                            </div>
                            <div class="mt-3">
                                <form action="<%= request.getContextPath() %>/favorites" method="POST" style="display: inline;">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="foodItemId" value="<%= fav.getFoodItemId() %>">
                                    <button type="submit" class="btn btn-ghost btn-sm">Remove</button>
                                </form>
                            </div>
                        <% } %>
                    </div>
                </div>
                <% } %>
            </div>
        <% } %>
    </div>
</section>

<%@ include file="footer.jsp" %>
