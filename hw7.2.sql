--
-- Homework 7.2: SQL-DML
-- @author: kristopher card, 6085743
-- NAU, CS 345, Spring 2024
--

--
-- DDL Statements
-- --------------
-- 
-- drop the database
DROP DATABASE IF EXISTS airline_db;
-- create the database
CREATE DATABASE IF NOT EXISTS airline_db;
-- select airline_db as the context
USE airline_db;
-- create the table Pilot
CREATE TABLE Pilot (
    identification INT PRIMARY KEY NOT NULL,
    pilot_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2),
    gratification DECIMAL(10, 2),
    airline_name VARCHAR(30),
    country VARCHAR(15)
);
-- create the table Airport
CREATE TABLE Airport(acronym VARCHAR(3) PRIMARY KEY NOT NULL,
                    airport_name VARCHAR(100) NOT NULL,
                    city VARCHAR(50),
                    country VARCHAR(15));
-- create the table Flight
CREATE TABLE Flight(flight_number VARCHAR(6) PRIMARY KEY NOT NULL,
                    departure_airport VARCHAR(3) NOT NULL,
                    destination_airport VARCHAR(3) NOT NULL,
                    departure_time TIME,
                    FOREIGN KEY (departure_airport) REFERENCES 
						Airport(acronym) ON DELETE CASCADE,
                    FOREIGN KEY (destination_airport) REFERENCES 
						Airport(acronym) ON DELETE CASCADE);
-- create the table Stopover
CREATE TABLE Stopover(flight_number VARCHAR(6) NOT NULL,
                    flight_date DATE NOT NULL,
                    pilot_id INT NOT NULL,
                    aircraft VARCHAR(30),
                    PRIMARY KEY(flight_number, flight_date),
                    FOREIGN KEY (flight_number) REFERENCES 
						Flight(flight_number) ON DELETE CASCADE,
                    FOREIGN KEY (pilot_id) REFERENCES Pilot(identification) ON 
						DELETE CASCADE
);

-- IMPORTANT NOTE: add the DDL statements here. After Module's 4 assignment 
-- deadline has passed, the statements to be added here will be provided on 
-- Canvas.

--
-- DML Statements
-- --------------
-- 
insert into Pilot values
	(279, "Steven Grant Rogers", 30000.00, 500.00, "American Airlines", "USA"),
    (627, "Wanda Maximoff", 30000.00, 500.00, "American Airlines", "USA"),
    (947, "Natasha Romanoff", 25000.00, 800.00, "United", "USA"),
    (463, "Anthony Edward Stark", 20000.00, 800.00, "United", "USA"),
    (839, "Robert Bruce Banner", 35000.00, 500.00, "American Airlines", "USA"),
    (628, "Carol Susan Jane Danvers", 30000.00, 500.00, "Air France", "France"),
    (832, "Clinton Francis Barton", 20000.00, 800.00, "Air Canada", "Canada"),
    (602, "Stephen Vincent Strange", 25000.00, 800.00, "Air Canada", "Canada"),
    (633, "Victor Shade", 28000.00, 600.00, "Air France", "France"),
    (382, "Jessica Jones", 35000.00, 700.00, "Japan Airlines", "Japan"),
    (489, "Clark Joseph Kent", 29000.00, 500.00, "American Airlines", "USA"),
    (847, "Oliver Jonas Queen", 32000.00, 400.00, "Air Canada", "Canada"),
    (932, "Wade Winston Wilson", 35000.00, 200.00, "Air France", "France"),
    (887, "Stephen Vincent Strange", 29000.00, 500.00, "Japan Airlines", "Japan");

insert into Airport values
    ("LAS", "Harry Reid International Airport", "Las Vegas", "USA"),
    ("PHX", "Phoenix Sky Harbor Airport", "Phoenix", "USA"),
    ("DFW", "Dallas Fort Worth Airport", "Dallas", "USA"),
    ("IAH", "George Bush Intercontinental Airport", "Houston", "USA"),
    ("LAX", "Los Angeles International Airport", "Los Angeles", "USA"),
    ("GRU", "Guarulhos International Airport", "Guarulhos", "Brazil"),
    ("BSB", "Presidente Juscelino Kubitschek International Airport", "Brasilia",
		"Brazil"),
    ("MAO", "Eduardo Gomes International Airport", "Manaus", "Brazil"),
    ("CDG", "Aéroport Paris-Charles de Gaulle", "Paris", "France"),
    ("LYS", "Aéroport Lyon Saint-Exupéry", "Lyon", "France"),
    ("MRS", "Marseille Provence Airport", "Marselha", "France");

