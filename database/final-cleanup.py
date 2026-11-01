#!/usr/bin/env python3
"""
Final quality cleanup of all 43 restaurant menus.
"""

import psycopg2
import requests

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
print("FINAL QUALITY CLEANUP - 43 RESTAURANTS")
print("=" * 80)
print()

# Step 1: Remove remaining duplicates
print("Step 1: Removing remaining duplicate items...")
cursor.execute("""
    SELECT restaurant_id, name, COUNT(*) as cnt
    FROM food_items
    GROUP BY restaurant_id, name
    HAVING COUNT(*) > 1
    ORDER BY restaurant_id
""")

duplicates = cursor.fetchall()

if duplicates:
    print(f"Found {len(duplicates)} duplicate entries to remove...")
    for restaurant_id, name, cnt in duplicates:
        cursor.execute("""
            DELETE FROM food_items
            WHERE restaurant_id = %s AND name = %s AND food_id NOT IN (
                SELECT MIN(food_id) FROM food_items
                WHERE restaurant_id = %s AND name = %s
            )
        """, (restaurant_id, name, restaurant_id, name))
        deleted = cursor.rowcount
        print(f"  - Restaurant {restaurant_id}: Deleted {deleted} copies of '{name}'")
else:
    print("No duplicates found!")

print()

# Step 2: Verify vegetarian classifications
print("Step 2: Verifying vegetarian classifications...")
cursor.execute("""
    SELECT r.restaurant_id, r.name, r.is_pure_veg,
           COUNT(CASE WHEN fi.is_vegetarian = false THEN 1 END) as non_veg_count
    FROM restaurants r
    LEFT JOIN food_items fi ON r.restaurant_id = fi.restaurant_id
    GROUP BY r.restaurant_id, r.name, r.is_pure_veg
    HAVING (r.is_pure_veg = true AND COUNT(CASE WHEN fi.is_vegetarian = false THEN 1 END) > 0)
    OR (r.is_pure_veg = false AND COUNT(CASE WHEN fi.is_vegetarian = false THEN 1 END) = 0 AND COUNT(fi.food_id) > 0)
    ORDER BY r.restaurant_id
""")

misclassifications = cursor.fetchall()

if misclassifications:
    print(f"Found {len(misclassifications)} classification issues...")
    for restaurant_id, name, is_pure_veg, non_veg_count in misclassifications:
        if is_pure_veg and non_veg_count > 0:
            print(f"  WARNING: Pure veg restaurant {name} (ID: {restaurant_id}) has {non_veg_count} non-veg items!")
            # Fix: Convert non-veg items to veg for pure veg restaurants
            cursor.execute("""
                UPDATE food_items
                SET is_vegetarian = true
                WHERE restaurant_id = %s AND is_vegetarian = false
            """, (restaurant_id,))
            print(f"    - Fixed: Converted {cursor.rowcount} items to vegetarian")
        elif not is_pure_veg and non_veg_count == 0:
            print(f"  INFO: Non-pure-veg restaurant {name} (ID: {restaurant_id}) has only veg items")
else:
    print("All vegetarian classifications are correct!")

print()

# Step 3: Check suspicious menu entries
print("Step 3: Checking suspicious menu entries...")

# Check for "Special" items that might be duplicates
cursor.execute("""
    SELECT restaurant_id, name, COUNT(*) as cnt
    FROM food_items
    WHERE name LIKE 'Special%'
    GROUP BY restaurant_id, name
    HAVING COUNT(*) > 1
    ORDER BY restaurant_id
""")

special_duplicates = cursor.fetchall()

if special_duplicates:
    print(f"Found {len(special_duplicates)} duplicate 'Special' items...")
    for restaurant_id, name, cnt in special_duplicates:
        cursor.execute("""
            DELETE FROM food_items
            WHERE restaurant_id = %s AND name = %s AND food_id NOT IN (
                SELECT MIN(food_id) FROM food_items
                WHERE restaurant_id = %s AND name = %s
            )
        """, (restaurant_id, name, restaurant_id, name))
        deleted = cursor.rowcount
        print(f"  - Restaurant {restaurant_id}: Deleted {deleted} copies of '{name}'")
else:
    print("No duplicate 'Special' items found!")

print()

# Step 4: Verify image URLs (sample check)
print("Step 4: Verifying image URLs (sample check)...")
cursor.execute("""
    SELECT DISTINCT image_url
    FROM food_items
    WHERE image_url IS NOT NULL AND image_url != ''
    LIMIT 50
""")

image_urls = cursor.fetchall()
failed_urls = 0

for (url,) in image_urls:
    try:
        response = requests.head(url, timeout=5)
        if response.status_code >= 400:
            print(f"  WARNING: Image URL failed: {url} (Status: {response.status_code})")
            failed_urls += 1
    except Exception as e:
        print(f"  WARNING: Image URL error: {url} ({str(e)[:50]})")
        failed_urls += 1

if failed_urls == 0:
    print("Sample image URLs verified successfully!")
else:
    print(f"Found {failed_urls} potentially problematic image URLs in sample.")

print()

# Step 5: Ensure minimum 100 items per restaurant
print("Step 5: Ensuring minimum 100 items per restaurant...")
cursor.execute("""
    SELECT r.restaurant_id, r.name, COUNT(fi.food_id) as item_count
    FROM restaurants r
    LEFT JOIN food_items fi ON r.restaurant_id = fi.restaurant_id
    GROUP BY r.restaurant_id, r.name
    HAVING COUNT(fi.food_id) < 100
    ORDER BY r.restaurant_id
""")

below_100 = cursor.fetchall()

if below_100:
    print(f"Found {len(below_100)} restaurants below 100 items...")
    for restaurant_id, name, count in below_100:
        print(f"  WARNING: {name} (ID: {restaurant_id}) has only {count} items!")
else:
    print("All restaurants have 100+ items!")

print()

cursor.close()
conn.close()

print("=" * 80)
print("CLEANUP COMPLETE")
print("=" * 80)
print("Run audit-restaurants.py for final verification.")
