---------------------------------------------------------
-- 1) REVIEW EKLENİNCE LOG EKLEYEN TRIGGER
---------------------------------------------------------

CREATE OR REPLACE FUNCTION trg_review_insert_log()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log(action, description)
    VALUES ('review_insert', 'Yeni bir review eklendi: ' || NEW.review_id);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER review_insert_log_trigger
AFTER INSERT ON review
FOR EACH ROW
EXECUTE FUNCTION trg_review_insert_log();


---------------------------------------------------------
-- 2) DISTRIBUTION EKLENİNCE LOG EKLEYEN TRIGGER
---------------------------------------------------------

CREATE OR REPLACE FUNCTION trg_distribution_insert_log()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log(action, description)
    VALUES ('distribution_insert', 'Yeni dağıtım eklendi → MediaWork ID=' || NEW.media_work_id);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER distribution_insert_log_trigger
AFTER INSERT ON distribution
FOR EACH ROW
EXECUTE FUNCTION trg_distribution_insert_log();


---------------------------------------------------------
-- 3) REVIEW UPDATE SONRASI ORTALAMA RATING HESAPLAYAN TRIGGER
---------------------------------------------------------

CREATE OR REPLACE FUNCTION trg_review_update_recalc()
RETURNS TRIGGER AS $$
DECLARE
    avg_rating NUMERIC;
BEGIN
    SELECT get_average_rating(NEW.media_work_id)
    INTO avg_rating;

    INSERT INTO log(action, description)
    VALUES ('review_update', 'Yeni ortalama: ' || avg_rating);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER review_update_trigger
AFTER UPDATE ON review
FOR EACH ROW
EXECUTE FUNCTION trg_review_update_recalc();


---------------------------------------------------------
-- 4) FILM SİLİNİNCE LOG EKLEYEN TRIGGER
---------------------------------------------------------

CREATE OR REPLACE FUNCTION trg_film_delete_log()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log(action, description)
    VALUES ('film_delete', 'Film silindi. ID=' || OLD.film_id);

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER film_delete_log_trigger
AFTER DELETE ON film
FOR EACH ROW
EXECUTE FUNCTION trg_film_delete_log();
