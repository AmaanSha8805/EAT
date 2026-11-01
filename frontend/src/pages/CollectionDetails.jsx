import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { collectionAPI } from '../services/api';

const CollectionDetails = () => {
  const { type } = useParams();
  const [restaurants, setRestaurants] = useState([]);
  const [loading, setLoading] = useState(true);

  const collectionNames = {
    student_friendly: 'Student Friendly',
    couples_special: 'Couples Special',
    family_packages: 'Family Packages',
    budget_meals: 'Budget Meals',
    party_packs: 'Party Packs',
    best_offers: 'Best Offers',
    quick_bites: 'Quick Bites',
  };

  const collectionDescriptions = {
    student_friendly: 'Budget-friendly meals perfect for students',
    couples_special: 'Romantic dining experiences and date night combos',
    family_packages: 'Value deals and family feasts for everyone',
    budget_meals: 'Affordable meals that won\'t break the bank',
    party_packs: 'Great deals for parties and gatherings',
    best_offers: 'Top-rated restaurants with special offers',
    quick_bites: 'Fast delivery for when you\'re in a hurry',
  };

  useEffect(() => {
    fetchCollectionData();
  }, [type]);

  const fetchCollectionData = async () => {
    try {
      const response = await collectionAPI.getByType(type);
      setRestaurants(response.data.restaurants);
    } catch (error) {
      console.error('Error fetching collection data:', error);
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
        <h1 className="page-title">{collectionNames[type] || 'Collection'}</h1>
        <p className="page-description">{collectionDescriptions[type] || ''}</p>

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
          <p className="no-results">No restaurants found in this collection</p>
        )}
      </div>
    </div>
  );
};

export default CollectionDetails;
