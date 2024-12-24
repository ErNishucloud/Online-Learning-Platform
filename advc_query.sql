-- Create a table for enrollment logs
CREATE TABLE EnrollmentLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT,
    StudentID INT,
    LogDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add a trigger to log enrollments
DELIMITER $$
CREATE TRIGGER AfterEnrollment
AFTER INSERT ON Enrollments
FOR EACH ROW
BEGIN
    INSERT INTO EnrollmentLog (CourseID, StudentID)
    VALUES (NEW.CourseID, NEW.StudentID);
END$$
DELIMITER ;

-- Enroll a new student
INSERT INTO Enrollments (CourseID, StudentID)
VALUES (2, 3); -- Alice Johnson enrolled in Data Science


-- Check the log
SELECT * FROM EnrollmentLog;
