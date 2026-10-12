
-- CREATING TABLE SALESPEOPLE
CREATE TABLE Salespeople(
Snum number primary key,
Sname varchar2(20),
City varchar2(20),
Comm float
);

-- INSERTING DATA INTO SALESPEOPLE TABLE
INSERT INTO Salespeople VALUES(1001,'Peel','London',.12);
INSERT INTO Salespeople VALUES(1002,'Serres','San Jose',.13);
INSERT INTO Salespeople VALUES(1004,'Monika','London',.11);
INSERT INTO Salespeople VALUES(1007,'Rifkin','Barcelona',.15);
INSERT INTO Salespeople VALUES(1003,'Axelrod','New York',.10);
INSERT INTO Salespeople VALUES(1005,'Franc',	'London',	.26);

-- SHOW DATA PRESENT IN SALESPEOPLE TABLE
SELECT * FROM Salespeople;

--------------------------------------------------------------------------------------

-- CREATING TABLE CUSTOMERS
CREATE TABLE Customers(
Cnum number primary key,
Cname varchar2(20),
City varchar2(20),
Rating number,
Snum number REFERENCES Salespeople(Snum) NOT NULL

-- ANOTHER WAY OF WRITING FOREIGN KEY SYNTAX
-- FOREIGN KEY(Snum) REFERENCES Salespeople(Snum)
);

-- INSERTING DATA INTO CUSTOMERS TABLE
INSERT INTO Customers VALUES(2001, 'Hoffman', 'London', 100, 1001);
INSERT INTO Customers VALUES(2002, 'Giovanni','Rome',  200, 1003);
INSERT INTO Customers VALUES(2003, 'Liu', 'San Jose',  200, 1002);
INSERT INTO Customers VALUES(2004, 'Grass', 'Berlin',  300, 1002);
INSERT INTO Customers VALUES(2006, 'Clemens', 'London',  100, 1001);
INSERT INTO Customers VALUES(2008, 'Cisneros', 'San Jose', 300, 1007);
INSERT INTO Customers VALUES(2007, 'Pereira', 'Rome',  100, 1004);

-- SHOW DATA PRESENT IN CUSTOMERS TABLE
SELECT * FROM Customers;

---------------------------------------------------------------------------------------

-- CREATING TABLE ORDERS
CREATE TABLE Orders(
Onum number primary key,
Amt float(20),
Odate date,
Cnum number REFERENCES Customers(Cnum) ON DELETE CASCADE NOT NULL,
Snum number REFERENCES Salespeople(Snum) ON DELETE CASCADE NOT NULL
);

drop table orders
-- INSERTING DATA INTO ORDERS TABLE
INSERT INTO Orders VALUES(3001,  18.69, TO_DATE('03-Oct-96 12:30', 'DD-MON-YY HH24:MI'),  2008,  1007);
INSERT INTO Orders VALUES(3003,  767.19,  TO_DATE('03-Oct-96 13:45','DD-MON-YY HH24:MI'), 2001,  1001);

INSERT INTO Orders VALUES(3002,  1900.10, TO_DATE('03-Oct-96 12:05','DD-MON-YY HH24:MI'), 2007,  1004);
INSERT INTO Orders VALUES(3005,  5160.45, TO_DATE('03-Oct-96 14:00','DD-MON-YY HH24:MI'), 2003,  1002);

