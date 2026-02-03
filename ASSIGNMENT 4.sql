CREATE DATABASE ASGM2;
USE ASGM2;

CREATE TABLE EmployeeDetails ( 
EmpId INT PRIMARY KEY, 
FullName VARCHAR(100), 
ManagerId INT, 
DateOfJoining DATE, 
City VARCHAR(100) 
); 

CREATE TABLE EmployeeSalary ( 
EmpId INT, 
Project VARCHAR(50), 
Salary DECIMAL(10, 2), 
Variable DECIMAL(10, 2), 
FOREIGN KEY (EmpId) REFERENCES 
EmployeeDetails(EmpId) 
); 

INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, 
DateOfJoining, City) VALUES 
(101, 'Alice Johnson', 321, '2022-05-15', 'New York'), 
(102, 'Bob Smith', 876, '2020-03-12', 'Los Angeles'), 
(103, 'Charlie Brown', 986, '2021-08-23', 'Chicago'), 
(104, 'David Williams', 876, '2019-11-05', 'Houston'), 
(105, 'Eve Davis', 321, '2023-01-07', 'Phoenix'), 
(106, 'Frank Miller', 986, '2018-12-19', 'Philadelphia'), 
(107, 'Grace Wilson', 876, '2022-03-28', 'San Antonio'), 
(108, 'Hank Moore', 321, '2021-09-14', 'San Diego'), 
(109, 'Ivy Taylor', 986, '2020-02-11', 'Dallas'), 
(110, 'Jack Anderson', 876, '2022-11-30', 'San Jose'), 
(111, 'Karen Thomas', 321, '2021-07-16', 'Austin'), 
(112, 'Liam Jackson', 986, '2023-04-21', 'Fort Worth'), 
(113, 'Mia White', 876, '2019-06-03', 'Columbus'), 
(114, 'Noah Harris', 321, '2020-12-10', 'Charlotte'), 
(115, 'Olivia Martin', 986, '2021-10-25', 'San Francisco'), 
(116, 'Paul Garcia', 876, '2023-07-18', 'Indianapolis'), 
(117, 'Quinn Martinez', 321, '2022-09-07', 'Seattle'), 
(118, 'Rachel Rodriguez', 986, '2020-01-15', 'Denver'), 
(119, 'Steve Clark', 876, '2021-03-19', 'Washington'), 
(120, 'Tina Lewis', 321, '2019-08-31', 'Boston');

INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) 
VALUES 
(101, 'P1', 7500, 500), 
(102, 'P2', 9200, 700), 
(103, 'P1', 6700, 600), 
(104, 'P3', 8300, 900), 
(105, 'P2', 7800, 800), 
(106, 'P3', 9100, 1000), 
(107, 'P1', 6200, 400), 
(108, 'P2', 8800, 750), 
(109, 'P3', 9500, 1100), 
(110, 'P1', 7200, 650), 
(111, 'P2', 8700, 850), 
(112, 'P3', 9300, 1200), 
(113, 'P1', 7900, 550), 
(114, 'P2', 6800, 450), 
(115, 'P3', 8400, 900), 
(116, 'P1', 7600, 500), 
(117, 'P2', 8900, 1000), 
(118, 'P3', 9200, 1100), 
(119, 'P1', 8100, 600), 
(120, 'P2', 8300, 750);

SELECT * FROM EmployeeDetails;
SELECT * FROM EmployeeSalary;

--Q1)SQL Query to fetch records that are present in one 
--table but not in another table.--
SELECT ed.*
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es
    ON ed.EmpId = es.EmpId
WHERE es.EmpId IS NULL;

--Q2)SQL query to fetch all the employees who are not working on any project.- 
SELECT ed.*
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es
    ON ed.EmpId = es.EmpId
WHERE es.Project IS NULL;

--Q3)SQL query to fetch all the Employees from 
--EmployeeDetails who joined in the Year 2020. --
SELECT * FROM EmployeeDetails WHERE year(DateOfJoining) =2020;

--Q4)Fetch all employees from EmployeeDetails who 
--have a salary record in EmployeeSalary.--
SELECT ed.EmpId,ed.FullName,ed.ManagerId,ed.DateOfJoining,ed.City,es.Salary, es.Project, es.Variable
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es
    ON ed.EmpId = es.EmpId;

