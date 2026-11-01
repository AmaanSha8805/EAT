-- Migration: Add is_deleted column to orders table for soft deletion
-- This allows users to hide orders from their history without permanently deleting them
-- Admins can still see deleted orders for record-keeping purposes

-- Add is_deleted column with default false
ALTER TABLE orders ADD COLUMN IF NOT EXISTS is_deleted BOOLEAN DEFAULT false;

-- Add index for faster queries filtering non-deleted orders
CREATE INDEX IF NOT EXISTS idx_is_deleted ON orders(is_deleted);

-- Update the getOrdersByUser query to filter out deleted orders
-- This will be handled in the application layer

-- Verify the column was added
SELECT column_name, data_type, column_default 
FROM information_schema.columns 
WHERE table_name = 'orders' AND column_name = 'is_deleted';
