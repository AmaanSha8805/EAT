// EAT - Explore Amazing Taste
// Main JavaScript file for interactive features

document.addEventListener('DOMContentLoaded', function() {
    // Initialize all interactive features
    initSearch();
    initCartAnimations();
    initSmoothScroll();
    initFormValidation();
    initMobileMenu();
    initScrollReveal();
    initStaggeredCards();
    initCategoryCarousel();
    initHeaderScroll();
});

// Search functionality
function initSearch() {
    const searchInput = document.querySelector('.search-input');
    const searchForm = document.querySelector('.search-container form');

    if (searchForm) {
        searchForm.addEventListener('submit', function(e) {
            const query = searchInput.value.trim();
            if (!query) {
                e.preventDefault();
                searchInput.focus();
            }
        });
    }
}

// Cart animations
function initCartAnimations() {
    const cartItems = document.querySelectorAll('.cart-item');
    cartItems.forEach((item, index) => {
        item.style.animationDelay = `${index * 0.1}s`;
        item.classList.add('fade-in');
    });
}

// Smooth scroll for anchor links
function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href !== '#') {
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            }
        });
    });
}

// Form validation - only validate forms that explicitly have data-validate attribute
// or are login/checkout forms (not cart action forms or search forms)
function initFormValidation() {
    const forms = document.querySelectorAll('form[data-validate="true"]');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            const requiredFields = form.querySelectorAll('[required]');
            let isValid = true;

            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    isValid = false;
                    field.classList.add('is-invalid');

                    field.addEventListener('input', function() {
                        this.classList.remove('is-invalid');
                    }, { once: true });
                }
            });

            if (!isValid) {
                e.preventDefault();
                showNotification('Please fill in all required fields', 'error');
            }
        });
    });
}

// Mobile menu toggle
function initMobileMenu() {
    const navToggle = document.querySelector('.nav-toggle');
    const navLinks = document.querySelector('.nav-links');

    if (navToggle && navLinks) {
        navToggle.addEventListener('click', function() {
            const isExpanded = this.getAttribute('aria-expanded') === 'true';
            this.setAttribute('aria-expanded', !isExpanded);
            navLinks.classList.toggle('active');
        });

        // Close menu when clicking a link
        navLinks.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function() {
                navLinks.classList.remove('active');
                navToggle.setAttribute('aria-expanded', 'false');
            });
        });

        // Close menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!navToggle.contains(e.target) && !navLinks.contains(e.target)) {
                navLinks.classList.remove('active');
                navToggle.setAttribute('aria-expanded', 'false');
            }
        });
    }
}

// Header scroll effect
function initHeaderScroll() {
    const header = document.querySelector('header');
    if (header) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                header.style.boxShadow = 'var(--shadow-md)';
            } else {
                header.style.boxShadow = 'var(--shadow-sm)';
            }
        });
    }
}

// Category carousel functionality
function initCategoryCarousel() {
    const carousel = document.querySelector('.category-carousel');
    if (carousel) {
        let isDown = false;
        let startX;
        let scrollLeft;

        carousel.addEventListener('mousedown', (e) => {
            isDown = true;
            carousel.style.cursor = 'grabbing';
            startX = e.pageX - carousel.offsetLeft;
            scrollLeft = carousel.scrollLeft;
        });

        carousel.addEventListener('mouseleave', () => {
            isDown = false;
            carousel.style.cursor = 'grab';
        });

        carousel.addEventListener('mouseup', () => {
            isDown = false;
            carousel.style.cursor = 'grab';
        });

        carousel.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();
            const x = e.pageX - carousel.offsetLeft;
            const walk = (x - startX) * 2;
            carousel.scrollLeft = scrollLeft - walk;
        });
    }
}

// Show notification
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `alert alert-${type}`;
    notification.textContent = message;
    notification.style.position = 'fixed';
    notification.style.top = '20px';
    notification.style.right = '20px';
    notification.style.zIndex = '9999';
    notification.style.animation = 'fadeIn 0.3s ease';

    document.body.appendChild(notification);

    setTimeout(() => {
        notification.style.animation = 'fadeOut 0.3s ease';
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 3000);
}

