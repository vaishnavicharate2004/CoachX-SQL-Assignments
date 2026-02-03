CREATE DATABASE ASG_6;
USE ASG_6;
CREATE TABLE EMPLOYEEDETAILS(
    EMPLOYEEID INT,
	FIRSTNAME VARCHAR (100),
	LASTNAME VARCHAR(100),
	SALARY INT,
	JOININGDATE DATE,
	DEPARTMENT VARCHAR (100),
	GENDER VARCHAR (100)
	);
INSERT INTO EMPLOYEEDETAILS VALUES
    (1,'VIKAE','AHLAWAT',600000,'2-12-2013','IT','MALE'),
	(2,'NIKITA','JAIN',530000,'2-14-2013','HR','FEMALE'),
	(3,'ASHISHA','KUMAR',1000000,'2-14-2013','IT','MALE'),
	(4,'NIKHIL','SHARMA',480000,'2-15-2013','HR','MALE'),
	(5,'ANISH','KADIAN',500000,'2-16-2013','PAROLL','MALE');

--1. Write a query to get all employee detail from "EmployeeDetail" table 
    SELECT * FROM EMPLOYEEDETAILS;

--2. Write a query to get only "FirstName" column from 
--"EmployeeDetail" table 
    SELECT FIRSTNAME FROM EMPLOYEEDETAILS;

--3. Write a query to get FirstName in upper case as "First Name".
    SELECT UPPER (FIRSTNAME) FROM EMPLOYEEDETAILS;
	SELECT TRIM (FIRSTNAME) FROM EMPLOYEEDETAILS;

--5. Write a query for combine FirstName and LastName and display it 
--as "Name" (also include white space between first name & last name) 
         SELECT CONCAT (FIRSTNAME ,' ',LASTNAME) AS FULLNAME 
	     FROM EMPLOYEEDETAILS;

 
--i. Select employee detail whose name is "Vikas 
    select name = 'VIKAS' FROM EMPLOYEEDETAILS
	WHERE EMPLOYEEID=1;
    SELECT * FROM EMPLOYEEDETAILS;

--ii. Get all employee detail from EmployeeDetail table 
--whose "FirstName" start with latter 'a'.
     SELECT * FROM EMPLOYEEDETAILS 
	 WHERE FIRSTNAME LIKE 'A%';

--iii. Get all employee detail from EmployeeDetail table 
--whose "FirstName" ENDS with latter 'a'. 
    SELECT * FROM EMPLOYEEDETAILS
	WHERE FIRSTNAME LIKE '%A';

--iv. Get all employee details from EmployeeDetail table 
--whose "FirstName" end with 'h' 
     SELECT * FROM EMPLOYEEDETAILS
	 WHERE FIRSTNAME LIKE '%H'; 

--6. Get all employee detail from EmployeeDetail table whose 
--"FirstName" start with any single character between 'a-p'
      SELECT * FROM EMPLOYEEDETAILS
	  WHERE FIRSTNAME LIKE '[A-P]%';
	  
--8.  Get all employee detail from EmployeeDetail table whose 
--"Gender" end with 'le' and contain 4 letters. The Underscore(_) 
--Wildcard Character represents any single character 
    SELECT * FROM EMPLOYEEDETAILS
	WHERE GENDER LIKE '__LE';

--9.  Get all employee detail from EmployeeDetail table whose 
--"FirstName" start with 'A' and contain 5 letters
    SELECT * FROM EMPLOYEEDETAILS
	WHERE FIRSTNAME LIKE 'A____';

--10.  Get all employee detail from EmployeeDetail table whose 
--"FirstName" containing '%'. ex:-"Vik%as". 
     SELECT * FROM EMPLOYEEDETAILS
	 WHERE FIRSTNAME LIKE '%[%]%';

--11.Get all unique "Department" from EmployeeDetail table
    SELECT DISTINCT DEPARTMENT FROM EMPLOYEEDETAILS;

--12.Get the highest "Salary" from EmployeeDetail table.
    SELECT TOP 1 SALARY  FROM EMPLOYEEDETAILS;

--13.Get the lowest "Salary" from EmployeeDetail table.
    SELECT MIN(SALARY) FROM EMPLOYEEDETAILS;

--14.Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2023
      SELECT FORMAT(JOININGDATE,'dd-MMM-yyyy') AS JOININGDATE
	  FROM EMPLOYEEDETAILS;
	  
--15.Show "JoiningDate" in "yyyy/mm/dd" format, ex- 
--"2013/02/15" 
     SELECT FORMAT(JOININGDATE,'yyyy-MMM-dd') AS JOININGDATE
	 FROM EMPLOYEEDETAILS;

--16.Get only Year part of "JoiningDate"
    SELECT YEAR(JOININGDATE)  FROM EMPLOYEEDETAILS;

--17.Get only Month part of "JoiningDate”
     SELECT MONTH(JOININGDATE)  FROM EMPLOYEEDETAILS;

--18.Get system date 
    SELECT GETDATE() AS SYSTEMDATE;

--19.Get UTC date.
     SELECT GETUTCDATE() AS UTCDATE;

