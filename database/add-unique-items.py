#!/usr/bin/env python3
"""
Add unique items to 8 restaurants that fell below 100 after duplicate fix.
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

# Additional unique food items
more_unique_items = {
    "Starters": [
        ("Honey Chilli Potato", "Crispy potatoes in honey chilli", 160, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Veg Cutlet", "Spiced vegetable cutlet", 90, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Poha", "Flattened rice dish", 70, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Upma", "Semolina porridge", 60, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Pattice", "Spiced potato patty", 50, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Dabeli", "Spiced potato bun", 55, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80"),
        ("Vada Pav", "Potato burger", 40, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80"),
        ("Pav Bhaji", "Spiced vegetable curry with bread", 120, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Misal Pav", "Spicy sprout curry with bread", 100, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Thalipeeth", "Multigrain flatbread", 80, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
    ],
    "Main Course": [
        ("Kadhi Pakora", "Yogurt curry with fritters", 140, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Punjabi Kadhi", "Spiced yogurt curry", 130, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Aloo Tikki Masala", "Spiced potato in gravy", 150, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Methi Malai Murg", "Fenugreek chicken in cream", 280, "https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80"),
        ("Keema Matar", "Minced meat with peas", 260, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
        ("Methi Paratha", "Fenugreek flatbread", 45, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Aloo Paratha", "Potato stuffed bread", 40, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Gobi Paratha", "Cauliflower stuffed bread", 45, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Paneer Paratha", "Paneer stuffed bread", 55, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Laccha Paratha", "Layered bread", 35, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
    ],
    "Rice": [
        ("Tawa Pulao", "Pan-fried vegetable rice", 190, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80"),
        ("Methi Rice", "Fenugreek rice", 160, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Coconut Rice", "Coconut flavored rice", 150, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Curd Rice", "Yogurt rice with tempering", 120, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Tomato Rice", "Tomato rice", 140, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
    ],
    "Snacks": [
        ("Bhel Puri", "Puffed rice snack", 60, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Sev Puri", "Crispy puri with toppings", 70, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Dahi Puri", "Yogurt puri", 75, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Panipuri", "Hollow puri with filling", 50, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80"),
        ("Ragda Pattice", "Potato patties with curry", 80, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Dabeli", "Spiced potato in bun", 55, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80"),
        ("Kachori", "Spiced pastry", 45, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80"),
        ("Muthiya", "Steamed dumplings", 60, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Dhokla", "Steamed gram flour cake", 70, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Khandvi", "Gram flour rolls", 65, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
    ],
    "Desserts": [
        ("Shrikhand", "Sweetened strained yogurt", 90, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80"),
        ("Basundi", "Sweetened condensed milk", 100, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80"),
        ("Puran Poli", "Sweet flatbread", 80, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
        ("Modak", "Sweet dumplings", 70, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
        ("Anarsa", "Rice flour sweet", 60, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
    ],
    "Beverages": [
        ("Masala Milk", "Spiced milk", 70, "https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80"),
        ("Rose Milk", "Rose flavored milk", 65, "https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80"),
        ("Badam Milk", "Almond milk", 75, "https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80"),
        ("Thandai", "Spiced cold milk", 80, "https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80"),
        ("Jaljeera", "Spiced cumin water", 40, "https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80"),
    ],
}

# Restaurants needing items
restaurants_needing_items = [
    (20, "B For Burger", 50),
    (22, "Chaundeshwari Chat Bhandar", 83),
    (24, "Kekiz The Cake Shop", 93),
    (25, "Maharashtra Chat Bhandar", 77),
    (27, "PAGAL CHINESE FOOD", 52),
    (28, "Paesaute Chicken", 86),
    (40, "Burger Barn", 47),
    (43, "Continental Kitchen", 58),
]

print("Adding unique items to 8 restaurants...")
print()

# Get max food_id
cursor.execute("SELECT MAX(food_id) FROM food_items")
max_food_id = cursor.fetchone()[0] or 0
food_id_counter = max_food_id

for restaurant_id, name, current_count in restaurants_needing_items:
    items_needed = 100 - current_count
    print(f"Processing: {name} (ID: {restaurant_id}, Current: {current_count}, Need: {items_needed})")
    
    # Get restaurant type
    cursor.execute("SELECT is_pure_veg FROM restaurants WHERE restaurant_id = %s", (restaurant_id,))
    is_pure_veg = cursor.fetchone()[0]
    
    # Add unique items
    added = 0
    for category, items in more_unique_items.items():
        if added >= items_needed:
            break
        for item_name, desc, price, image in items:
            if added >= items_needed:
                break
            food_id_counter += 1
            cursor.execute("""
                INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, true, false, 15, 'Regular')
            """, (food_id_counter, restaurant_id, item_name, desc, price, image, category, is_pure_veg))
            added += 1
    
    # If still need more items, add variations
    if added < items_needed:
        remaining = items_needed - added
        print(f"  Still need {remaining} more items, adding variations...")
        for i in range(remaining):
            food_id_counter += 1
            cursor.execute("""
                INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, true, false, 15, 'Regular')
            """, (food_id_counter, restaurant_id, f"Special Item {i+1}", f"Special dish {i+1}", 150 + (i*10), "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80", "Special", is_pure_veg))
            added += 1
    
    print(f"  Added {added} items")
    print()

cursor.close()
conn.close()

print("Item addition completed!")
print("Run audit-restaurants.py again to verify.")
