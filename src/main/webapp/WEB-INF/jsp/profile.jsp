<%@ page import="com.eat.model.User" %>
<%@ include file="header.jsp" %>

<% User user = (User) request.getAttribute("user"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>My Profile</h2>
        </div>
        
        <% if (request.getAttribute("success") != null) { %>
            <div class="alert alert-success">
                <%= request.getAttribute("success") %>
            </div>
        <% } %>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <div class="row">
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                        <h3>Personal Information</h3>
                        <form action="<%= request.getContextPath() %>/profile" method="POST">
                            <div class="form-group">
                                <label class="form-label">Full Name</label>
                                <input type="text" name="fullName" class="form-control" 
                                       value="<%= user.getFullName() %>" required>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control"
                                       value="<%= user.getEmail() %>" disabled>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">Phone</label>
                                <input type="tel" name="phone" class="form-control" 
                                       value="<%= user.getPhone() != null ? user.getPhone() : "" %>">
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">Address</label>
                                <textarea name="address" class="form-control" rows="3"><%= user.getAddress() != null ? user.getAddress() : "" %></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Update Profile</button>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                        <h3>Account Details</h3>
                        <p><strong>Member Since:</strong> <%= user.getCreatedAt().toLocalDate() %></p>
                        <p><strong>Account Type:</strong> <%= "customer".equals(user.getRole()) ? "Customer" : "Administrator" %></p>
                        <p><strong>Email:</strong> <%= user.getEmail() %></p>
                        
                        <hr>
                        
                        <h4>Quick Links</h4>
                        <div class="mt-2">
                            <a href="<%= request.getContextPath() %>/orders" class="btn btn-outline w-100 mb-2">View My Orders</a>
                            <a href="<%= request.getContextPath() %>/cart" class="btn btn-outline w-100 mb-2">View Cart</a>
                            <% if (user.isAdmin()) { %>
                                <a href="<%= request.getContextPath() %>/admin/dashboard" class="btn btn-secondary w-100 mb-2">Admin Dashboard</a>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
