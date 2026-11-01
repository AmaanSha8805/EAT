-- Migration: Add comprehensive menu items for all restaurants
-- Date: 2026-10-30
-- Purpose: Ensure every restaurant has at least 100 unique food items

-- Restaurant: Veg Aroma Restaurant (ID: 1)
-- Cuisine: North Indian, Maharashtrian
-- Pure Veg: True

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1001, 1, 'Paneer Tikka', 'Marinated paneer cubes grilled to perfection', 220.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1002, 1, 'Hara Bhara Kabab', 'Spinach and green pea patties', 180.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1003, 1, 'Veg Manchurian', 'Crispy vegetable balls in tangy sauce', 190.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1004, 1, 'Spring Roll', 'Crispy vegetable spring rolls', 150.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1005, 1, 'Paneer 65', 'Spicy paneer cubes deep fried', 200.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1006, 1, 'Mushroom Tikka', 'Marinated mushrooms grilled', 210.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1007, 1, 'Aloo Tikki', 'Spiced potato patties', 120.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1008, 1, 'Dahi Kebab', 'Hung curd patties', 180.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1009, 1, 'Corn Cheese Balls', 'Crispy corn and cheese balls', 170.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1010, 1, 'Veg Crispy', 'Crispy vegetable fingers', 160.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1011, 1, 'Paneer Butter Masala', 'Creamy paneer in tomato gravy', 240.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1012, 1, 'Dal Makhani', 'Creamy black lentils', 180.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1013, 1, 'Mix Veg', 'Mixed vegetables in gravy', 200.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1014, 1, 'Palak Paneer', 'Spinach with paneer cubes', 220.00, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1015, 1, 'Kadai Paneer', 'Paneer in bell pepper gravy', 230.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1016, 1, 'Shahi Paneer', 'Royal paneer in cashew gravy', 250.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1017, 1, 'Matar Paneer', 'Peas with paneer', 210.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1018, 1, 'Malai Kofta', 'Cheese dumplings in creamy gravy', 260.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1019, 1, 'Veg Kolhapuri', 'Spicy vegetable curry', 220.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1020, 1, 'Chana Masala', 'Chickpeas in spiced gravy', 190.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1021, 1, 'Rajma Masala', 'Kidney beans in gravy', 180.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1022, 1, 'Aloo Gobi', 'Potato and cauliflower curry', 160.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1023, 1, 'Baingan Bharta', 'Smoked eggplant curry', 170.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1024, 1, 'Bhindi Masala', 'Okra in spiced gravy', 160.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1025, 1, 'Paneer Do Pyaza', 'Paneer with double onions', 230.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1026, 1, 'Vegetable Biryani', 'Fragrant rice with mixed vegetables', 220.00, 'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1027, 1, 'Jeera Rice', 'Cumin flavored rice', 100.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1028, 1, 'Veg Pulao', 'Mildly spiced rice with vegetables', 180.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1029, 1, 'Kashmiri Pulao', 'Sweet and aromatic rice', 200.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1030, 1, 'Tawa Pulao', 'Spiced rice cooked on tawa', 190.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1031, 1, 'Lemon Rice', 'Tangy lemon flavored rice', 140.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1032, 1, 'Curd Rice', 'Comforting yogurt rice', 120.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1033, 1, 'Tomato Rice', 'Spicy tomato rice', 150.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1034, 1, 'Methi Rice', 'Fenugreek flavored rice', 160.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1035, 1, 'Coconut Rice', 'Coconut flavored rice', 170.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1036, 1, 'Butter Naan', 'Soft butter naan', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1037, 1, 'Garlic Naan', 'Naan with garlic butter', 45.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1038, 1, 'Cheese Naan', 'Naan stuffed with cheese', 55.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1039, 1, 'Tandoori Roti', 'Whole wheat tandoori bread', 25.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1040, 1, 'Missi Roti', 'Spiced gram flour bread', 30.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1041, 1, 'Kulcha', 'Stuffed bread', 35.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1042, 1, 'Paratha', 'Layered flatbread', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1043, 1, 'Aloo Paratha', 'Potato stuffed paratha', 50.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1044, 1, 'Paneer Paratha', 'Paneer stuffed paratha', 60.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1045, 1, 'Laccha Paratha', 'Layered crispy paratha', 45.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1046, 1, 'Misal Pav', 'Spicy sprouted curry with bread', 140.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1047, 1, 'Pav Bhaji', 'Spiced vegetable mash with bread', 160.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1048, 1, 'Vada Pav', 'Potato fritter in burger bun', 40.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1049, 1, 'Puran Poli', 'Sweet flatbread with jaggery filling', 60.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1050, 1, 'Sabudana Khichdi', 'Tapioca pearls with peanuts', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1051, 1, 'Pithla Bhakri', 'Gram flour curry with flatbread', 100.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1052, 1, 'Bhel Puri', 'Puffed rice with chutneys', 80.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1053, 1, 'Sev Puri', 'Crispy puri with toppings', 90.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1054, 1, 'Dahi Misal', 'Misal with yogurt', 150.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1055, 1, 'Usal Pav', 'Spiced sprouted curry', 130.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1056, 1, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1057, 1, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1058, 1, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1059, 1, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1060, 1, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1061, 1, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1062, 1, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1063, 1, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1064, 1, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1065, 1, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1066, 1, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1067, 1, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1068, 1, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1069, 1, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1070, 1, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1071, 1, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1072, 1, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1073, 1, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1074, 1, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1075, 1, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1076, 1, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1077, 1, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1078, 1, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1079, 1, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1080, 1, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1081, 1, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1082, 1, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1083, 1, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1084, 1, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1085, 1, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1086, 1, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1087, 1, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1088, 1, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1089, 1, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1090, 1, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1091, 1, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1092, 1, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1093, 1, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1094, 1, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1095, 1, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1096, 1, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1097, 1, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1098, 1, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1099, 1, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1100, 1, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1101, 1, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1102, 1, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1103, 1, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1104, 1, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1105, 1, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1106, 1, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1107, 1, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1108, 1, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1109, 1, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1110, 1, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1111, 1, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1112, 1, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1113, 1, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1114, 1, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1115, 1, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
-- Total items for Veg Aroma Restaurant: 115


-- Restaurant: Hotel Rajhans Family Rooftop Restaurant (ID: 2)
-- Cuisine: Chinese
-- Pure Veg: False

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1116, 2, 'Veg Spring Roll', 'Crispy vegetable rolls', 140.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1117, 2, 'Chicken Spring Roll', 'Crispy chicken rolls', 160.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1118, 2, 'Veg Momos', 'Steamed vegetable dumplings', 120.00, 'https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1119, 2, 'Chicken Momos', 'Steamed chicken dumplings', 140.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1120, 2, 'Honey Chilli Potato', 'Crispy potatoes in honey sauce', 150.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1121, 2, 'Crispy Corn', 'Fried corn with spices', 160.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1122, 2, 'Paneer Chilli', 'Spicy paneer in sauce', 180.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1123, 2, 'Chicken Chilli', 'Spicy chicken in sauce', 200.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1124, 2, 'Veg Wontons', 'Fried vegetable wontons', 150.00, 'https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1125, 2, 'Chicken Wontons', 'Fried chicken wontons', 170.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1126, 2, 'Veg Fried Rice', 'Stir-fried rice with vegetables', 180.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1127, 2, 'Chicken Fried Rice', 'Stir-fried rice with chicken', 220.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1128, 2, 'Veg Noodles', 'Stir-fried noodles with vegetables', 170.00, 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1129, 2, 'Chicken Noodles', 'Stir-fried noodles with chicken', 210.00, 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1130, 2, 'Hakka Noodles', 'Spicy vegetable noodles', 180.00, 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1131, 2, 'Schezwan Fried Rice', 'Spicy Schezwan rice', 200.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1132, 2, 'Manchurian Gravy', 'Veg balls in gravy', 190.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1133, 2, 'Gobi Manchurian', 'Cauliflower in sauce', 180.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1134, 2, 'Paneer Fried Rice', 'Fried rice with paneer', 200.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1135, 2, 'Egg Fried Rice', 'Fried rice with egg', 190.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1136, 2, 'Singapore Noodles', 'Curried noodles', 190.00, 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1137, 2, 'Thai Fried Rice', 'Thai style fried rice', 210.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1138, 2, 'Veg Manchow Soup', 'Spicy vegetable soup', 120.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1139, 2, 'Hot and Sour Soup', 'Spicy tangy soup', 130.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1140, 2, 'Sweet Corn Soup', 'Creamy corn soup', 110.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1141, 2, 'Chicken Manchurian', 'Chicken in Indo-Chinese sauce', 260.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1142, 2, 'Chilli Chicken', 'Spicy chicken in sauce', 280.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1143, 2, 'Chicken Fried Rice', 'Fried rice with chicken', 240.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1144, 2, 'Chicken Noodles', 'Stir-fried noodles with chicken', 230.00, 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80', 'Noodles', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1145, 2, 'Chicken Momos', 'Steamed chicken dumplings', 160.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1146, 2, 'Chicken Spring Roll', 'Crispy chicken rolls', 180.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1147, 2, 'Chicken Wontons', 'Fried chicken wontons', 190.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1148, 2, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1149, 2, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1150, 2, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1151, 2, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1152, 2, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1153, 2, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1154, 2, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1155, 2, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1156, 2, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1157, 2, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1158, 2, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1159, 2, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1160, 2, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1161, 2, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1162, 2, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1163, 2, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1164, 2, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1165, 2, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1166, 2, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1167, 2, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1168, 2, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1169, 2, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1170, 2, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1171, 2, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1172, 2, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1173, 2, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1174, 2, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1175, 2, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1176, 2, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1177, 2, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1178, 2, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1179, 2, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1180, 2, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1181, 2, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1182, 2, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1183, 2, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1184, 2, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1185, 2, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1186, 2, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1187, 2, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1188, 2, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1189, 2, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1190, 2, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1191, 2, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1192, 2, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1193, 2, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1194, 2, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1195, 2, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1196, 2, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1197, 2, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1198, 2, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1199, 2, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1200, 2, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1201, 2, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1202, 2, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1203, 2, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1204, 2, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1205, 2, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1206, 2, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1207, 2, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1208, 2, 'Special Veg Spring Roll', 'Special Crispy vegetable rolls', 160.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1209, 2, 'Special Chicken Spring Roll', 'Special Crispy chicken rolls', 180.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1210, 2, 'Special Veg Momos', 'Special Steamed vegetable dumplings', 140.00, 'https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1211, 2, 'Special Chicken Momos', 'Special Steamed chicken dumplings', 160.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1212, 2, 'Special Honey Chilli Potato', 'Special Crispy potatoes in honey sauce', 170.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1213, 2, 'Special Crispy Corn', 'Special Fried corn with spices', 180.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1214, 2, 'Special Paneer Chilli', 'Special Spicy paneer in sauce', 200.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1215, 2, 'Special Chicken Chilli', 'Special Spicy chicken in sauce', 220.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
-- Total items for Hotel Rajhans Family Rooftop Restaurant: 100


