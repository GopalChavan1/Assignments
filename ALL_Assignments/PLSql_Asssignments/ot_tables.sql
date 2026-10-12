--------------------------------------------------------------------------------------

SHOW CON_NAME;


SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS
WHERE USERNAME = 'GR';

GRANT CREATE SESSION, CREATE TABLE TO GR;

ALTER USER GR QUOTA UNLIMITED ON USERS;

SELECT USER FROM dual;

SELECT table_name
FROM user_tables
WHERE table_name = 'COUNTRIES';


SELECT owner, table_name
FROM all_tables
WHERE table_name = 'COUNTRIES';

SELECT table_name
FROM user_tables
ORDER BY table_name;

SHOW PDBS;

ALTER SESSION SET CONTAINER = ORCLPDB1;

--------------------------------------------------------------------------------------

-- 8/aug
-- subquery
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM HR.DEPARTMENT WHERE DEPARTMNET_NAME = 'IT')

---------------------------------------------------------------------------
-- execute the following statements to create tables
---------------------------------------------------------------------------
-- regions

CREATE TABLE regions
  (
    region_id NUMBER  PRIMARY KEY,
    region_name VARCHAR2( 50 ) NOT NULL
  );


  SELECT ABS(-100) FROM dual;


-- NEAREST LARGEST WHOLE NUMBER
  SELECT CEIL(112.89), CEIL(12.10) FROM DUAL;

-- NEAREST LOWEST WHOLE NUMBER
SELECT FLOOR(112.99) FROM DUAL;

-- ROUND () - COMBINATION OF CEIL & FLOOR 
SELECT ROUND(12.45) FROM DUAL;

SELECT ROUND(12.55) FROM DUAL;

SELECT ROUND(15.6789, 3) FROM DUAL;

SELECT MOD(18,4) FROM DUAL;

SELECT TRUNC(10.567) FROM DUAL;

SELECT TRUNC(10.999) FROM DUAL;

SELECT TRUNC(10.567, 1) FROM DUAL;

SELECT TRUNC(10.898, 2) FROM DUAL;

SELECT POWER(2,3) FROM DUAL;

SELECT POWER(3,18) FROM DUAL;

-- SELECT SQUARES()

SELECT SQRT(18) FROM DUAL;

-- SELECT LOG

-- ASCII
SELECT ASCII('A'), ASCII('a') from DUAL;

SELECT ASCII(' ') FROM DUAL;

-- CHR
SELECT CHR(65), CHR(97), CHR(32) FROM DUAL;

-- CONCAT
SELECT CONCAT('HELLO ', 'WORLD') FROM DUAL;

-- SELECT CONCAT()

-- LENGTH
SELECT LENGTH('HELOWOR') FROM DUAL;

SELECT LENGTH('.  HEL. ') FROM DUAL;

SELECT * FROM employees WHERE LENGTH(first_name) < 5;

-- substr - EXTRACT FROM WHICH INDEX TO WHICH INDEX
SELECT SUBSTR('HELLO HOW ARE YOU', 1,9) FROM DUAL;

SELECT SUBSTR('HELLO HOW ARE YOU ', -7, 3) FROM DUAL;

SELECT SUBSTR('HELLO HOW ARE YOU ', -7, -3) FROM DUAL;

-- INSTR
SELECT INSTR('HELLO HOW ARE YOU', 'HOW') FROM DUAL;

SELECT INSTR('HELLO HOW ARE YOU', 'HOW' , 2 ) FROM DUAL;

-- USE SUBSTR + INSTR COMBINE

SELECT INSTR('HELLO HOW ARE YOU H', 'H', 11) FROM DUAL;
-- THIS IS THE STARTING POSITION THE 3RD PARAMETER

SELECT INSTR('HELLO HOW ARE YOY.   HELLO', 'HELLO', 1, 2) FROM DUAL;
-- WHICH 'H' TO FETCH THE FIRST ONE THE 2ND ONE OR THE 3RD ONE IS THE 4TH PARAMETER

SELECT first_name, UPPER(first_name), LOWER(first_name), email, INITCAP(email) from employees;

SELECT TRIM('   HELLO   WORLD. ') FROM DUAL;

