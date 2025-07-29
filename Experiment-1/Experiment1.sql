-- Easy
use assessment;

CREATE TABLE AUTHOR_DETAILS(
	authID INT,
	authName VARCHAR(100),
	authCountry VARCHAR(100)
);

CREATE TABLE BOOK_DETAILS(
	bookTitle VARCHAR(100),
	authID INT
);

INSERT INTO AUTHOR_DETAILS(authID, authName, authCountry) VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'Stephen King', 'United States'),
(3, 'Haruki Murakami', 'Japan'),
(4, 'Chinua Achebe', 'Nigeria'),
(5, 'Margaret Atwood', 'Canada');


INSERT INTO BOOK_DETAILS(bookTitle, authID) VALUES
('Harry Potter and the Philosopher\'s Stone', 1),
('Harry Potter and the Chamber of Secrets', 1),
('The Shining', 2),
('IT', 2),
('Norwegian Wood', 3),
('Kafka on the Shore', 3),
('Things Fall Apart', 4),
('No Longer at Ease', 4),
('The Handmaid\'s Tale', 5),
('Oryx and Crake', 5);


SELECT 
    B.bookTitle AS "Book Title", 
    A.authName AS "Author Name", 
    A.authCountry AS "Author Country"
FROM 
    AUTHOR_DETAILS AS A
INNER JOIN 
    BOOK_DETAILS AS B
ON 
    A.authID = B.authID;

-- MEDIUM
use assessment;
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Computer Science and Engineering'),
(2, 'Electrical and Electronics Engineering'),
(3, 'Electronics and Communication Engineering'),
(4, 'Mechanical Engineering'),
(5, 'Civil Engineering'),
(6, 'Chemical Engineering'),
(7, 'Artificial Intelligence and Data Science'),
(8, 'Information Technology'),
(9, 'Robotics and Automation'),
(10, 'Biomedical Engineering');


INSERT INTO Courses (course_id, course_name, dept_id) VALUES
(201, 'Data Structures and Algorithms', 1),
(202, 'Operating Systems', 1),
(203, 'Digital Logic Design', 2),
(204, 'Power Systems', 2),
(205, 'Analog and Digital Communication', 3),
(206, 'VLSI Design', 3),
(207, 'Thermodynamics', 4),
(208, 'Fluid Mechanics', 4),
(209, 'Structural Analysis', 5),
(212, 'Process Control', 6),
(213, 'Machine Learning', 7),
(215, 'Web Technologies', 8),
(216, 'Network Security', 8),
(217, 'Robotics and Control Systems', 9),
(220, 'Medical Imaging Systems', 10),
(221, 'Computer Networks', 1),
(222, 'Computer Architecture', 1),
(224, 'Fluid Chemistry', 4);


SELECT 
	dept_name
FROM 
	Departments
WHERE 
	dept_id IN (
		SELECT dept_id
		FROM Courses
		GROUP BY dept_id
		HAVING COUNT(*) > 2
	);

GRANT SELECT ON Courses TO readonly_user;