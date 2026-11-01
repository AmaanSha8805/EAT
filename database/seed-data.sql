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
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(1, 'Butter Chicken', 'Creamy tomato-based curry with tender chicken', 280.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', false, true, 25),
(1, 'Paneer Tikka Masala', 'Cubes of paneer in spiced tomato gravy', 240.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, 20),
(1, 'Dal Makhani', 'Creamy black lentils simmered overnight', 180.00, 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=500&q=80', 'Main Course', true, false, 30),
(1, 'Naan Bread', 'Soft traditional Indian bread', 40.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Bread', true, false, 10),
(1, 'Chicken Biryani', 'Aromatic basmati rice with spiced chicken', 260.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', false, true, 30),
(1, 'Vegetable Biryani', 'Fragrant rice with mixed vegetables', 220.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, false, 25);

-- Insert Food Items for Dosa Corner (South Indian)
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(2, 'Masala Dosa', 'Crispy dosa filled with spiced potato filling', 80.00, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80', 'Dosa', true, true, 15),
(2, 'Idli Sambar', 'Steamed rice cakes with lentil soup', 60.00, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80', 'Breakfast', true, false, 10),
(2, 'Uttapam', 'Thick pancake with vegetable toppings', 90.00, 'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80', 'Dosa', true, false, 15),
(2, 'Rava Dosa', 'Crispy semolina dosa', 70.00, 'https://images.unsplash.com/photo-1600384060421-cb20d0e0649d?w=500&q=80', 'Dosa', true, true, 12),
(2, 'Filter Coffee', 'Traditional South Indian coffee', 40.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=500&q=80', 'Beverage', true, false, 5),
(2, 'Vada', 'Crispy lentil fritters', 50.00, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80', 'Snack', true, false, 10);

-- Insert Food Items for Dragon Wok (Chinese)
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(3, 'Chicken Manchurian', 'Indo-Chinese chicken balls in spicy sauce', 220.00, 'https://images.unsplash.com/photo-1645177628172-a94c1f96e6db?w=500&q=80', 'Starters', false, true, 20),
(3, 'Veg Fried Rice', 'Stir-fried rice with mixed vegetables', 150.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80', 'Rice', true, false, 15),
(3, 'Chicken Fried Rice', 'Fried rice with chicken and vegetables', 180.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', false, true, 15),
(3, 'Hakka Noodles', 'Stir-fried noodles with vegetables', 160.00, 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80', 'Noodles', true, false, 15),
(3, 'Spring Rolls', 'Crispy vegetable spring rolls', 120.00, 'https://images.unsplash.com/photo-1606525436872-0996a0590969?w=500&q=80', 'Starters', true, false, 15),
(3, 'Chilli Chicken', 'Spicy chicken with bell peppers', 240.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', false, true, 20);

-- Insert Food Items for Pizza Paradise (Italian)
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(4, 'Margherita Pizza', 'Classic pizza with tomato, mozzarella and basil', 280.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80', 'Pizza', true, true, 20),
(4, 'Pepperoni Pizza', 'Loaded with pepperoni and cheese', 350.00, 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=500&q=80', 'Pizza', false, true, 20),
(4, 'Veggie Supreme', 'Loaded with vegetables and cheese', 320.00, 'https://images.unsplash.com/photo-1511689660979-10d2b1aada49?w=500&q=80', 'Pizza', true, false, 20),
(4, 'Garlic Bread', 'Toasted bread with garlic butter', 120.00, 'https://images.unsplash.com/photo-1619535860434-ba1d8fa12536?w=500&q=80', 'Sides', true, false, 10),
(4, 'Pasta Alfredo', 'Creamy white sauce pasta', 260.00, 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80', 'Pasta', true, false, 18),
(4, 'Chicken Pasta', 'Pasta with chicken in tomato sauce', 290.00, 'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=500&q=80', 'Pasta', false, false, 18);

-- Insert Food Items for Brew & Bean (Beverages)
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(5, 'Cappuccino', 'Classic Italian coffee with foam', 120.00, 'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80', 'Coffee', true, true, 5),
(5, 'Latte', 'Smooth espresso with steamed milk', 140.00, 'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=500&q=80', 'Coffee', true, false, 5),
(5, 'Cold Coffee', 'Chilled coffee with ice cream', 150.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Coffee', true, true, 5),
(5, 'Mango Smoothie', 'Fresh mango blended smoothie', 180.00, 'https://images.unsplash.com/photo-993483514752-2c9dc0f97e51?w=500&q=80', 'Smoothie', true, false, 8),
(5, 'Iced Tea', 'Refreshing iced tea with lemon', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, false, 5),
(5, 'Sandwich', 'Grilled vegetable sandwich', 160.00, 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80', 'Snacks', true, false, 10);

-- Insert Food Items for Sweet Delights (Desserts)
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(6, 'Chocolate Cake', 'Rich chocolate layer cake', 250.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cake', true, true, 10),
(6, 'Red Velvet Cake', 'Classic red velvet with cream cheese frosting', 280.00, 'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=500&q=80', 'Cake', true, false, 10),
(6, 'Ice Cream Sundae', 'Ice cream with toppings and sauce', 180.00, 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500&q=80', 'Ice Cream', true, true, 5),
(6, 'Brownie', 'Fudgy chocolate brownie', 150.00, 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500&q=80', 'Pastry', true, false, 8),
(6, 'Cheesecake', 'Creamy New York style cheesecake', 220.00, 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=500&q=80', 'Cake', true, false, 10),
(6, 'Gulab Jamun', 'Traditional Indian sweet balls in syrup', 120.00, 'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80', 'Indian Sweet', true, false, 5);

-- Insert Food Items for Burger Barn (Fast Food)
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(7, 'Classic Burger', 'Beef patty with lettuce and cheese', 180.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Burger', false, true, 12),
(7, 'Veggie Burger', 'Vegetarian patty with fresh vegetables', 150.00, 'https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500&q=80', 'Burger', true, false, 12),
(7, 'Chicken Burger', 'Crispy chicken fillet burger', 170.00, 'https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=500&q=80', 'Burger', false, true, 12),
(7, 'French Fries', 'Crispy golden fries', 100.00, 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&q=80', 'Sides', true, false, 8),
(7, 'Onion Rings', 'Crispy battered onion rings', 110.00, 'https://images.unsplash.com/photo-1639024471283-03518883512d?w=500&q=80', 'Sides', true, false, 10),
(7, 'Coke', 'Chilled Coca-Cola', 60.00, 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500&q=80', 'Beverage', true, false, 2);

-- Insert Food Items for Green Bowl (Healthy)
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(8, 'Caesar Salad', 'Fresh lettuce with Caesar dressing', 180.00, 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500&q=80', 'Salad', true, true, 10),
(8, 'Greek Salad', 'Mediterranean vegetables with feta', 200.00, 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500&q=80', 'Salad', true, false, 10),
(8, 'Protein Bowl', 'Grilled chicken with quinoa and vegetables', 280.00, 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80', 'Bowl', false, true, 15),
(8, 'Veggie Bowl', 'Mixed vegetables with brown rice', 220.00, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&q=80', 'Bowl', true, false, 12),
(8, 'Fresh Juice', 'Mixed fruit fresh juice', 120.00, 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500&q=80', 'Juice', true, false, 5),
(8, 'Smoothie Bowl', 'Acai bowl with fruits and granola', 250.00, 'https://images.unsplash.com/photo-1590301157890-4810ed352733?w=500&q=80', 'Bowl', true, false, 10);

-- Insert Food Items for Fresh Bakery (Bakery)
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(9, 'Croissant', 'Buttery French croissant', 60.00, 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=500&q=80', 'Pastry', true, true, 5),
(9, 'Chocolate Croissant', 'Croissant filled with chocolate', 80.00, 'https://images.unsplash.com/photo-1608198093002-ad4e005484ec?w=500&q=80', 'Pastry', true, false, 5),
(9, 'Sandwich Bread', 'Fresh sliced bread loaf', 90.00, 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&q=80', 'Bread', true, false, 5),
(9, 'Muffin', 'Blueberry or chocolate chip muffin', 70.00, 'https://images.unsplash.com/photo-1607958996333-41aef7caefaa?w=500&q=80', 'Pastry', true, false, 5),
(9, 'Bagel', 'Fresh baked bagel', 50.00, 'https://images.unsplash.com/photo-1585449078915-0279c1cc5e59?w=500&q=80', 'Bread', true, false, 5),
(9, 'Pasta Bun', 'Sweet bun with pasta filling', 40.00, 'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=500&q=80', 'Pastry', true, false, 5);

-- Insert Food Items for Continental Kitchen (Continental)
INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_trending, preparation_time) VALUES
(10, 'Grilled Chicken', 'Herb-crusted grilled chicken breast', 350.00, 'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=500&q=80', 'Main Course', false, true, 25),
(10, 'Fish & Chips', 'Battered fish with crispy fries', 380.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Main Course', false, false, 20),
(10, 'Vegetable Lasagna', 'Layered pasta with vegetables and cheese', 320.00, 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=500&q=80', 'Pasta', true, false, 25),
(10, 'Mushroom Soup', 'Creamy mushroom soup', 150.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Soup', true, false, 12),
(10, 'Caesar Salad', 'Classic Caesar salad', 200.00, 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500&q=80', 'Salad', true, false, 10),
(10, 'Chocolate Mousse', 'Rich chocolate dessert', 220.00, 'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80', 'Dessert', true, false, 8);

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
