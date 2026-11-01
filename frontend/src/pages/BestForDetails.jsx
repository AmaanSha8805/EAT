import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { bestForAPI } from '../services/api';

const BestForDetails = () => {
  const { id } = useParams();
  const [bestFor, setBestFor] = useState(null);
  const [restaurants, setRestaurants] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchBestForData();
  }, [id]);

  const fetchBestForData = async () => {
    try {
      const [bestForRes, restaurantsRes] = await Promise.all([
        bestForAPI.getById(id),
        bestForAPI.getRestaurants(id),
      ]);

      setBestFor(bestForRes.data.bestFor);
      setRestaurants(restaurantsRes.data.restaurants);
    } catch (error) {
      console.error('Error fetching best for data:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <div className="loading">Loading...</div>;
  }

  if (!bestFor) {
    return (
      <div className="page">
        <div className="container">
          <p>Category not found</p>
          <Link to="/" className="button">
            Back to Home
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="page">
      <div className="container">
        <h1 className="page-title">{bestFor.name}</h1>
        <p className="page-description">{bestFor.description}</p>

        <div className="grid">
          {restaurants.map((restaurant) => (
            <Link
              key={restaurant.restaurant_id}
              to={`/restaurant/${restaurant.restaurant_id}`}
              className="card"
            >
              <div className="card-image">
                <img
                  src={restaurant.image_url || '/placeholder-food.jpg'}
                  alt={restaurant.name}
                />
                {restaurant.is_pure_veg && (
                  <span className="badge veg">Pure Veg</span>
                )}
              </div>
              <div className="card-content">
                <h3 className="card-title">{restaurant.name}</h3>
                <p className="card-cuisine">{restaurant.cuisine_type}</p>
                <div className="card-meta">
                  <span className="rating">★ {restaurant.rating}</span>
                  <span className="time">{restaurant.delivery_time} mins</span>
                </div>
                <p className="card-price">₹{restaurant.price_range} for two</p>
              </div>
            </Link>
          ))}
        </div>

        {restaurants.length === 0 && (
          <p className="no-results">No restaurants found for this category</p>
        )}
      </div>
    </div>
  );
};

export default BestForDetails;
