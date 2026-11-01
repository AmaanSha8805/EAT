const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  database: process.env.DB_NAME || 'eat_db',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
});

async function auditDatabase() {
  console.log('=== EAT Database Audit ===\n');

  try {
    // 1. Total counts
    const [restCount, foodCount, catCount, reviewCount] = await Promise.all([
      pool.query('SELECT COUNT(*) FROM restaurants'),
      pool.query('SELECT COUNT(*) FROM food_items'),
      pool.query('SELECT COUNT(*) FROM categories'),
      pool.query('SELECT COUNT(*) FROM reviews'),
    ]);

    console.log('=== Current Database State ===');
    console.log(`Restaurants: ${restCount.rows[0].count}`);
    console.log(`Food Items: ${foodCount.rows[0].count}`);
    console.log(`Categories: ${catCount.rows[0].count}`);
    console.log(`Reviews: ${reviewCount.rows[0].count}\n`);

    // 2. Food items with NULL or empty image URLs
    const nullImages = await pool.query(`
      SELECT food_id, name, restaurant_id, image_url
      FROM food_items
      WHERE image_url IS NULL OR image_url = '' OR image_url = '/placeholder-food.jpg'
      ORDER BY restaurant_id
    `);
    console.log(`=== Food Items with Missing/Invalid Images ===`);
    console.log(`Count: ${nullImages.rows.length}`);
    if (nullImages.rows.length > 0) {
      console.log('Sample items:');
      nullImages.rows.slice(0, 10).forEach(item => {
        console.log(`  - ID ${item.food_id}: ${item.name} (Restaurant ${item.restaurant_id}) - "${item.image_url}"`);
      });
    }
    console.log('');

    // 3. Duplicate food items within same restaurant
    const duplicates = await pool.query(`
      SELECT restaurant_id, name, COUNT(*) as count, array_agg(food_id) as ids
      FROM food_items
      GROUP BY restaurant_id, name
      HAVING COUNT(*) > 1
      ORDER BY restaurant_id, count DESC
    `);
    console.log(`=== Duplicate Food Items (Same Restaurant) ===`);
    console.log(`Count: ${duplicates.rows.length}`);
    if (duplicates.rows.length > 0) {
      duplicates.rows.forEach(dup => {
        console.log(`  - Restaurant ${dup.restaurant_id}: "${dup.name}" appears ${dup.count} times (IDs: ${dup.ids.join(', ')})`);
      });
    }
    console.log('');

    // 4. Vegetarian restaurants with non-veg items
    const vegRestaurantsWithNonVeg = await pool.query(`
      SELECT r.restaurant_id, r.name as restaurant_name, f.food_id, f.name as food_name, f.is_vegetarian
      FROM restaurants r
      JOIN food_items f ON r.restaurant_id = f.restaurant_id
      WHERE r.is_pure_veg = true AND f.is_vegetarian = false
      ORDER BY r.restaurant_id, f.food_id
    `);
    console.log(`=== Vegetarian Restaurants with Non-Veg Items ===`);
    console.log(`Count: ${vegRestaurantsWithNonVeg.rows.length}`);
    if (vegRestaurantsWithNonVeg.rows.length > 0) {
      vegRestaurantsWithNonVeg.rows.slice(0, 20).forEach(item => {
        console.log(`  - Restaurant ${item.restaurant_id} (${item.restaurant_name}): ${item.food_name} (ID: ${item.food_id})`);
      });
    }
    console.log('');

    // 5. Category encoding issues
    const categoryEncoding = await pool.query(`
      SELECT category_id, name
      FROM categories
      WHERE name LIKE '%Ã%' OR name LIKE '%©%' OR name LIKE '%®%'
    `);
    console.log(`=== Categories with Encoding Issues ===`);
    console.log(`Count: ${categoryEncoding.rows.length}`);
    if (categoryEncoding.rows.length > 0) {
      categoryEncoding.rows.forEach(cat => {
        console.log(`  - ID ${cat.category_id}: "${cat.name}"`);
      });
    }
    console.log('');

    // 6. Sample food items for review
    const sampleFood = await pool.query(`
      SELECT f.food_id, f.name, f.restaurant_id, r.name as restaurant_name, f.is_vegetarian, f.image_url, f.category
      FROM food_items f
      JOIN restaurants r ON f.restaurant_id = r.restaurant_id
      ORDER BY f.restaurant_id
      LIMIT 20
    `);
    console.log(`=== Sample Food Items ===`);
    sampleFood.rows.forEach(item => {
      const vegStatus = item.is_vegetarian ? 'Veg' : 'Non-Veg';
      const imageStatus = item.image_url && item.image_url !== '/placeholder-food.jpg' && item.image_url !== 'null' ? 'Has Image' : 'No Image';
      console.log(`  - ${item.name} (${item.restaurant_name}) - ${vegStatus} - ${imageStatus} - Cat: ${item.category || 'None'}`);
    });
    console.log('');

    // 7. Restaurants with pure_veg flag
    const pureVegRestaurants = await pool.query(`
      SELECT restaurant_id, name, is_pure_veg
      FROM restaurants
      WHERE is_pure_veg = true
      ORDER BY restaurant_id
    `);
    console.log(`=== Pure Vegetarian Restaurants ===`);
    console.log(`Count: ${pureVegRestaurants.rows.length}`);
    pureVegRestaurants.rows.forEach(r => {
      console.log(`  - ID ${r.restaurant_id}: ${r.name}`);
    });
    console.log('');

  } catch (error) {
    console.error('Audit error:', error);
  } finally {
    await pool.end();
  }
}

auditDatabase();
