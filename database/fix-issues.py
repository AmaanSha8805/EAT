#!/usr/bin/env python3
"""
Fix issues found during cleanup: image URLs and item counts.
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

print("=" * 80)
print("FIXING CLEANUP ISSUES")
print("=" * 80)
print()

# Step 1: Fix problematic image URLs
print("Step 1: Fixing problematic image URLs...")

# Replace problematic URLs with working ones
url_replacements = {
    "https://images.unsplash.com/photo-1621506289937-a8e4d899a80c?w=500&q=80": "https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80",
    "https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80": "https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80",
    "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80": "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80",
    "https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop": "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop",
    "https://images.unsplash.com/photo-1666190094762-3a8f6f6a6f6f?w=400&h=300&fit=crop": "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop",
    "https://images.unsplash.com/photo-1606525436872-0996a0590969?w=500&q=80": "https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80",
    "https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80": "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80",
    "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80": "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80",
}

for old_url, new_url in url_replacements.items():
    cursor.execute("""
        UPDATE food_items
        SET image_url = %s
        WHERE image_url = %s
    """, (new_url, old_url))
    if cursor.rowcount > 0:
        print(f"  - Updated {cursor.rowcount} items with new URL")

print()

# Step 2: Add items to restaurants below 100
print("Step 2: Adding items to restaurants below 100...")

restaurants_needing_items = [
    (5, "Hotel Gokul Pure Veg", 98, 2),
    (6, "Morya's Royal Treat Rooftop Restaurant", 98, 2),
    (20, "B For Burger", 97, 3),
    (22, "Chaundeshwari Chat Bhandar", 95, 5),
    (25, "Maharashtra Chat Bhandar", 97, 3),
    (27, "PAGAL CHINESE FOOD", 96, 4),
    (28, "Paesaute Chicken", 97, 3),
    (40, "Burger Barn", 99, 1),
    (43, "Continental Kitchen", 99, 1),
]

# Additional unique items
additional_items = [
    ("Pav Bhaji", "Spiced vegetable curry with bread", 120, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80", "Snacks"),
    ("Misal Pav", "Spicy sprout curry with bread", 100, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80", "Snacks"),
    ("Thalipeeth", "Multigrain flatbread", 80, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80", "Breads"),
    ("Dhokla", "Steamed gram flour cake", 70, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks"),
    ("Khandvi", "Gram flour rolls", 65, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks"),
    ("Muthiya", "Steamed dumplings", 60, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks"),
    ("Ragda Pattice", "Potato patties with curry", 80, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks"),
    ("Panipuri", "Hollow puri with filling", 50, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80", "Snacks"),
    ("Dahi Puri", "Yogurt puri", 75, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks"),
    ("Sev Puri", "Crispy puri with toppings", 70, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks"),
]

# Get max food_id
cursor.execute("SELECT MAX(food_id) FROM food_items")
max_food_id = cursor.fetchone()[0] or 0
food_id_counter = max_food_id

for restaurant_id, name, current_count, items_needed in restaurants_needing_items:
    print(f"  Processing: {name} (ID: {restaurant_id}, Current: {current_count}, Need: {items_needed})")
    
    # Get restaurant type
    cursor.execute("SELECT is_pure_veg FROM restaurants WHERE restaurant_id = %s", (restaurant_id,))
    is_pure_veg = cursor.fetchone()[0]
    
    # Add items
    added = 0
    for i in range(items_needed):
        item_name, desc, price, image, category = additional_items[i % len(additional_items)]
        food_id_counter += 1
        cursor.execute("""
            INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, true, false, 15, 'Regular')
        """, (food_id_counter, restaurant_id, item_name, desc, price, image, category, is_pure_veg))
        added += 1
    
    print(f"    Added {added} items")

print()

cursor.close()
conn.close()

print("=" * 80)
print("ISSUES FIXED")
print("=" * 80)
print("Run audit-restaurants.py for final verification.")
