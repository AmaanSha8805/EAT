const express = require('express');
const router = express.Router();
const { createOrder, getOrdersByUser, getOrderById } = require('../controllers/order.controller');
const auth = require('../middleware/auth.middleware');

// Create order - allow guest (no auth required for checkout)
// If user is logged in, auth middleware will add req.user; if not, userId will be null
router.post('/', (req, res, next) => {
  // Try to get auth token if present, but don't require it
  const token = req.header('Authorization')?.replace('Bearer ', '');
  if (token) {
    const jwt = require('jsonwebtoken');
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      req.user = decoded;
    } catch (error) {
      // Invalid token, proceed as guest
    }
  }
  next();
}, createOrder);

// Get user orders - requires auth
router.get('/', auth, getOrdersByUser);

// Get order by ID - requires auth
router.get('/:id', auth, getOrderById);

module.exports = router;