--Q5)Write an SQL query to fetch a project-wise count of employees.--
SELECT Project,COUNT (ed.EmpId)AS  employee_count FROM EmployeeDetails ed INNER JOIN EmployeeSalary
ON ed.EmpId = EmployeeSalary.EmpId
GROUP BY Project;


--Q6)Fetch employee names and salaries even if the 
--salary value is not present for the employee.--

SELECT ed.FullName, es.Salary
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es
    ON ed.EmpId = es.EmpId;

--Q7)Write an SQL query to fetch all the Employees who are also managers.-
    SELECT DISTINCT m.EmpId, m.FullName
    FROM EmployeeDetails e
    INNER JOIN EmployeeDetails m
    ON e.ManagerId = m.EmpId;

--Q9)Write an SQL query to fetch only odd rows from the table.--
    SELECT COUNT(EMPID) AS ODD_COUNT FROM EmployeeDetails
	WHERE EMPID %2 =1;
	-- FOR COUNTING ODD WILL WRIGHT 1 BEACUSE REMINDER WILL BE 1 FOR THOSE
	--VALUE WHICH ARE NOT DIVIDED BY 2--

	--AND FOR EVEN VALUE COUNTING WE CAN WRIGHT WHERE %2=0 BEACUSE REMINDER WILL BE
	--0 FOR THOSE VALUE WHICH IS DIVIDED BY 2--

--Q10)Write a query to find the 3rd highest salary from a 
--table without top or limit keyword.--
    SELECT EMPID,SUM(SALARY)AS SALARY_COUNT FROM EmployeeSalary
	GROUP BY EMPID
	ORDER BY SALARY_COUNT DESC
	LIMIT 3; -- LIMIT IS NOT WORKED IN SSMS--

	SELECT EMPID,SUM(SALARY)AS SALARY_COUNT FROM EmployeeSalary
	GROUP BY EMPID
	ORDER BY SALARY_COUNT DESC
	OFFSET 0 ROW FETCH NEXT 3 ROWS ONLY;--USING OFFSET--

	SELECT MAX(SALARY) AS Third_Highest_Salary
    FROM EmployeeSalary
    WHERE SALARY < (
    SELECT MAX(SALARY)
    FROM EmployeeSalary
    WHERE SALARY < (
        SELECT MAX(SALARY)
        FROM EmployeeSalary
    )
);

--Ques.1. Write an SQL query to fetch the EmpId and FullName of 
--all the employees working under the Manager with id – „986‟. --
     SELECT EmpId,FullName,ManagerId FROM EmployeeDetails
	 WHERE ManagerId = 986;

--Ques.2. Write an SQL query to fetch the different projects 
--available from the EmployeeSalary table.--
    SELECT DISTINCT COUNT(PROJECT) AS NEW_PRO FROM EmployeeSalary;

--Ques.3. Write an SQL query to fetch the count of employees 
--working in project „P1‟.--
    SELECT EMPID,PROJECT, COUNT(PROJECT) AS COUNT_PROJECT FROM EmployeeSalary
	WHERE Project = 'P1'
	GROUP BY EMPID,Project;

--Ques.4. Write an SQL query to find the maximum, minimum, and 
--average salary of the employees.--
    SELECT MAX(SALARY) AS MAXSAL,MIN(SALARY) AS MINSAL,AVG(SALARY) AS AVGSAL
	FROM EmployeeSalary;

--Ques.5. Write an SQL query to find the employee id whose salary 
--lies in the range of 9000 and 15000.--
    SELECT EMPID, SALARY FROM EmployeeSalary
	WHERE Salary BETWEEN 9000 AND 15000;

--Ques.6. Write an SQL query to fetch those employees who live in 
--Toronto and work under the manager with ManagerId – 321.--
     SELECT EMPID,FULLNAME ,MANAGERID,City FROM EmployeeDetails
	 WHERE CITY = 'Toronto' AND ManagerId =321;
	 SELECT MANAGERID,CITY FROM EmployeeDetails;

--Ques.7. Write an SQL query to fetch all the employees who either 
--live in California or work under a manager with ManagerId – 321--
     SELECT EMPID,FULLNAME ,MANAGERID,City FROM EmployeeDetails
	 WHERE CITY = 'California' OR ManagerId =321;

