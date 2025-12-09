package com.minio.film_dizi_system.service;

import com.minio.film_dizi_system.model.Review;

import java.util.List;

public interface ReviewService {

    List<Review> getAllReviews();
    Review saveReview(Review review);
    void deleteReview(Integer id);
}
