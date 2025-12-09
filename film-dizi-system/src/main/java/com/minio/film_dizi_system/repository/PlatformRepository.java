package com.minio.film_dizi_system.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.minio.film_dizi_system.model.Platform;

@Repository
public interface PlatformRepository extends JpaRepository<Platform, Integer> {
}
