<%@ page import="com.eat.model.FoodItem" %>
<%@ include file="../header.jsp" %>

<% FoodItem foodItem = (FoodItem) request.getAttribute("foodItem"); %>
<% int restaurantId = (Integer) request.getAttribute("restaurantId"); %>
<% boolean isEdit = foodItem != null; %>

<section class="section">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2><%= isEdit ? "Edit Food Item" : "Add Food Item" %></h2>
            <a href="<%= request.getContextPath() %>/admin/food?restaurantId=<%= restaurantId %>" class="btn btn-outline">Back to Menu</a>
        </div>
        
        <div class="card">
            <div class="card-body">
                <form action="<%= request.getContextPath() %>/admin/food" method="POST">
                    <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                    <% if (isEdit) { %>
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="foodId" value="<%= foodItem.getFoodId() %>">
                    <% } else { %>
                        <input type="hidden" name="action" value="create">
                    <% } %>
                    
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="form-label">Food Name *</label>
                                <input type="text" name="name" class="form-control" required 
                                       value="<%= isEdit ? foodItem.getName() : "" %>">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="form-label">Category</label>
                                <input type="text" name="category" class="form-control" 
                                       value="<%= isEdit ? foodItem.getCategory() : "" %>">
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="2"><%= isEdit ? foodItem.getDescription() : "" %></textarea>
                    </div>
                    
                    <div class="row">
                        <div class="col-4">
                            <div class="form-group">
                                <label class="form-label">Price (₹) *</label>
                                <input type="number" name="price" class="form-control" required step="0.01" min="0"
                                       value="<%= isEdit ? foodItem.getPrice() : "" %>">
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label class="form-label">Preparation Time (mins)</label>
                                <input type="number" name="preparationTime" class="form-control" min="0"
                                       value="<%= isEdit ? foodItem.getPreparationTime() : "15" %>">
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label class="form-label">Image URL</label>
                                <input type="url" name="imageUrl" class="form-control" 
                                       value="<%= isEdit ? foodItem.getImageUrl() : "" %>">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-4">
                            <label class="form-check">
                                <input type="checkbox" name="isVegetarian" class="form-check-input" 
                                       <%= isEdit && foodItem.isVegetarian() ? "checked" : "" %>>
                                <span class="form-check-label">Vegetarian</span>
                            </label>
                        </div>
                        <div class="col-4">
                            <label class="form-check">
                                <input type="checkbox" name="isAvailable" class="form-check-input" 
                                       <%= isEdit ? (foodItem.isAvailable() ? "checked" : "") : "checked" %>>
                                <span class="form-check-label">Available</span>
                            </label>
                        </div>
                        <div class="col-4">
                            <label class="form-check">
                                <input type="checkbox" name="isTrending" class="form-check-input" 
                                       <%= isEdit && foodItem.isTrending() ? "checked" : "" %>>
                                <span class="form-check-label">Trending</span>
                            </label>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary mt-3">
                        <%= isEdit ? "Update Food Item" : "Add Food Item" %>
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
