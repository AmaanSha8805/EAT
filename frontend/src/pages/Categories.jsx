import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { categoryAPI } from '../services/api';

const Categories = () => {
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchCategories();
  }, []);

  const fetchCategories = async () => {
    try {
      const response = await categoryAPI.getAll();
      setCategories(response.data.categories);
    } catch (error) {
      console.error('Error fetching categories:', error);
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
        <h1 className="page-title">Food Categories</h1>

        <div className="categories-grid">
          {categories.map((category) => (
            <Link
              key={category.category_id}
              to={`/category/${category.category_id}`}
              className="category-card"
            >
              <div className="category-image">
                <img
                  src={category.image_url || '/placeholder-food.jpg'}
                  alt={category.name}
                />
              </div>
              <div className="category-content">
                <h3 className="category-title">{category.name}</h3>
                <p className="category-description">{category.description}</p>
              </div>
            </Link>
          ))}
        </div>

        {categories.length === 0 && (
          <p className="no-results">No categories found</p>
        )}
      </div>
    </div>
  );
};

export default Categories;
