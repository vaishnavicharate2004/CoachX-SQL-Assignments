CREATE DATABASE COACHXUNIVERCIRY;
USE COACHXUNIVERCIRY;

CREATE TABLE COLLEGE (
College_ID INT PRIMARY KEY ,
College_Name VARCHAR(100),
College_Area VARCHAR (100)
);
CREATE TABLE DEPARTMENT(
DEP_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(100),
DEPT_FACILITY VARCHAR(100),
COLLEGE_ID INT,
FOREIGN KEY(COLLEGE_ID) REFERENCES COLLEGE(COLLEGE_ID)
);
CREATE TABLE PROFESSOR(
PRO_ID INT PRIMARY KEY,
PRO_NAME VARCHAR (100),
PRO_SUB VARCHAR (100),
DEP_ID INT,
FOREIGN KEY(DEP_ID) REFERENCES DEPARTMENT(DEP_ID)
);
CREATE TABLE STUDENT(
STUDENT_ID INT PRIMARY KEY,
STUDENT_NAME VARCHAR(100),
STUDENT_STREAM VARCHAR(100),
PRO_ID INT ,
FOREIGN KEY(PRO_ID) REFERENCES PROFESSOR(PRO_ID)
);

INSERT INTO College VALUES
(1, 'Engineering College', 'North Campus'),
(2, 'Medical College', 'South Campus'),
(3, 'Business College', 'East Campus'),
(4, 'Law College', 'West Campus'),
(5, 'Arts College', 'Central Campus'),
(6, 'Science College', 'North Campus'),
(7, 'Education College', 'South Campus'),
(8, 'Pharmacy College', 'East Campus'),
(9, 'Agriculture College', 'West Campus'),
(10, 'Sports College', 'Central Campus');

INSERT INTO Department VALUES
(101, 'Computer Science', 'Lab Facility', 1),
(102, 'Mechanical Engineering', 'Workshop', 1),
(103, 'Cardiology', 'Hospital Wing', 2),
(104, 'Business Analytics', 'Smart Lab', 3),
(105, 'Criminal Law', 'Courtroom Simulation', 4),
(106, 'Fine Arts', 'Studio', 5),
(107, 'Physics', 'Research Lab', 6),
(108, 'Education Technology', 'Digital Lab', 7),
(109, 'Pharmacology', 'Drug Lab', 8),
(110, 'Sports Science', 'Gymnasium', 10);

INSERT INTO Professor VALUES
(201, 'Dr. Sharma', 'Data Structures', 101),
(202, 'Dr. Mehta', 'Thermodynamics', 102),
(203, 'Dr. Rao', 'Cardiology', 103),
(204, 'Dr. Iyer', 'Business Analytics', 104),
(205, 'Dr. Kulkarni', 'Criminal Law', 105),
(206, 'Dr. Deshmukh', 'Painting', 106),
(207, 'Dr. Banerjee', 'Quantum Physics', 107),
(208, 'Dr. Singh', 'Education Tech', 108),
(209, 'Dr. Patel', 'Pharmacology', 109),
(210, 'Dr. Thomas', 'Sports Science', 110);

INSERT INTO Student VALUES
(301, 'Amit', 'Computer Science', 201),
(302, 'Sneha', 'Mechanical Engineering', 202),
(303, 'Ravi', 'Cardiology', 203),
(304, 'Priya', 'Business Analytics', 204),
(305, 'Karan', 'Criminal Law', 205),
(306, 'Neha', 'Fine Arts', 206),
(307, 'Vikas', 'Physics', 207),
(308, 'Pooja', 'Education Tech', 208),
(309, 'Rahul', 'Pharmacology', 209),
(310, 'Anjali', 'Sports Science', 210);

SELECT * FROM COLLEGE;
SELECT * FROM DEPARTMENT;
SELECT * FROM PROFESSOR;
SELECT * FROM STUDENT;

--1.Give the information of College_ID and College_name from College_Table-- 
SELECT COLLEGE_NAME , COLLEGE_ID FROM COLLEGE;

 --2.Show  Top 5 rows from Student table--
 SELECT TOP 5 * FROM STUDENT;

