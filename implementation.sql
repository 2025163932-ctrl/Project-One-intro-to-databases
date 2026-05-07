--Creation of the Venue table--
CREATE TABLE Venue (
	Venue_id INT PRIMARY KEY,
	Venue_name VARCHAR(100),
	Address VARCHAR(50),
	Phone INT,
	District VARCHAR(25),
	Indoor BOOL
);

--Creation of the Shows table--
CREATE TABLE Shows (
	Shows_id SERIAL PRIMARY KEY,
	Show_name VARCHAR(100),
	Start_date TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
	End_date TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
	Price FLOAT,
	Description VARCHAR(200),
	Event_type VARCHAR(50),
	Venue_id INT,
	FOREIGN KEY (Venue_id) REFERENCES Venue (Venue_id)
);

--Creation of the Artist table--
CREATE TABLE Artist (
	Artist_id INT PRIMARY KEY,
	Artist_name VARCHAR(100),
	Genre VARCHAR(20),
	District VARCHAR(25)

);

--Creation of the Show_Artist table (bridge Table)--
CREATE TABLE Show_Artist (
	Shows_id SERIAL,
	Artist_id INT,
	Performance_time FLOAT,
	PRIMARY KEY (Shows_id, Artist_id),
	FOREIGN KEY (Shows_id) REFERENCES Shows (Shows_id),
	FOREIGN KEY (Artist_id) REFERENCES Artist (Artist_id)
	
);

--Values for the Venue table--
INSERT INTO Venue (Venue_id, Venue_name, Address, Phone, District, Indoor)
VALUES
(1, 'The Gilded Ballroom', 'Beaver Street', 6214533, 'Cayo', TRUE),
(2, 'Crystal Palace', 'Madison Avenue', 7283456, 'Orange Walk', TRUE),
(3, 'Riverfront Hall', 'Hudson Street', 6349821, 'Toledo', FALSE),
(4, 'Grand Empire Venue', 'Lexington Ave', 8123456, 'Corozal', TRUE),
(5, 'Sunset Pavilion', 'Broadway', 7456123, 'Stann Creek', FALSE),
(6, 'Harbor View Center', 'Water Street', 6678901, 'Belize', TRUE),
(7, 'Royal Garden Hall', 'Fulton Street', 9234567, 'Corozal', TRUE),
(8, 'Skyline Events', 'Park Avenue', 5567123, 'Stann Creek', TRUE),
(9, 'Golden Crown Venue', 'Canal Street', 7845123, 'Toledo', FALSE),
(10, 'Lakeside Ballroom', 'Lake Drive', 6123789, 'Cayo', TRUE);

--Values for the Shows table--
INSERT INTO Shows 
(Show_name, Start_date, End_date, Price, Description, Event_type, Venue_id)
VALUES
('Breakfast at Midnight', '2023-04-12 11:00:00', '2023-04-12 14:10:00', 130.00, 'Experience an electrifying night', 'Concert', 3),
('Neon Sunrise', '2023-01-15 10:00:00', '2023-01-15 14:30:00', 95.00, 'Join fans for an energetic daytime musical celebration', 'Concert', 6),
('Rhythm of the Coast', '2023-02-03 16:00:00', '2023-02-03 22:00:00', 150.00, 'Feel the ocean vibes with unforgettable live performances', 'Festival', 9),
('Midnight Echoes', '2023-01-15 10:00:00', '2023-01-15 14:30:00', 120.00, 'An immersive evening filled with powerful sound and lights', 'Concert', 4),
('Golden Hour Live', '2023-03-08 15:00:00', '2023-03-08 20:00:00', 110.00, 'Celebrate music during the most magical time of day', 'Residency', 2),
('Electric Paradise', '2023-03-21 17:00:00', '2023-03-21 23:00:00', 175.00, 'Dance the night away in an electrifying atmosphere', 'Festival', 9),
('City Lights Sessions', '2023-04-05 19:00:00', '2023-04-05 23:30:00', 140.00, 'Experience vibrant performances under dazzling lights', 'Concert', 7),
('Harmony Fest', '2023-04-18 11:00:00', '2023-04-18 18:00:00', 90.00, 'A joyful gathering celebrating music and unity', 'Festival', 8),
('Soundwave Nights', '2023-05-02 18:00:00', '2023-05-02 23:00:00', 160.00, 'Feel every beat in this unforgettable night show', 'Concert', 1),
('Sunset Resonance', '2023-05-19 16:30:00', '2023-05-19 21:30:00', 135.00, 'Witness stunning performances as the sun goes down', 'Residency', 10);

--Values for Artist table--
INSERT INTO Artist (Artist_id, Artist_name, Genre, District)
VALUES
(1, 'Pen_Cayetano', 'Punta_Rock', 'Stann_Creek'),
(2, 'Andy_Palacio', 'Garifuna', 'Toledo'),
(3, 'Supa_G', 'Punta_Rock', 'Belize'),
(4, 'Aziatic', 'Garifuna', 'Orange_Walk'),
(5, 'Paranda', 'Folk', 'Stann_Creek'),
(6, 'Ernestine_Carballo', 'Soca', 'Cayo'),
(7, 'Stig_da_Artist', 'Hip-Hop', 'Corozal'),
(8, 'Conscious Youth', 'Reggae', 'Belize City'),
(9, 'Leela Vernon', 'Brukdown', 'Cayo'),
(10, 'Tanya Carter', 'Reggae', 'Belize City');

--Values for Show_Artist table--
INSERT INTO Show_Artist (Shows_id, Artist_id, Performance_time)
VALUES
(1, 1, 3.17),
(1, 2, 3.17),
(2, 3, 4.50),
(3, 2, 6.00),
(3, 4, 6.00),
(4, 7, 4.50),
(5, 5, 5.00),
(6, 1, 6.00),
(6, 6, 6.00),
(8, 3, 7.00),
(6, 10, 6.00),
(5, 8, 5.00),
(9, 7, 4.00),
(10, 4, 5.00);


