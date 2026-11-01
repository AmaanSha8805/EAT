-- Rollback script for payment methods migration
-- This will revert the database to the previous state

-- Step 1: Remove the new columns
ALTER TABLE orders DROP COLUMN IF EXISTS payment_gateway_response;
ALTER TABLE orders DROP COLUMN IF EXISTS payment_transaction_id;
ALTER TABLE orders DROP COLUMN IF EXISTS bank_name;
ALTER TABLE orders DROP COLUMN IF EXISTS card_type;
ALTER TABLE orders DROP COLUMN IF EXISTS card_last_four;
ALTER TABLE orders DROP COLUMN IF EXISTS upi_app;
ALTER TABLE orders DROP COLUMN IF EXISTS upi_id;

-- Step 2: Revert payment_method ENUM to original values
-- Create old ENUM type
CREATE TYPE payment_method_old AS ENUM ('cod', 'online');

-- Convert existing UPI, card, and net_banking payments to 'online'
UPDATE orders SET payment_method = 'online' WHERE payment_method NOT IN ('cod', 'online');

-- Convert column back to old type
ALTER TABLE orders ALTER COLUMN payment_method TYPE payment_method_old 
    USING payment_method::text::payment_method_old;

-- Drop the new type
DROP TYPE payment_method;

-- Rename the old type to the original name
ALTER TYPE payment_method_old RENAME TO payment_method;

-- Step 3: Remove indexes
DROP INDEX IF EXISTS idx_transaction_id;
DROP INDEX IF EXISTS idx_payment_status;
DROP INDEX IF EXISTS idx_payment_method;