insert into Flight values
    ("RG230", "LAX", "PHX", "23:05"),
    ("PR231", "IAH", "LAS", "12:15"),
    ("TG331", "DFW", "LAX", "17:22"),
    ("AV431", "PHX", "GRU", "02:10"),
    ("KI356", "IAH", "MAO", "23:55"),
    ("OD468", "BSB", "LAX", "11:45"),
    ("PS324", "PHX", "GRU", "22:19"),
    ("OO677", "GRU", "DFW", "18:52"),
    ("TW873", "GRU", "LYS", "18:52"),
    ("IE832", "LYS", "MRS", "04:40"),
    ("JD646", "CDG", "LYS", "05:00"),
    ("MD342", "CDG", "BSB", "08:34"),
    ("UJ658", "LAS", "IAH", "08:34"),
    ("GF774", "LAS", "DFW", "08:34");

insert into Stopover values
    ("RG230", "2022-12-30", 279, "Boeing 747"),
    ("RG230", "2022-09-24", 628, "Boeing 747"),
    ("PR231", "2022-08-15", 279, "Airbus A380"),
    ("PR231", "2022-01-12", 947, "Airbus A380"),
    ("TG331", "2022-02-05", 947, "Boeing 747"),
    ("TG331", "2022-01-12", 627, "Airbus A380"),
    ("AV431", "2022-12-04", 463, "Embraer 195"),
    ("AV431", "2022-10-30", 839, "Airbus A380"),
    ("KI356", "2022-09-07", 463, "Embraer 195"),
    ("KI356", "2022-08-13", 463, "Embraer 175"),
    ("OD468", "2022-03-13", 839, "Airbus A330"),
    ("OD468", "2022-04-01", 839, "Airbus A330"),
    ("OD468", "2022-04-02", 839, "Airbus A330"),
    ("PS324", "2022-03-15", 627, "Airbus A320"),
    ("PS324", "2022-03-18", 627, "Embraer 195"),
    ("OO677", "2022-02-09", 832, "Embraer 195"),
    ("OO677", "2022-02-01", 832, "Boeing 797"),
    ("TW873", "2022-12-11", 602, "Boeing 797"),
    ("TW873", "2022-11-17", 633, "Boeing 797"),
    ("IE832", "2022-05-17", 633, "Embraer 195"),
    ("IE832", "2022-08-16", 602, "Embraer 175"),
    ("JD646", "2022-09-27", 602, "Embraer 175"),
    ("JD646", "2022-09-29", 832, "Airbus A320"),
    ("MD342", "2022-09-29", 382, "Airbus A320"),
    ("MD342", "2022-10-31", 382, "Airbus A330"),
    ("UJ658", "2022-03-30", 633, "Boeing 797"),
    ("UJ658", "2022-02-25", 279, "Boeing 797"),
    ("GF774", "2022-01-22", 602, "Boeing 747"),
    ("GF774", "2022-01-12", 633, "Boeing 747");
-- IMPORTANT NOTE: add the DML statements here. After Homework 6 deadline has 
-- passed, the statements to be added here will be provided on Canvas (same
-- script used in hw7-1).


--
-- DQL Statements
-- --------------
--
-- Output 1: pilot's total income (salary + gratification) for pilots with
-- flight date before 2022-11-14
-- ------------------------------------------------------------------------
-- Selecting the distinct identification, pilot name, and total earnings using (+)
-- in the pilot table on the condition that they had a flight before the given
-- date by joining the stopover table with an on clause 
-- AI prompt: none used

SELECT DISTINCT identification, pilot_name, (p.salary + p.gratification) 
FROM Pilot p INNER JOIN Stopover 
ON identification=pilot_id AND flight_date < "2022-11-14";

--
-- Output 2: airport info for flight RG230
-- ---------------------------------------
-- Selecting the city and country of the airport for the destination 
-- of the flight RG230
-- AI prompt: none used

SELECT city, country FROM Airport 
INNER JOIN Flight ON acronym=destination_airport AND flight_number = "RG230";

--
-- Output 3: airlines of pilots who flew on 2022-01-12
-- ---------------------------------------------------
-- Selecting the name of a pilots airline if they flew on the given date
-- by INNER Joining the stopover table 
-- AI prompt: none used

SELECT airline_name FROM Pilot INNER JOIN Stopover
ON identification=pilot_id AND flight_date = "2022-01-12";

