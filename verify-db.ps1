$env:PGPASSWORD = "panda"
$env:PGCLIENTENCODING = "UTF8"

Write-Host "Verifying restaurant count..."
psql -U postgres -h localhost -d eat_db -c "SELECT COUNT(*) FROM restaurants;"

Write-Host "Verifying category count..."
psql -U postgres -h localhost -d eat_db -c "SELECT COUNT(*) FROM categories;"

Write-Host "Verifying food item count..."
psql -U postgres -h localhost -d eat_db -c "SELECT COUNT(*) FROM food_items;"

Write-Host "Done."