SELECT TRIM ('H' FROM 'HELHHHLOHHHH HHWORLDHH') FROM DUAL;
SELECT LTRIM('HHHHELLOH', 'H') FROM DUAL;

SELECT RTRIM('HEELLOOH', 'H') FROM DUAL;

SELECT RTRIM('HELLO', 'HELO') FROM DUAL;

SELECT REPLACE('ORACLE DATABASE', 'DATABASE', 'CLOUD') FROM DUAL;

SELECT TRANSLATE('12345', '123', 'ABC') FROM DUAL;

SELECT REPLACE('12345', '123', 'ABC') FROM DUAL;

SELECT REPLACE('12345', '123', 'A' ) FROM DUAL;

SELECT TRANSLATE('12345', '123', 'A') FROM DUAL;

-- REPLACING STRING BY STRING
SELECT REPLACE('12345', '321', 'ABC') FROM DUAL;

-- REPLACING CHARACTER BY CHAR 
SELECT TRANSLATE('12345', '321', 'ABC') FROM DUAL;

-- RPAD
SELECT RPAD('123', 16, '*') FROM DUAL;

-- LPAD
SELECT LPAD('123', 16, '*') FROM DUAL;

-- REGEX SUBSTR
SELECT REGEXP_SUBSTR('ABC123XY456Z', '\d+', 2) FROM DUAL;



-- 1. Display all regions.
SELECT * FROM regions;



-- 2. Display region having region_id = 2.
SELECT * FROM regions WHERE region_id = 2;

-- 3. Display regions except region_id 3.
SELECT * FROM regions WHERE region_id NOT IN (3);

-- 4. Display regions whose name starts with 'A'.
SELECT * FROM regions WHERE region_name LIKE 'A%';

-- 5. Display regions ending with 'a'.
SELECT * FROM regions WHERE region_name LIKE '%a';


-- 6. Display regions containing letter 'm'.
SELECT * FROM regions WHERE region_name LIKE '%m%';

-- 7. Display regions ordered alphabetically
SELECT * FROM regions  ORDER BY region_name;

-- 8. Display regions ordered by region_id descending.
SELECT * FROM regions ORDER BY region_id DESC;

-- 9. Categorize regions: region_id <=2 → Old Region otherwise → New Region
SELECT region_id, region_name,
CASE WHEN region_id <= 2 THEN 'Old Region'
     ELSE 'New Region'
END AS REGION_CATEGORY
  FROM regions;

-- 10. Display region_name using DECODE on region_id
SELECT region_name, DECODE(region_id, region_id, region_name) FROM regions; 

-- 11. Display even region_ids.
SELECT region_id FROM regions WHERE MOD(region_id,2)=0;

-- countries table

CREATE TABLE countries
  (
    country_id   CHAR( 2 ) PRIMARY KEY  ,
    country_name VARCHAR2( 40 ) NOT NULL,
    region_id    NUMBER                 , -- fk
    CONSTRAINT fk_countries_regions FOREIGN KEY( region_id )
      REFERENCES regions( region_id ) 
      ON DELETE CASCADE
  );

  -- 1. Display countries belonging to region 1.
  SELECT * FROM countries WHERE region_id = 1;

  -- 2. Display countries not belonging to region 2.
  SELECT * FROM countries WHERE region_id NOT IN (2);

  -- 3. Display countries whose name starts with 'U'.
  SELECT * FROM countries WHERE country_name LIKE 'U%';

  -- 4. Display countries ending with 'a'.
  SELECT * FROM countries WHERE country_name LIKE '%a';

  -- 5. Display countries containing 'United'.
  SELECT * FROM countries WHERE country_name LIKE '%United%';

  -- 6. Display countries ordered by country_name
  SELECT * FROM countries ORDER BY country_name;

  -- 7. Display number of countries in every region
  SELECT COUNT(*), region_id FROM countries GROUP BY region_id;

  -- 8. Display regions having more than five countries.
  SELECT region_id FROM countries GROUP BY region_id HAVING COUNT(DISTINCT country_id)>5; 

  -- 9. Categorize countries: Europe Americas Asia Others using region_id.

  SELECT 

  country_name,
  region_id,
  country_id,
    CASE WHEN REGION_ID = 1 THEN 'Europe'
         WHEN REGION_ID = 2 THEN 'America'
         WHEN REGION_ID = 3 THEN 'Asia'
        --  WHEN REGION_ID = 4 THEN 'Others'
    ELSE 'Others'
    END AS region_categories
