-- EAT - Add 14 Additional Restaurants
-- This script adds 14 new restaurants to reach 44 total
-- All data is demo/sample for illustration purposes

-- Insert 14 New Restaurants
INSERT INTO restaurants (name, description, cuisine_type, address, phone, email, image_url, rating, review_count, price_range, is_trending, is_student_friendly, is_family_special, is_couple_special, opening_time, closing_time, delivery_fee, minimum_order_amount, estimated_delivery_time, is_pure_veg) VALUES
-- 31. Spice Route - North Indian & Mughlai
('Spice Route', 'Authentic North Indian and Mughlai cuisine with rich aromatic curries', 'North Indian, Mughlai', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500', 4.7, 325, '$$', true, true, true, true, '11:00:00', '23:00:00', 40.00, 250.00, 35, false),

-- 32. Chai Pe Charcha - Café
('Chai Pe Charcha', 'Cozy café specializing in chai, snacks and light meals', 'Café Specials, Snacks', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500', 4.5, 412, '$', true, true, false, true, '08:00:00', '22:00:00', 25.00, 100.00, 20, true),

-- 33. Royal Biryani House - Biryani Specialist
('Royal Biryani House', 'Famous for authentic biryanis and kebabs', 'Biryani, Kebabs', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500', 4.8, 687, '$$', true, true, true, false, '11:00:00', '23:00:00', 40.00, 200.00, 35, false),

-- 34. Green Leaf - Pure Veg
('Green Leaf', '100% pure vegetarian restaurant with healthy options', 'Maharashtrian, Healthy Food', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500', 4.6, 234, '$$', true, true, true, false, '09:00:00', '21:00:00', 30.00, 150.00, 30, true),

-- 35. Momos Point - Chinese & Momos
('Momos Point', 'Specializes in momos and Indo-Chinese cuisine', 'Chinese, Momos', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500', 4.4, 189, '$', true, true, true, false, '11:00:00', '22:00:00', 25.00, 100.00, 25, false),

-- 36. Sweet Corner - Desserts
('Sweet Corner', 'Traditional Indian sweets and desserts', 'Sweets, Desserts', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500', 4.5, 312, '$$', true, true, false, true, '10:00:00', '21:00:00', 30.00, 150.00, 20, true),

-- 37. Tandoori Nights - Tandoor Specialties
('Tandoori Nights', 'Tandoor specialties and grilled items', 'North Indian, Kebabs', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500', 4.3, 156, '$$', true, true, true, false, '12:00:00', '23:00:00', 45.00, 300.00, 35, false),

-- 38. South Spice - South Indian
('South Spice', 'Authentic South Indian cuisine', 'South Indian', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500', 4.6, 278, '$', true, true, true, false, '07:00:00', '21:00:00', 30.00, 150.00, 30, true),

-- 39. Street Bites - Street Food
('Street Bites', 'Popular street food and chaat items', 'Maharashtrian, Junk Food', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=500', 4.4, 423, '$', true, true, true, false, '10:00:00', '22:00:00', 20.00, 100.00, 20, true),

-- 40. Pizza Corner - Pizza
('Pizza Corner', 'Fresh pizzas and Italian dishes', 'Pizza, Italian', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500', 4.2, 189, '$$', true, true, true, true, '11:00:00', '23:00:00', 40.00, 200.00, 30, false),

-- 41. Burger House - Burgers
('Burger House', 'Gourmet burgers and fast food', 'Burgers, Fast Food', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500', 4.1, 145, '$', true, true, true, false, '11:00:00', '22:00:00', 25.00, 100.00, 25, false),

-- 42. Healthy Bowl - Salads
('Healthy Bowl', 'Fresh salads and healthy meals', 'Salads, Healthy Food', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500', 4.5, 167, '$$', true, true, false, false, '09:00:00', '21:00:00', 35.00, 200.00, 25, true),

-- 43. Ice Cream Paradise - Ice Cream
('Ice Cream Paradise', 'Wide variety of ice creams and frozen desserts', 'Ice Cream, Desserts', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500', 4.6, 234, '$$', true, true, false, true, '10:00:00', '22:00:00', 30.00, 150.00, 20, true),

-- 44. Fresh Juice Bar - Juices
('Fresh Juice Bar', 'Fresh fruit juices and smoothies', 'Juices, Shakes', 'Demo Address - Parbhani', NULL, NULL, 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500', 4.4, 189, '$', true, true, false, true, '08:00:00', '21:00:00', 25.00, 100.00, 15, true)
ON CONFLICT DO NOTHING;

-- Insert Category Associations for New Restaurants
-- These map the new restaurants to appropriate categories
INSERT INTO restaurant_categories (restaurant_id, category_id)
SELECT r.restaurant_id, c.category_id
FROM restaurants r
CROSS JOIN categories c
WHERE r.name IN (
  'Spice Route', 'Chai Pe Charcha', 'Royal Biryani House', 'Green Leaf',
  'Momos Point', 'Sweet Corner', 'Tandoori Nights', 'South Spice',
  'Street Bites', 'Pizza Corner', 'Burger House', 'Healthy Bowl',
  'Ice Cream Paradise', 'Fresh Juice Bar'
)
AND (
  (r.name = 'Spice Route' AND c.name IN ('North Indian', 'Indian', 'Non-Veg'))
  OR (r.name = 'Chai Pe Charcha' AND c.name IN ('Café Specials', 'Breakfast', 'Snacks'))
  OR (r.name = 'Royal Biryani House' AND c.name IN ('Biryani', 'North Indian', 'Non-Veg'))
  OR (r.name = 'Green Leaf' AND c.name IN ('Maharashtrian', 'Pure Veg', 'Healthy Food'))
  OR (r.name = 'Momos Point' AND c.name IN ('Chinese', 'Momos', 'Junk Food'))
  OR (r.name = 'Sweet Corner' AND c.name IN ('Sweets', 'Desserts', 'Pure Veg'))
  OR (r.name = 'Tandoori Nights' AND c.name IN ('North Indian', 'Kebabs', 'Non-Veg'))
  OR (r.name = 'South Spice' AND c.name IN ('South Indian', 'Pure Veg'))
  OR (r.name = 'Street Bites' AND c.name IN ('Maharashtrian', 'Junk Food', 'Pure Veg'))
  OR (r.name = 'Pizza Corner' AND c.name IN ('Pizza', 'Italian'))
  OR (r.name = 'Burger House' AND c.name IN ('Burgers', 'Fast Food', 'Junk Food'))
  OR (r.name = 'Healthy Bowl' AND c.name IN ('Salads', 'Healthy Food', 'Pure Veg'))
  OR (r.name = 'Ice Cream Paradise' AND c.name IN ('Ice Cream', 'Desserts'))
  OR (r.name = 'Fresh Juice Bar' AND c.name IN ('Juices', 'Shakes', 'Cold Drinks'))
)
ON CONFLICT DO NOTHING;

-- Insert Best For Associations for New Restaurants
INSERT INTO restaurant_best_for (restaurant_id, best_for_id)
SELECT r.restaurant_id, bf.best_for_id
FROM restaurants r
CROSS JOIN best_for_categories bf
WHERE r.name IN (
  'Spice Route', 'Chai Pe Charcha', 'Royal Biryani House', 'Green Leaf',
  'Momos Point', 'Sweet Corner', 'Tandoori Nights', 'South Spice',
  'Street Bites', 'Pizza Corner', 'Burger House', 'Healthy Bowl',
  'Ice Cream Paradise', 'Fresh Juice Bar'
)
AND (
  (bf.name IN ('Friends', 'Family', 'Couples'))
  OR (bf.name = 'Budget Food' AND r.price_range IN ('$', '$$'))
  OR (bf.name = 'Coffee & Chill' AND r.cuisine_type LIKE '%Café%')
  OR (bf.name = 'Study & Work' AND r.name IN ('Chai Pe Charcha', 'Healthy Bowl', 'Fresh Juice Bar'))
)
ON CONFLICT DO NOTHING;

-- Verification Query
SELECT 'New restaurants added: ' || COUNT(*) as status
FROM restaurants
WHERE name IN (
  'Spice Route', 'Chai Pe Charcha', 'Royal Biryani House', 'Green Leaf',
  'Momos Point', 'Sweet Corner', 'Tandoori Nights', 'South Spice',
  'Street Bites', 'Pizza Corner', 'Burger House', 'Healthy Bowl',
  'Ice Cream Paradise', 'Fresh Juice Bar'
);
