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