--20.Get the first name, current date, joiningdate and diff 
--between current date and joining date in months.
   SELECT FIRSTNAME,GETDATE() AS CURRENTDATE,JOININGDATE ,
   DATEDIFF(MONTH,JOININGDATE,GETDATE()) AS MONTHDIFF
   FROM EMPLOYEEDETAILS;

--21.Get the first name, current date, joiningdate and diff 
--between current date and joining date in days.
   SELECT FIRSTNAME,GETDATE() AS CURRENTDATE,JOININGDATE ,
   DATEDIFF(DAY,JOININGDATE,GETDATE()) AS DAYSDIFF
   FROM EMPLOYEEDETAILS;

--22. Get all employee details from EmployeeDetail table whose 
--joining year is 2013 
    SELECT * FROM EMPLOYEEDETAILS
	WHERE YEAR (JOININGDATE) = '2013';

--23. Get all employee details from EmployeeDetail table whose 
--joining month is Jan(1)
      SELECT * FROM EMPLOYEEDETAILS
	  WHERE MONTH (JOININGDATE) = '1';

--24.Get how many employee exist in "EmployeeDetail" table
    SELECT COUNT(EMPLOYEEID) AS COUNTEMP FROM EMPLOYEEDETAILS;

--25.Select only one/top 1 record from "EmployeeDetail" table
    SELECT TOP 1 * FROM EMPLOYEEDETAILS;
	SELECT * FROM EMPLOYEEDETAILS;

--26.Select all employee detail with First name 
--"Vikas","Ashish", and "Nikhil".
    SELECT FIRSTNAME FROM EMPLOYEEDETAILS
	WHERE EMPLOYEEID IN (1,3,4);

--29. Select first name from "EmployeeDetail" table after 
--removing white spaces from right side 
     SELECT RTRIM(FIRSTNAME) AS FIRSTNAME 
	 FROM EMPLOYEEDETAILS;

--30.Select first name from "EmployeeDetail" table after 
--removing white spaces from left side
     SELECT LTRIM(FIRSTNAME) AS FIRSTNAME 
	 FROM EMPLOYEEDETAILS;

--31.Display first name and Gender as M/F.(if male then M, if 
--Female then F) 
    SELECT
	FIRSTNAME,
	CASE 
	    WHEN GENDER ='MALE' THEN 'M'
		WHEN GENDER ='FEMALE' THEN 'F'
	END AS GENDER
	FROM EMPLOYEEDETAILS;

--32.Select first name from "EmployeeDetail" table prifixed 
--with "Hello 
    SELECT CONCAT('Hello', ' ', FIRSTNAME) AS GREETING
	FROM EMPLOYEEDETAILS;

--33.Get employee details from "EmployeeDetail" table whose 
--Salary greater than 600000 
     SELECT * FROM EMPLOYEEDETAILS
	 WHERE SALARY <600000;

--34.Get employee details from "EmployeeDetail" table whose 
--Salary less than 700000 
    SELECT * FROM EMPLOYEEDETAILS
	WHERE SALARY >700000;

--35.Get employee details from "EmployeeDetail" table whose 
--Salary between 500000 than 600000 
    SELECT * FROM EMPLOYEEDETAILS
	WHERE SALARY BETWEEN 500000 AND 600000; 
	
CREATE TABLE PROJECTDETAILS(
    PROJECTID INT,
	EMPLOYEEDETAILID INT,
	PROJECTNAME VARCHAR(100)
);

INSERT INTO PROJECTDETAILS VALUES 
    (1,1,'TASK TRACK'),
	(2,1,'CLP'),
	(3,1,'SURVEY MANAGEMENT'),
	(4,2,'HR MANAGEMENT'),
	(5,3,'TASK TRACK'),
	(6,3,'GRS'),
	(7,3,'DDS'),
	(8,4,'HR MANAGEMENT'),
	(9,6,'GL MANAGEMENT');
	
--1. Give records of ProjectDetail table
    SELECT * FROM PROJECTDETAILS;
	SELECT * FROM EMPLOYEEDETAILS;

--2. Write the query to get the department and department wise 
--total(sum) salary from "EmployeeDetail" table. 
       SELECT DEPARTMENT, SUM(SALARY) AS TOTALSALARY
	   FROM EMPLOYEEDETAILS
	   GROUP BY DEPARTMENT;

--3. Write the query to get the department and department wise 
--total(sum) salary, display it in ascending order according to salary. 
    SELECT DEPARTMENT, SUM(SALARY) AS TOTALSALARY
	FROM EMPLOYEEDETAILS
	GROUP BY DEPARTMENT
	ORDER BY TOTALSALARY ASC;

--4. Write the query to get the department and department wise 
--total(sum) salary, display it in descending order according to salary 
    SELECT DEPARTMENT, SUM(SALARY) AS TOTALSALARY
	FROM EMPLOYEEDETAILS
	GROUP BY DEPARTMENT
	ORDER BY TOTALSALARY DESC; 

