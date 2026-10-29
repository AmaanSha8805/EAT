const express = require('express');
const router = express.Router();
const {
  getFoodByRestaurant,
  getTrendingFoodItems,
  getAllFoodItems,
  getFoodById
} = require('../controllers/food.controller');

router.get('/trending', getTrendingFoodItems);
router.get('/all', getAllFoodItems);
router.get('/restaurant/:id', getFoodByRestaurant);
router.get('/:id', getFoodById);

module.exports = router;