FROM countries;
-- GROUP BY 


  -- 10. Convert region_id into region names.
  SELECT DECODE(region_id, region_id, country_name) FROM countries;

  -- 11. Display every country along with total countries in its region.
  SELECT * FROM 
 ( SELECT country_id, country_name, COUNT( country_id) OVER (PARTITION BY region_id ORDER BY REGION_ID) AS total_countries FROM countries) 


  -- 12. Display every country along with row number inside every region.
  SELECT COUNTRY_ID, country_name  ,ROW_NUMBER() OVER (PARTITION BY region_id ORDER BY region_id DESC) FROM countries

  -- 13. Rank countries alphabetically within every region.
  SELECT COUNTRY_ID, COUNTRY_NAME, RANK() OVER (ORDER BY country_name ) FROM countries;

  

-- location
CREATE TABLE locations
  (
    location_id NUMBER  
                PRIMARY KEY       ,
    address     VARCHAR2( 255 ) NOT NULL,
    postal_code VARCHAR2( 20 )          ,
    city        VARCHAR2( 50 )          ,
    state       VARCHAR2( 50 )          ,
    country_id  CHAR( 2 )               , -- fk
    CONSTRAINT fk_locations_countries 
      FOREIGN KEY( country_id )
      REFERENCES countries( country_id ) 
      ON DELETE CASCADE
  );

  -- 1.  Display locations belonging to country US
  SELECT * FROM locations WHERE COUNTRY_ID = 'US';

  -- 2. Display locations whose city starts with 'S'.
  SELECT * FROM LOCATIONS WHERE city LIKE 'S%';

  -- 3. Display locations between location_id 10 and 25.
  SELECT * FROM LOCATIONS WHERE LOCATION_ID BETWEEN 10 AND 25;

  -- 4. Display locations ordered by city.
  SELECT * FROM LOCATIONS ORDER BY CITY;

  -- 5. Display number of locations in every country.
  SELECT country_id, city, address, COUNT(*) FROM locations  GROUP BY country_id, city, address

  -- 6. Display countries having more than one location.

SELECT COUNTRY_ID, COUNT(*) AS TOTAL_LOCATIONS FROM LOCATIONS GROUP BY COUNTRY_ID HAVING COUNT(*) > 1

  -- 7. Categorize locations based on country.
    SELECT 
        CASE WHEN COUNTRY_ID = 'IT' THEN 'ITALY'
             WHEN COUNTRY_ID = 'JP' THEN 'JAPAN'
             WHEN COUNTRY_ID = 'US' THEN 'UNITED STATE'
          ELSE COUNTRY_ID
          END AS location_category

          FROM locations

  -- 8. Display every location with total locations in its country.
    SELECT LOCATION_ID, ADDRESS , COUNTRY_ID ,
    -- COUNT(LOCATION_ID) OVER (PARTITION BY COUNTRY_ID) AS TOTAL_LOCATIONS 
    COUNT(LOCATION_ID) OVER (PARTITION BY COUNTRY_ID ) AS TOTAL_LOCATIONS 
    FROM LOCATIONS;

    -- 9. Display first location of every country.
    SELECT location_id,
    country_id, SER_DET(location_id) OVER (PARTITION BY country_id ORDER BY location_id ) FROM locations;

  --  10. Display last location of every country
  SELECT LOCATION_ID, COUNTRY_ID, LAST_VALUE(LOCATION_ID) OVER (PARTITION BY COUNTRY_ID ORDER BY LOCATION_ID ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING) FROM LOCATIONS;
-- warehouses
CREATE TABLE warehouses
  (
    warehouse_id NUMBER 
                 PRIMARY KEY,
    warehouse_name VARCHAR( 255 ) ,
    location_id    NUMBER( 12, 0 ), -- fk
    CONSTRAINT fk_warehouses_locations 
      FOREIGN KEY( location_id )
      REFERENCES locations( location_id ) 
      ON DELETE CASCADE
  );

