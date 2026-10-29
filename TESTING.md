# EAT - Testing Documentation

This document provides comprehensive testing guidelines and checklists for the EAT application.

## Pre-Deployment Checklist

### Environment Setup
- [ ] JDK 11+ installed and JAVA_HOME configured
- [ ] Maven 3.6+ installed and in PATH
- [ ] Apache Tomcat 9.0+ downloaded and configured
- [ ] MySQL 8.0+ installed and running
- [ ] Database `eat_db` created
- [ ] Schema executed (database/schema.sql)
- [ ] Seed data loaded (database/seed-data.sql)
- [ ] Database credentials updated in config.properties
- [ ] Project builds successfully (`mvn clean package`)

### Configuration Verification
- [ ] Database connection string is correct
- [ ] Database username and password are set
- [ ] Tomcat port is available (default 8080)
- [ ] Web.xml filters are configured
- [ ] Session timeout is set appropriately
- [ ] Character encoding filter is active

## Functional Testing

### Customer Features

#### 1. Home Page
- [ ] Page loads without errors
- [ ] Hero section displays correctly
- [ ] Search box is functional
- [ ] Trending food items display
- [ ] Special collections (Student, Family, Couple) show
- [ ] Category icons are visible
- [ ] Best For categories display
- [ ] All restaurants list loads
- [ ] Restaurant cards show images, names, ratings
- [ ] Restaurant cards are clickable
- [ ] Responsive layout works on mobile

#### 2. Search and Filter
- [ ] Search by restaurant name works
- [ ] Search by cuisine type works
- [ ] Category filter displays correct restaurants
- [ ] Best For filter displays correct restaurants
- [ ] Clear filters returns to full list
- [ ] Empty search results show appropriate message

#### 3. Restaurant Details
- [ ] Restaurant page loads from home click
- [ ] Restaurant image displays
- [ ] Restaurant information is complete
- [ ] Menu items load correctly
- [ ] Food items show prices and descriptions
- [ ] Vegetarian badges display correctly
- [ ] Preparation times show
- [ ] "Add to Cart" button appears for logged-in users
- [ ] "Login to Order" shows for guests
- [ ] Reviews section loads
- [ ] Review form appears for logged-in users
- [ ] Existing reviews display with ratings

#### 4. Authentication
- [ ] Registration form validates required fields
- [ ] Registration with duplicate email fails gracefully
- [ ] Successful registration redirects to login
- [ ] Login with correct credentials works
- [ ] Login with incorrect credentials shows error
- [ ] Session is created after login
- [ ] Logout destroys session
- [ ] Passwords are hashed (not plain text)

#### 5. Shopping Cart
- [ ] Cart page accessible only when logged in
- [ ] Items can be added to cart
- [ ] Cart shows item images, names, prices
- [ ] Quantity can be increased
- [ ] Quantity can be decreased
- [ ] Quantity of 1 cannot be decreased
- [ ] Items can be removed
- [ ] Cart can be cleared
- [ ] Subtotal calculates correctly
- [ ] Delivery fee is added
- [ ] Total is accurate
- [ ] Cannot add items from different restaurants
- [ ] Error message shows for restaurant conflict

#### 6. Checkout
- [ ] Checkout page accessible only with items in cart
- [ ] Delivery address is required
- [ ] Delivery phone is required
- [ ] Special instructions are optional
- [ ] Payment method selection works
- [ ] Cash on Delivery option available
- [ ] Online payment option available (simulated)
- [ ] Order summary displays correctly
- [ ] Place Order button submits successfully
- [ ] Cart is cleared after order
- [ ] Redirects to order success page

#### 7. Order Management
- [ ] Order success page shows order details
- [ ] Order ID is generated
- [ ] Restaurant name displays
- [ ] Order status shows as "Placed"
- [ ] Total amount is correct
- [ ] Payment method displays
- [ ] Delivery address shows
- [ ] Orders list page loads
- [ ] All user orders display
- [ ] Order details page loads
- [ ] Order items show with quantities
- [ ] Historical prices are preserved
- [ ] Order can be cancelled in early stage
- [ ] Cancellation fails after preparation starts
- [ ] Order status updates display correctly

#### 8. Reviews
- [ ] Review form validates all rating fields
- [ ] Review comment is required
- [ ] Overall rating calculates correctly
- [ ] Cannot submit duplicate review for same restaurant
- [ ] Review submission succeeds
- [ ] Pending reviews don't show publicly
- [ ] Approved reviews display on restaurant page
- [ ] Individual ratings (Food, Ambience, Service, Value) show
- [ ] Overall rating displays
- [ ] Review shows date and user name

#### 9. User Profile
- [ ] Profile page loads
- [ ] Current information displays
- [ ] Name can be updated
- [ ] Phone can be updated
- [ ] Address can be updated
- [ ] Email cannot be changed
- [ ] Updates save successfully
- [ ] Success message shows on update
- [ ] Member since date displays
- [ ] Account type displays
- [ ] Quick links work correctly

