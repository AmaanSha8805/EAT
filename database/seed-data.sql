-- EAT - Explore Amazing Taste Seed Data
-- Demo data for testing and presentation

-- Insert Categories
INSERT INTO categories (name, description, icon) VALUES
('North Indian', 'Authentic North Indian cuisine', '🍛'),
('South Indian', 'Traditional South Indian dishes', '🥘'),
('Chinese', 'Chinese and Asian fusion', '🥡'),
('Italian', 'Pizzas, pasta and Italian classics', '🍕'),
('Beverages', 'Cool drinks, shakes and coffees', '🥤'),
('Desserts', 'Sweet treats and desserts', '🍰'),
('Fast Food', 'Burgers, fries and quick bites', '🍔'),
('Healthy', 'Salads and healthy options', '🥗'),
('Bakery', 'Breads, cakes and baked goods', '🥐'),
('Continental', 'European and continental dishes', '🍽️');

-- Insert Best For Categories
INSERT INTO best_for_categories (name, description) VALUES
('Study & Work', 'Quiet ambiance with WiFi, perfect for studying or working'),
('Friends', 'Great for hanging out with friends'),
('Couples', 'Romantic ambiance for couples'),
('Family', 'Family-friendly atmosphere'),
('Budget Food', 'Affordable options for students'),
('Coffee & Chill', 'Perfect for coffee and relaxation'),
('Late Night', 'Open late for night cravings'),
('Quick Bite', 'Fast service for quick meals');

