const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: process.env.NODE_ENV === 'production'
    ? { rejectUnauthorized: false }
    : false,
  options: '-c search_path=public'
});

pool.on('connect', (client) => {
  console.log('PostgreSQL connected with public schema');
});

module.exports = pool;
