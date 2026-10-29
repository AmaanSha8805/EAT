package com.eat.service;

import com.eat.dao.BestForCategoryDAO;
import com.eat.model.BestForCategory;

import java.util.List;

public class BestForCategoryService {
    private BestForCategoryDAO bestForCategoryDAO;

    public BestForCategoryService() {
        this.bestForCategoryDAO = new BestForCategoryDAO();
    }

    public List<BestForCategory> getAllBestForCategories() {
        return bestForCategoryDAO.findAll();
    }

    public BestForCategory getBestForCategoryById(int bestForId) {
        return bestForCategoryDAO.findById(bestForId);
    }
}
