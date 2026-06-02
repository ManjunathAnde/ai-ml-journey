CREATE DATABASE IF NOT EXISTS univ;
USE univ;
CREATE TABLE stud_data (
	id INT,
    age INT,
    name VARCHAR(30) NOT NULL,
    Email VARCHAR(40) UNIQUE,
    Followers INT DEFAULT 0, #if no followers, set 0
    Following INT DEFAULT 0,
    CONSTRAINT age_check CHECK (age>=15), #no students can have age<15
	PRIMARY KEY (id, name) #no two students can have both same id and name
);
INSERT INTO stud_data (id, name, age, Email, Followers, Following)
VALUES
(101, "Manjunath", 19, "manju@gmail.com", 240, 180),
(102, "Dhoni", 19, "dhoni@gmail.com", 9800, 150),
(103, "Smith S", 36, "smiths@gmail.com", 3200, 420),
(104, "Priya K", 22, "priya@gmail.com", 870, 310);

INSERT INTO stud_data (id, name, age, Email, Followers, Following)
VALUES
(105, "Joe Root", 36, "jroot@ecb.com" , 400, 1500);

INSERT INTO stud_data(id,name,age,Email)
VALUES
(104, "KL Rahul", 15, "rahulk@hotmail.com"); #Seperate entry as no followers SO default to zero

SELECT * FROM stud_data; #Show the table

CREATE TABLE post (
	id INT,
    content VARCHAR(100), 
    user_id INT,
    PRIMARY KEY (id), #should be both not null and unique
    FOREIGN KEY (user_id) REFERENCES stud_data(id) #links both tables with user_id and id connnection
);

SELECT name,age  #Clause: WHERE : used as a conditional to extract data with filters
FROM stud_data
WHERE age>=23;

SELECT name,age  #Clause: WHERE : used as a conditional to extract data with filters
FROM stud_data
WHERE age+4=40;

SELECT name,age  #Clause: WHERE : used as a conditional to extract data with filters
FROM stud_data
WHERE age BETWEEN 20 AND 40;  #AND - logical operator 

SELECT name, email
FROM stud_data
WHERE email IN ("manju@gmail.com", "jroot@ecb.com"); #returns entries with specific targets

SELECT name,age  #Clause: LIMIT : restricts results to a specific number 
FROM stud_data
WHERE age>=15
LIMIT 3; 

SELECT name,age  #Clause: ORDER BY : orders asc/desc by a specific column
FROM stud_data  #Orders in ascending by default 
WHERE age>=15
ORDER BY age;

SELECT name,age,followers  #Clause: ORDER BY : orders asc/desc by a specific column
FROM stud_data
WHERE age>=15
ORDER BY followers DESC;

SELECT COUNT(*) AS total_students_age25
FROM stud_data 
WHERE age>=25; #gives a col with count of students aged above or 25

SELECT COUNT(followers) AS students_with_followers FROM stud_data; #ignores NULLs
SELECT COUNT(DISTINCT age) AS unique_ages FROM stud_data; #counts unique ages


SELECT MAX(age) AS oldest FROM stud_data;
SELECT MAX(Followers) AS most_followers FROM stud_data;

-- GROUPING
SELECT age, count(id) FROM stud_data GROUP BY age; #groups by age and gives count

SELECT age, max(followers) FROM stud_data GROUP BY age ;#highest followers in each age group
#We can only write col names , on whose basis table is getting grouped by in the query. 

SELECT age, count(*) FROM stud_data WHERE Followers >200 GROUP BY age; #removes entities with followers <200 and then groups by age
SELECT age, count(*) FROM stud_data GROUP BY age having SUM(Followers)> 200; #groups first and then filters according to the clause. Only aggregate funcs can be used with HAVING 

SET SQL_SAFE_UPDATES = 0; #changing the default safe update to allow edition

#Updating the information in the table
UPDATE stud_data
SET followers=30
WHERE age>40;

DELETE FROM stud_data
WHERE age = 19; 

ALTER TABLE stud_data #modifying the schema of the table 
ADD COLUMN City VARCHAR(30) DEFAULT "Atlanta" ; 

ALTER TABLE stud_data
RENAME TO Univ_data; 

SELECT * FROM Univ_data

#Truncate only removes the entries in the table and the table can still be operated
#Drop entirely deletes the table and its entries.


