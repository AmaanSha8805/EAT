<%@ page import="com.eat.model.User" %>
<%@ page import="java.util.List" %>
<%@ include file="../header.jsp" %>

<% List<User> users = (List<User>) request.getAttribute("users"); %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>Customer Accounts</h2>
        </div>
        
        <div class="card">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Registered</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (users != null && !users.isEmpty()) {
                           for (User user : users) { %>
                    <tr>
                        <td><%= user.getUserId() %></td>
                        <td><%= user.getFullName() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getPhone() != null ? user.getPhone() : "-" %></td>
                        <td><%= user.getCreatedAt().toLocalDate() %></td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="5" class="text-center">No users found</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
