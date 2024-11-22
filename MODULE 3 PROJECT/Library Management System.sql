-- Created the Library Database

CREATE DATABASE library;
USE library;

-- Created the Branch Table
CREATE TABLE Branch (Branch_no INT PRIMARY KEY,
    Manager_Id INT,Branch_address VARCHAR(255),Contact_no VARCHAR(20));
-- Created the Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Created the Books Table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,Book_title VARCHAR(255),Category VARCHAR(50),Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),Author VARCHAR(100),Publisher VARCHAR(100));
-- Created the Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Created the IssueStatus Table
CREATE TABLE IssueStatus (Issue_Id INT PRIMARY KEY,Issued_cust INT,Issued_book_name VARCHAR(255),
    Issue_date DATE,ISBN_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN));
    
-- Created the ReturnStatus Table
CREATE TABLE ReturnStatus (Return_Id INT PRIMARY KEY,Return_cust INT,Return_book_name VARCHAR(255),Return_date DATE,
    ISBN_book2 VARCHAR(20),FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN));

desc branch;
desc employee; 
desc books; 
desc customer; 
desc issuestatus; 
desc returnstatus;

-- insert into branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES 
(1, 101, '123 Library St, City', '123-456-7890'),
(2, 102, '456 Book Ave, Town', '987-654-3210');

-- Inserted into Employee table:
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 
(201, 'Alice Johnson', 'Manager', 60000, 1),(202, 'Bob Smith', 'Librarian', 35000, 2),(203, 'Emma Davis', 'Manager', 55000, 2);

-- Inserted into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
('978-0-123456-47-2', 'The Great Adventure', 'Fiction', 20.99, 'yes', 'John Doe', 'ABC Publishers'),
('978-1-234567-89-7', 'History of SQL', 'Educational', 25.99, 'no', 'Jane Doe', 'XYZ Publishers'),
('978-0-987654-32-1', 'Modern Programming', 'Technology', 30.99, 'yes', 'Alice White', 'Tech Publishers');

-- Inserted into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(301, 'Charlie Brown', '789 Elm St, City', '2021-11-01'),
(302, 'David Green', '101 Pine Rd, Town', '2022-01-01'),
(303, 'Sarah Lee', '123 Maple St, City', '2023-06-15');

-- Inserted into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, ISBN_book)
VALUES 
(401, 301, 'The Great Adventure', '2023-10-15', '978-0-123456-47-2'),
(402, 302, 'History of SQL', '2023-06-01', '978-1-234567-89-7');

-- Inserted into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2)
VALUES 
(501, 301, 'The Great Adventure', '2023-11-01', '978-0-123456-47-2'),
(502, 302, 'History of SQL', '2023-08-10', '978-1-234567-89-7');

select * from branch;
select * from employee; 
select * from books; 
select * from customer; 
select * from issuestatus; 
select * from returnstatus;

-- Retrieved the book title, category, and rental price of all available books
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- Listed the employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- Retrieved the book titles and the corresponding customers who have issued those books
SELECT b.Book_title, c.Customer_name
FROM Books b
JOIN IssueStatus i ON b.ISBN = i.ISBN_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- Displayed the total count of books in each category
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

-- Retrieved the employee names and their positions for the employees whose salaries are above Rs.50,000
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- Listed the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT DISTINCT Issued_cust FROM IssueStatus);

-- Displayed the branch numbers and the total count of employees in each branch
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

-- Displayed the names of customers who have issued books in the month of June 2023
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Retrieved book_title from the book table containing "history"
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

--  Retrieved the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- Retrieved the names of employees who manage branches and their respective branch addresses
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';

-- Displayed the names of customers who have issued books with a rental price higher than Rs. 25:
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.ISBN_book = b.ISBN
WHERE b.Rental_Price > 25;
