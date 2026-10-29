package com.eat.servlet.admin;

import com.eat.dao.UserDAO;
import com.eat.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class AdminUserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<User> users = userDAO.findAllCustomers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/jsp/admin/users.jsp").forward(request, response);
    }
}
