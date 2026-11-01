<%@ page import="com.eat.model.Restaurant, com.eat.model.FoodItem, com.eat.model.Review" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% Restaurant restaurant = (Restaurant) request.getAttribute("restaurant"); %>
<% List<FoodItem> foodItems = (List<FoodItem>) request.getAttribute("foodItems"); %>
<% List<Review> reviews = (List<Review>) request.getAttribute("reviews"); %>

<section class="section" style="padding-top: 0;">
    <div class="container">
        <!-- Restaurant Header -->
        <div class="card mb-4" style="border: none; box-shadow: var(--shadow-md);">
            <div style="position: relative; height: 300px; overflow: hidden;">
                <img src="<%= restaurant.getImageUrl() != null && !restaurant.getImageUrl().isEmpty() ? restaurant.getImageUrl() : "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&q=80" %>"
                     alt="<%= restaurant.getName() %>"
                     style="width: 100%; height: 100%; object-fit: cover;"
                     loading="lazy"
                     onerror="this.src='https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&q=80'">
                <div style="position: absolute; bottom: 0; left: 0; right: 0;
                            background: linear-gradient(transparent, rgba(0,0,0,0.7));
                            padding: var(--spacing-2xl) var(--spacing-lg);">
                    <h1 style="color: var(--white); margin-bottom: var(--spacing-sm);"><%= restaurant.getName() %></h1>
                    <p style="color: rgba(255,255,255,0.9); margin-bottom: var(--spacing-md);"><%= restaurant.getCuisineType() %></p>
                    <div style="display: flex; gap: var(--spacing-lg); flex-wrap: wrap;">
                        <span style="background-color: var(--success); color: var(--white);
                                     padding: 4px 8px; border-radius: var(--radius-sm); font-weight: 600; font-size: 0.875rem;">
                            ★ <%= String.format("%.1f", restaurant.getRating()) %>
                        </span>
                        <span style="color: rgba(255,255,255,0.9); font-size: 0.875rem;">
                            <%= restaurant.getReviewCount() %> reviews
                        </span>
                        <span style="color: rgba(255,255,255,0.9); font-size: 0.875rem;">
                            <%= restaurant.getPriceRange() %> for two
                        </span>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <p style="margin-bottom: var(--spacing-lg);"><%= restaurant.getDescription() %></p>
                <div class="row" style="margin-bottom: var(--spacing-lg);">
                    <div class="col-3">
                        <strong style="font-size: 0.875rem; color: var(--charcoal-light);">Hours</strong>
                        <p style="font-size: 0.95rem; margin-bottom: 0;"><%= restaurant.getOpeningTime() %> - <%= restaurant.getClosingTime() %></p>
                    </div>
                    <div class="col-3">
                        <strong style="font-size: 0.875rem; color: var(--charcoal-light);">Address</strong>
                        <p style="font-size: 0.95rem; margin-bottom: 0;"><%= restaurant.getAddress() %></p>
                    </div>
                    <div class="col-3">
                        <strong style="font-size: 0.875rem; color: var(--charcoal-light);">Delivery Time</strong>
                        <p style="font-size: 0.95rem; margin-bottom: 0;">30-40 mins</p>
                    </div>
                    <div class="col-3">
                        <strong style="font-size: 0.875rem; color: var(--charcoal-light);">Delivery Fee</strong>
                        <p style="font-size: 0.95rem; margin-bottom: 0;">₹30</p>
                    </div>
                </div>
                <div style="display: flex; gap: var(--spacing-sm); flex-wrap: wrap;">
                    <% if (restaurant.isTrending()) { %>
                        <span class="badge badge-trending">Trending</span>
                    <% } %>
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

        <!-- Menu Section -->
        <div class="section-title">
            <h2>Menu</h2>
        </div>
        <div class="grid grid-3">
            <% if (foodItems != null && !foodItems.isEmpty()) {
                   for (FoodItem food : foodItems) { %>
            <div class="food-card">
                <img src="<%= food.getImageUrl() != null && !food.getImageUrl().isEmpty() ? food.getImageUrl() : "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80" %>"
                     alt="<%= food.getName() %>"
                     class="food-image"
                     loading="lazy"
                     onerror="this.src='https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80'">
                <div class="food-info">
                    <h4 class="food-name">
                        <%= food.getName() %>
                        <% if (food.isVegetarian()) { %>
                            <span class="badge badge-vegetarian" style="font-size: 0.7rem; padding: 2px 6px;">Veg</span>
                        <% } %>
                    </h4>
                    <p class="text-muted" style="font-size: 0.875rem; margin-bottom: var(--spacing-sm);"><%= food.getDescription() %></p>
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-top: var(--spacing-sm);">
                        <p class="food-price" style="margin-bottom: 0;">₹<%= food.getPrice() %></p>
                        <span style="font-size: 0.75rem; color: var(--charcoal-light);">⏱ <%= food.getPreparationTime() %> mins</span>
                    </div>
                    <% if (user != null) { %>
                        <form action="<%= request.getContextPath() %>/cart" method="POST" class="mt-2">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="foodId" value="<%= food.getFoodId() %>">
                            <button type="submit" class="btn btn-primary btn-sm w-100">Add to Cart</button>
                        </form>
                    <% } else { %>
                        <a href="<%= request.getContextPath() %>/login" class="btn btn-outline btn-sm w-100 mt-2">Login to Order</a>
                    <% } %>
                </div>
            </div>
            <% } } else { %>
            <div class="empty-state">
                <div class="empty-state-icon">🍔</div>
                <h3>No menu items available</h3>
                <p>Check back later for delicious options</p>
            </div>
            <% } %>
        </div>

        <!-- Reviews Section -->
        <div class="section-title mt-5">
            <h2>Reviews</h2>
        </div>

        <% if (user != null) { %>
            <div class="card mb-4">
                <div class="card-body">
                    <h4 style="margin-bottom: var(--spacing-lg);">Write a Review</h4>
                    <form action="<%= request.getContextPath() %>/review" method="POST">
                        <input type="hidden" name="restaurantId" value="<%= restaurant.getRestaurantId() %>">

                        <div class="row">
                            <div class="col-3">
                                <div class="form-group">
                                    <label class="form-label">Food Rating</label>
                                    <select name="foodRating" class="form-control" required>
                                        <option value="5">5 - Excellent</option>
                                        <option value="4">4 - Very Good</option>
                                        <option value="3">3 - Good</option>
                                        <option value="2">2 - Fair</option>
                                        <option value="1">1 - Poor</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <label class="form-label">Ambience Rating</label>
                                    <select name="ambienceRating" class="form-control" required>
                                        <option value="5">5 - Excellent</option>
                                        <option value="4">4 - Very Good</option>
                                        <option value="3">3 - Good</option>
                                        <option value="2">2 - Fair</option>
                                        <option value="1">1 - Poor</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <label class="form-label">Service Rating</label>
                                    <select name="serviceRating" class="form-control" required>
                                        <option value="5">5 - Excellent</option>
                                        <option value="4">4 - Very Good</option>
                                        <option value="3">3 - Good</option>
                                        <option value="2">2 - Fair</option>
                                        <option value="1">1 - Poor</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <label class="form-label">Value for Money</label>
                                    <select name="valueRating" class="form-control" required>
                                        <option value="5">5 - Excellent</option>
                                        <option value="4">4 - Very Good</option>
                                        <option value="3">3 - Good</option>
                                        <option value="2">2 - Fair</option>
                                        <option value="1">1 - Poor</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Your Review</label>
                            <textarea name="comment" class="form-control" rows="3" required></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Submit Review</button>
                    </form>
                </div>
            </div>
        <% } %>

        <div class="grid grid-2">
            <% if (reviews != null && !reviews.isEmpty()) {
                   for (Review review : reviews) { %>
            <div class="card">
                <div class="card-body">
                    <h4><%= review.getUserName() %></h4>
                    <div class="row mt-2">
                        <div class="col-3">
                            <small>Food: <%= review.getFoodRating() %>/5</small>
                        </div>
                        <div class="col-3">
                            <small>Ambience: <%= review.getAmbienceRating() %>/5</small>
                        </div>
                        <div class="col-3">
                            <small>Service: <%= review.getServiceRating() %>/5</small>
                        </div>
                        <div class="col-3">
                            <small>Value: <%= review.getValueRating() %>/5</small>
                        </div>
                    </div>
                    <p class="mt-2"><strong>Overall: <%= String.format("%.1f", review.getOverallRating()) %>/5</strong></p>
                    <p class="text-muted"><%= review.getComment() %></p>
                </div>
            </div>
            <% } } else { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                    </svg>
                </div>
                <h3>No reviews yet</h3>
                <p>Be the first to review this restaurant!</p>
            </div>
            <% } %>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
