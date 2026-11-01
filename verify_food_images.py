#!/usr/bin/env python3
"""
EAT Food Image Verification System
Verifies that updated food item images are accessible and appropriate
"""

import psycopg2
import requests
import json
from collections import defaultdict
from urllib.parse import urlparse
import concurrent.futures
import time

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

def check_image_url(url, timeout=5):
    """Check if an image URL is accessible"""
    if not url or url.strip() == '':
        return False, "No URL", 0

    try:
        start_time = time.time()
        response = requests.head(url, timeout=timeout, allow_redirects=True)
        load_time = time.time() - start_time

        if response.status_code == 200:
            content_type = response.headers.get('content-type', '')
            is_image = content_type.startswith('image/')
            return True, f"OK ({response.status_code})", load_time * 1000
        else:
            return False, f"Status: {response.status_code}", load_time * 1000
    except requests.exceptions.Timeout:
        return False, "Timeout", timeout * 1000
    except Exception as e:
        return False, f"Error: {str(e)[:50]}", 0

def verify_images_batch(food_items, batch_size=50):
    """Verify images in batches with concurrent requests"""
    print(f"\nVerifying {len(food_items)} images in batches of {batch_size}...")

    results = {
        'total': len(food_items),
        'accessible': 0,
        'inaccessible': 0,
        'empty': 0,
        'errors': [],
        'duplicate_urls': defaultdict(list),
        'url_stats': defaultdict(lambda: {'count': 0, 'accessible': 0, 'inaccessible': 0})
    }

    for i in range(0, len(food_items), batch_size):
        batch = food_items[i:i + batch_size]
        print(f"Processing batch {i // batch_size + 1}/{(len(food_items) + batch_size - 1) // batch_size} ({len(batch)} items)...")

        with concurrent.futures.ThreadPoolExecutor(max_workers=10) as executor:
            future_to_item = {
                executor.submit(check_image_url, item['image_url']): item
                for item in batch
            }

            for future in concurrent.futures.as_completed(future_to_item):
                item = future_to_item[future]
                try:
                    accessible, status, load_time = future.result()

                    url = item['image_url']
                    results['url_stats'][url]['count'] += 1

                    if accessible:
                        results['accessible'] += 1
                        results['url_stats'][url]['accessible'] += 1
                    else:
                        results['inaccessible'] += 1
                        results['url_stats'][url]['inaccessible'] += 1
                        results['errors'].append({
                            'food_id': item['food_id'],
                            'name': item['name'],
                            'url': url,
                            'status': status
                        })

                    results['duplicate_urls'][url].append(item['name'])

                except Exception as e:
                    results['inaccessible'] += 1
                    results['errors'].append({
                        'food_id': item['food_id'],
                        'name': item['name'],
                        'url': item['image_url'],
                        'status': f"Exception: {str(e)[:50]}"
                    })

        # Small delay between batches
        time.sleep(0.5)

    return results

def analyze_image_quality(results):
    """Analyze the quality of image assignments"""
    duplicate_analysis = {
        'total_unique_urls': len(results['duplicate_urls']),
        'urls_with_duplicates': 0,
        'worst_duplicates': []
    }

    for url, items in results['duplicate_urls'].items():
        if len(items) > 1:
            duplicate_analysis['urls_with_duplicates'] += 1
            if len(duplicate_analysis['worst_duplicates']) < 20:
                duplicate_analysis['worst_duplicates'].append({
                    'url': url,
                    'count': len(items),
                    'items': items[:5]
                })

    return duplicate_analysis

def generate_verification_report(results, duplicate_analysis):
    """Generate comprehensive verification report"""
    report = {
        'summary': {
            'total_items': results['total'],
            'accessible_images': results['accessible'],
            'inaccessible_images': results['inaccessible'],
            'empty_images': results['empty'],
            'accessibility_rate': round((results['accessible'] / results['total']) * 100, 2) if results['total'] > 0 else 0
        },
        'duplicate_analysis': duplicate_analysis,
        'error_samples': results['errors'][:50] if results['errors'] else [],
        'url_stats': dict(list(results['url_stats'].items())[:20])
    }

    return report

def main():
    print("EAT Food Image Verification System")
    print("=" * 50)

    # Connect to database
    conn = connect_to_db()
    print("Connected to database successfully")

    # Get all food items
    food_items = get_all_food_items(conn)
    print(f"Retrieved {len(food_items)} food items")

    # Verify images
    results = verify_images_batch(food_items)

    # Analyze duplicates
    duplicate_analysis = analyze_image_quality(results)

    # Generate report
    report = generate_verification_report(results, duplicate_analysis)

    # Save report
    with open('food_image_verification_report.json', 'w') as f:
        json.dump(report, f, indent=2)

    print("\nReport saved to food_image_verification_report.json")

    # Print summary
    print("\n=== VERIFICATION SUMMARY ===")
    print(f"Total food items: {report['summary']['total_items']}")
    print(f"Accessible images: {report['summary']['accessible_images']}")
    print(f"Inaccessible images: {report['summary']['inaccessible_images']}")
    print(f"Accessibility rate: {report['summary']['accessibility_rate']}%")
    print(f"Unique image URLs: {report['duplicate_analysis']['total_unique_urls']}")
    print(f"URLs with duplicates: {report['duplicate_analysis']['urls_with_duplicates']}")

    if report['error_samples']:
        print(f"\n=== SAMPLE ERRORS ({len(report['error_samples'])} shown) ===")
        for error in report['error_samples'][:10]:
            print(f"- {error['name']} (ID: {error['food_id']}): {error['status']}")

    if duplicate_analysis['worst_duplicates']:
        print(f"\n=== TOP DUPLICATE URLs ===")
        for dup in sorted(duplicate_analysis['worst_duplicates'], key=lambda x: x['count'], reverse=True)[:10]:
            print(f"\nURL: {dup['url']}")
            print(f"Used by {dup['count']} items:")
            for item in dup['items']:
                print(f"  - {item}")

    conn.close()
    print("\nVerification complete!")

if __name__ == '__main__':
    main()