--Ques.8. Write an SQL query to fetch all those employees who 
--work on Projects other than P1--
    SELECT EMPID, COUNT(PROJECT) AS PEOJECT_COUNT,Project FROM EmployeeSalary
	WHERE PROJECT <> 'P1'
	GROUP BY EMPID,Project;

--Ques.9. Write an SQL query to display the total salary of each 
--employee adding the Salary with Variable value--
    SELECT * FROM EmployeeSalary;
	SELECT EMPID,SUM(SALARY + VARIABLE) AS SALwithVAR FROM EmployeeSalary
	GROUP BY EmpId;

--Ques.10. Write an SQL query to fetch the employees whose name 
--begins with any two characters, followed by a text “hn” and ends 
--with any sequence of characters--
    SELECT FullName FROM EmployeeDetails
	WHERE FullName LIKE 'hn_%' ; 

--Ques.1 Write an SQL query to fetch all the EmpIds which are 
--present in either of the tables – „EmployeeDetails‟ and „EmployeeSalary‟--
    SELECT EmpId FROM EmployeeDetails
	UNION 
	SELECT EmpId FROM EmployeeSalary;

--Ques.2 Write an SQL query to fetch common records between two tableS--
    SELECT * FROM EmployeeDetails AS ED INNER JOIN EMPLOYEESALARY AS ES
	ON ED.EmpId=ES.EmpId;

--Ques.3. Write an SQL query to fetch records that are present in 
--one table but not in another table--
    SELECT * FROM EmployeeDetails AS ED LEFT JOIN EMPLOYEESALARY AS ES
	ON ED.EmpId=ES.EmpId
	WHERE ED.EmpId IS NULL;

--Ques.4. Write an SQL query to fetch the EmpIds that are present 
--in both the tables –  EmployeeDetails and EmployeeSalary--
     SELECT EMPID FROM  EmployeeDetails
	 UNION
	 SELECT EMPID FROM  EmployeeDetails;

--Ques.5. Write an SQL query to fetch the EmpIds that are present 
--in EmployeeDetails but not in EmployeeSalary-- 
     SELECT * FROM EmployeeDetails AS ED LEFT JOIN EmployeeSalary AS ES
	 ON ED.EmpId = ES.EmpId
	 WHERE ES.EmpId IS NULL;

--Ques.6. Write an SQL query to fetch the employee's full names 
--and replace the space--
     UPDATE EmployeeDetails SET FullName = REPLACE (FullName,'','-');
	
	 UPDATE EmployeeDetails SET FullName = CONCAT('Alice','-','johnson');
UPDATE EmployeeDetails SET FullName = 'Alice Johnson' WHERE EmpId = 101;
UPDATE EmployeeDetails SET FullName = 'Bob Smith' WHERE EmpId = 102;
UPDATE EmployeeDetails SET FullName = 'Charlie Brown' WHERE EmpId = 103;
UPDATE EmployeeDetails SET FullName = 'David Williams' WHERE EmpId = 104;
UPDATE EmployeeDetails SET FullName = 'Eve Davis' WHERE EmpId = 105;
UPDATE EmployeeDetails SET FullName = 'Frank Miller' WHERE EmpId = 106;
UPDATE EmployeeDetails SET FullName = 'Grace Wilson' WHERE EmpId = 107;
UPDATE EmployeeDetails SET FullName = 'Hank Moore' WHERE EmpId = 108;
UPDATE EmployeeDetails SET FullName = 'Ivy Taylor' WHERE EmpId = 109;
UPDATE EmployeeDetails SET FullName = 'Jack Anderson' WHERE EmpId = 110;
UPDATE EmployeeDetails SET FullName = 'Karen Thomas' WHERE EmpId = 111;
UPDATE EmployeeDetails SET FullName = 'Liam Jackson' WHERE EmpId = 112;
UPDATE EmployeeDetails SET FullName = 'Mia White' WHERE EmpId = 113;
UPDATE EmployeeDetails SET FullName = 'Noah Harris' WHERE EmpId = 114;
UPDATE EmployeeDetails SET FullName = 'Olivia Martin' WHERE EmpId = 115;
UPDATE EmployeeDetails SET FullName = 'Paul Garcia' WHERE EmpId = 116;
UPDATE EmployeeDetails SET FullName = 'Quinn Martinez' WHERE EmpId = 117;
UPDATE EmployeeDetails SET FullName = 'Rachel Rodriguez' WHERE EmpId = 118;
UPDATE EmployeeDetails SET FullName = 'Steve Clark' WHERE EmpId = 119;
UPDATE EmployeeDetails SET FullName = 'Tina Lewis' WHERE EmpId = 120;

    select * from EmployeeDetails;
	 UPDATE EmployeeDetails SET FullName = REPLACE (FullName,'','-');
	 SELECT EmpId, REPLACE(FullName, ' ', '-') AS FullName
     FROM EmployeeDetails;

