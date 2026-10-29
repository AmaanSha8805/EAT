<%@ page import="com.eat.model.Order" %>
<%@ page import="java.util.List" %>
<%@ include file="../header.jsp" %>

<% List<Order> orders = (List<Order>) request.getAttribute("orders"); %>
<% String selectedStatus = (String) request.getAttribute("selectedStatus"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>Manage Orders</h2>
        </div>
        
        <div class="card mb-4">
            <div class="card-body">
                <form action="<%= request.getContextPath() %>/admin/orders" method="GET" class="d-flex align-items-center gap-3">
                    <label class="form-label mb-0">Filter by Status:</label>
                    <select name="status" class="form-control" style="width: auto;">
                        <option value="">All Orders</option>
                        <option value="placed" <%= "placed".equals(selectedStatus) ? "selected" : "" %>>Placed</option>
                        <option value="confirmed" <%= "confirmed".equals(selectedStatus) ? "selected" : "" %>>Confirmed</option>
                        <option value="preparing" <%= "preparing".equals(selectedStatus) ? "selected" : "" %>>Preparing</option>
                        <option value="out_for_delivery" <%= "out_for_delivery".equals(selectedStatus) ? "selected" : "" %>>Out for Delivery</option>
                        <option value="delivered" <%= "delivered".equals(selectedStatus) ? "selected" : "" %>>Delivered</option>
                        <option value="cancelled" <%= "cancelled".equals(selectedStatus) ? "selected" : "" %>>Cancelled</option>
                    </select>
                    <button type="submit" class="btn btn-primary">Filter</button>
                    <a href="<%= request.getContextPath() %>/admin/orders" class="btn btn-outline">Clear</a>
                </form>
            </div>
        </div>
        
        <div class="card">
            <table class="table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Restaurant</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Payment</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (orders != null && !orders.isEmpty()) {
                           for (Order order : orders) { %>
                    <tr>
                        <td>#<%= order.getOrderId() %></td>
                        <td><%= order.getUserName() %></td>
                        <td><%= order.getRestaurantName() %></td>
                        <td>₹<%= order.getTotalAmount() + 30 %></td>
                        <td>
                            <span class="badge <%= "cancelled".equals(order.getStatus()) ? "badge-danger" : "badge-trending" %>">
                                <%= order.getDisplayStatus() %>
                            </span>
                        </td>
                        <td><%= order.getPaymentMethod().toUpperCase() %></td>
                        <td><%= order.getCreatedAt().toLocalDate() %></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/admin/order-details?id=<%= order.getOrderId() %>" 
                               class="btn btn-outline btn-sm">View Details</a>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="8" class="text-center">No orders found</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
