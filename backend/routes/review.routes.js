const express = require('express');
const router = express.Router();
const reviewController = require('../controllers/review.controller');
const authMiddleware = require('../middleware/auth.middleware');

// Get reviews for a restaurant
router.get('/restaurant/:id', reviewController.getRestaurantReviews);

// Get rating distribution for a restaurant
router.get('/restaurant/:id/distribution', reviewController.getRatingDistribution);

// Check if user can review a restaurant
router.get('/restaurant/:id/can-review', authMiddleware, reviewController.checkCanReview);

// Submit a review for a restaurant
router.post('/restaurant/:id', authMiddleware, reviewController.submitReview);

module.exports = router;
