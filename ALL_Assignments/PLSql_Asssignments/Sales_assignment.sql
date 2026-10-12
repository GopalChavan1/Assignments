CREATE TABLE Sales_people(
Snum NUMBER PRIMARY KEY,
Sname VARCHAR(100),
City VARCHAR(100),
Comm DECIMAL(10 , 2)
);

INSERT INTO Sales_people (Snum,Sname,City,Comm)
VALUES (1001,'Peel','London',0.12);
INSERT INTO Sales_people (Snum,Sname,City,Comm)
VALUES (1002,'Serres','San Jose',0.13);
INSERT INTO Sales_people (Snum,Sname,City,Comm)
VALUES (1004,'Monika','London',0.11);
INSERT INTO Sales_people (Snum,Sname,City,Comm)
VALUES (1007,'Rifkin','Barcelona',0.15);
INSERT INTO Sales_people (Snum,Sname,City,Comm)
VALUES (1003,'Axelrod','New York',0.10);
INSERT INTO Sales_people (Snum,Sname,City,Comm)
VALUES (1005,'Franc','London',0.26);

SELECT * FROM Sales_people

-----------------------------------------------------------------------------------------------------

CREATE TABLE Customers(
Cnum NUMBER PRIMARY KEY,
Cname VARCHAR2(100),
City VARCHAR2(100),
Rating NUMBER,
Snum NUMBER,
FOREIGN KEY (Snum)  REFERENCES Sales_people (Snum)
);

INSERT INTO Customers(Cnum,Cname,City,Rating,Snum)
VALUES (2001,'Hoffman','London',100,1001);
INSERT INTO Customers(Cnum,Cname,City,Rating,Snum)
VALUES (2002,'Giovanni','Rome',200,1003);
INSERT INTO Customers(Cnum,Cname,City,Rating,Snum)
VALUES (2003,'Liu','San Jose',200,1002);
INSERT INTO Customers(Cnum,Cname,City,Rating,Snum)
VALUES (2004,'Grass','Berlin',300,1002);
INSERT INTO Customers(Cnum,Cname,City,Rating,Snum)
VALUES (2006,'Clemens','London',100,1001);
INSERT INTO Customers(Cnum,Cname,City,Rating,Snum)
VALUES (2008,'Cisneros','San Jose',300,1007);
INSERT INTO Customers(Cnum,Cname,City,Rating,Snum)
VALUES (2007,'Pereira','Rome',100,1004);

SELECT * FROM Customers;

--------------------------------------------------------------------------------------------------
DROP TABLE  ORDERS;
CREATE TABLE ORDERS(
Onum NUMBER PRIMARY KEY,
Amt DECIMAL(10,2),
Odate DATE,
Cnum NUMBER,
Snum NUMBER,
FOREIGN KEY (Cnum)  REFERENCES Customers(Cnum),
FOREIGN KEY (Snum)  REFERENCES Sales_people(Snum)
);

INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3001,18.69,TO_date('03-OCT-96 12:30','DD-MM-YY HH24:MI'),2008,1007);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3003,767.19,TO_date('03-OCT-96 13:45','DD-MM-YY HH24:MI'),2001,1001);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3002,1900.10,TO_date('03-OCT-96 12:05','DD-MM-YY HH24:MI'),2007,1004);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3005,5160.45,TO_date('03-OCT-96 14:00','DD-MM-YY HH24:MI'),2003,1002);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3006,1096.16,TO_date('03-OCT-96 13:37','DD-MM-YY HH24:MI'),2008,1007);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3009,1713.23,TO_date('04-OCT-96 15:21','DD-MM-YY HH24:MI'),2002,1003);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3007,75.75,TO_date('04-OCT-96 16:02','DD-MM-YY HH24:MI'),2002,1003);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3008,4713.23,TO_date('05-OCT-96 12:07','DD-MM-YY HH24:MI'),2006,1001);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3010,1309.95,TO_date('06-OCT-96 13:12','DD-MM-YY HH24:MI'),2004,1002);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3011,9891.88,TO_date('06-OCT-96 13:09','DD-MM-YY HH24:MI'),2006,1001);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3012,3455.78,TO_date('04-OCT-96 15:21','DD-MM-YY HH24:MI'),2002,1003);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3013,1245.98,TO_date('04-OCT-96 16:32','DD-MM-YY HH24:MI'),2002,1003);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3014,3721.53,TO_date('05-OCT-96 12:45','DD-MM-YY HH24:MI'),2006,1001);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3015,734.50,TO_date('06-OCT-96 13:16','DD-MM-YY HH24:MI'),2004,1002);
INSERT INTO ORDERS (Onum,Amt,Odate,Cnum,Snum)
VALUES (3016,1729.67,TO_date('06-OCT-96 13:07','DD-MM-YY HH24:MI'),2006,1001);