-- Restaurant: Hotel Radhika Place and City Palace (ID: 4)
-- Cuisine: North Indian, Chinese
-- Pure Veg: False

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1216, 4, 'Paneer Tikka', 'Marinated paneer cubes grilled to perfection', 220.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1217, 4, 'Hara Bhara Kabab', 'Spinach and green pea patties', 180.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1218, 4, 'Veg Manchurian', 'Crispy vegetable balls in tangy sauce', 190.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1219, 4, 'Spring Roll', 'Crispy vegetable spring rolls', 150.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1220, 4, 'Paneer 65', 'Spicy paneer cubes deep fried', 200.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1221, 4, 'Mushroom Tikka', 'Marinated mushrooms grilled', 210.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1222, 4, 'Aloo Tikki', 'Spiced potato patties', 120.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1223, 4, 'Dahi Kebab', 'Hung curd patties', 180.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1224, 4, 'Corn Cheese Balls', 'Crispy corn and cheese balls', 170.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1225, 4, 'Veg Crispy', 'Crispy vegetable fingers', 160.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1226, 4, 'Paneer Butter Masala', 'Creamy paneer in tomato gravy', 240.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1227, 4, 'Dal Makhani', 'Creamy black lentils', 180.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1228, 4, 'Mix Veg', 'Mixed vegetables in gravy', 200.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1229, 4, 'Palak Paneer', 'Spinach with paneer cubes', 220.00, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1230, 4, 'Kadai Paneer', 'Paneer in bell pepper gravy', 230.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1231, 4, 'Shahi Paneer', 'Royal paneer in cashew gravy', 250.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1232, 4, 'Matar Paneer', 'Peas with paneer', 210.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1233, 4, 'Malai Kofta', 'Cheese dumplings in creamy gravy', 260.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1234, 4, 'Veg Kolhapuri', 'Spicy vegetable curry', 220.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1235, 4, 'Chana Masala', 'Chickpeas in spiced gravy', 190.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1236, 4, 'Rajma Masala', 'Kidney beans in gravy', 180.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1237, 4, 'Aloo Gobi', 'Potato and cauliflower curry', 160.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1238, 4, 'Baingan Bharta', 'Smoked eggplant curry', 170.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1239, 4, 'Bhindi Masala', 'Okra in spiced gravy', 160.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1240, 4, 'Paneer Do Pyaza', 'Paneer with double onions', 230.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1241, 4, 'Vegetable Biryani', 'Fragrant rice with mixed vegetables', 220.00, 'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1242, 4, 'Jeera Rice', 'Cumin flavored rice', 100.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1243, 4, 'Veg Pulao', 'Mildly spiced rice with vegetables', 180.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1244, 4, 'Kashmiri Pulao', 'Sweet and aromatic rice', 200.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1245, 4, 'Tawa Pulao', 'Spiced rice cooked on tawa', 190.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1246, 4, 'Lemon Rice', 'Tangy lemon flavored rice', 140.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1247, 4, 'Curd Rice', 'Comforting yogurt rice', 120.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1248, 4, 'Tomato Rice', 'Spicy tomato rice', 150.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1249, 4, 'Methi Rice', 'Fenugreek flavored rice', 160.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1250, 4, 'Coconut Rice', 'Coconut flavored rice', 170.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1251, 4, 'Butter Naan', 'Soft butter naan', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1252, 4, 'Garlic Naan', 'Naan with garlic butter', 45.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1253, 4, 'Cheese Naan', 'Naan stuffed with cheese', 55.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1254, 4, 'Tandoori Roti', 'Whole wheat tandoori bread', 25.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1255, 4, 'Missi Roti', 'Spiced gram flour bread', 30.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1256, 4, 'Kulcha', 'Stuffed bread', 35.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1257, 4, 'Paratha', 'Layered flatbread', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1258, 4, 'Aloo Paratha', 'Potato stuffed paratha', 50.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1259, 4, 'Paneer Paratha', 'Paneer stuffed paratha', 60.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1260, 4, 'Laccha Paratha', 'Layered crispy paratha', 45.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1261, 4, 'Misal Pav', 'Spicy sprouted curry with bread', 140.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1262, 4, 'Pav Bhaji', 'Spiced vegetable mash with bread', 160.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1263, 4, 'Vada Pav', 'Potato fritter in burger bun', 40.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1264, 4, 'Puran Poli', 'Sweet flatbread with jaggery filling', 60.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1265, 4, 'Sabudana Khichdi', 'Tapioca pearls with peanuts', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1266, 4, 'Pithla Bhakri', 'Gram flour curry with flatbread', 100.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1267, 4, 'Bhel Puri', 'Puffed rice with chutneys', 80.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1268, 4, 'Sev Puri', 'Crispy puri with toppings', 90.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1269, 4, 'Dahi Misal', 'Misal with yogurt', 150.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1270, 4, 'Usal Pav', 'Spiced sprouted curry', 130.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1271, 4, 'Chicken Tikka', 'Marinated chicken grilled', 260.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1272, 4, 'Chicken 65', 'Spicy fried chicken', 240.00, 'https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1273, 4, 'Mutton Seekh Kebab', 'Minced mutton skewers', 320.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1274, 4, 'Fish Tikka', 'Marinated fish grilled', 280.00, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1275, 4, 'Chicken Lollipop', 'Chicken wings in sauce', 250.00, 'https://images.unsplash.com/photo-1562967916-eb82221dfb92?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1276, 4, 'Mutton Galouti Kebab', 'Melt-in-mouth mutton kebabs', 350.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1277, 4, 'Reshmi Kebab', 'Silky chicken kebabs', 270.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1278, 4, 'Tandoori Chicken', 'Spiced tandoori chicken', 290.00, 'https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1279, 4, 'Chicken Manchurian', 'Chicken in Indo-Chinese sauce', 260.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1280, 4, 'Prawn Koliwada', 'Spiced fried prawns', 340.00, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1281, 4, 'Butter Chicken', 'Chicken in creamy tomato gravy', 280.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1282, 4, 'Chicken Tikka Masala', 'Chicken in spiced gravy', 270.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1283, 4, 'Mutton Rogan Josh', 'Kashmiri style mutton curry', 340.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1284, 4, 'Chicken Korma', 'Chicken in mild creamy gravy', 260.00, 'https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1285, 4, 'Mutton Biryani', 'Aromatic mutton rice', 320.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1286, 4, 'Chicken Biryani', 'Aromatic chicken rice', 280.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1287, 4, 'Keema Matar', 'Minced meat with peas', 260.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1288, 4, 'Egg Curry', 'Eggs in spiced gravy', 180.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1289, 4, 'Fish Curry', 'Fish in coconut gravy', 300.00, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1290, 4, 'Chicken Do Pyaza', 'Chicken with double onions', 270.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1291, 4, 'Mutton Do Pyaza', 'Mutton with double onions', 330.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1292, 4, 'Kadai Chicken', 'Chicken in bell pepper gravy', 280.00, 'https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1293, 4, 'Chicken Chettinad', 'Spicy South Indian chicken', 290.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1294, 4, 'Mutton Kofta', 'Mutton dumplings in gravy', 350.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1295, 4, 'Egg Bhurji', 'Scrambled eggs with spices', 160.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1296, 4, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1297, 4, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1298, 4, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1299, 4, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1300, 4, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1301, 4, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1302, 4, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1303, 4, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1304, 4, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1305, 4, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1306, 4, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1307, 4, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1308, 4, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1309, 4, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1310, 4, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1311, 4, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1312, 4, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1313, 4, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1314, 4, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1315, 4, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1316, 4, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1317, 4, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1318, 4, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1319, 4, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1320, 4, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1321, 4, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1322, 4, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1323, 4, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1324, 4, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1325, 4, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1326, 4, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1327, 4, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1328, 4, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1329, 4, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1330, 4, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1331, 4, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1332, 4, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1333, 4, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1334, 4, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1335, 4, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1336, 4, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1337, 4, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1338, 4, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1339, 4, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1340, 4, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1341, 4, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1342, 4, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1343, 4, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1344, 4, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1345, 4, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1346, 4, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1347, 4, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1348, 4, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1349, 4, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1350, 4, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1351, 4, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1352, 4, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1353, 4, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1354, 4, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1355, 4, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
-- Total items for Hotel Radhika Place and City Palace: 140


