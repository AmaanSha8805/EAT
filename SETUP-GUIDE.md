# Quick Setup Guide for EAT Project

## What I've Already Done For You
✅ Added Maven Wrapper (no manual Maven install needed)
✅ Updated project to use Java 17
✅ Maven Wrapper is working (version 3.9.6)

## What You Need to Install Manually (2 things, ~10 minutes)

### Step 1: Install MySQL Community Server (5 minutes)

1. Download MySQL Installer: https://dev.mysql.com/downloads/installer/
   - Choose "mysql-installer-community-8.0.x.x.msi" (Windows)
   
2. Run the installer:
   - Choose "Developer Default" setup type
   - When prompted for password, **remember your root password** (e.g., `root123`)
   - Keep clicking Next/Execute until complete

3. Verify MySQL is running:
   - Open Command Prompt
   - Type: `mysql --version`
   - Should show MySQL 8.0.x

### Step 2: Install Apache Tomcat (5 minutes)

1. Download Tomcat 9.0.x: https://tomcat.apache.org/download-90.cgi
   - Under "Core", download "zip" (64-bit Windows)
   - Example: `apache-tomcat-9.0.xx-windows-x64.zip`

2. Extract the zip file:
   - Right-click → Extract All
   - Extract to: `C:\apache-tomcat-9.0.xx`
   - Rename folder to: `C:\apache-tomcat` (optional but simpler)

3. Set CATALINA_HOME environment variable:
   - Press Windows key, type "env", select "Edit the system environment variables"
   - Click "Environment Variables"
   - Under "System variables", click "New"
   - Variable name: `CATALINA_HOME`
   - Variable value: `C:\apache-tomcat` (or your Tomcat path)
   - Click OK

## Step 3: Setup Database (2 minutes)

1. Open Command Prompt as Administrator

2. Login to MySQL:
   ```bash
   mysql -u root -p
   ```
   Enter your MySQL root password when prompted

3. Run the schema and seed data:
   ```sql
   source D:/MY PROJECTS/EAT/database/schema.sql
   source D:/MY PROJECTS/EAT/database/seed-data.sql
   ```

4. Verify:
   ```sql
   USE eat_db;
   SHOW TABLES;
   ```
   Should show 11 tables

5. Exit MySQL:
   ```sql
   exit
   ```

## Step 4: Configure Database Password (1 minute)

1. Open `D:\MY PROJECTS\EAT\src\main\resources\config.properties`

2. Change line 4:
   ```properties
   db.password=root123
   ```
   Replace `root123` with your actual MySQL root password

## Step 5: Build the Application (2 minutes)

1. Open Command Prompt in project folder:
   ```bash
   cd "D:\MY PROJECTS\EAT"
   ```

2. Build with Maven Wrapper:
   ```bash
   .\mvnw.cmd clean package
   ```

3. This will create `target\eat.war` (takes 1-2 minutes on first run)

## Step 6: Deploy and Run (2 minutes)

1. Copy WAR file to Tomcat:
   ```bash
   copy target\eat.war C:\apache-tomcat\webapps\
   ```

2. Start Tomcat:
   - Open `C:\apache-tomcat\bin`
   - Double-click `startup.bat`
   - A command window will open (keep it open)

3. Access the application:
   - Open browser: http://localhost:8080/eat/home

## Demo Accounts

**Customer:**
- Email: `customer@eat.com`
- Password: `password123`

**Admin:**
- Email: `admin@eat.com`
- Password: `admin123`

## Troubleshooting

**MySQL not found:**
- Make sure MySQL is installed and in PATH
- Try: `C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe -u root -p`

**Tomcat port 8080 in use:**
- Stop other apps using port 8080
- Or edit `C:\apache-tomcat\conf\server.xml` and change port 8080 to 8081

**Database connection error:**
- Check password in config.properties matches your MySQL password
- Verify MySQL service is running (Windows Services → MySQL80)

**Build fails:**
- Make sure Java 17 is installed: `java -version`
- Delete `target` folder and try again: `rmdir /s target`

## Stopping the Application

To stop Tomcat:
- Open `C:\apache-tomcat\bin`
- Double-click `shutdown.bat`

## Next Steps

After setup, you can:
1. Browse restaurants as a guest
2. Login with demo accounts
3. Place orders
4. Use admin panel to manage restaurants, orders, and reviews
