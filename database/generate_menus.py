#!/usr/bin/env python3
"""
EAT Menu Generator
Generates comprehensive menu data for all 44 restaurants with proper categories and images
"""

import json

# Restaurant data with cuisine types and item counts
restaurants = [
    {"id": 1, "name": "Veg Aroma Restaurant", "cuisine": "North Indian, Maharashtrian", "type": "regular", "veg": True},
    {"id": 2, "name": "Hotel Rajhans Family Rooftop Restaurant", "cuisine": "Chinese", "type": "regular", "veg": True},
    {"id": 3, "name": "Fortune Veg Restaurant", "cuisine": "Chinese", "type": "regular", "veg": True},
    {"id": 4, "name": "Hotel Radhika Place and City Palace", "cuisine": "North Indian, Chinese", "type": "regular", "veg": False},
    {"id": 5, "name": "Hotel Gokul Pure Veg", "cuisine": "Maharashtrian, North Indian", "type": "regular", "veg": True},
    {"id": 6, "name": "Morya's Royal Treat Rooftop Restaurant", "cuisine": "North Indian, Chinese", "type": "regular", "veg": False},
    {"id": 7, "name": "MADANI PALACE FAMILY RESTAURANT", "cuisine": "Chinese, North Indian", "type": "regular", "veg": False},
    {"id": 8, "name": "Krishna restaurant", "cuisine": "North Indian, Chinese", "type": "regular", "veg": False},
    {"id": 9, "name": "Hotel Vatika (Pure Veg)", "cuisine": "Maharashtrian, North Indian", "type": "regular", "veg": True},
    {"id": 10, "name": "Hotel Bhakti veg restaurant", "cuisine": "Chinese, Vegetarian", "type": "regular", "veg": True},
    {"id": 11, "name": "HOTEL RAMAYANA", "cuisine": "North Indian, Maharashtrian", "type": "regular", "veg": False},
    {"id": 12, "name": "Madhur Bhoj Thali", "cuisine": "Maharashtrian, Thalis", "type": "regular", "veg": True},
    {"id": 13, "name": "AZMAT HOTEL", "cuisine": "North Indian, Biryani", "type": "regular", "veg": False},
    {"id": 14, "name": "Baba Nk family Restaurant", "cuisine": "North Indian, Chinese", "type": "regular", "veg": False},
    {"id": 15, "name": "Sai samrat veg and non veg", "cuisine": "North Indian, Chinese", "type": "regular", "veg": False},
    {"id": 16, "name": "Hotel Tandoor", "cuisine": "North Indian, Kebabs", "type": "regular", "veg": False},
    {"id": 17, "name": "Sardeshpande Hurda Party", "cuisine": "Maharashtrian", "type": "regular", "veg": False},
    {"id": 18, "name": "Nisarga Bar and Restaurant", "cuisine": "North Indian, Chinese", "type": "regular", "veg": False},
    {"id": 19, "name": "New Krushna Restaurant", "cuisine": "North Indian, Maharashtrian", "type": "regular", "veg": True},
    {"id": 20, "name": "B For Burger", "cuisine": "Burgers, Fast Food", "type": "regular", "veg": False},
    {"id": 21, "name": "Domino's Pizza TNK Estate", "cuisine": "Pizza, Italian", "type": "regular", "veg": False},
    {"id": 22, "name": "Chaundeshwari Chat Bhandar", "cuisine": "Maharashtrian, Junk Food", "type": "regular", "veg": True},
    {"id": 23, "name": "LE COFFEE CAFE", "cuisine": "Café Specials, Pizza", "type": "cafe", "veg": False},
    {"id": 24, "name": "Kekiz The Cake Shop", "cuisine": "Cakes, Pastries, Desserts", "type": "cafe", "veg": True},
    {"id": 25, "name": "Maharashtra Chat Bhandar", "cuisine": "Maharashtrian, Junk Food", "type": "regular", "veg": True},
    {"id": 26, "name": "Apna Corner", "cuisine": "North Indian, Chinese", "type": "regular", "veg": False},
    {"id": 27, "name": "PAGAL CHINESE FOOD", "cuisine": "Chinese", "type": "regular", "veg": False},
    {"id": 28, "name": "Paesaute Chicken", "cuisine": "Non-Veg, Chicken", "type": "regular", "veg": False},
    {"id": 29, "name": "Jijau restaurant pure veg", "cuisine": "Maharashtrian, North Indian", "type": "regular", "veg": True},
    {"id": 30, "name": "Hotel Tulsi", "cuisine": "Maharashtrian, North Indian", "type": "regular", "veg": True},
    {"id": 31, "name": "Coffee Lounge", "cuisine": "Café Specials, Shakes", "type": "cafe", "veg": True},
    {"id": 32, "name": "Hotel Temptation Pure Veg", "cuisine": "Maharashtrian, North Indian", "type": "regular", "veg": True},
    {"id": 33, "name": "Saffron Veg Restaurant", "cuisine": "North Indian, Maharashtrian", "type": "regular", "veg": True},
    {"id": 34, "name": "Spice Route", "cuisine": "North Indian, Mughlai", "type": "regular", "veg": False},
    {"id": 35, "name": "Chai Pe Charcha", "cuisine": "Café Specials, Snacks", "type": "cafe", "veg": True},
    {"id": 36, "name": "Royal Biryani House", "cuisine": "Biryani, Kebabs", "type": "regular", "veg": False},
    {"id": 37, "name": "Green Leaf", "cuisine": "Maharashtrian, Healthy Food", "type": "regular", "veg": True},
    {"id": 38, "name": "Momos Point", "cuisine": "Chinese, Momos", "type": "regular", "veg": False},
    {"id": 39, "name": "Sweet Corner", "cuisine": "Sweets, Desserts", "type": "cafe", "veg": True},
    {"id": 40, "name": "Tandoori Nights", "cuisine": "North Indian, Kebabs", "type": "regular", "veg": False},
    {"id": 41, "name": "South Spice", "cuisine": "South Indian", "type": "regular", "veg": True},
    {"id": 42, "name": "Street Bites", "cuisine": "Maharashtrian, Junk Food", "type": "regular", "veg": True},
    {"id": 43, "name": "Pizza Corner", "cuisine": "Pizza, Italian", "type": "regular", "veg": False},
    {"id": 44, "name": "Burger House", "cuisine": "Burgers, Fast Food", "type": "regular", "veg": False},
    {"id": 45, "name": "Healthy Bowl", "cuisine": "Salads, Healthy Food", "type": "cafe", "veg": True},
    {"id": 46, "name": "Ice Cream Paradise", "cuisine": "Ice Cream, Desserts", "type": "cafe", "veg": True},
    {"id": 47, "name": "Fresh Juice Bar", "cuisine": "Juices, Shakes", "type": "cafe", "veg": True},
]

