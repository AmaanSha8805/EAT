import axios from 'axios';

const API_BASE_URL = 'http://localhost:5000/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Add token to requests if available
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

// Auth API
export const authAPI = {
  register: (data) => api.post('/auth/register', data),
  login: (data) => api.post('/auth/login', data),
  getMe: () => api.get('/auth/me'),
};

// Restaurant API
export const restaurantAPI = {
  getAll: (params) => api.get('/restaurants', { params }),
  getById: (id) => api.get(`/restaurants/${id}`),
  getTrending: () => api.get('/restaurants/trending'),
  getPureVeg: () => api.get('/restaurants/pure-veg'),
};

// Food API
export const foodAPI = {
  getAll: () => api.get('/food/all'),
  getTrending: () => api.get('/food/trending'),
  getByRestaurant: (id) => api.get(`/food/restaurant/${id}`),
  getById: (id) => api.get(`/food/${id}`),
};

// Order API
export const orderAPI = {
  create: (data) => api.post('/orders', data),
  getByUser: () => api.get('/orders'),
  getById: (id) => api.get(`/orders/${id}`),
  delete: (id) => api.delete(`/orders/${id}`),
};

// Category API
export const categoryAPI = {
  getAll: () => api.get('/categories'),
  getById: (id) => api.get(`/categories/${id}`),
  getRestaurants: (id) => api.get(`/categories/${id}/restaurants`),
};

// Best For API
export const bestForAPI = {
  getAll: () => api.get('/best-for'),
  getById: (id) => api.get(`/best-for/${id}`),
  getRestaurants: (id) => api.get(`/best-for/${id}/restaurants`),
};

// Collection API
export const collectionAPI = {
  getAll: () => api.get('/collections'),
  getByType: (type) => api.get(`/collections/${type}`),
};

// Favorites API
export const favoriteAPI = {
  getAll: () => api.get('/favorites'),
  add: (data) => api.post('/favorites', data),
  remove: (id) => api.delete(`/favorites/${id}`),
};

// User API
export const userAPI = {
  updateProfile: (data) => api.put('/user/profile', data),
};

// Review API
export const reviewAPI = {
  getRestaurantReviews: (id) => api.get(`/reviews/restaurant/${id}`),
  getRatingDistribution: (id) => api.get(`/reviews/restaurant/${id}/distribution`),
  checkCanReview: (id) => api.get(`/reviews/restaurant/${id}/can-review`),
  submitReview: (id, data) => api.post(`/reviews/restaurant/${id}`, data),
};

export default api;