INSERT INTO Orders VALUES(3006,  1098.16, TO_DATE('03-Oct-96 13:37','DD-MON-YY HH24:MI'), 2008,  1007);
INSERT INTO Orders VALUES(3009,  1713.23, TO_DATE('04-Oct-96 15:21','DD-MON-YY HH24:MI'), 2002,  1003);
INSERT INTO Orders VALUES(3007,  75.75, TO_DATE('04-Oct-96 16:02','DD-MON-YY HH24:MI'),  2002,  1003);
INSERT INTO Orders VALUES(3008,  4723.00, TO_DATE('05-Oct-96 12:07','DD-MON-YY HH24:MI'), 2006,  1001);
INSERT INTO Orders VALUES(3010,  1309.95, TO_DATE('06-Oct-96 13:12','DD-MON-YY HH24:MI'), 2004,  1002);
INSERT INTO Orders VALUES(3011,  9891.88, TO_DATE('06-Oct-96 13:09','DD-MON-YY HH24:MI'), 2006,  1001);
INSERT INTO Orders VALUES(3012,  3455.78, TO_DATE('04-Oct-96 15:21','DD-MON-YY HH24:MI'), 2002,  1003);
INSERT INTO Orders VALUES(3013,  1245.98, TO_DATE('04-Oct-96 16:32','DD-MON-YY HH24:MI'), 2002,  1003);
INSERT INTO Orders VALUES(3014,  3721.53, TO_DATE('05-Oct-96 12:45','DD-MON-YY HH24:MI'), 2006,  1001);
INSERT INTO Orders VALUES(3015,  734.50,  TO_DATE('06-Oct-96 13:16','DD-MON-YY HH24:MI'), 2004,  1002);
INSERT INTO Orders VALUES(3016,  1729.67, TO_DATE('06-Oct-96 13:07','DD-MON-YY HH24:MI'), 2006,  1001);

-- SHOWS DATA PRESENT IN TABLE Orders
SELECT * FROM Orders;
------------------------------------------------------------------------------------------------------

-------------- QUESTIONS AND ANSWERS-------------------

--Q1.List all customers with a rating of 100.
select * from customers
where RATING = 100;

------------------------------------------------------------------------------------------------------

--Q2.Find all records in the Customer table with NULL values in the city column.
select * from customers
where city is null;

------------------------------------------------------------------------------------------------------

--Q3.**Find the largest order taken by each salesperson on each date.
select ODATE,SNUM,MAX(AMT) Max_Amount
from orders
group by ODATE,SNUM
order by ODATE,SNUM desc

------------------------------------------------------------------------------------------------------

--Q4.Arrange the Orders table by descending customer number.
select * from orders
order by cnum desc;

------------------------------------------------------------------------------------------------------

--Q5.Find which salespeople currently have orders in the Orders table.
select distinct(SP.SNUM), SP.SNAME from salespeople sp
inner join orders o
on sp.snum = o.snum

-- using subquery
SELECT snum,sname FROM salespeople SP
where SP.snum IN(
                  SELECT snum FROM orders
                );
------------------------------------------------------------------------------------------------------

--Q6.List names of all customers matched with the salespeople serving them.
select CNAME from customers cust
inner join Salespeople sp
on cust.SNUM = SP.SNUM;

-- using subquery
SELECT cname FROM customers C
where C.SNUM IN(
                  SELECT snum FROM salespeople 
                );

------------------------------------------------------------------------------------------------------

--Q7.**Find the names and numbers of all salespeople who had more than one customer.
SELECT sp.SNUM,sp.SNAME 
FROM salespeople sp
WHERE sp.SNUM IN (
                   SELECT c.SNUM
                   FROM customers c
                   GROUP BY c.SNUM
                   HAVING COUNT(SNUM) > 1
                 );

SELECT sp.SNUM,sp.SNAME 
FROM salespeople sp 
WHERE 1 < 
    (SELECT COUNT(*) 
     FROM customers c
     WHERE sp.SNUM = c.SNUM);

------------------------------------------------------------------------------------------------------

--Q8.Count the orders of each of the salespeople and output the results in descending order.
SELECT snum,COUNT(onum) ORDER_COUNT
FROM orders 
GROUP BY snum 
ORDER BY COUNT(onum) DESC;

------------------------------------------------------------------------------------------------------

--Q9.List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
SELECT * 
FROM customers
WHERE city = 'San Jose';

SELECT * from customers 
WHERE city in(select city 
FROM customers where city='San Jose' 
GROUP BY city 
HAVING COUNT(city)>1)

-----------------------------------------------------------------------------------------------------

--Q10.Match salespeople to customers according to what city they lived in.
SELECT sname,cname,S.city 
FROM salespeople S 
INNER JOIN customers C
ON S.city = C.city;

------------------------------------------------------------------------------------------------------

--Q11.Find the largest order taken by each salesperson.
SELECT snum,max(amt) max_amount
FROM orders
GROUP BY snum
ORDER BY 1;

-----------------------------------------------------------------------------------------------------