-- 1. Display warehouses located in location_id 13.
SELECT * FROM WAREHOUSES WHERE LOCATION_ID = 13;

-- 2. Display warehouses ordered by warehouse_name.
SELECT * FROM WAREHOUSES ORDER BY WAREHOUSE_NAME;

-- 3. Display warehouses whose name starts with 'S'.
SELECT * FROM WAREHOUSES WHERE WAREHOUSE_NAME LIKE 'S%';

-- 4. Display number of warehouses in every location
SELECT LOCATION_ID, COUNT(*) FROM WAREHOUSES GROUP BY LOCATION_ID ORDER BY LOCATION_ID

-- 5. Display every warehouse with warehouse count in its location.
SELECT LOCATION_ID, COUNT(*) OVER (PARTITION BY LOCATION_ID ORDER BY LOCATION_ID) as warehouse_count FROM WAREHOUSES

-- 6. Rank warehouses by warehouse_id.
SELECT WAREHOUSE_NAME, RANK() OVER (ORDER BY WAREHOUSE_ID) FROM WAREHOUSES

-- employees
CREATE TABLE employees
  (
    employee_id NUMBER 
                PRIMARY KEY,
    first_name VARCHAR( 255 ) NOT NULL,
    last_name  VARCHAR( 255 ) NOT NULL,
    email      VARCHAR( 255 ) NOT NULL,
    phone      VARCHAR( 50 ) NOT NULL ,
    hire_date  DATE NOT NULL          ,
    manager_id NUMBER( 12, 0 )        , -- fk
    job_title  VARCHAR( 255 ) NOT NULL,
    CONSTRAINT fk_employees_manager 
        FOREIGN KEY( manager_id )
        REFERENCES employees( employee_id )
        ON DELETE CASCADE
  );



-- 1. Employees hired after 2016.
SELECT * FROM EMPLOYEES WHERE EXTRACT(YEAR FROM HIRE_DATE) > 2015

SELECT EXTRACT('MM' FROM to_date)

-- 2. Employees hired between two dates.
SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN ('07-06-15') AND ('07-06-16')

-- 3. Employees having manager.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL

-- 4. Employees without manager.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NULL

-- 5. Employees whose first_name starts with A.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'A%';

-- 6. Count employees under every manager.
SELECT MANAGER_ID COUNT(*) FROM EMPLOYEES GROUP BY MANAGER_ID

-- 7. Managers having more than 3 employees.
SELECT MANAGER_ID, COUNT(*) FROM EMPLOYEES GROUP BY MANAGER_ID HAVING COUNT(*)>3

-- 8. Assign row number according to hire_date.
SELECT MANAGER_ID, ROW_NUMBER() OVER (ORDER BY HIRE_DATE) FROM EMPLOYEES;

-- 9. Assign row number within every manager.
SELECT  ROW_NUMBER() OVER (PARTITION BY MANAGER_ID ORDER BY MANAGER_ID) FROM EMPLOYEES;

-- 10. Rank employees by hire_date
SELECT HIRE_DATE, RANK() OVER (ORDER BY HIRE_DATE) FROM EMPLOYEES;

-- 11. Rank employees under every manager.
SELECT RANK() OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE ) FROM EMPLOYEES;

-- 12. Find first employee under every manager.
SELECT MANAGER_ID, EMPLOYEE_ID FROM (
SELECT MANAGER_ID, EMPLOYEE_ID, DENSE_RANK() OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE) AS DENSE_RNK FROM EMPLOYEES)
WHERE DENSE_RNK = 1;

-- 13. Find second employee under every manager.
SELECT EMPLOYEE_ID FROM (SELECT MANAGER_ID, EMPLOYEE_ID, DENSE_RANK() OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE) AS DENSE_RNK FROM EMPLOYEES) 
WHERE DENSE_RNK = 2

-- 14. Count employees under each manager.

SELECT COUNT(*), MANAGER_ID FROM EMPLOYEES GROUP BY MANAGER_ID; 

SELECT * FROM EMPLOYEES;
-- 15. Earliest hired employee under every manager.
SELECT rowid, MIN(HIRE_DATE), MANAGER_ID, EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES GROUP BY MANAGER_ID, EMPLOYEE_ID, FIRST_NAME, rowid;