-- Restaurant: Hotel Poonam (ID: 31)
-- Cuisine: North Indian, Maharashtrian
-- Pure Veg: True

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1356, 31, 'Paneer Tikka', 'Marinated paneer cubes grilled to perfection', 220.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1357, 31, 'Hara Bhara Kabab', 'Spinach and green pea patties', 180.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1358, 31, 'Veg Manchurian', 'Crispy vegetable balls in tangy sauce', 190.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1359, 31, 'Spring Roll', 'Crispy vegetable spring rolls', 150.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1360, 31, 'Paneer 65', 'Spicy paneer cubes deep fried', 200.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1361, 31, 'Mushroom Tikka', 'Marinated mushrooms grilled', 210.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1362, 31, 'Aloo Tikki', 'Spiced potato patties', 120.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1363, 31, 'Dahi Kebab', 'Hung curd patties', 180.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1364, 31, 'Corn Cheese Balls', 'Crispy corn and cheese balls', 170.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1365, 31, 'Veg Crispy', 'Crispy vegetable fingers', 160.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1366, 31, 'Paneer Butter Masala', 'Creamy paneer in tomato gravy', 240.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1367, 31, 'Dal Makhani', 'Creamy black lentils', 180.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1368, 31, 'Mix Veg', 'Mixed vegetables in gravy', 200.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1369, 31, 'Palak Paneer', 'Spinach with paneer cubes', 220.00, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1370, 31, 'Kadai Paneer', 'Paneer in bell pepper gravy', 230.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1371, 31, 'Shahi Paneer', 'Royal paneer in cashew gravy', 250.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1372, 31, 'Matar Paneer', 'Peas with paneer', 210.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1373, 31, 'Malai Kofta', 'Cheese dumplings in creamy gravy', 260.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1374, 31, 'Veg Kolhapuri', 'Spicy vegetable curry', 220.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1375, 31, 'Chana Masala', 'Chickpeas in spiced gravy', 190.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1376, 31, 'Rajma Masala', 'Kidney beans in gravy', 180.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1377, 31, 'Aloo Gobi', 'Potato and cauliflower curry', 160.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1378, 31, 'Baingan Bharta', 'Smoked eggplant curry', 170.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1379, 31, 'Bhindi Masala', 'Okra in spiced gravy', 160.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1380, 31, 'Paneer Do Pyaza', 'Paneer with double onions', 230.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1381, 31, 'Vegetable Biryani', 'Fragrant rice with mixed vegetables', 220.00, 'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1382, 31, 'Jeera Rice', 'Cumin flavored rice', 100.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1383, 31, 'Veg Pulao', 'Mildly spiced rice with vegetables', 180.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1384, 31, 'Kashmiri Pulao', 'Sweet and aromatic rice', 200.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1385, 31, 'Tawa Pulao', 'Spiced rice cooked on tawa', 190.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1386, 31, 'Lemon Rice', 'Tangy lemon flavored rice', 140.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1387, 31, 'Curd Rice', 'Comforting yogurt rice', 120.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1388, 31, 'Tomato Rice', 'Spicy tomato rice', 150.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1389, 31, 'Methi Rice', 'Fenugreek flavored rice', 160.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1390, 31, 'Coconut Rice', 'Coconut flavored rice', 170.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1391, 31, 'Butter Naan', 'Soft butter naan', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1392, 31, 'Garlic Naan', 'Naan with garlic butter', 45.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1393, 31, 'Cheese Naan', 'Naan stuffed with cheese', 55.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1394, 31, 'Tandoori Roti', 'Whole wheat tandoori bread', 25.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1395, 31, 'Missi Roti', 'Spiced gram flour bread', 30.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1396, 31, 'Kulcha', 'Stuffed bread', 35.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1397, 31, 'Paratha', 'Layered flatbread', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1398, 31, 'Aloo Paratha', 'Potato stuffed paratha', 50.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1399, 31, 'Paneer Paratha', 'Paneer stuffed paratha', 60.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1400, 31, 'Laccha Paratha', 'Layered crispy paratha', 45.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1401, 31, 'Misal Pav', 'Spicy sprouted curry with bread', 140.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1402, 31, 'Pav Bhaji', 'Spiced vegetable mash with bread', 160.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1403, 31, 'Vada Pav', 'Potato fritter in burger bun', 40.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1404, 31, 'Puran Poli', 'Sweet flatbread with jaggery filling', 60.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1405, 31, 'Sabudana Khichdi', 'Tapioca pearls with peanuts', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1406, 31, 'Pithla Bhakri', 'Gram flour curry with flatbread', 100.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1407, 31, 'Bhel Puri', 'Puffed rice with chutneys', 80.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1408, 31, 'Sev Puri', 'Crispy puri with toppings', 90.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1409, 31, 'Dahi Misal', 'Misal with yogurt', 150.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1410, 31, 'Usal Pav', 'Spiced sprouted curry', 130.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1411, 31, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1412, 31, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1413, 31, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1414, 31, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1415, 31, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1416, 31, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1417, 31, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1418, 31, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1419, 31, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1420, 31, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1421, 31, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1422, 31, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1423, 31, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1424, 31, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1425, 31, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1426, 31, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1427, 31, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1428, 31, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1429, 31, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1430, 31, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1431, 31, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1432, 31, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1433, 31, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1434, 31, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1435, 31, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1436, 31, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1437, 31, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1438, 31, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1439, 31, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1440, 31, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1441, 31, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1442, 31, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1443, 31, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1444, 31, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1445, 31, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1446, 31, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1447, 31, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1448, 31, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1449, 31, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1450, 31, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1451, 31, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1452, 31, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1453, 31, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1454, 31, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1455, 31, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1456, 31, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1457, 31, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1458, 31, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1459, 31, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1460, 31, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1461, 31, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1462, 31, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1463, 31, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1464, 31, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1465, 31, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1466, 31, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1467, 31, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1468, 31, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1469, 31, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1470, 31, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
-- Total items for Hotel Poonam: 115