--Q12.Find customers in San Jose who has a rating above 200.
SELECT *
FROM customers
WHERE city = 'San Jose' AND rating > 200

------------------------------------------------------------------------------------------------------

--Q13.List the names and commissions of all salespeople in London.
SELECT sname,comm
FROM salespeople
WHERE city = 'London'

------------------------------------------------------------------------------------------------------

--Q14.List all the orders of salesperson Monika from the Orders table.
SELECT s.sname,o.onum,o.amt,o.odate,o.cnum
FROM orders o
inner join salespeople s
on o.snum = s.snum
where s.sname = 'Monika';

-- USING SUBQUERY
SELECT * FROM orders o
WHERE snum IN(
                 SELECT snum FROM salespeople s
                 WHERE sname = 'Monika'
             );

------------------------------------------------------------------------------------------------------

--Q15.Find all customers with orders on October 3.
SELECT c.*,o.odate
FROM customers c
INNER JOIN orders o
ON c.cnum = o.cnum
where to_char(odate,'DD-MON') = '03-OCT';

--USING SUBQUERY
SELECT * FROM customers c
WHERE c.cnum IN(
                 SELECT cnum FROM ORDERS 
                 WHERE to_char(odate,'DD-MON') = '03-OCT');

------------------------------------------------------------------------------------------------------

--Q16.Give the sums of the amounts from the orders table, grouped by date
--Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
SELECT to_char(odate,'DD-MON-YY'),SUM(amt)
FROM orders
GROUP BY to_char(odate,'DD-MON-YY')
HAVING SUM(amt) >2000;

------------------------------------------------------------------------------------------------------

--Q18.****Select all orders that had amounts that were greater than at least one of the orders from October 6.

SELECT max(amt)
FROM orders
where to_char(odate,'DD-MON') = '06-OCT';

------------------------------------------------------------------------------------------------------

--Q19.**Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
select sname,snum 
from salespeople s 
where exists( 
              select rating from customers c 
              where c.snum=s.snum and c.rating=300
            );
            
------------------------------------------------------------------------------------------------------

--Q20.**Find all pairs of customers having the same rating.
--SELECT cname,rating FROM customers ORDER BY rating

SELECT  c1.cname, c2.cname, c1.rating 
FROM customers c1, customers c2
WHERE c1.rating = c2.rating and c1.cnum < c2.cnum
ORDER BY rating;

------------------------------------------------------------------------------------------------------

--Q21.****Find all customers with CNUM, 1000 above the SNUM of Serres.
SELECT * FROM CUSTOMERS

------------------------------------------------------------------------------------------------------

--Q22.Give the salespeople’s commissions as percentage instead of decimal numbers.
SELECT sname, comm*100 as commission_pct
FROM salespeople

------------------------------------------------------------------------------------------------------

--Q23.Find the largest order taken by each salesperson on each date, eliminating those MAX orders, 
--which are less than $3000.00 in value.
SELECT snum,to_char(odate,'DD-MON-YY'),max(amt) max_amount
FROM orders
GROUP BY snum,to_char(odate,'DD-MON-YY')
HAVING MAX(AMT) > 3000
--ORDER BY snum,to_char(odate,'DD-MON-YY')
ORDER BY 1,2;

------------------------------------------------------------------------------------------------------

--Q24.List the largest orders on October 3, for each salesperson.
SELECT snum,to_char(odate,'DD-MON-YY'),max(amt) max_amount
FROM orders 
WHERE to_char(odate,'DD-MON') = '03-OCT'
GROUP BY snum,to_char(odate,'DD-MON-YY')
--HAVING to_char(odate,'DD-MON') = '03-OCT'
ORDER BY snum;

------------------------------------------------------------------------------------------------------

--Q25.**Find all customers located in cities where Serres (SNUM 1002) has customers.
select cname,city from customers where city in(select city from salespeople
WHERE SNUM = 1002)

select a.snum,a.sname,b.cname,b.city from salespeople a,customerS b where a.snum=b.snum and b.snum=1002;


------------------------------------------------------------------------------------------------------

--Q26.Select all customers with a rating above 200.00.
SELECT * 
FROM customers
WHERE rating > 200

------------------------------------------------------------------------------------------------------

