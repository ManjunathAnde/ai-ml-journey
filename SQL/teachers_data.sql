#This script is a practice of concepts and commands 

USE univ;
CREATE TABLE teachers_data (
	id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    subject VARCHAR(30) NOT NULL,
    salary INT,
	PRIMARY KEY (id,name)
    );
INSERT INTO teachers_data (id,name,subject,salary)
VALUES
(23, "ajay", "math", 50000),
(47, "bharat", "english", 60000),
(18, "chetan", "chemistry", 45000),
(9, "divya", "physics", 75000);

ALTER TABLE teachers_data
RENAME COLUMN salary TO ctc;

SET SQL_SAFE_UPDATES = 0;

UPDATE teachers_data
SET ctc = ctc*1.25;

ALTER TABLE teachers_data
ADD COLUMN city varchar(30) DEFAULT 'Hyderabad';

UPDATE teachers_data
SET city = 'Mumbai'
WHERE ctc> 70000;

SELECT city, max(ctc) 
FROM teachers_data
GROUP BY city; 

ALTER TABLE teachers_data
ADD COLUMN IT_Bracket CHAR(1);

SELECT * from teachers_data ; 

UPDATE teachers_data
SET IT_Bracket = 'A'
WHERE ctc >=85000;

UPDATE teachers_data
SET IT_Bracket = 'B'
WHERE ctc >=70000 AND ctc <85000;

UPDATE teachers_data
SET IT_Bracket = 'C'
WHERE ctc >=60000 AND ctc <70000;

UPDATE teachers_data
SET IT_Bracket = 'D'
WHERE IT_Bracket IS NULL; 