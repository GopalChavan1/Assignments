-- ============================================================
-- company_sql_practice_setup.sql
-- MySQL 8.x
-- Separate setup/data file requested for the 5-day SQL practice.
-- Creates 5 core tables + a supporting audit table for Day 4.
-- ============================================================

DROP DATABASE IF EXISTS company_sql_practice;
CREATE DATABASE company_sql_practice;
USE company_sql_practice;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(15,2),
    created_at DATE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(120) NOT NULL,
    department_id INT NOT NULL,
    manager_id INT NULL,
    job_title VARCHAR(100),
    salary DECIMAL(12,2) NOT NULL,
    hire_date DATE NOT NULL,
    status ENUM('Active','Inactive','Leave') DEFAULT 'Active',
    email VARCHAR(180) UNIQUE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    customer_email VARCHAR(180) UNIQUE,
    city VARCHAR(100),
    segment VARCHAR(50),
    signup_date DATE,
    credit_limit DECIMAL(14,2)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL,
    customer_id INT NOT NULL,
    department_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    project_budget DECIMAL(15,2),
    status ENUM('Planned','Active','Completed','On Hold') DEFAULT 'Planned',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('Pending','Shipped','Delivered','Cancelled') NOT NULL,
    sales_channel ENUM('Web','Mobile','Partner','Store') NOT NULL,
    total_amount DECIMAL(14,2) DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE employee_projects (
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    role_name VARCHAR(100),
    allocation_pct DECIMAL(5,2),
    assigned_date DATE,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    review_date DATE NOT NULL,
    rating DECIMAL(3,2),
    review_text VARCHAR(500),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE salary_audit (
    audit_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    salary_snapshot DECIMAL(12,2),
    captured_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------
-- Departments: 12 different departments
-- ------------------------------------------------------------
INSERT INTO departments VALUES
(1,'Engineering','Pune',6500000,'2020-01-10'),
(2,'Data & Analytics','Bengaluru',5200000,'2020-03-15'),
(3,'Finance','Mumbai',4200000,'2019-07-01'),
(4,'Human Resources','Pune',3000000,'2018-04-20'),
(5,'Sales','Delhi',7000000,'2019-09-12'),
(6,'Marketing','Hyderabad',4800000,'2020-06-05'),
(7,'Operations','Chennai',5600000,'2018-11-18'),
(8,'Customer Success','Noida',3900000,'2021-02-08'),
(9,'Product','Bengaluru',6100000,'2020-08-17'),
(10,'Cyber Security','Pune',4500000,'2021-05-25'),
(11,'Procurement','Mumbai',3300000,'2019-12-02'),
(12,'Legal','Delhi',2800000,'2022-01-11');

-- ------------------------------------------------------------
-- Employees: 120 distinct records
-- Managers are assigned after insertion to satisfy self-FK.
-- ------------------------------------------------------------
INSERT INTO employees
(employee_id,employee_name,department_id,manager_id,job_title,salary,hire_date,status,email)
VALUES
(1001,'Aarav Kulkarni',1,NULL,'VP Engineering',185000,'2018-01-15','Active','aarav.k@example.com'),
(1002,'Isha Mehta',2,NULL,'Head of Analytics',172000,'2018-06-11','Active','isha.m@example.com'),
(1003,'Rohan Shah',3,NULL,'Finance Director',165000,'2017-09-04','Active','rohan.s@example.com'),
(1004,'Neha Patil',4,NULL,'HR Director',145000,'2019-02-18','Active','neha.p@example.com'),
(1005,'Vikram Rao',5,NULL,'Sales Director',178000,'2017-11-21','Active','vikram.r@example.com'),
(1006,'Sana Khan',6,NULL,'Marketing Director',158000,'2019-08-12','Active','sana.k@example.com'),
(1007,'Aditya Nair',7,NULL,'Operations Director',160000,'2018-03-19','Active','aditya.n@example.com'),
(1008,'Priya Deshmukh',8,NULL,'Customer Success Director',150000,'2020-01-06','Active','priya.d@example.com'),
(1009,'Kunal Joshi',9,NULL,'Product Director',175000,'2018-12-10','Active','kunal.j@example.com'),
(1010,'Meera Iyer',10,NULL,'Security Director',168000,'2019-05-27','Active','meera.i@example.com'),
(1011,'Sameer Gupta',11,NULL,'Procurement Director',138000,'2020-04-13','Active','sameer.g@example.com'),
(1012,'Tanya Singh',12,NULL,'Legal Director',155000,'2021-01-18','Active','tanya.s@example.com');

-- Employees 1013-1120: varied data
INSERT INTO employees
(employee_id,employee_name,department_id,manager_id,job_title,salary,hire_date,status,email)
SELECT
  1012 + n,
  CONCAT('Employee_',1012+n),
  MOD(n-1,12)+1,
  1000 + MOD(n-1,12)+1,
  CASE MOD(n,6)
    WHEN 0 THEN 'Senior Analyst'
    WHEN 1 THEN 'Software Engineer'
    WHEN 2 THEN 'Business Analyst'
    WHEN 3 THEN 'Associate Manager'
    WHEN 4 THEN 'Specialist'
    ELSE 'Consultant'
  END,
  55000 + MOD(n*7919,90000),
  DATE_ADD('2019-01-01', INTERVAL MOD(n*37,2700) DAY),
  CASE MOD(n,17) WHEN 0 THEN 'Leave' WHEN 1 THEN 'Inactive' ELSE 'Active' END,
  CONCAT('employee_',1012+n,'@example.com')
FROM (
  SELECT ones.n + tens.n*10 + hundreds.n*100 AS n
  FROM
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) ones
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2) hundreds
) nums
WHERE n BETWEEN 1 AND 108;