SELECT * FROM ORDERS;

select* from salespeople;
select * from Customers;
select * from Orders;

--1)List all customers with a rating of 100.
select cname from customers where rating = 100;

select cname from customers where rating not in (200,300);

--2)Find all records in the Customer table with NULL values in the city column.
select * from customers where city is null;


--3)Find the largest order taken by each salesperson on each date.
select s.sname,to_date(o.odate), max(o.amt) 
from salespeople s join orders o on s.snum=o.snum
group by to_date(odate),s.sname

select s.sname,to_date(o.odate),o.amt
from salespeople s join orders o 
on s.snum=o.snum
where o.amt in(select max(amt) from orders group by snum);

--4)Arrange the Orders table by descending customer number.
select * from orders order by cnum desc;

select * 
from(select o.*, row_number() over(order by cnum desc) from orders o);

--5)Find which salespeople currently have orders in the Orders table.
select snum,sname from salespeople
where snum in(select snum from orders);

select s.sname,o.snum from salespeople s join orders o 
on s.snum=o.snum 
group by s.sname,o.snum

--6)List names of all customers matched with the salespeople serving them.
select c.cname ,s.sname from customers c join salespeople s on c.snum=s.snum;

select c.cname , listagg(s.sname,',') within group (order by c.cname)
from customers c join salespeople s on c.snum=s.snum
group by c.cname;

--7)Find the names and numbers of all salespeople who had more than one customer.
select s.sname,o.snum from salespeople s join orders o on s.snum=o.snum
group by s.sname,o.snum 
having count(o.snum)>1;

select o.snum,s.sname from salespeople s join orders o on s.snum=o.snum 
group by s.sname,o.snum
having count(o.onum)>1;

--8)Count the orders of each of the salespeople and output the results in descending order
select s.sname , count(o.snum) from salespeople s join orders o on s.snum = o.snum
group by s.sname 
order by count(o.snum) desc;

select snum,count(snum) from orders 
group by snum 
order by count(snum) desc

--9)List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
select * from customers where city='San Jose';

select cname,city from customers 
group by cname,city \

having count(cnum)>=1 and city ='San Jose';

select * from customers ;
--10)Match salespeople to customers according to what city they lived in.
select s.sname , c.cname from salespeople s join customers c on s.snum=c.snum
where s.city = c.city;

select s.sname,s.city,c.cname,c.city from salespeople s join customers c on s.snum=c.snum
where s.city=c.city;

--11)Find the largest order taken by each salesperson.
select o.snum,max(o.amt) from salespeople s join orders o on s.snum=o.snum 
group by o.snum;


--12)Find customers in San Jose who has a rating above 200.
select cname from customers where city ='San Jose' and rating > 200;

--13)List the names and commissions of all salespeople in London
select sname,comm from salespeople where lower(city) ='london';

--14)List all the orders of salesperson Monika from the Orders table
select * from orders 
where snum =(select snum 
             from salespeople 
             where sname='Monika');
             
--15)Find all customers with orders on October 3.
select c.cnum,c.cname,o.odate from customers c join orders o on c.cnum=o.cnum 
where to_date(odate)='03-Oct-96';
 
--16)Give the sums of the amounts from the orders table, grouped by date.
select to_date(odate), sum(amt) total_amt from orders
group by to_date(odate);


--17)Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
select to_date(odate),sum(amt),(max(amt)+2000) from orders
group by to_date(odate)
having sum(amt)>(max(amt)+2000);


--18)	Select all orders that had amounts that were greater than at least one of the orders from October 6.
 select * from orders 
 where amt> any(select amt from orders where to_date(odate)='06-Oct-96');

