package com.eat.servlet;

import com.eat.model.CartItem;
import com.eat.model.FoodItem;
import com.eat.model.Restaurant;
import com.eat.service.FoodItemService;
import com.eat.service.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private FoodItemService foodItemService;
    private RestaurantService restaurantService;

    @Override
    public void init() {
        foodItemService = new FoodItemService();
        restaurantService = new RestaurantService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        double total = cart.stream().mapToDouble(CartItem::getSubtotal).sum();

        request.setAttribute("cart", cart);
        request.setAttribute("total", total);

        request.getRequestDispatcher("/WEB-INF/jsp/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        if ("add".equals(action)) {
            String foodIdStr = request.getParameter("foodId");
            if (foodIdStr == null || foodIdStr.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

            int foodId;
            try {
                foodId = Integer.parseInt(foodIdStr);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

            FoodItem foodItem = foodItemService.getFoodItemById(foodId);

            if (foodItem != null) {
                Restaurant restaurant = restaurantService.getRestaurantById(foodItem.getRestaurantId());
                if (restaurant == null) {
                    response.sendRedirect(request.getContextPath() + "/cart");
                    return;
                }

                boolean restaurantMatch = cart.isEmpty() ||
                    cart.get(0).getRestaurantId() == foodItem.getRestaurantId();

                if (!restaurantMatch) {
                    // Forward to cart page with error and existing cart data
                    double total = cart.stream().mapToDouble(CartItem::getSubtotal).sum();
                    session.setAttribute("cart", cart);
                    session.setAttribute("cartCount", cart.size());
                    session.setAttribute("cartError", "Cannot add items from different restaurants. Clear your cart first.");
                    response.sendRedirect(request.getContextPath() + "/cart");
                    return;
                }

                Optional<CartItem> existingItem = cart.stream()
                    .filter(item -> item.getFoodId() == foodId)
                    .findFirst();

                if (existingItem.isPresent()) {
                    existingItem.get().setQuantity(existingItem.get().getQuantity() + 1);
                } else {
                    CartItem cartItem = new CartItem(
                        foodId,
                        foodItem.getName(),
                        foodItem.getImageUrl(),
                        foodItem.getPrice(),
                        1,
                        foodItem.getRestaurantId(),
                        restaurant.getName()
                    );
                    cart.add(cartItem);
                }

                session.setAttribute("cart", cart);
                session.setAttribute("cartCount", cart.size());
            }
        } else if ("update".equals(action)) {
            String foodIdStr = request.getParameter("foodId");
            String quantityStr = request.getParameter("quantity");
            if (foodIdStr != null && quantityStr != null) {
                try {
                    int foodId = Integer.parseInt(foodIdStr);
                    int quantity = Integer.parseInt(quantityStr);

                    if (quantity <= 0) {
                        cart.removeIf(item -> item.getFoodId() == foodId);
                    } else {
                        cart.stream()
                            .filter(item -> item.getFoodId() == foodId)
                            .findFirst()
                            .ifPresent(item -> item.setQuantity(quantity));
                    }

                    session.setAttribute("cart", cart);
                    session.setAttribute("cartCount", cart.size());
                } catch (NumberFormatException e) {
                    // ignore bad input
                }
            }
        } else if ("remove".equals(action)) {
            String foodIdStr = request.getParameter("foodId");
            if (foodIdStr != null) {
                try {
                    int foodId = Integer.parseInt(foodIdStr);
                    cart.removeIf(item -> item.getFoodId() == foodId);
                    session.setAttribute("cart", cart);
                    session.setAttribute("cartCount", cart.size());
                } catch (NumberFormatException e) {
                    // ignore bad input
                }
            }
        } else if ("clear".equals(action)) {
            cart.clear();
            session.setAttribute("cart", cart);
            session.setAttribute("cartCount", 0);
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