// Quantity controls for cart
function updateQuantity(foodId, change) {
    const form = document.querySelector(`form input[name="foodId"][value="${foodId}"]`).closest('form');
    const actionInput = form.querySelector('input[name="action"]');
    const quantityInput = form.querySelector('input[name="quantity"]');

    if (quantityInput) {
        let newQuantity = parseInt(quantityInput.value) + change;
        if (newQuantity < 1) newQuantity = 1;
        quantityInput.value = newQuantity;
        actionInput.value = 'update';
        form.submit();
    }
}

// Confirm before destructive actions
function confirmAction(message) {
    return confirm(message);
}

// Loading state helper
function showLoading(element) {
    element.disabled = true;
    element.dataset.originalText = element.textContent;
    element.textContent = 'Loading...';
}

function hideLoading(element) {
    element.disabled = false;
    element.textContent = element.dataset.originalText;
}

// Image error handler
function handleImageError(img) {
    img.onerror = null;
    img.src = 'https://via.placeholder.com/300x200?text=Image+Not+Available';
}

// Add error handlers to all images
document.addEventListener('DOMContentLoaded', function() {
    const images = document.querySelectorAll('img');
    images.forEach(img => {
        img.onerror = function() {
            handleImageError(this);
        };
    });
});

// Dynamic category filtering
function filterByCategory(categoryId) {
    const url = new URL(window.location);
    url.searchParams.set('category', categoryId);
    window.location.href = url.toString();
}

// Dynamic best-for filtering
function filterByBestFor(bestForId) {
    const url = new URL(window.location);
    url.searchParams.set('bestFor', bestForId);
    window.location.href = url.toString();
}

// Clear filters
function clearFilters() {
    const url = new URL(window.location);
    url.searchParams.delete('category');
    url.searchParams.delete('bestFor');
    url.searchParams.delete('search');
    window.location.href = url.toString();
}

// Add to cart with animation
function addToCart(foodId) {
    const button = document.querySelector(`button[onclick*="${foodId}"]`);
    if (button) {
        showLoading(button);
        setTimeout(() => {
            hideLoading(button);
            showNotification('Item added to cart!', 'success');
        }, 500);
    }
}

// Update cart badge
function updateCartBadge(count) {
    const cartLink = document.querySelector('a[href="/cart"]');
    if (cartLink && count > 0) {
        const badge = document.createElement('span');
        badge.className = 'badge badge-trending';
        badge.textContent = count;
        badge.style.marginLeft = '5px';
        cartLink.appendChild(badge);
    }
}

// Price formatter
function formatPrice(price) {
    return '₹' + parseFloat(price).toFixed(2);
}

// Rating star display
function displayRating(rating) {
    const fullStars = Math.floor(rating);
    const hasHalfStar = rating % 1 >= 0.5;
    let stars = '';

    for (let i = 0; i < fullStars; i++) {
        stars += '★';
    }
    if (hasHalfStar) {
        stars += '½';
    }
    for (let i = fullStars + (hasHalfStar ? 1 : 0); i < 5; i++) {
        stars += '☆';
    }

    return stars;
}

// Export functions for use in JSP pages
window.EAT = {
    updateQuantity,
    confirmAction,
    showLoading,
    hideLoading,
    filterByCategory,
    filterByBestFor,
    clearFilters,
    addToCart,
    updateCartBadge,
    formatPrice,
    displayRating,
    showNotification
};

// Scroll Reveal Animation
function initScrollReveal() {
    // Check for reduced motion preference
    const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    if (prefersReducedMotion) {
        // Disable animations for users who prefer reduced motion
        document.querySelectorAll('.reveal').forEach(el => {
            el.classList.add('active');
        });
        return;
    }

    const revealElements = document.querySelectorAll('.reveal');

    const revealObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('active');
                revealObserver.unobserve(entry.target);
            }
        });
    }, {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    });

    revealElements.forEach(el => revealObserver.observe(el));
}

// Staggered Card Animation
function initStaggeredCards() {
    // Check for reduced motion preference
    const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    if (prefersReducedMotion) {
        // Disable animations for users who prefer reduced motion
        document.querySelectorAll('.card-stagger').forEach(el => {
            el.classList.add('active');
        });
        return;
    }

    const cardElements = document.querySelectorAll('.card-stagger');

    const cardObserver = new IntersectionObserver((entries) => {
        entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
                // Add staggered delay based on index
                setTimeout(() => {
                    entry.target.classList.add('active');
                }, index * 100);
                cardObserver.unobserve(entry.target);
            }
        });
    }, {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    });

    cardElements.forEach(el => cardObserver.observe(el));
}
