package com.example.demo.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Review;
import com.example.demo.repository.ReviewRepository;
import com.example.demo.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

    private ReviewRepository ReviewRepository;

    public ReviewServiceImpl(ReviewRepository ReviewRepository) {
        super();
        this.ReviewRepository = ReviewRepository;
    }

    @Override
    public List<Review> getAllReviews() {
        return ReviewRepository.findAll();
    }

    @Override
    public Review saveReview(Review Review) {
        return ReviewRepository.save(Review);
    }

    @Override
    public Review getReviewById(Long idReview) {
        return ReviewRepository.findById(idReview).get();
    }

    @Override
    public Review updateReview(Review Review) {
        return ReviewRepository.save(Review);
    }

    @Override
    public void deleteReviewById(Long idReview) {
        ReviewRepository.deleteById(idReview);
    }
}
