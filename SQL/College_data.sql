CREATE database college;
USE college;
CREATE TABLE students (
	rollno INT,
    name varchar(30),
    age int
);

INSERT INTO students
VALUES
(101, "Manjunath", 19),
(102, "Dhoni", 48),
(103, "Smith S", 36);

SHOW databases