const db = require('../config/db');

// Get reviews for a restaurant
const getRestaurantReviews = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      `SELECT r.*, u.full_name as user_name
       FROM reviews r
       JOIN users u ON r.user_id = u.user_id
       WHERE r.restaurant_id = $1 AND r.is_approved = true
       ORDER BY r.created_at DESC`,
      [id]
    );

    res.json({
      success: true,
      reviews: result.rows
    });
  } catch (error) {
    console.error('Get restaurant reviews error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Get rating distribution for a restaurant
const getRatingDistribution = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      `SELECT
         FLOOR(overall_rating) as rating,
         COUNT(*) as count
       FROM reviews
       WHERE restaurant_id = $1 AND is_approved = true
       GROUP BY FLOOR(overall_rating)
       ORDER BY rating DESC`,
      [id]
    );

    const distribution = {
      5: 0,
      4: 0,
      3: 0,
      2: 0,
      1: 0
    };

    result.rows.forEach(row => {
      const rating = Math.min(5, Math.max(1, row.rating));
      distribution[rating] = parseInt(row.count);
    });

    res.json({
      success: true,
      distribution
    });
  } catch (error) {
    console.error('Get rating distribution error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Check if user can review (has ordered from restaurant)
const checkCanReview = async (req, res) => {
  try {
    const userId = req.user?.userId;
    const { id } = req.params;

    if (!userId) {
      return res.json({
        success: true,
        canReview: false,
        reason: 'not_logged_in'
      });
    }

    // Check if user has ordered from this restaurant
    const orderResult = await db.query(
      `SELECT COUNT(*) as count
       FROM orders
       WHERE user_id = $1 AND restaurant_id = $2 AND status IN ('delivered', 'confirmed', 'preparing', 'out_for_delivery')`,
      [userId, id]
    );

    const hasOrdered = parseInt(orderResult.rows[0].count) > 0;

    // Check if user has already reviewed
    const reviewResult = await db.query(
      `SELECT COUNT(*) as count
       FROM reviews
       WHERE user_id = $1 AND restaurant_id = $2`,
      [userId, id]
    );

    const hasReviewed = parseInt(reviewResult.rows[0].count) > 0;

    res.json({
      success: true,
      canReview: hasOrdered && !hasReviewed,
      hasOrdered,
      hasReviewed
    });
  } catch (error) {
    console.error('Check can review error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

// Submit a review
const submitReview = async (req, res) => {
  try {
    const userId = req.user?.userId;
    const { id } = req.params;
    const { foodRating, ambienceRating, serviceRating, valueRating, comment } = req.body;

    if (!userId) {
      return res.status(401).json({
        success: false,
        message: 'Authentication required'
      });
    }

    // Check if user has ordered from this restaurant
    const orderResult = await db.query(
      `SELECT COUNT(*) as count
       FROM orders
       WHERE user_id = $1 AND restaurant_id = $2 AND status IN ('delivered', 'confirmed', 'preparing', 'out_for_delivery')`,
      [userId, id]
    );

    if (parseInt(orderResult.rows[0].count) === 0) {
      return res.status(403).json({
        success: false,
        message: 'You must order from this restaurant before reviewing'
      });
    }

    // Check if user has already reviewed
    const existingReview = await db.query(
      `SELECT review_id FROM reviews WHERE user_id = $1 AND restaurant_id = $2`,
      [userId, id]
    );

    if (existingReview.rows.length > 0) {
      return res.status(400).json({
        success: false,
        message: 'You have already reviewed this restaurant'
      });
    }

    const overallRating = (foodRating + ambienceRating + serviceRating + valueRating) / 4.0;

    const result = await db.query(
      `INSERT INTO reviews (user_id, restaurant_id, food_rating, ambience_rating, service_rating, value_rating, overall_rating, comment, is_approved)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, true)
       RETURNING review_id`,
      [userId, id, foodRating, ambienceRating, serviceRating, valueRating, overallRating, comment]
    );

    // Update restaurant rating
    await db.query(
      `UPDATE restaurants r SET
        rating = (SELECT AVG(overall_rating) FROM reviews WHERE restaurant_id = r.restaurant_id AND is_approved = true),
        review_count = (SELECT COUNT(*) FROM reviews WHERE restaurant_id = r.restaurant_id AND is_approved = true)
       WHERE r.restaurant_id = $1`,
      [id]
    );

    res.json({
      success: true,
      message: 'Review submitted successfully',
      reviewId: result.rows[0].review_id
    });
  } catch (error) {
    console.error('Submit review error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
};

module.exports = {
  getRestaurantReviews,
  getRatingDistribution,
  checkCanReview,
  submitReview
};
