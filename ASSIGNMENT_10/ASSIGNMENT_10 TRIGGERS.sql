-- Created the teachers table and insert 8 rows

CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(100),
    experience INT,
    salary DECIMAL(10, 2)
);

-- Inserting 8 rows
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice Johnson', 'Math', 5, 50000.00),
('Bob Smith', 'Physics', 8, 60000.00),
('Charlie Brown', 'Chemistry', 12, 70000.00),
('David White', 'Biology', 4, 45000.00),
('Eva Green', 'English', 6, 48000.00),
('Frank Black', 'History', 15, 65000.00),
('Grace Blue', 'Art', 3, 42000.00),
('Helen Red', 'Geography', 10, 55000.00);
select * from teachers;

-- Created a before_insert_teacher trigger to raise an error if salary is negative

DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'salary cannot be negative';
    END IF;
END $$

DELIMITER ;

INSERT INTO teachers (name, subject, experience, salary) VALUES ('John Johnson', 'Math', 5, -50000.00);

-- Created an after_insert_teacher trigger to log the action in the teacher_log table


CREATE TABLE teacher_log (
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;

-- Created a before_delete_teacher trigger to raise an error if experience > 10 years

DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with experience greater than 10 years';
    END IF;
END $$

DELIMITER ;

--  Created an after_delete_teacher trigger to log the deletion action

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$

DELIMITER ;

select * from teachers;
















