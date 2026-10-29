<%@ page import="com.eat.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    String contextPath = request.getContextPath();
    String requestURI = request.getRequestURI();
    String isActiveClass = "active";
    Integer cartCount = (Integer) session.getAttribute("cartCount");
    if (cartCount == null) cartCount = 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EAT - Explore Amazing Taste</title>
    <link rel="stylesheet" href="<%= contextPath %>/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .skip-link {
            position: absolute;
            top: -40px;
            left: 0;
            background: var(--primary-orange);
            color: white;
            padding: 8px;
            z-index: 100;
            transition: top 0.3s;
        }
        .skip-link:focus {
            top: 0;
        }
    </style>
</head>
<body>
    <a href="#main-content" class="skip-link">Skip to main content</a>
    <header>
        <nav class="navbar">
            <a href="<%= contextPath %>/home" class="logo">EAT</a>

            <!-- Location Selector -->
            <div class="location-selector">
                <svg class="location-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                    <circle cx="12" cy="10" r="3"></circle>
                </svg>
                <span class="location-text">Parbhani, Maharashtra</span>
                <svg class="location-arrow" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </div>

            <!-- Search Bar -->
            <div class="search-container">
                <svg class="search-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
                <form action="<%= contextPath %>/home" method="GET" style="display: flex; width: 100%;">
                    <input type="text" name="search" class="search-input" placeholder="Search for restaurants, cuisines..." value="${searchQuery}">
                </form>
            </div>

            <!-- Nav Actions -->
            <div class="nav-actions">
                <% if (user != null) { %>
                    <a href="<%= contextPath %>/favorites" class="nav-action-item" title="Favourites">
                        <svg class="nav-action-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                        </svg>
                        <span class="nav-action-text">Favourites</span>
                    </a>
                    <a href="<%= contextPath %>/cart" class="nav-action-item" title="Cart" style="position: relative;">
                        <svg class="nav-action-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="9" cy="21" r="1"></circle>
                            <circle cx="20" cy="21" r="1"></circle>
                            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                        </svg>
                        <span class="nav-action-text">Cart</span>
                        <% if (cartCount > 0) { %>
                            <span class="cart-badge"><%= cartCount %></span>
                        <% } %>
                    </a>
                    <a href="<%= contextPath %>/profile" class="nav-action-item" title="Profile">
                        <svg class="nav-action-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                        <span class="nav-action-text">Profile</span>
                    </a>
                    <% if (user.isAdmin()) { %>
                        <a href="<%= contextPath %>/admin/dashboard" class="nav-action-item" title="Admin">
                            <svg class="nav-action-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                            <span class="nav-action-text">Admin</span>
                        </a>
                    <% } %>
                <% } else { %>
                    <a href="<%= contextPath %>/login" class="btn btn-primary btn-sm">Sign In</a>
                <% } %>
            </div>

            <!-- Mobile Menu Toggle -->
            <button class="nav-toggle" aria-label="Toggle navigation" aria-expanded="false">
                <span></span>
                <span></span>
                <span></span>
            </button>

            <!-- Mobile Navigation Links -->
            <ul class="nav-links">
                <li><a href="<%= contextPath %>/home" class="<%= requestURI.contains("/home") ? isActiveClass : "" %>">Home</a></li>
                <li><a href="<%= contextPath %>/home#trending">Trending</a></li>
                <li><a href="<%= contextPath %>/home#categories">Categories</a></li>
                <li><a href="<%= contextPath %>/home#bestFor">Best For</a></li>
                <% if (user != null) { %>
                    <li><a href="<%= contextPath %>/favorites">Favourites</a></li>
                    <li><a href="<%= contextPath %>/cart" class="<%= requestURI.contains("/cart") ? isActiveClass : "" %>">Cart</a></li>
                    <li><a href="<%= contextPath %>/orders" class="<%= requestURI.contains("/orders") ? isActiveClass : "" %>">Orders</a></li>
                    <li><a href="<%= contextPath %>/profile" class="<%= requestURI.contains("/profile") ? isActiveClass : "" %>">Profile</a></li>
                    <% if (user.isAdmin()) { %>
                        <li><a href="<%= contextPath %>/admin/dashboard" class="<%= requestURI.contains("/admin") ? isActiveClass : "" %>">Admin</a></li>
                    <% } %>
                    <li><a href="<%= contextPath %>/login?action=logout">Logout</a></li>
                <% } else { %>
                    <li><a href="<%= contextPath %>/login" class="<%= requestURI.contains("/login") ? isActiveClass : "" %>">Login</a></li>
                <% } %>
            </ul>
        </nav>
    </header>

    <!-- Mobile Bottom Navigation -->
    <nav class="mobile-bottom-nav">
        <a href="<%= contextPath %>/home" class="mobile-nav-item <%= requestURI.contains("/home") ? "active" : "" %>">
            <svg class="mobile-nav-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                <polyline points="9 22 9 12 15 12 15 22"></polyline>
            </svg>
            <span>Home</span>
        </a>
        <a href="<%= contextPath %>/home" class="mobile-nav-item">
            <svg class="mobile-nav-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
            <span>Search</span>
        </a>
        <% if (user != null) { %>
            <a href="<%= contextPath %>/favorites" class="mobile-nav-item <%= requestURI.contains("/favorites") ? "active" : "" %>">
                <svg class="mobile-nav-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                </svg>
                <span>Favourites</span>
            </a>
            <a href="<%= contextPath %>/cart" class="mobile-nav-item <%= requestURI.contains("/cart") ? "active" : "" %>">
                <svg class="mobile-nav-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                </svg>
                <span>Cart</span>
            </a>
            <a href="<%= contextPath %>/orders" class="mobile-nav-item <%= requestURI.contains("/orders") ? "active" : "" %>">
                <svg class="mobile-nav-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
                    <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                    <line x1="12" y1="22.08" x2="12" y2="12"></line>
                </svg>
                <span>Orders</span>
            </a>
        <% } else { %>
            <a href="<%= contextPath %>/login" class="mobile-nav-item">
                <svg class="mobile-nav-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                    <circle cx="12" cy="7" r="4"></circle>
                </svg>
                <span>Profile</span>
            </a>
        <% } %>
    </nav>

    <main id="main-content">