-- Restaurant: Hotel Temptation Pure Veg (ID: 32)
-- Cuisine: Maharashtrian, North Indian
-- Pure Veg: True

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1471, 32, 'Paneer Tikka', 'Marinated paneer cubes grilled to perfection', 220.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1472, 32, 'Hara Bhara Kabab', 'Spinach and green pea patties', 180.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1473, 32, 'Veg Manchurian', 'Crispy vegetable balls in tangy sauce', 190.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1474, 32, 'Spring Roll', 'Crispy vegetable spring rolls', 150.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1475, 32, 'Paneer 65', 'Spicy paneer cubes deep fried', 200.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1476, 32, 'Mushroom Tikka', 'Marinated mushrooms grilled', 210.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1477, 32, 'Aloo Tikki', 'Spiced potato patties', 120.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1478, 32, 'Dahi Kebab', 'Hung curd patties', 180.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1479, 32, 'Corn Cheese Balls', 'Crispy corn and cheese balls', 170.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1480, 32, 'Veg Crispy', 'Crispy vegetable fingers', 160.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1481, 32, 'Paneer Butter Masala', 'Creamy paneer in tomato gravy', 240.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1482, 32, 'Dal Makhani', 'Creamy black lentils', 180.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1483, 32, 'Mix Veg', 'Mixed vegetables in gravy', 200.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1484, 32, 'Palak Paneer', 'Spinach with paneer cubes', 220.00, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1485, 32, 'Kadai Paneer', 'Paneer in bell pepper gravy', 230.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1486, 32, 'Shahi Paneer', 'Royal paneer in cashew gravy', 250.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1487, 32, 'Matar Paneer', 'Peas with paneer', 210.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1488, 32, 'Malai Kofta', 'Cheese dumplings in creamy gravy', 260.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1489, 32, 'Veg Kolhapuri', 'Spicy vegetable curry', 220.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1490, 32, 'Chana Masala', 'Chickpeas in spiced gravy', 190.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1491, 32, 'Rajma Masala', 'Kidney beans in gravy', 180.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1492, 32, 'Aloo Gobi', 'Potato and cauliflower curry', 160.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1493, 32, 'Baingan Bharta', 'Smoked eggplant curry', 170.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1494, 32, 'Bhindi Masala', 'Okra in spiced gravy', 160.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1495, 32, 'Paneer Do Pyaza', 'Paneer with double onions', 230.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1496, 32, 'Vegetable Biryani', 'Fragrant rice with mixed vegetables', 220.00, 'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1497, 32, 'Jeera Rice', 'Cumin flavored rice', 100.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1498, 32, 'Veg Pulao', 'Mildly spiced rice with vegetables', 180.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1499, 32, 'Kashmiri Pulao', 'Sweet and aromatic rice', 200.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1500, 32, 'Tawa Pulao', 'Spiced rice cooked on tawa', 190.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1501, 32, 'Lemon Rice', 'Tangy lemon flavored rice', 140.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1502, 32, 'Curd Rice', 'Comforting yogurt rice', 120.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1503, 32, 'Tomato Rice', 'Spicy tomato rice', 150.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1504, 32, 'Methi Rice', 'Fenugreek flavored rice', 160.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1505, 32, 'Coconut Rice', 'Coconut flavored rice', 170.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1506, 32, 'Butter Naan', 'Soft butter naan', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1507, 32, 'Garlic Naan', 'Naan with garlic butter', 45.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1508, 32, 'Cheese Naan', 'Naan stuffed with cheese', 55.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1509, 32, 'Tandoori Roti', 'Whole wheat tandoori bread', 25.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1510, 32, 'Missi Roti', 'Spiced gram flour bread', 30.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1511, 32, 'Kulcha', 'Stuffed bread', 35.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1512, 32, 'Paratha', 'Layered flatbread', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1513, 32, 'Aloo Paratha', 'Potato stuffed paratha', 50.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1514, 32, 'Paneer Paratha', 'Paneer stuffed paratha', 60.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1515, 32, 'Laccha Paratha', 'Layered crispy paratha', 45.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1516, 32, 'Misal Pav', 'Spicy sprouted curry with bread', 140.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1517, 32, 'Pav Bhaji', 'Spiced vegetable mash with bread', 160.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1518, 32, 'Vada Pav', 'Potato fritter in burger bun', 40.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1519, 32, 'Puran Poli', 'Sweet flatbread with jaggery filling', 60.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1520, 32, 'Sabudana Khichdi', 'Tapioca pearls with peanuts', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1521, 32, 'Pithla Bhakri', 'Gram flour curry with flatbread', 100.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1522, 32, 'Bhel Puri', 'Puffed rice with chutneys', 80.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1523, 32, 'Sev Puri', 'Crispy puri with toppings', 90.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1524, 32, 'Dahi Misal', 'Misal with yogurt', 150.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1525, 32, 'Usal Pav', 'Spiced sprouted curry', 130.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1526, 32, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1527, 32, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1528, 32, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1529, 32, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1530, 32, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1531, 32, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1532, 32, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1533, 32, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1534, 32, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1535, 32, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1536, 32, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1537, 32, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1538, 32, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1539, 32, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1540, 32, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1541, 32, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1542, 32, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1543, 32, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1544, 32, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1545, 32, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1546, 32, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1547, 32, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1548, 32, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1549, 32, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1550, 32, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1551, 32, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1552, 32, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1553, 32, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1554, 32, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1555, 32, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1556, 32, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1557, 32, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1558, 32, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1559, 32, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1560, 32, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1561, 32, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1562, 32, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1563, 32, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1564, 32, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1565, 32, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1566, 32, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1567, 32, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1568, 32, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1569, 32, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1570, 32, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1571, 32, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1572, 32, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1573, 32, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1574, 32, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1575, 32, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1576, 32, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1577, 32, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1578, 32, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1579, 32, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1580, 32, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1581, 32, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1582, 32, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1583, 32, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1584, 32, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1585, 32, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
-- Total items for Hotel Temptation Pure Veg: 115


-- Restaurant: Saffron Veg Restaurant (ID: 33)
-- Cuisine: North Indian, Maharashtrian
-- Pure Veg: True

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1586, 33, 'Paneer Tikka', 'Marinated paneer cubes grilled to perfection', 220.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1587, 33, 'Hara Bhara Kabab', 'Spinach and green pea patties', 180.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1588, 33, 'Veg Manchurian', 'Crispy vegetable balls in tangy sauce', 190.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1589, 33, 'Spring Roll', 'Crispy vegetable spring rolls', 150.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1590, 33, 'Paneer 65', 'Spicy paneer cubes deep fried', 200.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1591, 33, 'Mushroom Tikka', 'Marinated mushrooms grilled', 210.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1592, 33, 'Aloo Tikki', 'Spiced potato patties', 120.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1593, 33, 'Dahi Kebab', 'Hung curd patties', 180.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1594, 33, 'Corn Cheese Balls', 'Crispy corn and cheese balls', 170.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1595, 33, 'Veg Crispy', 'Crispy vegetable fingers', 160.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1596, 33, 'Paneer Butter Masala', 'Creamy paneer in tomato gravy', 240.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1597, 33, 'Dal Makhani', 'Creamy black lentils', 180.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1598, 33, 'Mix Veg', 'Mixed vegetables in gravy', 200.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1599, 33, 'Palak Paneer', 'Spinach with paneer cubes', 220.00, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1600, 33, 'Kadai Paneer', 'Paneer in bell pepper gravy', 230.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1601, 33, 'Shahi Paneer', 'Royal paneer in cashew gravy', 250.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1602, 33, 'Matar Paneer', 'Peas with paneer', 210.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1603, 33, 'Malai Kofta', 'Cheese dumplings in creamy gravy', 260.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1604, 33, 'Veg Kolhapuri', 'Spicy vegetable curry', 220.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1605, 33, 'Chana Masala', 'Chickpeas in spiced gravy', 190.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1606, 33, 'Rajma Masala', 'Kidney beans in gravy', 180.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1607, 33, 'Aloo Gobi', 'Potato and cauliflower curry', 160.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1608, 33, 'Baingan Bharta', 'Smoked eggplant curry', 170.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1609, 33, 'Bhindi Masala', 'Okra in spiced gravy', 160.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1610, 33, 'Paneer Do Pyaza', 'Paneer with double onions', 230.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1611, 33, 'Vegetable Biryani', 'Fragrant rice with mixed vegetables', 220.00, 'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1612, 33, 'Jeera Rice', 'Cumin flavored rice', 100.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1613, 33, 'Veg Pulao', 'Mildly spiced rice with vegetables', 180.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1614, 33, 'Kashmiri Pulao', 'Sweet and aromatic rice', 200.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1615, 33, 'Tawa Pulao', 'Spiced rice cooked on tawa', 190.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1616, 33, 'Lemon Rice', 'Tangy lemon flavored rice', 140.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1617, 33, 'Curd Rice', 'Comforting yogurt rice', 120.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1618, 33, 'Tomato Rice', 'Spicy tomato rice', 150.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1619, 33, 'Methi Rice', 'Fenugreek flavored rice', 160.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1620, 33, 'Coconut Rice', 'Coconut flavored rice', 170.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1621, 33, 'Butter Naan', 'Soft butter naan', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1622, 33, 'Garlic Naan', 'Naan with garlic butter', 45.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1623, 33, 'Cheese Naan', 'Naan stuffed with cheese', 55.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1624, 33, 'Tandoori Roti', 'Whole wheat tandoori bread', 25.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1625, 33, 'Missi Roti', 'Spiced gram flour bread', 30.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1626, 33, 'Kulcha', 'Stuffed bread', 35.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1627, 33, 'Paratha', 'Layered flatbread', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1628, 33, 'Aloo Paratha', 'Potato stuffed paratha', 50.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1629, 33, 'Paneer Paratha', 'Paneer stuffed paratha', 60.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1630, 33, 'Laccha Paratha', 'Layered crispy paratha', 45.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1631, 33, 'Misal Pav', 'Spicy sprouted curry with bread', 140.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1632, 33, 'Pav Bhaji', 'Spiced vegetable mash with bread', 160.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1633, 33, 'Vada Pav', 'Potato fritter in burger bun', 40.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1634, 33, 'Puran Poli', 'Sweet flatbread with jaggery filling', 60.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1635, 33, 'Sabudana Khichdi', 'Tapioca pearls with peanuts', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1636, 33, 'Pithla Bhakri', 'Gram flour curry with flatbread', 100.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1637, 33, 'Bhel Puri', 'Puffed rice with chutneys', 80.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1638, 33, 'Sev Puri', 'Crispy puri with toppings', 90.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1639, 33, 'Dahi Misal', 'Misal with yogurt', 150.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1640, 33, 'Usal Pav', 'Spiced sprouted curry', 130.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1641, 33, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1642, 33, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1643, 33, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1644, 33, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1645, 33, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1646, 33, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1647, 33, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1648, 33, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1649, 33, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1650, 33, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1651, 33, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1652, 33, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1653, 33, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1654, 33, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1655, 33, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1656, 33, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1657, 33, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1658, 33, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1659, 33, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1660, 33, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1661, 33, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1662, 33, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1663, 33, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1664, 33, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1665, 33, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1666, 33, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1667, 33, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1668, 33, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1669, 33, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1670, 33, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1671, 33, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1672, 33, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1673, 33, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1674, 33, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1675, 33, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1676, 33, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1677, 33, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1678, 33, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1679, 33, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1680, 33, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1681, 33, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1682, 33, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1683, 33, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1684, 33, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1685, 33, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1686, 33, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1687, 33, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1688, 33, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1689, 33, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1690, 33, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1691, 33, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1692, 33, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1693, 33, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1694, 33, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1695, 33, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1696, 33, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1697, 33, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1698, 33, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1699, 33, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1700, 33, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
-- Total items for Saffron Veg Restaurant: 115


