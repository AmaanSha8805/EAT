# Apply Payment Methods Migration
# This script applies the database migration to add support for UPI, Card, and Net Banking payments

Write-Host "Applying Payment Methods Migration..." -ForegroundColor Cyan
Write-Host ""

# Get PostgreSQL password from config.properties
$configPath = "src\main\resources\config.properties"
if (Test-Path $configPath) {
    $password = Select-String -Path $configPath -Pattern "db.password" | ForEach-Object { $_.Line.Split('=')[1].Trim() }
    $env:PGPASSWORD = $password
} else {
    Write-Host "Error: config.properties not found at $configPath" -ForegroundColor Red
    exit 1
}

# Run the migration script
$scriptPath = "database\migration_payment_methods.sql"
if (Test-Path $scriptPath) {
    psql -U postgres -d eat_db -f $scriptPath

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "Migration applied successfully!" -ForegroundColor Green
        Write-Host "Payment methods (UPI, Card, Net Banking) are now available." -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "Migration failed. Please check the error above." -ForegroundColor Red
        Write-Host "Make sure PostgreSQL is running and the database exists." -ForegroundColor Red
    }
} else {
    Write-Host "Error: Migration script not found at $scriptPath" -ForegroundColor Red
    exit 1
}

Write-Host ""
