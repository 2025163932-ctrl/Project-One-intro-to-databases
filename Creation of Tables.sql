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
	Start_date TIMESTAMP,
	End_date TIMESTAMP,
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