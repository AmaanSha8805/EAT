const db = require('../config/db');

// Get all restaurants with optional filters
const getAllRestaurants = async (req, res) => {
  try {
    const { search, pureVeg, cuisine, category, bestFor } = req.query;

    let query = `
      SELECT r.*, array_agg(DISTINCT c.name) as categories, r.estimated_delivery_time as delivery_time
      FROM restaurants r
      LEFT JOIN restaurant_categories rc ON r.restaurant_id = rc.restaurant_id
      LEFT JOIN categories c ON rc.category_id = c.category_id
      WHERE r.is_active = true
    `;
    const params = [];
    let paramCount = 0;

    if (search) {
      paramCount++;
      query += ` AND (r.name ILIKE $${paramCount} OR r.cuisine_type ILIKE $${paramCount})`;
      params.push(`%${search}%`);
    }

    if (pureVeg === 'true') {
      paramCount++;
      query += ` AND r.is_pure_veg = true`;
    }

    if (cuisine) {
      paramCount++;
      query += ` AND r.cuisine_type = $${paramCount}`;
      params.push(cuisine);
    }

    if (category) {
      paramCount++;
      query += ` AND EXISTS (
        SELECT 1 FROM restaurant_categories rc2
        WHERE rc2.restaurant_id = r.restaurant_id AND rc2.category_id = $${paramCount}
      )`;
      params.push(category);
    }

    if (bestFor) {
      paramCount++;
      query += ` AND EXISTS (
        SELECT 1 FROM restaurant_best_for rbf
        WHERE rbf.restaurant_id = r.restaurant_id AND rbf.best_for_id = $${paramCount}
      )`;
      params.push(bestFor);
    }

    query += ` GROUP BY r.restaurant_id ORDER BY r.rating DESC`;

    const result = await db.query(query, params);

    res.json({
      success: true,
      restaurants: result.rows
    });
  } catch (error) {
    console.error('Get restaurants error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get restaurant by ID
const getRestaurantById = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      'SELECT *, estimated_delivery_time as delivery_time FROM restaurants WHERE restaurant_id = $1 AND is_active = true',
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Restaurant not found'
      });
    }

    res.json({
      success: true,
      restaurant: result.rows[0]
    });
  } catch (error) {
    console.error('Get restaurant error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get trending restaurants
const getTrendingRestaurants = async (req, res) => {
  try {
    const result = await db.query(
      `SELECT * FROM restaurants
       WHERE is_active = true
       ORDER BY rating DESC
       LIMIT 20`
    );

    res.json({
      success: true,
      restaurants: result.rows
    });
  } catch (error) {
    console.error('Get trending restaurants error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get pure veg restaurants
const getPureVegRestaurants = async (req, res) => {
  try {
    const result = await db.query(
      `SELECT * FROM restaurants
       WHERE is_active = true AND is_pure_veg = true
       ORDER BY rating DESC`
    );

    res.json({
      success: true,
      restaurants: result.rows
    });
  } catch (error) {
    console.error('Get pure veg restaurants error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

module.exports = {
  getAllRestaurants,
  getRestaurantById,
  getTrendingRestaurants,
  getPureVegRestaurants
};
