USE univ;
CREATE TABLE practice_data (
	id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    subject VARCHAR(30) NOT NULL,
    salary INT,
	PRIMARY KEY (id,name)
    );
INSERT INTO practice_data (id,name,subject,salary)
VALUES
(23, "ajay", "math", 50000),
(47, "bharat", "english", 60000),
(18, "chetan", "chemistry", 45000),
(9, "divya", "physics", 75000);

SELECT * FROM practice_data

