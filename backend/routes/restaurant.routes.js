const express = require('express');
const router = express.Router();
const {
  getAllRestaurants,
  getRestaurantById,
  getTrendingRestaurants,
  getPureVegRestaurants
} = require('../controllers/restaurant.controller');

router.get('/', getAllRestaurants);
router.get('/trending', getTrendingRestaurants);
router.get('/pure-veg', getPureVegRestaurants);
router.get('/:id', getRestaurantById);

module.exports = router;
