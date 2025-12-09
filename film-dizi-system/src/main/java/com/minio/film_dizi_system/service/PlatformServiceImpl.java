package com.minio.film_dizi_system.service;

import com.minio.film_dizi_system.model.Platform;
import com.minio.film_dizi_system.repository.PlatformRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlatformServiceImpl implements PlatformService {

    private final PlatformRepository platformRepository;

    public PlatformServiceImpl(PlatformRepository platformRepository) {
        this.platformRepository = platformRepository;
    }

    @Override
    public List<Platform> getAllPlatforms() {
        return platformRepository.findAll();
    }
}
