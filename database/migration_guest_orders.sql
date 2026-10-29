-- Migration: Allow guest orders by making user_id nullable
-- Run this on an existing database WITHOUT dropping any tables or data.

-- Step 1: Drop the NOT NULL constraint on user_id in orders table
ALTER TABLE orders ALTER COLUMN user_id DROP NOT NULL;

-- Step 2: Add guest_name and guest_phone columns for guest checkout info
ALTER TABLE orders ADD COLUMN IF NOT EXISTS guest_name VARCHAR(100);
