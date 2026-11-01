#!/usr/bin/env python3
"""
Complete database audit of all EAT restaurants.
"""

import psycopg2
from collections import defaultdict

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
print("EAT RESTAURANT DATABASE AUDIT")
print("=" * 80)
print()

# Get all restaurants
cursor.execute("SELECT restaurant_id, name, is_pure_veg FROM restaurants ORDER BY restaurant_id")
restaurants = cursor.fetchall()

print(f"Total restaurants found: {len(restaurants)}")
print()

# Audit each restaurant
audit_results = []
restaurants_with_fewer_than_100 = []

for restaurant_id, name, is_pure_veg in restaurants:
    print(f"Restaurant ID: {restaurant_id}")
    print(f"Name: {name}")
    print(f"Pure Veg: {is_pure_veg}")
    
    # Get food item count
    cursor.execute("SELECT COUNT(*) FROM food_items WHERE restaurant_id = %s", (restaurant_id,))
    total_count = cursor.fetchone()[0]
    print(f"Total Food Items: {total_count}")
    
    # Get available food item count
    cursor.execute("SELECT COUNT(*) FROM food_items WHERE restaurant_id = %s AND is_available = true", (restaurant_id,))
    available_count = cursor.fetchone()[0]
    print(f"Available Food Items: {available_count}")
    
    # Check for duplicate dishes
    cursor.execute("""
        SELECT name, COUNT(*) as count 
        FROM food_items 
        WHERE restaurant_id = %s 
        GROUP BY name 
        HAVING COUNT(*) > 1
    """, (restaurant_id,))
    duplicates = cursor.fetchall()
    if duplicates:
        print(f"Duplicate dishes: {len(duplicates)}")
        for dup_name, dup_count in duplicates:
            print(f"  - {dup_name}: {dup_count} copies")
    else:
        print(f"Duplicate dishes: None")
    
    # Check for missing image URLs
    cursor.execute("""
        SELECT COUNT(*) 
        FROM food_items 
        WHERE restaurant_id = %s AND (image_url IS NULL OR image_url = '')
    """, (restaurant_id,))
    missing_images = cursor.fetchone()[0]
    print(f"Missing image URLs: {missing_images}")
    
    # Get categories
    cursor.execute("""
        SELECT DISTINCT category 
        FROM food_items 
        WHERE restaurant_id = %s 
        ORDER BY category
    """, (restaurant_id,))
    categories = [row[0] for row in cursor.fetchall()]
    print(f"Categories: {', '.join(categories)}")
    
    # Check vegetarian/non-vegetarian distribution
    cursor.execute("""
        SELECT is_vegetarian, COUNT(*) 
        FROM food_items 
        WHERE restaurant_id = %s 
        GROUP BY is_vegetarian
    """, (restaurant_id,))
    veg_dist = dict(cursor.fetchall())
    print(f"Vegetarian: {veg_dist.get(True, 0)}, Non-Vegetarian: {veg_dist.get(False, 0)}")
    
    # Check if pure veg restaurant has non-veg items
    if is_pure_veg and veg_dist.get(False, 0) > 0:
        print(f"WARNING: Pure veg restaurant has {veg_dist.get(False, 0)} non-vegetarian items!")
    
    print()
    
    # Store results
    audit_results.append({
        'restaurant_id': restaurant_id,
        'name': name,
        'is_pure_veg': is_pure_veg,
        'total_count': total_count,
        'available_count': available_count,
        'duplicates': len(duplicates),
        'missing_images': missing_images,
        'categories': categories,
        'veg_count': veg_dist.get(True, 0),
        'non_veg_count': veg_dist.get(False, 0)
    })
    
    if total_count < 100:
        restaurants_with_fewer_than_100.append(restaurant_id)

print("=" * 80)
print("SUMMARY")
print("=" * 80)
print()
print(f"Total restaurants audited: {len(restaurants)}")
print(f"Restaurants with fewer than 100 items: {len(restaurants_with_fewer_than_100)}")
print()

if restaurants_with_fewer_than_100:
    print("Restaurants needing menu expansion:")
    for rid in restaurants_with_fewer_than_100:
        result = next(r for r in audit_results if r['restaurant_id'] == rid)
        print(f"  - ID {rid}: {result['name']} ({result['total_count']} items)")
    print()
else:
    print("All restaurants have 100+ food items!")
    print()

# Detailed report
print("=" * 80)
print("DETAILED REPORT")
print("=" * 80)
print()
print(f"{'ID':<5} {'Name':<40} {'Total':<8} {'Available':<10} {'Veg':<6} {'Non-Veg':<8} {'Dups':<6} {'No Img':<8}")
print("-" * 100)

for result in audit_results:
    print(f"{result['restaurant_id']:<5} {result['name'][:40]:<40} {result['total_count']:<8} {result['available_count']:<10} {result['veg_count']:<6} {result['non_veg_count']:<8} {result['duplicates']:<6} {result['missing_images']:<8}")

print()

cursor.close()
conn.close()