-- Customers: 500 distinct records
INSERT INTO customers
(customer_id,customer_name,customer_email,city,segment,signup_date,credit_limit)
SELECT
  n,
  CONCAT('Customer_',n),
  CONCAT('customer_',n,'@example.com'),
  ELT(MOD(n-1,10)+1,'Pune','Mumbai','Bengaluru','Delhi','Hyderabad','Chennai','Noida','Kolkata','Jaipur','Ahmedabad'),
  ELT(MOD(n-1,5)+1,'Enterprise','SMB','Consumer','Startup','Mid-Market'),
  DATE_ADD('2020-01-01',INTERVAL MOD(n*23,2400) DAY),
  25000 + MOD(n*1777,475000)
FROM (
  SELECT ones.n + tens.n*10 + hundreds.n*100 AS n
  FROM
    (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
     UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) ones
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) hundreds
) nums
WHERE n BETWEEN 1 AND 500;

-- Projects: 120 projects across customers/departments
INSERT INTO projects
(project_id,project_name,customer_id,department_id,start_date,end_date,project_budget,status)
SELECT
  n,
  CONCAT('Project_',n),
  MOD(n-1,500)+1,
  MOD(n-1,12)+1,
  DATE_ADD('2021-01-01',INTERVAL MOD(n*17,1700) DAY),
  DATE_ADD(DATE_ADD('2021-01-01',INTERVAL MOD(n*17,1700) DAY),INTERVAL (90+MOD(n*13,540)) DAY),
  100000 + MOD(n*27191,4900000),
  ELT(MOD(n-1,4)+1,'Planned','Active','Completed','On Hold')
FROM (
  SELECT ones.n + tens.n*10 + hundreds.n*100 AS n
  FROM
    (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
     UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) ones
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) hundreds
) nums
WHERE n BETWEEN 1 AND 120;

-- Employee/project many-to-many assignments
INSERT INTO employee_projects(employee_id,project_id,role_name,allocation_pct,assigned_date)
SELECT
  1013 + MOD(n*7,108),
  1 + MOD(n*11,120),
  ELT(MOD(n,5)+1,'Developer','Analyst','Lead','Consultant','Project Manager'),
  25 + MOD(n*7,76),
  DATE_ADD('2022-01-01',INTERVAL MOD(n*19,1200) DAY)
FROM (
  SELECT ones.n + tens.n*10 + hundreds.n*100 AS n
  FROM
    (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
     UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) ones
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) hundreds
) nums
WHERE n BETWEEN 1 AND 600;

-- Orders: 3000 distinct records
INSERT INTO orders(order_id,customer_id,order_date,status,sales_channel,total_amount)
SELECT
  50000+n,
  1+MOD(n*37,500),
  DATE_ADD('2022-01-01',INTERVAL MOD(n*11,1700) DAY),
  ELT(MOD(n-1,4)+1,'Pending','Shipped','Delivered','Cancelled'),
  ELT(MOD(n-1,4)+1,'Web','Mobile','Partner','Store'),
  0
FROM (
  SELECT ones.n + tens.n*10 + hundreds.n*100 + thousands.n*1000 AS n
  FROM
    (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
     UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) ones
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) hundreds
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2) thousands
) nums
WHERE n BETWEEN 1 AND 3000;

-- 6000 order items: 2 per order
INSERT INTO order_items(order_id,product_id,quantity,unit_price)
SELECT 50000 + MOD(n-1,3000)+1,
       1+MOD(n*17,250),
       1+MOD(n,5),
       50+MOD(n*313,4950)
FROM (
  SELECT ones.n + tens.n*10 + hundreds.n*100 + thousands.n*1000 AS n
  FROM
    (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
     UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) ones
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) hundreds
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2) thousands
) nums
WHERE n BETWEEN 1 AND 6000;

UPDATE orders o
JOIN (
  SELECT order_id, SUM(quantity*unit_price) total
  FROM order_items GROUP BY order_id
) x ON x.order_id=o.order_id
SET o.total_amount=x.total;

-- 1000 performance reviews
INSERT INTO performance_reviews(employee_id,review_date,rating,review_text)
SELECT
  1013+MOD(n*7,108),
  DATE_ADD('2022-01-01',INTERVAL MOD(n*29,1500) DAY),
  ROUND(1 + MOD(n*13,41)/10, 2),
  CONCAT('Performance review ',n)
FROM (
  SELECT ones.n + tens.n*10 + hundreds.n*100 AS n
  FROM
    (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
     UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) ones
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
  CROSS JOIN
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) hundreds
) nums
WHERE n BETWEEN 1 AND 1000;

-- Validation
SELECT 'departments' table_name, COUNT(*) row_count FROM departments
UNION ALL SELECT 'employees', COUNT(*) FROM employees
UNION ALL SELECT 'customers', COUNT(*) FROM customers
UNION ALL SELECT 'projects', COUNT(*) FROM projects
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'employee_projects', COUNT(*) FROM employee_projects
UNION ALL SELECT 'performance_reviews', COUNT(*) FROM performance_reviews;