SELECT  MANAGER_ID, EMPLOYEE_ID, FIRST_NAME, MIN(to_date(HIRE_DATE)) OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE) FROM EMPLOYEES;

SELECT EMPLOYEE_ID FROM (SELECT EMPLOYEE_ID, MANAGER_ID , MIN(HIRE_DATE) FROM EMPLOYEES GROUP BY MANAGER_ID, EMPLOYEE_ID )

SELECT FIRST_NAME, EMPLOYEE_ID, MANAGER_ID,MIN(HIRE_DATE) FROM EMPLOYEES ORDER BY MANAGER_ID, HIRE_DATE

SELECT SER_DET
SELECT FIRST_NAME, EMPLOYEE_ID, MANAGER_ID, MIN(HIRE_DATE) OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE) FROM EMPLOYEES;

SELECT HIRE_DATE, MANAGER_ID, t
FROM (
 SELECT MANAGER_ID ,HIRE_DATE, ROW_NUMBER() OVER (PARTITION BY MANAGER ID  ORDER BY HIRE_DATE ASC) AS t
 FROM EMPLOYEES
 WHERE MANAGER ID IS NOT NULL
)
WHERE t=1;

SELECT MANAGER_ID, HIRE_DATE
FROM (
    SELECT 
        MANAGER_ID,
        HIRE_DATE,
        ROW_NUMBER() OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE ASCE) AS t
    FROM EMPLOYEES
    WHERE MANAGER_ID IS NOT NULL
) 
WHERE t = 1;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, HIRE_DATE 
FROM (
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, HIRE_DATE, ROW_NUMBER() 
OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE ) AS t FROM EMPLOYEES)
WHERE t = 1;

SELECT  MANAGER_ID,(SELECT FIRST_NAME FROM EMPLOYEES),  MIN(HIRE_DATE) FROM EMPLOYEES GROUP BY MANAGER_ID;

SELECT EMPLOYEE_ID, FIRST_NAME,  MANAGER_ID, min_hire_date FROM 
(
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, MIN(HIRE_DATE) OVER ( PARTITION BY MANAGER_ID ORDER BY HIRE_DATE) AS min_hire_Date FROM EMPLOYEES
)
-- GROUP BY MANAGER_ID, min_hire_date

-- 16. Latest hired employee under every manager.
SELECT EMPLOYEE_ID, MANAGER_ID, HIRE_DATE, FIRST_NAME FROM (
SELECT EMPLOYEE_ID, MANAGER_ID, HIRE_DATE, FIRST_NAME, ROW_NUMBER() OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE DESC) AS t FROM EMPLOYEES)
WHERE t = 1;


-- 17. Compare current hire_date with previous employee.
SELECT EMPLOYEE_ID, LAG(HIRE_DATE) OVER (ORDER BY HIRE_DATE) FROM EMPLOYEES; 

-- 18. Compare current employee with previous employee under same manager.
SELECT EMPLOYEE_ID, MANAGER_ID, LAG(HIRE_DATE) OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE) FROM EMPLOYEES;

-- 19. Compare current employee with next employee.
SELECT EMPLOYEE_ID, FIRST_NAME, LEAD(HIRE_DATE) OVER (ORDER BY HIRE_DATE) FROM EMPLOYEES 

-- 20. Display first employee under every manager
SELECT * FROM EMPLOYEES
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID FROM 
(

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, SER_DET(employee_id) OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE) AS t, ROW_NUMBER() OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE) AS b FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL

) 
WHERE 
b = 1


-- 21. Display latest employee under every manager.
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID FROM
(
(SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, LAST_VALUE(employee_id) OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE DESC) AS T, ROW_NUMBER() OVER (PARTITION BY MANAGER_ID ORDER BY HIRE_DATE DESC) AS B FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL)
) WHERE B = 1 

-- 22. Employees hired: Before 2015 2015-2020 After 2020
SELECT 
  EMPLOYEE_ID, 
  MANAGER_ID, 
  HIRE_DATE,
  FIRST_NAME,

  CASE WHEN HIRE_DATE < DATE '2015-01-01' THEN 'BEFORE 2015'
       WHEN HIRE_DATE  BETWEEN DATE '2015-01-01' AND DATE '2020-12-31' THEN 'BETWEEN 2015-2020'
       ELSE 'AFTER 2020'
  END AS PERIOD_OF_HIRING
 FROM EMPLOYEES 

