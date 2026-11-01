#!/usr/bin/env python3
"""
Generate menu items for the remaining 31 restaurants that need expansion.
"""

import psycopg2

# Database connection
conn = psycopg2.connect(
    host="localhost",
    database="eat_db",
    user="postgres",
    password="panda"
)
conn.autocommit = True
cursor = conn.cursor()

# Get restaurants needing expansion (fewer than 100 items)
cursor.execute("""
    SELECT r.restaurant_id, r.name, r.is_pure_veg, 
           COUNT(fi.food_id) as current_count
    FROM restaurants r
    LEFT JOIN food_items fi ON r.restaurant_id = fi.restaurant_id
    GROUP BY r.restaurant_id, r.name, r.is_pure_veg
    HAVING COUNT(fi.food_id) < 100 OR COUNT(fi.food_id) IS NULL
    ORDER BY r.restaurant_id
""")

restaurants_needing_expansion = cursor.fetchall()

print(f"Restaurants needing menu expansion: {len(restaurants_needing_expansion)}")
print()

# Food item templates organized by cuisine
north_indian_veg = {
    "Starters": [
        ("Paneer Tikka", "Marinated paneer cubes grilled to perfection", 220, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
        ("Hara Bhara Kabab", "Spinach and green pea patties", 180, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80"),
        ("Veg Manchurian", "Crispy vegetable balls in tangy sauce", 190, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Spring Roll", "Crispy vegetable spring rolls", 150, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Paneer 65", "Spicy paneer cubes deep fried", 200, "https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80"),
        ("Mushroom Tikka", "Marinated mushrooms grilled", 210, "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80"),
        ("Aloo Tikki", "Spiced potato patties", 120, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Dahi Kebab", "Hung curd patties", 180, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Corn Cheese Balls", "Crispy corn and cheese balls", 170, "https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80"),
        ("Veg Crispy", "Crispy vegetable fingers", 160, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
    ],
    "Main Course": [
        ("Paneer Butter Masala", "Creamy paneer in tomato gravy", 240, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
        ("Dal Makhani", "Creamy black lentils", 180, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
        ("Mix Veg", "Mixed vegetables in gravy", 200, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Palak Paneer", "Spinach with paneer cubes", 220, "https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80"),
        ("Kadai Paneer", "Paneer in bell pepper gravy", 230, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
        ("Shahi Paneer", "Royal paneer in cashew gravy", 250, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80"),
        ("Matar Paneer", "Peas with paneer", 210, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Malai Kofta", "Cheese dumplings in creamy gravy", 260, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Veg Kolhapuri", "Spicy vegetable curry", 220, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
        ("Chana Masala", "Chickpeas in spiced gravy", 190, "https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80"),
    ],
    "Rice": [
        ("Veg Biryani", "Aromatic rice with vegetables", 220, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80"),
        ("Jeera Rice", "Cumin flavored rice", 140, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Veg Pulao", "Vegetable pulao", 180, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80"),
        ("Fried Rice", "Indo-Chinese fried rice", 160, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80"),
        ("Kheer", "Rice pudding", 120, "https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=500&q=80"),
    ],
    "Breads": [
        ("Butter Naan", "Soft naan with butter", 40, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Tandoori Roti", "Traditional tandoori bread", 25, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Garlic Naan", "Naan with garlic", 50, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Cheese Naan", "Naan stuffed with cheese", 60, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Kulcha", "Stuffed flatbread", 45, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
    ],
}

north_indian_nonveg = {
    "Starters": [
        ("Chicken Tikka", "Marinated chicken grilled", 260, "https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80"),
        ("Tandoori Chicken", "Spiced tandoori chicken", 290, "https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80"),
        ("Chicken 65", "Spicy chicken fry", 240, "https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80"),
        ("Fish Tikka", "Grilled fish tikka", 280, "https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?w=500&q=80"),
        ("Mutton Seekh Kebab", "Minced mutton kebabs", 320, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
    ],
    "Main Course": [
        ("Butter Chicken", "Chicken in creamy tomato gravy", 280, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
        ("Chicken Curry", "Traditional chicken curry", 260, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
        ("Mutton Curry", "Spiced mutton curry", 320, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
        ("Chicken Korma", "Creamy chicken korma", 290, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
        ("Egg Curry", "Egg in spiced gravy", 180, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
    ],
}

south_indian = {
    "Dosa": [
        ("Masala Dosa", "Crispy dosa with potato filling", 120, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Plain Dosa", "Simple crispy dosa", 80, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Rava Dosa", "Semolina dosa", 100, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Onion Dosa", "Dosa with onions", 110, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Paper Dosa", "Extra thin crispy dosa", 90, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Set Dosa", "Soft set dosa", 85, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Cheese Dosa", "Dosa with cheese", 140, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Mysore Dosa", "Spicy red chutney dosa", 130, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
    ],
    "Idli": [
        ("Plain Idli", "Steamed rice cakes", 40, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
        ("Sambar Idli", "Idli with sambar", 60, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
        ("Rava Idli", "Semolina idli", 50, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
    ],
    "Uttapam": [
        ("Uttapam", "Thick pancake with toppings", 90, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Onion Uttapam", "Uttapam with onions", 95, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Tomato Uttapam", "Uttapam with tomatoes", 95, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Mixed Veg Uttapam", "Uttapam with vegetables", 100, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Cheese Uttapam", "Uttapam with cheese", 110, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
    ],
}

chinese = {
    "Starters": [
        ("Veg Momos", "Steamed vegetable dumplings", 120, "https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80"),
        ("Veg Spring Roll", "Crispy vegetable rolls", 140, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Veg Wontons", "Fried vegetable wontons", 150, "https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80"),
        ("Honey Chilli Potato", "Crispy potatoes in honey chilli", 160, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
    ],
    "Main Course": [
        ("Veg Fried Rice", "Vegetable fried rice", 180, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80"),
        ("Veg Noodles", "Stir-fried vegetable noodles", 170, "https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80"),
        ("Manchurian", "Indo-Chinese vegetable balls", 190, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Chilli Paneer", "Spicy paneer in sauce", 220, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
    ],
}

italian = {
    "Pizza": [
        ("Margherita Pizza", "Classic tomato and cheese pizza", 280, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80"),
        ("Veggie Supreme", "Loaded vegetable pizza", 320, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80"),
        ("Cheese Pizza", "Extra cheese pizza", 300, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80"),
        ("Paneer Pizza", "Pizza with paneer topping", 340, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80"),
        ("Onion Pizza", "Pizza with onion topping", 290, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80"),
    ],
    "Pasta": [
        ("Penne Alfredo", "Creamy white sauce pasta", 240, "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80"),
        ("Spaghetti Arrabbiata", "Spicy tomato pasta", 220, "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80"),
        ("Macaroni", "Cheesy macaroni", 200, "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80"),
    ],
}

beverages = {
    "Coffee": [
        ("Espresso", "Strong black coffee", 60, "https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80"),
        ("Cappuccino", "Espresso with steamed milk", 80, "https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80"),
        ("Latte", "Milky coffee", 90, "https://images.unsplash.com/photo-1561882468-9110e03e0f78?w=500&q=80"),
        ("Cold Coffee", "Iced coffee", 100, "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80"),
        ("Turkish Coffee", "Traditional Turkish coffee", 70, "https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80"),
    ],
    "Tea": [
        ("Masala Chai", "Spiced Indian tea", 50, "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80"),
        ("Green Tea", "Healthy green tea", 60, "https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80"),
        ("Lemon Tea", "Tea with lemon", 55, "https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80"),
        ("Ginger Tea", "Tea with ginger", 55, "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80"),
        ("Iced Tea", "Cold tea", 70, "https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80"),
        ("Earl Grey", "Classic black tea", 65, "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80"),
        ("Peppermint Tea", "Mint tea", 60, "https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80"),
        ("Chamomile Tea", "Herbal tea", 65, "https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80"),
    ],
    "Cold Drinks": [
        ("Mojito", "Fresh mint mojito", 120, "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=500&q=80"),
        ("Lemonade", "Fresh lemonade", 80, "https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80"),
        ("Fresh Lime Soda", "Lime soda", 70, "https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80"),
        ("Orange Juice", "Fresh orange juice", 90, "https://images.unsplash.com/photo-1621506289937-a8e4d899a80c?w=500&q=80"),
        ("Watermelon Juice", "Fresh watermelon juice", 85, "https://images.unsplash.com/photo-1528825871115-3581a5387919?w=500&q=80"),
    ],
    "Smoothies": [
        ("Mango Smoothie", "Fresh mango smoothie", 140, "https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80"),
        ("Strawberry Smoothie", "Strawberry smoothie", 130, "https://images.unsplash.com/photo-1577805947697-89e18249d767?w=500&q=80"),
        ("Banana Smoothie", "Banana smoothie", 120, "https://images.unsplash.com/photo-1577805947697-89e18249d767?w=500&q=80"),
        ("Green Smoothie", "Healthy green smoothie", 130, "https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80"),
        ("Pineapple Smoothie", "Pineapple smoothie", 130, "https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80"),
    ],
}

desserts = {
    "Cakes": [
        ("Chocolate Cake", "Rich chocolate cake", 180, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
        ("Vanilla Cake", "Simple vanilla cake", 160, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
        ("Black Forest Cake", "Chocolate and cherry cake", 190, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
        ("Red Velvet Cake", "Red velvet cake", 200, "https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80"),
        ("Pineapple Cake", "Pineapple flavored cake", 170, "https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80"),
        ("Butterscotch Cake", "Butterscotch cake", 180, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
        ("Fruit Cake", "Mixed fruit cake", 190, "https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80"),
        ("Truffle Cake", "Chocolate truffle", 220, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
    ],
    "Pastries": [
        ("Chocolate Pastry", "Chocolate filled pastry", 80, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
        ("Black Forest Pastry", "Cherry chocolate pastry", 90, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
        ("Pineapple Pastry", "Pineapple pastry", 80, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
        ("Vanilla Pastry", "Cream vanilla pastry", 75, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
        ("Strawberry Pastry", "Strawberry pastry", 85, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
    ],
    "Ice Cream": [
        ("Vanilla Ice Cream", "Classic vanilla", 100, "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80"),
        ("Chocolate Ice Cream", "Rich chocolate", 110, "https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80"),
        ("Strawberry Ice Cream", "Fresh strawberry", 110, "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80"),
        ("Mango Ice Cream", "Mango flavor", 120, "https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80"),
        ("Butterscotch Ice Cream", "Butterscotch flavor", 110, "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80"),
        ("Kulfi", "Traditional Indian ice cream", 80, "https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80"),
    ],
    "Sweets": [
        ("Gulab Jamun", "Sweet milk dumplings", 80, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80"),
        ("Rasgulla", "Spongy cheese balls", 70, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80"),
        ("Jalebi", "Crispy sweet spirals", 70, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80"),
        ("Rasmalai", "Creamy cheese in milk", 90, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80"),
        ("Kaju Katli", "Cashew fudge", 120, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
        ("Barfi", "Milk fudge", 100, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
        ("Pedha", "Sweet milk solids", 80, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
        ("Ladoo", "Sweet balls", 70, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
    ],
}

snacks = {
    "Snacks": [
        ("Sandwich", "Club sandwich", 120, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80"),
        ("Grilled Sandwich", "Grilled vegetable sandwich", 100, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80"),
        ("Cheese Sandwich", "Cheese sandwich", 110, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80"),
        ("Veg Burger", "Vegetable burger", 140, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Cheese Burger", "Cheese burger", 160, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("French Fries", "Crispy french fries", 90, "https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&q=80"),
        ("Onion Rings", "Crispy onion rings", 100, "https://images.unsplash.com/photo-1639024471283-03518883512d?w=500&q=80"),
    ],
}

# Generate SQL
sql_statements = []
sql_statements.append("-- Migration: Add menu items for remaining 31 restaurants")
sql_statements.append("-- Date: 2026-10-31")
sql_statements.append("-- Purpose: Ensure all 43 restaurants have at least 100 unique food items")
sql_statements.append("")

# Get max food_id
cursor.execute("SELECT MAX(food_id) FROM food_items")
max_food_id = cursor.fetchone()[0] or 0
food_id_counter = max_food_id

for restaurant_id, name, is_pure_veg, current_count in restaurants_needing_expansion:
    print(f"Processing: {name} (ID: {restaurant_id}, Current: {current_count})")
    
    sql_statements.append(f"-- Restaurant: {name} (ID: {restaurant_id})")
    sql_statements.append(f"-- Pure Veg: {is_pure_veg}")
    sql_statements.append(f"-- Current items: {current_count}")
    sql_statements.append("")
    
    menu_items = []
    
    # Determine cuisine type from name
    name_lower = name.lower()
    
    # Select appropriate menu based on restaurant type
    if "veg" in name_lower or "pure veg" in name_lower or is_pure_veg:
        # Pure veg restaurant
        if "dosa" in name_lower or "idli" in name_lower:
            # South Indian
            for category, items in south_indian.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "pizza" in name_lower or "domino" in name_lower:
            # Pizza
            for category, items in italian.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "burger" in name_lower:
            # Burger
            for category, items in snacks.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "coffee" in name_lower or "cafe" in name_lower:
            # Coffee/Cafe
            for category, items in beverages.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in snacks.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "cake" in name_lower or "bakery" in name_lower:
            # Bakery
            for category, items in desserts.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in beverages.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "chat" in name_lower or "bhandar" in name_lower:
            # Chat
            for category, items in snacks.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in north_indian_veg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "chinese" in name_lower:
            # Chinese
            for category, items in chinese.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "continental" in name_lower:
            # Continental
            for category, items in italian.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in north_indian_veg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "chat" in name_lower or "bhandar" in name_lower:
            # Chat
            for category, items in snacks.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in north_indian_veg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "thali" in name_lower:
            # Thali - North Indian
            for category, items in north_indian_veg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in beverages.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in desserts.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        else:
            # Default North Indian veg
            for category, items in north_indian_veg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            # Add beverages and desserts
            for category, items in beverages.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in desserts.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
    else:
        # Non-veg restaurant
        if "burger" in name_lower:
            for category, items in snacks.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            # Add non-veg burgers
            menu_items.extend([
                ("Chicken Burger", "Chicken burger", 180, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks", False),
                ("Chicken Cheese Burger", "Chicken with cheese", 200, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks", False),
            ])
        elif "chicken" in name_lower:
            for category, items in north_indian_nonveg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, False))
            for category, items in north_indian_veg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        elif "chinese" in name_lower:
            for category, items in chinese.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            menu_items.extend([
                ("Chicken Manchurian", "Chicken in Indo-Chinese sauce", 260, "https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80", "Main Course", False),
                ("Chilli Chicken", "Spicy chicken in sauce", 280, "https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80", "Main Course", False),
                ("Chicken Fried Rice", "Fried rice with chicken", 240, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80", "Rice", False),
                ("Chicken Noodles", "Stir-fried noodles with chicken", 230, "https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80", "Noodles", False),
            ])
        elif "continental" in name_lower:
            for category, items in italian.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in north_indian_nonveg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, False))
        elif "tandoor" in name_lower:
            # Tandoor - North Indian non-veg
            for category, items in north_indian_nonveg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, False))
            for category, items in north_indian_veg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in beverages.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in desserts.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
        else:
            # Default North Indian with both veg and non-veg
            for category, items in north_indian_veg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in north_indian_nonveg.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, False))
            # Add beverages and desserts
            for category, items in beverages.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
            for category, items in desserts.items():
                for item_name, desc, price, image in items:
                    menu_items.append((item_name, desc, price, image, category, True))
    
    # Ensure minimum 100 items
    items_needed = 100 - current_count
    if items_needed > 0:
        # Take only needed items
        menu_items = menu_items[:items_needed]
        
        # If still not enough, add variations
        while len(menu_items) < items_needed:
            for item_name, desc, price, image, category, is_veg in list(menu_items)[:20]:
                if len(menu_items) >= items_needed:
                    break
                new_name = f"Special {item_name}"
                new_price = price + 20
                menu_items.append((new_name, f"Special {desc}", new_price, image, category, is_veg))
    
    # Generate INSERT statements
    for item_name, desc, price, image, category, is_veg in menu_items:
        food_id_counter += 1
        sql = f"""INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES ({food_id_counter}, {restaurant_id}, '{item_name}', '{desc}', {price:.2f}, '{image}', '{category}', {str(is_veg).lower()}, true, false, 15, 'Regular');"""
        sql_statements.append(sql)
    
    sql_statements.append(f"-- Items added: {len(menu_items)}")
    sql_statements.append("")
    sql_statements.append("")

cursor.close()
conn.close()

# Write SQL file
with open("migration-expand-remaining-restaurants.sql", "w") as f:
    f.write("\n".join(sql_statements))

print(f"\nSQL migration file generated: migration-expand-remaining-restaurants.sql")
print(f"Total restaurants processed: {len(restaurants_needing_expansion)}")
