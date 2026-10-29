# EAT Project Migration Plan
## Java/JSP/Servlet/Tomcat → React + Vite + Node.js + Express

**Date:** October 29, 2026

---

## Executive Summary

This document outlines the complete migration strategy for converting the EAT (Explore Amazing Taste) food delivery platform from a traditional Java/JSP/Servlet/Tomcat architecture to a modern React + Vite + Node.js + Express stack, while preserving the existing PostgreSQL database and UI design.

---

## Current Architecture Analysis

### Existing Stack
- **Frontend:** JSP pages with custom CSS (1850+ lines)
- **Backend:** Java Servlets with JDBC
- **Database:** PostgreSQL (12 tables, 60+ food items, 10 restaurants)
- **Server:** Apache Tomcat 9
- **Build Tool:** Maven
- **Authentication:** Session-based with BCrypt

### Key Components Identified

#### Frontend Pages (17 JSP files)
1. `home.jsp` - Homepage with restaurants, categories, best for, food items
2. `restaurant.jsp` - Restaurant detail page
3. `cart.jsp` - Shopping cart
4. `checkout.jsp` - Checkout form
5. `login.jsp` - Login/registration
6. `orders.jsp` - User order history
7. `order-details.jsp` - Order details
8. `order-success.jsp` - Order confirmation
9. `profile.jsp` - User profile
10. `favorites.jsp` - Favorite restaurants/food
11. `category.jsp` - Category page
12. `bestfor.jsp` - Best for category page
13. `collection.jsp` - Special collections
14. `header.jsp` - Navigation header
15. `footer.jsp` - Footer
16. `error-404.jsp` - 404 error page
17. `error-500.jsp` - 500 error page

#### Backend Servlets (18 servlets)
1. `HomeServlet` - Homepage logic
2. `RestaurantServlet` - Restaurant details
3. `CartServlet` - Cart management
4. `CheckoutServlet` - Order placement
5. `AuthServlet` - Login/registration
6. `OrderServlet` - Order history
7. `OrderDetailsServlet` - Order details
8. `OrderSuccessServlet` - Order confirmation
9. `ProfileServlet` - User profile
10. `FavoriteServlet` - Favorites management
11. `CategoryServlet` - Category listings
12. `BestForServlet` - Best for listings
13. `CollectionServlet` - Special collections
14. `ReviewServlet` - Reviews
15. Admin servlets (5): Dashboard, Restaurant, Food, Order, Review management

#### Database Schema (12 tables)
1. `users` - Customer and admin accounts
2. `restaurants` - Restaurant information
3. `categories` - Food categories
4. `best_for_categories` - Best for categories
5. `food_items` - Food items
6. `orders` - Order records
7. `order_items` - Order line items
8. `reviews` - Restaurant reviews
9. `favorites` - User favorites
10. `user_addresses` - User addresses
11. `coupons` - Discount coupons
12. `delivery_persons` - Delivery persons

#### Features to Preserve
- Restaurant browsing and search
- Food item listings with filters
- Shopping cart (session-based)
- Guest checkout support
- User authentication (login/register)
- Order placement and tracking
- Favorite restaurants/food
- Category and "Best For" browsing
- Special collections
- Admin dashboard
- Pure veg filtering
- Student-friendly, family special, couple special flags

---

## Target Architecture (Based on SAFAR Reference)

### New Stack
- **Frontend:** React 19 + Vite + React Router
- **Backend:** Node.js + Express
- **Database:** PostgreSQL (existing, no changes)
- **Authentication:** JWT tokens (replacing sessions)
- **Styling:** Custom CSS (migrated from existing style.css)
- **State Management:** React Context API
- **API Client:** Axios