--19)Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
 select sname from salespeople 
 where exists (select snum 
               from customers
               where salespeople.snum=customers.snum and rating=300);
               
--20)Find all pairs of customers having the same rating. 

select cname, rating, dense_rank()over(order by rating desc)drn 
from customers;

select distinct c1.cname,c1.rating,c2.cname,c2.rating from customers c1,customers c2
where c1.cnum<>c2.cnum and c1.rating=c2.rating

--21) Find all customers with CNUM, 1000 above the SNUM of Serres.
select cnum ,cname from customers
where cnum > (select snum+1000
              from salespeople where sname= 'Serres' );

--22)Give the salespeople’s commissions as percentage instead of decimal numbers.
select snum,sname,city, comm*100 percentage_comm 
from salespeople;

--23)	Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value
select snum,to_date(odate),max(amt) from orders
group by snum,to_date(odate)
having max(amt)>3000;

--24)List the largest orders on October 3, for each salesperson.
select s.snum,max(o.amt),(to_date(o.odate)) from orders o join salespeople s on o.snum=s.snum
group by (to_date(o.odate)),s.snum,to_date(o.odate)
having to_date(o.odate)='03-Oct-96';

--25)Find all customers located in cities where Serres (SNUM 1002) has customers.
select cname,city from customers
where snum=1002;

--26)Select all customers with a rating above 200.
select * from customers where rating >200;

--27)Count the number of salespeople currently listing orders in the Orders table.
select count(snum) from orders ;

--28)	Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission.
select c.cname, s.comm from salespeople s join customers c on s.snum=c.snum
where s.comm*100> 12;

--29)Find salespeople who have multiple customers.
select sname from salespeople
where snum in (select snum from customers 
               group by snum
               having count(snum)>1);
--30)Find salespeople with customers located in their city.
select s.sname , c.cname from  salespeople s join customers c on s.snum=c.snum
where s.city = c.city;

--31)Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.
select sname from salespeople where sname like 'P__l';
%r
--32)Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
select * from orders
where cnum =(select cnum from customers where cname='Cisneros');

--33)	Find the largest orders for ‘Serres’ and ‘Rifkin’.
select max(amt) from orders
where snum in (select snum from salespeople 
               where sname= 'Serres' and sname ='Rifkin');
               
--34)	Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.
select snum,sname,comm,city from salespeople;

--35)Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
select * from customers 
where cname between 'A%' And 'G%';

--36)	Select all the possible combinations of customers that you can assign.
select s.snum,c.cnum 
from salespeople s, customers c


--37) Select all orders that are greater than the average for October 4.
select * from orders
where amt > (select avg(amt)
             from orders
             where to_date(odate) ='04-Oct-96' )
             
--38)	Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city.
select cname,cnum from customers 
where rating in (select max(rating) 
                from customers 
                group by city);
                
--39)	Write a query that totals the orders for each day and places the results in descending order.
select to_date(odate), sum(amt)
from orders 
group by to_date(odate)
order by sum(amt) desc

--40) Write a select command that produces the rating followed by the name of each customer in San Jose.
select rating , cname from customers 
where city = 'San Jose';

--41)	Find all orders with amounts smaller than any amount for a customer in San Jose.
select * from orders 
where amt  < any (select amt
                  from orders 
                  where cnum in (select cnum
                                 from customers
                                 where city='San Jose'));
                                 
--42) Find all orders with above average amounts for their customers.
select * from orders
where amt > all(select avg(amt)
                from orders
                group by cnum);
                

--43)	Write a query that selects the highest rating in each city.
select max (rating), city from customers
group by city;

--44)	Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00
select s.sname,amt*s.comm comm_amt from salespeople s join orders o on s.snum=o.snum 
where o.cnum in (select cnum from customers where rating >100)
order by comm_amt

--45)	Count the customers with rating above San Jose’s average.
select count (cnum)
from customers 
where rating > (select avg(rating)
                from customers 
                where city = 'San Jose');
                
--46)	Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.

select a.sname,b.sname from salespeople a,salespeople b where a.snum=b.snum;

              
--47)	Find all salespeople that are located in either Barcelona or London.
select sname from salespeople
where city in ('Barcelona','London');

