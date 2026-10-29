const db = require('../config/db');

// Get all best for categories
const getAllBestFor = async (req, res) => {
  try {
    const result = await db.query(
      'SELECT * FROM best_for_categories ORDER BY name'
    );

    res.json({
      success: true,
      bestForCategories: result.rows
    });
  } catch (error) {
    console.error('Get best for categories error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get best for by ID
const getBestForById = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      'SELECT * FROM best_for_categories WHERE best_for_id = $1',
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Best for category not found'
      });
    }

    res.json({
      success: true,
      bestFor: result.rows[0]
    });
  } catch (error) {
    console.error('Get best for error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get restaurants by best for
const getRestaurantsByBestFor = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      `SELECT DISTINCT r.* FROM restaurants r
       JOIN restaurant_best_for rbf ON r.restaurant_id = rbf.restaurant_id
       WHERE rbf.best_for_id = $1 AND r.is_active = true
       ORDER BY r.rating DESC`,
      [id]
    );

    res.json({
      success: true,
      restaurants: result.rows
    });
  } catch (error) {
    console.error('Get restaurants by best for error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

module.exports = {
  getAllBestFor,
  getBestForById,
  getRestaurantsByBestFor
};
