-- EAT - Parbhani Restaurant Menu Data
-- Demo/sample menu data for Parbhani restaurants
-- Safe to run multiple times - uses INSERT ... ON CONFLICT DO NOTHING

-- Insert Restaurant-Category associations
INSERT INTO restaurant_categories (restaurant_id, category_id)
SELECT r.restaurant_id, c.category_id
FROM restaurants r
CROSS JOIN categories c
WHERE r.name IN ('Veg Aroma Restaurant', 'Hotel Rajhans Family Rooftop Restaurant', 'Fortune Veg Restaurant')
  AND c.name IN ('North Indian', 'Maharashtrian', 'Pure Veg', 'Chinese')
ON CONFLICT DO NOTHING;

INSERT INTO restaurant_categories (restaurant_id, category_id)
SELECT r.restaurant_id, c.category_id
FROM restaurants r
CROSS JOIN categories c
WHERE r.name IN ('Hotel Gokul Pure Veg', 'Hotel Vatika (Pure Veg)', 'Hotel Bhakti veg restaurant', 'Madhur Bhoj Thali', 'New Krushna Restaurant', 'Jijau restaurant pure veg', 'Hotel Tulsi', 'Hotel Temptation Pure Veg', 'Saffron Veg Restaurant')
  AND c.name IN ('Maharashtrian', 'North Indian', 'Pure Veg', 'Thalis')
ON CONFLICT DO NOTHING;

INSERT INTO restaurant_categories (restaurant_id, category_id)
SELECT r.restaurant_id, c.category_id
FROM restaurants r
CROSS JOIN categories c
WHERE r.name IN ('Paesaute Chicken', 'Hotel Tandoor', 'AZMAT HOTEL')
  AND c.name IN ('Non-Veg', 'Chicken', 'Biryani', 'Kebabs', 'Mutton Specials')
ON CONFLICT DO NOTHING;

INSERT INTO restaurant_categories (restaurant_id, category_id)
SELECT r.restaurant_id, c.category_id
FROM restaurants r
CROSS JOIN categories c
WHERE r.name IN ('B For Burger', 'Domino''s Pizza TNK Estate')
  AND c.name IN ('Burgers', 'Pizza', 'Junk Food')
ON CONFLICT DO NOTHING;

INSERT INTO restaurant_categories (restaurant_id, category_id)
SELECT r.restaurant_id, c.category_id
FROM restaurants r
CROSS JOIN categories c
WHERE r.name IN ('Chaundeshwari Chat Bhandar', 'Maharashtra Chat Bhandar')
  AND c.name IN ('Maharashtrian', 'Junk Food', 'Breakfast')
ON CONFLICT DO NOTHING;

INSERT INTO restaurant_categories (restaurant_id, category_id)
SELECT r.restaurant_id, c.category_id
FROM restaurants r
CROSS JOIN categories c
WHERE r.name IN ('LE COFFEE CAFE', 'Coffee Lounge')
  AND c.name IN ('Café Specials', 'Shakes', 'Cold Drinks', 'Mocktails')
ON CONFLICT DO NOTHING;

INSERT INTO restaurant_categories (restaurant_id, category_id)
SELECT r.restaurant_id, c.category_id
FROM restaurants r
CROSS JOIN categories c
WHERE r.name IN ('Kekiz The Cake Shop')
  AND c.name IN ('Cakes', 'Pastries', 'Desserts', 'Sweets', 'Ice Cream')
ON CONFLICT DO NOTHING;

-- Sample Menu Items for Veg Aroma Restaurant (Restaurant ID from sequence)
-- Note: Restaurant IDs will be assigned sequentially, adjust based on actual IDs
-- Using subqueries to get restaurant IDs by name

