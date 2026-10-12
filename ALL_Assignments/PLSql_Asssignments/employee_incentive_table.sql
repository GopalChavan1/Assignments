----------------------------------- Employee & incentive table data ---------------------------------------------------------------
-- Employee table

CREATE TABLE Employeess (
    Emp_id        NUMBER(10),
    First_name    VARCHAR2(50),
    Last_name     VARCHAR2(50),
    Salary        NUMBER(12),
    Joining_date  TIMESTAMP,
    Department    VARCHAR2(50)
);

INSERT INTO Employeess (Emp_id, First_name, Last_name, Salary, Joining_date, Department) VALUES (1, 'John',    'Abraham', 1000000, TO_DATE('01-JAN-13','DD-MON-RR'), 'Banking');
INSERT INTO Employeess (Emp_id, First_name, Last_name, Salary, Joining_date, Department) VALUES (2, 'Michael', 'Clarke',  800000,  TO_DATE('01-JAN-13','DD-MON-RR'), 'Insurance');
INSERT INTO Employeess (Emp_id, First_name, Last_name, Salary, Joining_date, Department) VALUES (3, 'Roy',     'Thomas',  700000,  TO_DATE('01-FEB-13','DD-MON-RR'), 'Banking');
INSERT INTO Employeess (Emp_id, First_name, Last_name, Salary, Joining_date, Department) VALUES (4, 'Tom',     'Jose',    600000,  TO_DATE('01-FEB-13','DD-MON-RR'), 'Insurance');
INSERT INTO Employeess (Emp_id, First_name, Last_name, Salary, Joining_date, Department) VALUES (5, 'Jerry',   'Pinto',   650000,  TO_DATE('01-FEB-13','DD-MON-RR'), 'Insurance');
INSERT INTO Employeess (Emp_id, First_name, Last_name, Salary, Joining_date, Department) VALUES (6, 'Philip',  'Mathew',  750000,  TO_DATE('01-JAN-13','DD-MON-RR'), 'Services');

COMMIT;

SELECT * FROM Employeess;

--Incentives table

CREATE TABLE Incentives (
    Employee_ref_id  NUMBER(10),
    Incentive_date   TIMESTAMP,
    Incentive_amount NUMBER(10)
);

INSERT INTO Incentives (Employee_ref_id, Incentive_date, Incentive_amount) VALUES (1, TO_DATE('01-FEB-13','DD-MON-RR'), 5000);
INSERT INTO Incentives (Employee_ref_id, Incentive_date, Incentive_amount) VALUES (2, TO_DATE('01-FEB-13','DD-MON-RR'), 3000);
INSERT INTO Incentives (Employee_ref_id, Incentive_date, Incentive_amount) VALUES (3, TO_DATE('01-FEB-13','DD-MON-RR'), 4000);
INSERT INTO Incentives (Employee_ref_id, Incentive_date, Incentive_amount) VALUES (1, TO_DATE('01-JAN-13','DD-MON-RR'), 4500);
INSERT INTO Incentives (Employee_ref_id, Incentive_date, Incentive_amount) VALUES (2, TO_DATE('01-JAN-13','DD-MON-RR'), 3500);

COMMIT;

SELECT * FROM Incentives;

------------------------------------------------ Requiments & Queries --------------------------------------------------

/* 1. Write create table syntax for employee table and Incentive table */
-- employee table
CREATE TABLE table_name (
column1_name data_type, 
column2_name data_type, 
...., 
column6_name data_type
);
-- incentive table
CREATE TABLE table_name (
column1_name data_type, 
column2_name data_type, 
column3_name data_type
);


/* 2. Write syntax for insert data into table of employee table and Incentive table */
-- employee table
INSERT INTO table_name (column1_name, column2_name, ..., column6_name) VALUES (value1, value2, ..., value6);
-- incentive table
INSERT INTO table_name (column1_name, column2_name, column3_name) VALUES (value1, value2, value3);


/* 3. Get all employee details from the employee table */
SELECT * FROM employeess;

/* 4. Get First_Name,Last_Name from employee table */
SELECT first_name, last_name FROM employeess;

/* 5. Get First_Name from employee table using alias name “Employee Name” */
SELECT first_name AS employee_name FROM employeess;

/* 6. Get First_Name from employee table in upper case */
SELECT UPPER(first_name) FROM employeess;

/* 7. Select first 3 characters of FIRST_NAME from EMPLOYEE */
SELECT SUBSTR(first_name,1,3) FROM employeess; 

/* 8. Get position of 'o' in name 'John' from employee table */
SELECT INSTR(first_name,'o') FROM employeess
WHERE first_name = 'John';

