-- Migration Script: Add New Fields for Parbhani Upgrade
-- This script adds new fields to existing tables without destroying data
-- Safe to run on existing database

-- Add new columns to restaurants table
ALTER TABLE restaurants ADD COLUMN IF NOT EXISTS delivery_fee NUMERIC(10,2) DEFAULT 40.00;
ALTER TABLE restaurants ADD COLUMN IF NOT EXISTS minimum_order_amount NUMERIC(10,2) DEFAULT 200.00;
ALTER TABLE restaurants ADD COLUMN IF NOT EXISTS estimated_delivery_time INTEGER DEFAULT 30;
ALTER TABLE restaurants ADD COLUMN IF NOT EXISTS is_pure_veg BOOLEAN DEFAULT false;

-- Add new columns to food_items table
ALTER TABLE food_items ADD COLUMN IF NOT EXISTS portion_size VARCHAR(50) DEFAULT 'Regular';
ALTER TABLE food_items ADD COLUMN IF NOT EXISTS customization_options TEXT;

-- Create user_addresses table
CREATE TABLE IF NOT EXISTS user_addresses (
    address_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    address_type VARCHAR(50) DEFAULT 'home',
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    landmark VARCHAR(100),
    city VARCHAR(100) DEFAULT 'Parbhani',
    state VARCHAR(100) DEFAULT 'Maharashtra',
    pincode VARCHAR(10),
    phone VARCHAR(20),
    is_default BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_user_addresses ON user_addresses(user_id);
CREATE INDEX IF NOT EXISTS idx_default_address ON user_addresses(is_default);

-- Create trigger for user_addresses table
DROP TRIGGER IF EXISTS update_user_addresses_updated_at ON user_addresses;
CREATE TRIGGER update_user_addresses_updated_at BEFORE UPDATE ON user_addresses
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Create favorites table
CREATE TABLE IF NOT EXISTS favorites (
    favorite_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    restaurant_id INTEGER,
    food_item_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE,
    FOREIGN KEY (food_item_id) REFERENCES food_items(food_id) ON DELETE CASCADE,
    CONSTRAINT unique_favorite UNIQUE (user_id, restaurant_id, food_item_id)
);

CREATE INDEX IF NOT EXISTS idx_user_favorites ON favorites(user_id);
CREATE INDEX IF NOT EXISTS idx_restaurant_favorites ON favorites(restaurant_id);
CREATE INDEX IF NOT EXISTS idx_food_favorites ON favorites(food_item_id);

-- Create coupons table
CREATE TABLE IF NOT EXISTS coupons (
    coupon_id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    discount_type VARCHAR(20) DEFAULT 'percentage',
    discount_value NUMERIC(10,2) NOT NULL,
    minimum_order_amount NUMERIC(10,2) DEFAULT 0.00,
    max_discount_amount NUMERIC(10,2),
    usage_limit INTEGER,
    used_count INTEGER DEFAULT 0,
    valid_from TIMESTAMP NOT NULL,
    valid_until TIMESTAMP NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_coupon_code ON coupons(code);
CREATE INDEX IF NOT EXISTS idx_coupon_active ON coupons(is_active);

-- Create trigger for coupons table
DROP TRIGGER IF EXISTS update_coupons_updated_at ON coupons;
CREATE TRIGGER update_coupons_updated_at BEFORE UPDATE ON coupons
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Create order_coupons table
CREATE TABLE IF NOT EXISTS order_coupons (
    order_coupon_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    coupon_id INTEGER NOT NULL,
    discount_amount NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (coupon_id) REFERENCES coupons(coupon_id)
);

CREATE INDEX IF NOT EXISTS idx_order_coupons ON order_coupons(order_id);
