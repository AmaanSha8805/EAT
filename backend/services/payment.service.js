/**
 * Payment Service
 * Handles payment validation and simulated payment processing for the EAT React + Express application
 * For this college project, payments are simulated for demonstration purposes
 * In production, this would integrate with actual payment gateways like Razorpay, Stripe, etc.
 */

class PaymentService {
  /**
   * Process payment based on the selected payment method
   * For COD: Mark as pending (pay on delivery)
   * For UPI/Card/Net Banking: Simulate payment processing
   *
   * @param {Object} paymentData - Payment details
   * @returns {Object} Payment processing result
   */
  async processPayment(paymentData) {
    const { payment_method, upi_id, upi_app, card_number, card_expiry, card_cvv, card_type, bank_name } = paymentData;

    switch (payment_method) {
      case 'cod':
        return this.processCODPayment();

      case 'upi':
        return this.processUPIPayment(upi_id, upi_app);

      case 'card':
        return this.processCardPayment(card_number, card_expiry, card_cvv, card_type);

      case 'net_banking':
        return this.processNetBankingPayment(bank_name);

      case 'online':
        // Legacy 'online' payment method - treat as simulated
        return this.processSimulatedPayment();

      default:
        return {
          success: false,
          payment_status: 'failed',
          error: 'Invalid payment method'
        };
    }
  }

  /**
   * Process COD payment
   */
  processCODPayment() {
    return {
      success: true,
      payment_status: 'pending',
      payment_transaction_id: null,
      payment_gateway_response: null
    };
  }

  /**
   * Process UPI payment (simulated)
   */
  processUPIPayment(upiId, upiApp) {
    // Validate UPI ID
    if (!upiId || !upiId.trim() || !this.validateUPIId(upiId)) {
      return {
        success: false,
        payment_status: 'failed',
        error: 'Invalid UPI ID. Please enter a valid UPI ID (e.g., mobile@upi)'
      };
    }

    // Generate transaction ID
    const transactionId = this.generateTransactionId('UPI');

    // Simulate payment processing (90% success rate for demo)
    const success = this.simulatePaymentSuccess();

    if (success) {
      return {
        success: true,
        payment_status: 'paid',
        payment_transaction_id: transactionId,
        payment_gateway_response: JSON.stringify({
          status: 'success',
          transaction_id: transactionId,
          upi_app: upiApp
        })
      };
    } else {
      return {
        success: false,
        payment_status: 'failed',
        payment_transaction_id: transactionId,
        payment_gateway_response: JSON.stringify({
          status: 'failed',
          error: 'Payment failed',
          transaction_id: transactionId
        })
      };
    }
  }

  /**
   * Process card payment (simulated)
   */
  processCardPayment(cardNumber, cardExpiry, cardCvv, cardType) {
    // Validate card details
    if (!cardNumber || !this.validateCardNumber(cardNumber)) {
      return {
        success: false,
        payment_status: 'failed',
        error: 'Invalid card number. Please enter a valid card number (13-19 digits)'
      };
    }

    if (!cardExpiry || !this.validateExpiryDate(cardExpiry)) {
      return {
        success: false,
        payment_status: 'failed',
        error: 'Invalid expiry date. Please use MM/YY format'
      };
    }

    if (!cardCvv || !this.validateCVV(cardCvv)) {
      return {
        success: false,
        payment_status: 'failed',
        error: 'Invalid CVV. Please enter a valid CVV (3-4 digits)'
      };
    }

    // Generate transaction ID
    const transactionId = this.generateTransactionId('CARD');

    // Simulate payment processing (90% success rate for demo)
    const success = this.simulatePaymentSuccess();

    // Store only last 4 digits for security
    const cleanedCardNumber = cardNumber.replace(/\s/g, '').replace(/-/g, '');
    const cardLastFour = cleanedCardNumber.slice(-4);

    if (success) {
      return {
        success: true,
        payment_status: 'paid',
        payment_transaction_id: transactionId,
        card_last_four: cardLastFour,
        payment_gateway_response: JSON.stringify({
          status: 'success',
          transaction_id: transactionId,
          card_type: cardType
        })
      };
    } else {
      return {
        success: false,
        payment_status: 'failed',
        payment_transaction_id: transactionId,
        card_last_four: cardLastFour,
        payment_gateway_response: JSON.stringify({
          status: 'failed',
          error: 'Payment declined',
          transaction_id: transactionId
        })
      };
    }
  }

