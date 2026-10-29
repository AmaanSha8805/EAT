@echo off
set PGPASSWORD=panda

psql -U postgres -h localhost -d eat_db -c "SELECT COUNT(*) FROM restaurants;" > db_counts.txt
psql -U postgres -h localhost -d eat_db -c "SELECT COUNT(*) FROM categories;" >> db_counts.txt
psql -U postgres -h localhost -d eat_db -c "SELECT COUNT(*) FROM food_items;" >> db_counts.txt

type db_counts.txt
pause
