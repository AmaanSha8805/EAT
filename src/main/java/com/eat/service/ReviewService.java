package com.eat.service;

import com.eat.dao.ReviewDAO;
import com.eat.model.Review;

import java.util.List;

public class ReviewService {
    private ReviewDAO reviewDAO;

    public ReviewService() {
        this.reviewDAO = new ReviewDAO();
    }

    public Review getReviewById(int reviewId) {
        return reviewDAO.findById(reviewId);
    }

    public Review getReviewByUserAndRestaurant(int userId, int restaurantId) {
        return reviewDAO.findByUserAndRestaurant(userId, restaurantId);
    }

    public List<Review> getReviewsByRestaurant(int restaurantId) {
        return reviewDAO.findByRestaurant(restaurantId);
    }

    public List<Review> getAllPendingReviews() {
        return reviewDAO.findAllPending();
    }

    public List<Review> getAllReviews() {
        return reviewDAO.findAll();
    }

    public boolean submitReview(Review review) {
        if (reviewDAO.findByUserAndRestaurant(review.getUserId(), review.getRestaurantId()) != null) {
            return false;
        }
        review.setApproved(false);
        return reviewDAO.create(review);
    }

    public boolean approveReview(int reviewId) {
        if (reviewDAO.updateApproval(reviewId, true)) {
            Review review = reviewDAO.findById(reviewId);
            if (review != null) {
                return reviewDAO.updateRestaurantRating(review.getRestaurantId());
            }
        }
        return false;
    }

    public boolean rejectReview(int reviewId) {
        return reviewDAO.updateApproval(reviewId, false);
    }
}
