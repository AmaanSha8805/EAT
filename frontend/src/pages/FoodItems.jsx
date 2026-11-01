import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { foodAPI } from '../services/api';

const FoodItems = () => {
  const [foodItems, setFoodItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');

  useEffect(() => {
    fetchFoodItems();
  }, [search]);

  const fetchFoodItems = async () => {
    try {
      const response = await foodAPI.getAll();
      let items = response.data.foodItems;

      if (search) {
        items = items.filter(item =>
          item.name.toLowerCase().includes(search.toLowerCase()) ||
          item.restaurant_name.toLowerCase().includes(search.toLowerCase())
        );
      }

      setFoodItems(items);
    } catch (error) {
      console.error('Error fetching food items:', error);
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
        <h1 className="page-title">All Food Items</h1>

        <div className="filters">
          <input
            type="text"
            placeholder="Search food items..."
            className="search-input"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
        </div>

        <div className="grid">
          {foodItems.map((food) => (
            <Link
              key={food.food_id}
              to={`/restaurant/${food.restaurant_id}`}
              className="card"
            >
              <div className="card-image">
                <img
                  src={food.image_url || '/placeholder-food.jpg'}
                  alt={food.name}
                />
              </div>
              <div className="card-content">
                <h3 className="card-title">{food.name}</h3>
                <p className="card-restaurant">{food.restaurant_name}</p>
                <p className="card-description">{food.description}</p>
                <p className="card-price">₹{food.price}</p>
              </div>
            </Link>
          ))}
        </div>

        {foodItems.length === 0 && (
          <p className="no-results">No food items found</p>
        )}
      </div>
    </div>
  );
};

export default FoodItems;
