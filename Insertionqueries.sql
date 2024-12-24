-- Insert users
INSERT INTO Users (FirstName, LastName, Email, Password, Role)
VALUES 
('John', 'Doe', 'john.doe@example.com', 'password123', 'Student'),
('Jane', 'Smith', 'jane.smith@example.com', 'securepassword', 'Instructor'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'mypassword', 'Student'),
('Robert', 'Brown', 'robert.brown@example.com', 'adminpass', 'Admin');

-- Insert courses
INSERT INTO Courses (CourseName, Description, InstructorID)
VALUES
('Python for Beginners', 'Learn the basics of Python programming.', 2),
('Data Science Fundamentals', 'An introduction to data science concepts.', 2);

-- Enroll students in courses
INSERT INTO Enrollments (CourseID, StudentID)
VALUES
(1, 1), -- John Doe enrolled in Python
(1, 3), -- Alice Johnson enrolled in Python
(2, 1); -- John Doe enrolled in Data Science

-- Insert assignments
INSERT INTO Assignments (CourseID, Title, DueDate)
VALUES
(1, 'Python Basics Quiz', '2024-11-30'),
(2, 'Data Analysis Project', '2024-12-15');

-- Insert submissions
INSERT INTO Submissions (AssignmentID, StudentID, SubmissionDate, Grade)
VALUES
(1, 1, '2024-11-28', 85.5), -- John Doe's submission
(1, 3, '2024-11-29', 92.0); -- Alice Johnson's submission