--23. Replace NULL manager with "No Manager".
SELECT EMPLOYEE_ID, FIRST_NAME, NVL(to_char(MANAGER_ID), 'NO MANAGER') AS MANAGER_ID
FROM EMPLOYEES

-- 24. Display "Managed" or "Top Level".
SELECT EMPLOYEE_ID, FIRST_NAME, NVL2(MANAGER_ID, 'MANAGED', 'TOP LEVEL') AS EMPLOYEE_TYPE
FROM EMPLOYEES;

-- 25. Return manager_id otherwise employee_id.
SELECT COALESCE(TO_CHAR(MANAGER_ID), TO_CHAR(EMPLOYEE_ID), 'NO ID FOUND') FROM EMPLOYEES;

-- 26. Compare employee_id and manager_id.
SELECT EMPLOYEE_ID, MANAGER_ID, NULLIF(EMPLOYEE_ID, MANAGER_ID) AS COMPARISON FROM EMPLOYEES;

-- 27. Display employees having even employee_id.
SELECT * FROM EMPLOYEES WHERE MOD(EMPLOYEE_ID, 2) != 0

-- 28. Display hire_date in DD-MON-YYYY
SELECT HIRE_DATE, TO_CHAR(HIRE_DATE, 'DD-MON-YYYY') FROM EMPLOYEES;

-- 29. Display month name
SELECT  TO_CHAR(EXTRACT(MONTH FROM HIRE_DATE )) FROM EMPLOYEES;

SELECT EXTRACT (MONTH FROM TO_CHAR(HIRE_DATE)) FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE, 'MONTH'), TO_CHAR(HIRE_DATE, 'FMMONTH') FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE, 'FMMONTH') FROM EMPLOYEES;

-- 30. Display year.
SELECT EXTRACT (YEAR FROM HIRE_DATE) FROM EMPLOYEES;

WHERE MANAGER_ID IS NULL

ORDER BY MANAGER_ID

SELECT HIRE_DATE, MIN(HIRE_DATE) FROM EMPLOYEES GROUP BY HIRE_DATE

SELECT * FROM EMPLOYEES ORDER BY HIRE_DATE;
-- WHERE MIN(min_hire_date)

-- product category
CREATE TABLE product_categories
  (
    category_id NUMBER 
                PRIMARY KEY,
    category_name VARCHAR2( 255 ) NOT NULL
  );

  -- 1. Categories starting with C.
  SELECT * FROM PRODUCT_CATEGORIES WHERE CATEGORY_NAME LIKE 'C%';

  -- 2. Categories ordered alphabetically.
  SELECT * FROM PRODUCT_CATEGORIES ORDER BY CATEGORY_NAME

  -- 3. Count products in every category.
  SELECT COUNT(*), CATEGORY_NAME FROM PRODUCT_CATEGORIES GROUP BY CATEGORY_NAME

  -- 4. Categories having more than 5 products
  SELECT CATEGORY_NAME FROM PRODUCT_CATEGORIES GROUP BY CATEGORY_NAME HAVING COUNT(*) = 1

  -- 5. Rank categories alphabetically.
  SELECT CATEGORY_NAME, RANK()  OVER (ORDER BY CATEGORY_NAME ) FROM PRODUCT_CATEGORIES

-- products table
CREATE TABLE products
  (
    product_id NUMBER 
               
               PRIMARY KEY,
    product_name  VARCHAR2( 255 ) NOT NULL,
    description   VARCHAR2( 2000 )        ,
    standard_cost NUMBER( 9, 2 )          ,
    list_price    NUMBER( 9, 2 )          ,
    category_id   NUMBER NOT NULL         ,
    CONSTRAINT fk_products_categories 
      FOREIGN KEY( category_id )
      REFERENCES product_categories( category_id ) 
      ON DELETE CASCADE
  );

  -- 1. Products costing more than 500.
  SELECT * FROM PRODUCTS WHERE LIST_PRICE >500;

  -- 2. Products costing between 100 and 1000
  SELECT * FROM PRODUCTS WHERE LIST_PRICE  BETWEEN 100 AND 1000;

  -- 3. Products ending with "Phone"
  SELECT * FROM PRODUCTS WHERE PRODUCT_NAME LIKE 'P%';

  -- 4. Products ordered by list_price.
  SELECT * FROM PRODUCTS ORDER BY LIST_PRICE

  -- 5. Average price per category
  SELECT CATEGORY_ID, COUNT(*), ROUND(SUM(LIST_PRICE)/ COUNT(*), 2), ROUND(AVG(LIST_PRICE), 2)

  FROM PRODUCTS 
  GROUP BY CATEGORY_ID