--5. Write the query to get the department, total no. of departments, 
--total(sum) salary with respect to department from 
--"EmployeeDetail" table.
    SELECT DEPARTMENT, COUNT(DEPARTMENT) AS TOTALDEPARTMENT
	FROM EMPLOYEEDETAILS
	GROUP BY DEPARTMENT;

--6. Get department wise average salary from "EmployeeDetail" table 
--order by salary ascending
    SELECT DEPARTMENT , AVG(SALARY) AS AVGSALARY
	FROM EMPLOYEEDETAILS
	GROUP BY DEPARTMENT
	ORDER BY AVGSALARY ASC;

--7. Get department wise maximum salary from "EmployeeDetail" table 
--order by salary ascending
    SELECT DEPARTMENT , MAX(SALARY) AS MAXSALARY
	FROM EMPLOYEEDETAILS
	GROUP BY DEPARTMENT
	ORDER BY MAXSALARY ASC; 

--8. Get department wise minimum salary from "EmployeeDetail" table 
--order by salary ascending.
    SELECT DEPARTMENT , MIN(SALARY) AS MINSALARY
	FROM EMPLOYEEDETAILS
	GROUP BY DEPARTMENT
	ORDER BY MINSALARY ASC;

--10. Join both the table that is Employee and ProjectDetail 
--based on some common paramter 
    SELECT * FROM EMPLOYEEDETAILS 
	INNER JOIN PROJECTDETAILS
	ON EMPLOYEEDETAILS .EMPLOYEEID =  PROJECTDETAILS.EMPLOYEEDETAILID;

--11.Get employee name, project name order by firstname from 
--"EmployeeDetail" and "ProjectDetail" for those employee which 
--have assigned project already.
          SELECT FIRSTNAME,PROJECTNAME 
	      FROM EMPLOYEEDETAILS AS ED INNER JOIN PROJECTDETAILS AS PD
		  ON ED.EMPLOYEEID= PD.EMPLOYEEDETAILID
		  ORDER BY FIRSTNAME;

--12. Get employee name, project name order by firstname from 
--"EmployeeDetail" and "ProjectDetail" for all employee even they 
--have not assigned project.
      SELECT E.FirstName,
      P.ProjectName
      FROM EMPLOYEEDETAILS AS E
      LEFT JOIN PROJECTDETAILS AS P
      ON E.EmployeeID = P.EMPLOYEEDETAILID
      ORDER BY E.FirstName;

--13.Get employee name, project name order by firstname from 
--"EmployeeDetail" and "ProjectDetail" for all employee if 
--project is not assigned then display "-No Project Assigned" 
      SELECT
	  E.FirstName,
	  CASE
	      WHEN PROJECTNAME IS NULL THEN 'NO PROJECT ASSIGNED'
		  ELSE P.PROJECTNAME
		  END AS PROJECTNAME
      FROM EMPLOYEEDETAILS AS E
      LEFT JOIN PROJECTDETAILS AS P
      ON E.EmployeeID = P.EMPLOYEEDETAILID
      ORDER BY E.FirstName;

---14. Get all project name even they have not matching any 
--employeeid, in left table, order by firstname from 
--"EmployeeDetail" and "ProjectDetail
    SELECT PROJECTNAME, EMPLOYEEID
	FROM EMPLOYEEDETAILS AS ED  LEFT JOIN PROJECTDETAILS AS PD
	ON ED.EMPLOYEEID=PD.EMPLOYEEDETAILID
	ORDER BY FIRSTNAME;

--15. Get complete record (employeename, project name) from 
--both tables ([EmployeeDetail],[ProjectDetail]), if no match 
--found in any table then show NULL
    SELECT 
    E.FirstName,
    P.ProjectName
FROM EmployeeDetails E
FULL OUTER JOIN ProjectDetails P
    ON E.EmployeeID = P.EMPLOYEEDETAILID;

--18. Write down the query to fetch EmployeeName & Project who 
--has assign more than one project 
    SELECT FIRSTNAME,LASTNAME,PROJECTNAME
	FROM EMPLOYEEDETAILS AS E INNER JOIN PROJECTDETAILS AS P
	ON E.EMPLOYEEID=P.EMPLOYEEDETAILID
	WHERE EMPLOYEEDETAILID IN(
	SELECT EMPLOYEEDETAILID
	FROM PROJECTDETAILS
	GROUP BY EMPLOYEEDETAILID
	HAVING COUNT(PROJECTID)>1
	)
	ORDER BY FIRSTNAME,LASTNAME;

--19. Write down the query to fetch ProjectName on which more 
--than one employee are working along with EmployeeName 

 SELECT 
    P.ProjectName,
    E.FirstName
FROM EmployeeDetails E
INNER JOIN ProjectDetails P
    ON E.EmployeeID = P.EMPLOYEEDETAILID
WHERE P.ProjectName IN (
    SELECT ProjectName
    FROM ProjectDetails
    GROUP BY ProjectName
)
ORDER BY P.ProjectName, E.FirstName;

--20.Apply Cross Join in Both the tables 
    select * from EMPLOYEEDETAILS as e cross join PROJECTDETAILS as p;
	



	



	




