const { Pool } = require('pg');
require('dotenv').config();
const fs = require('fs');

const pool = new Pool({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  database: process.env.DB_NAME || 'eat_db',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD,
});

// Read the SQL file
const sqlFile = fs.readFileSync('./database/image-correction-updates.sql', 'utf8');
const statements = sqlFile
  .split('\n')
  .filter(line => line.trim() && !line.startsWith('--'))
  .map(line => {
    // Remove comments at the end of lines
    const cleanLine = line.split('--')[0].trim();
    return cleanLine.replace(';', '');
  })
  .filter(line => line.length > 0);

console.log(`Found ${statements.length} update statements`);

async function applyUpdates() {
  const client = await pool.connect();
  let successCount = 0;
  let errorCount = 0;

  try {
    await client.query('BEGIN');

    for (let i = 0; i < statements.length; i++) {
      const stmt = statements[i];
      try {
        await client.query(stmt);
        successCount++;

        if ((i + 1) % 100 === 0) {
          console.log(`Progress: ${i + 1}/${statements.length} updates applied`);
        }
      } catch (err) {
        errorCount++;
        console.error(`Error on statement ${i + 1}:`, err.message);
      }
    }

    await client.query('COMMIT');
    console.log('\n=== UPDATE SUMMARY ===');
    console.log(`Total statements: ${statements.length}`);
    console.log(`Successful updates: ${successCount}`);
    console.log(`Failed updates: ${errorCount}`);
  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Transaction failed:', err);
  } finally {
    client.release();
    await pool.end();
  }
}

applyUpdates();