SELECT CEIL(15.13), FLOOR(15.13) FROM DUAL;


-- customers
CREATE TABLE customers
  (
    customer_id NUMBER 
                
                PRIMARY KEY,
    name         VARCHAR2( 255 ) NOT NULL,
    address      VARCHAR2( 255 )         ,
    website      VARCHAR2( 255 )         ,
    credit_limit NUMBER( 8, 2 )
  );

-- contacts

CREATE TABLE contacts
  (
    contact_id NUMBER 
               
               PRIMARY KEY,
    first_name  VARCHAR2( 255 ) NOT NULL,
    last_name   VARCHAR2( 255 ) NOT NULL,
    email       VARCHAR2( 255 ) NOT NULL,
    phone       VARCHAR2( 20 )          ,
    customer_id NUMBER                  ,
    CONSTRAINT fk_contacts_customers 
      FOREIGN KEY( customer_id )
      REFERENCES customers( customer_id ) 
      ON DELETE CASCADE
  );

-- orders table
CREATE TABLE orders
  (
    order_id NUMBER 
            
             PRIMARY KEY,
    customer_id NUMBER( 6, 0 ) NOT NULL, -- fk
    status      VARCHAR( 20 ) NOT NULL ,
    salesman_id NUMBER( 6, 0 )         , -- fk
    order_date  DATE NOT NULL          ,
    CONSTRAINT fk_orders_customers 
      FOREIGN KEY( customer_id )
      REFERENCES customers( customer_id )
      ON DELETE CASCADE,
    CONSTRAINT fk_orders_employees 
      FOREIGN KEY( salesman_id )
      REFERENCES employees( employee_id ) 
      ON DELETE SET NULL
  );
-- order items
CREATE TABLE order_items
  (
    order_id   NUMBER( 12, 0 )                                , -- fk
    item_id    NUMBER( 12, 0 )                                ,
    product_id NUMBER( 12, 0 ) NOT NULL                       , -- fk
    quantity   NUMBER( 8, 2 ) NOT NULL                        ,
    unit_price NUMBER( 8, 2 ) NOT NULL                        ,
    CONSTRAINT pk_order_items 
      PRIMARY KEY( order_id, item_id ),
    CONSTRAINT fk_order_items_products 
      FOREIGN KEY( product_id )
      REFERENCES products( product_id ) 
      ON DELETE CASCADE,
    CONSTRAINT fk_order_items_orders 
      FOREIGN KEY( order_id )
      REFERENCES orders( order_id ) 
      ON DELETE CASCADE
  );
-- inventories
CREATE TABLE inventories
  (
    product_id   NUMBER( 12, 0 )        , -- fk
    warehouse_id NUMBER( 12, 0 )        , -- fk
    quantity     NUMBER( 8, 0 ) NOT NULL,
    CONSTRAINT pk_inventories 
      PRIMARY KEY( product_id, warehouse_id ),
    CONSTRAINT fk_inventories_products 
      FOREIGN KEY( product_id )
      REFERENCES products( product_id ) 
      ON DELETE CASCADE,
    CONSTRAINT fk_inventories_warehouses 
      FOREIGN KEY( warehouse_id )
      REFERENCES warehouses( warehouse_id ) 
      ON DELETE CASCADE
  );



-- SET OPERATORS (UNION, UNION ALL, INTERSECT, MINUS)

--  UNION
-- Tables: employees, customers

-- 1. Display all names of employees and customers without duplicates.
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM EMPLOYEES

UNION

SELECT NAME
FROM CUSTOMERS;