-- Veg Aroma Restaurant Menu
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Paneer Butter Masala', 'Creamy paneer in tomato gravy', 240.00, 'North Indian', true, true, 20, 'Regular', 'Extra gravy, Extra paneer'
FROM restaurants WHERE name = 'Veg Aroma Restaurant'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Dal Makhani', 'Creamy black lentils', 180.00, 'North Indian', true, true, 25, 'Regular', 'Extra butter'
FROM restaurants WHERE name = 'Veg Aroma Restaurant'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Maharashtrian Thali', 'Complete Maharashtrian meal', 280.00, 'Thalis', true, true, 30, 'Full', NULL
FROM restaurants WHERE name = 'Veg Aroma Restaurant'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Mix Veg', 'Mixed vegetables in gravy', 200.00, 'North Indian', true, false, 20, 'Regular', 'Spicy level'
FROM restaurants WHERE name = 'Veg Aroma Restaurant'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Butter Naan', 'Soft butter naan', 40.00, 'North Indian', true, false, 10, 'Piece', 'Extra butter, Cheese naan'
FROM restaurants WHERE name = 'Veg Aroma Restaurant'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Jeera Rice', 'Cumin flavored rice', 100.00, 'North Indian', true, false, 15, 'Regular', NULL
FROM restaurants WHERE name = 'Veg Aroma Restaurant'
ON CONFLICT DO NOTHING;

-- Hotel Gokul Pure Veg Menu
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Misal Pav', 'Traditional Maharashtrian spicy curry', 80.00, 'Maharashtrian', true, true, 15, 'Regular', 'Extra farsan, Extra onion'
FROM restaurants WHERE name = 'Hotel Gokul Pure Veg'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Pav Bhaji', 'Spicy vegetable mash with pav', 100.00, 'Maharashtrian', true, true, 20, 'Regular', 'Extra butter, Extra cheese'
FROM restaurants WHERE name = 'Hotel Gokul Pure Veg'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Thali', 'Complete meal with roti, rice, dal, sabzi', 150.00, 'Thalis', true, true, 25, 'Full', NULL
FROM restaurants WHERE name = 'Hotel Gokul Pure Veg'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Poha', 'Flattened rice dish', 60.00, 'Breakfast', true, false, 10, 'Regular', 'Extra onion, Peanuts'
FROM restaurants WHERE name = 'Hotel Gokul Pure Veg'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Upma', 'Semolina dish', 50.00, 'Breakfast', true, false, 10, 'Regular', 'Extra vegetables'
FROM restaurants WHERE name = 'Hotel Gokul Pure Veg'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Sabudana Khichdi', 'Tapioca pearls dish', 70.00, 'Maharashtrian', true, true, 15, 'Regular', 'Extra peanuts, Coconut'
FROM restaurants WHERE name = 'Hotel Gokul Pure Veg'
ON CONFLICT DO NOTHING;

-- Paesaute Chicken Menu
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Chicken Fry', 'Fried chicken pieces', 220.00, 'Chicken', false, true, 25, 'Regular', 'Spicy level'
FROM restaurants WHERE name = 'Paesaute Chicken'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Chicken Biryani', 'Aromatic chicken biryani', 260.00, 'Biryani', false, true, 30, 'Full', 'Extra chicken, Raita'
FROM restaurants WHERE name = 'Paesaute Chicken'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Mutton Biryani', 'Aromatic mutton biryani', 320.00, 'Biryani', false, true, 35, 'Full', 'Extra mutton, Raita'
FROM restaurants WHERE name = 'Paesaute Chicken'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Chicken Masala', 'Chicken in spicy gravy', 240.00, 'Chicken', false, true, 25, 'Regular', 'Spicy level, Extra gravy'
FROM restaurants WHERE name = 'Paesaute Chicken'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Mutton Masala', 'Mutton in spicy gravy', 300.00, 'Mutton Specials', false, true, 30, 'Regular', 'Spicy level, Extra gravy'
FROM restaurants WHERE name = 'Paesaute Chicken'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Chicken Seekh Kebab', 'Grilled chicken kebabs', 280.00, 'Kebabs', false, true, 20, '6 pieces', NULL
FROM restaurants WHERE name = 'Paesaute Chicken'
ON CONFLICT DO NOTHING;

