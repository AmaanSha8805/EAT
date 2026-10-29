<%@ include file="header.jsp" %>

<section class="auth-section">
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <h1 class="auth-title">Welcome back!</h1>
                <p class="auth-subtitle">Sign in to continue to EAT</p>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <% if (request.getAttribute("success") != null) { %>
                <div class="alert alert-success">
                    <%= request.getAttribute("success") %>
                </div>
            <% } %>

            <!-- Login Form -->
            <form id="loginForm" action="<%= request.getContextPath() %>/login" method="POST" class="auth-form">
                <input type="hidden" name="action" value="login">

                <div class="form-group">
                    <label class="form-label" for="loginEmail">Email</label>
                    <input type="email" id="loginEmail" name="email" class="form-control" required placeholder="Enter your email">
                </div>

                <div class="form-group">
                    <label class="form-label" for="loginPassword">Password</label>
                    <input type="password" id="loginPassword" name="password" class="form-control" required placeholder="Enter your password">
                </div>

                <button type="submit" class="btn btn-primary btn-full">Login</button>

                <div class="auth-toggle">
                    <span>Don't have an account?</span>
                    <a href="#" id="showRegister" class="auth-link">Create account</a>
                </div>
            </form>

            <!-- Registration Form -->
            <form id="registerForm" action="<%= request.getContextPath() %>/login" method="POST" class="auth-form" style="display: none;">
                <input type="hidden" name="action" value="register">

                <div class="form-group">
                    <label class="form-label" for="regFullName">Full Name</label>
                    <input type="text" id="regFullName" name="fullName" class="form-control" required placeholder="Enter your full name">
                </div>

                <div class="form-group">
                    <label class="form-label" for="regEmail">Email</label>
                    <input type="email" id="regEmail" name="email" class="form-control" required placeholder="Enter your email">
                </div>

                <div class="form-group">
                    <label class="form-label" for="regPassword">Password</label>
                    <input type="password" id="regPassword" name="password" class="form-control" required placeholder="Create a password">
                </div>

                <div class="form-group">
                    <label class="form-label" for="regPhone">Phone (Optional)</label>
                    <input type="tel" id="regPhone" name="phone" class="form-control" placeholder="Enter your phone number">
                </div>

                <div class="form-group">
                    <label class="form-label" for="regAddress">Address (Optional)</label>
                    <textarea id="regAddress" name="address" class="form-control" rows="2" placeholder="Enter your address"></textarea>
                </div>

                <button type="submit" class="btn btn-primary btn-full">Create Account</button>

                <div class="auth-toggle">
                    <span>Already have an account?</span>
                    <a href="#" id="showLogin" class="auth-link">Sign in</a>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('loginForm');
    const registerForm = document.getElementById('registerForm');
    const showRegisterBtn = document.getElementById('showRegister');
    const showLoginBtn = document.getElementById('showLogin');
    const authTitle = document.querySelector('.auth-title');
    const authSubtitle = document.querySelector('.auth-subtitle');

    showRegisterBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loginForm.style.display = 'none';
        registerForm.style.display = 'block';
        authTitle.textContent = 'Create Account';
        authSubtitle.textContent = 'Join EAT and start ordering';
    });

    showLoginBtn.addEventListener('click', function(e) {
        e.preventDefault();
        registerForm.style.display = 'none';
        loginForm.style.display = 'block';
        authTitle.textContent = 'Welcome back!';
        authSubtitle.textContent = 'Sign in to continue to EAT';
    });
});
</script>

<%@ include file="footer.jsp" %>
