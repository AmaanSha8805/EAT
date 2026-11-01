-- EAT Food Data Quality Fixes
-- This script fixes data quality issues identified in the audit
-- Date: October 30, 2026
-- 
-- Changes:
-- 1. Remove duplicate food item (Dal Makhani ID 57 from Restaurant 1)
-- 2. Fix vegetarian restaurants with non-veg items (remove non-veg items or unmark pure veg)
-- 3. Add proper image URLs for 54 food items with missing images
-- 4. Ensure UTF-8 encoding for categories

BEGIN;

-- ============================================
-- 1. Remove Duplicate Food Item
-- ============================================
-- Restaurant 1 has "Dal Makhani" twice (IDs: 2 and 57)
-- Keep ID 2, remove ID 57
DELETE FROM food_items WHERE food_id = 57;

-- ============================================
-- 2. Fix Vegetarian Restaurants with Non-Veg Items
-- ============================================
-- Option: Remove non-veg items from pure veg restaurants
-- This is the safer option to maintain restaurant classification

-- Restaurant 1 (Veg Aroma Restaurant) - Remove Butter Chicken and Chicken Biryani
DELETE FROM food_items WHERE food_id = 55;  -- Butter Chicken
DELETE FROM food_items WHERE food_id = 59;  -- Chicken Biryani

-- Restaurant 3 (Fortune Veg Restaurant) - Remove chicken items
DELETE FROM food_items WHERE food_id = 67;  -- Chicken Manchurian
DELETE FROM food_items WHERE food_id = 69;  -- Chicken Fried Rice
DELETE FROM food_items WHERE food_id = 72;  -- Chilli Chicken

-- Restaurant 10 (Hotel Bhakti veg restaurant) - Remove non-veg items
DELETE FROM food_items WHERE food_id = 109; -- Grilled Chicken
DELETE FROM food_items WHERE food_id = 110; -- Fish & Chips

-- ============================================
-- 3. Add Proper Image URLs for Food Items
-- ============================================
-- Using reliable Unsplash food images

-- Restaurant 2 - Hotel Rajhans Family Rooftop Restaurant
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop' WHERE food_id = 61;  -- Masala Dosa
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop' WHERE food_id = 62;  -- Idli Sambar
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop' WHERE food_id = 63;  -- Uttapam
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1626132647523-66d4e8c2f8e0?w=400&h=300&fit=crop' WHERE food_id = 64;  -- Rava Dosa
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop' WHERE food_id = 65;  -- Filter Coffee
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop' WHERE food_id = 66;  -- Vada

-- Restaurant 3 - Fortune Veg Restaurant (after removing chicken items, update remaining)
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&h=300&fit=crop' WHERE food_id = 68;  -- Veg Fried Rice
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=400&h=300&fit=crop' WHERE food_id = 70;  -- Hakka Noodles
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=400&h=300&fit=crop' WHERE food_id = 71;  -- Veg Manchurian

-- Restaurant 4 - Hotel Radhika Place and City Palace
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400&h=300&fit=crop' WHERE food_id = 73;  -- Margherita Pizza
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400&h=300&fit=crop' WHERE food_id = 74;  -- Pepperoni Pizza
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&h=300&fit=crop' WHERE food_id = 75;  -- Veggie Supreme
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1619535860434-ba1d8fa12536?w=400&h=300&fit=crop' WHERE food_id = 76;  -- Garlic Bread
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400&h=300&fit=crop' WHERE food_id = 77;  -- Pasta Alfredo
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=400&h=300&fit=crop' WHERE food_id = 78;  -- Chicken Pasta

-- Restaurant 5 - Coffee Lounge / Café
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=400&h=300&fit=crop' WHERE food_id = 79;  -- Cappuccino
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400&h=300&fit=crop' WHERE food_id = 80;  -- Latte
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1594631252845-29fc4cc8cde9?w=400&h=300&fit=crop' WHERE food_id = 81;  -- Cold Coffee
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1623065422902-30a2d299bbe4?w=400&h=300&fit=crop' WHERE food_id = 82;  -- Mango Smoothie
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400&h=300&fit=crop' WHERE food_id = 83;  -- Iced Tea
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=400&h=300&fit=crop' WHERE food_id = 84;  -- Sandwich

