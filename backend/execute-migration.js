const { Pool } = require('pg');
const fs = require('fs');
require('dotenv').config();

const pool = new Pool({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  database: process.env.DB_NAME || 'eat_db',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
});

async function executeMigration() {
  console.log('=== Executing Food Data Quality Migration ===\n');

  try {
    const client = await pool.connect();
    
    try {
      await client.query('BEGIN');
      console.log('Transaction started\n');
      
      // 1. Remove duplicate food item
      console.log('1. Removing duplicate Dal Makhani (ID 57)...');
      await client.query('DELETE FROM food_items WHERE food_id = 57');
      console.log('✓ Duplicate removed\n');
      
      // 2. Remove non-veg items from pure veg restaurants
      console.log('2. Removing non-veg items from pure veg restaurants...');
      await client.query('DELETE FROM food_items WHERE food_id = 55');  // Butter Chicken
      await client.query('DELETE FROM food_items WHERE food_id = 59');  // Chicken Biryani
      await client.query('DELETE FROM food_items WHERE food_id = 67');  // Chicken Manchurian
      await client.query('DELETE FROM food_items WHERE food_id = 69');  // Chicken Fried Rice
      await client.query('DELETE FROM food_items WHERE food_id = 72');  // Chilli Chicken
      await client.query('DELETE FROM food_items WHERE food_id = 109'); // Grilled Chicken
      await client.query('DELETE FROM food_items WHERE food_id = 110'); // Fish & Chips
      console.log('✓ Non-veg items removed\n');
      
      // 3. Update image URLs
      console.log('3. Updating image URLs for food items...');
      
      const imageUpdates = [
        // Restaurant 2
        [61, 'https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop'],
        [62, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop'],
        [63, 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop'],
        [64, 'https://images.unsplash.com/photo-1626132647523-66d4e8c2f8e0?w=400&h=300&fit=crop'],
        [65, 'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop'],
        [66, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop'],
        // Restaurant 3
        [68, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&h=300&fit=crop'],
        [70, 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=400&h=300&fit=crop'],
        [71, 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=400&h=300&fit=crop'],
        // Restaurant 4
        [73, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400&h=300&fit=crop'],
        [74, 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400&h=300&fit=crop'],
        [75, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&h=300&fit=crop'],
        [76, 'https://images.unsplash.com/photo-1619535860434-ba1d8fa12536?w=400&h=300&fit=crop'],
        [77, 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400&h=300&fit=crop'],
        [78, 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=400&h=300&fit=crop'],
        // Restaurant 5
        [79, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=400&h=300&fit=crop'],
        [80, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400&h=300&fit=crop'],
        [81, 'https://images.unsplash.com/photo-1594631252845-29fc4cc8cde9?w=400&h=300&fit=crop'],
        [82, 'https://images.unsplash.com/photo-1623065422902-30a2d299bbe4?w=400&h=300&fit=crop'],
        [83, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400&h=300&fit=crop'],
        [84, 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=400&h=300&fit=crop'],
        // Restaurant 6
        [85, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400&h=300&fit=crop'],
        [86, 'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=400&h=300&fit=crop'],
        [87, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=400&h=300&fit=crop'],
        [88, 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=400&h=300&fit=crop'],
        [89, 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=400&h=300&fit=crop'],
        [90, 'https://images.unsplash.com/photo-1666190094762-3a8f6f6a6f6f?w=400&h=300&fit=crop'],
        // Restaurant 7
        [91, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=300&fit=crop'],
        [92, 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=400&h=300&fit=crop'],
        [93, 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=400&h=300&fit=crop'],
        [94, 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400&h=300&fit=crop'],
        [95, 'https://images.unsplash.com/photo-1639024471283-03518883512d?w=400&h=300&fit=crop'],
        [96, 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=400&h=300&fit=crop'],
        // Restaurant 8
        [97, 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400&h=300&fit=crop'],
        [98, 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400&h=300&fit=crop'],
        [99, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&h=300&fit=crop'],
        [100, 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400&h=300&fit=crop'],
        [101, 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=400&h=300&fit=crop'],
        [102, 'https://images.unsplash.com/photo-1511690656952-34342d7c3740?w=400&h=300&fit=crop'],
        // Restaurant 9
        [103, 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=400&h=300&fit=crop'],
        [104, 'https://images.unsplash.com/photo-1608198093002-ad4e005f1bca?w=400&h=300&fit=crop'],
        [105, 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=300&fit=crop'],
        [106, 'https://images.unsplash.com/photo-1607958996333-41d1208014f3?w=400&h=300&fit=crop'],
        [107, 'https://images.unsplash.com/photo-1585445490387-2ea9968f8bc1?w=400&h=300&fit=crop'],
        [108, 'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=400&h=300&fit=crop'],
        // Restaurant 10
        [111, 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=400&h=300&fit=crop'],
        [112, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400&h=300&fit=crop'],
        [113, 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400&h=300&fit=crop'],
        [114, 'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=400&h=300&fit=crop'],
      ];
      
      for (const [foodId, imageUrl] of imageUpdates) {
        await client.query('UPDATE food_items SET image_url = $1 WHERE food_id = $2', [imageUrl, foodId]);
      }
      
      console.log(`✓ Updated ${imageUpdates.length} image URLs\n`);
      
      await client.query('COMMIT');
      console.log('Transaction committed successfully\n');
      
    } catch (err) {
      await client.query('ROLLBACK');
      console.error('Error during transaction, rolled back:', err.message);
      throw err;
    } finally {
      client.release();
    }
    
    // Run verification queries
    console.log('=== Verification ===');
    
    const [foodCount, nullImages, duplicates, vegWithNonVeg] = await Promise.all([
      pool.query('SELECT COUNT(*) FROM food_items'),
      pool.query("SELECT COUNT(*) FROM food_items WHERE image_url IS NULL OR image_url = '' OR image_url = 'null'"),
      pool.query('SELECT COUNT(*) FROM (SELECT restaurant_id, name, COUNT(*) FROM food_items GROUP BY restaurant_id, name HAVING COUNT(*) > 1) dup'),
      pool.query('SELECT COUNT(*) FROM (SELECT r.restaurant_id FROM restaurants r JOIN food_items f ON r.restaurant_id = f.restaurant_id WHERE r.is_pure_veg = true AND f.is_vegetarian = false GROUP BY r.restaurant_id) veg')
    ]);
    
    console.log(`Total Food Items: ${foodCount.rows[0].count}`);
    console.log(`Food Items with NULL images: ${nullImages.rows[0].count}`);
    console.log(`Duplicate food items: ${duplicates.rows[0].count}`);
    console.log(`Pure veg restaurants with non-veg items: ${vegWithNonVeg.rows[0].count}`);
    
    await pool.end();
  } catch (error) {
    console.error('Migration error:', error);
    await pool.end();
  }
}

executeMigration();
