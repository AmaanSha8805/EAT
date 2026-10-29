@echo off
set PGPASSWORD=panda

echo Creating database eat_db...
psql -U postgres -h localhost -c "CREATE DATABASE eat_db;" 2>nul

echo Running schema.sql...
psql -U postgres -h localhost -d eat_db -f database\schema.sql

echo Running seed-parbhani.sql...
psql -U postgres -h localhost -d eat_db -f database\seed-parbhani.sql

echo Running seed-parbhani-menus.sql...
psql -U postgres -h localhost -d eat_db -f database\seed-parbhani-menus.sql

echo Verifying row counts...
psql -U postgres -h localhost -d eat_db -c "SELECT 'restaurants' as table_name, COUNT(*) as count FROM restaurants UNION ALL SELECT 'categories', COUNT(*) FROM categories UNION ALL SELECT 'food_items', COUNT(*) FROM food_items;"

echo Database setup complete!
pause
