const express = require('express');
const router = express.Router();
const {
  getAllCategories,
  getCategoryById,
  getRestaurantsByCategory
} = require('../controllers/category.controller');

router.get('/', getAllCategories);
router.get('/:id', getCategoryById);
router.get('/:id/restaurants', getRestaurantsByCategory);

module.exports = router;
