CREATE DATABASE ASG_4;
USE ASG_4;

CREATE TABLE STUDENTS_TABLE(
student_Id INT , 
name VARCHAR(100), 
surname VARCHAR(100), 
birthdate DATE,
gender VARCHAR(100), 
class INT, 
point INT
);
ALTER TABLE STUDENTS_TABLE
ALTER COLUMN CLASS VARCHAR(100);

INSERT INTO STUDENTS_TABLE
 VALUES 
(1, 'John', 'Doe', '2005-01-15', 'M', '10A', 85), 
(2, 'Jane', 'Smith', '2006-03-22', 'F', '10B', 90), 
(3, 'Alice', 'Johnson', '2005-07-12', 'F', '10A', 88), 
(4, 'Bob', 'Brown', '2006-11-30', 'M', '10C', 76), 
(5, 'Charlie', 'Davis', '2005-05-05', 'M', '10B', 92), 
(6, 'Diana', 'Miller', '2006-06-25', 'F', '10C', 81), 
(7, 'Eve', 'Wilson', '2005-09-18', 'F', '10A', 87), 
(8, 'Frank', 'Moore', '2006-12-02', 'M', '10B', 80), 
(9, 'Grace', 'Taylor', '2005-04-17', 'F', '10C', 83), 
(10, 'Hank', 'Anderson', '2006-10-20', 'M', '10A', 78); 

CREATE TABLE BORROWS_TABLE (
borrowId INT, 
studentId INT, 
bookId INT, 
takenDate DATE,
broughtDate DATE
);
INSERT INTO BORROWS_TABLE
VALUES
(1, 1, 3, '2024-01-10', '2024-01-20'), 
(2, 2, 5, '2024-01-12', '2024-01-22'), 
(3, 3, 7, '2024-01-15', '2024-01-25'), 
(4, 4, 2, '2024-01-18', '2024-01-28'), 
(5, 5, 1, '2024-01-20', '2024-01-30'), 
(6, 6, 4, '2024-01-22', '2024-02-01'), 
(7, 7, 6, '2024-01-24', '2024-02-03'), 
(8, 8, 8, '2024-01-26', '2024-02-05'), 
(9, 9, 10, '2024-01-28', '2024-02-07'), 
(10, 10, 9, '2024-01-30', '2024-02-09');

CREATE TABLE Books_Table(
bookId INT, 
name VARCHAR(100), 
pagecount INT,
point INT, 
authorId INT,
typeId INT
); 
INSERT INTO Books_Table(bookId, name, pagecount, point, 
authorId, typeId) VALUES
(1, 'The Great Gatsby', 180, 95, 1, 1), 
(2, 'To Kill a Mockingbird', 281, 90, 2, 2), 
(3, 'Too Good To Be Good', 328, 88, 3, 3), 
(4, 'Pride and Prejudice', 279, 93, 4, 4), 
(5, 'The Catcher in the Rye', 214, 85, 5, 1), 
(6, 'The Hobbit', 310, 91, 6, 2), 
(7, 'Moby-Dick', 635, 80, 7, 3), 
(8, 'War and Peace', 1225, 92, 8, 4), 
(9, 'Ulysses', 730, 89, 9, 1), 
(10, 'The Odyssey', 541, 87, 10, 2);

CREATE TABLE Authors_Table (
authorId INT,
name VARCHAR(100), 
surname VARCHAR(100)
); 

INSERT INTO Authors_Table(authorId, name, surname) VALUES 
(1, 'F. Scott', 'Fitzgerald'), 
(2, 'Harper', 'Lee'), 
(3, 'George', 'Orwell'), 
(4, 'Jane', 'Austen'), 
(5, 'J.D.', 'Salinger'), 
(6, 'J.R.R.', 'Tolkien'), 
(7, 'Herman', 'Melville'), 
(8, 'Leo', 'Tolstoy'), 
(9, 'James', 'Joyce'), 
(10, 'Homer', ''); 

CREATE TABLE  Types_Table (
typeId INT, 
name VARCHAR (100)
);
INSERT INTO Types_Table VALUES
(1, 'Fiction'), 
(2, 'Classic'), 
(3, 'Dystopian'), 
(4, 'Literature'), 
(5, 'Fantasy'), 
(6, 'Adventure'), 
(7, 'Historical Fiction'), 
(8, 'Science Fiction'), 
(9, 'Mythology'), 
(10, 'Philosophy'); 

SELECT * FROM STUDENTS_TABLE;
SELECT * FROM BORROWS_TABLE;
SELECT * FROM Books_Table;
SELECT * FROM Authors_Table;
SELECT * FROM Types_Table;

--Example 1:  List all the records in the student table--
SELECT * FROM STUDENTS_TABLE;

--Example 2: List the name surname and class of 
--the student in the student table--
  SELECT SURNAME,CLASS FROM STUDENTS_TABLE;

--Example 3: List the gender Female (F) records in the student table--
   SELECT name,GENDER FROM STUDENTS_TABLE
   WHERE gender= 'F';