--Q27.Count the number of salespeople currently listing orders in the Orders table.
SELECT COUNT(DISTINCT snum) No_Of_Salespeople
FROM orders;

------------------------------------------------------------------------------------------------------

--Q28.Write a query that produces all customers serviced by salespeople with a commission above 12%. 
--Output the customer’s name and the salesperson‘s rate of commission.
SELECT c.cname,s.comm
FROM salespeople s
INNER JOIN customers c
ON s.snum = c.snum AND s.comm > 0.12

------------------------------------------------------------------------------------------------------

--Q29.Find salespeople who have multiple customers.
SELECT s.snum,s.sname,count(c.snum) Count_of_customers
FROM salespeople s
INNER JOIN customers c
ON s.snum = c.snum
GROUP BY s.snum,s.sname
HAVING COUNT(c.snum) > 1

------------------------------------------------------------------------------------------------------

--30.Find salespeople with customers located in their city.
SELECT s.snum,s.sname,c.cname,c.city
FROM salespeople s
INNER JOIN customers c
ON s.city = c.city

------------------------------------------------------------------------------------------------------

-- Q31.Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.
SELECT *
FROM salespeople
WHERE sname LIKE 'P__l%';

------------------------------------------------------------------------------------------------------

--Q32.Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. 
--Assume you do not know his customer number.
SELECT * FROM orders
WHERE snum IN(
                SELECT snum FROM customers
                WHERE cname ='Cisneros'
              );

------------------------------------------------------------------------------------------------------

--Q33.Find the largest orders for ‘Serres’ and ‘Rifkin’.
SELECT snum,max(amt) FROM orders
GROUP BY snum
HAVING snum IN (
SELECT snum FROM salespeople
WHERE sname IN ('Serres','Rifkin'));

------------------------------------------------------------------------------------------------------

--34.Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.
SELECT snum,sname,comm,city
FROM salespeople;

------------------------------------------------------------------------------------------------------

--Q35.Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
SELECT * 
FROM customers
WHERE cname BETWEEN 'A' AND 'G';

------------------------------------------------------------------------------------------------------

--Q36.****Select all the possible combinations of customers that you can assign.

select a.cname,b.cname from customers a,customers b where a.snum=b.snum 
and a.cname != b.cname;


------------------------------------------------------------------------------------------------------

--Q37.Select all orders that are greater than the average for October 4.
SELECT *
FROM orders
WHERE amt > (
              SELECT AVG(amt) Average_amount FROM orders --1622
              WHERE to_char(odate,'DD') = '04'
             )
ORDER BY amt;

------------------------------------------------------------------------------------------------------

--Q38.**Write a select command using a correlated sub query that selects the names and numbers of 
--all customers with ratings equal to the maximum for their city.

SELECT cnum,cname
FROM customers c1
WHERE rating IN (
                  SELECT MAX(rating) 
                  FROM customers c2
                  WHERE c1.city = c2.city 
                );

------------------------------------------------------------------------------------------------------

--Q39.Write a query that totals the orders for each day and places the results in descending order.
SELECT to_char(odate,'DD-MON-YY'),SUM(amt) TOTAL_ORDER_AMOUNT
FROM orders
GROUP BY to_char(odate,'DD-MON-YY')
ORDER BY 2 DESC;

------------------------------------------------------------------------------------------------------

--Q40.Write a select command that produces the rating followed by the name of each customer in San Jose.
SELECT cname,rating
FROM customers
WHERE city = 'San Jose';

------------------------------------------------------------------------------------------------------

--41.**Find all orders with amounts smaller than any amount for a customer in San Jose.
SELECT cnum,onum,max(amt) FROM orders
GROUP BY cnum,onum
HAVING cnum IN(
               SELECT cnum FROM customers -- cnum = 2003,2008
               WHERE city ='San Jose'
             );
             
             
             
 Select onum, amt
from orders
where amt < (select max(amt)
                  from orders, customers
                  where city = 'Berlin' and
                        orders.cnum = customers.cnum);

------------------------------------------------------------------------------------------------------

--Q42.Find all orders with above average amounts for their customers.
select c.cname,o.onum,o.amt 
from customers c inner join orders o
on c.cnum = o.cnum and amt > ( 
                               select avg(amt) from orders  --2503
                             ) 
