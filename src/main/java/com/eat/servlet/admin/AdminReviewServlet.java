package com.eat.servlet.admin;

import com.eat.model.Review;
import com.eat.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/reviews")
public class AdminReviewServlet extends HttpServlet {
    private ReviewService reviewService;

    @Override
    public void init() {
        reviewService = new ReviewService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String filter = request.getParameter("filter");
        List<Review> reviews;
        
        if ("pending".equals(filter)) {
            reviews = reviewService.getAllPendingReviews();
            request.setAttribute("filter", "pending");
        } else {
            reviews = reviewService.getAllReviews();
        }
        
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("/WEB-INF/jsp/admin/reviews.jsp").forward(request, response);
    }
}

@WebServlet("/admin/review-action")
class AdminReviewActionServlet extends HttpServlet {
    private ReviewService reviewService;

    @Override
    public void init() {
        reviewService = new ReviewService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        int reviewId = Integer.parseInt(request.getParameter("reviewId"));
        
        if ("approve".equals(action)) {
            reviewService.approveReview(reviewId);
        } else if ("reject".equals(action)) {
            reviewService.rejectReview(reviewId);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/reviews");
    }
}