-- Restaurant: Spice Garden (ID: 34)
-- Cuisine: North Indian
-- Pure Veg: False

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1701, 34, 'Paneer Tikka', 'Marinated paneer cubes grilled to perfection', 220.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1702, 34, 'Hara Bhara Kabab', 'Spinach and green pea patties', 180.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1703, 34, 'Veg Manchurian', 'Crispy vegetable balls in tangy sauce', 190.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1704, 34, 'Spring Roll', 'Crispy vegetable spring rolls', 150.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1705, 34, 'Paneer 65', 'Spicy paneer cubes deep fried', 200.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1706, 34, 'Mushroom Tikka', 'Marinated mushrooms grilled', 210.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1707, 34, 'Aloo Tikki', 'Spiced potato patties', 120.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1708, 34, 'Dahi Kebab', 'Hung curd patties', 180.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1709, 34, 'Corn Cheese Balls', 'Crispy corn and cheese balls', 170.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1710, 34, 'Veg Crispy', 'Crispy vegetable fingers', 160.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1711, 34, 'Paneer Butter Masala', 'Creamy paneer in tomato gravy', 240.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1712, 34, 'Dal Makhani', 'Creamy black lentils', 180.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1713, 34, 'Mix Veg', 'Mixed vegetables in gravy', 200.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1714, 34, 'Palak Paneer', 'Spinach with paneer cubes', 220.00, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1715, 34, 'Kadai Paneer', 'Paneer in bell pepper gravy', 230.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1716, 34, 'Shahi Paneer', 'Royal paneer in cashew gravy', 250.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1717, 34, 'Matar Paneer', 'Peas with paneer', 210.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1718, 34, 'Malai Kofta', 'Cheese dumplings in creamy gravy', 260.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1719, 34, 'Veg Kolhapuri', 'Spicy vegetable curry', 220.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1720, 34, 'Chana Masala', 'Chickpeas in spiced gravy', 190.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1721, 34, 'Rajma Masala', 'Kidney beans in gravy', 180.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1722, 34, 'Aloo Gobi', 'Potato and cauliflower curry', 160.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1723, 34, 'Baingan Bharta', 'Smoked eggplant curry', 170.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1724, 34, 'Bhindi Masala', 'Okra in spiced gravy', 160.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1725, 34, 'Paneer Do Pyaza', 'Paneer with double onions', 230.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1726, 34, 'Vegetable Biryani', 'Fragrant rice with mixed vegetables', 220.00, 'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1727, 34, 'Jeera Rice', 'Cumin flavored rice', 100.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1728, 34, 'Veg Pulao', 'Mildly spiced rice with vegetables', 180.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1729, 34, 'Kashmiri Pulao', 'Sweet and aromatic rice', 200.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1730, 34, 'Tawa Pulao', 'Spiced rice cooked on tawa', 190.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1731, 34, 'Lemon Rice', 'Tangy lemon flavored rice', 140.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1732, 34, 'Curd Rice', 'Comforting yogurt rice', 120.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1733, 34, 'Tomato Rice', 'Spicy tomato rice', 150.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1734, 34, 'Methi Rice', 'Fenugreek flavored rice', 160.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1735, 34, 'Coconut Rice', 'Coconut flavored rice', 170.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Rice', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1736, 34, 'Butter Naan', 'Soft butter naan', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1737, 34, 'Garlic Naan', 'Naan with garlic butter', 45.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1738, 34, 'Cheese Naan', 'Naan stuffed with cheese', 55.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1739, 34, 'Tandoori Roti', 'Whole wheat tandoori bread', 25.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1740, 34, 'Missi Roti', 'Spiced gram flour bread', 30.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1741, 34, 'Kulcha', 'Stuffed bread', 35.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1742, 34, 'Paratha', 'Layered flatbread', 40.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1743, 34, 'Aloo Paratha', 'Potato stuffed paratha', 50.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1744, 34, 'Paneer Paratha', 'Paneer stuffed paratha', 60.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1745, 34, 'Laccha Paratha', 'Layered crispy paratha', 45.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Bread', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1746, 34, 'Misal Pav', 'Spicy sprouted curry with bread', 140.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1747, 34, 'Pav Bhaji', 'Spiced vegetable mash with bread', 160.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1748, 34, 'Vada Pav', 'Potato fritter in burger bun', 40.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1749, 34, 'Puran Poli', 'Sweet flatbread with jaggery filling', 60.00, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1750, 34, 'Sabudana Khichdi', 'Tapioca pearls with peanuts', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1751, 34, 'Pithla Bhakri', 'Gram flour curry with flatbread', 100.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1752, 34, 'Bhel Puri', 'Puffed rice with chutneys', 80.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1753, 34, 'Sev Puri', 'Crispy puri with toppings', 90.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1754, 34, 'Dahi Misal', 'Misal with yogurt', 150.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1755, 34, 'Usal Pav', 'Spiced sprouted curry', 130.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80', 'Maharashtrian', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1756, 34, 'Chicken Tikka', 'Marinated chicken grilled', 260.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1757, 34, 'Chicken 65', 'Spicy fried chicken', 240.00, 'https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1758, 34, 'Mutton Seekh Kebab', 'Minced mutton skewers', 320.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1759, 34, 'Fish Tikka', 'Marinated fish grilled', 280.00, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1760, 34, 'Chicken Lollipop', 'Chicken wings in sauce', 250.00, 'https://images.unsplash.com/photo-1562967916-eb82221dfb92?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1761, 34, 'Mutton Galouti Kebab', 'Melt-in-mouth mutton kebabs', 350.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1762, 34, 'Reshmi Kebab', 'Silky chicken kebabs', 270.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1763, 34, 'Tandoori Chicken', 'Spiced tandoori chicken', 290.00, 'https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1764, 34, 'Chicken Manchurian', 'Chicken in Indo-Chinese sauce', 260.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1765, 34, 'Prawn Koliwada', 'Spiced fried prawns', 340.00, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1766, 34, 'Butter Chicken', 'Chicken in creamy tomato gravy', 280.00, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1767, 34, 'Chicken Tikka Masala', 'Chicken in spiced gravy', 270.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1768, 34, 'Mutton Rogan Josh', 'Kashmiri style mutton curry', 340.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1769, 34, 'Chicken Korma', 'Chicken in mild creamy gravy', 260.00, 'https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1770, 34, 'Mutton Biryani', 'Aromatic mutton rice', 320.00, 'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1771, 34, 'Chicken Biryani', 'Aromatic chicken rice', 280.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1772, 34, 'Keema Matar', 'Minced meat with peas', 260.00, 'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1773, 34, 'Egg Curry', 'Eggs in spiced gravy', 180.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1774, 34, 'Fish Curry', 'Fish in coconut gravy', 300.00, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1775, 34, 'Chicken Do Pyaza', 'Chicken with double onions', 270.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1776, 34, 'Mutton Do Pyaza', 'Mutton with double onions', 330.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1777, 34, 'Kadai Chicken', 'Chicken in bell pepper gravy', 280.00, 'https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1778, 34, 'Chicken Chettinad', 'Spicy South Indian chicken', 290.00, 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1779, 34, 'Mutton Kofta', 'Mutton dumplings in gravy', 350.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1780, 34, 'Egg Bhurji', 'Scrambled eggs with spices', 160.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1781, 34, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1782, 34, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1783, 34, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1784, 34, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1785, 34, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1786, 34, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1787, 34, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1788, 34, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1789, 34, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1790, 34, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1791, 34, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1792, 34, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1793, 34, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1794, 34, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1795, 34, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1796, 34, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1797, 34, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1798, 34, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1799, 34, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1800, 34, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1801, 34, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1802, 34, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1803, 34, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1804, 34, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1805, 34, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1806, 34, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1807, 34, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1808, 34, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1809, 34, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1810, 34, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1811, 34, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1812, 34, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1813, 34, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1814, 34, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1815, 34, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1816, 34, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1817, 34, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1818, 34, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1819, 34, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1820, 34, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1821, 34, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1822, 34, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1823, 34, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1824, 34, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1825, 34, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1826, 34, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1827, 34, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1828, 34, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1829, 34, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1830, 34, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1831, 34, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1832, 34, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1833, 34, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1834, 34, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1835, 34, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1836, 34, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1837, 34, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1838, 34, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1839, 34, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1840, 34, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
-- Total items for Spice Garden: 140


