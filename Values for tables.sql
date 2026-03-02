--Values for the Venue table--
INSERT INTO Venue (Venue_id, Venue_name, Address, Phone, District, Indoor)
VALUES
(1, 'The Gilded Ballroom', 'Beaver Street', 6214533, 'New York', TRUE),
(2, 'Crystal Palace', 'Madison Avenue', 7283456, 'Manhattan', TRUE),
(3, 'Riverfront Hall', 'Hudson Street', 6349821, 'Brooklyn', FALSE),
(4, 'Grand Empire Venue', 'Lexington Ave', 8123456, 'Queens', TRUE),
(5, 'Sunset Pavilion', 'Broadway', 7456123, 'Manhattan', FALSE),
(6, 'Harbor View Center', 'Water Street', 6678901, 'Bronx', TRUE),
(7, 'Royal Garden Hall', 'Fulton Street', 9234567, 'Brooklyn', TRUE),
(8, 'Skyline Events', 'Park Avenue', 5567123, 'Manhattan', TRUE),
(9, 'Golden Crown Venue', 'Canal Street', 7845123, 'Queens', FALSE),
(10, 'Lakeside Ballroom', 'Lake Drive', 6123789, 'Staten Island', TRUE);

--Values for the Shows table--
INSERT INTO Shows (Shows_id, Show_name, Start_date, End_date, Price, Description,
Event_type, Venue_id)
VALUES
(1, 'Breakfast at Midnight', '2023-04-12 11:00:00 ', '2023-04-12 14:10:00', 130.00, 'Experience
an electrifying night', 'Concert', 3),
(2, 'Neon Sunrise', '2023-01-15 10:00:00', '2023-01-15 14:30:00', 95.00, 'Join fans for an
energetic daytime musical celebration', 'Concert', 6),
(3, 'Rhythm of the Coast', '2023-02-03 16:00:00', '2023-02-03 22:00:00', 150.00, 'Feel the ocean
vibes with unforgettable live performances', 'Festival', 9),
(4, 'Midnight Echoes', '2023-02-20 18:30:00', '2023-02-20 23:45:00', 120.00, 'An immersive
evening filled with powerful sound and lights', 'Concert', 4),
(5, 'Golden Hour Live', '2023-03-08 15:00:00', '2023-03-08 20:00:00', 110.00, 'Celebrate music
during the most magical time of day', 'Residency', 2),
(6, 'Electric Paradise', '2023-03-21 17:00:00', '2023-03-21 23:00:00', 175.00, 'Dance the night
away in an electrifying atmosphere', 'Festival', 9),
(7, 'City Lights Sessions', '2023-04-05 19:00:00', '2023-04-05 23:30:00', 140.00, 'Experience
vibrant performances under dazzling lights', 'Concert', 7),
(8, 'Harmony Fest', '2023-04-18 11:00:00', '2023-04-18 18:00:00', 90.00, 'A joyful gathering
celebrating music and unity', 'Festival', 8),
(9, 'Soundwave Nights', '2023-05-02 18:00:00', '2023-05-02 23:00:00', 160.00, 'Feel every beat
in this unforgettable night show', 'Concert', 1),
(10, 'Sunset Resonance', '2023-05-19 16:30:00', '2023-05-19 21:30:00', 135.00, 'Witness
stunning performances as the sun goes down', 'Residency', 10),
(11, 'Pulse Arena', '2023-06-07 14:00:00', '2023-06-07 20:00:00', 125.00, 'High-energy
entertainment designed for true fans', 'Concert', 5),
(12, 'Festival of Beats', '2023-06-25 12:00:00', '2023-06-25 22:30:00', 200.00, 'A full-day
celebration packed with music and excitement', 'Festival', 8),
(13, 'Echo Chamber Live', '2023-07-04 18:00:00', '2023-07-04 23:59:00', 155.00, 'Celebrate the
night with immersive sound experiences', 'Concert', 6),
(14, 'Summer Residency Nights', '2023-07-15 17:30:00', '2023-07-15 22:00:00', 145.00,
'Exclusive performances crafted for loyal fans', 'Residency', 7),
(15, 'Aurora Sounds', '2023-08-01 15:00:00', '2023-08-01 21:00:00', 130.00, 'A colorful musical
journey through sound and light', 'Concert', 2),
(16, 'Vibe Nation Fest', '2023-08-18 13:00:00', '2023-08-18 23:00:00', 210.00, 'Join thousands
for an unforgettable festival experience', 'Festival', 8),
(17, 'Nightfall Symphony', '2023-09-06 18:30:00', '2023-09-06 22:30:00', 115.00, 'An emotional
evening of breathtaking performances', 'Concert', 4),
(18, 'Infinite Groove', '2023-09-21 16:00:00', '2023-09-21 21:45:00', 140.00, 'Lose yourself in
rhythm and vibrant energy', 'Residency', 10),
(19, 'Skyline Beats', '2023-10-03 17:00:00', '2023-10-03 23:00:00', 150.00, 'Enjoy music with
stunning city views', 'Concert', 3),
(20, 'Harmony Grounds', '2023-10-22 12:00:00', '2023-10-22 20:00:00', 170.00, 'A festival
designed to unite fans through music', 'Festival', 9),
(21, 'Moonlight Sessions', '2023-11-05 18:00:00', '2023-11-05 23:30:00', 135.00, 'An intimate
night of unforgettable performances', 'Residency', 5),
(22, 'Live Pulse Experience', '2023-11-17 15:30:00', '2023-11-17 21:30:00', 125.00, 'Feel the
heartbeat of live entertainment', 'Concert', 1),
(23, 'Winter Sound Fest', '2023-12-02 13:00:00', '2023-12-02 22:00:00', 190.00, 'Celebrate the
season with spectacular music', 'Festival', 8),
(24, 'Final Encore', '2023-12-14 18:00:00', '2023-12-14 23:59:00', 160.00, 'Close the year with
an unforgettable finale', 'Concert', 6),
(25, 'Starlight Residency', '2023-12-28 17:00:00', '2023-12-28 22:30:00', 150.00, 'A dazzling
residency performance for devoted fans', 'Residency', 2);

--Values for Artist table--
INSERT INTO Artist (Artist_id, Artist_name, Genre, District)
VALUES
(1, 'Selena_Gomez', 'Pop', 'California'),
(2, 'Drake', 'Hip-Hop', 'California'),
(3, 'Taylor_Swift', 'Pop', 'Tennessee'),
(4, 'The_Weeknd', 'R&B', 'California'),
(5, 'Kendrick_Lamar', 'Hip-Hop', 'California'),
(6, 'Billie_Eilish', 'Alternative', 'California'),
(7, 'Bad_Bunny', 'Reggaeton', 'Florida');

--Values for Show_Artist table--
INSERT INTO Show_Artist (Shows_id, Artist_id, Performance_time)
VALUES
(1, 1, 3.17),
(2, 2, 4.50),
(3, 7, 6.00),
(4, 4, 5.25),
(5, 3, 5.00),
(6, 5, 6.00),
(7, 6, 4.50),
(8, 1, 7.00),
(9, 2, 5.00),
(10, 3, 5.00),
(11, 5, 6.00),
(12, 7, 10.50),
(13, 4, 5.98),
(14, 6, 4.50),
(15, 1, 6.00),
(16, 2, 10.00),
(17, 5, 4.00),
(18, 7, 5.75),
(19, 4, 6.00),
(20, 3, 8.00),
(21, 6, 5.50),
(22, 1, 6.00),
(23, 2, 9.00),
(24, 5, 5.98),
(25, 7, 5.50);