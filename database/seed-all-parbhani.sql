-- EAT - Complete Parbhani Seed Script
-- This script runs all seed data in the correct order
-- Run this after schema.sql or migration-add-new-fields.sql

-- Step 1: Insert expanded categories
\i seed-parbhani.sql

-- Step 2: Insert restaurant menu data
\i seed-parbhani-menus.sql

-- Step 3: Insert sample coupons
\i seed-coupons.sql

-- Verification queries
SELECT 'Categories count: ' || COUNT(*) FROM categories;
SELECT 'Restaurants count: ' || COUNT(*) FROM restaurants;
SELECT 'Food items count: ' || COUNT(*) FROM food_items;
SELECT 'Coupons count: ' || COUNT(*) FROM coupons;