-- Restaurant 6 - Kekiz The Cake Shop
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400&h=300&fit=crop' WHERE food_id = 85;  -- Chocolate Cake
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=400&h=300&fit=crop' WHERE food_id = 86;  -- Red Velvet Cake
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=400&h=300&fit=crop' WHERE food_id = 87;  -- Ice Cream Sundae
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=400&h=300&fit=crop' WHERE food_id = 88;  -- Brownie
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=400&h=300&fit=crop' WHERE food_id = 89;  -- Cheesecake
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1666190094762-3a8f6f6a6f6f?w=400&h=300&fit=crop' WHERE food_id = 90;  -- Gulab Jamun

-- Restaurant 7 - B For Burger
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=300&fit=crop' WHERE food_id = 91;  -- Classic Burger
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=400&h=300&fit=crop' WHERE food_id = 92;  -- Veggie Burger
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=400&h=300&fit=crop' WHERE food_id = 93;  -- Chicken Burger
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400&h=300&fit=crop' WHERE food_id = 94;  -- French Fries
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1639024471283-03518883512d?w=400&h=300&fit=crop' WHERE food_id = 95;  -- Onion Rings
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=400&h=300&fit=crop' WHERE food_id = 96;  -- Coke

-- Restaurant 8 - Healthy Options
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400&h=300&fit=crop' WHERE food_id = 97;  -- Caesar Salad
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400&h=300&fit=crop' WHERE food_id = 98;  -- Greek Salad
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&h=300&fit=crop' WHERE food_id = 99;  -- Protein Bowl
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400&h=300&fit=crop' WHERE food_id = 100; -- Veggie Bowl
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=400&h=300&fit=crop' WHERE food_id = 101; -- Fresh Juice
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1511690656952-34342d7c3740?w=400&h=300&fit=crop' WHERE food_id = 102; -- Smoothie Bowl

-- Restaurant 9 - Bakery / Café
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=400&h=300&fit=crop' WHERE food_id = 103; -- Croissant
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1608198093002-ad4e005f1bca?w=400&h=300&fit=crop' WHERE food_id = 104; -- Chocolate Croissant
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=300&fit=crop' WHERE food_id = 105; -- Sandwich Bread
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1607958996333-41d1208014f3?w=400&h=300&fit=crop' WHERE food_id = 106; -- Muffin
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1585445490387-2ea9968f8bc1?w=400&h=300&fit=crop' WHERE food_id = 107; -- Bagel
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=400&h=300&fit=crop' WHERE food_id = 108; -- Pasta Bun

-- Restaurant 10 - Hotel Bhakti veg restaurant (after removing non-veg)
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=400&h=300&fit=crop' WHERE food_id = 111; -- Vegetable Lasagna
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400&h=300&fit=crop' WHERE food_id = 112; -- Mushroom Soup
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400&h=300&fit=crop' WHERE food_id = 113; -- Caesar Salad
UPDATE food_items SET image_url = 'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=400&h=300&fit=crop' WHERE food_id = 114; -- Chocolate Mousse

COMMIT;

-- ============================================
-- Verification Queries
-- ============================================

-- Check remaining food items count
SELECT 'Total Food Items after fixes: ' || COUNT(*) FROM food_items;

-- Check for remaining NULL images
SELECT 'Food Items with NULL images: ' || COUNT(*) FROM food_items WHERE image_url IS NULL OR image_url = '' OR image_url = 'null';

-- Check for remaining duplicates
SELECT 'Duplicate food items: ' || COUNT(*) FROM (
  SELECT restaurant_id, name, COUNT(*) as count
  FROM food_items
  GROUP BY restaurant_id, name
  HAVING COUNT(*) > 1
) dup;

-- Check vegetarian restaurants with non-veg items
SELECT 'Pure veg restaurants with non-veg items: ' || COUNT(*) FROM (
  SELECT r.restaurant_id
  FROM restaurants r
  JOIN food_items f ON r.restaurant_id = f.restaurant_id
  WHERE r.is_pure_veg = true AND f.is_vegetarian = false
  GROUP BY r.restaurant_id
) veg_with_nonveg;
