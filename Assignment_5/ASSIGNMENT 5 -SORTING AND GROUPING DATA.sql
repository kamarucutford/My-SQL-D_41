CREATE TABLE Country (Id INT PRIMARY KEY,Country_name VARCHAR(100),Population INT,Area INT);

CREATE TABLE Persons (Id INT PRIMARY KEY,Fname VARCHAR(100),Lname VARCHAR(100),Population INT,Rating DECIMAL(3,2),Country_Id INT,
    Country_name VARCHAR(100),FOREIGN KEY (Country_Id) REFERENCES Country(Id));
    
--  Inserted Rows into Country Table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'India', 3000000, 100000),(2, 'Syria', 5000000, 200000),(3, 'Pakistan', 7000000, 150000),
(4, 'Poland', 2000000, 50000),(5, 'England', 6000000, 120000),(6, 'France', 8000000, 300000),
(7, 'Italy', 9000000, 250000),(8, 'Nepal', 4000000, 180000),(9, 'Iran', 3500000, 110000),(10, 'Japan', 4500000, 160000);
select * from Persons; 

-- Inserted Rows into Persons Table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Kurian', 250000, 4.5, 1, 'India'),(2, 'Soubhi', 'Borghol', 300000, 4.2, 2, 'Syria'),(3, 'Sarfaraz', 'Khan', 150000, 3.8, 3, 'Pakistan'),
(4, 'Subhash', 'Raj', 200000, 4.7, 1, 'India'),(5, 'Eyad', NULL, 180000, 4.0, 2, 'Syria'),(6, 'Alice', 'White', 120000, 3.5, 4, 'Poland'),
(7, 'Peter', NULL, 50000, 2.0, 5, 'England'),(8, 'Anna', 'Biji', 70000, 5.0, 1, 'India'),(9, 'Lufi', 'One', 90000, 4.3, 3, 'Japan'),
(10, 'Maria', 'Ahmad', 220000, 4.8, 2, 'Syria');

-- Printed the first three characters of Country_name from the Country table
SELECT SUBSTRING(Country_name, 1, 3) AS FirstThreeChars FROM Country;
-- Concatenated first name and last name from Persons table.
SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;
-- Counted the number of unique country names from Persons table.
SELECT COUNT(DISTINCT Country_name) AS UniqueCountryCount FROM Persons;
-- Printed the maximum population from the Country table.
SELECT MAX(Population) AS MaxPopulation FROM Country;
-- Printed the minimum population from Persons table.
SELECT MIN(Population) AS MinPopulation FROM Persons;
-- Inserted 2 new rows to Persons table making the Lname NULL
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Kinia', NULL, 60000, 3.0, 6, 'Poland'),(12, 'Aby', NULL, 85000, 4.1, 7, 'Japan');
-- Counted Lname from Persons table.
SELECT COUNT(Lname) AS LnameCount FROM Persons;
-- Finded the number of rows in the Persons table.
SELECT COUNT(*) AS TotalRows FROM Persons;
-- Showed the population of the Country table for the first 3 rows
SELECT Population FROM Country LIMIT 3;
-- Printed 3 random rows of countries
SELECT * FROM Country ORDER BY RAND() LIMIT 3;
-- Listed all persons ordered by their rating in descending order
SELECT * FROM Persons ORDER BY Rating DESC;
-- Finded the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name;
-- Finded countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name 
HAVING Total_Population > 50000;
-- List the total number of persons and average rating for each country, but only for countries, 
-- with more than 2 persons, ordered by the average rating in ascending order.
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating FROM Persons GROUP BY Country_name 
HAVING COUNT(*) > 2 ORDER BY Average_Rating ASC;