/* 9. Get FIRST_NAME from employee table after removing white spaces from right side. */
SELECT RTRIM(first_name) FROM employeess;

/* 10. Get First_Name from employee table after replacing 'o' with '$' */ 
SELECT REPLACE(first_name, 'o', '$') FROM employeess;

/* 11. Get First_Name and Last_Name as single column from employee table separated by a '_' */
SELECT (first_name ||'_'|| last_name) FROM employeess;

/* 12. Get FIRST_NAME, Joining year, Joining Month and Joining Date from employee table */
SELECT first_name, extract(Year FROM joining_date), extract(Month FROM  joining_date), extract(Day FROM joining_date) 
FROM employeess;

/* 13. Get all employee details from the employee table order by First_Name Ascending */
SELECT * FROM employeess
ORDER BY first_name;

/* 14. Get all employee details from the employee table order by First_Name Ascending and Salary Descending? */
SELECT * FROM employeess
ORDER BY first_name ASC, salary DESC;

/* 15. Get employee details from employee table whose employee name is “John” */
SELECT * FROM employeess
WHERE first_name = 'John';

/* 16. Get employee details from employee table whose employee name are “John” and “Roy” */
SELECT * FROM employeess
WHERE first_name IN ('John', 'Roy');

/* 17. Get employee details from employee table whose employee name are not “John” and “Roy”. */
SELECT * FROM employeess
WHERE first_name NOT IN ('John', 'Roy');

/* 18. Get employee details from employee table whose first name starts with 'J'. */
SELECT * FROM employeess
WHERE first_name LIKE 'J%';

/* 19. Get employee details from employee table whose first name contains 'o'. */
SELECT * FROM employeess
WHERE first_name LIKE '%o%';

/* 20. Get employee details from employee table whose first name ends with 'n'. */
SELECT * FROM employeess
WHERE first_name LIKE '%n';

/* 21. Get employee details from employee table whose first name ends with 'n' and name contains 4 letters. */
SELECT * FROM employeess
WHERE first_name LIKE '___n';

/* 22. Get employee details from employee table whose first name starts with 'J' and name contains 4 letters. */
SELECT * FROM employeess
WHERE first_name LIKE 'J___';

/* 23. Get employee details from employee table who’s Salary greater than 600000. */
SELECT * FROM employeess
WHERE salary > 60000;

/* 24. Get employee details from employee table whose joining year is “2013”. */
SELECT * FROM employeess
WHERE extract(Year FROM joining_date) = '2013';

/* 25. Get employee details from employee table whose joining month is “January”. */
SELECT * FROM employeess
WHERE TRIM(to_char(joining_date, 'Month')) = 'January';
-- Alternative
SELECT * FROM employeess
WHERE to_char(joining_date, 'Month') LIKE 'January%';

/* 26. Get employee details from employee table who joined before January 1st 2013. */
SELECT * FROM employeess
WHERE joining_date < to_date('01-01-2013', 'dd-mm-yyyy');

/* 27. Get employee details from employee table who joined after January 31st */
SELECT * FROM employeess
WHERE joining_date > to_date('31-01-2013', 'dd-mm-yyyy');

/* 28. Get Joining Date and Time from employee table */
SELECT to_char(joining_date, 'dd-mm-yyyy hh24-mi-ss') FROM employeess;

/* 29. Get Joining Date, Time including milliseconds from employee table */
SELECT to_char(joining_date, 'dd-mm-yyyy hh24-mi-ss-ff3') FROM employeess;

/* 30. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table. */
SELECT (i.incentive_date -  e.joining_date)
FROM employeess e INNER JOIN incentives i
ON e.emp_id = i.employee_ref_id;

/* 31. Get department, total salary with respect to a department from employee table. */
SELECT department, SUM(salary) FROM employeess
GROUP BY department;

/* 32. Get department, total salary with respect to a department from employee table order by total salary descending. */
SELECT department, SUM(salary) FROM employeess
GROUP BY department
ORDER BY SUM(salary) DESC;

/* 33. Get department, no of employees in a department, total salary with respect to a department from employee table 
order by total salary descending. */
SELECT department, COUNT(*) AS no_emp, SUM(salary) AS total_sal FROM employeess
GROUP BY department
ORDER BY SUM(salary) DESC;

/* 34. Get department wise average salary from employee table order by salary ascending? */
SELECT department, AVG(salary) FROM employeess
GROUP BY department
ORDER BY AVG(salary);

/* 35. Get department wise maximum salary from employee table order by salary ascending? */
SELECT department, MAX(salary) FROM employeess
GROUP BY department
ORDER BY MAX(salary);

