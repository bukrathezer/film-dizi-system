---------------------------------------------------------
-- 1) MEDIA_WORK (filmler + diziler üst tablo)
---------------------------------------------------------
INSERT INTO media_work (title, original_title, release_year, country, language, type)
VALUES
('Inception', 'Inception', 2010, 'USA', 'English', 'FILM'),
('The Matrix', 'The Matrix', 1999, 'USA', 'English', 'FILM'),
('Breaking Bad', 'Breaking Bad', 2008, 'USA', 'English', 'SERIES'),
('Dark', 'Dark', 2017, 'Germany', 'German', 'SERIES');

-- ID eşleşmeleri:
-- 1 → Inception (FILM)
-- 2 → Matrix (FILM)
-- 3 → Breaking Bad (SERIES)
-- 4 → Dark (SERIES)


---------------------------------------------------------
-- 2) FILM (1–1 FK → media_work)
---------------------------------------------------------
INSERT INTO film (film_id, runtime_minutes, budget_usd)
VALUES
(1, 148, 160000000),
(2, 136, 63000000);


---------------------------------------------------------
-- 3) SERIES (1–1 FK → media_work)
---------------------------------------------------------
INSERT INTO series (series_id, total_seasons, status)
VALUES
(3, 5, 'finished'),
(4, 3, 'finished');


---------------------------------------------------------
-- 4) PERSON (oyuncu + yönetmen + yapımcı üst tablo)
---------------------------------------------------------
INSERT INTO person (name, birth_year, country)
VALUES
('Leonardo DiCaprio', 1974, 'USA'),
('Keanu Reeves', 1964, 'Canada'),
('Bryan Cranston', 1956, 'USA'),
('Baran Bo Odar', 1978, 'Germany');

-- person_id:
-- 1 → DiCaprio
-- 2 → Reeves
-- 3 → Cranston
-- 4 → Baran Bo Odar


---------------------------------------------------------
-- 5) ACTOR (1–1 FK → person)
---------------------------------------------------------
INSERT INTO actor (actor_id, agent_name)
VALUES
(1, 'Creative Artists Agency'),
(2, 'William Morris Agency'),
(3, 'ICM Partners');


---------------------------------------------------------
-- 6) DIRECTOR (1–1 FK → person)
---------------------------------------------------------
INSERT INTO director (director_id, notable_style)
VALUES
(4, 'Dark thriller style');


---------------------------------------------------------
-- 7) PRODUCER (1–1 FK → person)
---------------------------------------------------------
INSERT INTO producer (producer_id, company_name)
VALUES
(1, 'Warner Bros'),
(3, 'AMC Studios');


---------------------------------------------------------
-- 8) GENRE (tür tablosu)
---------------------------------------------------------
INSERT INTO genre (name)
VALUES
('Sci-Fi'),
('Drama'),
('Thriller');


---------------------------------------------------------
-- 9) MEDIA_GENRE (M:N)
---------------------------------------------------------
INSERT INTO media_genre (media_work_id, genre_id)
VALUES
(1, 1),  -- Inception → Sci-Fi
(2, 1),  -- Matrix → Sci-Fi
(3, 2),  -- Breaking Bad → Drama
(4, 3);  -- Dark → Thriller


---------------------------------------------------------
-- 10) MEDIA_PRODUCER (M:N)
---------------------------------------------------------
INSERT INTO media_producer (media_work_id, producer_id)
VALUES
(1, 1),  -- Inception → Warner Bros
(3, 3);  -- Breaking Bad → AMC Studios


---------------------------------------------------------
-- 11) SEASON (dizilerin sezonları)
---------------------------------------------------------
INSERT INTO season (series_id, season_number)
VALUES
(3, 1),
(3, 2),
(4, 1);


---------------------------------------------------------
-- 12) EPISODE (sezon → bölüm)
---------------------------------------------------------
INSERT INTO episode (season_id, episode_number, title, duration_min, air_date)
VALUES
(1, 1, 'Pilot', 58, '2008-01-20'),
(1, 2, 'Cat''s in the Bag', 48, '2008-01-27'),
(2, 1, 'Seven Thirty-Seven', 47, '2009-03-08');


---------------------------------------------------------
-- 13) PLATFORM
---------------------------------------------------------
INSERT INTO platform (name, platform_type, region)
VALUES
('Netflix', 'Streaming', 'Global'),
('HBO', 'TV Channel', 'USA');


---------------------------------------------------------
-- 14) DISTRIBUTION
---------------------------------------------------------
INSERT INTO distribution (media_work_id, platform_id, region, release_date, distribution_type)
VALUES
(1, 1, 'Global', '2020-12-01', 'Streaming'),
(3, 2, 'USA', '2008-01-20', 'TV');


---------------------------------------------------------
-- 15) REVIEW
---------------------------------------------------------
INSERT INTO review (media_work_id, reviewer_name, rating, comment)
VALUES
(1, 'Ahmet', 9, 'Akıl almaz bir film'),
(3, 'Ayşe', 10, 'Efsane bir dizi'),
(4, 'Mehmet', 8, 'Karanlık ve etkileyici');


---------------------------------------------------------
-- 16) ROLE (oyuncu → film/dizi ilişkilendirme)
---------------------------------------------------------
INSERT INTO role (media_work_id, actor_id, character_name, is_main_role)
VALUES
(1, 1, 'Cobb', TRUE),
(2, 2, 'Neo', TRUE),
(3, 3, 'Walter White', TRUE);


---------------------------------------------------------
-- 17) LOG (test log kaydı)
---------------------------------------------------------
INSERT INTO log (action, description)
VALUES
('init', 'System initialized successfully.');
