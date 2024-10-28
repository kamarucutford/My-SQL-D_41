-- Inner Joins
SELECT p.Fname, p.Lname, c.Country_name FROM Persons p INNER JOIN Country c ON p.Country_Id = c.Id;

-- Left Joins
SELECT p.Fname, p.Lname, c.Country_name FROM Persons p
LEFT JOIN Country c ON p.Country_Id = c.Id;

-- Right Joins
SELECT p.Fname, p.Lname, c.Country_name
FROM Persons p RIGHT JOIN Country c ON p.Country_Id = c.Id;

-- Listed all distinct country names from both Country and Persons Tables
SELECT DISTINCT Country_name FROM Country UNION
SELECT DISTINCT Country_name FROM Persons;

-- Listed all country names from both the Country and Persons tables, including duplicates.
SELECT Country_name FROM Country UNION ALL SELECT Country_name FROM Persons;

-- Rounded the ratings of all persons to the nearest integer in the Persons table.

SELECT Id, Fname, Lname, Population, ROUND(Rating) AS
 RoundedRating, Country_Id, Country_name FROM Persons;
