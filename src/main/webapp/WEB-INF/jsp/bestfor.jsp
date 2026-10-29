<%@ page import="com.eat.model.Restaurant, com.eat.model.BestForCategory" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% BestForCategory bestForCategory = (BestForCategory) request.getAttribute("bestForCategory"); %>
<% List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants"); %>
<% Boolean viewAll = (Boolean) request.getAttribute("viewAll"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2><%= bestForCategory.getName() %></h2>
            <% if (bestForCategory.getDescription() != null && !bestForCategory.getDescription().isEmpty()) { %>
                <p><%= bestForCategory.getDescription() %></p>
            <% } else { %>
                <p>Restaurants perfect for <%= bestForCategory.getName() %></p>
            <% } %>
        </div>

        <% if (restaurants == null || restaurants.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"/>
                        <circle cx="12" cy="12" r="6"/>
                        <circle cx="12" cy="12" r="2"/>
                    </svg>
                </div>
                <h3>No restaurants found</h3>
                <p>No restaurants available for this category at the moment.</p>
            </div>
        <% } else { %>
            <div class="grid grid-3">
                <% for (Restaurant restaurant : restaurants) { %>
                <div class="restaurant-card" onclick="location.href='<%= request.getContextPath() %>/restaurant?id=<%= restaurant.getRestaurantId() %>'">
                    <div class="restaurant-cover">
                        <img src="<%= restaurant.getImageUrl() %>" alt="<%= restaurant.getName() %>" onerror="this.src='https://via.placeholder.com/300x200?text=Image+Not+Available'">
                        <% if (restaurant.isTrending()) { %>
                            <span class="promoted-badge">Trending</span>
                        <% } %>
                    </div>
                    <div class="restaurant-info">
                        <h3 class="restaurant-name"><%= restaurant.getName() %></h3>
                        <p class="restaurant-cuisine"><%= restaurant.getCuisineType() %></p>
                        <div class="restaurant-meta">
                            <span class="rating">★ <%= String.format("%.1f", restaurant.getRating()) %></span>
                            <span class="delivery-info">⏱ <%= restaurant.getEstimatedDeliveryTime() %> mins</span>
                            <span class="price-range">₹<%= restaurant.getPriceRange() %> for two</span>
                        </div>
                        <% if (restaurant.getAddress() != null && !restaurant.getAddress().isEmpty()) { %>
                            <p class="restaurant-location"><%= restaurant.getAddress() %></p>
                        <% } %>
                        <div class="restaurant-badges">
                            <% if (restaurant.isPureVeg()) { %>
                                <span class="pure-veg-badge">Pure Veg</span>
                            <% } %>
                            <% if (restaurant.isStudentFriendly()) { %>
                                <span class="badge badge-student">Student Friendly</span>
                            <% } %>
                            <% if (restaurant.isFamilySpecial()) { %>
                                <span class="badge badge-trending">Family Special</span>
                            <% } %>
                            <% if (restaurant.isCoupleSpecial()) { %>
                                <span class="badge" style="background-color: #E91E63; color: white;">Couple Special</span>
                            <% } %>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>

            <% if (viewAll == null || !viewAll) { %>
                <div class="text-center mt-4">
                    <a href="<%= request.getContextPath() %>/bestfor?id=<%= bestForCategory.getBestForId() %>&viewAll=true" class="btn btn-outline">View More</a>
                </div>
            <% } %>
        <% } %>
    </div>
</section>

<%@ include file="footer.jsp" %>
