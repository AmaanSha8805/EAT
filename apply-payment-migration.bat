@echo off
echo Applying Payment Methods Migration...
echo.

REM Get PostgreSQL password from config.properties
for /f "tokens=2 delims==" %%a in ('findstr "db.password" "src\main\resources\config.properties"') do set PGPASSWORD=%%a

REM Run the migration script
psql -U postgres -d eat_db -f "database\migration_payment_methods.sql"

if %errorlevel% equ 0 (
    echo.
    echo Migration applied successfully!
    echo Payment methods (UPI, Card, Net Banking) are now available.
) else (
    echo.
    echo Migration failed. Please check the error above.
    echo Make sure PostgreSQL is running and the database exists.
)

echo.
pause
