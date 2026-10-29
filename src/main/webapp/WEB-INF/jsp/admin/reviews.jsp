<%@ page import="com.eat.model.Review" %>
<%@ page import="java.util.List" %>
<%@ include file="../header.jsp" %>

<% List<Review> reviews = (List<Review>) request.getAttribute("reviews"); %>
<% String filter = (String) request.getAttribute("filter"); %>

<section class="section">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Moderate Reviews</h2>
            <div>
                <a href="<%= request.getContextPath() %>/admin/reviews" 
                   class="btn <%= "pending".equals(filter) ? "btn-outline" : "btn-primary" %>">All Reviews</a>
                <a href="<%= request.getContextPath() %>/admin/reviews?filter=pending" 
                   class="btn <%= "pending".equals(filter) ? "btn-primary" : "btn-outline" %>">Pending Only</a>
            </div>
        </div>
        
        <div class="grid grid-2">
            <% if (reviews != null && !reviews.isEmpty()) {
                   for (Review review : reviews) { %>
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <h4><%= review.getUserName() %></h4>
                        <% if (review.isApproved()) { %>
                            <span class="badge badge-success" style="background-color: var(--success); color: white;">Approved</span>
                        <% } else { %>
                            <span class="badge badge-warning" style="background-color: var(--warning); color: black;">Pending</span>
                        <% } %>
                    </div>
                    <p class="text-muted"><%= review.getRestaurantName() %></p>
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
                    <p class="text-muted" style="font-size: 0.75rem;">Submitted: <%= review.getCreatedAt().toLocalDate() %></p>
                    
                    <% if (!review.isApproved()) { %>
                        <div class="mt-3">
                            <form action="<%= request.getContextPath() %>/admin/review-action" method="POST" style="display: inline;">
                                <input type="hidden" name="action" value="approve">
                                <input type="hidden" name="reviewId" value="<%= review.getReviewId() %>">
                                <button type="submit" class="btn btn-success btn-sm">Approve</button>
                            </form>
                            <form action="<%= request.getContextPath() %>/admin/review-action" method="POST" style="display: inline;">
                                <input type="hidden" name="action" value="reject">
                                <input type="hidden" name="reviewId" value="<%= review.getReviewId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                            </form>
                        </div>
                    <% } %>
                </div>
            </div>
            <% } } else { %>
            <p class="text-muted">No reviews found</p>
            <% } %>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