### Admin Features

#### 10. Admin Dashboard
- [ ] Dashboard accessible only to admin users
- [ ] Total users count displays
- [ ] Total restaurants count displays
- [ ] Total orders count displays
- [ ] Pending reviews count displays
- [ ] Quick action cards work
- [ ] Links navigate to correct pages

#### 11. Restaurant Management
- [ ] Restaurant list loads
- [ ] All restaurants display in table
- [ ] Restaurant status shows (Active/Inactive)
- [ ] Add restaurant button works
- [ ] Restaurant form loads
- [ ] All required fields validate
- [ ] Restaurant creates successfully
- [ ] Edit button loads existing data
- [ ] Restaurant updates successfully
- [ ] Delete confirmation shows
- [ ] Restaurant deletes successfully
- [ ] Menu link navigates to food items

#### 12. Food Item Management
- [ ] Food items list loads for restaurant
- [ ] Restaurant name displays
- [ ] All food items show in table
- [ ] Vegetarian status displays
- [ ] Availability status displays
- [ ] Trending status displays
- [ ] Add food item button works
- [ ] Food item form loads
- [ ] Restaurant ID is pre-filled
- [ ] Food item creates successfully
- [ ] Edit loads existing data
- [ ] Food item updates successfully
- [ ] Delete confirmation shows
- [ ] Food item deletes successfully
- [ ] Back to restaurants link works

#### 13. Order Management
- [ ] Orders list loads
- [ ] All orders display in table
- [ ] Customer name shows
- [ ] Restaurant name shows
- [ ] Order total displays
- [ ] Order status shows with badge
- [ ] Payment method displays
- [ ] Order date displays
- [ ] Filter by status works
- [ ] Filter shows correct orders
- [ ] Clear filter returns all orders
- [ ] View details button works
- [ ] Order details page loads
- [ ] Order items display
- [ ] Customer information shows
- [ ] Delivery details show
- [ ] Status update form works
- [ ] Status changes successfully
- [ ] Payment status update works
- [ ] Payment status changes successfully

#### 14. Review Moderation
- [ ] Reviews list loads
- [ ] All reviews display
- [ ] Pending filter works
- [ ] Pending reviews show warning badge
- [ ] Approved reviews show success badge
- [ ] User name displays
- [ ] Restaurant name displays
- [ ] All rating categories show
- [ ] Overall rating displays
- [ ] Comment displays
- [ ] Submit date displays
- [ ] Approve button works for pending reviews
- [ ] Approve updates restaurant rating
- [ ] Reject button works
- [ ] Approved reviews cannot be moderated again

#### 15. User Management
- [ ] User list loads
- [ ] All customers display
- [ ] User ID shows
- [ ] Name displays
- [ ] Email displays
- [ ] Phone displays
- [ ] Registration date displays

#### 16. Delivery Management
- [ ] Delivery page loads
- [ ] Add delivery person form works
- [ ] Name validates as required
- [ ] Phone validates as required
- [ ] Vehicle number is optional
- [ ] Delivery person creates successfully
- [ ] Delivery personnel list loads
- [ ] All personnel display
- [ ] Availability status shows
- [ ] Assign delivery form works
- [ ] Order ID validates
- [ ] Delivery person selection shows available only
- [ ] Assignment succeeds
- [ ] Active deliveries list loads
- [ ] Order ID shows
- [ ] Assigned person shows
- [ ] Delivery status shows
- [ ] Assignment date shows

## Security Testing

