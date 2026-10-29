const express = require('express');
const router = express.Router();
const db = require('../config/db');
const admin = require('../middleware/admin.middleware');

// Get dashboard stats
router.get('/dashboard', admin, async (req, res) => {
  try {
    const restaurantCount = await db.query('SELECT COUNT(*) FROM restaurants WHERE is_active = true');
    const orderCount = await db.query('SELECT COUNT(*) FROM orders');
    const userCount = await db.query('SELECT COUNT(*) FROM users WHERE role = $1', ['customer']);

    res.json({
      success: true,
      stats: {
        restaurants: parseInt(restaurantCount.rows[0].count),
        orders: parseInt(orderCount.rows[0].count),
        users: parseInt(userCount.rows[0].count)
      }
    });
  } catch (error) {
    console.error('Get dashboard error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
});

// Get all orders (admin)
router.get('/orders', admin, async (req, res) => {
  try {
    const result = await db.query(
      `SELECT o.*, r.name as restaurant_name, u.full_name as customer_name
       FROM orders o
       JOIN restaurants r ON o.restaurant_id = r.restaurant_id
       LEFT JOIN users u ON o.user_id = u.user_id
       ORDER BY o.created_at DESC`
    );

    res.json({
      success: true,
      orders: result.rows
    });
  } catch (error) {
    console.error('Get admin orders error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
});

module.exports = router;
