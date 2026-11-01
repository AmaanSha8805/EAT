<%@ page import="com.eat.model.Restaurant, com.eat.model.FoodItem, com.eat.model.Category, com.eat.model.BestForCategory" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<%!
    private String getCategoryImage(String categoryName) {
        if (categoryName == null) return "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80";
        switch (categoryName.toLowerCase()) {
            case "north indian":
                return "https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80";
            case "south indian":
                return "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80";
            case "chinese":
                return "https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&q=80";
            case "italian":
                return "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80";
            case "beverages":
                return "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500&q=80";
            case "desserts":
                return "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80";
            case "fast food":
                return "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80";
            case "healthy":
                return "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&q=80";
            case "bakery":
                return "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&q=80";
            case "continental":
                return "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80";
            default:
                return "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80";
        }
    }
%>

<section class="hero">
    <div class="hero-content">
        <h1>Discover the Best Food in Parbhani</h1>
        <p>Your cravings, delivered fresh. Order from 30+ restaurants near you.</p>
        <form action="<%= request.getContextPath() %>/home" method="GET" class="hero-search">
            <svg class="hero-search-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
            <input type="text" name="search" placeholder="Search for restaurants, cuisines or a dish" value="${searchQuery}">
            <button type="submit" class="btn btn-primary">Find Food</button>
        </form>
    </div>
</section>

<%-- Section 1: Restaurants (Top 5) --%>
<section class="section" id="restaurants">
    <div class="container">
        <div class="section-title reveal">
            <h2>Restaurants</h2>
            <p>Discover amazing food near you</p>
        </div>
        <div class="grid grid-3">
            <% List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
               int restaurantCount = 0;
               if (restaurants != null && !restaurants.isEmpty()) {
                   for (Restaurant restaurant : restaurants) {
                       if (restaurantCount >= 5) break; %>
            <div class="restaurant-card card-stagger" onclick="location.href='<%= request.getContextPath() %>/restaurant?id=<%= restaurant.getRestaurantId() %>'">
                <div class="restaurant-cover">
                    <img src="<%= restaurant.getImageUrl() != null && !restaurant.getImageUrl().isEmpty() ? restaurant.getImageUrl() : "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&q=80" %>"
                         alt="<%= restaurant.getName() %>"
                         loading="lazy"
                         onerror="this.src='https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&q=80'">
                    <% if (restaurant.isTrending()) { %>
                        <span class="promoted-badge">Trending</span>
                    <% } %>
                </div>
                <div class="restaurant-info">
                    <h3 class="restaurant-name"><%= restaurant.getName() %></h3>
                    <p class="restaurant-cuisine"><%= restaurant.getCuisineType() %></p>
                    <div class="restaurant-meta">
                        <span class="rating">★ <%= String.format("%.1f", restaurant.getRating()) %></span>
                        <span class="delivery-info">⏱ 30-40 mins</span>
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
            <% restaurantCount++; } } else { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 3h18v18H3zM12 8v8M8 12h8"/>
                    </svg>
                </div>
                <h3>No restaurants found</h3>
                <p>Restaurants will appear here once the database is set up.</p>
            </div>
            <% } %>
        </div>
        <% if (restaurants != null && restaurants.size() > 5) { %>
            <div class="text-center mt-4">
                <a href="<%= request.getContextPath() %>/home?viewAllRestaurants=true" class="btn btn-outline">View All Restaurants</a>
            </div>
        <% } %>
    </div>
</section>

<%-- Section 2: Categories --%>
<section class="section section-with-bg" id="categories">
    <div class="container">
        <div class="section-title reveal">
            <h2>Categories</h2>
            <p>Choose from a variety of cuisines</p>
        </div>
        <div class="category-carousel">
            <% List<Category> categories = (List<Category>) request.getAttribute("categories");
               if (categories != null && !categories.isEmpty()) {
                   for (Category category : categories) { %>
            <a href="<%= request.getContextPath() %>/category?id=<%= category.getCategoryId() %>"
               class="category-card card-stagger" style="text-decoration: none;">
                <img src="<%= getCategoryImage(category.getName()) %>"
                     alt="<%= category.getName() %>"
                     loading="lazy"
                     onerror="this.src='https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80'">
                <h4><%= category.getName() %></h4>
            </a>
            <% } } else { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M11 9H9a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm8 0h-2a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm-8 8H9a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm8 0h-2a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2z"/>
                    </svg>
                </div>
                <h3>No categories available</h3>
                <p>Categories will appear here once the database is set up.</p>
            </div>
            <% } %>
        </div>
    </div>
</section>

