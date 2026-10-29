-- EAT - Explore Amazing Taste Parbhani Seed Data
-- Demo/sample data for Parbhani, Maharashtra restaurants
-- Safe to run multiple times - uses INSERT ... ON CONFLICT DO NOTHING

-- Insert 30+ Food Categories
INSERT INTO categories (name, description, icon) VALUES
('Indian', 'Authentic Indian cuisine', '🇮🇳'),
('North Indian', 'North Indian curries and breads', '🍛'),
('South Indian', 'South Indian dosas, idlis and more', '🥘'),
('Maharashtrian', 'Traditional Maharashtrian dishes', '🥣'),
('Pure Veg', '100% vegetarian food', '🥗'),
('Non-Veg', 'Non-vegetarian dishes', '🍗'),
('Biryani', 'Aromatic rice dishes', '🍚'),
('Mutton Specials', 'Mutton delicacies', '🍖'),
('Chicken', 'Chicken dishes', '🍗'),
('Kebabs', 'Grilled and tandoor kebabs', '🥙'),
('Junk Food', 'Quick bites and snacks', '🍔'),
('Burgers', 'Burgers and sandwiches', '🍔'),
('Pizza', 'Pizzas and Italian', '🍕'),
('Chinese', 'Chinese and Asian fusion', '🥡'),
('Momos', 'Steamed dumplings', '🥟'),
('Rolls', 'Wraps and rolls', '🌯'),
('Café Specials', 'Café food and beverages', '☕'),
('Breakfast', 'Breakfast items', '🍳'),
('Thalis', 'Traditional thali meals', '🍽️'),
('Salads', 'Fresh salads', '🥗'),
('Healthy Food', 'Nutritious healthy options', '🥑'),
('Juices', 'Fresh fruit juices', '🧃'),
('Cold Drinks', 'Cold beverages', '🥤'),
('Soft Drinks', 'Carbonated drinks', '🥤'),
('Shakes', 'Milkshakes and smoothies', '🥛'),
('Mocktails', 'Non-alcoholic cocktails', '🍹'),
('Desserts', 'Sweet desserts', '🍰'),
('Sweets', 'Indian sweets', '🍬'),
('Cakes', 'Cakes and pastries', '🎂'),
('Pastries', 'Baked pastries', '🥐'),
('Waffles', 'Waffles and pancakes', '🧇'),
('Ice Cream', 'Ice creams and frozen desserts', '🍦')
ON CONFLICT (name) DO NOTHING;

-- Insert Best For Categories
INSERT INTO best_for_categories (name, description) VALUES
('Study & Work', 'Quiet ambiance with WiFi, perfect for studying or working'),
('Friends', 'Great for hanging out with friends'),
('Couples', 'Romantic ambiance for couples'),
('Family', 'Family-friendly atmosphere'),
('Budget Food', 'Affordable options for students'),
('Coffee & Chill', 'Perfect for coffee and relaxation'),
('Late Night', 'Open late for night cravings'),
('Quick Bite', 'Fast service for quick meals')
ON CONFLICT (name) DO NOTHING;

-- Insert Parbhani Restaurants (25-30 restaurants)
-- Data based on actual Parbhani restaurants from research
-- Phone numbers and addresses are from research where available
-- Prices are demo/sample prices for illustration

