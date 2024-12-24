

USE OnlineLearningPlatform;

-- Create the Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Role ENUM('Student', 'Instructor', 'Admin') NOT NULL,
   DateJoined DATE NOT NULL DEFAULT (CURRENT_DATE)


);

-- Create the Courses table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    InstructorID INT,
    CreationDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID)
);

-- Create the Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT NOT NULL,
    StudentID INT NOT NULL,
    EnrollmentDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    ProgressPercentage DECIMAL(5, 2) DEFAULT 0.00,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- Create the Assignments table
CREATE TABLE Assignments (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT NOT NULL,
    Title VARCHAR(100) NOT NULL,
    DueDate DATE NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create the Submissions table
CREATE TABLE Submissions (
    SubmissionID INT AUTO_INCREMENT PRIMARY KEY,
    AssignmentID INT NOT NULL,
    StudentID INT NOT NULL,
    SubmissionDate DATE NOT NULL,
    Grade DECIMAL(5, 2) DEFAULT NULL,
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);
