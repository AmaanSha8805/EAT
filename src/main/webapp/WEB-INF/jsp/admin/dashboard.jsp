<%@ include file="../header.jsp" %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>Admin Dashboard</h2>
            <p>Overview of platform statistics</p>
        </div>
        
        <div class="grid grid-4">
            <div class="card card-center card-spacious">
                <h3 style="font-size: 2.5rem; color: var(--primary-orange);">${totalUsers}</h3>
                <p class="text-muted">Total Users</p>
            </div>
            <div class="card card-center card-spacious">
                <h3 style="font-size: 2.5rem; color: var(--success);">${totalRestaurants}</h3>
                <p class="text-muted">Restaurants</p>
            </div>
            <div class="card card-center card-spacious">
                <h3 style="font-size: 2.5rem; color: var(--info);">${totalOrders}</h3>
                <p class="text-muted">Total Orders</p>
            </div>
            <div class="card card-center card-spacious">
                <h3 style="font-size: 2.5rem; color: var(--warning);">${pendingReviews}</h3>
                <p class="text-muted">Pending Reviews</p>
            </div>
        </div>
        
        <div class="section-title mt-5">
            <h2>Quick Actions</h2>
        </div>
        
        <div class="grid grid-3">
            <a href="<%= request.getContextPath() %>/admin/restaurants" class="card card-center card-spacious" style="text-decoration: none;">
                <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" style="color: var(--primary-orange);">
                    <path d="M11 9H9a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm8 0h-2a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm-8 8H9a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm8 0h-2a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2z"/>
                </svg>
                <h4 class="mt-2">Manage Restaurants</h4>
                <p class="text-muted">Add, edit, or remove restaurants</p>
            </a>
            <a href="<%= request.getContextPath() %>/admin/orders" class="card card-center card-spacious" style="text-decoration: none;">
                <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" style="color: var(--primary-orange);">
                    <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/>
                    <polyline points="3.27 6.96 12 12.01 20.73 6.96"/>
                    <line x1="12" y1="22.08" x2="12" y2="12"/>
                </svg>
                <h4 class="mt-2">Manage Orders</h4>
                <p class="text-muted">View and update order status</p>
            </a>
            <a href="<%= request.getContextPath() %>/admin/reviews" class="card card-center card-spacious" style="text-decoration: none;">
                <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" style="color: var(--primary-orange);">
                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                </svg>
                <h4 class="mt-2">Moderate Reviews</h4>
                <p class="text-muted">Approve or reject reviews</p>
            </a>
            <a href="<%= request.getContextPath() %>/admin/users" class="card card-center card-spacious" style="text-decoration: none;">
                <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" style="color: var(--primary-orange);">
                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                    <circle cx="9" cy="7" r="4"/>
                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                    <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                </svg>
                <h4 class="mt-2">View Users</h4>
                <p class="text-muted">Manage customer accounts</p>
            </a>
            <a href="<%= request.getContextPath() %>/admin/delivery" class="card card-center card-spacious" style="text-decoration: none;">
                <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" style="color: var(--primary-orange);">
                    <rect x="1" y="3" width="15" height="13"/>
                    <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/>
                    <circle cx="5.5" cy="18.5" r="2.5"/>
                    <circle cx="18.5" cy="18.5" r="2.5"/>
                </svg>
                <h4 class="mt-2">Delivery Management</h4>
                <p class="text-muted">Manage delivery personnel</p>
            </a>
            <a href="<%= request.getContextPath() %>/admin/image-generation" class="card card-center card-spacious" style="text-decoration: none;">
                <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" style="color: var(--primary-orange);">
                    <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                    <circle cx="8.5" cy="8.5" r="1.5"/>
                    <polyline points="21 15 16 10 5 21"/>
                </svg>
                <h4 class="mt-2">Generate Food Images</h4>
                <p class="text-muted">Batch generate AI food images</p>
            </a>
            <a href="<%= request.getContextPath() %>/home" class="card card-center card-spacious" style="text-decoration: none;">
                <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" style="color: var(--primary-orange);">
                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
                    <polyline points="9 22 9 12 15 12 15 22"/>
                </svg>
                <h4 class="mt-2">View Site</h4>
                <p class="text-muted">Go to customer homepage</p>
            </a>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
