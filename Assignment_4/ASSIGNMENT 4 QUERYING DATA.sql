CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT);

-- Created the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id));
    
    -- Inserted 10 rows into the Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833517),
(2, 'Portugal', 37742154, 9984670),
(3, 'India', 1380004385, 3287263),
(4, 'Australia', 25687041, 7692024),
(5, 'United Kingdom', 67886011, 243610),
(6, 'Poland', 83783942, 357022),
(7, 'Germany', 65273511, 551695),
(8, 'Brazil', 212559417, 8515767),
(9, 'Argentina', 60244639, 301340),
(10, 'Japan', 126476461, 377975);
select * from persons;

-- Insert 10 rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'Sudhakaran', 'thekkedathil', 331000000, 4.5, 1, 'USA'),
(2, 'Phillip', 'Monkey', 37742154, 4.8, 2, 'Portugal'),
(3, 'Ravi', 'Sharma', 1380004385, 4.2, 3, 'India'),
(4, 'Peter', 'PArker', 25687041, 4.9, 4, 'Australia'),
(5, 'Michael', 'Jackson', 67886011, 3.5, 5, 'UK'),
(6, 'Sarah', 'Johnson', 83783942, 4.1, 6, 'Germany'),
(7, 'David', 'Williams', 65273511, 4.7, 7, 'Poland'),
(8, 'Linda', 'Martinez', 212559417, 4.0, 8, 'Brazil'),
(9, 'Chris', 'Davis', 60244639, 4.6, 9, 'Argentina'),
(10, 'Anna', 'Wilson', 126476461, 5.0, 10, 'Japan');

-- Listed the distinct country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;
--  Selected first names and last names from the Persons table with aliases
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;
--  Finded all persons with a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;

--  Finded countries with a population greater than 10 lakhs 
SELECT * FROM Country WHERE Population > 1000000;

--  Finded persons who are from 'USA' or have a rating greater than 4.5
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

-- Finded all persons where the country name is NULL
SELECT * FROM Persons WHERE Country_name IS NULL;

-- Finded all persons from the countries 'USA', 'Canada', and 'UK'
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

-- Finded all persons not from the countries 'India' and 'Australia'
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

--  Finded all countries with a population between 5 lakhs and 20 lakhs
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

-- Finded all countries whose names do not start with 'C'
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';

