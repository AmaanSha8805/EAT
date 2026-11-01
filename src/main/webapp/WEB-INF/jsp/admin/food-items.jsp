<%@ page import="com.eat.model.FoodItem, com.eat.model.Restaurant" %>
<%@ page import="java.util.List" %>
<%@ include file="../header.jsp" %>

<% Restaurant restaurant = (Restaurant) request.getAttribute("restaurant"); %>
<% List<FoodItem> foodItems = (List<FoodItem>) request.getAttribute("foodItems"); %>
<% int restaurantId = (Integer) request.getAttribute("restaurantId"); %>

<section class="section">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2>Menu: <%= restaurant.getName() %></h2>
                <p class="text-muted"><%= restaurant.getCuisineType() %></p>
            </div>
            <div>
                <a href="<%= request.getContextPath() %>/admin/restaurants" class="btn btn-outline">Back to Restaurants</a>
                <a href="<%= request.getContextPath() %>/admin/food?action=add&restaurantId=<%= restaurantId %>" 
                   class="btn btn-primary">Add Food Item</a>
            </div>
        </div>
        
        <div class="card">
            <table class="table">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Vegetarian</th>
                        <th>Available</th>
                        <th>Trending</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (foodItems != null && !foodItems.isEmpty()) {
                           for (FoodItem food : foodItems) { %>
                    <tr>
                        <td>
                            <img src="<%= food.getImageUrl() != null && !food.getImageUrl().isEmpty() ? food.getImageUrl() : "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80" %>"
                                 alt="<%= food.getName() %>"
                                 style="width: 60px; height: 60px; object-fit: cover; border-radius: var(--radius-sm);"
                                 loading="lazy"
                                 onerror="this.src='https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80'">
                        </td>
                        <td><%= food.getFoodId() %></td>
                        <td><%= food.getName() %></td>
                        <td><%= food.getCategory() %></td>
                        <td>₹<%= food.getPrice() %></td>
                        <td><%= food.isVegetarian() ? "Yes" : "No" %></td>
                        <td>
                            <% if (food.isAvailable()) { %>
                                <span class="badge badge-success" style="background-color: var(--success); color: white;">Yes</span>
                            <% } else { %>
                                <span class="badge badge-danger" style="background-color: var(--danger); color: white;">No</span>
                            <% } %>
                        </td>
                        <td>
                            <% if (food.isTrending()) { %>
                                <span class="badge badge-trending">Yes</span>
                            <% } else { %>
                                <span class="text-muted">No</span>
                            <% } %>
                        </td>
                        <td>
                            <a href="<%= request.getContextPath() %>/admin/food?action=edit&id=<%= food.getFoodId() %>" 
                               class="btn btn-outline btn-sm">Edit</a>
                            <form action="<%= request.getContextPath() %>/admin/food/delete" method="POST" 
                                  style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this item?');">
                                <input type="hidden" name="id" value="<%= food.getFoodId() %>">
                                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="9" class="text-center">No food items found</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
