START TRANSACTION;

-- Drop existing tables 
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;

-- create students
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- Create corses
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

-- create enrollments
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,

    -- Foreign keys
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- insert test data
INSERT INTO students (name, age) VALUES 
('Alice Johnson', 20),
('Bob Smith', 22),
('Charlie Brown', 19);

INSERT INTO courses (course_name, credits) VALUES
('Database Systems', 3),
('Web Development', 4),
('Data Structures', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-09-01'), -- Alice -> Database Systems
(2, 2, '2025-09-02'), -- Bob -> Web Development
(3, 3, '2025-09-03'), -- Charlie -> Data Structures
(1, 2, '2025-09-04'); -- Alice -> Web Development too

-- Commit 
COMMIT;

-- Test
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;




