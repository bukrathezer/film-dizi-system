package com.minio.film_dizi_system.model;

import jakarta.persistence.*;

@Entity
@Table(name = "platform")
public class Platform {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "platform_id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "platform_type")
    private String type;

    @Column(name = "region")
    private String region;

    public Platform() {}

    // GETTERS & SETTERS
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getRegion() { return region; }
    public void setRegion(String region) { this.region = region; }
}
