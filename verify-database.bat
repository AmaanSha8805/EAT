@echo off
set PGPASSWORD=postgres

echo Verifying row counts...
psql -U postgres -h localhost -d eat_db -c "SELECT 'restaurants' as table_name, COUNT(*) as count FROM restaurants;"
psql -U postgres -h localhost -d eat_db -c "SELECT 'categories' as table_name, COUNT(*) as count FROM categories;"
psql -U postgres -h localhost -d eat_db -c "SELECT 'food_items' as table_name, COUNT(*) as count FROM food_items;"

pause