/* 36. Get department wise minimum salary from employee table order by salary ascending? */
SELECT department, MIN(salary) FROM employeess
GROUP BY department
ORDER BY MIN(salary);

/* 37. Select no of employees joined with respect to year and month from employee table. */
SELECT extract(year FROM joining_date), 
extract(month FROM joining_date), 
COUNT(emp_id) FROM employeess
GROUP BY extract(year FROM joining_date), extract(month FROM joining_date);
-- Another Approach
SELECT to_char(joining_date, 'yyyy'), 
to_char(joining_date, 'mm'), 
COUNT(emp_id) FROM employeess
GROUP BY to_char(joining_date, 'yyyy'), to_char(joining_date, 'mm');

/* 38. Select department,total salary with respect to a department from employee table 
where total salary greater than 800000 order by Total_Salary descending */
SELECT department, SUM(salary) FROM employeess
GROUP BY department
HAVING SUM(salary) > 80000
ORDER BY SUM(salary) DESC;

/* 39. Select employee details from employee table if data in incentive table? */
SELECT e.*
FROM employeess e INNER JOIN incentives i
ON e.emp_id = i.employee_ref_id;
-- unique emp
SELECT DISTINCT(e.emp_id), e.first_name, e.last_name, e.salary, e.joining_date, e.department
FROM employeess e INNER JOIN incentives i
ON e.emp_id = i.employee_ref_id;

/* 40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table */
SELECT first_name, salary,  
       CASE
         WHEN first_name = 'John' THEN (salary*(20/100))
         WHEN first_name = 'Roy' THEN (salary*(10/100))
         ELSE (salary*(15/100))
       END 
FROM employeess;
  
/* 41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' 
and Services as    'Services Dept' from employee table. */
SELECT department, 
    CASE
      WHEN department = 'Banking' THEN 'Bank Dept'
      WHEN department = 'Insurance' THEN 'Insurance Dept'
      WHEN department = 'Services' THEN 'Services Dept'
    END AS new_dept_names
FROM employeess;
-- Using DECODE
SELECT department, 
DECODE(department, 'Banking', 'Bank Dept', 'Insurance', 'Insurance Dept', 'Services', 'Services Dept') 
FROM employeess;

/* 42. Delete employee data from employee table who got incentives in incentive table */
DELETE FROM employeess
WHERE emp_id IN (SELECT employee_ref_id FROM incentives WHERE incentive_amount IS NOT NULL)

SELECT * FROM employeess;

rollback;

/* 43. Select first_name, incentive amount from employee and incentives table for those employees who have incentives. */
SELECT e.first_name, i.incentive_amount
FROM employeess e INNER JOIN incentives i
ON e.emp_id = i.employee_ref_id
WHERE i.incentive_amount IS NOT NULL;

/* 44. Select first_name, incentive amount from employee and incentives table 
for those employees who have incentives and incentive amount greater than 3000 */
SELECT e.first_name, i.incentive_amount
FROM employeess e INNER JOIN incentives i
ON e.emp_id = i.employee_ref_id
WHERE i.incentive_amount > 3000;

/* 45. Select first_name, incentive amount from employee and incentives table 
for all employees even if they didn't get incentives */
SELECT e.first_name, i.incentive_amount
FROM employeess e FULL JOIN incentives i 
ON e.emp_id = i.employee_ref_id;

/* 46. Select first_name, incentive amount from employee and incentives table 
for all employees even if they didn't get incentives and set incentive amount as 0 
for those employees who didn't get incentives. */
SELECT e.first_name, NVL(i.incentive_amount,0)
FROM employeess e FULL JOIN incentives i 
ON e.emp_id = i.employee_ref_id;

/* 47. Select first_name, incentive amount from employee and incentives table 
for all employees who got incentives using left join */
SELECT e.first_name, i.incentive_amount
FROM employeess e LEFT JOIN incentives i 
ON e.emp_id = i.employee_ref_id
WHERE i.incentive_amount IS NOT NULL;

/* 48. Select max incentive with respect to employee from employee and incentives table using sub query. */
-- using inline sub query
SELECT *  FROM (SELECT DISTINCT(e.emp_id), e.first_name, e.last_name, e.salary, e.joining_date, e.department,
MAX(incentive_amount) OVER(PARTITION BY employee_ref_id)
FROM employeess e INNER JOIN incentives i
ON e.emp_id = i.employee_ref_id);

-- without according to employees (From all employees max_incentive employee details)
SELECT * FROM employeess
WHERE emp_id = (SELECT employee_ref_id FROM incentives
WHERE incentive_amount = (SELECT max(incentive_amount) FROM incentives));

