import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { restaurantAPI, foodAPI, reviewAPI } from '../services/api';
import { useCart } from '../context/CartContext';
import { useToast } from '../context/ToastContext';
import { useAuth } from '../context/AuthContext';

const RestaurantDetails = () => {
  const { id } = useParams();
  const [restaurant, setRestaurant] = useState(null);
  const [foodItems, setFoodItems] = useState([]);
  const [reviews, setReviews] = useState([]);
  const [ratingDistribution, setRatingDistribution] = useState(null);
  const [canReview, setCanReview] = useState(false);
  const [showReviewForm, setShowReviewForm] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState('All');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const { addToCart } = useCart();
  const { showToast } = useToast();
  const { user } = useAuth();

  const [reviewForm, setReviewForm] = useState({
    foodRating: 5,
    ambienceRating: 5,
    serviceRating: 5,
    valueRating: 5,
    comment: ''
  });

  useEffect(() => {
    fetchData();
  }, [id]);

  const fetchData = async () => {
    try {
      setError(null);
      console.log('Fetching restaurant with id:', id);
      
      // Fetch restaurant data first - this is critical
      const restaurantRes = await restaurantAPI.getById(id);
      console.log('Restaurant API response:', restaurantRes.data);
      
      if (!restaurantRes.data.restaurant) {
        setError('Restaurant data not found in response');
        setRestaurant(null);
        setLoading(false);
        return;
      }
      
      setRestaurant(restaurantRes.data.restaurant);

      // Fetch other data in parallel, but don't fail if they fail
      try {
        const [foodRes, reviewsRes, distributionRes] = await Promise.all([
          foodAPI.getByRestaurant(id),
          reviewAPI.getRestaurantReviews(id),
          reviewAPI.getRatingDistribution(id),
        ]);
        setFoodItems(foodRes.data.foodItems || []);
        setReviews(reviewsRes.data.reviews || []);
        setRatingDistribution(distributionRes.data.distribution || {5:0,4:0,3:0,2:0,1:0});
      } catch (error) {
        console.error('Error fetching secondary data:', error);
        // Set defaults if secondary data fails
        setFoodItems([]);
        setReviews([]);
        setRatingDistribution({5:0,4:0,3:0,2:0,1:0});
      }

      // Check if user can review
      if (user) {
        try {
          const canReviewRes = await reviewAPI.checkCanReview(id);
          setCanReview(canReviewRes.data.canReview);
        } catch (error) {
          console.error('Error checking can review:', error);
        }
      }
    } catch (error) {
      console.error('Error fetching restaurant data:', error);
      console.error('Error details:', error.response?.data || error.message);
      setError(error.response?.data?.message || error.message || 'Failed to load restaurant');
      setRestaurant(null);
    } finally {
      setLoading(false);
    }
  };

  const handleAddToCart = (food) => {
    const cartItem = {
      foodId: food.food_id,
      name: food.name,
      price: food.price,
      image_url: food.image_url,
      description: food.description,
      is_veg: food.is_veg
    };
    const success = addToCart(cartItem, parseInt(id));
    if (success) {
      showToast('✓ Added to cart', 'success');
    }
  };

  const handleSubmitReview = async (e) => {
    e.preventDefault();
    try {
      await reviewAPI.submitReview(id, reviewForm);
      showToast('✓ Review submitted successfully', 'success');
      setShowReviewForm(false);
      setReviewForm({ foodRating: 5, ambienceRating: 5, serviceRating: 5, valueRating: 5, comment: '' });
      // Refresh reviews
      fetchData();
    } catch (error) {
      showToast(error.response?.data?.message || 'Failed to submit review', 'error');
    }
  };

  const calculateTotalReviews = () => {
    if (!ratingDistribution) return 0;
    return Object.values(ratingDistribution).reduce((a, b) => a + b, 0);
  };

  // Get unique categories from food items
  const categories = ['All', ...new Set(foodItems.map(item => item.category))];

  // Filter food items by selected category
  const filteredFoodItems = selectedCategory === 'All'
    ? foodItems
    : foodItems.filter(item => item.category === selectedCategory);

  // Group food items by category
  const groupedFoodItems = filteredFoodItems.reduce((groups, item) => {
    const category = item.category || 'Other';
    if (!groups[category]) {
      groups[category] = [];
    }
    groups[category].push(item);
    return groups;
  }, {});

  const renderStars = (rating) => {
    const stars = [];
    for (let i = 1; i <= 5; i++) {
      stars.push(
        <span key={i} className={i <= rating ? 'star filled' : 'star'}>
          ★
        </span>
      );
    }
    return stars;
  };

  if (loading) {
    return <div className="page"><div className="container"><div className="loading">Loading...</div></div></div>;
  }

  if (error) {
    return (
      <div className="page">
        <div className="container">
          <div className="error-message">
            <h2>Error Loading Restaurant</h2>
            <p>{error}</p>
            <Link to="/restaurants" className="back-link">← Back to Restaurants</Link>
          </div>
        </div>
      </div>
    );
  }

  if (!restaurant) {
    return (
      <div className="page">
        <div className="container">
          <p>Restaurant not found</p>
          <Link to="/restaurants" className="back-link">← Back to Restaurants</Link>
        </div>
      </div>
    );
  }

  return (
    <div className="page">
      <div className="container">
        <div className="restaurant-header">
          <img
            src={restaurant.image_url || '/placeholder-food.jpg'}
            alt={restaurant.name}
            className="restaurant-banner"
          />
          <div className="restaurant-info">
            <h1 className="restaurant-name">{restaurant.name}</h1>
            <p className="restaurant-cuisine">{restaurant.cuisine_type}</p>
            <div className="restaurant-meta">
              <span className="rating">★ {restaurant.rating ? parseFloat(restaurant.rating).toFixed(1) : 'N/A'}</span>
              <span className="time">{restaurant.delivery_time || restaurant.estimated_delivery_time || 30} mins</span>
              <span className="price">₹{restaurant.price_range} for two</span>
            </div>
            {restaurant.is_pure_veg && <span className="badge veg">Pure Veg</span>}
            <p className="restaurant-address">{restaurant.address}</p>
          </div>
        </div>

        <h2 className="section-title">Menu</h2>

        {/* Category Filter */}
        {categories.length > 1 && (
          <div className="category-filter">
            {categories.map((category) => (
              <button
                key={category}
                className={`category-button ${selectedCategory === category ? 'active' : ''}`}
                onClick={() => setSelectedCategory(category)}
              >
                {category}
              </button>
            ))}
          </div>
        )}

        {/* Menu List */}
        <div className="menu-list">
          {Object.entries(groupedFoodItems).map(([category, items]) => (
            <div key={category} className="menu-category">
              <h3 className="menu-category-title">{category}</h3>
              {items.map((food) => (
                <div key={food.food_id} className="menu-item">
                  <div className="menu-item-info">
                    <h3 className="menu-item-name">{food.name}</h3>
                    <p className="menu-item-description">{food.description || 'Delicious food item'}</p>
                    <p className="menu-item-price">₹{food.price}</p>
                    {food.is_vegetarian && <span className="badge veg small">Veg</span>}
                  </div>
                  <div className="menu-item-image">
                    <img
                      src={food.image_url || '/placeholder-food.jpg'}
                      alt={food.name}
                      onError={(e) => {
                        e.target.src = '/placeholder-food.jpg';
                      }}
                    />
                    <button
                      onClick={() => handleAddToCart(food)}
                      className="add-button"
                    >
                      ADD
                    </button>
                  </div>
                </div>
              ))}
            </div>
          ))}
        </div>

        {filteredFoodItems.length === 0 && (
          <p className="no-results">No menu items available</p>
        )}

        {/* Reviews Section */}
        <div className="reviews-section">
          <h2 className="section-title">Reviews & Ratings</h2>

          {/* Rating Summary */}
          <div className="rating-summary">
            <div className="rating-overview">
              <div className="rating-score">
                <span className="score">{restaurant.rating ? parseFloat(restaurant.rating).toFixed(1) : 'N/A'}</span>
                <span className="stars">{restaurant.rating ? renderStars(Math.round(parseFloat(restaurant.rating))) : 'No ratings'}</span>
              </div>
              <div className="rating-count">{calculateTotalReviews()} reviews</div>
            </div>

            {ratingDistribution && (
              <div className="rating-bars">
                {[5, 4, 3, 2, 1].map(star => (
                  <div key={star} className="rating-bar">
                    <span className="star-label">{star} ★</span>
                    <div className="bar-container">
                      <div
                        className="bar-fill"
                        style={{
                          width: `${calculateTotalReviews() > 0
                            ? (ratingDistribution[star] / calculateTotalReviews()) * 100
                            : 0}%`
                        }}
                      />
                    </div>
                    <span className="bar-count">{ratingDistribution[star]}</span>
                  </div>
                ))}
              </div>
            )}
          </div>

          {/* Write Review Button */}
          {canReview && (
            <button
              className="write-review-button"
              onClick={() => setShowReviewForm(!showReviewForm)}
            >
              {showReviewForm ? 'Cancel' : 'Write a Review'}
            </button>
          )}

          {/* Review Form */}
          {showReviewForm && (
            <form className="review-form" onSubmit={handleSubmitReview}>
              <h3>Write Your Review</h3>
              <div className="rating-inputs">
                <div className="rating-input">
                  <label>Food Quality</label>
                  <select
                    value={reviewForm.foodRating}
                    onChange={(e) => setReviewForm({...reviewForm, foodRating: parseInt(e.target.value)})}
                  >
                    {[1,2,3,4,5].map(n => <option key={n} value={n}>{n} ★</option>)}
                  </select>
                </div>
                <div className="rating-input">
                  <label>Ambience</label>
                  <select
                    value={reviewForm.ambienceRating}
                    onChange={(e) => setReviewForm({...reviewForm, ambienceRating: parseInt(e.target.value)})}
                  >
                    {[1,2,3,4,5].map(n => <option key={n} value={n}>{n} ★</option>)}
                  </select>
                </div>
                <div className="rating-input">
                  <label>Service</label>
                  <select
                    value={reviewForm.serviceRating}
                    onChange={(e) => setReviewForm({...reviewForm, serviceRating: parseInt(e.target.value)})}
                  >
                    {[1,2,3,4,5].map(n => <option key={n} value={n}>{n} ★</option>)}
                  </select>
                </div>
                <div className="rating-input">
                  <label>Value for Money</label>
                  <select
                    value={reviewForm.valueRating}
                    onChange={(e) => setReviewForm({...reviewForm, valueRating: parseInt(e.target.value)})}
                  >
                    {[1,2,3,4,5].map(n => <option key={n} value={n}>{n} ★</option>)}
                  </select>
                </div>
              </div>
              <div className="comment-input">
                <label>Your Review</label>
                <textarea
                  value={reviewForm.comment}
                  onChange={(e) => setReviewForm({...reviewForm, comment: e.target.value})}
                  placeholder="Share your experience..."
                  rows="4"
                  required
                />
              </div>
              <button type="submit" className="submit-review-button">Submit Review</button>
            </form>
          )}

          {/* Reviews List */}
          <div className="reviews-list">
            {reviews.length > 0 ? (
              reviews.map((review) => (
                <div key={review.review_id} className="review-card">
                  <div className="review-header">
                    <span className="reviewer-name">{review.user_name}</span>
                    <span className="review-date">
                      {new Date(review.created_at).toLocaleDateString()}
                    </span>
                  </div>
                  <div className="review-rating">
                    {renderStars(Math.round(review.overall_rating))}
                    <span className="rating-number">{review.overall_rating.toFixed(1)}</span>
                  </div>
                  {review.comment && (
                    <p className="review-comment">{review.comment}</p>
                  )}
                </div>
              ))
            ) : (
              <p className="no-reviews">No reviews yet. Be the first to review!</p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default RestaurantDetails;