--48)	Find all salespeople with only one customer.
select s.sname from salespeople s join customers c on s.snum=c.snum
group by s.sname
having count(c.snum)=1;

--49)	Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.
select cname from customers
where cnum in (select cnum 
               from customers 
               where snum in(select snum 
                             from customers 
                             group by snum 
                             having count(snum)=1));
                         


--50)	Write a query that will give you all orders for more than $1000.00.
select * from orders 
where trim(to_char( amt, '999999.00')) >'$1000.00';

select * from orders;

select trim(to_char(amt,'999999.00')) from orders;
--51)	Write a query that lists each order number followed by the name of the customer who made that order.
select o.onum , c.cname from orders o join customers c on o.cnum=c.cnum;

--52)	Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, \
    --one using a join and one a correlated subquery. Which solution is more elegant?
select s.sname,s.snum from salespeople s  join customers c  on s.snum=c.snum 
where s.city<>c.city;

select sname ,snum from salespeople
where city not in ( select c.city
                    from salespeople s join customers c  on s.snum=c.snum );

--53)	Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.
select * from customers 
where rating = any (select rating from customers
                where snum=(select snum 
                            from salespeople 
                            where sname = 'Serres') );
--54)	Write 2 queries that will produce all orders taken on October3 or October 4.
select * from orders
where to_date(odate) ='03-Oct-96' or to_date(odate)='04-Oct-96';

select * from orders
where to_date(odate) between '03-Oct-96' and '04-Oct-96';

--55)	Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.
select c.cname , o.* 
from customers c join orders o on c.cnum=o.cnum 

--56) Find only those customers whose ratings are higher than every customer in Rome.
select * from customers where rating > all(select rating 
                                           from customers 
                                           where city='Rome');
                                           
--57)	Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.
select * from customers where rating<= 100 and city='Rome';

--58)Find all rows from the Customer table for which the salesperson number is 1001
select * from customers where snum=1001;


--59)	Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.
select snum , sum(amt) from orders 
group by snum
having sum(amt) >(select max(amt)
                  from orders);

--60)	Write a query that selects all orders that have Zeroes or NULL in the Amount field.
select * from orders
where amt is null or amt like '%0%';

--61)	Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200.

select s.sname,c.cname,c.rating from salespeople s,customers c 
where s.snum=c.snum and c.rating<200;


--62)	List all salespeople’s names and the commission they have earned.
select sname , comm from salespeople ;

--63)	Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.
select cname, city from customers 
where cnum in(select cnum 
            from customers 
            where rating =(select rating 
                           from customers 
                           where cname='Hoffman'));

--64)	Find all salespeople for whom there are customers that follow them in alphabetical order.
select s.sname,c.cname 
from salespeople s join customers c on s.snum=c.snum 
order by s.sname

--65)	Write a query that produces the names and ratings of all customers of all who have above average orders.
select c.cname,c.rating from customers c join orders o on c.cnum=o.onum
where o.amt > (select avg(amt) from orders);

--66)	Find the sum of all purchases from the Orders table.
select sum(amt)
from orders;

--67)	Write a select command that produces the order number, amount, and date for all rows in the Order table.
select onum, amt,odate 
from orders;

--68)	Count the number of not null rating fields in the Customer table including duplicates.
select count(rating) 
from customers;

--69)	Write a query that gives the names of both the salesperson and the customer for each order after the order number.
select s.sname,c.cname,o.onum 
from salespeople s join customers c on s.snum=c.snum 
join orders o on c.cnum=o.cnum;

--70)	List the commissions of all salespeople servicing customers in London
select sname,comm from salespeople 
where snum in(select snum 
              from customers 
              where city='London');
              
--71.	Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
select * from sales_people 
where city <>all(select c.city
              from sales_people s join customers c on s.snum=c.snum);
          
--72.	Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.
select a.sname,a.city,b.cname,b.city as cus_city from salespeople a,customers b 
where a.snum=b.snum and a.city!=b.city;

--73.	Write a query that selects all customers serviced by Peel or Motika
select * from customers 
where snum in (select snum
               from salespeople 
               where sname in('Peel','Motika'));
               
