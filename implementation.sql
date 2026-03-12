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


--List each show along with all artists--
SELECT 
    s.Show_name AS ShowName,
    v.Venue_name AS Venue,
    v.Address AS Address,
    a.Artist_name AS Artist
FROM Shows s
    JOIN Venue v ON s.Venue_id = v.Venue_id
    JOIN Show_Artist sa ON s.Shows_id = sa.Shows_id
    JOIN Artist a ON sa.Artist_id = a.Artist_id
ORDER BY s.Show_name;



--Idenify any overlapping--
SELECT 
    s1.Show_name AS Show1,
    s2.Show_name AS Show2,
    s1.Start_date AS StartingTime1,
    s1.End_date AS EndingTime1,
    s2.Start_date AS StartingTime2,
    s2.End_date AS StartingTime2
FROM Shows s1
JOIN Shows s2 
ON s1.Shows_id < s2.Shows_id
WHERE 
    s1.Start_date < s2.End_date
    AND s1.End_date > s2.Start_date;

--Find the most expensive show and list all artists.--

SELECT 
    s.Show_name AS Show,
    s.Price AS Cost,
    a.Artist_name AS ARTIST
FROM Shows s
    JOIN Show_Artist sa ON s.Shows_id = sa.Shows_id
    JOIN Artist a ON sa.Artist_id = a.Artist_id
WHERE s.Price = (SELECT MAX(Price) FROM Shows);


--Find the venue that on average hosted expensive shows--
SELECT 
    v.Venue_name AS VenueName,
    AVG(s.Price) AS AveragePrice
FROM Shows s
    JOIN Venue v ON s.Venue_id = v.Venue_id
GROUP BY v.Venue_name
ORDER BY AveragePrice DESC
LIMIT 1;


--list shows along with total number of artist performing in the shows--
SELECT 
    s.Show_name AS ShowName,
    COUNT(sa.Artist_id) AS TotalArtists
FROM Shows s
    LEFT JOIN Show_Artist sa ON s.Shows_id = sa.Shows_id
GROUP BY s.Show_name
ORDER BY s.Show_name;