  /**
   * Process net banking payment (simulated)
   */
  processNetBankingPayment(bankName) {
    // Validate bank name
    if (!bankName || !bankName.trim()) {
      return {
        success: false,
        payment_status: 'failed',
        error: 'Please select a bank'
      };
    }

    // Generate transaction ID
    const transactionId = this.generateTransactionId('NB');

    // Simulate payment processing (90% success rate for demo)
    const success = this.simulatePaymentSuccess();

    if (success) {
      return {
        success: true,
        payment_status: 'paid',
        payment_transaction_id: transactionId,
        payment_gateway_response: JSON.stringify({
          status: 'success',
          transaction_id: transactionId,
          bank_name: bankName
        })
      };
    } else {
      return {
        success: false,
        payment_status: 'failed',
        payment_transaction_id: transactionId,
        payment_gateway_response: JSON.stringify({
          status: 'failed',
          error: 'Bank authorization failed',
          transaction_id: transactionId
        })
      };
    }
  }

  /**
   * Process simulated payment (for legacy 'online' method)
   */
  processSimulatedPayment() {
    // Generate transaction ID
    const transactionId = this.generateTransactionId('SIM');

    // Simulate payment processing (always success for demo)
    return {
      success: true,
      payment_status: 'paid',
      payment_transaction_id: transactionId,
      payment_gateway_response: JSON.stringify({
        status: 'success',
        transaction_id: transactionId
      })
    };
  }

  /**
   * Generate a unique transaction ID
   */
  generateTransactionId(prefix) {
    const timestamp = Date.now();
    const random = Math.random().toString(36).substring(2, 10).toUpperCase();
    return `${prefix}_${timestamp}_${random}`;
  }

  /**
   * Simulate payment success/failure for demo purposes
   * 90% success rate to demonstrate both scenarios
   */
  simulatePaymentSuccess() {
    // For demonstration, return true 90% of the time
    // In production, this would be replaced with actual payment gateway integration
    return Math.random() < 0.9;
  }

  /**
   * Validate UPI ID format
   */
  validateUPIId(upiId) {
    if (!upiId || !upiId.trim()) {
      return false;
    }
    // Basic UPI ID validation: should contain @
    return upiId.includes('@');
  }

  /**
   * Validate card number (basic validation)
   */
  validateCardNumber(cardNumber) {
    if (!cardNumber || !cardNumber.trim()) {
      return false;
    }
    // Remove spaces and dashes
    const cleaned = cardNumber.replace(/[\s-]/g, '');
    // Basic check: should be 13-19 digits
    return /^\d{13,19}$/.test(cleaned);
  }

  /**
   * Validate CVV
   */
  validateCVV(cvv) {
    if (!cvv || !cvv.trim()) {
      return false;
    }
    // CVV should be 3 or 4 digits
    return /^\d{3,4}$/.test(cvv);
  }

  /**
   * Validate expiry date format (MM/YY)
   */
  validateExpiryDate(expiry) {
    if (!expiry || !expiry.trim()) {
      return false;
    }
    // Should match MM/YY format
    return /^(0[1-9]|1[0-2])\/\d{2}$/.test(expiry);
  }

  /**
   * Get display name for payment method
   */
  getPaymentMethodName(paymentMethod) {
    const names = {
      'cod': 'Cash on Delivery',
      'upi': 'UPI',
      'card': 'Card Payment',
      'net_banking': 'Net Banking',
      'online': 'Online Payment'
    };
    return names[paymentMethod] || paymentMethod;
  }

  /**
   * Get display name for payment status
   */
  getPaymentStatusName(paymentStatus) {
    const names = {
      'pending': 'Pending',
      'paid': 'Paid',
      'failed': 'Failed'
    };
    return names[paymentStatus] || paymentStatus;
  }
}

module.exports = new PaymentService();
