package com.example.demo.service;

import java.util.List;
import com.example.demo.entity.Review;

public interface ReviewService {
    List<Review> getAllReviews();
    Review saveReview(Review review);
    Review getReviewById(Long idReview); 
    Review updateReview(Review review);
    void deleteReviewById(Long idReview);
}
