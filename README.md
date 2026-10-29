# EAT - Explore Amazing Taste

A hyperlocal food discovery and delivery web application built with Java, JSP, and MySQL.

## Features

### Customer Features
- **Home Page**: Search, browse restaurants, view trending items
- **Restaurant Discovery**: Filter by cuisine, category, and "Best For" categories
- **Restaurant Details**: View menus, prices, ratings, and reviews
- **Quick Order**: Add items to cart with one click
- **Shopping Cart**: Manage quantities, remove items, view totals
- **Checkout**: Enter delivery details, choose payment method
- **Order Management**: View order history, track status, cancel orders
- **Reviews**: Submit detailed ratings (Food, Ambience, Service, Value)
- **User Profile**: Update personal information and address

### Admin Features
- **Dashboard**: Overview of users, restaurants, orders, and pending reviews
- **Restaurant Management**: Create, edit, delete restaurants
- **Menu Management**: Add, edit, delete food items
- **Order Management**: View all orders, update status, manage payments
- **Review Moderation**: Approve or reject customer reviews
- **User Management**: View customer accounts
- **Delivery Management**: Manage delivery personnel and assignments

## Technology Stack

- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Dynamic Pages**: JSP (JavaServer Pages)
- **Backend**: Java Servlets
- **Database**: MySQL 8.0+
- **Database Connectivity**: JDBC
- **Server**: Apache Tomcat 9.0+
- **Build Tool**: Maven
- **Password Hashing**: BCrypt

## Prerequisites

1. **Java Development Kit (JDK) 11 or higher**
   - Download from: https://www.oracle.com/java/technologies/downloads/
   - Set JAVA_HOME environment variable

2. **Apache Maven 3.6+**
   - Download from: https://maven.apache.org/download.cgi
   - Add to PATH

3. **Apache Tomcat 9.0+**
   - Download from: https://tomcat.apache.org/download-90.cgi
   - Extract to a local directory

4. **MySQL 8.0+**
   - Download from: https://dev.mysql.com/downloads/mysql/
   - Install and start MySQL service

5. **IDE (Optional but Recommended)**
   - IntelliJ IDEA, Eclipse, or NetBeans

## Database Setup

1. **Create the database**
   ```bash
   mysql -u root -p
   ```
   ```sql
   source database/schema.sql
   ```

2. **Load seed data (for demo)**
   ```sql
   source database/seed-data.sql
   ```

3. **Verify setup**
   ```sql
   USE eat_db;
   SHOW TABLES;
   SELECT COUNT(*) FROM restaurants;
   ```

## Configuration

1. **Update database credentials**
   
   Edit `src/main/resources/config.properties`:
   ```properties
   db.url=jdbc:mysql://localhost:3306/eat_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
   db.username=root
   db.password=YOUR_MYSQL_PASSWORD
   ```

2. **Demo Accounts**
   
   The seed data includes these demo accounts:
   
   **Customer Accounts:**
   - Email: `customer@eat.com`
   - Password: `password123`
   
   - Email: `student@eat.com`
   - Password: `password123`
   
   **Admin Account:**
   - Email: `admin@eat.com`
   - Password: `admin123`

## Building the Application

1. **Navigate to project directory**
   ```bash
   cd "d:/MY PROJECTS/EAT"
   ```

2. **Clean and build with Maven**
   ```bash
   mvn clean package
   ```

   This will create `target/eat.war`

## Deployment

### Option 1: Manual Deployment to Tomcat

1. **Stop Tomcat** (if running)

2. **Copy WAR file to Tomcat webapps**
   ```bash
   copy target\eat.war C:\path\to\tomcat\webapps\
   ```

3. **Start Tomcat**
   - Windows: Run `startup.bat` in Tomcat bin directory
   - Linux/Mac: Run `startup.sh` in Tomcat bin directory

4. **Access the application**
   ```
   http://localhost:8080/eat/home
   ```

### Option 2: Using Maven Tomcat Plugin

1. **Add Tomcat to Maven settings** (optional)
   - Configure in `~/.m2/settings.xml`

2. **Deploy with Maven**
   ```bash
   mvn tomcat7:deploy
   ```

### Option 3: IDE Deployment (Intellielli IDEA)

1. **Configure Tomcat Server**
   - File → Settings → Build, Execution, Deployment → Application Servers
   - Add Tomcat installation

2. **Create Run Configuration**
   - Run → Edit Configurations
   - Add Tomcat Server → Local
   - Deploy artifacts: `eat:war exploded`

3. **Run the application**
   - Click the Run button

## Running the Application

Once deployed, access the application at:
```
http://localhost:8080/eat/home
```

### First Steps

1. **Browse Restaurants**: Explore the homepage
2. **Login**: Use demo customer account
3. **Add to Cart**: Add items from restaurant menus
4. **Checkout**: Complete an order
5. **Admin Access**: Login with admin account to manage content

## Project Structure

```
EAT/
├── database/
│   ├── schema.sql           # Database schema
│   └── seed-data.sql        # Sample data
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/eat/
│   │   │       ├── dao/          # Data Access Objects
│   │   │       ├── filter/       # Servlet filters
│   │   │       ├── model/        # Entity classes
│   │   │       ├── servlet/      # Customer servlets
│   │   │       │   └── admin/   # Admin servlets
│   │   │       ├── service/      # Business logic
│   │   │       └── util/         # Utilities
│   │   ├── resources/
│   │   │   └── config.properties # Configuration
│   │   └── webapp/
│   │       ├── css/
│   │       │   └── style.css     # Stylesheet
│   │       ├── js/
│   │       │   └── main.js       # JavaScript
│   │       └── WEB-INF/
│   │           ├── jsp/          # JSP pages
│   │           │   ├── admin/    # Admin pages
│   │           │   ├── header.jsp
│   │           │   ├── footer.jsp
│   │           │   └── ...
│   │           └── web.xml       # Web configuration
├── pom.xml                      # Maven configuration
└── README.md                    # This file
```

