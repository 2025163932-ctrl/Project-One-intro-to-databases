--List each show along with all artists--
SELECT  s.Shows_id, s.Show_name, v.Venue_name, v.Address, a.Artist_name
FROM Shows s
    JOIN Venue v ON s.Venue_id = v.Venue_id
    JOIN Show_Artist sa ON s.Shows_id = sa.Shows_id
    JOIN Artist a ON sa.Artist_id = a.Artist_id
    ORDER BY s.Show_name;

--Idenify any overlapping--
SELECT s1.Show_name AS Show1, s2.Show_name AS Show2, s1.Venue_id
FROM Shows s1
    JOIN Shows s2 
    ON s1.Venue_id = s2.Venue_id
    AND s1.Shows_id < s2.Shows_id
    AND s1.Start_date <= s2.End_date
    AND s2.Start_date <= s1.End_date;

--Find most expensive show and list all artist that where in it--
SELECT s.Show_name, s.Price, a.Artist_name
FROM Shows s
    JOIN Show_Artist sa ON s.Shows_id = sa.Shows_id
    JOIN Artist a ON sa.Artist_id = a.Artist_id
    WHERE s.Price = (SELECT MAX(Price) FROM Shows);
--Find the venue that on average hosted expensive shows--
SELECT v.Venue_name, AVG(s.Price) AS AveragePrice
FROM Shows s
    JOIN Venue v ON s.Venue_id = v.Venue_id
    GROUP BY v.Venue_name
    ORDER BY AveragePrice DESC
    LIMIT 1;

--list shows along with total number of artist performing in the shows--
SELECT s.Show_name, COUNT(sa.Artist_id) AS Total_artists
FROM Shows s
LEFT JOIN Show_Artist sa ON s.Shows_id = sa.Shows_id
GROUP BY s.Show_name
ORDER BY s.Show_name;