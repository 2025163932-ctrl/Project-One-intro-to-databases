--List each show along with all artists--
SELECT 
    Show_name AS Show,
    Venue_name AS Venue,
    Address,
    Artist_name AS Artist
FROM Shows
	JOIN Venue 
		ON Shows.Venue_id = Venue.Venue_id
	JOIN Show_Artist 
		ON Shows.Shows_id = Show_Artist.Shows_id
	JOIN Artist 
		ON Show_Artist.Artist_id = Artist.Artist_id;

--Idenify any overlapping--
SELECT 
    s1.Show_name AS ShowOne,
    s2.Show_name AS ShowTwo
FROM Shows s1, Shows s2
    WHERE s1.Venue_id = s2.Venue_id
        AND s1.Shows_id < s2.Shows_id
        AND s1.Start_date <= s2.End_date
        AND s2.Start_date <= s1.End_date;

--Find most expensive show and list all artist that where in it--
SELECT 
    Show_name AS Show,
    Price,
    Artist_name AS Artist
FROM Shows
    JOIN Show_Artist 
        ON Shows.Shows_id = Show_Artist.Shows_id
    JOIN Artist 
        ON Show_Artist.Artist_id = Artist.Artist_id
    WHERE Price = (SELECT MAX(Price) FROM Shows);

--Find the venue that on average hosted expensive shows--
SELECT 
    Venue_name AS Venue,
    AVG(Price) AS HighestAveragePrice
FROM Shows
    JOIN Venue 
        ON Shows.Venue_id = Venue.Venue_id
    GROUP BY Venue_name
    ORDER BY AVG(Price) DESC
    LIMIT 1;

--list shows along with total number of artist performing in the shows--
SELECT 
    Show_name AS Show,
    COUNT(Artist_id) AS NumberOfArtist
FROM Shows
    LEFT JOIN Show_Artist 
        ON Shows.Shows_id = Show_Artist.Shows_id
    GROUP BY Show_name;