use sales;

-- Creating manager table

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL);

desc managers;

-- Inserting 10 rows to the table

INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'Ashok', 'Krish', '1980-01-15', 44, 'M', 'IT', 30000),
(2, 'Phillipe', 'David', '1975-06-23', 48, 'M', 'HR', 25000),
(3, 'Anaya', 'Kureshi', '1990-05-12', 34, 'F', 'Finance', 20000),
(4, 'Alan', 'Sam', '1982-09-30', 41, 'M', 'IT', 35000),
(5, 'Riya', 'Davis', '1995-11-11', 28, 'F', 'Marketing', 22000),
(6, 'Midhun', 'Thomas', '1978-04-05', 46, 'M', 'Finance', 27000),
(7, 'Shakeela', 'Jose', '1985-12-30', 38, 'F', 'IT', 32000),
(8, 'Sadanandan', 'Thekkedath', '1989-07-07', 35, 'M', 'HR', 24000),
(9, 'Sakeer', 'Hussain', '1983-03-15', 41, 'M', 'Finance', 26000),
(10, 'Athira', 'Krishnan', '1992-02-20', 32, 'F', 'Marketing', 23000);
Select * from managers;

-- Query to Retrieve Name and DOB of the Manager with manager_id_1

SELECT First_name, Last_Name, DOB FROM Managers WHERE Manager_Id = 1;

-- Query to Display the Annual Income of All Managers ( so need to multiply salary with 12 months)

SELECT First_name, Last_Name, (Salary * 12) AS Annual_Income FROM Managers;

-- Query to Display Records of All Managers Except 'Anaya’

SELECT * FROM Managers WHERE First_name != 'Anaya';

-- Query to Display Details of Managers Whose Department is IT and Earns More Than 25000 per Month

SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;

-- Query to Display Details of Managers Whose Salary is Between 10000 and 35000

SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;















