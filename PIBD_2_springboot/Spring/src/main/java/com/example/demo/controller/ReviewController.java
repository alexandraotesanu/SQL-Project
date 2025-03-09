package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.demo.entity.Review;
import com.example.demo.service.ReviewService;

@Controller
public class ReviewController {

    private ReviewService reviewService;

    public ReviewController(ReviewService reviewService) {
        super();
        this.reviewService = reviewService;
    }

    @GetMapping("/reviewuri")
    public String listReviewuri(Model model) {
        model.addAttribute("reviewuri", reviewService.getAllReviews());
        return "reviewuri";
    }

    @GetMapping("/reviewuri/new")
    public String createReviewForm(Model model) {
        // Creează obiectul review pentru a stoca datele din formular
        Review review = new Review();
        model.addAttribute("review", review);
        return "create_review";
    }

    @PostMapping("/reviewuri")
    public String saveReview(@ModelAttribute("review") Review review) {
        reviewService.saveReview(review);
        return "redirect:/reviewuri";
    }

    @GetMapping("/reviewuri/edit/{idReview}")
    public String editReviewForm(@PathVariable Long idReview, Model model) {
        model.addAttribute("review", reviewService.getReviewById(idReview));
        return "edit_review";
    }

    @PostMapping("/reviewuri/{idReview}")
    public String updateReview(@PathVariable Long idReview,
                               @ModelAttribute("review") Review review,
                               Model model) {
        Review reviewExistent = reviewService.getReviewById(idReview);
        reviewExistent.setIdReview(idReview);
        reviewExistent.setTitlu(review.getTitlu());
        reviewExistent.setNumeReclamant(review.getNumeReclamant());
        reviewExistent.setPrenumeReclamant(review.getPrenumeReclamant());
        reviewExistent.setDetalii(review.getDetalii());
        reviewExistent.setDataReview(review.getDataReview());
        reviewService.updateReview(reviewExistent);
        return "redirect:/reviewuri";
    }

    @GetMapping("/reviewuri/{idReview}")
    public String deleteReview(@PathVariable Long idReview) {
        reviewService.deleteReviewById(idReview);
        return "redirect:/reviewuri";
    }
}