-- Domino's Pizza Menu
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Margherita Pizza', 'Classic cheese and tomato pizza', 299.00, 'Pizza', true, true, 20, 'Medium', 'Extra cheese, Crust type'
FROM restaurants WHERE name = 'Domino''s Pizza TNK Estate'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Peppy Paneer Pizza', 'Paneer with capsicum and onion', 399.00, 'Pizza', true, true, 20, 'Medium', 'Extra paneer, Crust type'
FROM restaurants WHERE name = 'Domino''s Pizza TNK Estate'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Chicken Tikka Pizza', 'Chicken tikka with spices', 449.00, 'Pizza', false, true, 20, 'Medium', 'Extra chicken, Crust type'
FROM restaurants WHERE name = 'Domino''s Pizza TNK Estate'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Garlic Bread', 'Toasted garlic bread sticks', 129.00, 'Pizza', true, false, 10, '4 pieces', 'Cheese dip'
FROM restaurants WHERE name = 'Domino''s Pizza TNK Estate'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Pasta Salad', 'Fresh pasta salad', 199.00, 'Italian', true, false, 15, 'Regular', NULL
FROM restaurants WHERE name = 'Domino''s Pizza TNK Estate'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Choco Lava Cake', 'Molten chocolate cake', 99.00, 'Desserts', true, true, 10, '1 piece', NULL
FROM restaurants WHERE name = 'Domino''s Pizza TNK Estate'
ON CONFLICT DO NOTHING;

-- B For Burger Menu
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Veggie Burger', 'Vegetarian patty with fresh vegetables', 120.00, 'Burgers', true, true, 12, 'Regular', 'Extra cheese, Extra patty'
FROM restaurants WHERE name = 'B For Burger'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Chicken Burger', 'Crispy chicken fillet burger', 150.00, 'Burgers', false, true, 12, 'Regular', 'Extra cheese, Extra chicken'
FROM restaurants WHERE name = 'B For Burger'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'French Fries', 'Crispy golden fries', 80.00, 'Junk Food', true, false, 8, 'Regular', 'Seasoning, Cheese'
FROM restaurants WHERE name = 'B For Burger'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Onion Rings', 'Crispy battered onion rings', 90.00, 'Junk Food', true, false, 10, 'Regular', NULL
FROM restaurants WHERE name = 'B For Burger'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Cold Coffee', 'Chilled coffee with ice cream', 80.00, 'Shakes', true, true, 5, 'Regular', 'Extra ice cream, Chocolate syrup'
FROM restaurants WHERE name = 'B For Burger'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Soft Drink', 'Chilled soft drink', 50.00, 'Soft Drinks', true, false, 2, '500ml', NULL
FROM restaurants WHERE name = 'B For Burger'
ON CONFLICT DO NOTHING;

-- Kekiz The Cake Shop Menu
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Chocolate Cake', 'Rich chocolate layer cake', 350.00, 'Cakes', true, true, 10, '500g', 'Custom message, Eggless option'
FROM restaurants WHERE name = 'Kekiz The Cake Shop'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Red Velvet Cake', 'Classic red velvet with cream cheese frosting', 400.00, 'Cakes', true, true, 10, '500g', 'Custom message, Eggless option'
FROM restaurants WHERE name = 'Kekiz The Cake Shop'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Black Forest Cake', 'Classic black forest cake', 380.00, 'Cakes', true, true, 10, '500g', 'Custom message, Eggless option'
FROM restaurants WHERE name = 'Kekiz The Cake Shop'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Pineapple Cake', 'Fresh pineapple cake', 320.00, 'Cakes', true, false, 10, '500g', 'Custom message, Eggless option'
FROM restaurants WHERE name = 'Kekiz The Cake Shop'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Butter Scotch Cake', 'Butterscotch flavored cake', 300.00, 'Cakes', true, false, 10, '500g', 'Custom message, Eggless option'
FROM restaurants WHERE name = 'Kekiz The Cake Shop'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Chocolate Truffle Pastry', 'Rich chocolate pastry', 80.00, 'Pastries', true, true, 5, '1 piece', NULL
FROM restaurants WHERE name = 'Kekiz The Cake Shop'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Black Forest Pastry', 'Classic black forest pastry', 75.00, 'Pastries', true, true, 5, '1 piece', NULL
FROM restaurants WHERE name = 'Kekiz The Cake Shop'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Vanilla Pastry', 'Classic vanilla pastry', 65.00, 'Pastries', true, false, 5, '1 piece', NULL
FROM restaurants WHERE name = 'Kekiz The Cake Shop'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Ice Cream', 'Assorted ice cream flavors', 60.00, 'Ice Cream', true, true, 5, 'Scoop', 'Toppings available'
FROM restaurants WHERE name = 'Kekiz The Cake Shop'
ON CONFLICT DO NOTHING;