-- Restaurant: Dosa Corner (ID: 35)
-- Cuisine: South Indian
-- Pure Veg: False

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1841, 35, 'Masala Dosa', 'Crispy dosa with potato filling', 80.00, 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1842, 35, 'Plain Dosa', 'Simple crispy dosa', 60.00, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1843, 35, 'Rava Dosa', 'Crispy semolina dosa', 70.00, 'https://images.unsplash.com/photo-1626132647523-66d4e8c2f8e0?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1844, 35, 'Onion Dosa', 'Dosa topped with onions', 75.00, 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1845, 35, 'Cheese Dosa', 'Dosa with cheese', 90.00, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1846, 35, 'Paper Dosa', 'Extra thin crispy dosa', 70.00, 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1847, 35, 'Set Dosa', 'Soft spongy dosa', 65.00, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1848, 35, 'Pesarattu', 'Green gram dosa', 70.00, 'https://images.unsplash.com/photo-1626132647523-66d4e8c2f8e0?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1849, 35, 'Mysore Dosa', 'Dosa with red chutney', 85.00, 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1850, 35, 'Ghee Roast', 'Dosa cooked in ghee', 95.00, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1851, 35, 'Idli Sambar', 'Steamed rice cakes with sambar', 60.00, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop', 'Idli', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1852, 35, 'Plain Idli', 'Steamed rice cakes', 40.00, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop', 'Idli', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1853, 35, 'Rava Idli', 'Semolina idli', 50.00, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop', 'Idli', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1854, 35, 'Kanchipuram Idli', 'Spiced idli', 60.00, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop', 'Idli', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1855, 35, 'Thatte Idli', 'Large plate idli', 70.00, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop', 'Idli', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1856, 35, 'Mini Idli', 'Small idli plates', 55.00, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop', 'Idli', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1857, 35, 'Stuffed Idli', 'Idli with filling', 65.00, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop', 'Idli', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1858, 35, 'Podi Idli', 'Idli with spice powder', 60.00, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop', 'Idli', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1859, 35, 'Uttapam', 'Thick pancake with toppings', 90.00, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop', 'Uttapam', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1860, 35, 'Onion Uttapam', 'Uttapam with onions', 95.00, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop', 'Uttapam', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1861, 35, 'Tomato Uttapam', 'Uttapam with tomatoes', 95.00, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop', 'Uttapam', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1862, 35, 'Mixed Veg Uttapam', 'Uttapam with vegetables', 100.00, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop', 'Uttapam', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1863, 35, 'Cheese Uttapam', 'Uttapam with cheese', 110.00, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop', 'Uttapam', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1864, 35, 'Vada', 'Crispy lentil fritters', 50.00, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1865, 35, 'Medu Vada', 'Urad dal fritters', 50.00, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1866, 35, 'Masala Vada', 'Spiced fritters', 55.00, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1867, 35, 'Pongal', 'Rice and lentil dish', 80.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=400&h=300&fit=crop', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1868, 35, 'Upma', 'Semolina dish', 60.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400&h=300&fit=crop', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1869, 35, 'Ven Pongal', 'Spicy pongal', 85.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=400&h=300&fit=crop', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1870, 35, 'Bisi Bele Bath', 'Spiced rice dish', 90.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=400&h=300&fit=crop', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1871, 35, 'Curd Rice', 'Yogurt rice', 50.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=400&h=300&fit=crop', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1872, 35, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1873, 35, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1874, 35, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1875, 35, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1876, 35, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1877, 35, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1878, 35, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1879, 35, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1880, 35, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1881, 35, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1882, 35, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1883, 35, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1884, 35, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1885, 35, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1886, 35, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1887, 35, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1888, 35, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1889, 35, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1890, 35, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1891, 35, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1892, 35, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1893, 35, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1894, 35, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1895, 35, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1896, 35, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1897, 35, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1898, 35, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1899, 35, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1900, 35, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1901, 35, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1902, 35, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1903, 35, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1904, 35, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1905, 35, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1906, 35, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1907, 35, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1908, 35, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1909, 35, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1910, 35, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1911, 35, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1912, 35, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1913, 35, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1914, 35, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1915, 35, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1916, 35, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1917, 35, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1918, 35, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1919, 35, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1920, 35, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1921, 35, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1922, 35, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1923, 35, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1924, 35, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1925, 35, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1926, 35, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1927, 35, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1928, 35, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1929, 35, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1930, 35, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1931, 35, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1932, 35, 'Special Masala Dosa', 'Special Crispy dosa with potato filling', 100.00, 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1933, 35, 'Special Plain Dosa', 'Special Simple crispy dosa', 80.00, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1934, 35, 'Special Rava Dosa', 'Special Crispy semolina dosa', 90.00, 'https://images.unsplash.com/photo-1626132647523-66d4e8c2f8e0?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1935, 35, 'Special Onion Dosa', 'Special Dosa topped with onions', 95.00, 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1936, 35, 'Special Cheese Dosa', 'Special Dosa with cheese', 110.00, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1937, 35, 'Special Paper Dosa', 'Special Extra thin crispy dosa', 90.00, 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1938, 35, 'Special Set Dosa', 'Special Soft spongy dosa', 85.00, 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1939, 35, 'Special Pesarattu', 'Special Green gram dosa', 90.00, 'https://images.unsplash.com/photo-1626132647523-66d4e8c2f8e0?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1940, 35, 'Special Mysore Dosa', 'Special Dosa with red chutney', 105.00, 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop', 'Dosa', true, true, false, 15, 'Regular');
-- Total items for Dosa Corner: 100


-- Restaurant: Dragon Wok (ID: 36)
-- Cuisine: Chinese
-- Pure Veg: False

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1941, 36, 'Veg Spring Roll', 'Crispy vegetable rolls', 140.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1942, 36, 'Chicken Spring Roll', 'Crispy chicken rolls', 160.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1943, 36, 'Veg Momos', 'Steamed vegetable dumplings', 120.00, 'https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1944, 36, 'Chicken Momos', 'Steamed chicken dumplings', 140.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1945, 36, 'Honey Chilli Potato', 'Crispy potatoes in honey sauce', 150.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1946, 36, 'Crispy Corn', 'Fried corn with spices', 160.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1947, 36, 'Paneer Chilli', 'Spicy paneer in sauce', 180.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1948, 36, 'Chicken Chilli', 'Spicy chicken in sauce', 200.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1949, 36, 'Veg Wontons', 'Fried vegetable wontons', 150.00, 'https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1950, 36, 'Chicken Wontons', 'Fried chicken wontons', 170.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1951, 36, 'Veg Fried Rice', 'Stir-fried rice with vegetables', 180.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1952, 36, 'Chicken Fried Rice', 'Stir-fried rice with chicken', 220.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1953, 36, 'Veg Noodles', 'Stir-fried noodles with vegetables', 170.00, 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1954, 36, 'Chicken Noodles', 'Stir-fried noodles with chicken', 210.00, 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1955, 36, 'Hakka Noodles', 'Spicy vegetable noodles', 180.00, 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1956, 36, 'Schezwan Fried Rice', 'Spicy Schezwan rice', 200.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1957, 36, 'Manchurian Gravy', 'Veg balls in gravy', 190.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1958, 36, 'Gobi Manchurian', 'Cauliflower in sauce', 180.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1959, 36, 'Paneer Fried Rice', 'Fried rice with paneer', 200.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1960, 36, 'Egg Fried Rice', 'Fried rice with egg', 190.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1961, 36, 'Singapore Noodles', 'Curried noodles', 190.00, 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1962, 36, 'Thai Fried Rice', 'Thai style fried rice', 210.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1963, 36, 'Veg Manchow Soup', 'Spicy vegetable soup', 120.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1964, 36, 'Hot and Sour Soup', 'Spicy tangy soup', 130.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1965, 36, 'Sweet Corn Soup', 'Creamy corn soup', 110.00, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80', 'Main Course', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1966, 36, 'Chicken Manchurian', 'Chicken in Indo-Chinese sauce', 260.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1967, 36, 'Chilli Chicken', 'Spicy chicken in sauce', 280.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Main Course', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1968, 36, 'Chicken Fried Rice', 'Fried rice with chicken', 240.00, 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80', 'Rice', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1969, 36, 'Chicken Noodles', 'Stir-fried noodles with chicken', 230.00, 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80', 'Noodles', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1970, 36, 'Chicken Momos', 'Steamed chicken dumplings', 160.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1971, 36, 'Chicken Spring Roll', 'Crispy chicken rolls', 180.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1972, 36, 'Chicken Wontons', 'Fried chicken wontons', 190.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', false, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1973, 36, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1974, 36, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1975, 36, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1976, 36, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1977, 36, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1978, 36, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1979, 36, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1980, 36, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1981, 36, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1982, 36, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1983, 36, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1984, 36, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1985, 36, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1986, 36, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1987, 36, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1988, 36, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1989, 36, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1990, 36, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1991, 36, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1992, 36, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1993, 36, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1994, 36, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1995, 36, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1996, 36, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1997, 36, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1998, 36, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (1999, 36, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2000, 36, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2001, 36, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2002, 36, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2003, 36, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2004, 36, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2005, 36, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2006, 36, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2007, 36, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2008, 36, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2009, 36, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2010, 36, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2011, 36, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2012, 36, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2013, 36, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2014, 36, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2015, 36, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2016, 36, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2017, 36, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2018, 36, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2019, 36, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2020, 36, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2021, 36, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2022, 36, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2023, 36, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2024, 36, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2025, 36, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2026, 36, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2027, 36, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2028, 36, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2029, 36, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2030, 36, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2031, 36, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2032, 36, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2033, 36, 'Special Veg Spring Roll', 'Special Crispy vegetable rolls', 160.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2034, 36, 'Special Chicken Spring Roll', 'Special Crispy chicken rolls', 180.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2035, 36, 'Special Veg Momos', 'Special Steamed vegetable dumplings', 140.00, 'https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2036, 36, 'Special Chicken Momos', 'Special Steamed chicken dumplings', 160.00, 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2037, 36, 'Special Honey Chilli Potato', 'Special Crispy potatoes in honey sauce', 170.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2038, 36, 'Special Crispy Corn', 'Special Fried corn with spices', 180.00, 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2039, 36, 'Special Paneer Chilli', 'Special Spicy paneer in sauce', 200.00, 'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2040, 36, 'Special Chicken Chilli', 'Special Spicy chicken in sauce', 220.00, 'https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80', 'Starters', true, true, false, 15, 'Regular');
-- Total items for Dragon Wok: 100