------------------------------------------------------------------------------------------------------

--Q43.Write a query that selects the highest rating in each city.
SELECT city,max(rating)
FROM customers
GROUP BY city;

------------------------------------------------------------------------------------------------------

--Q44.**Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.
SELECT s.snum, s.sname, SUM(o.amt * s.comm) AS total_commission
FROM Salespeople s
JOIN Orders o ON s.snum = o.snum
JOIN Customers c ON o.cnum = c.cnum
WHERE c.rating > 100.00
GROUP BY s.snum, s.sname; 
------------------------------------------------------------------------------------------------------

--Q45.Count the customers with rating above San Jose’s average.
SELECT COUNT(*) No_of_Customers
FROM customers
WHERE rating > (
                 SELECT avg(rating) from customers 
                 where city = 'San Jose'
               );

------------------------------------------------------------------------------------------------------

--Q46.Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.
SELECT s1.sname, s2.sname
FROM salespeople s1, salespeople s2
ORDER BY s1.sname DESC;

------------------------------------------------------------------------------------------------------

--Q47.Find all salespeople that are located in either Barcelona or London.
SELECT *
FROM salespeople
WHERE city IN ('Barcelona','London');

------------------------------------------------------------------------------------------------------

--Q48.Find all salespeople with only one customer.
SELECT snum,sname 
FROM salespeople s
WHERE snum IN(
               SELECT snum FROM customers -- SNUM = 1003,1004,1007
               HAVING count(snum) = 1 
               GROUP BY snum 
             );
                          
------------------------------------------------------------------------------------------------------

--Q49.Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.
SELECT c1.cname, c2.cname
FROM customers c1, customers c2
WHERE c1.snum = c2.snum AND c1.cname != c2.cname;
             
------------------------------------------------------------------------------------------------------

--Q50.Write a query that will give you all orders for more than $1000.00.
SELECT * 
FROM orders 
WHERE amt>1000;

------------------------------------------------------------------------------------------------------

--Q51.Write a query that lists each order number followed by the name of the customer who made that order.
SELECT c.cnum,c.cname,o.*
FROM customers c
INNER JOIN orders o
ON c.cnum = o.cnum;

------------------------------------------------------------------------------------------------------

--Q52.**Write 2 queries that select all salespeople (by name and number) who have customers in their cities 
--who they do not service, one using a join and one a correlated subquery. Which solution is more elegant?

SELECT s.snum,s.sname
FROM salespeople s
WHERE EXISTS(
                  SELECT 1 FROM customers c
                  WHERE s.city != c.city and s.snum = c.snum
                  );
                 
--USING JOIN
SELECT DISTINCT s.snum,s.sname
FROM salespeople s
INNER JOIN customers c
ON s.snum = c.snum and s.city != c.city;

------------------------------------------------------------------------------------------------------

--Q53.Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.
SELECT cname
FROM customers 
WHERE rating>= ANY(
                SELECT rating
                FROM customers
                WHERE snum IN (
                                SELECT snum 
                                FROM salespeople
                                WHERE sname = 'Serres'
                              )
              );
              
-- WHAT IS "ANY" DOING HERE
--The subquery returns a list of RATING (e.g., (300, 200)).
--The outer query checks if a RATING is greater than any value in that list (e.g., >= 200 OR >= 300).
--The condition is satisfied if the rating is greater than the minimum value in the subquery's result set.

--WHERE rating > ANY (...) is true if the rating is greater than the minimum subquery value.
--WHERE rating > ALL (...) is true if the rating is greater than the maximum subquery value.  

------------------------------------------------------------------------------------------------------

--Q54.Write2 queries that will produce all orders taken on October3 or October 4.
SELECT *
FROM orders
where to_char(odate,'DD') = '03' or to_char(odate,'DD') = '04';

SELECT *
FROM orders
where to_char(odate,'DD') IN ('03','04');

------------------------------------------------------------------------------------------------------

--Q55.Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.
SELECT o1.onum as order1, o2.onum as order2 
FROM orders o1, orders o2 
WHERE o1.cnum = o2.cnum and 
o1.onum < o2.onum;

