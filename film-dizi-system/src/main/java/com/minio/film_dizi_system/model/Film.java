package com.minio.film_dizi_system.model;

import jakarta.persistence.*;

@Entity
@Table(name = "film")
public class Film {

    @Id
    @Column(name = "media_work_id")
    private Integer id;

    @Column(name = "title")
    private String title;

    @Column(name = "release_year")
    private Integer releaseYear;

    @Column(name = "country")
    private String country;

    @Column(name = "language")
    private String language;

    @Column(name = "runtime_minutes")
    private Integer runtimeMinutes;

    @Column(name = "budget_usd")
    private Double budgetUsd;

    public Film() {}

    // GETTERS & SETTERS
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public Integer getReleaseYear() { return releaseYear; }
    public void setReleaseYear(Integer releaseYear) { this.releaseYear = releaseYear; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getLanguage() { return language; }
    public void setLanguage(String language) { this.language = language; }

    public Integer getRuntimeMinutes() { return runtimeMinutes; }
    public void setRuntimeMinutes(Integer runtimeMinutes) { this.runtimeMinutes = runtimeMinutes; }

    public Double getBudgetUsd() { return budgetUsd; }
    public void setBudgetUsd(Double budgetUsd) { this.budgetUsd = budgetUsd; }
}
