const express = require('express');
const router = express.Router();
const db = require('../config/db');
const auth = require('../middleware/auth.middleware');

// Get user favorites
router.get('/', auth, async (req, res) => {
  try {
    const userId = req.user.userId;

    const result = await db.query(
      `SELECT f.*, r.name as restaurant_name, r.image_url as restaurant_image,
              fi.name as food_name, fi.image_url as food_image
       FROM favorites f
       LEFT JOIN restaurants r ON f.restaurant_id = r.restaurant_id
       LEFT JOIN food_items fi ON f.food_item_id = fi.food_id
       WHERE f.user_id = $1
       ORDER BY f.created_at DESC`,
      [userId]
    );

    res.json({
      success: true,
      favorites: result.rows
    });
  } catch (error) {
    console.error('Get favorites error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
});

// Add restaurant to favorites
router.post('/restaurant/:id', auth, async (req, res) => {
  try {
    const userId = req.user.userId;
    const restaurantId = req.params.id;

    await db.query(
      'INSERT INTO favorites (user_id, restaurant_id) VALUES ($1, $2) ON CONFLICT DO NOTHING',
      [userId, restaurantId]
    );

    res.json({
      success: true,
      message: 'Added to favorites'
    });
  } catch (error) {
    console.error('Add favorite error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
});

// Remove restaurant from favorites
router.delete('/restaurant/:id', auth, async (req, res) => {
  try {
    const userId = req.user.userId;
    const restaurantId = req.params.id;

    await db.query(
      'DELETE FROM favorites WHERE user_id = $1 AND restaurant_id = $2',
      [userId, restaurantId]
    );

    res.json({
      success: true,
      message: 'Removed from favorites'
    });
  } catch (error) {
    console.error('Remove favorite error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
});

module.exports = router;