--Stored procedures

-- Q1: CreateShowPackage
-- Creates a show and assigns multiple artists at once

CREATE OR REPLACE PROCEDURE CreateShowPackage(
    p_show_name      VARCHAR,
    p_start_date     TIMESTAMP,
    p_end_date       TIMESTAMP,
    p_price          FLOAT,
    p_description    VARCHAR,
    p_event_type     VARCHAR,
    p_venue_id       INT,
    p_artist_ids     INT[]
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_show_id INT;
    v_artist  INT;
BEGIN
    -- Step 1: Create the show
    INSERT INTO Shows (Show_name, Start_date, End_date, Price, Description, Event_type, Venue_id)
    VALUES (p_show_name, p_start_date, p_end_date, p_price, p_description, p_event_type, p_venue_id)
    RETURNING Shows_id INTO v_show_id;

    -- Step 2: Loop through the array and assign each artist
    FOREACH v_artist IN ARRAY p_artist_ids LOOP
        INSERT INTO Show_Artist (Shows_id, Artist_id, Performance_time)
        VALUES (v_show_id, v_artist, 0.0);
    END LOOP;

    RAISE NOTICE 'Show "%" created with ID % and % artists assigned.',
        p_show_name, v_show_id, array_length(p_artist_ids, 1);

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'CreateShowPackage failed: %', SQLERRM;
END;
$$;

-- Example call:
CALL CreateShowPackage(
    'Jazz Night',
    '2025-06-15 20:00:00',
    '2025-06-15 23:00:00',
    85.00,
    'A smooth evening of live jazz',
    'Concert',
    1,
    ARRAY[1, 2, 3, 5]
);


-- Q2: CancelShow
-- Deletes a show and all its artist associations safely

CREATE OR REPLACE PROCEDURE CancelShow(
    p_show_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_show_name VARCHAR;
BEGIN
    -- Step 1: Confirm the show exists
    SELECT Show_name INTO v_show_name
    FROM Shows
    WHERE Shows_id = p_show_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Show with ID % does not exist.', p_show_id;
    END IF;

    -- Step 2: Delete artist associations first (FK safety)
    DELETE FROM Show_Artist
    WHERE Shows_id = p_show_id;

    -- Step 3: Delete the show itself
    DELETE FROM Shows
    WHERE Shows_id = p_show_id;

    RAISE NOTICE 'Show "%" (ID: %) and all artist links have been deleted.',
        v_show_name, p_show_id;

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'CancelShow failed: %', SQLERRM;
END;
$$;

-- Example call:
CALL CancelShow(7);

--Functions 

-- Q1 CalculateTotalArtistCount: Returns the number of artists assigned to a specific Show Name.

SELECT * FROM show_artist;

CREATE OR REPLACE FUNCTION CalculateTotalArtistCount (p_show_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$ 
	DECLARE count_artist INT;
	BEGIN
		SELECT COUNT(*) INTO count_artist
		FROM show_artist
		WHERE shows_id = P_show_id;
		RETURN count_artist;
	END;
$$;

SELECT CalculateTotalArtistCount(3);


--Q2 GetShowDuration: Calculates the days between StartDate and EndDate.

SELECT * FROM shows;

CREATE OR REPLACE FUNCTION GetShowDuration(p_show_id INT)
RETURNS INTERVAL
LANGUAGE plpgsql
AS $$ 
	DECLARE daysBetween INTERVAL;
	BEGIN
		SELECT end_date - start_date INTO daysBetween
		FROM shows
		WHERE shows_id = p_show_id;
	RETURN daysBetween;
	END;
$$;

SELECT GetShowDuration(2);

--Trigger

-- NoSchedulingConflict: Prevents a venue from having two shows on the same date.

CREATE OR REPLACE FUNCTION no_scheduling_conflict()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
BEGIN
    -- Validate time range
    IF NEW.end_date <= NEW.start_date THEN
        RAISE EXCEPTION 'Invalid time range: end_date must be after start_date';
    END IF;

    -- Check overlapping shows at same venue
    IF EXISTS (
        SELECT 1
        FROM shows
        WHERE venue_id = NEW.venue_id
          AND NEW.start_date < end_date
          AND NEW.end_date > start_date
          AND id != NEW.id
    ) THEN
        RAISE EXCEPTION 'Scheduling conflict: This venue already has a show during this time';
    END IF;

    RETURN NEW;
END;
$$ 

CREATE TRIGGER NoSchedulingConflict
BEFORE INSERT ON shows
FOR EACH ROW
EXECUTE FUNCTION no_scheduling_conflict();

--Sql Queries

--Q1 List each show along with all participating artists using a multi-table JOIN.

SELECT s.Show_name AS ShowName,
       v.Venue_name AS Venue,
       a.Artist_name AS Artist
FROM Shows s
INNER JOIN Venue v ON s.Venue_id = v.Venue_id
INNER JOIN Show_Artist sa ON s.Shows_id = sa.Shows_id
INNER JOIN Artist a ON sa.Artist_id = a.Artist_id
ORDER BY s.Show_name;

--Q2 Find the most expensive show and its performers using a subquery.

SELECT s.Show_name AS Show,
       s.Price AS Cost,
       a.Artist_name AS Artist
FROM Shows s
INNER JOIN Show_Artist sa ON s.Shows_id = sa.Shows_id
INNER JOIN Artist a ON sa.Artist_id = a.Artist_id
WHERE s.Price = (SELECT MAX(Price) FROM Shows);



