#!/usr/bin/env python3
"""
EAT Food Image Analysis and Correction Script
Analyzes current food item images and generates correction recommendations
"""

import psycopg2
import requests
from collections import defaultdict
import json
import sys
from urllib.parse import urlparse

# Database configuration
DB_CONFIG = {
    'host': 'localhost',
    'port': 5432,
    'database': 'eat_db',
    'user': 'postgres',
    'password': 'panda'
}

def connect_to_db():
    """Connect to PostgreSQL database"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        return conn
    except Exception as e:
        print(f"Error connecting to database: {e}")
        print("Please check your database credentials in DB_CONFIG")
        sys.exit(1)

def get_all_food_items(conn):
    """Retrieve all food items with their current images"""
    query = """
    SELECT food_id, restaurant_id, name, description, category, image_url, is_vegetarian
    FROM food_items
    ORDER BY restaurant_id, category, name
    """
    cursor = conn.cursor()
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]
    rows = cursor.fetchall()
    items = [dict(zip(columns, row)) for row in rows]
    cursor.close()
    return items

def check_image_url(url):
    """Check if an image URL is accessible"""
    if not url or url == '':
        return False, "No URL"
    try:
        response = requests.head(url, timeout=5, allow_redirects=True)
        return response.status_code == 200, f"Status: {response.status_code}"
    except Exception as e:
        return False, f"Error: {str(e)}"

def analyze_images(food_items):
    """Analyze current images for issues"""
    print(f"\n=== Analyzing {len(food_items)} food items ===\n")

    # Track duplicate URLs
    url_counts = defaultdict(list)
    broken_urls = []
    empty_urls = []

    for item in food_items:
        url = item['image_url']
        if not url or url.strip() == '':
            empty_urls.append(item)
        else:
            url_counts[url].append(item)

    # Find duplicates
    duplicates = {url: items for url, items in url_counts.items() if len(items) > 1}

    print(f"Empty/missing URLs: {len(empty_urls)}")
    print(f"Duplicate URLs: {len(duplicates)} (affecting {sum(len(items) for items in duplicates.values())} items)")
    print(f"Unique URLs: {len(url_counts)}")

    return {
        'total_items': len(food_items),
        'empty_urls': empty_urls,
        'duplicates': duplicates,
        'url_counts': url_counts
    }

def categorize_food_items(food_items):
    """Categorize food items by dish type for image mapping"""
    categories = defaultdict(list)

    for item in food_items:
        name = item['name'].lower()
        category = item['category'] or 'Uncategorized'

        # Determine dish type based on name
        dish_type = 'other'

        if 'pizza' in name:
            dish_type = 'pizza'
        elif 'burger' in name:
            dish_type = 'burger'
        elif 'biryani' in name:
            dish_type = 'biryani'
        elif 'dosa' in name:
            dish_type = 'dosa'
        elif 'idli' in name:
            dish_type = 'idli'
        elif 'curry' in name or 'masala' in name:
            dish_type = 'curry'
        elif 'rice' in name and 'biryani' not in name:
            dish_type = 'rice'
        elif 'noodles' in name:
            dish_type = 'noodles'
        elif 'coffee' in name:
            dish_type = 'coffee'
        elif 'tea' in name:
            dish_type = 'tea'
        elif 'cake' in name:
            dish_type = 'cake'
        elif 'ice cream' in name:
            dish_type = 'ice_cream'
        elif 'salad' in name:
            dish_type = 'salad'
        elif 'soup' in name:
            dish_type = 'soup'
        elif 'sandwich' in name:
            dish_type = 'sandwich'
        elif 'chicken' in name:
            dish_type = 'chicken'
        elif 'paneer' in name:
            dish_type = 'paneer'
        elif 'fries' in name:
            dish_type = 'fries'
        elif 'drink' in name or 'juice' in name or 'smoothie' in name:
            dish_type = 'beverage'
        elif 'sweet' in name or 'dessert' in name or 'gulab' in name or 'rasgulla' in name:
            dish_type = 'indian_sweet'

        categories[dish_type].append(item)

    return categories

def generate_image_report(food_items, analysis):
    """Generate a comprehensive report of image issues"""
    report = {
        'summary': {
            'total_items': analysis['total_items'],
            'empty_urls': len(analysis['empty_urls']),
            'duplicate_groups': len(analysis['duplicates']),
            'items_with_duplicates': sum(len(items) for items in analysis['duplicates'].values())
        },
        'empty_urls': [{'food_id': i['food_id'], 'name': i['name'], 'restaurant_id': i['restaurant_id']} for i in analysis['empty_urls']],
        'duplicates': [{'url': url, 'count': len(items), 'items': [{'food_id': i['food_id'], 'name': i['name']} for i in items[:5]]} for url, items in analysis['duplicates'].items()],
        'categories': categorize_food_items(food_items)
    }

    return report

def main():
    print("EAT Food Image Analysis Tool")
    print("=" * 50)

    # Connect to database
    conn = connect_to_db()
    print("Connected to database successfully")

    # Get all food items
    food_items = get_all_food_items(conn)
    print(f"Retrieved {len(food_items)} food items")

    # Analyze images
    analysis = analyze_images(food_items)

    # Generate report
    report = generate_image_report(food_items, analysis)

    # Save report
    with open('food_image_analysis.json', 'w') as f:
        json.dump(report, f, indent=2)

    print("\nReport saved to food_image_analysis.json")

    # Print summary
    print("\n=== SUMMARY ===")
    print(f"Total food items: {report['summary']['total_items']}")
    print(f"Items with empty/missing images: {report['summary']['empty_urls']}")
    print(f"Duplicate image URL groups: {report['summary']['duplicate_groups']}")
    print(f"Items affected by duplicates: {report['summary']['items_with_duplicates']}")

    # Print top duplicates
    if report['duplicates']:
        print("\n=== TOP DUPLICATE URLs ===")
        for dup in sorted(report['duplicates'], key=lambda x: x['count'], reverse=True)[:10]:
            print(f"\nURL: {dup['url']}")
            print(f"Used by {dup['count']} items:")
            for item in dup['items']:
                print(f"  - {item['name']} (ID: {item['food_id']})")

    # Print category breakdown
    print("\n=== FOOD ITEM CATEGORIES ===")
    for cat, items in sorted(report['categories'].items(), key=lambda x: len(x[1]), reverse=True):
        print(f"{cat}: {len(items)} items")

    conn.close()
    print("\nAnalysis complete!")

if __name__ == '__main__':
    main()
