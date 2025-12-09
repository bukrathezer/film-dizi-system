---------------------------------------------------------------
-- 0) TÜM TABLOLARI TEMİZLE (DOĞRU SIRADA DROP)
---------------------------------------------------------------
DROP TABLE IF EXISTS role CASCADE;
DROP TABLE IF EXISTS review CASCADE;
DROP TABLE IF EXISTS distribution CASCADE;
DROP TABLE IF EXISTS platform CASCADE;
DROP TABLE IF EXISTS episode CASCADE;
DROP TABLE IF EXISTS season CASCADE;
DROP TABLE IF EXISTS media_producer CASCADE;
DROP TABLE IF EXISTS media_genre CASCADE;
DROP TABLE IF EXISTS genre CASCADE;
DROP TABLE IF EXISTS producer CASCADE;
DROP TABLE IF EXISTS director CASCADE;
DROP TABLE IF EXISTS actor CASCADE;
DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS series CASCADE;
DROP TABLE IF EXISTS film CASCADE;
DROP TABLE IF EXISTS media_work CASCADE;
DROP TABLE IF EXISTS log CASCADE;

---------------------------------------------------------------
-- 1) MEDIA_WORK (SUPER TYPE)
---------------------------------------------------------------
CREATE TABLE media_work (
    media_work_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    original_title VARCHAR(200),
    release_year INTEGER,
    country VARCHAR(100),
    language VARCHAR(50),
    type VARCHAR(10) NOT NULL CHECK (type IN ('FILM','SERIES'))
);

---------------------------------------------------------------
-- 2) FILM (1–1 FK → media_work)
---------------------------------------------------------------
CREATE TABLE film (
    film_id INTEGER PRIMARY KEY,
    runtime_minutes INTEGER,
    budget_usd NUMERIC(12,2),
    CONSTRAINT fk_film_media FOREIGN KEY (film_id)
        REFERENCES media_work(media_work_id)
        ON DELETE CASCADE
);

---------------------------------------------------------------
-- 3) SERIES (1–1 FK → media_work)
---------------------------------------------------------------
CREATE TABLE series (
    series_id INTEGER PRIMARY KEY,
    total_seasons INTEGER,
    status VARCHAR(20) CHECK (status IN ('running','finished')),
    CONSTRAINT fk_series_media FOREIGN KEY (series_id)
        REFERENCES media_work(media_work_id)
        ON DELETE CASCADE
);

---------------------------------------------------------------
-- 4) PERSON (SUPER TYPE)
---------------------------------------------------------------
CREATE TABLE person (
    person_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    birth_year INTEGER,
    country VARCHAR(100)
);

---------------------------------------------------------------
-- 5) ACTOR (1–1 FK → person)
---------------------------------------------------------------
CREATE TABLE actor (
    actor_id INTEGER PRIMARY KEY,
    agent_name VARCHAR(150),
    CONSTRAINT fk_actor_person FOREIGN KEY (actor_id)
        REFERENCES person(person_id)
        ON DELETE CASCADE
);

---------------------------------------------------------------
-- 6) DIRECTOR (1–1 FK → person)
---------------------------------------------------------------
CREATE TABLE director (
    director_id INTEGER PRIMARY KEY,
    notable_style VARCHAR(150),
    CONSTRAINT fk_director_person FOREIGN KEY (director_id)
        REFERENCES person(person_id)
        ON DELETE CASCADE
);

---------------------------------------------------------------
-- 7) PRODUCER (1–1 FK → person)
---------------------------------------------------------------
CREATE TABLE producer (
    producer_id INTEGER PRIMARY KEY,
    company_name VARCHAR(150),
    CONSTRAINT fk_producer_person FOREIGN KEY (producer_id)
        REFERENCES person(person_id)
        ON DELETE CASCADE
);

---------------------------------------------------------------
-- 8) GENRE
---------------------------------------------------------------
CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

---------------------------------------------------------------
-- 9) MEDIA_GENRE (M:N)
---------------------------------------------------------------
CREATE TABLE media_genre (
    media_work_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY(media_work_id, genre_id),
    FOREIGN KEY (media_work_id) REFERENCES media_work(media_work_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);

---------------------------------------------------------------
-- 10) MEDIA_PRODUCER (M:N)
---------------------------------------------------------------
CREATE TABLE media_producer (
    media_work_id INTEGER NOT NULL,
    producer_id INTEGER NOT NULL,
    PRIMARY KEY(media_work_id, producer_id),
    FOREIGN KEY(media_work_id) REFERENCES media_work(media_work_id) ON DELETE CASCADE,
    FOREIGN KEY(producer_id) REFERENCES producer(producer_id) ON DELETE CASCADE
);

---------------------------------------------------------------
-- 11) SEASON (1–N → SERIES)
---------------------------------------------------------------
CREATE TABLE season (
    season_id SERIAL PRIMARY KEY,
    series_id INTEGER NOT NULL,
    season_number INTEGER NOT NULL,
    FOREIGN KEY(series_id) REFERENCES series(series_id) ON DELETE CASCADE
);

---------------------------------------------------------------
-- 12) EPISODE (1–N → SEASON)
---------------------------------------------------------------
CREATE TABLE episode (
    episode_id SERIAL PRIMARY KEY,
    season_id INTEGER NOT NULL,
    episode_number INTEGER NOT NULL,
    title VARCHAR(200),
    duration_min INTEGER,
    air_date DATE,
    FOREIGN KEY(season_id) REFERENCES season(season_id) ON DELETE CASCADE
);

---------------------------------------------------------------
-- 13) PLATFORM
---------------------------------------------------------------
CREATE TABLE platform (
    platform_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    platform_type VARCHAR(50),
    region VARCHAR(100)
);

---------------------------------------------------------------
-- 14) DISTRIBUTION
---------------------------------------------------------------
CREATE TABLE distribution (
    distribution_id SERIAL PRIMARY KEY,
    media_work_id INTEGER NOT NULL,
    platform_id INTEGER NOT NULL,
    region VARCHAR(100),
    release_date DATE,
    distribution_type VARCHAR(50),
    FOREIGN KEY(media_work_id) REFERENCES media_work(media_work_id) ON DELETE CASCADE,
    FOREIGN KEY(platform_id) REFERENCES platform(platform_id) ON DELETE CASCADE
);

---------------------------------------------------------------
-- 15) REVIEW
---------------------------------------------------------------
CREATE TABLE review (
    review_id SERIAL PRIMARY KEY,
    media_work_id INTEGER NOT NULL,
    reviewer_name VARCHAR(150),
    rating INTEGER CHECK (rating BETWEEN 1 AND 10),
    comment TEXT,
    review_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY(media_work_id) REFERENCES media_work(media_work_id) ON DELETE CASCADE
);

---------------------------------------------------------------
-- 16) ROLE
---------------------------------------------------------------
CREATE TABLE role (
    role_id SERIAL PRIMARY KEY,
    media_work_id INTEGER NOT NULL,
    actor_id INTEGER NOT NULL,
    character_name VARCHAR(150),
    is_main_role BOOLEAN,
    FOREIGN KEY(media_work_id) REFERENCES media_work(media_work_id) ON DELETE CASCADE,
    FOREIGN KEY(actor_id) REFERENCES actor(actor_id) ON DELETE CASCADE
);

---------------------------------------------------------------
-- 17) LOG TABLE
---------------------------------------------------------------
CREATE TABLE log (
    log_id SERIAL PRIMARY KEY,
    action VARCHAR(200),
    description TEXT,
    log_date TIMESTAMP DEFAULT NOW()
);
