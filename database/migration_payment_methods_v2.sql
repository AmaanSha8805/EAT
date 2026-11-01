-- Simplified migration script to add payment methods
-- This approach works by temporarily adding 'online' to the new ENUM to allow conversion

-- Step 1: Create new ENUM with all values including 'online' for compatibility
CREATE TYPE payment_method_new AS ENUM ('cod', 'online', 'upi', 'card', 'net_banking');

-- Step 2: Convert column to new type
ALTER TABLE orders ALTER COLUMN payment_method TYPE payment_method_new
    USING payment_method::text::payment_method_new;

-- Step 3: Drop old type
DROP TYPE payment_method;

-- Step 4: Rename new type
ALTER TYPE payment_method_new RENAME TO payment_method;

-- Step 5: Convert 'online' to 'upi' for existing orders
UPDATE orders SET payment_method = 'upi' WHERE payment_method = 'online';

-- Step 6: Now we need to recreate the ENUM without 'online'
-- This requires another type swap
CREATE TYPE payment_method_final AS ENUM ('cod', 'upi', 'card', 'net_banking');

-- Convert column
ALTER TABLE orders ALTER COLUMN payment_method TYPE payment_method_final
    USING payment_method::text::payment_method_final;

-- Drop intermediate type
DROP TYPE payment_method;

-- Rename final type
ALTER TYPE payment_method_final RENAME TO payment_method;

-- Step 7: Add columns for payment details (these should already exist but we'll use IF NOT EXISTS)
ALTER TABLE orders ADD COLUMN IF NOT EXISTS upi_id VARCHAR(100);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS upi_app VARCHAR(50);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS card_last_four VARCHAR(4);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS card_type VARCHAR(20);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS bank_name VARCHAR(100);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_transaction_id VARCHAR(100);
ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_gateway_response TEXT;

-- Step 8: Add indexes
CREATE INDEX IF NOT EXISTS idx_payment_method ON orders(payment_method);
CREATE INDEX IF NOT EXISTS idx_payment_status ON orders(payment_status);
CREATE INDEX IF NOT EXISTS idx_transaction_id ON orders(payment_transaction_id);

-- Step 9: Add comments
COMMENT ON COLUMN orders.payment_method IS 'Payment method: cod, upi, card, net_banking';
COMMENT ON COLUMN orders.upi_id IS 'UPI ID for UPI payments';
COMMENT ON COLUMN orders.upi_app IS 'UPI app used: phonepe, gpay, paytm, other';
COMMENT ON COLUMN orders.card_last_four IS 'Last 4 digits of card for card payments';
COMMENT ON COLUMN orders.card_type IS 'Card type: credit, debit';
COMMENT ON COLUMN orders.bank_name IS 'Bank name for net banking';
COMMENT ON COLUMN orders.payment_transaction_id IS 'Transaction ID from payment gateway';
COMMENT ON COLUMN orders.payment_gateway_response IS 'Full response from payment gateway (JSON)';
