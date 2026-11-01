import { createContext, useContext, useState, useEffect } from 'react';

const CartContext = createContext(null);

export const CartProvider = ({ children }) => {
  const [cart, setCart] = useState([]);
  const [restaurantId, setRestaurantId] = useState(null);

  // Load cart from localStorage on mount
  useEffect(() => {
    const savedCart = localStorage.getItem('cart');
    const savedRestaurantId = localStorage.getItem('restaurantId');
    if (savedCart) {
      setCart(JSON.parse(savedCart));
    }
    if (savedRestaurantId) {
      setRestaurantId(parseInt(savedRestaurantId));
    }
  }, []);

  // Save cart to localStorage whenever it changes
  useEffect(() => {
    localStorage.setItem('cart', JSON.stringify(cart));
  }, [cart]);

  useEffect(() => {
    if (restaurantId) {
      localStorage.setItem('restaurantId', restaurantId);
    } else {
      localStorage.removeItem('restaurantId');
    }
  }, [restaurantId]);

  const addToCart = (item, newRestaurantId) => {
    // Check if adding from different restaurant
    if (restaurantId && restaurantId !== newRestaurantId) {
      // Auto-clear cart for different restaurant
      clearCart();
    }

    setRestaurantId(newRestaurantId);

    setCart((prevCart) => {
      const existingItem = prevCart.find((i) => i.foodId === item.foodId);
      const price = parseFloat(item.price) || 0;
      if (existingItem) {
        return prevCart.map((i) =>
          i.foodId === item.foodId
            ? { ...i, quantity: i.quantity + 1, subtotal: parseFloat(((i.quantity + 1) * price).toFixed(2)) }
            : i
        );
      }
      return [...prevCart, { ...item, quantity: 1, subtotal: parseFloat(price.toFixed(2)) }];
    });
    return true;
  };

  const updateQuantity = (foodId, quantity) => {
    if (quantity <= 0) {
      removeFromCart(foodId);
      return;
    }
    setCart((prevCart) =>
      prevCart.map((item) =>
        item.foodId === foodId
          ? { ...item, quantity, subtotal: parseFloat((quantity * (parseFloat(item.price) || 0)).toFixed(2)) }
          : item
      )
    );
  };

  const removeFromCart = (foodId) => {
    setCart((prevCart) => {
      const newCart = prevCart.filter((item) => item.foodId !== foodId);
      if (newCart.length === 0) {
        setRestaurantId(null);
      }
      return newCart;
    });
  };

  const clearCart = () => {
    setCart([]);
    setRestaurantId(null);
  };

  const cartTotal = parseFloat(cart.reduce((sum, item) => sum + (parseFloat(item.subtotal) || 0), 0).toFixed(2));
  const cartCount = cart.reduce((sum, item) => sum + item.quantity, 0);

  return (
    <CartContext.Provider
      value={{
        cart,
        restaurantId,
        cartTotal,
        cartCount,
        addToCart,
        updateQuantity,
        removeFromCart,
        clearCart,
      }}
    >
      {children}
    </CartContext.Provider>
  );
};

export const useCart = () => useContext(CartContext);