INSERT INTO restaurants (name, description, cuisine_type, address, phone, email, image_url, rating, review_count, price_range, is_trending, is_student_friendly, is_family_special, is_couple_special, opening_time, closing_time, delivery_fee, minimum_order_amount, estimated_delivery_time, is_pure_veg) VALUES
-- Veg Aroma Restaurant (Demo data - pricing is illustrative)
('Veg Aroma Restaurant', 'Premium vegetarian restaurant with diverse menu', 'North Indian, Maharashtrian', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500', 4.9, 5583, '$$$', true, true, true, true, '10:00:00', '22:00:00', 40.00, 250.00, 35, true),

-- Hotel Rajhans Family Rooftop Restaurant (Demo data)
('Hotel Rajhans Family Rooftop Restaurant', 'Rooftop dining with Chinese cuisine', 'Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500', 4.9, 1233, '$$$', true, true, true, true, '11:00:00', '23:00:00', 45.00, 300.00, 30, false),

-- Fortune Veg Restaurant (Demo data)
('Fortune Veg Restaurant', 'Chinese vegetarian cuisine', 'Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500', 4.8, 2182, '$$$', true, true, true, false, '11:00:00', '22:00:00', 40.00, 250.00, 35, true),

-- Hotel Radhika Place and City Palace (Demo data)
('Hotel Radhika Place and City Palace', 'Multi-cuisine restaurant', 'North Indian, Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500', 4.8, 1766, '$$', true, true, true, true, '10:00:00', '22:00:00', 35.00, 200.00, 30, false),

-- Hotel Gokul Pure Veg (Demo data - pricing illustrative)
('Hotel Gokul Pure Veg', 'Pure vegetarian restaurant', 'Maharashtrian, North Indian', 'Shivaji Chowk, Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500', 4.9, 6177, '$$', true, true, true, false, '08:00:00', '22:00:00', 30.00, 150.00, 30, true),

-- Morya''s Royal Treat Rooftop Restaurant (Demo data)
('Morya''s Royal Treat Rooftop Restaurant', 'Rooftop multi-cuisine', 'North Indian, Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=500', 4.8, 261, '$$$', true, true, true, true, '11:00:00', '23:00:00', 50.00, 350.00, 35, false),

-- MADANI PALACE FAMILY RESTAURANT (Demo data)
('MADANI PALACE FAMILY RESTAURANT', 'Family restaurant with Chinese cuisine', 'Chinese, North Indian', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=500', 4.8, 1803, '$$', true, true, true, true, '11:00:00', '22:00:00', 40.00, 250.00, 30, false),

-- Krishna restaurant (Demo data)
('Krishna restaurant', 'Multi-cuisine dining', 'North Indian, Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500', 4.8, 103, '$$$', true, true, true, true, '10:00:00', '22:00:00', 45.00, 300.00, 35, false),

-- Hotel Vatika (Pure Veg) (Demo data)
('Hotel Vatika (Pure Veg)', 'Pure vegetarian restaurant', 'Maharashtrian, North Indian', 'Vasmat Road, Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500', 4.8, 2974, '$$', true, true, true, false, '09:00:00', '21:00:00', 35.00, 200.00, 30, true),

-- Hotel Bhakti veg restaurant (Demo data)
('Hotel Bhakti veg restaurant', 'Vegetarian Chinese', 'Chinese, Vegetarian', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500', 4.4, 81, '$$', true, true, true, false, '10:00:00', '21:00:00', 35.00, 200.00, 30, true),

-- HOTEL RAMAYANA (Demo data)
('HOTEL RAMAYANA', 'Traditional Indian cuisine', 'North Indian, Maharashtrian', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500', 4.6, 182, '$$', true, true, true, true, '10:00:00', '22:00:00', 40.00, 250.00, 35, false),

-- Madhur Bhoj Thali (Demo data)
('Madhur Bhoj Thali', 'Famous for thalis', 'Maharashtrian, Thalis', 'Basmat Rd, Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1567337710282-00832b415979?w=500', 4.1, 1005, '$$', true, true, true, false, '09:00:00', '21:00:00', 30.00, 150.00, 30, true),

-- AZMAT HOTEL (Demo data)
('AZMAT HOTEL', 'Multi-cuisine restaurant', 'North Indian, Biryani', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500', 4.0, 71, '$$$', false, true, true, true, '11:00:00', '23:00:00', 50.00, 350.00, 35, false),

-- Baba Nk family Restaurant (Demo data)
('Baba Nk family Restaurant', 'Family restaurant', 'North Indian, Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=500', 4.0, 37, '$$$', false, true, true, true, '10:00:00', '22:00:00', 45.00, 300.00, 30, false),

-- Sai samrat veg and non veg (Demo data)
('Sai samrat veg and non veg', 'Multi-cuisine', 'North Indian, Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500', 4.0, 219, '$$$', false, true, true, true, '10:00:00', '22:00:00', 40.00, 250.00, 30, false),

-- Hotel Tandoor (Demo data)
('Hotel Tandoor', 'Tandoor specialties', 'North Indian, Kebabs', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500', 3.9, 195, '$$', true, true, true, false, '11:00:00', '23:00:00', 45.00, 300.00, 35, false),

-- Sardeshpande Hurda Party (Demo data)
('Sardeshpande Hurda Party', 'Traditional Maharashtrian', 'Maharashtrian', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500', 4.3, 220, '$$$', false, true, true, true, '11:00:00', '22:00:00', 50.00, 350.00, 40, false),

-- Nisarga Bar and Restaurant (Demo data)
('Nisarga Bar and Restaurant', 'Bar and restaurant', 'North Indian, Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=500', 3.9, 259, '$$$', false, true, true, true, '11:00:00', '23:00:00', 50.00, 350.00, 35, false),

-- New Krushna Restaurant (Demo data)
('New Krushna Restaurant', 'Vegetarian restaurant', 'North Indian, Maharashtrian', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500', 3.8, 154, '$$', true, true, true, false, '09:00:00', '21:00:00', 30.00, 150.00, 30, true),

-- B For Burger (Demo data)
('B For Burger', 'Burger joint', 'Burgers, Fast Food', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500', 3.7, 23, '$', true, true, true, false, '11:00:00', '22:00:00', 25.00, 100.00, 25, false),

-- Domino''s Pizza TNK Estate (Demo data)
('Domino''s Pizza TNK Estate', 'Pizza delivery', 'Pizza, Italian', 'TNK Estate, Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500', 4.6, 722, '$$', true, true, true, true, '11:00:00', '23:00:00', 40.00, 200.00, 30, false),

-- Chaundeshwari Chat Bhandar (Demo data)
('Chaundeshwari Chat Bhandar', 'Chat and snacks', 'Maharashtrian, Junk Food', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=500', 4.8, 686, '$', true, true, true, false, '10:00:00', '21:00:00', 20.00, 100.00, 20, true),

-- LE COFFEE CAFE (Demo data)
('LE COFFEE CAFE', 'Café with pizza', 'Café Specials, Pizza', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500', 4.8, 249, '$$', true, true, false, true, '08:00:00', '22:00:00', 35.00, 200.00, 25, false),

-- Kekiz The Cake Shop (Demo data)
('Kekiz The Cake Shop', 'Cakes and pastries', 'Cakes, Pastries, Desserts', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500', 4.3, 137, '$$$', true, true, false, true, '10:00:00', '21:00:00', 40.00, 250.00, 25, true),

-- Maharashtra Chat Bhandar (Demo data)
('Maharashtra Chat Bhandar', 'Chat specialties', 'Maharashtrian, Junk Food', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=500', 3.8, 178, '$', true, true, true, false, '10:00:00', '21:00:00', 20.00, 100.00, 20, true),

-- Apna Corner (Demo data)
('Apna Corner', 'Multi-cuisine', 'North Indian, Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500', 3.8, 673, '$$', true, true, true, true, '10:00:00', '22:00:00', 35.00, 200.00, 30, false),

-- PAGAL CHINESE FOOD (Demo data)
('PAGAL CHINESE FOOD', 'Chinese cuisine', 'Chinese', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500', 3.7, 82, '$$', true, true, true, false, '11:00:00', '22:00:00', 35.00, 200.00, 30, false),

-- Paesaute Chicken (Demo data - pricing illustrative)
('Paesaute Chicken', 'Chicken specialties', 'Non-Veg, Chicken', 'Basmat Rd, Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500', 4.8, 513, '$$', true, true, true, false, '11:00:00', '23:00:00', 40.00, 250.00, 35, false),

-- Jijau restaurant pure veg (Demo data)
('Jijau restaurant pure veg', 'Pure vegetarian', 'Maharashtrian, North Indian', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500', 4.7, 5583, '$$', true, true, true, false, '08:00:00', '21:00:00', 30.00, 150.00, 30, true),

-- Hotel Tulsi (Demo data)
('Hotel Tulsi', 'Vegetarian restaurant', 'Maharashtrian, North Indian', 'Ganpati Chowk, Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500', 4.9, 1470, '$$', true, true, true, false, '09:00:00', '21:00:00', 30.00, 150.00, 30, true),

-- Coffee Lounge (Demo data)
('Coffee Lounge', 'Café and beverages', 'Café Specials, Shakes', 'Shivaji Complex, Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500', 4.9, 865, '$$', true, true, false, true, '08:00:00', '22:00:00', 30.00, 150.00, 20, true),

-- Hotel Temptation Pure Veg (Demo data)
('Hotel Temptation Pure Veg', 'Pure vegetarian', 'Maharashtrian, North Indian', 'Basmat Rd, Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500', 4.9, 651, '$$', true, true, true, false, '09:00:00', '21:00:00', 30.00, 150.00, 30, true),

-- Saffron Veg Restaurant (Demo data)
('Saffron Veg Restaurant', 'Vegetarian cuisine', 'North Indian, Maharashtrian', 'Railway Station Rd, Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500', 4.8, 451, '$$', true, true, true, false, '10:00:00', '21:00:00', 35.00, 200.00, 30, true)
ON CONFLICT DO NOTHING;
