-- EAT - Coupon Seed Data
-- Sample coupons for discounts
-- Safe to run multiple times - uses INSERT ... ON CONFLICT DO NOTHING

INSERT INTO coupons (code, description, discount_type, discount_value, minimum_order_amount, max_discount_amount, usage_limit, valid_from, valid_until, is_active) VALUES
('WELCOME50', 'Welcome offer - 50% off on first order', 'percentage', 50.0, 200.00, 100.00, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '90 days', true),
('FLAT100', 'Flat ₹100 off on orders above ₹300', 'flat', 100.0, 300.00, NULL, 5000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '180 days', true),
('SAVE20', 'Save 20% on all orders', 'percentage', 20.0, 150.00, 150.00, 10000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '365 days', true),
('PARBHANI30', 'Special Parbhani offer - 30% off', 'percentage', 30.0, 250.00, 200.00, 2000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '60 days', true),
('FREEDEL', 'Free delivery on orders above ₹500', 'flat', 40.0, 500.00, 40.00, 5000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '120 days', true)
ON CONFLICT (code) DO NOTHING;
