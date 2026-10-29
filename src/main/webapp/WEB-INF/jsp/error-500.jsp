<%@ include file="header.jsp" %>

<section class="section" style="min-height: 60vh; display: flex; align-items: center;">
    <div class="container text-center">
        <h1 style="font-size: 6rem; color: var(--danger);">500</h1>
        <h2>Server Error</h2>
        <p class="text-muted">Something went wrong on our end. Please try again later.</p>
        <a href="<%= request.getContextPath() %>/home" class="btn btn-primary mt-3">Go to Home</a>
    </div>
</section>

<%@ include file="footer.jsp" %>
