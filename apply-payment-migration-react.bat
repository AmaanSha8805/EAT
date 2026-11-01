@echo off
echo Applying Payment Methods Migration for React Stack...
echo.

REM Get PostgreSQL password from .env
for /f "tokens=2 delims==" %%a in ('findstr "DB_PASSWORD" .env') do set PGPASSWORD=%%a

REM Run the migration script
psql -U postgres -d eat_db -f "database\migration_payment_methods_react.sql"

if %errorlevel% equ 0 (
    echo.
    echo Migration applied successfully!
    echo Payment methods (UPI, Card, Net Banking) are now available for React stack.
) else (
    echo.
    echo Migration failed. Please check the error above.
    echo Make sure PostgreSQL is running and the database exists.
)

echo.
pause
