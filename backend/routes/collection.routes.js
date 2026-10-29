const express = require('express');
const router = express.Router();
const db = require('../config/db');

// Get special collection
router.get('/:type', async (req, res) => {
  try {
    const { type } = req.params;
    let restaurants = [];

    switch (type) {
      case 'student_friendly':
        const studentResult = await db.query(
          "SELECT * FROM restaurants WHERE is_student_friendly = true AND is_active = true ORDER BY rating DESC"
        );
        restaurants = studentResult.rows;
        break;
      case 'budget_meals':
        const budgetResult = await db.query(
          "SELECT * FROM restaurants WHERE price_range = '$' AND is_active = true ORDER BY rating DESC"
        );
        restaurants = budgetResult.rows;
        break;
      case 'family_feast':
        const familyResult = await db.query(
          "SELECT * FROM restaurants WHERE is_family_special = true AND is_active = true ORDER BY rating DESC"
        );
        restaurants = familyResult.rows;
        break;
      case 'party_packs':
        const partyResult = await db.query(
          "SELECT * FROM restaurants WHERE minimum_order_amount >= 500 AND is_active = true ORDER BY rating DESC"
        );
        restaurants = partyResult.rows;
        break;
      case 'best_offers':
        const offersResult = await db.query(
          "SELECT * FROM restaurants WHERE is_active = true ORDER BY rating DESC LIMIT 10"
        );
        restaurants = offersResult.rows;
        break;
      case 'quick_bites':
        const quickResult = await db.query(
          "SELECT * FROM restaurants WHERE estimated_delivery_time <= 20 AND is_active = true ORDER BY rating DESC"
        );
        restaurants = quickResult.rows;
        break;
      default:
        return res.status(400).json({
          success: false,
          message: 'Invalid collection type'
        });
    }

    res.json({
      success: true,
      collectionType: type,
      restaurants
    });
  } catch (error) {
    console.error('Get collection error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
});

module.exports = router;