--Example 4 : List the names of each class in the 
--way of being seen once in the student table--
   SELECT DISTINCT(CLASS)  FROM STUDENTS_TABLE;

--Example 5: List the students with Female gender 
--and the class 10MATH in the student table--
select * from STUDENTS_TABLE;
   SELECT NAME,GENDER,class FROM STUDENTS_TABLE
   WHERE gender ='F' AND class= '10A';

--Example 6: List the names, surnames and classes 
--of the students in the class 10Math or 10Sci in the student table--


--Example 7: List the students name surname and 
--school number in the student table--
  SELECT student_Id, name, surname FROM STUDENTS_TABLE;

--Example 8: List the students name and surname by 
--combining them as name surname in the student table--
  SELECT CONCAT(name,' ' ,SURNAME) AS FULLNAME FROM STUDENTS_TABLE;
  SELECT * FROM STUDENTS_TABLE;

--Example 9: List the students with the names 
--starting with “A” letter in the student table--
  SELECT NAME FROM STUDENTS_TABLE
  WHERE NAME LIKE 'A%';

--Example 10: List the book names and pages count 
--with number of pages between 50 and 200 in the book table-- 
    SELECT NAME , PAGECOUNT FROM Books_Table
	WHERE pagecount  BETWEEN 50 AND 200;

--Example 11: List the students with names Emma 
--Sophia and Robert in the student table--
select * from STUDENTS_TABLE;
    SELECT NAME FROM STUDENTS_TABLE
	WHERE name in('Emma','sophia','robert');

--Example 12: List the students with names 
--starting with A D and K in the student table--
   SELECT NAME FROM STUDENTS_TABLE
   WHERE NAME LIKE 'A%' 
             OR NAME LIKE 'D%' 
			 OR NAME LIKE 'K%';

--Example 13: List the names surnames classes and 
--genders of males in 9Math or females in 9His in the student table--
SELECT * FROM STUDENTS_TABLE; 
INSERT INTO Students_Table (student_Id, name, surname, birthdate, gender, class, point)
VALUES (11, 'Arjun', 'Verma', '2007-02-10', 'M', '9Math', 88),
       (12, 'Sneha', 'Patil', '2007-05-14', 'F', '9His', 91);
SELECT name, surname, class, gender
FROM Students_Table
WHERE (gender = 'M' AND class = '9Math')
   OR (gender = 'F' AND class = '9His');

--Example 14: List the males whose classes are 10Math or 10Bio-- 
   

--Example 15: List the students with birth year 1989 in the student table-- 
    SELECT YEAR(BIRTHDATE) FROM STUDENTS_TABLE;

--Example 16: List the female students with  
--student numbers between 30 and 50--
    SELECT GENDER,student_Id, name FROM STUDENTS_TABLE
	WHERE (gender='F' AND student_Id BETWEEN 30 AND 50);

--Example 17: List the students according to their names-- 
   SELECT COUNT(STUDENT_ID) AS STUDENTCOUNT, NAME FROM STUDENTS_TABLE
   GROUP BY NAME
   ORDER BY NAME;

--Example 18: List the students by names for those 
--with same names. List them by their surnames--
   SELECT name, surname
   FROM Students_Table
   WHERE name IN (
   SELECT name
   FROM Students_Table
   GROUP BY name
   HAVING COUNT(*) > 1)
   ORDER BY name, surname;

--Example 19: List the students in 10Math by decreasing school numbers--


--Example 20: List the first 10 records in the student chart--
    SELECT TOP 10 * FROM STUDENTS_TABLE;

--Example 21: List the first 10 records name 
--surname and date of birth information in the student table--
    SELECT TOP 10 NAME,SURNAME,BIRTHDATE FROM STUDENTS_TABLE;

--Example 22: List the book with the most page number-- 
    SELECT TOP 1 bookId,NAME,PAGECOUNT FROM Books_Table
	ORDER BY pagecount DESC;

--Example 23: List the youngest student in the student table-- 
    SELECT TOP 1 * FROM STUDENTS_TABLE
	ORDER BY birthdate DESC;

--Example 24: List the oldest student in the 10Math class--
   SELECT TOP 1 * FROM STUDENTS_TABLE
   WHERE class='10Math'
   ORDER BY class DESC;

--Example 25: List the books with the second letter N--
    SELECT NAME FROM Books_Table
	WHERE NAME LIKE '_N%';

--Example 26: List the students by grouping according to their classes-- 
    SELECT CLASS FROM STUDENTS_TABLE
	GROUP BY CLASS;

--Example 27: List the students to be different in each questioning randomly-- 
     SELECT TOP 10 *
     FROM Students_Table
     ORDER BY NEWID(); 
	 
--Example 28: Pick a random student from student table--
    SELECT NAME FROM STUDENTS_TABLE
	WHERE STUDENT_ID = 1;

--Example 29: Bring some random student’s name , 
--surname and number from class 10Math--
   SELECT NAME,SURNAME,POINT, CLASS FROM STUDENTS_TABLE
   WHERE CLASS = '10MATH';

--Example 30: Add the writer named Smith Allen to the authors table--

    

 