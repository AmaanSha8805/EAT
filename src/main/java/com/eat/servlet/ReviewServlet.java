package com.eat.servlet;

import com.eat.model.Review;
import com.eat.model.User;
import com.eat.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
    private ReviewService reviewService;

    @Override
    public void init() {
        reviewService = new ReviewService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        int foodRating = Integer.parseInt(request.getParameter("foodRating"));
        int ambienceRating = Integer.parseInt(request.getParameter("ambienceRating"));
        int serviceRating = Integer.parseInt(request.getParameter("serviceRating"));
        int valueRating = Integer.parseInt(request.getParameter("valueRating"));
        String comment = request.getParameter("comment");
        
        double overallRating = (foodRating + ambienceRating + serviceRating + valueRating) / 4.0;
        
        Review review = new Review();
        review.setUserId(user.getUserId());
        review.setRestaurantId(restaurantId);
        review.setFoodRating(foodRating);
        review.setAmbienceRating(ambienceRating);
        review.setServiceRating(serviceRating);
        review.setValueRating(valueRating);
        review.setOverallRating(overallRating);
        review.setComment(comment);
        
        if (reviewService.submitReview(review)) {
            response.sendRedirect(request.getContextPath() + "/restaurant?id=" + restaurantId + "&review=submitted");
        } else {
            response.sendRedirect(request.getContextPath() + "/restaurant?id=" + restaurantId + "&review=exists");
        }
    }
}
