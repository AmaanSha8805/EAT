package com.eat.service;

import com.eat.dao.UserDAO;
import com.eat.model.User;

public class UserService {
    private UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    public boolean registerUser(User user) {
        if (userDAO.findByEmail(user.getEmail()) != null) {
            return false;
        }
        user.setRole("customer");
        return userDAO.create(user);
    }

    public User authenticateUser(String email, String password) {
        if (userDAO.validatePassword(email, password)) {
            return userDAO.findByEmail(email);
        }
        return null;
    }

    public User getUserById(int userId) {
        return userDAO.findById(userId);
    }

    public boolean updateUserProfile(User user) {
        return userDAO.update(user);
    }
}