-- Restaurant: Pizza Paradise (ID: 37)
-- Cuisine: Italian
-- Pure Veg: False

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2041, 37, 'Margherita Pizza', 'Classic tomato and cheese pizza', 250.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2042, 37, 'Pepperoni Pizza', 'Pizza with pepperoni', 320.00, 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2043, 37, 'Veggie Pizza', 'Loaded vegetable pizza', 280.00, 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2044, 37, 'BBQ Chicken Pizza', 'BBQ chicken pizza', 340.00, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2045, 37, 'Cheese Pizza', 'Extra cheese pizza', 270.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2046, 37, 'Mushroom Pizza', 'Pizza with mushrooms', 290.00, 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2047, 37, 'Onion Pizza', 'Pizza with caramelized onions', 260.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2048, 37, 'Capsicum Pizza', 'Pizza with bell peppers', 270.00, 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2049, 37, 'Paneer Pizza', 'Indian style paneer pizza', 300.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2050, 37, 'Tandoori Chicken Pizza', 'Tandoori chicken pizza', 350.00, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2051, 37, 'Penne Alfredo', 'Creamy white sauce pasta', 240.00, 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2052, 37, 'Spaghetti Carbonara', 'Bacon and egg pasta', 260.00, 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2053, 37, 'Mac and Cheese', 'Creamy macaroni and cheese', 220.00, 'https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2054, 37, 'Penne Arrabbiata', 'Spicy tomato pasta', 230.00, 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2055, 37, 'Fettuccine Alfredo', 'Creamy fettuccine', 250.00, 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2056, 37, 'Lasagna', 'Layered pasta with cheese', 280.00, 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2057, 37, 'Ravioli', 'Stuffed pasta in sauce', 200.00, 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2058, 37, 'Pesto Pasta', 'Basil pesto pasta', 240.00, 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2059, 37, 'Aglio Olio', 'Garlic and olive oil pasta', 210.00, 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2060, 37, 'Bolognese', 'Meat sauce pasta', 270.00, 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2061, 37, 'Garlic Bread', 'Toasted garlic bread', 120.00, 'https://images.unsplash.com/photo-1619535860434-ba1d8fa12536?w=500&q=80', 'Sides', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2062, 37, 'Cheese Garlic Bread', 'Garlic bread with cheese', 150.00, 'https://images.unsplash.com/photo-1619535860434-ba1d8fa12536?w=500&q=80', 'Sides', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2063, 37, 'Bruschetta', 'Tomato bruschetta', 140.00, 'https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?w=500&q=80', 'Sides', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2064, 37, 'Caesar Salad', 'Classic caesar salad', 180.00, 'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?w=500&q=80', 'Sides', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2065, 37, 'Greek Salad', 'Fresh vegetable salad', 160.00, 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500&q=80', 'Sides', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2066, 37, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2067, 37, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2068, 37, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2069, 37, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2070, 37, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2071, 37, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2072, 37, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2073, 37, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2074, 37, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2075, 37, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2076, 37, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2077, 37, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2078, 37, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2079, 37, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2080, 37, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2081, 37, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2082, 37, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2083, 37, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2084, 37, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2085, 37, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2086, 37, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2087, 37, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2088, 37, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2089, 37, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2090, 37, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2091, 37, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2092, 37, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2093, 37, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2094, 37, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2095, 37, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2096, 37, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2097, 37, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2098, 37, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2099, 37, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2100, 37, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2101, 37, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2102, 37, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2103, 37, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2104, 37, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2105, 37, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2106, 37, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2107, 37, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2108, 37, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2109, 37, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2110, 37, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2111, 37, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2112, 37, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2113, 37, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2114, 37, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2115, 37, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2116, 37, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2117, 37, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2118, 37, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2119, 37, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2120, 37, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2121, 37, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2122, 37, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2123, 37, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2124, 37, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2125, 37, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2126, 37, 'Special Margherita Pizza', 'Special Classic tomato and cheese pizza', 270.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2127, 37, 'Special Pepperoni Pizza', 'Special Pizza with pepperoni', 340.00, 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2128, 37, 'Special Veggie Pizza', 'Special Loaded vegetable pizza', 300.00, 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2129, 37, 'Special BBQ Chicken Pizza', 'Special BBQ chicken pizza', 360.00, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2130, 37, 'Special Cheese Pizza', 'Special Extra cheese pizza', 290.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2131, 37, 'Special Mushroom Pizza', 'Special Pizza with mushrooms', 310.00, 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2132, 37, 'Special Onion Pizza', 'Special Pizza with caramelized onions', 280.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2133, 37, 'Special Capsicum Pizza', 'Special Pizza with bell peppers', 290.00, 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2134, 37, 'Special Paneer Pizza', 'Special Indian style paneer pizza', 320.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2135, 37, 'Special Tandoori Chicken Pizza', 'Special Tandoori chicken pizza', 370.00, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80', 'Pizza', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2136, 37, 'Special Penne Alfredo', 'Special Creamy white sauce pasta', 260.00, 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2137, 37, 'Special Spaghetti Carbonara', 'Special Bacon and egg pasta', 280.00, 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2138, 37, 'Special Mac and Cheese', 'Special Creamy macaroni and cheese', 240.00, 'https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2139, 37, 'Special Penne Arrabbiata', 'Special Spicy tomato pasta', 250.00, 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2140, 37, 'Special Fettuccine Alfredo', 'Special Creamy fettuccine', 270.00, 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80', 'Pasta', true, true, false, 15, 'Regular');
-- Total items for Pizza Paradise: 100


-- Restaurant: Brew & Bean (ID: 38)
-- Cuisine: Beverages
-- Pure Veg: False

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2141, 38, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2142, 38, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2143, 38, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2144, 38, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2145, 38, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2146, 38, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2147, 38, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2148, 38, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2149, 38, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2150, 38, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2151, 38, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2152, 38, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2153, 38, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2154, 38, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2155, 38, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2156, 38, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2157, 38, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2158, 38, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2159, 38, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2160, 38, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2161, 38, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2162, 38, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2163, 38, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2164, 38, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2165, 38, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2166, 38, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2167, 38, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2168, 38, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2169, 38, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2170, 38, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2171, 38, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2172, 38, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2173, 38, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2174, 38, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2175, 38, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2176, 38, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2177, 38, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2178, 38, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2179, 38, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2180, 38, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2181, 38, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2182, 38, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2183, 38, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2184, 38, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2185, 38, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2186, 38, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2187, 38, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2188, 38, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2189, 38, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2190, 38, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2191, 38, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2192, 38, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2193, 38, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2194, 38, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2195, 38, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2196, 38, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2197, 38, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2198, 38, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2199, 38, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2200, 38, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2201, 38, 'Sandwich', 'Club sandwich', 120.00, 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2202, 38, 'Grilled Sandwich', 'Grilled vegetable sandwich', 100.00, 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2203, 38, 'Cheese Sandwich', 'Cheese sandwich', 110.00, 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2204, 38, 'Veg Burger', 'Vegetable burger', 140.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2205, 38, 'Cheese Burger', 'Cheese burger', 160.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2206, 38, 'French Fries', 'Crispy french fries', 90.00, 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2207, 38, 'Onion Rings', 'Crispy onion rings', 100.00, 'https://images.unsplash.com/photo-1639024471283-03518883512d?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2208, 38, 'Special Espresso', 'Special Strong black coffee', 100.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2209, 38, 'Special Cappuccino', 'Special Espresso with steamed milk', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2210, 38, 'Special Latte', 'Special Espresso with lots of milk', 150.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2211, 38, 'Special Americano', 'Special Espresso with hot water', 120.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2212, 38, 'Special Mocha', 'Special Chocolate coffee', 160.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2213, 38, 'Special Cold Coffee', 'Special Iced coffee', 140.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2214, 38, 'Special Frappuccino', 'Special Blended iced coffee', 170.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2215, 38, 'Special Irish Coffee', 'Special Coffee with whiskey', 200.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2216, 38, 'Special Turkish Coffee', 'Special Traditional Turkish coffee', 130.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2217, 38, 'Special Filter Coffee', 'Special South Indian filter coffee', 110.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2218, 38, 'Special Masala Chai', 'Special Spiced Indian tea', 70.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2219, 38, 'Special Green Tea', 'Special Healthy green tea', 80.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2220, 38, 'Special Lemon Tea', 'Special Tea with lemon', 75.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2221, 38, 'Special Ginger Tea', 'Special Tea with ginger', 75.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2222, 38, 'Special Iced Tea', 'Special Cold tea', 90.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2223, 38, 'Special Earl Grey', 'Special Classic black tea', 85.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2224, 38, 'Special Peppermint Tea', 'Special Mint tea', 80.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2225, 38, 'Special Chamomile Tea', 'Special Herbal tea', 85.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2226, 38, 'Special Mojito', 'Special Fresh mint mojito', 140.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2227, 38, 'Special Virgin Mojito', 'Special Non-alcoholic mojito', 120.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2228, 38, 'Special Espresso', 'Special Strong black coffee', 100.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2229, 38, 'Special Cappuccino', 'Special Espresso with steamed milk', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2230, 38, 'Special Latte', 'Special Espresso with lots of milk', 150.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2231, 38, 'Special Americano', 'Special Espresso with hot water', 120.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2232, 38, 'Special Mocha', 'Special Chocolate coffee', 160.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2233, 38, 'Special Cold Coffee', 'Special Iced coffee', 140.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2234, 38, 'Special Frappuccino', 'Special Blended iced coffee', 170.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2235, 38, 'Special Irish Coffee', 'Special Coffee with whiskey', 200.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2236, 38, 'Special Turkish Coffee', 'Special Traditional Turkish coffee', 130.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2237, 38, 'Special Filter Coffee', 'Special South Indian filter coffee', 110.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2238, 38, 'Special Masala Chai', 'Special Spiced Indian tea', 70.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2239, 38, 'Special Green Tea', 'Special Healthy green tea', 80.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2240, 38, 'Special Lemon Tea', 'Special Tea with lemon', 75.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
-- Total items for Brew & Bean: 100


