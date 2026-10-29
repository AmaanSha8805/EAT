const db = require('../config/db');

// Get all categories
const getAllCategories = async (req, res) => {
  try {
    const result = await db.query(
      'SELECT * FROM categories ORDER BY name'
    );

    res.json({
      success: true,
      categories: result.rows
    });
  } catch (error) {
    console.error('Get categories error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get category by ID
const getCategoryById = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      'SELECT * FROM categories WHERE category_id = $1',
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Category not found'
      });
    }

    res.json({
      success: true,
      category: result.rows[0]
    });
  } catch (error) {
    console.error('Get category error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get restaurants by category
const getRestaurantsByCategory = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      `SELECT DISTINCT r.* FROM restaurants r
       JOIN restaurant_categories rc ON r.restaurant_id = rc.restaurant_id
       WHERE rc.category_id = $1 AND r.is_active = true
       ORDER BY r.rating DESC`,
      [id]
    );

    res.json({
      success: true,
      restaurants: result.rows
    });
  } catch (error) {
    console.error('Get restaurants by category error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

module.exports = {
  getAllCategories,
  getCategoryById,
  getRestaurantsByCategory
};