--
-- Output 4: detailed stopover information
-- ---------------------------------------
-- Selecting only distinct rows that give the pilot, aircraft, and airline
-- for a given flight 
-- AI prompt: none used

SELECT DISTINCT flight_number, pilot_name, aircraft, airline_name FROM Stopover
INNER JOIN Pilot ON identification=pilot_id
ORDER BY flight_number ASC, pilot_name DESC;

--
-- Output 5: detailed stopover information for airlines with pilots from
-- outside the USA
-- ---------------------------------------------------------------------
-- 
-- AI prompt: none used

SELECT DISTINCT flight_number, pilot_name, aircraft, airline_name FROM Stopover
INNER JOIN Pilot ON identification=pilot_id AND country != "USA"
ORDER BY flight_number ASC, pilot_name DESC;

--
-- Output 6: pilot's name with flight information, if any
-- ------------------------------------------------------
-- Using left join to preserve the NULL values for the pilots that did not fly, 
-- then outputting all the pilots and the flight information for all their flights
-- AI prompt: none used
 
SELECT DISTINCT pilot_name, flight_number, flight_date FROM Pilot
LEFT JOIN Stopover ON identification=pilot_id; 

--
-- Output 7: flights that departure in the morning (0-11) OR in January
-- (month 01)
-- --------------------------------------------------------------------
-- Using the LIKE operator to get all the flights in january and the BETWEEN
-- operator to get all the flights in the morning, and outputting their 
-- flight numbers
-- AI prompt: none used

SELECT DISTINCT flight_number FROM Flight NATURAL JOIN Stopover
WHERE flight_date LIKE '____-01-__' OR departure_time BETWEEN '00:00' AND '11:00';
-- the output sample in Canvas invcludes OD468, even though that flight is after 
-- 11 and is not in january

--
-- Output 8: Canadian pilots who have flown three or more flights in
-- order of salary
-- ------------------------------------------------------------------
-- Using Count and Avg to get the total flight numbers and average salaies of the pilots
-- then filtering out by only pilots with 3 or more flights who are canadian, 
-- in descending order by salary 
-- AI prompt: none used

SELECT pilot_name, COUNT(flight_number) total_flights, AVG(salary) avg_salary
FROM Pilot INNER JOIN Stopover ON identification=pilot_id WHERE country = "Canada"
GROUP BY pilot_name HAVING total_flights >= 3 
ORDER BY avg_salary DESC;

-- ------------------------------------------------------
-- THE FOLLOWING STATEMENTS REQUIRE AT LEAST ONE SUBQUERY 
-- ------------------------------------------------------

--
-- Output 9: flight information for flights to Brazil or France
-- ------------------------------------------------------------
-- Joining the Airport and Stopover tables into the Flight table alter
-- and outputting the results for flights to Brazil and France
-- AI prompt: none used

SELECT DISTINCT flight_number, country, departure_time, flight_date 
FROM Flight INNER JOIN Airport ON acronym=destination_airport
NATURAL JOIN STOPOVER
WHERE country = "Brazil" OR country = "France" 
ORDER BY country ASC;

--
-- Output 10: pilot information for pilots in Wanda Maximoff's
-- airline
-- -----------------------------------------------------------
-- Selecting pilot names and airlines using a subquery to alias it as 
-- Wanda Maximoff's Airlines
-- AI prompt: none used

SELECT pilot_name, airline_name FROM 
	(SELECT pilot_name, airline_name FROM Pilot 
    WHERE airline_name = "American Airlines")
AS Wanda_Maximoffs_airline;

--
-- Output 11: airlines that have France as a destination
-- -----------------------------------------------------
-- Selecting Distinct airline names that have a destination airport in France 
-- using INNER JOIN and a subquery WHERE statment 
-- AI prompt: none used

SELECT DISTINCT airline_name FROM Pilot 
INNER JOIN Flight ON destination_airport IN 
	(SELECT destination_airport FROM Flight
    WHERE destination_airport = "CDG" 
    or destination_airport = "LYS" 
    or destination_airport = "MRS");


--
-- Output 12: American Airlines' destination airports
-- --------------------------------------------------
-- Joining flight with airport to output the flight_number, city, country, and 
-- airport name. Then joining the Pilot table to filter the results to only
-- american airlines
-- AI prompt: none used

SELECT DISTINCT flight_number, airport_name, city, country 
FROM Airport NATURAL JOIN Pilot INNER JOIN Flight  
WHERE airline_name = "American Airlines";

--
-- Output 13: destination of flights with more than two stopovers
-- --------------------------------------------------------------
-- Using COUNT to count the flights in stopover and outputting the name
-- of the airports with more than 2
-- AI prompt: none used