### Project Structure
```
EAT/
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── layout/
│   │   │   │   ├── Header.jsx
│   │   │   │   ├── Footer.jsx
│   │   │   │   └── Navbar.jsx
│   │   │   ├── restaurants/
│   │   │   │   ├── RestaurantCard.jsx
│   │   │   │   ├── RestaurantList.jsx
│   │   │   │   └── RestaurantDetail.jsx
│   │   │   ├── food/
│   │   │   │   ├── FoodCard.jsx
│   │   │   │   └── FoodList.jsx
│   │   │   ├── cart/
│   │   │   │   ├── CartItem.jsx
│   │   │   │   └── Cart.jsx
│   │   │   └── ui/
│   │   │       ├── Button.jsx
│   │   │       ├── Input.jsx
│   │   │       ├── Modal.jsx
│   │   │       └── Badge.jsx
│   │   ├── pages/
│   │   │   ├── Home.jsx
│   │   │   ├── Restaurant.jsx
│   │   │   ├── Cart.jsx
│   │   │   ├── Checkout.jsx
│   │   │   ├── Login.jsx
│   │   │   ├── Register.jsx
│   │   │   ├── Orders.jsx
│   │   │   ├── OrderDetails.jsx
│   │   │   ├── Profile.jsx
│   │   │   ├── Favorites.jsx
│   │   │   ├── Category.jsx
│   │   │   ├── BestFor.jsx
│   │   │   └── Collection.jsx
│   │   ├── context/
│   │   │   ├── AuthContext.jsx
│   │   │   └── CartContext.jsx
│   │   ├── services/
│   │   │   ├── api.js
│   │   │   ├── authService.js
│   │   │   ├── restaurantService.js
│   │   │   ├── foodService.js
│   │   │   ├── cartService.js
│   │   │   └── orderService.js
│   │   ├── utils/
│   │   │   └── formatters.js
│   │   ├── styles/
│   │   │   └── style.css (migrated from existing)
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── public/
│   │   └── images/ (migrated from existing)
│   ├── package.json
│   └── vite.config.js
├── backend/
│   ├── config/
│   │   └── db.js
│   ├── controllers/
│   │   ├── auth.controller.js
│   │   ├── restaurant.controller.js
│   │   ├── food.controller.js
│   │   ├── cart.controller.js
│   │   ├── order.controller.js
│   │   ├── user.controller.js
│   │   └── admin.controller.js
│   ├── routes/
│   │   ├── auth.routes.js
│   │   ├── restaurant.routes.js
│   │   ├── food.routes.js
│   │   ├── cart.routes.js
│   │   ├── order.routes.js
│   │   ├── user.routes.js
│   │   └── admin.routes.js
│   ├── middleware/
│   │   ├── auth.middleware.js
│   │   └── admin.middleware.js
│   ├── utils/
│   │   └── helpers.js
│   ├── .env.example
│   ├── package.json
│   └── server.js
├── database/
│   ├── schema.sql (existing, preserved)
│   └── seed-data.sql (existing, preserved)
├── .gitignore
└── README.md
```

---

## Migration Strategy

### Phase 1: Infrastructure Setup
1. Initialize frontend with Vite + React
2. Initialize backend with Express
3. Set up PostgreSQL connection using `pg` package
4. Configure environment variables
5. Set up CORS between frontend and backend

### Phase 2: Backend API Development
1. Implement database connection and query helpers
2. Create authentication endpoints (login, register, logout)
3. Implement JWT middleware
4. Create restaurant endpoints (list, detail, search, filter)
5. Create food item endpoints (list by restaurant, trending)
6. Create category and best for endpoints
7. Implement cart endpoints (session-based in frontend, persisted in localStorage)
8. Implement order endpoints (create, list by user, detail)
9. Implement favorite endpoints
10. Implement admin endpoints

### Phase 3: Frontend Component Migration
1. Migrate CSS from style.css (preserve exact styling)
2. Create layout components (Header, Footer, Navbar)
3. Create reusable UI components (Button, Input, Badge, Modal)
4. Implement authentication context and login/register pages
5. Migrate home page with all sections
6. Migrate restaurant detail page
7. Migrate cart and checkout pages
8. Migrate order history and order details pages
9. Migrate favorites page
10. Migrate category and best for pages
11. Migrate special collections page
12. Migrate profile page

### Phase 4: Integration and Testing
1. Connect frontend to backend APIs
2. Test authentication flow
3. Test restaurant browsing and search
4. Test cart operations (add, update, remove, clear)
5. Test checkout and order placement
6. Test order history and details
7. Test favorites functionality
8. Test all navigation routes
9. Verify UI consistency with original
10. Test responsive design

### Phase 5: Cleanup
1. Remove obsolete Java files (src/main/java)
2. Remove JSP files (src/main/webapp/WEB-INF/jsp)
3. Remove Maven configuration (pom.xml, mvnw.cmd, .mvn)
4. Remove Tomcat (apache-tomcat-9.0.96, apache-tomcat.zip)
5. Remove Java-specific configuration (web.xml, config.properties)
6. Keep database folder with schema and seed data
7. Keep existing images (migrate to frontend/public/images)
8. Keep existing CSS (migrate to frontend/src/styles)

