#!/usr/bin/env python3
"""
Remove duplicate food items and replace with unique items.
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

# Additional unique food items to replace duplicates
additional_items = {
    "Starters": [
        ("Dahi Vada", "Fried lentil dumplings in yogurt", 110, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Kachori Chaat", "Kachori with chutneys", 130, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80"),
        ("Poha", "Flattened rice dish", 70, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Upma", "Semolina porridge", 60, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Pattice", "Spiced potato patty", 50, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
    ],
    "Main Course": [
        ("Rajma Masala", "Kidney beans in gravy", 180, "https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80"),
        ("Aloo Gobi", "Potato and cauliflower curry", 160, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Baingan Bharta", "Roasted eggplant curry", 170, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
        ("Bhindi Masala", "Okra in spiced gravy", 150, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Aloo Matar", "Potato and peas curry", 140, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
    ],
    "Rice": [
        ("Veg Pulao", "Aromatic vegetable rice", 180, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80"),
        ("Lemon Rice", "Lemon flavored rice", 150, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Tamarind Rice", "Tangy tamarind rice", 140, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
        ("Coconut Rice", "Coconut flavored rice", 150, "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80"),
    ],
    "Breads": [
        ("Roti", "Whole wheat bread", 20, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Paratha", "Layered flatbread", 35, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Missi Roti", "Gram flour bread", 30, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
    ],
    "Snacks": [
        ("Samosa", "Crispy potato pastry", 40, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80"),
        ("Kachori", "Spiced pastry", 45, "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80"),
        ("Pakora", "Fried vegetable fritters", 50, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
    ],
}

print("Finding and fixing duplicate food items...")
print()

# Get restaurants with duplicates (specific ones only)
cursor.execute("""
    SELECT d.restaurant_id, r.name, COUNT(*) as duplicate_count
    FROM (
        SELECT restaurant_id, name, COUNT(*) as cnt
        FROM food_items
        GROUP BY restaurant_id, name
        HAVING COUNT(*) > 1
    ) d
    JOIN restaurants r ON d.restaurant_id = r.restaurant_id
    WHERE d.restaurant_id IN (40, 43)
    GROUP BY d.restaurant_id, r.name
    ORDER BY d.restaurant_id
""")

restaurants_with_duplicates = cursor.fetchall()

if not restaurants_with_duplicates:
    print("No duplicates found!")
    cursor.close()
    conn.close()
    exit()

print(f"Found {len(restaurants_with_duplicates)} restaurants with duplicates")
print()

# Get max food_id
cursor.execute("SELECT MAX(food_id) FROM food_items")
max_food_id = cursor.fetchone()[0] or 0
food_id_counter = max_food_id

# Process each restaurant
for restaurant_id, name, dup_count in restaurants_with_duplicates:
    print(f"Processing: {name} (ID: {restaurant_id})")
    
    # Get duplicate items for this restaurant
    cursor.execute("""
        SELECT name, COUNT(*) as cnt, MIN(food_id) as keep_id
        FROM food_items
        WHERE restaurant_id = %s
        GROUP BY name
        HAVING COUNT(*) > 1
    """, (restaurant_id,))
    
    duplicates = cursor.fetchall()
    
    items_to_delete = 0
    for dup_name, cnt, keep_id in duplicates:
        # Delete all but the first occurrence
        cursor.execute("""
            DELETE FROM food_items
            WHERE restaurant_id = %s AND name = %s AND food_id != %s
        """, (restaurant_id, dup_name, keep_id))
        deleted = cursor.rowcount
        items_to_delete += deleted
        print(f"  - Deleted {deleted} copies of '{dup_name}' (kept food_id {keep_id})")
    
    print(f"  Total deleted: {items_to_delete}")
    
    # Add replacement items to maintain 100+ count
    cursor.execute("""
        SELECT COUNT(*) FROM food_items WHERE restaurant_id = %s
    """, (restaurant_id,))
    current_count = cursor.fetchone()[0]
    
    items_needed = 100 - current_count
    if items_needed > 0:
        print(f"  Adding {items_needed} unique replacement items...")
        
        # Get restaurant type
        cursor.execute("SELECT is_pure_veg FROM restaurants WHERE restaurant_id = %s", (restaurant_id,))
        is_pure_veg = cursor.fetchone()[0]
        
        # Add unique items
        added = 0
        for category, items in additional_items.items():
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
        
        print(f"  Added {added} unique items")
    
    print()

cursor.close()
conn.close()

print("Duplicate fix completed!")
print("Run audit-restaurants.py again to verify.")
