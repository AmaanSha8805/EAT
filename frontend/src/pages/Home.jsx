import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { restaurantAPI, foodAPI, bestForAPI, collectionAPI } from '../services/api';

const Home = () => {
  const [topRestaurants, setTopRestaurants] = useState([]);
  const [trendingFood, setTrendingFood] = useState([]);
  const [bestForCategories, setBestForCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [searchResults, setSearchResults] = useState({ food: [], restaurants: [] });
  const [allFoodItems, setAllFoodItems] = useState([]);
  const [allRestaurants, setAllRestaurants] = useState([]);
  const [isSearching, setIsSearching] = useState(false);
  const [showDropdown, setShowDropdown] = useState(false);

  useEffect(() => {
    fetchData();
  }, []);

  useEffect(() => {
    const searchTimeout = setTimeout(() => {
      if (searchQuery.trim() === '') {
        setSearchResults({ food: [], restaurants: [] });
        setShowDropdown(false);
        return;
      }

      setIsSearching(true);
      performSearch(searchQuery);
    }, 300);

    return () => clearTimeout(searchTimeout);
  }, [searchQuery, allFoodItems, allRestaurants]);

  const performSearch = (query) => {
    const lowerQuery = query.toLowerCase();
    
    const filteredFood = allFoodItems
      .filter((food) => food.name.toLowerCase().includes(lowerQuery))
      .slice(0, 5);
    
    const filteredRestaurants = allRestaurants
      .filter((restaurant) => 
        restaurant.name.toLowerCase().includes(lowerQuery) ||
        restaurant.cuisine_type.toLowerCase().includes(lowerQuery)
      )
      .slice(0, 3);

    setSearchResults({ food: filteredFood, restaurants: filteredRestaurants });
    setIsSearching(false);
    setShowDropdown(true);
  };

  const handleClearSearch = () => {
    setSearchQuery('');
    setSearchResults({ food: [], restaurants: [] });
    setShowDropdown(false);
  };

  const handleKeyDown = (e) => {
    if (e.key === 'Enter' && searchQuery.trim()) {
      setShowDropdown(false);
    }
  };

  const handleResultClick = () => {
    handleClearSearch();
  };

  const fetchData = async () => {
    try {
      const [restaurantsRes, foodRes, bestForRes, allFoodRes, allRestaurantsRes] = await Promise.all([
        restaurantAPI.getTrending(),
        foodAPI.getTrending(),
        bestForAPI.getAll(),
        foodAPI.getAll(),
        restaurantAPI.getAll(),
      ]);

      // Sort restaurants by rating and take top 6
      const sortedRestaurants = (restaurantsRes.data.restaurants || [])
        .sort((a, b) => b.rating - a.rating)
        .slice(0, 6);

      setTopRestaurants(sortedRestaurants);
      setTrendingFood((foodRes.data.foodItems || []).slice(0, 6));
      setBestForCategories(bestForRes.data.bestForCategories || []);
      setAllFoodItems(allFoodRes.data.foodItems || []);
      setAllRestaurants(allRestaurantsRes.data.restaurants || []);
    } catch (error) {
      console.error('Error fetching data:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <div className="loading">Loading...</div>;
  }

  const hasResults = searchResults.food.length > 0 || searchResults.restaurants.length > 0;

  return (
    <div className="home">
      {/* Hero Section */}
      <section className="hero">
        <div className="hero-content">
          <h1 className="hero-title">Explore Amazing Taste</h1>
          <p className="hero-subtitle">Order from the best restaurants in your area</p>

          {/* Search Bar */}
          <div className="search-container">
            <div className="search-bar">
              <svg className="search-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <circle cx="11" cy="11" r="8" />
                <path d="M21 21l-4.35-4.35" />
              </svg>
              <input
                type="text"
                placeholder="Search for dishes, restaurants..."
                className="search-input"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyDown={handleKeyDown}
                onFocus={() => searchQuery && setShowDropdown(true)}
              />
              {searchQuery && (
                <button className="search-clear" onClick={handleClearSearch} aria-label="Clear search">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    <path d="M18 6L6 18" />
                    <path d="M6 6l12 12" />
                  </svg>
                </button>
              )}
            </div>
            
            {/* Search Results Dropdown */}
            {showDropdown && searchQuery && (
              <div className="search-results">
                {isSearching ? (
                  <div className="search-loading">
                    <div className="search-spinner"></div>
                    <p>Searching...</p>
                  </div>
                ) : hasResults ? (
                  <>
                    {searchResults.restaurants.length > 0 && (
                      <div className="search-section">
                        <h4 className="search-section-title">Restaurants</h4>
                        {searchResults.restaurants.map((restaurant) => (
                          <Link
                            key={restaurant.restaurant_id}
                            to={`/restaurant/${restaurant.restaurant_id}`}
                            className="search-result-item restaurant-result"
                            onClick={handleResultClick}
                          >
                            <img
                              src={restaurant.image_url || '/placeholder-food.jpg'}
                              alt={restaurant.name}
                              className="search-result-image"
                            />
                            <div className="search-result-info">
                              <h4 className="search-result-name">{restaurant.name}</h4>
                              <p className="search-result-restaurant">{restaurant.cuisine_type}</p>
                              <div className="search-result-meta">
                                <span className="rating">★ {restaurant.rating}</span>
                                <span className="time">{restaurant.delivery_time} mins</span>
                              </div>
                            </div>
                          </Link>
                        ))}
                      </div>
                    )}
                    
                    {searchResults.food.length > 0 && (
                      <div className="search-section">
                        <h4 className="search-section-title">Dishes</h4>
                        {searchResults.food.map((food) => (
                          <Link
                            key={food.food_id}
                            to={`/restaurant/${food.restaurant_id}`}
                            className="search-result-item"
                            onClick={handleResultClick}
                          >
                            <img
                              src={food.image_url || '/placeholder-food.jpg'}
                              alt={food.name}
                              className="search-result-image"
                            />
                            <div className="search-result-info">
                              <h4 className="search-result-name">{food.name}</h4>
                              <p className="search-result-restaurant">{food.restaurant_name}</p>
                              <p className="search-result-price">₹{food.price}</p>
                            </div>
                          </Link>
                        ))}
                      </div>
                    )}
                  </>
                ) : (
                  <div className="search-no-results">
                    <div className="no-results-icon">🔍</div>
                    <p>No results found for "{searchQuery}"</p>
                    <p className="no-results-hint">Try searching for a different dish or restaurant</p>
                  </div>
                )}
              </div>
            )}
          </div>
          
          <Link to="/restaurants" className="hero-button">
            Browse Restaurants
          </Link>
        </div>
      </section>

      {/* Top Restaurants */}
      <section className="section">
        <div className="container">
          <h2 className="section-title">Top Restaurants</h2>
          <div className="grid">
            {topRestaurants.map((restaurant) => (
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
          <div className="view-more-container">
            <Link to="/restaurants" className="view-more-button">
              View More Restaurants
            </Link>
          </div>
        </div>
      </section>

      {/* Trending Food */}
      <section className="section">
        <div className="container">
          <h2 className="section-title">What's Trending Today?</h2>
          <div className="grid">
            {trendingFood.map((food) => (
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
                  <p className="card-price">₹{food.price}</p>
                </div>
              </Link>
            ))}
          </div>
          <div className="view-more-container">
            <Link to="/food-items" className="view-more-button">
              View More Food Items
            </Link>
          </div>
        </div>
      </section>

      {/* Best For */}
      <section className="section">
        <div className="container">
          <h2 className="section-title">Best For</h2>
          <div className="best-for-grid">
            {bestForCategories.map((category) => (
              <Link
                key={category.best_for_id}
                to={`/best-for/${category.best_for_id}`}
                className="best-for-card"
              >
                <div className="best-for-content">
                  <h3 className="best-for-title">{category.name}</h3>
                  <p className="best-for-description">{category.description}</p>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* Special Collections */}
      <section className="section">
        <div className="container">
          <h2 className="section-title">Special Collections</h2>
          <div className="collections-grid">
            <Link to="/collection/student_friendly" className="collection-card student">
              <div className="collection-content">
                <h3 className="collection-title">Student Friendly</h3>
                <p className="collection-description">Budget-friendly meals perfect for students</p>
              </div>
            </Link>
            <Link to="/collection/couples_special" className="collection-card couples">
              <div className="collection-content">
                <h3 className="collection-title">Couples Special</h3>
                <p className="collection-description">Romantic dining experiences and date night combos</p>
              </div>
            </Link>
            <Link to="/collection/family_packages" className="collection-card family">
              <div className="collection-content">
                <h3 className="collection-title">Family Packages</h3>
                <p className="collection-description">Value deals and family feasts for everyone</p>
              </div>
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Home;