--Ques.7. Write an SQL query to fetch the position of a given 
--character(s) in a field.-- 
     SELECT CHARINDEX('S',FULLNAME) AS POSITION FROM EmployeeDetails; 

--Ques.8. Write an SQL query to display both the EmpId and ManagerId together--
     SELECT ED.EMPID , ED.MANAGERID FROM EmployeeDetails AS ED
	 INNER JOIN EmployeeSalary AS ES
	 ON ES.EmpId= ED.EmpId;

--Ques.9. Write a query to fetch only the first name(string before 
--space) from the FullName column of the EmployeeDetails table--
    SELECT SUBSTRING(FULLNAME,1,CHARINDEX('',FULLNAME)-1)
	AS FIRSTNAME FROM EmployeeDetails;

--Ques.10. Write an SQL query to uppercase the name of the 
--employee and lowercase the city values--
   SELECT UPPER(FULLNAME) AS EMPNAME ,
   LOWER(CITY) AS CITY 
   FROM EmployeeDetails;

--Ques.1. Write an SQL query to find the count of the total 
--occurrences of a particular character – „n‟ in the FullName field--
    SELECT SUM(LEN(FullName) - LEN(REPLACE(FullName, 'n', '')))
	AS TotalOccurrences FROM EmployeeDetails;
	SELECT LEN(FULLNAME) FROM EmployeeDetails;

--Ques.2. Write an SQL query to update the employee names by 
--removing leading and trailing spaces--
    UPDATE EmployeeDetails SET FullName=TRIM(FULLNAME);
	SELECT FULLNAME FROM EmployeeDetails;

--Ques.3. Fetch all the employees who are not working on any project--
    SELECT EmpId,Salary, PROJECT FROM EmployeeSalary
	WHERE PROJECT IS NULL;

--Ques.4. Write an SQL query to fetch employee names having a 
--salary greater than or equal to 5000 and less than or equal to 10000--
     SELECT FULLNAME ,SALARY FROM EmployeeDetails AS ED 
	 INNER JOIN EmployeeSalary AS ES
	 ON ED.EmpId= ES.EmpId
	 WHERE ES.Salary >5000 AND ES.Salary<10000;

--Ques.5. Write an SQL query to find the current date-time--
      SELECT GETDATE() AS CURRENTDATE;

--Ques.6. Write an SQL query to fetch all the Employee details from 
--the EmployeeDetails table who joined in the Year 2020--
    SELECT * FROM EmployeeDetails
	WHERE YEAR(DateOfJoining) = 2020;

--Ques.7. Write an SQL query to fetch all employee records from 
--the EmployeeDetails table who have a salary record in the 
--EmployeeSalary table--
    SELECT FullName,Salary FROM EmployeeDetails AS ED INNER JOIN EmployeeSalary AS ES
	ON ED.EmpId = ES.EmpId;

--Ques.8. Write an SQL query to fetch the project-wise count of 
--employees sorted by project‟s count in descending order--
    SELECT PROJECT,  COUNT(EmpId) AS EMPLOYEECOUNT FROM EmployeeSalary
	GROUP BY Project
	ORDER BY EMPLOYEECOUNT DESC;

--Ques.9. Write a query to fetch employee names and salary 
--records. Display the employee details even if the salary record is 
--not present for the employee--
    SELECT ED.FULLNAME, ES.SALARY FROM EmployeeDetails AS ED LEFT JOIN 
	EmployeeSalary AS ES
	ON ED.EmpId=ES.EmpId;


	