---

## Database Strategy

### Preservation
- **NO CHANGES** to database schema
- **NO DELETION** of existing data
- Reuse existing `eat_db` PostgreSQL database
- Keep all tables, relationships, and indexes

### Connection
- Use `pg` npm package for PostgreSQL
- Connection string from environment variables
- Parameterized queries to prevent SQL injection
- Connection pooling for performance

### Migration Note
The existing EAT database is already in PostgreSQL (migrated from MySQL on Oct 27, 2026). No schema changes are required. We only need to:
1. Replace Java JDBC with Node.js `pg` package
2. Update connection string format
3. Translate Java DAO patterns to Node.js controllers

---

## Authentication Strategy

### Current: Session-based
- HttpSession with user object
- BCrypt password hashing
- Authentication filter on protected routes

### New: JWT-based
- JWT tokens stored in localStorage
- Same BCrypt password hashing (use `bcryptjs` npm package)
- JWT middleware for protected routes
- Token refresh mechanism (optional)

### Compatibility
- Keep existing password hashes (BCrypt)
- Reuse same user table structure
- Preserve user roles (customer, admin)

---

## UI Preservation Strategy

### Exact CSS Migration
- Copy entire `style.css` (1850+ lines) to frontend
- Preserve all CSS variables, colors, spacing
- Keep all component styles unchanged
- Maintain responsive breakpoints

### Component Mapping
| JSP/Java | React Component |
|----------|-----------------|
| header.jsp | Header.jsx |
| footer.jsp | Footer.jsx |
| home.jsp sections | Home.jsx with sub-components |
| restaurant.jsp | RestaurantDetail.jsx |
| cart.jsp | Cart.jsx |
| checkout.jsp | Checkout.jsx |
| login.jsp | Login.jsx, Register.jsx |
| orders.jsp | Orders.jsx |
| order-details.jsp | OrderDetails.jsx |
| profile.jsp | Profile.jsx |
| favorites.jsp | Favorites.jsx |
| category.jsp | Category.jsx |
| bestfor.jsp | BestFor.jsx |
| collection.jsp | Collection.jsx |

### Image Migration
- Migrate all images from `src/main/webapp/images/` to `frontend/public/images/`
- Keep same file names and structure
- Ensure image paths are updated in React components

---

## API Endpoints Design

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/logout` - Logout user
- `GET /api/auth/me` - Get current user

### Restaurants
- `GET /api/restaurants` - List all restaurants (with filters)
- `GET /api/restaurants/:id` - Get restaurant details
- `GET /api/restaurants/trending` - Get trending restaurants
- `GET /api/restaurants/pure-veg` - Get pure veg restaurants

### Food Items
- `GET /api/food/restaurant/:id` - Get food items by restaurant
- `GET /api/food/trending` - Get trending food items
- `GET /api/food/:id` - Get food item details

### Categories
- `GET /api/categories` - List all categories
- `GET /api/categories/:id` - Get category details
- `GET /api/categories/:id/restaurants` - Get restaurants by category

### Best For
- `GET /api/best-for` - List all best for categories
- `GET /api/best-for/:id` - Get best for details
- `GET /api/best-for/:id/restaurants` - Get restaurants by best for

### Collections
- `GET /api/collections/:type` - Get special collection

### Cart (Session-based in frontend)
- `POST /api/cart/add` - Add item to cart
- `PUT /api/cart/update` - Update cart item quantity
- `DELETE /api/cart/remove` - Remove item from cart
- `DELETE /api/cart/clear` - Clear cart

### Orders
- `POST /api/orders` - Create new order
- `GET /api/orders` - Get user orders
- `GET /api/orders/:id` - Get order details

### Favorites
- `GET /api/favorites` - Get user favorites
- `POST /api/favorites/restaurant/:id` - Add restaurant to favorites
- `DELETE /api/favorites/restaurant/:id` - Remove restaurant from favorites
- `POST /api/favorites/food/:id` - Add food to favorites
- `DELETE /api/favorites/food/:id` - Remove food from favorites

### User
- `GET /api/user/profile` - Get user profile
- `PUT /api/user/profile` - Update user profile

### Admin
- `GET /api/admin/dashboard` - Get dashboard stats
- `GET /api/admin/restaurants` - Get all restaurants (admin)
- `POST /api/admin/restaurants` - Create restaurant
- `PUT /api/admin/restaurants/:id` - Update restaurant
- `DELETE /api/admin/restaurants/:id` - Delete restaurant
- `GET /api/admin/orders` - Get all orders (admin)
- `PUT /api/admin/orders/:id/status` - Update order status

---

## Environment Variables

### Backend (.env)
```env
PORT=5000
NODE_ENV=development

# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=eat_db
DB_USER=postgres
DB_PASSWORD=your_postgresql_password

# JWT
JWT_SECRET=your_jwt_secret_key_here
JWT_EXPIRE=7d

# CORS
FRONTEND_URL=http://localhost:5173
```

### Frontend (.env)
```env
VITE_API_URL=http://localhost:5000/api
```

---

## Testing Strategy

### Backend Testing
1. Test database connection
2. Test all API endpoints with Postman/curl
3. Test authentication flow
4. Test CRUD operations
5. Test error handling

### Frontend Testing
1. Test all routes navigate correctly
2. Test UI components render properly
3. Test forms submit correctly
4. Test cart operations
5. Test checkout flow
6. Test responsive design on mobile
7. Verify UI matches original design

### Integration Testing
1. Test complete user journey: browse → add to cart → checkout → view order
2. Test authentication flow: register → login → access protected routes
3. Test admin functionality
4. Test database persistence

---

## Risk Mitigation

### Data Loss Prevention
- **NEVER** drop or truncate existing tables
- **NEVER** run destructive migrations automatically
- Keep database schema and seed data as-is
- Use database backups before any changes

### UI Consistency
- Keep exact CSS from original
- Use same images and assets
- Test side-by-side with original if possible
- Verify colors, spacing, typography match

### Feature Parity
- Implement all existing features before removing old code
- Test each feature works identically
- Preserve business logic (e.g., restaurant cart restriction)
- Keep admin functionality

---

## Rollback Plan

If migration fails:
1. Keep original Java code in `src/` folder until migration is verified
2. Keep Tomcat and Maven until new app is tested
3. Database remains unchanged (no schema modifications)
4. Can redeploy original WAR to Tomcat if needed

---

## Success Criteria

### Functional Requirements
- [ ] All pages from original JSP exist in React
- [ ] All features work (browsing, cart, checkout, orders, auth)
- [ ] Database integration works correctly
- [ ] Admin dashboard functional
- [ ] No data loss in PostgreSQL

### UI Requirements
- [ ] Visual design matches original
- [ ] CSS styles preserved exactly
- [ ] Responsive design works
- [ ] All images load correctly

### Technical Requirements
- [ ] Frontend runs on Vite dev server
- [ ] Backend runs on Express
- [ ] PostgreSQL connection works
- [ ] No Java/JSP dependencies remain
- [ ] Code is clean and maintainable

---

## Estimated Timeline

- Phase 1 (Infrastructure): 2-3 hours
- Phase 2 (Backend API): 4-5 hours
- Phase 3 (Frontend Migration): 6-8 hours
- Phase 4 (Integration & Testing): 3-4 hours
- Phase 5 (Cleanup): 1-2 hours

**Total: 16-22 hours**

---

## Next Steps

1. ✅ Complete analysis of existing architecture
2. ✅ Create migration plan (this document)
3. ⏭️ Begin Phase 1: Infrastructure Setup
4. ⏭️ Initialize frontend with Vite + React
5. ⏭️ Initialize backend with Express
6. ⏭️ Set up PostgreSQL connection
7. ⏭️ Continue with Phase 2-5

---

## Notes

- The existing EAT database password is exposed in `config.properties` (`db.password=panda`). This should be rotated and moved to environment variables in the new architecture.
- The SAFAR reference uses MySQL2, but EAT uses PostgreSQL. We'll use the `pg` package instead.
- SAFAR uses Tailwind CSS, but EAT has custom CSS. We'll preserve the custom CSS to maintain the existing UI design.
- Session-based cart in the original will be replaced with localStorage-based cart in the frontend for simplicity, with order persistence in PostgreSQL.
