-- Migration script for React + Express payment implementation
-- This script adds support for UPI, Card, and Net Banking payment methods

-- Step 1: Update payment_method ENUM to include new payment methods
-- PostgreSQL doesn't support adding values to ENUM in place, so we recreate it

-- Create new ENUM with all values including 'online' for existing data
CREATE TYPE payment_method_new AS ENUM ('cod', 'online', 'upi', 'card', 'net_banking');

-- Convert column to new type
ALTER TABLE orders ALTER COLUMN payment_method TYPE payment_method_new
    USING payment_method::text::payment_method_new;

-- Drop old type
DROP TYPE payment_method;

-- Rename new type
ALTER TYPE payment_method_new RENAME TO payment_method;

-- Step 2: Add columns for payment details
ALTER TABLE orders ADD COLUMN IF NOT EXISTS upi_id VARCHAR(100);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS upi_app VARCHAR(50);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS card_last_four VARCHAR(4);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS card_type VARCHAR(20);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS bank_name VARCHAR(100);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_transaction_id VARCHAR(100);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_gateway_response TEXT;

-- Step 3: Add indexes for payment-related queries
CREATE INDEX IF NOT EXISTS idx_payment_method ON orders(payment_method);
CREATE INDEX IF NOT EXISTS idx_payment_status ON orders(payment_status);
CREATE INDEX IF NOT EXISTS idx_transaction_id ON orders(payment_transaction_id);

-- Step 4: Add comments for documentation
COMMENT ON COLUMN orders.payment_method IS 'Payment method: cod, online, upi, card, net_banking';
COMMENT ON COLUMN orders.upi_id IS 'UPI ID for UPI payments';
COMMENT ON COLUMN orders.upi_app IS 'UPI app used: phonepe, gpay, paytm, other';
COMMENT ON COLUMN orders.card_last_four IS 'Last 4 digits of card for card payments';
COMMENT ON COLUMN orders.card_type IS 'Card type: credit, debit';
COMMENT ON COLUMN orders.bank_name IS 'Bank name for net banking';
COMMENT ON COLUMN orders.payment_transaction_id IS 'Transaction ID from payment gateway';
COMMENT ON COLUMN orders.payment_gateway_response IS 'Full response from payment gateway (JSON)';
