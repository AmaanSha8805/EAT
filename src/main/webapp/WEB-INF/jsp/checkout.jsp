<%@ page import="com.eat.model.CartItem, com.eat.model.User" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<% List<CartItem> cart = (List<CartItem>) request.getAttribute("cart"); %>
<% double total = (Double) request.getAttribute("total"); %>
<% User user = (User) request.getAttribute("user"); %>

<style>
.payment-section {
    margin-top: var(--spacing-xl);
}

.payment-methods {
    display: grid;
    gap: var(--spacing-md);
}

.payment-option {
    border: 2px solid var(--gray-200);
    border-radius: var(--radius-lg);
    padding: var(--spacing-lg);
    cursor: pointer;
    transition: all var(--transition-normal);
    background: var(--white);
}

.payment-option:hover {
    border-color: var(--primary-orange);
    box-shadow: var(--shadow-sm);
}

.payment-option.selected {
    border-color: var(--primary-orange);
    background: var(--primary-orange-bg);
}

.payment-option-header {
    display: flex;
    align-items: center;
    gap: var(--spacing-md);
}

.payment-option-icon {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: var(--gray-100);
    border-radius: var(--radius-md);
    font-size: 1.25rem;
}

.payment-option-title {
    font-weight: 600;
    font-size: 1rem;
    color: var(--charcoal);
}

.payment-option-desc {
    font-size: 0.875rem;
    color: var(--gray-500);
    margin-top: var(--spacing-xs);
}

.payment-option-details {
    margin-top: var(--spacing-lg);
    padding-top: var(--spacing-lg);
    border-top: 1px solid var(--gray-200);
    display: none;
}

.payment-option.selected .payment-option-details {
    display: block;
}

.form-group {
    margin-bottom: var(--spacing-lg);
}

.form-label {
    display: block;
    font-weight: 500;
    margin-bottom: var(--spacing-sm);
    color: var(--charcoal);
}

.form-control {
    width: 100%;
    padding: var(--spacing-md);
    border: 1px solid var(--gray-300);
    border-radius: var(--radius-md);
    font-size: 1rem;
    transition: border-color var(--transition-normal);
}

.form-control:focus {
    outline: none;
    border-color: var(--primary-orange);
}

.payment-apps {
    display: flex;
    gap: var(--spacing-md);
    flex-wrap: wrap;
}

.payment-app-option {
    flex: 1;
    min-width: 100px;
    padding: var(--spacing-md);
    border: 2px solid var(--gray-200);
    border-radius: var(--radius-md);
    text-align: center;
    cursor: pointer;
    transition: all var(--transition-normal);
}

.payment-app-option:hover {
    border-color: var(--primary-orange);
}

.payment-app-option.selected {
    border-color: var(--primary-orange);
    background: var(--primary-orange-bg);
}

.card-inputs {
    display: grid;
    grid-template-columns: 2fr 1fr 1fr;
    gap: var(--spacing-md);
}

.bank-select {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    gap: var(--spacing-md);
}

.bank-option {
    padding: var(--spacing-md);
    border: 2px solid var(--gray-200);
    border-radius: var(--radius-md);
    text-align: center;
    cursor: pointer;
    transition: all var(--transition-normal);
    font-size: 0.875rem;
}

.bank-option:hover {
    border-color: var(--primary-orange);
}

.bank-option.selected {
    border-color: var(--primary-orange);
    background: var(--primary-orange-bg);
}

.secure-badge {
    display: inline-flex;
    align-items: center;
    gap: var(--spacing-sm);
    padding: var(--spacing-sm) var(--spacing-md);
    background: var(--success-bg);
    color: var(--success);
    border-radius: var(--radius-full);
    font-size: 0.875rem;
    font-weight: 500;
    margin-top: var(--spacing-md);
}

.order-summary-card {
    position: sticky;
    top: var(--spacing-xl);
}

.total-amount {
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--charcoal);
}

