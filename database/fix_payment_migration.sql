-- Fix script to handle the partial migration
-- This will clean up and allow the corrected migration to run

-- Drop the new columns that were added
ALTER TABLE orders DROP COLUMN IF EXISTS payment_gateway_response;
ALTER TABLE orders DROP COLUMN IF EXISTS payment_transaction_id;
ALTER TABLE orders DROP COLUMN IF EXISTS bank_name;
ALTER TABLE orders DROP COLUMN IF EXISTS card_type;
ALTER TABLE orders DROP COLUMN IF EXISTS card_last_four;
ALTER TABLE orders DROP COLUMN IF EXISTS upi_app;
ALTER TABLE orders DROP COLUMN IF EXISTS upi_id;

-- Drop the indexes
DROP INDEX IF EXISTS idx_transaction_id;
DROP INDEX IF EXISTS idx_payment_status;
DROP INDEX IF EXISTS idx_payment_method;

-- Try to drop the new type if it exists
DROP TYPE IF EXISTS payment_method_new;
