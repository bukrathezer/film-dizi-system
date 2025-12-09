package com.minio.film_dizi_system.service;

import com.minio.film_dizi_system.model.Film;

import java.util.List;

public interface FilmService {

    List<Film> getAllFilms();
    Film getFilmById(Integer id);
    Film saveFilm(Film film);
    void deleteFilm(Integer id);

    List<Film> searchByTitle(String title);
    List<Film> searchByYear(Integer year);
}
