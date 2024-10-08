-- Create Database
CREATE DATABASE School;

-- Use the School Database
USE School;

-- Create the STUDENTS table
CREATE TABLE STUDENTS (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(15),Marks INT,Grade CHAR(2));

-- Inserting  data into STUDENT
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES(1, 'Ashkar', 92, 'A'),(2, 'Bhaskaran', 80, 'B'),(3, 'Sumesh', 54, 'D'),(4, 'David', 65, 'C');
select * from students;

-- Add a Contact column to the STUDENTS table
ALTER TABLE STUDENT ADD COLUMN Contact VARCHAR(15);

-- Removing the Grade column from the STUDENTS table
ALTER TABLE STUDENTS DROP COLUMN Grade;

-- Renaming the STUDENTS table to CLASSTEN
ALTER TABLE STUDENTS RENAME TO CLASSTEN;
select * from CLASSTEN;

-- Deleting all rows from the CLASSTEN table
TRUNCATE TABLE CLASSTEN;
select * from CLASSTEN;

-- Removing the CLASSTEN table from the database
DROP TABLE CLASSTEN;
