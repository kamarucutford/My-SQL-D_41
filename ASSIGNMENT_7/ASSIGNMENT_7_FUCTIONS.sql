-- Added a new column called DOB in the Persons table
ALTER TABLE Persons
ADD DOB DATE;
-- user-defined function to calculate age using DOB

DELIMITER //
CREATE FUNCTION CalculateAge(DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN YEAR(CURDATE()) - YEAR(DOB) - 
           (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(DOB, '%m%d'));
END;
//
DELIMITER ;

-- select query to fetch the Age of all persons using the function
SELECT Id, Fname, Lname, CalculateAge(DOB) AS Age
FROM Persons;

-- Finded the length of each country name in the Country table
SELECT Country_name, LENGTH(Country_name) AS Name_Length
FROM Country;

-- Extracted the first three characters of each country's name in the Country table

SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;

-- Converted all country names to uppercase and lowercase in the Country table
-- UPPERCASE
SELECT Country_name, UPPER(Country_name) AS Uppercase_Name
FROM Country;
 
 -- LOWER CASE
 SELECT Country_name, LOWER(Country_name) AS Lowercase_Name
FROM Country;



















