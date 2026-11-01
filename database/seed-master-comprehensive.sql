-- EAT - Master Comprehensive Menu Expansion Script
-- This script runs all seed scripts in the correct order to upgrade to 44 restaurants with full menus
-- Run this after adding the 14 new restaurants

-- Step 1: Add 14 new restaurants (if not already added)
\i seed-additional-restaurants.sql

-- Step 2: Add comprehensive menu data for all 44 restaurants
\i seed-comprehensive-menus.sql

-- Verification
SELECT '=== Final Verification ===' as status;
SELECT 'Total Restaurants: ' || COUNT(*) as count FROM restaurants;
SELECT 'Total Food Items: ' || COUNT(*) as count FROM food_items;
SELECT 'Total Categories: ' || COUNT(*) as count FROM categories;

-- Show restaurant breakdown
SELECT r.name, COUNT(fi.food_id) as item_count
FROM restaurants r
LEFT JOIN food_items fi ON r.restaurant_id = fi.restaurant_id
GROUP BY r.restaurant_id, r.name
ORDER BY item_count DESC;

-- Show category breakdown
SELECT category, COUNT(*) as item_count
FROM food_items
GROUP BY category
ORDER BY item_count DESC;
