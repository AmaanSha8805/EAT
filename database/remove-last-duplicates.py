#!/usr/bin/env python3
"""
Remove the last 2 remaining duplicates.
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

print("Removing last 2 duplicate items...")

# Remove duplicate Pav Bhaji from Burger Barn (ID: 40)
cursor.execute("""
    DELETE FROM food_items
    WHERE restaurant_id = 40 AND name = 'Pav Bhaji' AND food_id NOT IN (
        SELECT MIN(food_id) FROM food_items
        WHERE restaurant_id = 40 AND name = 'Pav Bhaji'
    )
""")
print(f"Deleted {cursor.rowcount} duplicate Pav Bhaji from Burger Barn")

# Remove duplicate Pav Bhaji from Continental Kitchen (ID: 43)
cursor.execute("""
    DELETE FROM food_items
    WHERE restaurant_id = 43 AND name = 'Pav Bhaji' AND food_id NOT IN (
        SELECT MIN(food_id) FROM food_items
        WHERE restaurant_id = 43 AND name = 'Pav Bhaji'
    )
""")
print(f"Deleted {cursor.rowcount} duplicate Pav Bhaji from Continental Kitchen")

cursor.close()
conn.close()

print("All duplicates removed!")
print("Run audit-restaurants.py for final verification.")
