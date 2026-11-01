#!/usr/bin/env python3
"""
EAT Food Image Audit (Database-Only)
Audits food item images in the database without HTTP requests
"""

import psycopg2
import json
from collections import defaultdict

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
        sys.exit(1)

def get_all_food_items(conn):
    """Retrieve all food items with their images"""
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

def audit_images(food_items):
    """Audit images in the database"""
    print(f"\nAuditing {len(food_items)} food items...\n")

    results = {
        'total_items': len(food_items),
        'empty_urls': [],
        'duplicate_urls': defaultdict(list),
        'url_counts': defaultdict(int),
        'category_analysis': defaultdict(lambda: {'count': 0, 'unique_urls': set()}),
        'restaurant_analysis': defaultdict(lambda: {'count': 0, 'unique_urls': set()})
    }

    for item in food_items:
        url = item['image_url']

        # Check for empty URLs
        if not url or url.strip() == '':
            results['empty_urls'].append(item)
        else:
            results['url_counts'][url] += 1
            results['duplicate_urls'][url].append(item)

        # Category analysis
        category = item['category'] or 'Uncategorized'
        results['category_analysis'][category]['count'] += 1
        if url:
            results['category_analysis'][category]['unique_urls'].add(url)

        # Restaurant analysis
        restaurant_id = item['restaurant_id']
        results['restaurant_analysis'][restaurant_id]['count'] += 1
        if url:
            results['restaurant_analysis'][restaurant_id]['unique_urls'].add(url)

    # Calculate duplicate statistics
    duplicates = {url: items for url, items in results['duplicate_urls'].items() if len(items) > 1}

    results['duplicate_stats'] = {
        'total_unique_urls': len(results['url_counts']),
        'urls_with_duplicates': len(duplicates),
        'items_with_duplicates': sum(len(items) for items in duplicates.values()),
        'duplicate_ratio': round((sum(len(items) for items in duplicates.values()) / len(food_items)) * 100, 2) if food_items > 0 else 0
    }

    return results

def generate_audit_report(results):
    """Generate comprehensive audit report"""
    # Convert sets to lists for JSON serialization
    for cat in results['category_analysis']:
        results['category_analysis'][cat]['unique_urls'] = list(results['category_analysis'][cat]['unique_urls'])
        results['category_analysis'][cat]['unique_url_count'] = len(results['category_analysis'][cat]['unique_urls'])

    for rest in results['restaurant_analysis']:
        results['restaurant_analysis'][rest]['unique_urls'] = list(results['restaurant_analysis'][rest]['unique_urls'])
        results['restaurant_analysis'][rest]['unique_url_count'] = len(results['restaurant_analysis'][rest]['unique_urls'])

    # Get top duplicates
    duplicate_items = list(results['duplicate_urls'].items())
    duplicate_items.sort(key=lambda x: len(x[1]), reverse=True)

    report = {
        'summary': {
            'total_items': results['total_items'],
            'empty_urls': len(results['empty_urls']),
            'total_unique_urls': results['duplicate_stats']['total_unique_urls'],
            'urls_with_duplicates': results['duplicate_stats']['urls_with_duplicates'],
            'items_with_duplicates': results['duplicate_stats']['items_with_duplicates'],
            'duplicate_ratio': results['duplicate_stats']['duplicate_ratio']
        },
        'empty_url_items': [{'food_id': i['food_id'], 'name': i['name'], 'restaurant_id': i['restaurant_id']} for i in results['empty_urls']],
        'top_duplicates': [
            {
                'url': url,
                'count': len(items),
                'items': [{'food_id': i['food_id'], 'name': i['name']} for i in items[:10]]
            }
            for url, items in duplicate_items[:30]
        ],
        'category_breakdown': dict(results['category_analysis']),
        'restaurant_breakdown': dict(results['restaurant_analysis'])
    }

    return report

def main():
    print("EAT Food Image Audit System")
    print("=" * 50)

    # Connect to database
    conn = connect_to_db()
    print("Connected to database successfully")

    # Get all food items
    food_items = get_all_food_items(conn)
    print(f"Retrieved {len(food_items)} food items")

    # Audit images
    results = audit_images(food_items)

    # Generate report
    report = generate_audit_report(results)

    # Save report
    with open('food_image_audit_report.json', 'w') as f:
        json.dump(report, f, indent=2)

    print("\nReport saved to food_image_audit_report.json")

    # Print summary
    print("\n=== AUDIT SUMMARY ===")
    print(f"Total food items: {report['summary']['total_items']}")
    print(f"Items with empty/missing images: {report['summary']['empty_urls']}")
    print(f"Unique image URLs: {report['summary']['total_unique_urls']}")
    print(f"URLs with duplicates: {report['summary']['urls_with_duplicates']}")
    print(f"Items affected by duplicates: {report['summary']['items_with_duplicates']}")
    print(f"Duplicate ratio: {report['summary']['duplicate_ratio']}%")

    if report['empty_url_items']:
        print(f"\n=== ITEMS WITH EMPTY IMAGES ===")
        for item in report['empty_url_items'][:10]:
            print(f"- {item['name']} (ID: {item['food_id']}, Restaurant: {item['restaurant_id']})")

    if report['top_duplicates']:
        print(f"\n=== TOP DUPLICATE URLs ===")
        for dup in report['top_duplicates'][:10]:
            print(f"\nURL: {dup['url']}")
            print(f"Used by {dup['count']} items:")
            for item in dup['items']:
                print(f"  - {item['name']} (ID: {item['food_id']})")

    print(f"\n=== CATEGORY BREAKDOWN (Top 10) ===")
    sorted_categories = sorted(
        report['category_breakdown'].items(),
        key=lambda x: x[1]['count'],
        reverse=True
    )[:10]
    for cat, data in sorted_categories:
        print(f"{cat}: {data['count']} items, {data['unique_url_count']} unique URLs")

    conn.close()
    print("\nAudit complete!")

if __name__ == '__main__':
    main()
