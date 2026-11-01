-- Add image_url column to categories table
ALTER TABLE categories ADD COLUMN IF NOT EXISTS image_url VARCHAR(500);

-- Update existing categories with images
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500' WHERE name = 'North Indian';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500' WHERE name = 'South Indian';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500' WHERE name = 'Chinese';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500' WHERE name = 'Italian';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500' WHERE name = 'Beverages';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500' WHERE name = 'Desserts';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500' WHERE name = 'Fast Food';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500' WHERE name = 'Healthy';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500' WHERE name = 'Bakery';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500' WHERE name = 'Continental';

-- Insert additional categories
INSERT INTO categories (name, description, image_url) VALUES
('Pizza', 'Delicious pizzas from around the world', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500'),
('Biryani', 'Aromatic and flavorful biryani dishes', 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500'),
('Burgers', 'Juicy burgers and sandwiches', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500'),
('Tandoori', 'Traditional tandoori dishes', 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500'),
('Street Food', 'Popular street food items', 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500');