SELECT airport_name FROM Airport WHERE 
	(SELECT COUNT(flight_number) "stopovers" 
    FROM Stopover WHERE "stopovers" > 2);

--
-- Output 14: airports for flights on 2022-01-12
-- ---------------------------------------------
-- Natural Joining stopover into Flight to output only the information for the given day
-- AI prompt: none used

SELECT DISTINCT flight_number, departure_airport "departures", destination_airport "destination"
FROM Flight NATURAL JOIN Stopover 
WHERE flight_date = "2022-01-12";

--
-- Output 15: destination of United operated flights in Embraer
-- aircrafts
-- ------------------------------------------------------------
-- Using a subquery where to filter to United Airlines and output the flight
-- number, airport name, and city for their flights with the Embraer aircraft
-- AI prompt: none used

SELECT flight_number, airport_name, city FROM Stopover 
INNER JOIN Airport WHERE airline_name IN 
	(SELECT airline_name FROM Pilot
    WHERE airline_name = "United") AND aircraft = "Embraer";

--
-- Output 16: domestic flights
-- ---------------------------
-- I am not sure how to do this 
-- AI prompt: none used

SELECT DISTINCT flight_number, departure_time, country "departureCountry", country "departureCountry"
FROM Flight NATURAL JOIN Stopover INNER JOIN 
	(SELECT country FROM Airport) 
AS countries WHERE "departureCountry" = "USA" or "destinationCountry" = "USA";

--
-- Output 17: airports where American Airlines operates
-- ----------------------------------------------------
-- Selecting the airport name using a subquery to only choose ones associated 
-- with American Airlines
-- AI prompt: none used

SELECT airport_name FROM Airport WHERE EXISTS
	(SELECT airline_name FROM Pilot WHERE airline_name = "American Airlines");

--
-- Output 18: total income for pilots with the lowest gratification
-- -------------------------------------------------------------------
-- Using the subquery to find the pilot with the lowest gratification, 
-- and printing their total income along with their identification number
-- AI prompt: none used

SELECT identification, (salary + gratification) FROM Pilot
WHERE (SELECT MIN(gratification) FROM Pilot); 

--
-- Output 19: pilots who fly to their own country in Boing aircrafts
-- -------------------------------------------------------------------
-- Joining the Flight and Stopover tables along with a where clause to figure out
-- which pilots fly to their own country in a Boing 797 and printing their name and ID
-- AI prompt: none used

SELECT DISTINCT identification, pilot_name FROM Pilot 
INNER JOIN Flight 
INNER JOIN Stopover 
WHERE aircraft = "Boeing 797" AND destination_airport=country;

--
-- Output 20: international flights departing from the pilot's country
-- -------------------------------------------------------------------
-- Joining the flight and stopover tables combined with the where clasue to know which
-- pilots flew from their own country for non-domestic flights
-- AI prompt: none used

SELECT DISTINCT flight_number FROM Flight
NATURAL JOIN (SELECT departure_airport FROM Flight) AS flying_from
INNER JOIN (SELECT country FROM Pilot) AS pilots_country
WHERE departure_airport != departure_airport 
AND departure_airport=country;

--
-- Output 21:flight information for flights by American pilots with
-- greater salary than the average salaries of American pilots
-- -----------------------------------------------------------------
-- Using a subquery where clause to find the average salary and filter the pilots
-- by U.S pilots with an above average salary. Then outputting their flights
-- AI prompt: none used

SELECT DISTINCT flight_number, departure_time, aircraft FROM Stopover
NATURAL JOIN Flight  
WHERE (SELECT AVG(salary) "average" FROM Pilot
WHERE country = "USA" AND salary > "average");

--
-- Output 22: salaries per airlines who have pilots who have not flown
-- -------------------------------------------------------------------
-- Using a subquery in the Having clause to see which pilots have NULL flight numbers
-- and outputting their average salaries per airline
-- AI prompt: none used

SELECT airline_name, AVG(salary) FROM Pilot GROUP BY airline_name
HAVING (SELECT flight_number FROM Flight WHERE flight_number = NULL);

--
-- Output 23: airlines with the highest salary's average
-- -----------------------------------------------------
-- Getting the average salary and inputting it into the max to see which airline
-- has the highest average and outputting those values
-- AI prompt: none used

SELECT airline_name, AVG(salary) "average_salary" 
FROM Pilot GROUP BY airline_name
HAVING (SELECT MAX("average_salary") FROM Pilot);

--
-- end script
-- 