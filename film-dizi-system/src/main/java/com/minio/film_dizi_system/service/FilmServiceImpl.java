package com.minio.film_dizi_system.service;

import com.minio.film_dizi_system.model.Film;
import com.minio.film_dizi_system.repository.FilmRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FilmServiceImpl implements FilmService {

    private final FilmRepository filmRepository;

    public FilmServiceImpl(FilmRepository filmRepository) {
        this.filmRepository = filmRepository;
    }

    @Override
    public List<Film> getAllFilms() {
        return filmRepository.findAll();
    }

    @Override
    public Film getFilmById(Integer id) {
        return filmRepository.findById(id).orElse(null);
    }

    @Override
    public Film saveFilm(Film film) {
        return filmRepository.save(film);
    }

    @Override
    public void deleteFilm(Integer id) {
        filmRepository.deleteById(id);
    }

    @Override
    public List<Film> searchByTitle(String title) {
        return filmRepository.findByTitleContainingIgnoreCase(title);
    }

    @Override
    public List<Film> searchByYear(Integer year) {
        return filmRepository.findByReleaseYear(year);
    }
}
