<%@ page import="com.eat.model.Restaurant" %>
<%@ include file="../header.jsp" %>

<% Restaurant restaurant = (Restaurant) request.getAttribute("restaurant"); %>
<% boolean isEdit = restaurant != null; %>

<section class="section">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2><%= isEdit ? "Edit Restaurant" : "Add Restaurant" %></h2>
            <a href="<%= request.getContextPath() %>/admin/restaurants" class="btn btn-outline">Back to Restaurants</a>
        </div>
        
        <div class="card">
            <div class="card-body">
                <form action="<%= request.getContextPath() %>/admin/restaurants" method="POST">
                    <% if (isEdit) { %>
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="restaurantId" value="<%= restaurant.getRestaurantId() %>">
                    <% } else { %>
                        <input type="hidden" name="action" value="create">
                    <% } %>
                    
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="form-label">Restaurant Name *</label>
                                <input type="text" name="name" class="form-control" required 
                                       value="<%= isEdit ? restaurant.getName() : "" %>">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="form-label">Cuisine Type *</label>
                                <input type="text" name="cuisineType" class="form-control" required 
                                       value="<%= isEdit ? restaurant.getCuisineType() : "" %>">
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="3"><%= isEdit ? restaurant.getDescription() : "" %></textarea>
                    </div>
                    
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="form-label">Address *</label>
                                <input type="text" name="address" class="form-control" required 
                                       value="<%= isEdit ? restaurant.getAddress() : "" %>">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="form-label">Phone</label>
                                <input type="tel" name="phone" class="form-control" 
                                       value="<%= isEdit ? restaurant.getPhone() : "" %>">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-control" 
                                       value="<%= isEdit ? restaurant.getEmail() : "" %>">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="form-label">Image URL</label>
                                <input type="url" name="imageUrl" class="form-control" id="imageUrlInput"
                                       value="<%= isEdit ? restaurant.getImageUrl() : "" %>"
                                       oninput="previewImage(this.value)">
                            </div>
                        </div>
                    </div>

                    <div class="form-group" id="imagePreviewContainer" style="<%= isEdit && restaurant.getImageUrl() != null && !restaurant.getImageUrl().isEmpty() ? "" : "display: none;" %>">
                        <label class="form-label">Image Preview</label>
                        <img id="imagePreview"
                             src="<%= isEdit && restaurant.getImageUrl() != null ? restaurant.getImageUrl() : "" %>"
                             alt="Restaurant Preview"
                             style="width: 300px; height: 200px; object-fit: cover; border-radius: var(--radius-md); border: 1px solid var(--gray-300);"
                             onerror="this.style.display='none'">
                    </div>

                    <script>
                        function previewImage(url) {
                            const preview = document.getElementById('imagePreview');
                            const container = document.getElementById('imagePreviewContainer');
                            if (url && url.trim() !== '') {
                                preview.src = url;
                                container.style.display = 'block';
                            } else {
                                container.style.display = 'none';
                            }
                        }
                    </script>
                    
                    <div class="row">
                        <div class="col-4">
                            <div class="form-group">
                                <label class="form-label">Price Range</label>
                                <select name="priceRange" class="form-control">
                                    <option value="$" <%= isEdit && "$".equals(restaurant.getPriceRange()) ? "selected" : "" %>>$ (Budget)</option>
                                    <option value="$$" <%= isEdit && "$$".equals(restaurant.getPriceRange()) ? "selected" : "" %>$$ (Moderate)</option>
                                    <option value="$$$" <%= isEdit && "$$$".equals(restaurant.getPriceRange()) ? "selected" : "" %>$$$ (Expensive)</option>
                                    <option value="$$$$" <%= isEdit && "$$$$".equals(restaurant.getPriceRange()) ? "selected" : "" %>$$$$ (Premium)</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label class="form-label">Opening Time</label>
                                <input type="time" name="openingTime" class="form-control" 
                                       value="<%= isEdit ? restaurant.getOpeningTime() : "10:00" %>">
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label class="form-label">Closing Time</label>
                                <input type="time" name="closingTime" class="form-control" 
                                       value="<%= isEdit ? restaurant.getClosingTime() : "22:00" %>">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-3">
                            <label class="form-check">
                                <input type="checkbox" name="isActive" class="form-check-input" 
                                       <%= isEdit && restaurant.isActive() ? "checked" : "" %>>
                                <span class="form-check-label">Active</span>
                            </label>
                        </div>
                        <div class="col-3">
                            <label class="form-check">
                                <input type="checkbox" name="isTrending" class="form-check-input" 
                                       <%= isEdit && restaurant.isTrending() ? "checked" : "" %>>
                                <span class="form-check-label">Trending</span>
                            </label>
                        </div>
                        <div class="col-3">
                            <label class="form-check">
                                <input type="checkbox" name="isStudentFriendly" class="form-check-input" 
                                       <%= isEdit && restaurant.isStudentFriendly() ? "checked" : "" %>>
                                <span class="form-check-label">Student Friendly</span>
                            </label>
                        </div>
                        <div class="col-3">
                            <label class="form-check">
                                <input type="checkbox" name="isFamilySpecial" class="form-check-input" 
                                       <%= isEdit && restaurant.isFamilySpecial() ? "checked" : "" %>>
                                <span class="form-check-label">Family Special</span>
                            </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">
                            <label class="form-check">
                                <input type="checkbox" name="isCoupleSpecial" class="form-check-input" 
                                       <%= isEdit && restaurant.isCoupleSpecial() ? "checked" : "" %>>
                                <span class="form-check-label">Couple Special</span>
                            </label>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary mt-3">
                        <%= isEdit ? "Update Restaurant" : "Add Restaurant" %>
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
