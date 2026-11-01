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
    const cleanLine = line.split('--')[0].trim();
    return cleanLine.replace(';', '');
  })
  .filter(line => line.length > 0);

console.log(`Found ${statements.length} update statements`);

const BATCH_SIZE = 100;

async function applyBatch(batchStart, batchEnd) {
  const client = await pool.connect();
  let successCount = 0;
  let errorCount = 0;

  try {
    await client.query('BEGIN');

    for (let i = batchStart; i < batchEnd && i < statements.length; i++) {
      const stmt = statements[i];
      try {
        await client.query(stmt);
        successCount++;
      } catch (err) {
        errorCount++;
        console.error(`Error on statement ${i + 1}:`, err.message);
      }
    }

    await client.query('COMMIT');
    return { successCount, errorCount };
  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Batch transaction failed:', err);
    return { successCount, errorCount: batchEnd - batchStart };
  } finally {
    client.release();
  }
}

async function applyUpdates() {
  let totalSuccess = 0;
  let totalError = 0;

  for (let i = 0; i < statements.length; i += BATCH_SIZE) {
    const batchStart = i;
    const batchEnd = Math.min(i + BATCH_SIZE, statements.length);

    console.log(`\nApplying batch ${Math.floor(i / BATCH_SIZE) + 1}: statements ${batchStart + 1}-${batchEnd}`);
    const { successCount, errorCount } = await applyBatch(batchStart, batchEnd);

    totalSuccess += successCount;
    totalError += errorCount;

    console.log(`Batch complete: ${successCount} succeeded, ${errorCount} failed`);
    console.log(`Total progress: ${totalSuccess}/${statements.length} updates applied`);

    // Small delay between batches
    await new Promise(resolve => setTimeout(resolve, 100));
  }

  console.log('\n=== FINAL SUMMARY ===');
  console.log(`Total statements: ${statements.length}`);
  console.log(`Successful updates: ${totalSuccess}`);
  console.log(`Failed updates: ${totalError}`);
  console.log(`Success rate: ${((totalSuccess / statements.length) * 100).toFixed(2)}%`);

  await pool.end();
}

applyUpdates().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
