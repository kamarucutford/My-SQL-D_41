-- Stored Procedure to Add a New Record to the Worker Table

DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

-- Procedure call example
CALL AddWorker(12, 'Peter', 'Sam', 57000, '2024-11-12 09:00:00', 'Engineering');
select * from Worker;

-- Stored Procedure to Retrieve Salary of a Worker by ID

DELIMITER $$

CREATE PROCEDURE GetSalaryByWorkerId(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Procedure call example
CALL GetSalaryByWorkerId(11, @v_Salary);
SELECT @v_Salary AS Salary;

-- Stored Procedure to Update Department of a Worker by Worker ID

DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Procedure call example
CALL UpdateWorkerDepartment(5, 'HR');

--  Stored Procedure to Retrieve the Number of Workers in a Given Department

DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;

-- Procedure call example
CALL GetWorkerCountByDepartment('Engineering', @v_WorkerCount);
SELECT @v_WorkerCount AS WorkerCount;

-- Stored Procedure to Retrieve the Average Salary of Workers in a Given Department

DELIMITER $$

CREATE PROCEDURE GetAvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;

-- Procedure call example
CALL GetAvgSalaryByDepartment('Engineering', @v_AvgSalary);
SELECT @v_AvgSalary AS AvgSalary;





