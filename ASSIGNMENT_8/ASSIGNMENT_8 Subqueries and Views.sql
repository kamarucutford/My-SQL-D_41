-- Finded the number of persons in each country

SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons GROUP BY Country_name;

-- Find the number of persons in each country storted from high  to low

SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons GROUP BY Country_name ORDER BY Number_of_Persons DESC;

-- Finded average rating for persons in respective countries if the average is greater than 3.0

SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons GROUP BY Country_name HAVING Average_Rating > 3.0;

-- Finded the Countries with the Same Rating as the USA (Using Subqueries)

SELECT DISTINCT Country_name FROM Persons WHERE Rating = (SELECT AVG(Rating) FROM Persons WHERE Country_name = 'USA');

-- Selected All Countries Whose Population Is Greater Than the Average Population of All Nations

SELECT * FROM Country WHERE Population > (SELECT AVG(Population) FROM Country);

----------------------------------------------------------------------------------------------------

-- Createed Product database
CREATE DATABASE Product;

-- Useed the Product database

USE Product;

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
desc customer;

-- inserted 10 fields to customer table
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St', 'Los Angeles', 'CA', '90001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak St', 'New York', 'NY', '10001', 'USA'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', '789 Pine St', 'Chicago', 'IL', '60007', 'USA'),
(4, 'Bob', 'Williams', 'bob.williams@example.com', '456-789-0123', '321 Maple St', 'Houston', 'TX', '77001', 'USA'),
(5, 'Charlie', 'Brown', 'charlie.brown@example.com', '567-890-1234', '654 Cedar St', 'Phoenix', 'AZ', '85001', 'USA'),
(6, 'Emily', 'Davis', 'emily.davis@example.com', '678-901-2345', '987 Spruce St', 'Philadelphia', 'PA', '19019', 'USA'),
(7, 'Frank', 'Garcia', 'frank.garcia@example.com', '789-012-3456', '159 Birch St', 'San Antonio', 'TX', '78201', 'USA'),
(8, 'Grace', 'Martinez', 'grace.martinez@example.com', '890-123-4567', '753 Willow St', 'San Diego', 'CA', '92101', 'USA'),
(9, 'Hannah', 'Lopez', 'hannah.lopez@example.com', '901-234-5678', '852 Palm St', 'Dallas', 'TX', '75201', 'USA'),
(10, 'Isaac', 'Wilson', 'isaac.wilson@example.com', '012-345-6789', '963 Fir St', 'Austin', 'TX', '73301', 'USA');

select * from customer;

-- Created a view named customer_info for the Customer table that displays Customer’s Full name and email address

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email FROM Customer;

-- Performed SELECT operation for customer_info view
SELECT * FROM customer_info;

-- Created a view named US_Customers that displays customers located in the US
CREATE VIEW US_Customers AS
SELECT * FROM Customer WHERE Country = 'USA';
select * from us_customers;

-- Created another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State FROM Customer;
select * from customer_details;

--  Updated phone numbers of customers who live in California for Customer_details view

UPDATE Customer_details
SET Phone_no = 'CALIFORNIA-UPDATED-NUMBER' WHERE State = 'CA';

--  Counted the number of customers in each state and show only states with more than 5 customers.

SELECT State, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- Writed a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.

SELECT State, COUNT(*) AS Customer_Count
FROM Customer_details
GROUP BY State;

-- Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

SELECT *
FROM Customer_details
ORDER BY State ASC;





