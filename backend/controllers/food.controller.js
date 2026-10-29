const db = require('../config/db');

// Get food items by restaurant
const getFoodByRestaurant = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      'SELECT * FROM food_items WHERE restaurant_id = $1 AND is_available = true ORDER BY name',
      [id]
    );

    res.json({
      success: true,
      foodItems: result.rows
    });
  } catch (error) {
    console.error('Get food items error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get trending food items
const getTrendingFoodItems = async (req, res) => {
  try {
    const result = await db.query(
      `SELECT fi.*, r.name as restaurant_name
       FROM food_items fi
       JOIN restaurants r ON fi.restaurant_id = r.restaurant_id
       WHERE fi.is_available = true AND fi.is_trending = true
       ORDER BY fi.name
       LIMIT 20`
    );

    res.json({
      success: true,
      foodItems: result.rows
    });
  } catch (error) {
    console.error('Get trending food items error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get all food items
const getAllFoodItems = async (req, res) => {
  try {
    const result = await db.query(
      `SELECT fi.*, r.name as restaurant_name
       FROM food_items fi
       JOIN restaurants r ON fi.restaurant_id = r.restaurant_id
       WHERE fi.is_available = true
       ORDER BY fi.name`
    );

    res.json({
      success: true,
      foodItems: result.rows
    });
  } catch (error) {
    console.error('Get all food items error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get food item by ID
const getFoodById = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      'SELECT * FROM food_items WHERE food_id = $1 AND is_available = true',
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Food item not found'
      });
    }

    res.json({
      success: true,
      foodItem: result.rows[0]
    });
  } catch (error) {
    console.error('Get food item error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

module.exports = {
  getFoodByRestaurant,
  getTrendingFoodItems,
  getAllFoodItems,
  getFoodById
};
