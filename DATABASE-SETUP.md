# Database Setup Instructions

## Overview
The EAT application requires PostgreSQL to be set up before the homepage sections will display data. The database schema and seed data are provided in the `database/` directory.

## Prerequisites
- PostgreSQL installed and running (tested with PostgreSQL 12+)
- PostgreSQL user access (default: postgres)

## Setup Steps

### 1. Update Database Configuration
Edit `src/main/resources/config.properties` and update the PostgreSQL password:
```properties
db.url=jdbc:postgresql://localhost:5432/eat_db
db.username=postgres
db.password=YOUR_ACTUAL_POSTGRESQL_PASSWORD
```

### 2. Create PostgreSQL Database
Connect to PostgreSQL and create the database:
```bash
psql -U postgres
```

Then run:
```sql
CREATE DATABASE eat_db;
\q
```

Or use a single command:
```bash
psql -U postgres -c "CREATE DATABASE eat_db;"
```

### 3. Import Schema
Run the schema script to create all tables and custom types:
```bash
psql -U postgres -d eat_db -f "D:\MY PROJECTS\EAT\database\schema.sql"
```

Or from psql command line:
```sql
\c eat_db
\i D:\MY PROJECTS\EAT\database\schema.sql
```

### 4. Load Seed Data
Run the seed data script to populate the database with sample data:
```bash
psql -U postgres -d eat_db -f "D:\MY PROJECTS\EAT\database\seed-data.sql
```

Or from psql command line:
```sql
\c eat_db
\i D:\MY PROJECTS\EAT\database\seed-data.sql
```

## Available Data After Setup
Once configured, the database will contain:
- **10 Restaurants** with varied cuisines (North Indian, South Indian, Chinese, Italian, etc.)
- **10 Categories** (North Indian, South Indian, Chinese, Italian, Beverages, Desserts, etc.)
- **8 Best For Categories** (Study & Work, Friends, Couples, Family, Budget Food, etc.)
- **60+ Food Items** across all restaurants with prices, descriptions, and trending flags
- **3 Sample Users** (2 customers, 1 admin)
- **Sample Orders and Reviews**

## Verification
After setup, verify the connection by checking:
1. All sections on the homepage display data
2. Trending items show trending food items
3. Categories display all food categories
4. Best For shows curated collections
5. All Restaurants list displays all 10 restaurants
6. Test login with sample accounts:
   - Customer: `customer@eat.com` / `password123`
   - Student: `student@eat.com` / `password123`
   - Admin: `admin@eat.com` / `admin123`

## Troubleshooting
- If sections remain empty, check the Tomcat logs for SQL connection errors
- Verify PostgreSQL is running on port 5432
- Ensure the password in config.properties matches your PostgreSQL password
- Check that the database `eat_db` exists: `psql -U postgres -c "\l"`
- Verify tables were created: `psql -U postgres -d eat_db -c "\dt"`
- Check for connection issues: `psql -U postgres -d eat_db`