-- Coffee Lounge Menu
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Cappuccino', 'Classic Italian coffee with foam', 120.00, 'Café Specials', true, true, 5, 'Regular', 'Extra shot, Sugar level'
FROM restaurants WHERE name = 'Coffee Lounge'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Latte', 'Smooth espresso with steamed milk', 140.00, 'Café Specials', true, true, 5, 'Regular', 'Extra shot, Sugar level'
FROM restaurants WHERE name = 'Coffee Lounge'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Cold Coffee', 'Chilled coffee with ice cream', 150.00, 'Shakes', true, true, 5, 'Regular', 'Extra ice cream, Chocolate syrup'
FROM restaurants WHERE name = 'Coffee Lounge'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Mango Shake', 'Fresh mango milkshake', 160.00, 'Shakes', true, true, 8, 'Regular', 'Extra mango, Ice cream'
FROM restaurants WHERE name = 'Coffee Lounge'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Chocolate Shake', 'Rich chocolate milkshake', 150.00, 'Shakes', true, true, 8, 'Regular', 'Extra chocolate, Ice cream'
FROM restaurants WHERE name = 'Coffee Lounge'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Strawberry Shake', 'Fresh strawberry milkshake', 160.00, 'Shakes', true, true, 8, 'Regular', 'Extra strawberry, Ice cream'
FROM restaurants WHERE name = 'Coffee Lounge'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Iced Tea', 'Refreshing iced tea with lemon', 100.00, 'Cold Drinks', true, false, 5, 'Regular', 'Sugar level, Lemon'
FROM restaurants WHERE name = 'Coffee Lounge'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Mojito', 'Fresh mint and lime mocktail', 140.00, 'Mocktails', true, true, 8, 'Regular', 'Extra mint, Sugar level'
FROM restaurants WHERE name = 'Coffee Lounge'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Virgin Mojito', 'Non-alcoholic mint drink', 130.00, 'Mocktails', true, true, 8, 'Regular', 'Extra mint, Sugar level'
FROM restaurants WHERE name = 'Coffee Lounge'
ON CONFLICT DO NOTHING;

-- Chaundeshwari Chat Bhandar Menu
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Pani Puri', 'Crispy puris with spicy water', 50.00, 'Maharashtrian', true, true, 10, '6 pieces', 'Extra pani, Extra puri'
FROM restaurants WHERE name = 'Chaundeshwari Chat Bhandar'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Sev Puri', 'Crispy puris with toppings', 40.00, 'Maharashtrian', true, true, 8, '6 pieces', 'Extra sev, Extra chutney'
FROM restaurants WHERE name = 'Chaundeshwari Chat Bhandar'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Dahi Puri', 'Puris with yogurt and chutneys', 50.00, 'Maharashtrian', true, true, 10, '6 pieces', 'Extra dahi, Extra puri'
FROM restaurants WHERE name = 'Chaundeshwari Chat Bhandar'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Bhel Puri', 'Puffed rice with vegetables', 40.00, 'Maharashtrian', true, true, 8, 'Regular', 'Extra sev, Extra onion'
FROM restaurants WHERE name = 'Chaundeshwari Chat Bhandar'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Samosa', 'Crispy potato filled snack', 20.00, 'Junk Food', true, true, 10, '1 piece', 'Extra chutney'
FROM restaurants WHERE name = 'Chaundeshwari Chat Bhandar'
ON CONFLICT DO NOTHING;

INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time, portion_size, customization_options)
SELECT restaurant_id, 'Kachori', 'Spicy lentil filled snack', 25.00, 'Junk Food', true, true, 10, '1 piece', 'Extra chutney'
FROM restaurants WHERE name = 'Chaundeshwari Chat Bhandar'
ON CONFLICT DO NOTHING;

-- More restaurants will be added with similar menu structures
-- This is a representative sample showing the pattern