# Dish templates by category (using actual database category names)
dish_templates = {
    "Main Course": [
        ("Paneer Butter Masala", "Paneer in rich tomato butter gravy", 260, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500"),
        ("Shahi Paneer", "Paneer in creamy cashew gravy", 280, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500"),
        ("Kadai Paneer", "Paneer with bell peppers in kadai spices", 240, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500"),
        ("Palak Paneer", "Paneer in spinach gravy", 230, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500"),
        ("Dal Makhani", "Creamy black lentils simmered overnight", 180, "https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=500"),
        ("Dal Tadka", "Yellow lentils with tempering", 150, "https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=500"),
        ("Rajma Masala", "Kidney beans in spiced tomato gravy", 160, "https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500"),
        ("Chole Masala", "Chickpeas in spiced gravy", 150, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500"),
        ("Mix Veg", "Mixed vegetables in spiced gravy", 200, "https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500"),
        ("Paneer Do Pyaza", "Paneer with double onions", 250, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500"),
    ],
    "Maharashtrian Specials": [
        ("Misal Pav", "Spicy sprout curry with pav", 140, "https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500"),
        ("Pav Bhaji", "Spicy vegetable mash with butter pav", 160, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500"),
        ("Pithla Bhakri", "Gram flour curry with flatbread", 130, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500"),
        ("Sabudana Khichdi", "Tapioca pearl dish", 120, "https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500"),
        ("Poha", "Flattened rice dish", 80, "https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500"),
        ("Upma", "Semolina porridge", 70, "https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500"),
        ("Vada Pav", "Spiced potato fritter in bun", 50, "https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500"),
        ("Puran Poli", "Sweet flatbread with jaggery filling", 80, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500"),
    ],
    "South Indian": [
        ("Masala Dosa", "Crispy dosa filled with spiced potato filling", 80, "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500"),
        ("Idli Sambar", "Steamed rice cakes with lentil soup", 60, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500"),
        ("Uttapam", "Thick pancake with vegetable toppings", 90, "https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500"),
        ("Rava Dosa", "Crispy semolina dosa", 70, "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500"),
        ("Filter Coffee", "Traditional South Indian coffee", 40, "https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=500"),
        ("Vada", "Crispy lentil fritters", 50, "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500"),
        ("Sambar", "Spiced lentil soup", 50, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500"),
        ("Coconut Chutney", "Coconut dipping sauce", 30, "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500"),
    ],
    "Chinese & Asian": [
        ("Veg Fried Rice", "Stir-fried rice with mixed vegetables", 150, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500"),
        ("Chicken Fried Rice", "Fried rice with chicken and vegetables", 180, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500"),
        ("Hakka Noodles", "Stir-fried noodles with vegetables", 160, "https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500"),
        ("Spring Rolls", "Crispy vegetable spring rolls", 120, "https://images.unsplash.com/photo-1606525436872-0996a0590969?w=500"),
        ("Manchurian", "Indo-Chinese vegetable balls in sauce", 180, "https://images.unsplash.com/photo-1645177628172-a94c1f96e6db?w=500"),
        ("Chilli Paneer", "Spicy paneer with bell peppers", 200, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500"),
        ("Chicken Manchurian", "Indo-Chinese chicken balls in spicy sauce", 220, "https://images.unsplash.com/photo-1645177628172-a94c1f96e6db?w=500"),
        ("Chilli Chicken", "Spicy chicken with bell peppers", 240, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500"),
    ],
    "Rice & Biryani": [
        ("Veg Biryani", "Aromatic rice with mixed vegetables", 220, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500"),
        ("Chicken Biryani", "Aromatic basmati rice with spiced chicken", 260, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500"),
        ("Mutton Biryani", "Aromatic rice with tender mutton", 320, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500"),
        ("Hyderabadi Biryani", "Authentic Hyderabadi style biryani", 280, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500"),
        ("Kolkata Biryani", "Kolkata style biryani with potato", 270, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500"),
    ],
    "Pizza": [
        ("Margherita Pizza", "Classic pizza with tomato, mozzarella and basil", 280, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500"),
        ("Pepperoni Pizza", "Loaded with pepperoni and cheese", 350, "https://images.unsplash.com/photo-1628840042765-356cda07504e?w=500"),
        ("Veggie Supreme", "Loaded with vegetables and cheese", 320, "https://images.unsplash.com/photo-1511689660979-10d2b1aada49?w=500"),
        ("Cheese Pizza", "Extra cheese pizza", 300, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500"),
        ("BBQ Chicken Pizza", "BBQ chicken with vegetables", 380, "https://images.unsplash.com/photo-1628840042765-356cda07504e?w=500"),
    ],
    "Burgers": [
        ("Classic Burger", "Beef patty with lettuce and cheese", 180, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500"),
        ("Veggie Burger", "Vegetarian patty with fresh vegetables", 150, "https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500"),
        ("Chicken Burger", "Crispy chicken fillet burger", 170, "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=500"),
        ("Cheese Burger", "Double cheese burger", 200, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500"),
    ],
    "Café Specials": [
        ("Cappuccino", "Classic Italian coffee with foam", 120, "https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500"),
        ("Latte", "Smooth espresso with steamed milk", 140, "https://images.unsplash.com/photo-1541167760496-1628856ab772?w=500"),
        ("Cold Coffee", "Chilled coffee with ice cream", 150, "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500"),
        ("Sandwich", "Grilled vegetable sandwich", 160, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500"),
        ("Cake Slice", "Slice of chocolate cake", 120, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500"),
        ("Muffin", "Blueberry or chocolate chip muffin", 70, "https://images.unsplash.com/photo-1607958996333-41aef7caefaa?w=500"),
    ],
    "Desserts & Sweets": [
        ("Gulab Jamun", "Deep-fried milk dumplings in syrup", 120, "https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500"),
        ("Rasgulla", "Spongy cottage cheese balls in syrup", 110, "https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500"),
        ("Kheer", "Rice pudding with nuts", 100, "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500"),
        ("Gajar Ka Halwa", "Carrot pudding with ghee", 130, "https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500"),
        ("Rasmalai", "Cottage cheese in sweetened milk", 140, "https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500"),
        ("Ice Cream", "Assorted ice cream flavors", 100, "https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500"),
    ],
    "Cold Drinks & Mocktails": [
        ("Masala Chai", "Spiced Indian tea", 40, "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500"),
        ("Lassi", "Sweet yogurt drink", 60, "https://images.unsplash.com/photo-1587015566805-245e8285665e?w=500"),
        ("Fresh Lime Soda", "Refreshing lime soda", 50, "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500"),
        ("Mango Lassi", "Mango yogurt drink", 80, "https://images.unsplash.com/photo-1587015566805-245e8285665e?w=500"),
        ("Fresh Juice", "Mixed fruit fresh juice", 120, "https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500"),
    ],
    "Roti, Naan & Paratha": [
        ("Butter Naan", "Soft naan brushed with butter", 40, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500"),
        ("Garlic Naan", "Naan topped with garlic", 45, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500"),
        ("Tandoori Roti", "Traditional clay oven roti", 25, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500"),
        ("Laccha Paratha", "Layered paratha", 50, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500"),
        ("Aloo Paratha", "Stuffed potato paratha", 60, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500"),
    ],
    "Coffee & Tea": [
        ("Masala Chai", "Spiced Indian tea", 40, "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500"),
        ("Green Tea", "Refreshing green tea", 50, "https://images.unsplash.com/photo-1627435601361-ec25f5b1d0e5?w=500"),
        ("Black Coffee", "Strong black coffee", 60, "https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=500"),
    ],
    "Shakes & Smoothies": [
        ("Mango Shake", "Fresh mango milkshake", 100, "https://images.unsplash.com/photo-1587015566805-245e8285665e?w=500"),
        ("Chocolate Shake", "Rich chocolate milkshake", 110, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500"),
        ("Strawberry Smoothie", "Fresh strawberry smoothie", 120, "https://images.unsplash.com/photo-993483514752-2c9dc0f97e51?w=500"),
    ],
    "Fresh Juices": [
        ("Orange Juice", "Fresh orange juice", 80, "https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500"),
        ("Mixed Fruit Juice", "Fresh mixed fruit juice", 120, "https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500"),
        ("Watermelon Juice", "Fresh watermelon juice", 90, "https://images.unsplash.com/photo-1527668752968-14dc70a27c95?w=500"),
    ],
    "Ice Cream": [
        ("Vanilla Ice Cream", "Classic vanilla ice cream", 80, "https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500"),
        ("Chocolate Ice Cream", "Rich chocolate ice cream", 90, "https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500"),
        ("Mango Ice Cream", "Mango flavored ice cream", 100, "https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500"),
    ],
    "Street Food & Chaat": [
        ("Pani Puri", "Crispy puri with tangy water", 80, "https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500"),
        ("Samosa", "Crispy potato filled pastry", 50, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500"),
        ("Aloo Tikki", "Spiced potato patties", 70, "https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500"),
    ],
    "Starters": [
        ("Paneer Tikka", "Marinated paneer cubes grilled in tandoor", 220, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500"),
        ("Hara Bhara Kabab", "Spinach and green pea patties", 180, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500"),
        ("Veg Seekh Kebab", "Spiced vegetable skewers", 200, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500"),
    ],
    "Indian Thalis": [
        ("Maharashtrian Thali", "Complete Maharashtrian meal", 350, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500"),
        ("North Indian Thali", "Complete North Indian meal", 380, "https://images.unsplash.com/photo-1567337710282-00832b415979?w=500"),
        ("South Indian Thali", "Complete South Indian meal", 320, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500"),
    ],
}

# Generate SQL
sql_output = []
sql_output.append("-- EAT - Comprehensive Menu Expansion")
sql_output.append("-- Generated by generate_menus.py")
sql_output.append("")
sql_output.append("INSERT INTO food_items (restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time)")
sql_output.append("VALUES")

item_count = 0
for restaurant in restaurants:
    cuisine_lower = restaurant["cuisine"].lower()
    is_veg = restaurant["veg"]
    items_for_restaurant = []
    
    # Determine relevant categories based on cuisine
    relevant_categories = []
    if "north indian" in cuisine_lower or "maharashtrian" in cuisine_lower:
        relevant_categories.extend(["North Indian", "Maharashtrian", "Roti & Naan", "Desserts", "Beverages"])
    if "south indian" in cuisine_lower:
        relevant_categories.extend(["South Indian", "Desserts", "Beverages"])
    if "chinese" in cuisine_lower or "momos" in cuisine_lower:
        relevant_categories.extend(["Chinese", "Beverages"])
    if "biryani" in cuisine_lower:
        relevant_categories.extend(["Biryani", "Beverages"])
    if "chicken" in cuisine_lower or "non-veg" in cuisine_lower:
        relevant_categories.extend(["North Indian", "Biryani", "Beverages"])
    if "pizza" in cuisine_lower:
        relevant_categories.extend(["Pizza", "Beverages"])
    if "burger" in cuisine_lower:
        relevant_categories.extend(["Burgers", "Beverages"])
    if "café" in cuisine_lower or "cafe" in cuisine_lower or "cake" in cuisine_lower or "juice" in cuisine_lower or "ice cream" in cuisine_lower or "sweet" in cuisine_lower:
        relevant_categories.extend(["Café", "Desserts", "Beverages"])
    if "kebab" in cuisine_lower:
        relevant_categories.extend(["North Indian", "Biryani", "Beverages"])
    if "healthy" in cuisine_lower or "salad" in cuisine_lower:
        relevant_categories.extend(["Café", "Beverages"])
    
    # Fallback: if no categories matched, add default categories
    if not relevant_categories:
        relevant_categories = ["North Indian", "Beverages", "Desserts"]
    
    # Add items for each relevant category (multiple rounds to reach target count)
    target_count = 50 if restaurant["type"] == "cafe" else 80
    rounds = 0
    while len(items_for_restaurant) < target_count and rounds < 3:
        for category in relevant_categories:
            if category in dish_templates and len(items_for_restaurant) < target_count:
                for name, desc, price, image in dish_templates[category]:
                    if len(items_for_restaurant) >= target_count:
                        break
                    # Determine if item should be vegetarian
                    item_is_veg = is_veg
                    if category in ["Chinese", "Biryani", "Pizza", "Burgers"]:
                        # Mix veg and non-veg for these categories unless restaurant is pure veg
                        if not is_veg:
                            item_is_veg = (item_count % 3 != 0)  # 2/3 non-veg

                    # Add to SQL
                    sql_output.append(f"({restaurant['id']}, '{name}', '{desc}', {price}.00, '{image}', '{category}', {str(item_is_veg).lower()}, true, {str(item_count % 10 == 0).lower()}, {15 + (item_count % 20)}),")
                    item_count += 1
                    items_for_restaurant.append(name)
        rounds += 1
    
    # Add thalis for thali-focused restaurants
    if "thali" in cuisine_lower:
        sql_output.append(f"({restaurant['id']}, 'Maharashtrian Thali', 'Complete Maharashtrian meal', 350.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500', 'Indian Thalis', true, true, true, 30),")
        sql_output.append(f"({restaurant['id']}, 'North Indian Thali', 'Complete North Indian meal', 380.00, 'https://images.unsplash.com/photo-1567337710282-00832b415979?w=500', 'Indian Thalis', true, false, true, 30),")
        item_count += 2
        items_for_restaurant.extend(["Maharashtrian Thali", "North Indian Thali"])
    
    print(f"Restaurant {restaurant['id']} ({restaurant['name']}): {len(items_for_restaurant)} items")

# Remove trailing comma from last line
sql_output[-1] = sql_output[-1].rstrip(",")

sql_output.append("")
sql_output.append("ON CONFLICT DO NOTHING;")
sql_output.append("")
sql_output.append(f"-- Total items generated: {item_count}")

# Write to file
with open("D:/MY PROJECTS/EAT/database/seed-final-menu-expansion.sql", "w") as f:
    f.write("\n".join(sql_output))

print(f"\nGenerated {item_count} menu items for {len(restaurants)} restaurants")
print("Output written to: D:/MY PROJECTS/EAT/database/seed-final-menu-expansion.sql")