-- Restaurant: Sweet Delights (ID: 39)
-- Cuisine: Desserts
-- Pure Veg: False

INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2241, 39, 'Chocolate Cake', 'Rich chocolate cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2242, 39, 'Red Velvet Cake', 'Classic red velvet', 200.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2243, 39, 'Vanilla Cake', 'Simple vanilla cake', 160.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2244, 39, 'Black Forest Cake', 'Chocolate and cherry cake', 190.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2245, 39, 'Pineapple Cake', 'Pineapple flavored cake', 170.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2246, 39, 'Butterscotch Cake', 'Butterscotch cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2247, 39, 'Fruit Cake', 'Mixed fruit cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2248, 39, 'Truffle Cake', 'Chocolate truffle', 220.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2249, 39, 'Chocolate Pastry', 'Chocolate filled pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2250, 39, 'Black Forest Pastry', 'Cherry chocolate pastry', 90.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2251, 39, 'Pineapple Pastry', 'Pineapple pastry', 80.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2252, 39, 'Vanilla Pastry', 'Cream vanilla pastry', 75.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2253, 39, 'Strawberry Pastry', 'Strawberry pastry', 85.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2254, 39, 'Vanilla Ice Cream', 'Classic vanilla', 100.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2255, 39, 'Chocolate Ice Cream', 'Rich chocolate', 110.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2256, 39, 'Strawberry Ice Cream', 'Fresh strawberry', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2257, 39, 'Mango Ice Cream', 'Mango flavor', 120.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2258, 39, 'Butterscotch Ice Cream', 'Butterscotch flavor', 110.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2259, 39, 'Kulfi', 'Traditional Indian ice cream', 80.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2260, 39, 'Gulab Jamun', 'Sweet milk dumplings', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2261, 39, 'Rasgulla', 'Spongy cheese balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2262, 39, 'Jalebi', 'Crispy sweet spirals', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2263, 39, 'Rasmalai', 'Creamy cheese in milk', 90.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2264, 39, 'Kaju Katli', 'Cashew fudge', 120.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2265, 39, 'Barfi', 'Milk fudge', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2266, 39, 'Pedha', 'Sweet milk solids', 80.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2267, 39, 'Ladoo', 'Sweet balls', 70.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2268, 39, 'Espresso', 'Strong black coffee', 80.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2269, 39, 'Cappuccino', 'Espresso with steamed milk', 120.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2270, 39, 'Latte', 'Espresso with lots of milk', 130.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2271, 39, 'Americano', 'Espresso with hot water', 100.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2272, 39, 'Mocha', 'Chocolate coffee', 140.00, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2273, 39, 'Cold Coffee', 'Iced coffee', 120.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2274, 39, 'Frappuccino', 'Blended iced coffee', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2275, 39, 'Irish Coffee', 'Coffee with whiskey', 180.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2276, 39, 'Turkish Coffee', 'Traditional Turkish coffee', 110.00, 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2277, 39, 'Filter Coffee', 'South Indian filter coffee', 90.00, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop', 'Coffee', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2278, 39, 'Masala Chai', 'Spiced Indian tea', 50.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2279, 39, 'Green Tea', 'Healthy green tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2280, 39, 'Lemon Tea', 'Tea with lemon', 55.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2281, 39, 'Ginger Tea', 'Tea with ginger', 55.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2282, 39, 'Iced Tea', 'Cold tea', 70.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2283, 39, 'Earl Grey', 'Classic black tea', 65.00, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2284, 39, 'Peppermint Tea', 'Mint tea', 60.00, 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2285, 39, 'Chamomile Tea', 'Herbal tea', 65.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80', 'Tea', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2286, 39, 'Mojito', 'Fresh mint mojito', 120.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2287, 39, 'Virgin Mojito', 'Non-alcoholic mojito', 100.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2288, 39, 'Lemonade', 'Fresh lemonade', 70.00, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2289, 39, 'Iced Lemon Tea', 'Cold lemon tea', 80.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2290, 39, 'Strawberry Shake', 'Strawberry milkshake', 130.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2291, 39, 'Chocolate Shake', 'Chocolate milkshake', 140.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2292, 39, 'Mango Shake', 'Mango milkshake', 130.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2293, 39, 'Vanilla Shake', 'Vanilla milkshake', 120.00, 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2294, 39, 'Oreo Shake', 'Oreo milkshake', 150.00, 'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2295, 39, 'Cold Coffee with Ice Cream', 'Coffee with ice cream', 160.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80', 'Cold Drinks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2296, 39, 'Berry Smoothie', 'Mixed berry smoothie', 140.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2297, 39, 'Green Smoothie', 'Healthy green smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2298, 39, 'Mango Smoothie', 'Fresh mango smoothie', 140.00, 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2299, 39, 'Banana Smoothie', 'Banana smoothie', 120.00, 'https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2300, 39, 'Pineapple Smoothie', 'Pineapple smoothie', 130.00, 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80', 'Smoothies', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2301, 39, 'Sandwich', 'Club sandwich', 120.00, 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2302, 39, 'Grilled Sandwich', 'Grilled vegetable sandwich', 100.00, 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2303, 39, 'Cheese Sandwich', 'Cheese sandwich', 110.00, 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80', 'Snacks', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2304, 39, 'Special Chocolate Cake', 'Special Rich chocolate cake', 200.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2305, 39, 'Special Red Velvet Cake', 'Special Classic red velvet', 220.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2306, 39, 'Special Vanilla Cake', 'Special Simple vanilla cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2307, 39, 'Special Black Forest Cake', 'Special Chocolate and cherry cake', 210.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2308, 39, 'Special Pineapple Cake', 'Special Pineapple flavored cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2309, 39, 'Special Butterscotch Cake', 'Special Butterscotch cake', 200.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2310, 39, 'Special Fruit Cake', 'Special Mixed fruit cake', 210.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2311, 39, 'Special Truffle Cake', 'Special Chocolate truffle', 240.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2312, 39, 'Special Chocolate Pastry', 'Special Chocolate filled pastry', 100.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2313, 39, 'Special Black Forest Pastry', 'Special Cherry chocolate pastry', 110.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2314, 39, 'Special Pineapple Pastry', 'Special Pineapple pastry', 100.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2315, 39, 'Special Vanilla Pastry', 'Special Cream vanilla pastry', 95.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2316, 39, 'Special Strawberry Pastry', 'Special Strawberry pastry', 105.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2317, 39, 'Special Vanilla Ice Cream', 'Special Classic vanilla', 120.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2318, 39, 'Special Chocolate Ice Cream', 'Special Rich chocolate', 130.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2319, 39, 'Special Strawberry Ice Cream', 'Special Fresh strawberry', 130.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2320, 39, 'Special Mango Ice Cream', 'Special Mango flavor', 140.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2321, 39, 'Special Butterscotch Ice Cream', 'Special Butterscotch flavor', 130.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2322, 39, 'Special Kulfi', 'Special Traditional Indian ice cream', 100.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2323, 39, 'Special Gulab Jamun', 'Special Sweet milk dumplings', 100.00, 'https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80', 'Sweets', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2324, 39, 'Special Chocolate Cake', 'Special Rich chocolate cake', 200.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2325, 39, 'Special Red Velvet Cake', 'Special Classic red velvet', 220.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2326, 39, 'Special Vanilla Cake', 'Special Simple vanilla cake', 180.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2327, 39, 'Special Black Forest Cake', 'Special Chocolate and cherry cake', 210.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2328, 39, 'Special Pineapple Cake', 'Special Pineapple flavored cake', 190.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2329, 39, 'Special Butterscotch Cake', 'Special Butterscotch cake', 200.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2330, 39, 'Special Fruit Cake', 'Special Mixed fruit cake', 210.00, 'https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2331, 39, 'Special Truffle Cake', 'Special Chocolate truffle', 240.00, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80', 'Cakes', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2332, 39, 'Special Chocolate Pastry', 'Special Chocolate filled pastry', 100.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2333, 39, 'Special Black Forest Pastry', 'Special Cherry chocolate pastry', 110.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2334, 39, 'Special Pineapple Pastry', 'Special Pineapple pastry', 100.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2335, 39, 'Special Vanilla Pastry', 'Special Cream vanilla pastry', 95.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2336, 39, 'Special Strawberry Pastry', 'Special Strawberry pastry', 105.00, 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80', 'Pastries', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2337, 39, 'Special Vanilla Ice Cream', 'Special Classic vanilla', 120.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2338, 39, 'Special Chocolate Ice Cream', 'Special Rich chocolate', 130.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2339, 39, 'Special Strawberry Ice Cream', 'Special Fresh strawberry', 130.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES (2340, 39, 'Special Mango Ice Cream', 'Special Mango flavor', 140.00, 'https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80', 'Ice Cream', true, true, false, 15, 'Regular');
-- Total items for Sweet Delights: 100

