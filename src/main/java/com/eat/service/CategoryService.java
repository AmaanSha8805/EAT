package com.eat.service;

import com.eat.dao.CategoryDAO;
import com.eat.model.Category;

import java.util.List;

public class CategoryService {
    private CategoryDAO categoryDAO;

    public CategoryService() {
        this.categoryDAO = new CategoryDAO();
    }

    public List<Category> getAllCategories() {
        return categoryDAO.findAll();
    }

    public Category getCategoryById(int categoryId) {
        return categoryDAO.findById(categoryId);
    }
}