## Feature Checklist

### Customer Features
- [x] Home page with search and restaurant listings
- [x] "What's Trending Today?" section
- [x] Student Friendly, Family Special, Couple Special sections
- [x] Best For categories (Study & Work, Friends, Couples, etc.)
- [x] Restaurant discovery with filters
- [x] Restaurant details with menus and prices
- [x] Quick Order functionality
- [x] Shopping cart with quantity management
- [x] Customer registration and login
- [x] Checkout with delivery details
- [x] Cash on Delivery and simulated online payment
- [x] Order confirmation and history
- [x] Order status tracking
- [x] Order cancellation (early stage only)
- [x] Restaurant reviews with detailed ratings
- [x] User profile management

### Admin Features
- [x] Dashboard with summary cards
- [x] Restaurant CRUD operations
- [x] Food item management
- [x] Category management
- [x] Order viewing and status updates
- [x] Payment status management
- [x] Review moderation
- [x] Customer account viewing
- [x] Delivery personnel management
- [x] Delivery assignment

### Technical Features
- [x] MVC architecture
- [x] JDBC with prepared statements
- [x] Session-based authentication
- [x] BCrypt password hashing
- [x] Role-based access control
- [x] Input validation
- [x] Error handling
- [x] Responsive design
- [x] Premium UI with orange/cream/white palette

## Known Limitations

1. **No Real Payment Integration**: Payment is simulated for demonstration only
2. **No Live GPS Tracking**: Delivery tracking is manual status-based
3. **Single Restaurant Cart**: Users can only order from one restaurant at a time
4. **No Email Notifications**: Order confirmations are not sent via email
5. **No SMS Alerts**: Delivery updates are not sent via SMS
6. **Basic Image Handling**: Images are stored as URLs, not uploaded files
7. **No Real-time Updates**: Page refresh required for status changes

## Testing Checklist

### Manual Testing Steps

1. **Database Connection**
   - [ ] Verify MySQL is running
   - [ ] Test database connection with configured credentials
   - [ ] Verify schema tables are created
   - [ ] Verify seed data is loaded

2. **Customer Workflow**
   - [ ] Browse home page
   - [ ] Search for restaurants
   - [ ] Filter by category
   - [ ] Filter by "Best For"
   - [ ] View restaurant details
   - [ ] Register new account
   - [ ] Login with customer account
   - [ ] Add items to cart
   - [ ] Update cart quantities
   - [ ] Remove items from cart
   - [ ] Clear cart
   - [ ] Complete checkout with COD
   - [ ] Complete checkout with online payment
   - [ ] View order confirmation
   - [ ] View order history
   - [ ] View order details
   - [ ] Cancel an order (early stage)
   - [ ] Submit a restaurant review
   - [ ] Update profile information
   - [ ] Logout

3. **Admin Workflow**
   - [ ] Login with admin account
   - [ ] View dashboard statistics
   - [ ] Add new restaurant
   - [ ] Edit existing restaurant
   - [ ] Delete restaurant
   - [ ] Add food items to restaurant
   - [ ] Edit food items
   - [ ] Delete food items
   - [ ] View all orders
   - [ ] Filter orders by status
   - [ ] Update order status
   - [ ] Update payment status
   - [ ] View pending reviews
   - [ ] Approve a review
   - [ ] Reject a review
   - [ ] View customer accounts
   - [ ] Add delivery person
   - [ ] Assign delivery person to order
   - [ ] Update delivery status

4. **Security Testing**
   - [ ] Verify unauthenticated users cannot access cart
   - [ ] Verify unauthenticated users cannot access checkout
   - [ ] Verify unauthenticated users cannot access profile
   - [ ] Verify customers cannot access admin pages
   - [ ] Verify password hashing works correctly
   - [ ] Verify session timeout works

5. **UI/UX Testing**
   - [ ] Test on desktop browser
   - [ ] Test on tablet viewport
   - [ ] Test on mobile viewport
   - [ ] Verify responsive layout
   - [ ] Check color contrast
   - [ ] Verify form validation messages
   - [ ] Check error pages (404, 500)

## Troubleshooting

### Common Issues

**1. Database Connection Error**
- Verify MySQL is running
- Check credentials in config.properties
- Ensure database `eat_db` exists
- Check MySQL port (default: 3306)

**2. Port 8080 Already in Use**
- Stop other applications using port 8080
- Or change Tomcat port in `server.xml`

**3. Class Not Found Errors**
- Run `mvn clean package` to rebuild
- Check all dependencies in pom.xml
- Verify Tomcat lib directory has required JARs

**4. JSP Not Rendering**
- Ensure JSTL library is included
- Check web.xml configuration
- Verify JSP files are in correct location

**5. Session Issues**
- Check browser cookie settings
- Verify session timeout in web.xml
- Clear browser cache and cookies

## Support

For issues or questions:
1. Check the troubleshooting section
2. Review the database schema
3. Verify configuration files
4. Check Tomcat logs in `logs/` directory

## License

This is a college project for educational purposes.

## Credits

Developed as a college-level food delivery platform demonstration.
