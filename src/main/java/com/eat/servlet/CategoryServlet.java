package com.eat.servlet;

import com.eat.model.FoodItem;
import com.eat.model.Category;
import com.eat.service.FoodItemService;
import com.eat.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
    private FoodItemService foodItemService;
    private CategoryService categoryService;

    @Override
    public void init() {
        foodItemService = new FoodItemService();
        categoryService = new CategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoryIdStr = request.getParameter("id");
        String viewAll = request.getParameter("viewAll");

        if (categoryIdStr == null || categoryIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        int categoryId;
        try {
            categoryId = Integer.parseInt(categoryIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        Category category = categoryService.getCategoryById(categoryId);
        if (category == null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        List<FoodItem> foodItems;
        if ("true".equals(viewAll)) {
            foodItems = foodItemService.getAllFoodItemsByCategory(category.getName());
            request.setAttribute("viewAll", true);
        } else {
            foodItems = foodItemService.getFoodItemsByCategory(category.getName(), 4);
        }

        request.setAttribute("category", category);
        request.setAttribute("foodItems", foodItems);

        request.getRequestDispatcher("/WEB-INF/jsp/category.jsp").forward(request, response);
    }
}
