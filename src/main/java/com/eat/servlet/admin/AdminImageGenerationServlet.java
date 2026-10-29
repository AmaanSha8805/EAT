package com.eat.servlet.admin;

import com.eat.model.User;
import com.eat.service.ImageGenerationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Admin-only servlet for batch generating food images using Gemini API.
 * Protected by AuthenticationFilter - only admin users can access.
 */
@WebServlet("/admin/image-generation")
public class AdminImageGenerationServlet extends HttpServlet {
    
    private static final int TEST_LIMIT = 5; // Initial test limit as per requirements
    
    private ImageGenerationService imageGenerationService;
    
    @Override
    public void init() {
        imageGenerationService = new ImageGenerationService();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Verify admin role (double-check despite filter)
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Admin access required");
            return;
        }
        
        // Check if generation was triggered
        String action = request.getParameter("action");
        
        if ("generate".equals(action)) {
            // Perform batch generation
            List<ImageGenerationService.GenerationResult> results = 
                imageGenerationService.generateImagesForFoodItems(TEST_LIMIT);
            
            request.setAttribute("results", results);
            request.setAttribute("limit", TEST_LIMIT);
            request.setAttribute("generated", true);
        } else {
            // Show initial page
            request.setAttribute("limit", TEST_LIMIT);
            request.setAttribute("generated", false);
        }
        
        request.getRequestDispatcher("/WEB-INF/jsp/admin/image-generation.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Verify admin role
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Admin access required");
            return;
        }
        
        // Redirect to GET with action parameter
        response.sendRedirect(request.getContextPath() + "/admin/image-generation?action=generate");
    }
}
