package com.minio.film_dizi_system.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.minio.film_dizi_system.model.Film;
import java.util.List;

@Repository
public interface FilmRepository extends JpaRepository<Film, Integer> {

    // Film arama (title içinde geçen)
    List<Film> findByTitleContainingIgnoreCase(String title);

    // Yayın yılına göre listeleme
    List<Film> findByReleaseYear(Integer year);
}
