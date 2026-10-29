<%@ page import="com.eat.model.DeliveryPerson, com.eat.model.Delivery" %>
<%@ page import="java.util.List" %>
<%@ include file="../header.jsp" %>

<% List<DeliveryPerson> deliveryPersons = (List<DeliveryPerson>) request.getAttribute("deliveryPersons"); %>
<% List<Delivery> deliveries = (List<Delivery>) request.getAttribute("deliveries"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>Delivery Management</h2>
        </div>
        
        <div class="row">
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                        <h3>Add Delivery Person</h3>
                        <form action="<%= request.getContextPath() %>/admin/delivery" method="POST">
                            <input type="hidden" name="action" value="addPerson">
                            
                            <div class="form-group">
                                <label class="form-label">Name *</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">Phone *</label>
                                <input type="tel" name="phone" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">Vehicle Number</label>
                                <input type="text" name="vehicleNumber" class="form-control">
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Add Delivery Person</button>
                        </form>
                    </div>
                </div>
                
                <div class="card mt-4">
                    <div class="card-body">
                        <h3>Delivery Personnel</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Vehicle</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (deliveryPersons != null && !deliveryPersons.isEmpty()) {
                                       for (DeliveryPerson dp : deliveryPersons) { %>
                                <tr>
                                    <td><%= dp.getName() %></td>
                                    <td><%= dp.getPhone() %></td>
                                    <td><%= dp.getVehicleNumber() != null ? dp.getVehicleNumber() : "-" %></td>
                                    <td>
                                        <% if (dp.isAvailable()) { %>
                                            <span class="badge badge-success" style="background-color: var(--success); color: white;">Available</span>
                                        <% } else { %>
                                            <span class="badge badge-danger" style="background-color: var(--danger); color: white;">Busy</span>
                                        <% } %>
                                    </td>
                                </tr>
                                <% } } else { %>
                                <tr>
                                    <td colspan="4" class="text-center">No delivery personnel</td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                        <h3>Assign Delivery Person</h3>
                        <form action="<%= request.getContextPath() %>/admin/delivery" method="POST">
                            <input type="hidden" name="action" value="assign">
                            
                            <div class="form-group">
                                <label class="form-label">Order ID *</label>
                                <input type="number" name="orderId" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">Delivery Person *</label>
                                <select name="deliveryPersonId" class="form-control" required>
                                    <option value="">Select...</option>
                                    <% if (deliveryPersons != null && !deliveryPersons.isEmpty()) {
                                           for (DeliveryPerson dp : deliveryPersons) {
                                               if (dp.isAvailable()) { %>
                                    <option value="<%= dp.getDeliveryPersonId() %>"><%= dp.getName() %> (<%= dp.getPhone() %>)</option>
                                    <% } } } %>
                                </select>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Assign</button>
                        </form>
                    </div>
                </div>
                
                <div class="card mt-4">
                    <div class="card-body">
                        <h3>Active Deliveries</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Delivery Person</th>
                                    <th>Status</th>
                                    <th>Assigned</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (deliveries != null && !deliveries.isEmpty()) {
                                       for (Delivery delivery : deliveries) { %>
                                <tr>
                                    <td>#<%= delivery.getOrderId() %></td>
                                    <td><%= delivery.getDeliveryPersonName() != null ? delivery.getDeliveryPersonName() : "Unassigned" %></td>
                                    <td>
                                        <span class="badge badge-trending"><%= delivery.getStatus() %></span>
                                    </td>
                                    <td><%= delivery.getAssignedAt().toLocalDate() %></td>
                                </tr>
                                <% } } else { %>
                                <tr>
                                    <td colspan="4" class="text-center">No active deliveries</td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
