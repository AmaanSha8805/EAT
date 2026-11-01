const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  database: process.env.DB_NAME || 'eat_db',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
});

async function getMissingImages() {
  try {
    const result = await pool.query(`
      SELECT food_id, name, restaurant_id, category
      FROM food_items
      WHERE image_url IS NULL OR image_url = '' OR image_url = 'null'
      ORDER BY restaurant_id, food_id
    `);
    
    console.log('Food items needing images:');
    result.rows.forEach(item => {
      console.log(`UPDATE food_items SET image_url = 'URL' WHERE food_id = ${item.food_id};  -- ${item.name} (Restaurant ${item.restaurant_id}, ${item.category})`);
    });
    
    await pool.end();
  } catch (error) {
    console.error('Error:', error);
    await pool.end();
  }
}

getMissingImages();
