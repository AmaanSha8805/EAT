import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { restaurantAPI } from '../services/api';

const Restaurants = () => {
  const [restaurants, setRestaurants] = useState([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const [pureVeg, setPureVeg] = useState(false);

  useEffect(() => {
    fetchRestaurants();
  }, [search, pureVeg]);

  const fetchRestaurants = async () => {
    try {
      const params = {};
      if (search) params.search = search;
      if (pureVeg) params.pureVeg = 'true';

      const response = await restaurantAPI.getAll(params);
      setRestaurants(response.data.restaurants);
    } catch (error) {
      console.error('Error fetching restaurants:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <div className="loading">Loading...</div>;
  }

  return (
    <div className="page">
      <div className="container">
        <h1 className="page-title">Restaurants</h1>

        <div className="filters">
          <input
            type="text"
            placeholder="Search restaurants..."
            className="search-input"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
          <label className="checkbox-label">
            <input
              type="checkbox"
              checked={pureVeg}
              onChange={(e) => setPureVeg(e.target.checked)}
            />
            Pure Veg Only
          </label>
        </div>

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
          <p className="no-results">No restaurants found</p>
        )}
      </div>
    </div>
  );
};

export default Restaurants;
