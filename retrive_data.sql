SELECT UserID, FirstName, LastName, Email, Role, DateJoined
FROM Users;

-- LIST ALL COURSES WITH THEIR INSTRUCTORS
SELECT 
    c.CourseID, 
    c.CourseName, 
    c.Description, 
    CONCAT(u.FirstName, ' ', u.LastName) AS InstructorName, 
    c.CreationDate
FROM 
    Courses c
JOIN 
    Users u
ON 
    c.InstructorID = u.UserID;

-- VIEW STUDENTS ENROLLED IN COURSES
SELECT 
    e.EnrollmentID, 
    CONCAT(u.FirstName, ' ', u.LastName) AS StudentName, 
    c.CourseName, 
    e.EnrollmentDate, 
    e.ProgressPercentage
FROM 
    Enrollments e
JOIN 
    Users u ON e.StudentID = u.UserID
JOIN 
    Courses c ON e.CourseID = c.CourseID;
-- GET GRADES FOR THE STUDENTS
SELECT 
    s.SubmissionID, 
    CONCAT(u.FirstName, ' ', u.LastName) AS StudentName, 
    a.Title AS AssignmentTitle, 
    s.Grade
FROM 
    Submissions s
JOIN 
    Assignments a ON s.AssignmentID = a.AssignmentID
JOIN 
    Users u ON s.StudentID = u.UserID;

-- COUNT THE NUMBERS OF STUDENTS ENROLLED IN EACH COURSE
SELECT 
    c.CourseName, 
    COUNT(e.EnrollmentID) AS StudentCount
FROM 
    Courses c
LEFT JOIN 
    Enrollments e ON c.CourseID = e.CourseID
GROUP BY 
    c.CourseName;