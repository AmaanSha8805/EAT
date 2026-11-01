import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { categoryAPI } from '../services/api';

const CategoryDetails = () => {
  const { id } = useParams();
  const [category, setCategory] = useState(null);
  const [restaurants, setRestaurants] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchCategoryData();
  }, [id]);

  const fetchCategoryData = async () => {
    try {
      const [categoryRes, restaurantsRes] = await Promise.all([
        categoryAPI.getById(id),
        categoryAPI.getRestaurants(id),
      ]);

      setCategory(categoryRes.data.category);
      setRestaurants(restaurantsRes.data.restaurants);
    } catch (error) {
      console.error('Error fetching category data:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <div className="loading">Loading...</div>;
  }

  if (!category) {
    return (
      <div className="page">
        <div className="container">
          <p>Category not found</p>
          <Link to="/categories" className="button">
            Back to Categories
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="page">
      <div className="container">
        <h1 className="page-title">{category.name}</h1>
        <p className="page-description">{category.description}</p>

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
          <p className="no-results">No restaurants found in this category</p>
        )}
      </div>
    </div>
  );
};

export default CategoryDetails;