--74.	Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should be counted only once.).
select to_date(odate),count(distinct(snum)) from orders
group by to_date(odate);

--75.	Find all orders attributed to salespeople in London
select * from orders 
where snum in (select snum from salespeople where city ='London');


--76.	Find all orders by customers not located in the same cities as their salespeople.
select * from orders 
where cnum in (select cnum
               from customers 
               where city <> all(select city 
                              from salespeople));
                              
                              
--77.	Find all salespeople who have customers with more than one current order.
 select snum ,count(cnum)
 from orders
 group by snum
 having count(cnum)>1;
                             
--78.	Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has at least one other customer (besides the customer being selected) with orders in the Orders table.
select o.snum,count(o.cnum)
from orders o
group by o.snum
having count(cnum)>=1;

--79.	Write a query that selects all customers whose name begins with ‘C’.
select cname from customers 
where cname like 'C%';

--80.	Write a query on the Customers table that will find the highest rating in each city. Put the output in this form:  for the city (city) the highest rating is : (rating).
select 'for the city'||' '||city||' '||'the highest rating is:'||' '||max(rating) City_rating
from customers
group by city;

--81.	Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats.
select snum, count(snum)
from orders 
group by snum
having count(snum)=1;

--82.	Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customers’ names and numbers.
select rating ,cname,cnum
from customers 
order by rating desc;

--83.	Find the average commission for salespeople in London.
select avg(comm),city
from salespeople
group by city
having city='London';

--84.	Find all orders credited to the same salesperson that services Hoffman.
select * from orders
where snum in(select snum 
              from orders 
              where cnum in(select cnum
                            from customers
                            where cname ='Hoffman'));
--85.	Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.
select *  from salespeople
where comm between 0.10 and 0.12;
                      
--86.	Write a query that will give you the names and cities of all salespeople in London with commission above 0.10
select sname,city 
from salespeople 
where city='London' and comm>0.10;

--87.	What will be the output from the following query? 
SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = '10/03/1996' AND CNUM > 2003));


--88.	Write a query that selects each customer’s smallest order.
select cnum, min (amt)
from orders
group by cnum

--89.	Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.
select cname
from customers
where cname like 'G%';


--90.	Write a query that counts the number of different not NULL city values in the Customers table.
select count(city)
from customers;

--91.	Find the average amount from the Orders table.
select avg(amt)
from orders;

--92.	What would be the output from the following query?
SELECT*FROM ORDERS WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);

--93.	Find all customers who are not located in San Jose & whose rating is above 200.
select * from customers
where city !='San Jose' and rating >200;

--94.	Give a simpler way to write this query:
SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);

select * from salespeople 
where comm =0.13;

--95.	Evaluate the following query:
SELECT * FROM orders WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);


--96.	Which salespeople attend to customers not in the city they have been assigned to?
select s.sname , c.cname from salespeople s join customers c on s.snum=c.snum
where s.city<>c.city;
             
--97.	Which salespeople get commission greater than 0.11 and serving customers rated less than 250?

select s.snum,s.sname from salespeople s join customers c on s.snum=c.cnum
where s.comm>0.11 and c.rating<250;

--98. Which salespeople have been assigned to the same city but get different commission percentages?
                                         

--99. Which salesperson has earned the most by way of commission?
select * from salespeople 
where comm = (select max(comm) from salespeople) ;

--100.  Does the customer who has placed the maximum number of orders have the maximum rating?
select o.cnum,c.cname,c.rating,count(o.cnum)
from orders o join customers c on c.cnum=o.cnum 
group by o.cnum,c.cname,c.rating
order by c.rating desc;


--101.  Has the customer who has spent the largest amount of money been given the highest rating?
select o.cnum,c.cname,c.rating,sum(o.amt)
from orders o join customers c on c.cnum=o.cnum 
group by o.cnum,c.cname,c.rating
order by c.rating desc;

--102.  List all customers in descending order of customer rating.
select * from customers
order by rating desc;

--103.  On which days has Hoffman placed orders?
select odate from orders 
where cnum = (select cnum 
              from customers
              where cname ='Hoffman');
              
--104.  Do all salespeople have different commissions?
select distinct(comm),sname from salespeople;

