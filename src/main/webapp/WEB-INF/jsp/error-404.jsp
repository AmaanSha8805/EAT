<%@ include file="header.jsp" %>

<section class="section" style="min-height: 60vh; display: flex; align-items: center;">
    <div class="container text-center">
        <h1 style="font-size: 6rem; color: var(--primary-orange);">404</h1>
        <h2>Page Not Found</h2>
        <p class="text-muted">The page you're looking for doesn't exist or has been moved.</p>
        <a href="<%= request.getContextPath() %>/home" class="btn btn-primary mt-3">Go to Home</a>
    </div>
</section>

<%@ include file="footer.jsp" %>
