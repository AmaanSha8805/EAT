package com.eat.servlet;

import com.eat.model.FoodItem;
import com.eat.service.FoodItemService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/collection")
public class CollectionServlet extends HttpServlet {
    private FoodItemService foodItemService;

    private static final Map<String, String> COLLECTION_TITLES = new HashMap<>();
    private static final Map<String, String> COLLECTION_DESCRIPTIONS = new HashMap<>();

    static {
        COLLECTION_TITLES.put("student_friendly", "Student Friendly");
        COLLECTION_TITLES.put("budget_meals", "Budget Meals");
        COLLECTION_TITLES.put("family_feast", "Family Feast");
        COLLECTION_TITLES.put("party_packs", "Party Packs");
        COLLECTION_TITLES.put("best_offers", "Best Offers");
        COLLECTION_TITLES.put("quick_bites", "Quick Bites");

        COLLECTION_DESCRIPTIONS.put("student_friendly", "Affordable meals, filling combos and student meal packages");
        COLLECTION_DESCRIPTIONS.put("budget_meals", "Economical individual meals and low-cost combos");
        COLLECTION_DESCRIPTIONS.put("family_feast", "Family-sized meal packages and sharing combos");
        COLLECTION_DESCRIPTIONS.put("party_packs", "Group meals and larger combo offers");
        COLLECTION_DESCRIPTIONS.put("best_offers", "Genuine discounts and value-for-money combos");
        COLLECTION_DESCRIPTIONS.put("quick_bites", "Snacks, sandwiches, rolls and light meals");
    }

    @Override
    public void init() {
        foodItemService = new FoodItemService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String collectionType = request.getParameter("type");
        String viewAll = request.getParameter("viewAll");

        if (collectionType == null || collectionType.isEmpty() || !COLLECTION_TITLES.containsKey(collectionType)) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        List<FoodItem> foodItems;
        if ("true".equals(viewAll)) {
            foodItems = foodItemService.getAllFoodItemsByCollection(collectionType);
            request.setAttribute("viewAll", true);
        } else {
            foodItems = foodItemService.getFoodItemsByCollection(collectionType, 4);
        }

        request.setAttribute("collectionType", collectionType);
        request.setAttribute("collectionTitle", COLLECTION_TITLES.get(collectionType));
        request.setAttribute("collectionDescription", COLLECTION_DESCRIPTIONS.get(collectionType));
        request.setAttribute("foodItems", foodItems);

        request.getRequestDispatcher("/WEB-INF/jsp/collection.jsp").forward(request, response);
    }
}
