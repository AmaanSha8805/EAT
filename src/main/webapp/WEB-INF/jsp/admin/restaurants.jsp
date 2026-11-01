<%@ page import="com.eat.model.Restaurant" %>
<%@ page import="java.util.List" %>
<%@ include file="../header.jsp" %>

<% List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants"); %>

<section class="section">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Manage Restaurants</h2>
            <a href="<%= request.getContextPath() %>/admin/restaurants?action=add" class="btn btn-primary">Add Restaurant</a>
        </div>
        
        <div class="card">
            <table class="table">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Cuisine</th>
                        <th>Rating</th>
                        <th>Price Range</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (restaurants != null && !restaurants.isEmpty()) {
                           for (Restaurant restaurant : restaurants) { %>
                    <tr>
                        <td>
                            <img src="<%= restaurant.getImageUrl() != null && !restaurant.getImageUrl().isEmpty() ? restaurant.getImageUrl() : "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&q=80" %>"
                                 alt="<%= restaurant.getName() %>"
                                 style="width: 60px; height: 60px; object-fit: cover; border-radius: var(--radius-sm);"
                                 loading="lazy"
                                 onerror="this.src='https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&q=80'">
                        </td>
                        <td><%= restaurant.getRestaurantId() %></td>
                        <td><%= restaurant.getName() %></td>
                        <td><%= restaurant.getCuisineType() %></td>
                        <td><%= String.format("%.1f", restaurant.getRating()) %></td>
                        <td><%= restaurant.getPriceRange() %></td>
                        <td>
                            <% if (restaurant.isActive()) { %>
                                <span class="badge badge-success" style="background-color: var(--success); color: white;">Active</span>
                            <% } else { %>
                                <span class="badge badge-danger" style="background-color: var(--danger); color: white;">Inactive</span>
                            <% } %>
                        </td>
                        <td>
                            <a href="<%= request.getContextPath() %>/admin/food?restaurantId=<%= restaurant.getRestaurantId() %>" 
                               class="btn btn-outline btn-sm">Menu</a>
                            <a href="<%= request.getContextPath() %>/admin/restaurants?action=edit&id=<%= restaurant.getRestaurantId() %>" 
                               class="btn btn-outline btn-sm">Edit</a>
                            <form action="<%= request.getContextPath() %>/admin/restaurants/delete" method="POST" 
                                  style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this restaurant?');">
                                <input type="hidden" name="id" value="<%= restaurant.getRestaurantId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="8" class="text-center">No restaurants found</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