@media (max-width: 768px) {
    .card-inputs {
        grid-template-columns: 1fr;
    }
}
</style>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>Checkout</h2>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <div class="row">
            <div class="col-7">
                <div class="card">
                    <div class="card-body">
                        <h3>Delivery Details</h3>
                        <form action="<%= request.getContextPath() %>/checkout" method="POST" id="checkoutForm">
                            <% if (user == null) { %>
                            <div class="form-group">
                                <label class="form-label">Your Name *</label>
                                <input type="text" name="guestName" class="form-control" required placeholder="Enter your name">
                            </div>
                            <% } %>

                            <div class="form-group">
                                <label class="form-label">Delivery Address *</label>
                                <textarea name="deliveryAddress" class="form-control" rows="3" required><%= user != null && user.getAddress() != null ? user.getAddress() : "" %></textarea>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Delivery Phone *</label>
                                <input type="tel" name="deliveryPhone" class="form-control" required value="<%= user != null && user.getPhone() != null ? user.getPhone() : "" %>">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Special Instructions (Optional)</label>
                                <textarea name="specialInstructions" class="form-control" rows="2" placeholder="Any special requests..."></textarea>
                            </div>

                            <div class="payment-section">
                                <h3>Payment Method</h3>

                                <div class="payment-methods">
                                    <!-- Cash on Delivery -->
                                    <div class="payment-option selected" data-method="cod">
                                        <div class="payment-option-header">
                                            <input type="radio" name="paymentMethod" value="cod" checked style="display: none;">
                                            <div class="payment-option-icon">💵</div>
                                            <div>
                                                <div class="payment-option-title">Cash on Delivery</div>
                                                <div class="payment-option-desc">Pay when your order arrives</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- UPI -->
                                    <div class="payment-option" data-method="upi">
                                        <div class="payment-option-header">
                                            <input type="radio" name="paymentMethod" value="upi" style="display: none;">
                                            <div class="payment-option-icon">📱</div>
                                            <div>
                                                <div class="payment-option-title">UPI Payment</div>
                                                <div class="payment-option-desc">Pay using PhonePe, GPay, Paytm</div>
                                            </div>
                                        </div>
                                        <div class="payment-option-details">
                                            <div class="form-group">
                                                <label class="form-label">Select UPI App</label>
                                                <div class="payment-apps">
                                                    <div class="payment-app-option" data-app="phonepe">PhonePe</div>
                                                    <div class="payment-app-option" data-app="gpay">Google Pay</div>
                                                    <div class="payment-app-option" data-app="paytm">Paytm</div>
                                                    <div class="payment-app-option" data-app="other">Other</div>
                                                </div>
                                                <input type="hidden" name="upiApp" id="upiApp" value="">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">UPI ID *</label>
                                                <input type="text" name="upiId" class="form-control" placeholder="e.g., mobile@upi">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Card Payment -->
                                    <div class="payment-option" data-method="card">
                                        <div class="payment-option-header">
                                            <input type="radio" name="paymentMethod" value="card" style="display: none;">
                                            <div class="payment-option-icon">💳</div>
                                            <div>
                                                <div class="payment-option-title">Card Payment</div>
                                                <div class="payment-option-desc">Credit or Debit Card</div>
                                            </div>
                                        </div>
                                        <div class="payment-option-details">
                                            <div class="form-group">
                                                <label class="form-label">Card Type</label>
                                                <div class="payment-apps">
                                                    <div class="payment-app-option selected" data-card="credit">Credit Card</div>
                                                    <div class="payment-app-option" data-card="debit">Debit Card</div>
                                                </div>
                                                <input type="hidden" name="cardType" id="cardType" value="credit">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Card Number *</label>
                                                <input type="text" name="cardNumber" class="form-control" placeholder="1234 5678 9012 3456" maxlength="19">
                                            </div>
                                            <div class="card-inputs">
                                                <div class="form-group">
                                                    <label class="form-label">Expiry *</label>
                                                    <input type="text" name="cardExpiry" class="form-control" placeholder="MM/YY" maxlength="5">
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-label">CVV *</label>
                                                    <input type="password" name="cardCvv" class="form-control" placeholder="123" maxlength="4">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Net Banking -->
                                    <div class="payment-option" data-method="net_banking">
                                        <div class="payment-option-header">
                                            <input type="radio" name="paymentMethod" value="net_banking" style="display: none;">
                                            <div class="payment-option-icon">🏦</div>
                                            <div>
                                                <div class="payment-option-title">Net Banking</div>
                                                <div class="payment-option-desc">Pay directly from your bank account</div>
                                            </div>
                                        </div>
                                        <div class="payment-option-details">
                                            <div class="form-group">
                                                <label class="form-label">Select Your Bank</label>
                                                <div class="bank-select">
                                                    <div class="bank-option" data-bank="SBI">State Bank of India</div>
                                                    <div class="bank-option" data-bank="HDFC">HDFC Bank</div>
                                                    <div class="bank-option" data-bank="ICICI">ICICI Bank</div>
                                                    <div class="bank-option" data-bank="Axis">Axis Bank</div>
                                                    <div class="bank-option" data-bank="Kotak">Kotak Bank</div>
                                                    <div class="bank-option" data-bank="PNB">PNB</div>
                                                </div>
                                                <input type="hidden" name="bankName" id="bankName" value="">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="secure-badge">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                    </svg>
                                    100% Secure Payments
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 mt-4" style="padding: var(--spacing-lg); font-size: 1.1rem;">
                                Place Order - ₹<%= total + 30 %>
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-5">
                <div class="card order-summary-card">
                    <div class="card-body">
                        <h3>Order Summary</h3>
                        <% for (CartItem item : cart) { %>
                        <div class="cart-item" style="padding: var(--spacing-sm); margin-bottom: var(--spacing-sm);">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h4 style="font-size: 1rem;"><%= item.getFoodName() %></h4>
                                    <p class="text-muted" style="font-size: 0.875rem;">Qty: <%= item.getQuantity() %></p>
                                </div>
                                <span class="food-price">₹<%= item.getSubtotal() %></span>
                            </div>
                        </div>
                        <% } %>

                        <div class="cart-total-row mt-3">
                            <span>Subtotal</span>
                            <span>₹<%= total %></span>
                        </div>
                        <div class="cart-total-row">
                            <span>Delivery Fee</span>
                            <span>₹30</span>
                        </div>
                        <div class="cart-total-row total">
                            <span>Total</span>
                            <span class="total-amount">₹<%= total + 30 %></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Payment option selection
    const paymentOptions = document.querySelectorAll('.payment-option');
    const paymentMethodInputs = document.querySelectorAll('input[name="paymentMethod"]');

    paymentOptions.forEach(option => {
        option.addEventListener('click', function() {
            const method = this.dataset.method;

            // Remove selected class from all options
            paymentOptions.forEach(opt => opt.classList.remove('selected'));

            // Add selected class to clicked option
            this.classList.add('selected');

            // Update radio button
            paymentMethodInputs.forEach(input => {
                input.checked = (input.value === method);
            });
        });
    });

    // UPI app selection
    const upiAppOptions = document.querySelectorAll('.payment-app-option[data-app]');
    const upiAppInput = document.getElementById('upiApp');

    upiAppOptions.forEach(option => {
        option.addEventListener('click', function() {
            upiAppOptions.forEach(opt => opt.classList.remove('selected'));
            this.classList.add('selected');
            upiAppInput.value = this.dataset.app;
        });
    });

    // Card type selection
    const cardTypeOptions = document.querySelectorAll('.payment-app-option[data-card]');
    const cardTypeInput = document.getElementById('cardType');

    cardTypeOptions.forEach(option => {
        option.addEventListener('click', function() {
            cardTypeOptions.forEach(opt => opt.classList.remove('selected'));
            this.classList.add('selected');
            cardTypeInput.value = this.dataset.card;
        });
    });

    // Bank selection
    const bankOptions = document.querySelectorAll('.bank-option');
    const bankNameInput = document.getElementById('bankName');

    bankOptions.forEach(option => {
        option.addEventListener('click', function() {
            bankOptions.forEach(opt => opt.classList.remove('selected'));
            this.classList.add('selected');
            bankNameInput.value = this.dataset.bank;
        });
    });

    // Card number formatting
    const cardNumberInput = document.querySelector('input[name="cardNumber"]');
    if (cardNumberInput) {
        cardNumberInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\s/g, '').replace(/\D/g, '');
            let formattedValue = value.match(/.{1,4}/g)?.join(' ') || value;
            e.target.value = formattedValue;
        });
    }

    // Expiry date formatting
    const cardExpiryInput = document.querySelector('input[name="cardExpiry"]');
    if (cardExpiryInput) {
        cardExpiryInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length >= 2) {
                value = value.substring(0, 2) + '/' + value.substring(2);
            }
            e.target.value = value;
        });
    }
});
</script>

<%@ include file="footer.jsp" %>