### Authentication & Authorization
- [ ] Unauthenticated user cannot access /cart
- [ ] Unauthenticated user cannot access /checkout
- [ ] Unauthenticated user cannot access /profile
- [ ] Unauthenticated user cannot access /orders
- [ ] Unauthenticated user cannot access /admin/*
- [ ] Customer cannot access /admin/dashboard
- [ ] Customer cannot access /admin/restaurants
- [ ] Customer cannot access /admin/orders
- [ ] Session expires after timeout
- [ ] Expired session redirects to login
- [ ] Passwords are hashed in database
- [ ] Plain text passwords don't work
- [ ] SQL injection attempts fail
- [ ] XSS attempts are sanitized

### Input Validation
- [ ] Required fields cannot be empty
- [ ] Email format is validated
- [ ] Phone number format is validated
- [ ] Numeric fields accept only numbers
- [ ] Price cannot be negative
- [ ] Quantity cannot be negative
- [ ] Rating values are within 1-5 range
- [ ] Text length limits are enforced

## UI/UX Testing

### Responsive Design
- [ ] Desktop view (1920x1080) works correctly
- [ ] Laptop view (1366x768) works correctly
- [ ] Tablet view (768x1024) works correctly
- [ ] Mobile view (375x667) works correctly
- [ ] Navigation adapts to screen size
- [ ] Grid layouts stack on mobile
- [ ] Images scale appropriately
- [ ] Text remains readable on small screens
- [ ] Touch targets are large enough on mobile

### Visual Design
- [ ] Orange/cream/white color scheme consistent
- [ ] Typography is readable
- [ ] Contrast ratios meet accessibility standards
- [ ] Images load correctly
- [ ] Placeholder images show on error
- [ ] Hover effects work smoothly
- [ ] Transitions are smooth
- [ ] Loading states show
- [ ] Empty states show appropriate messages
- [ ] Error messages are clear

### Browser Compatibility
- [ ] Chrome (latest version)
- [ ] Firefox (latest version)
- [ ] Edge (latest version)
- [ ] Safari (latest version)

## Performance Testing

### Load Testing
- [ ] Home page loads in < 2 seconds
- [ ] Restaurant page loads in < 2 seconds
- [ ] Cart page loads in < 1 second
- [ ] Checkout page loads in < 1 second
- [ ] Admin dashboard loads in < 2 seconds
- [ ] Database queries execute efficiently
- [ ] No memory leaks detected
- [ ] Connection pooling works

### Stress Testing
- [ ] Handles 10 concurrent users
- [ ] Handles 50 concurrent users
- [ ] Database connection pool doesn't exhaust
- [ ] Session management handles multiple users

## Error Handling

### Error Pages
- [ ] 404 error page displays
- [ ] 500 error page displays
- [ ] Error pages have navigation back to home
- [ ] Error pages are styled consistently

### Graceful Degradation
- [ ] Database connection failure shows user-friendly error
- [ ] Missing images show placeholder
- [ ] Form validation errors are clear
- [ ] Server errors don't expose stack traces

## Integration Testing

### End-to-End Workflows

#### Customer Order Flow
1. [ ] Browse restaurants
2. [ ] Select restaurant
3. [ ] Add items to cart
4. [ ] Proceed to checkout
5. [ ] Enter delivery details
6. [ ] Place order
7. [ ] View order confirmation
8. [ ] View order in history
9. [ ] Submit review

#### Admin Management Flow
1. [ ] Login as admin
2. [ ] View dashboard
3. [ ] Add restaurant
4. [ ] Add menu items
5. [ ] View incoming orders
6. [ ] Update order status
7. [ ] Moderate reviews
8. [ ] Add delivery person
9. [ ] Assign delivery

## Regression Testing

After any code changes:
- [ ] Customer login still works
- [ ] Cart functionality works
- [ ] Order placement works
- [ ] Admin login still works
- [ ] Restaurant management works
- [ ] Order status updates work
- [ ] No new errors in logs

## Known Issues and Limitations

1. **Single Restaurant Cart**: Users can only order from one restaurant at a time
   - Workaround: Clear cart before ordering from different restaurant

2. **No Real Payment**: Payment is simulated
   - Workaround: Use for demonstration only

3. **No Email Notifications**: No order confirmation emails
   - Workaround: Check order history for confirmation

4. **Image URLs**: Images must be valid URLs
   - Workaround: Use placeholder images if URLs fail

5. **Manual Status Updates**: Order status requires admin intervention
   - Workaround: Admin must update status manually

## Test Data

### Demo Accounts
 Customer: customer@eat.com / password123
 Customer: student@eat.com / password123
 Admin: admin@eat.com / admin123

### Sample Test Cases

#### Test Case 1: Place an Order
1. Login as customer@eat.com
2. Browse restaurants
3. Click on "Spice Garden"
4. Add "Butter Chicken" to cart
5. Add "Naan Bread" to cart
6. Proceed to checkout
7. Enter delivery details
8. Select Cash on Delivery
9. Place order
10. Verify order confirmation
11. Verify order in order history

#### Test Case 2: Admin Restaurant Management
1. Login as admin@eat.com
2. Navigate to Admin Dashboard
3. Click "Manage Restaurants"
4. Click "Add Restaurant"
5. Fill in all required fields
6. Submit form
7. Verify restaurant appears in list
8. Click "Menu" for new restaurant
9. Add food items
10. Verify items appear in menu

#### Test Case 3: Review Submission
1. Login as customer
2. Navigate to a restaurant
3. Submit a review with all ratings
4. Verify review submission message
5. Login as admin
6. Navigate to Reviews
7. Approve the review
8. Login as customer
9. Verify review appears on restaurant page

## Sign-off Checklist

Before final deployment:
- [ ] All critical bugs fixed
- [ ] All high-priority issues resolved
- [ ] Database backup created
- [ ] Configuration files reviewed
- [ ] Demo accounts tested
- [ ] Documentation complete
- [ ] Team trained on admin features
- [ ] Rollback plan documented
