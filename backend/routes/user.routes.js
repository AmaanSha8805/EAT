const express = require('express');
const router = express.Router();
const db = require('../config/db');
const auth = require('../middleware/auth.middleware');

// Get user profile
router.get('/profile', auth, async (req, res) => {
  try {
    const userId = req.user.userId;

    const result = await db.query(
      'SELECT user_id, full_name, email, phone, address, role FROM users WHERE user_id = $1',
      [userId]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'User not found'
      });
    }

    res.json({
      success: true,
      user: result.rows[0]
    });
  } catch (error) {
    console.error('Get profile error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
});

// Update user profile
router.put('/profile', auth, async (req, res) => {
  try {
    const userId = req.user.userId;
    const { full_name, phone, address } = req.body;

    const result = await db.query(
      'UPDATE users SET full_name = $1, phone = $2, address = $3 WHERE user_id = $4 RETURNING user_id, full_name, email, phone, address, role',
      [full_name, phone, address, userId]
    );

    res.json({
      success: true,
      message: 'Profile updated',
      user: result.rows[0]
    });
  } catch (error) {
    console.error('Update profile error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
});

module.exports = router;
