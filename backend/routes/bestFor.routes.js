const express = require('express');
const router = express.Router();
const {
  getAllBestFor,
  getBestForById,
  getRestaurantsByBestFor
} = require('../controllers/bestFor.controller');

router.get('/', getAllBestFor);
router.get('/:id', getBestForById);
router.get('/:id/restaurants', getRestaurantsByBestFor);

module.exports = router;