-- Insert Users (passwords are BCrypt hashes)
-- Customer passwords: password123
-- Admin password: admin123
INSERT INTO users (email, password, full_name, phone, address, role) VALUES
('customer@eat.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'John Doe', '9876543210', '123 Main Street, City', 'customer'),
('student@eat.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Jane Smith', '9876543211', '456 College Road, Campus', 'customer'),
('admin@eat.com', '$2a$10$e0MYzXyjp/7vf6/BFlKQO9pIqMRn2yB1EF5Y6nKJ7N3lR3xZ2vQ5q', 'Admin User', '9876543212', '789 Admin Lane, Office', 'admin');

-- Insert Restaurants
INSERT INTO restaurants (name, description, cuisine_type, address, phone, email, image_url, rating, review_count, price_range, is_trending, is_student_friendly, is_family_special, is_couple_special, opening_time, closing_time) VALUES
('Spice Garden', 'Authentic North Indian cuisine with rich flavors', 'North Indian', '123 Food Street, Downtown', '9876543220', 'spice@eat.com', 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500', 4.5, 120, '$$', true, true, true, false, '10:00:00', '22:00:00'),
('Dosa Corner', 'Traditional South Indian dosas and idlis', 'South Indian', '456 Spice Avenue', '9876543221', 'dosa@eat.com', 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500', 4.3, 95, '$', true, true, false, false, '07:00:00', '21:00:00'),
('Dragon Wok', 'Chinese and Asian fusion cuisine', 'Chinese', '789 Dragon Road', '9876543222', 'dragon@eat.com', 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500', 4.2, 85, '$$', true, true, true, false, '11:00:00', '23:00:00'),
('Pizza Paradise', 'Wood-fired pizzas and Italian classics', 'Italian', '321 Cheese Lane', '9876543223', 'pizza@eat.com', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500', 4.6, 150, '$$', true, true, true, true, '11:00:00', '23:00:00'),
('Brew & Bean', 'Artisan coffee and refreshing beverages', 'Beverages', '654 Coffee Street', '9876543224', 'brew@eat.com', 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500', 4.4, 110, '$', true, true, false, true, '08:00:00', '22:00:00'),
('Sweet Delights', 'Cakes, pastries and sweet treats', 'Desserts', '987 Sugar Road', '9876543225', 'sweet@eat.com', 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500', 4.5, 90, '$$', false, true, false, true, '10:00:00', '21:00:00'),
('Burger Barn', 'Gourmet burgers and fast food', 'Fast Food', '147 Burger Boulevard', '9876543226', 'burger@eat.com', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500', 4.3, 130, '$', true, true, true, false, '11:00:00', '23:00:00'),
('Green Bowl', 'Healthy salads and nutritious meals', 'Healthy', '258 Health Way', '9876543227', 'green@eat.com', 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500', 4.4, 75, '$$', true, true, false, false, '09:00:00', '21:00:00'),
('Fresh Bakery', 'Freshly baked breads and cakes', 'Bakery', '369 Bakery Street', '9876543228', 'fresh@eat.com', 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500', 4.2, 65, '$', false, true, false, false, '07:00:00', '20:00:00'),
('Continental Kitchen', 'European and continental dishes', 'Continental', '741 Continental Road', '9876543229', 'continental@eat.com', 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500', 4.1, 55, '$$$', false, false, true, true, '12:00:00', '22:00:00');

-- Insert Restaurant-Category associations
INSERT INTO restaurant_categories (restaurant_id, category_id) VALUES
(1, 1), (1, 10),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insert Restaurant-Best For associations
INSERT INTO restaurant_best_for (restaurant_id, best_for_id) VALUES
(1, 2), (1, 3), (1, 4), (1, 5),
(2, 1), (2, 5), (2, 7),
(3, 2), (3, 5), (3, 8),
(4, 2), (4, 3), (4, 4), (4, 8),
(5, 1), (5, 6), (5, 7),
(6, 3), (6, 6),
(7, 2), (7, 5), (7, 8),
(8, 1), (8, 5),
(9, 5), (9, 7),
(10, 3), (10, 4);

-- Insert Food Items for Spice Garden (North Indian)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(1, 'Butter Chicken', 'Creamy tomato-based curry with tender chicken', 280.00, 'Main Course', false, true, 25),
(1, 'Paneer Tikka Masala', 'Cubes of paneer in spiced tomato gravy', 240.00, 'Main Course', true, true, 20),
(1, 'Dal Makhani', 'Creamy black lentils simmered overnight', 180.00, 'Main Course', true, false, 30),
(1, 'Naan Bread', 'Soft traditional Indian bread', 40.00, 'Bread', true, false, 10),
(1, 'Chicken Biryani', 'Aromatic basmati rice with spiced chicken', 260.00, 'Rice', false, true, 30),
(1, 'Vegetable Biryani', 'Fragrant rice with mixed vegetables', 220.00, 'Rice', true, false, 25);

-- Insert Food Items for Dosa Corner (South Indian)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(2, 'Masala Dosa', 'Crispy dosa filled with spiced potato filling', 80.00, 'Dosa', true, true, 15),
(2, 'Idli Sambar', 'Steamed rice cakes with lentil soup', 60.00, 'Breakfast', true, false, 10),
(2, 'Uttapam', 'Thick pancake with vegetable toppings', 90.00, 'Dosa', true, false, 15),
(2, 'Rava Dosa', 'Crispy semolina dosa', 70.00, 'Dosa', true, true, 12),
(2, 'Filter Coffee', 'Traditional South Indian coffee', 40.00, 'Beverage', true, false, 5),
(2, 'Vada', 'Crispy lentil fritters', 50.00, 'Snack', true, false, 10);

-- Insert Food Items for Dragon Wok (Chinese)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(3, 'Chicken Manchurian', 'Indo-Chinese chicken balls in spicy sauce', 220.00, 'Starters', false, true, 20),
(3, 'Veg Fried Rice', 'Stir-fried rice with mixed vegetables', 150.00, 'Rice', true, false, 15),
(3, 'Chicken Fried Rice', 'Fried rice with chicken and vegetables', 180.00, 'Rice', false, true, 15),
(3, 'Hakka Noodles', 'Stir-fried noodles with vegetables', 160.00, 'Noodles', true, false, 15),
(3, 'Spring Rolls', 'Crispy vegetable spring rolls', 120.00, 'Starters', true, false, 15),
(3, 'Chilli Chicken', 'Spicy chicken with bell peppers', 240.00, 'Main Course', false, true, 20);

-- Insert Food Items for Pizza Paradise (Italian)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(4, 'Margherita Pizza', 'Classic pizza with tomato, mozzarella and basil', 280.00, 'Pizza', true, true, 20),
(4, 'Pepperoni Pizza', 'Loaded with pepperoni and cheese', 350.00, 'Pizza', false, true, 20),
(4, 'Veggie Supreme', 'Loaded with vegetables and cheese', 320.00, 'Pizza', true, false, 20),
(4, 'Garlic Bread', 'Toasted bread with garlic butter', 120.00, 'Sides', true, false, 10),
(4, 'Pasta Alfredo', 'Creamy white sauce pasta', 260.00, 'Pasta', true, false, 18),
(4, 'Chicken Pasta', 'Pasta with chicken in tomato sauce', 290.00, 'Pasta', false, false, 18);

-- Insert Food Items for Brew & Bean (Beverages)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(5, 'Cappuccino', 'Classic Italian coffee with foam', 120.00, 'Coffee', true, true, 5),
(5, 'Latte', 'Smooth espresso with steamed milk', 140.00, 'Coffee', true, false, 5),
(5, 'Cold Coffee', 'Chilled coffee with ice cream', 150.00, 'Cold Coffee', true, true, 5),
(5, 'Mango Smoothie', 'Fresh mango blended smoothie', 180.00, 'Smoothie', true, false, 8),
(5, 'Iced Tea', 'Refreshing iced tea with lemon', 100.00, 'Tea', true, false, 5),
(5, 'Sandwich', 'Grilled vegetable sandwich', 160.00, 'Snacks', true, false, 10);

-- Insert Food Items for Sweet Delights (Desserts)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(6, 'Chocolate Cake', 'Rich chocolate layer cake', 250.00, 'Cake', true, true, 10),
(6, 'Red Velvet Cake', 'Classic red velvet with cream cheese frosting', 280.00, 'Cake', true, false, 10),
(6, 'Ice Cream Sundae', 'Ice cream with toppings and sauce', 180.00, 'Ice Cream', true, true, 5),
(6, 'Brownie', 'Fudgy chocolate brownie', 150.00, 'Pastry', true, false, 8),
(6, 'Cheesecake', 'Creamy New York style cheesecake', 220.00, 'Cake', true, false, 10),
(6, 'Gulab Jamun', 'Traditional Indian sweet balls in syrup', 120.00, 'Indian Sweet', true, false, 5);

-- Insert Food Items for Burger Barn (Fast Food)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(7, 'Classic Burger', 'Beef patty with lettuce and cheese', 180.00, 'Burger', false, true, 12),
(7, 'Veggie Burger', 'Vegetarian patty with fresh vegetables', 150.00, 'Burger', true, false, 12),
(7, 'Chicken Burger', 'Crispy chicken fillet burger', 170.00, 'Burger', false, true, 12),
(7, 'French Fries', 'Crispy golden fries', 100.00, 'Sides', true, false, 8),
(7, 'Onion Rings', 'Crispy battered onion rings', 110.00, 'Sides', true, false, 10),
(7, 'Coke', 'Chilled Coca-Cola', 60.00, 'Beverage', true, false, 2);

-- Insert Food Items for Green Bowl (Healthy)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(8, 'Caesar Salad', 'Fresh lettuce with Caesar dressing', 180.00, 'Salad', true, true, 10),
(8, 'Greek Salad', 'Mediterranean vegetables with feta', 200.00, 'Salad', true, false, 10),
(8, 'Protein Bowl', 'Grilled chicken with quinoa and vegetables', 280.00, 'Bowl', false, true, 15),
(8, 'Veggie Bowl', 'Mixed vegetables with brown rice', 220.00, 'Bowl', true, false, 12),
(8, 'Fresh Juice', 'Mixed fruit fresh juice', 120.00, 'Juice', true, false, 5),
(8, 'Smoothie Bowl', 'Acai bowl with fruits and granola', 250.00, 'Bowl', true, false, 10);

-- Insert Food Items for Fresh Bakery (Bakery)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(9, 'Croissant', 'Buttery French croissant', 60.00, 'Pastry', true, true, 5),
(9, 'Chocolate Croissant', 'Croissant filled with chocolate', 80.00, 'Pastry', true, false, 5),
(9, 'Sandwich Bread', 'Fresh sliced bread loaf', 90.00, 'Bread', true, false, 5),
(9, 'Muffin', 'Blueberry or chocolate chip muffin', 70.00, 'Pastry', true, false, 5),
(9, 'Bagel', 'Fresh baked bagel', 50.00, 'Bread', true, false, 5),
(9, 'Pasta Bun', 'Sweet bun with pasta filling', 40.00, 'Pastry', true, false, 5);

-- Insert Food Items for Continental Kitchen (Continental)
INSERT INTO food_items (restaurant_id, name, description, price, category, is_vegetarian, is_trending, preparation_time) VALUES
(10, 'Grilled Chicken', 'Herb-crusted grilled chicken breast', 350.00, 'Main Course', false, true, 25),
(10, 'Fish & Chips', 'Battered fish with crispy fries', 380.00, 'Main Course', false, false, 20),
(10, 'Vegetable Lasagna', 'Layered pasta with vegetables and cheese', 320.00, 'Pasta', true, false, 25),
(10, 'Mushroom Soup', 'Creamy mushroom soup', 150.00, 'Soup', true, false, 12),
(10, 'Caesar Salad', 'Classic Caesar salad', 200.00, 'Salad', true, false, 10),
(10, 'Chocolate Mousse', 'Rich chocolate dessert', 220.00, 'Dessert', true, false, 8);

-- Insert Delivery Persons
INSERT INTO delivery_persons (name, phone, vehicle_number, is_available) VALUES
('Rahul Kumar', '9876543301', 'DL01AB1234', true),
('Amit Singh', '9876543302', 'DL02CD5678', true),
('Priya Sharma', '9876543303', 'DL03EF9012', true),
('Vikram Patel', '9876543304', 'DL04GH3456', true);

-- Insert Sample Orders
INSERT INTO orders (user_id, restaurant_id, total_amount, status, payment_method, payment_status, delivery_address, delivery_phone, special_instructions) VALUES
(1, 1, 560.00, 'delivered', 'cod', 'paid', '123 Main Street, City', '9876543210', 'Extra spicy please'),
(1, 4, 630.00, 'delivered', 'online', 'paid', '123 Main Street, City', '9876543210', NULL),
(2, 2, 140.00, 'delivered', 'cod', 'paid', '456 College Road, Campus', '9876543211', 'No onions');

-- Insert Sample Order Items
INSERT INTO order_items (order_id, food_id, quantity, price_at_order, subtotal) VALUES
(1, 1, 2, 280.00, 560.00),
(2, 19, 1, 280.00, 280.00),
(2, 22, 1, 350.00, 350.00),
(3, 7, 1, 80.00, 80.00),
(3, 8, 1, 60.00, 60.00);

-- Insert Sample Reviews
INSERT INTO reviews (user_id, restaurant_id, food_rating, ambience_rating, service_rating, value_rating, overall_rating, comment, is_approved) VALUES
(1, 1, 5, 4, 4, 4, 4.25, 'Amazing butter chicken! Will definitely order again.', true),
(1, 4, 5, 5, 5, 4, 4.75, 'Best pizza in town! Crust is perfect.', true),
(2, 2, 4, 3, 4, 5, 4.00, 'Great dosas, very authentic taste.', true);

-- Update restaurant ratings based on reviews
UPDATE restaurants r SET 
    rating = (SELECT AVG(overall_rating) FROM reviews WHERE restaurant_id = r.restaurant_id AND is_approved = true),
    review_count = (SELECT COUNT(*) FROM reviews WHERE restaurant_id = r.restaurant_id AND is_approved = true);