--105.  Which salespeople have no orders between 10/03/1996 and 10/05/1996?
select snum from orders
where snum not in(select snum
              from orders
              where odate between to_date('10-Mar-96') and to_date('10-May-96');
select* from orders;

--106.  How many salespersons have succeeded in getting orders?
select count(snum) from salespeople 
where snum in (select snum from orders );

--107.  How many customers have placed orders?
select count(cnum) from customers 
where cnum in(select cnum from orders);

--108.  On which date has each salesperson booked an order of maximum value?
select snum,to_date(odate),max(amt) 
from orders group by to_date(odate),snum ;

--109.  Who is the most successful salesperson?
select * 
from(select snum,sum(amt),dense_rank()over(order by sum(amt))drn from orders group by snum
)
where drn=1;


--110.  Who is the worst customer with respect to the company?
select * 
from(select cnum, sum(amt), rank()over(order by sum(amt))rnk from orders group by cnum )
where rnk=1;

--111.  Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?
select s.sname,o.snum,amt 
from orders o join salespeople s 
on s.snum=o.snum 
where amt<200 and s.sname in ('Peel','serres');
 
--112.  Which customers have the same rating?
select a.cname, b.cname, a.rating from customer_table a,customer_table b where a.cnum<>sb.cnum and a.rating=b.rating order by b.rating;

select* from salespeople;
select * from Customers;
select * from Orders;
--113.  Find all orders greater than the average for October 4th.
select * from orders
where amt > all(select avg(amt)
                from orders
                where odate ='04-oct-96');
                 
--114.  Which customers have above average orders?
select cnum 
from orders
where amt > (select avg (amt) from orders);

--115.  List all customers with ratings above San Jose’s average.
select * from customers
where cnum in (select cnum
               from customers 
               where rating >(select avg(rating)
                              from customers 
                              where city='San Jos%'))
                              

--116.  Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.
select snum, sum(amt)
from orders 
group by snum
having sum(amt) > (select max(amt)
                   from orders);
                 
--117.  Give names and numbers of all salesperson that have more than one customer.
select snum,sname from salespeople
where snum in (select snum
               from orders 
               group by snum
               having count(snum)>1)
               
--118.  Select all salesperson by name and numbers who have customers in their city whom they don’s the service.
select s.snum,s.sname from salespeople s join customers c on s.snum=c.snum
where s.city<>c.city;

--119.  Which customers’ rating should be lowered?
select * 
from(select c.cnum,c.cname,sum(o.amt),dense_rank() over (order by sum(o.amt))drn from orders o join customers c 
on c.cnum=o.cnum group by c.cname,c.cnum)
where drn=1;

--120.  Is there a case for assigning a salesperson to Berlin?
select a.sname,b.city from salespeople a join customers b 
on a.snum=b.snum
where b.city='Berlin';

--121.  Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?
select b.snum,c.sname,sum(a.amt) as totalsalesbySP,round(sum(amt)*c.comm ) comm
from orders a,customers b,salespeople c 
where a.cnum=b.cnum and b.snum=c.snum group by b.snum,c.sname,c.comm
order by totalsalesbySP desc;
      
--122.  Dose the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?
select distinct (select sum(a.amt*c.comm) as totalsales 
        from orders a,customers b,salespeople c 
        where a.cnum=b.cnum and b.snum=c.snum and (c.city='London' or c.city='New York'))as x,
       (select sum(a.amt)
        from orders a,customers b 
        where a.cnum=b.cnum and (b.city='Rome' or b.city='London')) as y from orders;
      
--123.  Which is the date, order number, amt and city for each salesperson (byname) for   the maximum order he has obtained?
select s.sname,o.odate,o.onum,o.amt,s.city
from salespeople s join orders o on s.snum=o.snum  
where o.amt in (select max(amt)
                from orders 
                group by snum);

--124.  Which salesperson(s) should be fired?
select *
from(select s.sname,o.snum ,sum(o.amt),dense_rank()over (order by sum(o.amt)) drn
     from orders o join salespeople s on s.snum=o.snum
     group by  s.sname,o.snum)
where drn=1;

--125.  What is the total income for the company? 
select sum(o.amt) Total_income
from orders o;


select* from salespeople;
select * from Customers;
select * from Orders;      





































