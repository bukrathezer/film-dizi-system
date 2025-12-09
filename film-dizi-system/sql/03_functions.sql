---------------------------------------------------------
-- 1) Ortalama Rating Hesaplayan Fonksiyon
---------------------------------------------------------
CREATE OR REPLACE FUNCTION get_average_rating(p_media_work_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
    avg_rating NUMERIC;
BEGIN
    SELECT AVG(rating)
    INTO avg_rating
    FROM review
    WHERE media_work_id = p_media_work_id;

    RETURN COALESCE(avg_rating, 0);
END;
$$ LANGUAGE plpgsql;


---------------------------------------------------------
-- 2) Bir dizinin toplam bölüm sayısını hesaplayan fonksiyon
---------------------------------------------------------
CREATE OR REPLACE FUNCTION get_total_episode_count(p_series_id INTEGER)
RETURNS INTEGER AS $$
DECLARE
    total_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO total_count
    FROM episode e
    JOIN season s ON e.season_id = s.season_id
    WHERE s.series_id = p_series_id;

    RETURN COALESCE(total_count, 0);
END;
$$ LANGUAGE plpgsql;


---------------------------------------------------------
-- 3) Bir yapımcının çalıştığı toplam yapım sayısı
---------------------------------------------------------
CREATE OR REPLACE FUNCTION get_producer_work_count(p_producer_id INTEGER)
RETURNS INTEGER AS $$
DECLARE
    work_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO work_count
    FROM media_producer
    WHERE producer_id = p_producer_id;

    RETURN COALESCE(work_count, 0);
END;
$$ LANGUAGE plpgsql;


---------------------------------------------------------
-- 4) Log ekleme fonksiyonu
---------------------------------------------------------
CREATE OR REPLACE FUNCTION add_log(p_action TEXT, p_desc TEXT)
RETURNS VOID AS $$
BEGIN
    INSERT INTO log(action, description)
    VALUES (p_action, p_desc);
END;
$$ LANGUAGE plpgsql;
