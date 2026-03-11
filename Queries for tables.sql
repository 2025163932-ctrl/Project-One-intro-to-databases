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
    s1.Start_date,
    s1.End_date,
    s2.Start_date,
    s2.End_date
FROM Shows s1
JOIN Shows s2 
    ON s1.Shows_id < s2.Shows_id
WHERE s1.Start_date < s2.End_date
AND s1.End_date > s2.Start_date;


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