------------------------------------------------------------------------------------------------------

--Q56.Find only those customers whose ratings are higher than every customer in Rome.
SELECT cname
FROM customers
WHERE rating > (
                  SELECT MAX(rating) 
                  FROM customers
                  WHERE city = 'Rome'
               );

------------------------------------------------------------------------------------------------------

--Q57.Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, 
--unless they are located in Rome.
SELECT *
FROM customers
WHERE city = 'Rome' OR rating > 100;

------------------------------------------------------------------------------------------------------

--Q58.Find all rows from the Customer table for which the salesperson number is 1001.
SELECT * 
FROM customers
WHERE snum = 1001;
              
------------------------------------------------------------------------------------------------------

--Q59.Find the total amount in Orders for each salesperson for which this total is greater than 
--the amount of the largest order in the table.
SELECT o.snum,SUM(amt) as Total_Amount
FROM orders o
GROUP BY o.snum
HAVING SUM(amt) > (
                    SELECT MAX(amt) Highest_Order --9891
                    FROM orders
                  );
                  
------------------------------------------------------------------------------------------------------

--Q60.Write a query that selects all orders that have Zeroes or NULL in the Amount field.
SELECT *
FROM orders
WHERE amt is NULL or amt = 0;

------------------------------------------------------------------------------------------------------

--Q61.Produce all combinations of salespeople and customer names such that the 
--former precedes the latter alphabetically, and the latter has a rating of less than 200.
SELECT s.sname, c.cname,c.rating
FROM salespeople s, customers c
WHERE s.snum = c.snum and rating < 200
GROUP BY s.sname,c.cname,c.rating
ORDER BY 1;

------------------------------------------------------------------------------------------------------

--Q62.**List all salespeople’s names and the commission they have earned.
SELECT sname,comm
FROM salespeople;

SELECT s.sname,SUM(comm*amt) Total_commission --calculates comm per order
FROM salespeople s
INNER JOIN orders o
ON s.snum = o.snum
GROUP BY s.sname;

------------------------------------------------------------------------------------------------------

--Q63.Write a query that produces the names and cities of all customers with the same rating as Hoffman. 
--Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.
SELECT cname,city 
FROM customers 
where rating IN (
                  SELECT rating         --100
                  FROM customers
                  WHERE cnum = (
                                 SELECT cnum        --2001
                                 FROM customers
                                 WHERE cname = 'Hoffman'
                                )
                  );

------------------------------------------------------------------------------------------------------

--Q64.Find all salespeople for whom there are customers that follow them in alphabetical order.
SELECT s.sname,c.cname
FROM salespeople s, customers c
WHERE s.snum = c.snum
GROUP BY s.sname,c.cname
HAVING c.cname >= s.sname;

------------------------------------------------------------------------------------------------------

--65.****Write a query that produces the names and ratings of all customers of all who have above average orders.
SELECT c.cname, c.rating
FROM customers c,orders o
WHERE c.cnum = o.cnum and rating > (
                        SELECT AVG(amt) FROM orders o --2503
                      );

------------------------------------------------------------------------------------------------------

--Q66.Find the sum of all purchases from the Orders table.
SELECT SUM(amt) as purchase_Amt
FROM orders;

------------------------------------------------------------------------------------------------------

--Q67.Write a select command that produces the order number, amount, and date for all rows in the Order table.
SELECT onum,amt,odate FROM orders;

------------------------------------------------------------------------------------------------------

--Q68.Count the number of not null rating fields in the Customer table including duplicates.
SELECT count(*) as count
FROM customers
WHERE rating IS NOT NULL;

------------------------------------------------------------------------------------------------------

--Q69.Write a query that gives the names of both the salesperson and the customer for each order after the order number.
SELECT o.onum,s.sname,c.cname
FROM salespeople s, customers c, orders o 
WHERE s.snum=c.snum and c.cnum=o.cnum;

------------------------------------------------------------------------------------------------------

--Q70.List the commissions of all salespeople servicing customers in London.
SELECT s.sname,s.comm,c.cname
FROM salespeople s, customers c
WHERE s.snum = c.snum and c.city = 'London'

------------------------------------------------------------------------------------------------------

--Q71.Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.


------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
