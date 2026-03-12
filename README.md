# CMPS1171 Project 1 – Show Management System

## Project Overview

This project implements a PostgreSQL database system designed to manage musical shows, venues, and artists. The system treats shows as the central entity, allowing users to track performers, venue information, ticket prices, and scheduling details.

The database demonstrates the use of relational database concepts, including primary keys, foreign keys, referential integrity, and many-to-many relationships. SQL queries are used to retrieve meaningful information from the database such as identifying overlapping shows, determining the most expensive show, and counting the number of artists performing in each event.

---

## Database Structure

The system consists of four main tables:

### Venue

Stores information about locations where shows take place.

Attributes:

* Venue_id (Primary Key)
* Venue_name
* Address
* Phone
* District
* Indoor

---

### Shows

Stores information about individual performances or events.

Attributes:

* Shows_id (Primary Key)
* Show_name
* Start_date
* End_date
* Price
* Description
* Event_type
* Venue_id (Foreign Key referencing Venue)

Each show is linked to a specific venue.

---

### Artist

Stores information about performers participating in shows.

Attributes:

* Artist_id (Primary Key)
* Artist_name
* Genre
* District

---

### Show_Artist

This is a bridge table that manages the many-to-many relationship between shows and artists.

Attributes:

* Shows_id (Foreign Key referencing Shows)
* Artist_id (Foreign Key referencing Artist)
* Performance_time

Primary Key:

* (Shows_id, Artist_id)

This structure allows multiple artists to perform at one show and allows an artist to perform at multiple shows.

---

## Repository Structure

The repository contains one file that has two part in it:

### 1. setup.sql

This file contains all SQL commands used to create and populate the database, including:

* CREATE TABLE statements
* Primary and foreign key constraints
* INSERT statements used to populate the tables with sample data

---

### 2. queries.sql

This file contains the SQL queries required for Task 4 of the project.

Queries implemented:

1. List each show with all participating artists and venue details.
2. Identify overlapping shows occurring at the same venue and time range.
3. Find the most expensive show and list all artists performing in it.
4. Determine the venue that hosted shows with the highest average ticket price.
5. List all shows along with the total number of artists performing in each show.

---

## Technologies Used

* pgAdmin 4
* GitHub for version control

---

## Team Members

* Samta Sandhu
* Eddison Barrientos
* Ashley Kwok
* Ismael Teul
* Frederick Sardido

Course: **CMPS1171 – Introduction to Databases**


