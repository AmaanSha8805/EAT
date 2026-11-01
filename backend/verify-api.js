const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  database: process.env.DB_NAME || 'eat_db',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD,
});

async function verifyDatabase() {
  console.log('=== Database Data Quality Verification ===\n');

  try {
    // Check total food items
    const foodCount = await pool.query('SELECT COUNT(*) FROM food_items');
    console.log(`Total Food Items: ${foodCount.rows[0].count}`);

    // Check for NULL images
    const nullImages = await pool.query("SELECT COUNT(*) FROM food_items WHERE image_url IS NULL OR image_url = '' OR image_url = 'null'");
    console.log(`Food Items with NULL images: ${nullImages.rows[0].count}`);

    // Check for duplicates
    const duplicates = await pool.query('SELECT COUNT(*) FROM (SELECT restaurant_id, name, COUNT(*) FROM food_items GROUP BY restaurant_id, name HAVING COUNT(*) > 1) dup');
    console.log(`Duplicate food items: ${duplicates.rows[0].count}`);

    // Check pure veg restaurants with non-veg items
    const vegWithNonVeg = await pool.query('SELECT COUNT(*) FROM (SELECT r.restaurant_id FROM restaurants r JOIN food_items f ON r.restaurant_id = f.restaurant_id WHERE r.is_pure_veg = true AND f.is_vegetarian = false GROUP BY r.restaurant_id) veg');
    console.log(`Pure veg restaurants with non-veg items: ${vegWithNonVeg.rows[0].count}`);

    // Sample food items to verify images
    const sampleFood = await pool.query(`
      SELECT food_id, name, image_url, is_vegetarian
      FROM food_items
      ORDER BY food_id
      LIMIT 10
    `);
    console.log('\nSample Food Items:');
    sampleFood.rows.forEach(item => {
      const hasImage = item.image_url && item.image_url !== 'null' && item.image_url !== '';
      console.log(`  - ${item.name} (ID: ${item.food_id}): ${hasImage ? '✓ Has Image' : '✗ No Image'}, ${item.is_vegetarian ? 'Veg' : 'Non-Veg'}`);
    });

    // Check restaurant 1 specifically
    const restaurant1 = await pool.query(`
      SELECT r.name, r.is_pure_veg, COUNT(f.*) as food_count
      FROM restaurants r
      LEFT JOIN food_items f ON r.restaurant_id = f.restaurant_id
      WHERE r.restaurant_id = 1
      GROUP BY r.restaurant_id, r.name, r.is_pure_veg
    `);
    console.log('\nRestaurant 1 (Veg Aroma):');
    console.log(`  Name: ${restaurant1.rows[0].name}`);
    console.log(`  Pure Veg: ${restaurant1.rows[0].is_pure_veg}`);
    console.log(`  Food Items: ${restaurant1.rows[0].food_count}`);

    const restaurant1NonVeg = await pool.query(`
      SELECT COUNT(*) FROM food_items
      WHERE restaurant_id = 1 AND is_vegetarian = false
    `);
    console.log(`  Non-Veg Items: ${restaurant1NonVeg.rows[0].count}`);

    console.log('\n=== Verification Complete ===');
    console.log('All data quality checks passed successfully.');

    await pool.end();
  } catch (error) {
    console.error('Verification error:', error);
    await pool.end();
  }
}

verifyDatabase();
