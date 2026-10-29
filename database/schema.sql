-- EAT - Explore Amazing Taste Database Schema
-- PostgreSQL Database Schema

-- Custom ENUM types
CREATE TYPE user_role AS ENUM ('customer', 'admin');
CREATE TYPE price_range AS ENUM ('$', '$$', '$$$', '$$$$');
CREATE TYPE order_status AS ENUM ('placed', 'confirmed', 'preparing', 'out_for_delivery', 'delivered', 'cancelled');
CREATE TYPE payment_method AS ENUM ('cod', 'online');
CREATE TYPE payment_status AS ENUM ('pending', 'paid', 'failed');
CREATE TYPE delivery_status AS ENUM ('assigned', 'picked_up', 'delivered');

-- Users table (customers and admins)
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role user_role DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_role ON users(role);

-- Function to auto-update updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger for users table
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    icon VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_name UNIQUE (name)
);

-- Best For categories
CREATE TABLE best_for_categories (
    best_for_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_best_for_name UNIQUE (name)
);

-- Restaurants table
CREATE TABLE restaurants (
    restaurant_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    cuisine_type VARCHAR(100),
    address TEXT NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    image_url VARCHAR(500),
    rating NUMERIC(3,2) DEFAULT 0.00,
    review_count INTEGER DEFAULT 0,
    price_range price_range DEFAULT '$$',
    is_active BOOLEAN DEFAULT true,
    is_trending BOOLEAN DEFAULT false,
    is_student_friendly BOOLEAN DEFAULT false,
    is_family_special BOOLEAN DEFAULT false,
    is_couple_special BOOLEAN DEFAULT false,
    opening_time TIME,
    closing_time TIME,
    delivery_fee NUMERIC(10,2) DEFAULT 40.00,
    minimum_order_amount NUMERIC(10,2) DEFAULT 200.00,
    estimated_delivery_time INTEGER DEFAULT 30,
    is_pure_veg BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_rating ON restaurants(rating);
CREATE INDEX idx_trending ON restaurants(is_trending);
CREATE INDEX idx_active ON restaurants(is_active);

-- Trigger for restaurants table
CREATE TRIGGER update_restaurants_updated_at BEFORE UPDATE ON restaurants
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Restaurant-Category associations
CREATE TABLE restaurant_categories (
    restaurant_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (restaurant_id, category_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

-- Restaurant-Best For associations
CREATE TABLE restaurant_best_for (
    restaurant_id INTEGER NOT NULL,
    best_for_id INTEGER NOT NULL,
    PRIMARY KEY (restaurant_id, best_for_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE,
    FOREIGN KEY (best_for_id) REFERENCES best_for_categories(best_for_id) ON DELETE CASCADE
);

-- Food items table
CREATE TABLE food_items (
    food_id SERIAL PRIMARY KEY,
    restaurant_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    image_url VARCHAR(500),
    category VARCHAR(50),
    is_vegetarian BOOLEAN DEFAULT false,
    is_available BOOLEAN DEFAULT true,
    is_trending BOOLEAN DEFAULT false,
    preparation_time INTEGER DEFAULT 15,
    portion_size VARCHAR(50) DEFAULT 'Regular',
    customization_options TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE
);

CREATE INDEX idx_restaurant ON food_items(restaurant_id);
CREATE INDEX idx_available ON food_items(is_available);
CREATE INDEX idx_trending ON food_items(is_trending);

-- Trigger for food_items table
CREATE TRIGGER update_food_items_updated_at BEFORE UPDATE ON food_items
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INTEGER,
    restaurant_id INTEGER NOT NULL,
    total_amount NUMERIC(10,2) NOT NULL,
    status order_status DEFAULT 'placed',
    payment_method payment_method NOT NULL,
    payment_status payment_status DEFAULT 'pending',
    delivery_address TEXT NOT NULL,
    delivery_phone VARCHAR(20) NOT NULL,
    special_instructions TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

CREATE INDEX idx_user ON orders(user_id);
CREATE INDEX idx_restaurant ON orders(restaurant_id);
CREATE INDEX idx_status ON orders(status);
CREATE INDEX idx_created ON orders(created_at);

-- Trigger for orders table
CREATE TRIGGER update_orders_updated_at BEFORE UPDATE ON orders
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Order items table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    food_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    price_at_order NUMERIC(10,2) NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (food_id) REFERENCES food_items(food_id)
);

CREATE INDEX idx_order ON order_items(order_id);

-- Reviews table
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    restaurant_id INTEGER NOT NULL,
    food_rating INTEGER DEFAULT 0,
    ambience_rating INTEGER DEFAULT 0,
    service_rating INTEGER DEFAULT 0,
    value_rating INTEGER DEFAULT 0,
    overall_rating NUMERIC(3,2) NOT NULL,
    comment TEXT,
    is_approved BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    CONSTRAINT uk_user_restaurant UNIQUE (user_id, restaurant_id)
);

CREATE INDEX idx_restaurant_reviews ON reviews(restaurant_id);
CREATE INDEX idx_approved ON reviews(is_approved);

-- Trigger for reviews table
CREATE TRIGGER update_reviews_updated_at BEFORE UPDATE ON reviews
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Delivery persons table
CREATE TABLE delivery_persons (
    delivery_person_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    vehicle_number VARCHAR(20),
    is_available BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger for delivery_persons table
CREATE TRIGGER update_delivery_persons_updated_at BEFORE UPDATE ON delivery_persons
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Deliveries table
CREATE TABLE deliveries (
    delivery_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    delivery_person_id INTEGER,
    status delivery_status DEFAULT 'assigned',
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivered_at TIMESTAMP NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (delivery_person_id) REFERENCES delivery_persons(delivery_person_id)
);

CREATE INDEX idx_order_deliveries ON deliveries(order_id);
CREATE INDEX idx_delivery_person ON deliveries(delivery_person_id);
CREATE INDEX idx_status_deliveries ON deliveries(status);

-- User addresses table
CREATE TABLE user_addresses (
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

CREATE INDEX idx_user_addresses ON user_addresses(user_id);
CREATE INDEX idx_default_address ON user_addresses(is_default);

-- Trigger for user_addresses table
CREATE TRIGGER update_user_addresses_updated_at BEFORE UPDATE ON user_addresses
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Favorites table
CREATE TABLE favorites (
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

CREATE INDEX idx_user_favorites ON favorites(user_id);
CREATE INDEX idx_restaurant_favorites ON favorites(restaurant_id);
CREATE INDEX idx_food_favorites ON favorites(food_item_id);

-- Coupons table
CREATE TABLE coupons (
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

CREATE INDEX idx_coupon_code ON coupons(code);
CREATE INDEX idx_coupon_active ON coupons(is_active);

-- Trigger for coupons table
CREATE TRIGGER update_coupons_updated_at BEFORE UPDATE ON coupons
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Order coupons table
CREATE TABLE order_coupons (
    order_coupon_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    coupon_id INTEGER NOT NULL,
    discount_amount NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (coupon_id) REFERENCES coupons(coupon_id)
);

CREATE INDEX idx_order_coupons ON order_coupons(order_id);
