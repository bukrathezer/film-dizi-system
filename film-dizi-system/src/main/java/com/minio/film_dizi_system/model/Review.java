package com.minio.film_dizi_system.model;

import jakarta.persistence.*;

@Entity
@Table(name = "review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private Integer id;

    @Column(name = "media_work_id")
    private Integer mediaWorkId;

    @Column(name = "reviewer_name")
    private String reviewerName;

    @Column(name = "rating")
    private Integer rating;

    @Column(name = "comment")
    private String comment;

    public Review() {}

    // GETTERS & SETTERS
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getMediaWorkId() { return mediaWorkId; }
    public void setMediaWorkId(Integer mediaWorkId) { this.mediaWorkId = mediaWorkId; }

    public String getReviewerName() { return reviewerName; }
    public void setReviewerName(String reviewerName) { this.reviewerName = reviewerName; }

    public Integer getRating() { return rating; }
    public void setRating(Integer rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }
}