<%-- Section 3: Best For --%>
<section class="section" id="bestFor">
    <div class="container">
        <div class="section-title reveal">
            <h2>Best For</h2>
            <p>Find the perfect place for any occasion</p>
        </div>
        <div class="grid grid-4">
            <% List<BestForCategory> bestForCategories = (List<BestForCategory>) request.getAttribute("bestForCategories");
               if (bestForCategories != null && !bestForCategories.isEmpty()) {
                   for (BestForCategory bf : bestForCategories) { %>
            <a href="<%= request.getContextPath() %>/bestfor?id=<%= bf.getBestForId() %>"
               class="card card-compact card-stagger" style="text-decoration: none;">
                <h4><%= bf.getName() %></h4>
                <p class="text-muted" style="font-size: 0.875rem;"><%= bf.getDescription() %></p>
            </a>
            <% } } else { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"/>
                        <circle cx="12" cy="12" r="6"/>
                        <circle cx="12" cy="12" r="2"/>
                    </svg>
                </div>
                <h3>No collections available</h3>
                <p>Collections will appear here once the database is set up.</p>
            </div>
            <% } %>
        </div>
    </div>
</section>

<%-- Section 4: Special Collections --%>
<section class="section section-with-bg">
    <div class="container">
        <div class="section-title reveal">
            <h2>Special Collections</h2>
            <p>Curated selections for every occasion</p>
        </div>
        <div class="row section-spaced">
            <div class="col-4">
                <div class="card special-collection-card card-stagger">
                    <span class="badge badge-student badge-lg">Student Friendly</span>
                    <p class="mt-2">Budget-friendly options perfect for students</p>
                    <a href="<%= request.getContextPath() %>/collection?type=student_friendly" class="btn btn-outline btn-sm mt-2">Explore</a>
                </div>
            </div>
            <div class="col-4">
                <div class="card special-collection-card card-stagger">
                    <span class="badge badge-trending badge-lg">Budget Meals</span>
                    <p class="mt-2">Economical individual meals and low-cost combos</p>
                    <a href="<%= request.getContextPath() %>/collection?type=budget_meals" class="btn btn-outline btn-sm mt-2">Explore</a>
                </div>
            </div>
            <div class="col-4">
                <div class="card special-collection-card card-stagger">
                    <span class="badge badge-lg" style="background-color: #4CAF50; color: white;">Family Feast</span>
                    <p class="mt-2">Family-sized meal packages and sharing combos</p>
                    <a href="<%= request.getContextPath() %>/collection?type=family_feast" class="btn btn-outline btn-sm mt-2">Explore</a>
                </div>
            </div>
        </div>
        <div class="row section-spaced">
            <div class="col-4">
                <div class="card special-collection-card card-stagger">
                    <span class="badge badge-lg" style="background-color: #FF9800; color: white;">Party Packs</span>
                    <p class="mt-2">Group meals and larger combo offers</p>
                    <a href="<%= request.getContextPath() %>/collection?type=party_packs" class="btn btn-outline btn-sm mt-2">Explore</a>
                </div>
            </div>
            <div class="col-4">
                <div class="card special-collection-card card-stagger">
                    <span class="badge badge-lg" style="background-color: #9C27B0; color: white;">Best Offers</span>
                    <p class="mt-2">Genuine discounts and value-for-money combos</p>
                    <a href="<%= request.getContextPath() %>/collection?type=best_offers" class="btn btn-outline btn-sm mt-2">Explore</a>
                </div>
            </div>
            <div class="col-4">
                <div class="card special-collection-card card-stagger">
                    <span class="badge badge-lg" style="background-color: #00BCD4; color: white;">Quick Bites</span>
                    <p class="mt-2">Snacks, sandwiches, rolls and light meals</p>
                    <a href="<%= request.getContextPath() %>/collection?type=quick_bites" class="btn btn-outline btn-sm mt-2">Explore</a>
                </div>
            </div>
        </div>
    </div>
</section>

<%-- Section 5: Food Items (Limited) --%>
<section class="section" id="foodItems">
    <div class="container">
        <div class="section-title reveal">
            <h2>Food Items</h2>
            <p>Popular food items everyone is ordering</p>
        </div>
        <div class="grid grid-4">
            <% List<FoodItem> trendingFoodItems = (List<FoodItem>) request.getAttribute("trendingFoodItems");
               int foodItemCount = 0;
               if (trendingFoodItems != null && !trendingFoodItems.isEmpty()) {
                   for (FoodItem food : trendingFoodItems) {
                       if (foodItemCount >= 8) break; %>
            <div class="food-card card-stagger">
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
                        <span class="badge badge-trending">Trending</span>
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
            <% foodItemCount++; } } else { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"/>
                    </svg>
                </div>
                <h3>No food items available</h3>
                <p>Food items will appear here once the database is set up.</p>
            </div>
            <% } %>
        </div>
        <% if (trendingFoodItems != null && trendingFoodItems.size() > 8) { %>
            <div class="text-center mt-4">
                <a href="<%= request.getContextPath() %>/home?viewAllFoodItems=true" class="btn btn-outline">View All Food Items</a>
            </div>
        <% } %>
    </div>
</section>

<%@ include file="footer.jsp" %>