--3.What is the name of  professor  whose ID  is 5--
SELECT * FROM PROFESSOR;
 SELECT PRO_NAME FROM PROFESSOR 
 WHERE PRO_ID =205;

--4. Convert the name of the Professor into Upper case --
 SELECT UPPER(PRO_NAME) FROM PROFESSOR;

--5. Show me the names of those students whose name is start with a--
SELECT STUDENT_NAME FROM STUDENT;
 SELECT STUDENT_NAME FROM STUDENT
 WHERE STUDENT_NAME LIKE 'A%';

--6. Give the name of those colleges whose end with a--
SELECT COLLEGE_NAME FROM COLLEGE;
 SELECT COLLEGE_NAME FROM COLLEGE
 WHERE COLLEGE_NAME LIKE '%A';

--7.  Add one Salary Column in Professor_Table--
 ALTER TABLE PROFESSOR ADD  SALARY INT;
 SELECT * FROM PROFESSOR;
UPDATE Professor SET Salary = 60000 WHERE Pro_ID = 201;
UPDATE Professor SET Salary = 55000 WHERE Pro_ID = 202;
UPDATE Professor SET Salary = 75000 WHERE Pro_ID = 203;
UPDATE Professor SET Salary = 70000 WHERE Pro_ID = 204;
UPDATE Professor SET Salary = 65000 WHERE Pro_ID = 205;
UPDATE Professor SET Salary = 48000 WHERE Pro_ID = 206;
UPDATE Professor SET Salary = 72000 WHERE Pro_ID = 207;
UPDATE Professor SET Salary = 50000 WHERE Pro_ID = 208;
UPDATE Professor SET Salary = 68000 WHERE Pro_ID = 209;
UPDATE Professor SET Salary = 60000 WHERE Pro_ID = 210;

--8. Add one Contact Column in Student_table--
 ALTER TABLE STUDENT ADD CONTACT INT;

--9. Find the total Salary of Professor --
SELECT SUM(SALARY) AS TOTALSALARY FROM PROFESSOR;

--10. Change datatype of any one column of any one Table --
  ALTER TABLE Professor
  ALTER COLUMN Salary BIGINT;

                --** TASK 3**--
--1. Show first 5 records from Students table and Professor table Combine--
SELECT TOP 5 * FROM STUDENT;
SELECT TOP 5 * FROM PROFESSOR;

--2. Apply Inner join on all 4 tables together(Syntax  is mandatory)--
 SELECT * FROM COLLEGE AS C INNER JOIN DEPARTMENT AS D
 ON C.COLLEGE_ID=D.COLLEGE_ID
 INNER JOIN PROFESSOR AS P
 ON P.DEP_ID=D.DEP_ID
 INNER JOIN STUDENT AS S
 ON S.PRO_ID = P.PRO_ID;

--3. Show Some null values from Department table and Professor table--
 SELECT * FROM DEPARTMENT AS D INNER JOIN PROFESSOR AS P 
 ON D.DEP_ID = P.DEP_ID
 WHERE D.Dept_Facility IS NULL
   OR P.Salary IS NULL
   OR P.Pro_Sub IS NULL;

--4. Create a View from College Table  and give those records whose college 
--name starts with C--
 CREATE VIEW CLGVIEW AS
 SELECT COLLEGE_ID,COLLEGE_AREA,COLLEGE_NAME FROM COLLEGE 
 WHERE COLLEGE_NAME LIKE 'C%';
 SELECT * FROM CLGVIEW;

--5. Create Stored Procedure  of Professor table whatever customer ID will be 
--given by user it should show whole records of it--
 CREATE PROCEDURE GET_PROCEDURE_BY_ID
 @PROFESSORID INT
 AS
 BEGIN
 SELECT PRO_ID,PRO_NAME,PRO_SUB,DEP_ID FROM PROFESSOR
 WHERE PRO_ID = @PROFESSORID;
 END;
 EXEC GET_PROCEDURE_BY_ID @ProfessorID = 201;

--6. Rename the College_Table to College_Tables_Data--ALTER TABLE COLLEGERENAME COLLEGE AS COLLEGE_TABLE;
  EXEC sp_rename 'College_Table', 'College_Tables_Data';
  SELECT * FROM  College_Tables_Data;