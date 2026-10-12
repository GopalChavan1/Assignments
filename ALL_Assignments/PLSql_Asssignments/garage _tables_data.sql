--------------------------------------- Gararge System Table Data -------------------------
-- customer table
CREATE TABLE CUSTOMER (
    CID           NUMBER(6)        PRIMARY KEY,
    CNAME         VARCHAR2(35),
    CADD          VARCHAR2(20),
    C_CONTACT     VARCHAR2(15),
    C_CREDITDAYS  NUMBER(5),
    CJ_DATE       DATE,
    SEX        VARCHAR2(10)
);

INSERT INTO CUSTOMER VALUES (1001, 'CYONA BLAKE',     'NEW YORK',   '1235684',  20, TO_DATE('20-JAN-11','DD-MON-YY'), 'FEMALE');
INSERT INTO CUSTOMER VALUES (1002, 'JOHN SMITH',       'NEW JERSI',  '1341684',  20, TO_DATE('21-FEB-11','DD-MON-YY'), 'MALE');
INSERT INTO CUSTOMER VALUES (1003, 'JORDAN WOOD',      'PRAG',       '1805184',  20, TO_DATE('22-MAR-11','DD-MON-YY'), 'MALE');
INSERT INTO CUSTOMER VALUES (1004, 'CHRISTNA',         'MANHATTON',  '1125684',  31, TO_DATE('23-APR-13','DD-MON-YY'), 'FEMALE');
INSERT INTO CUSTOMER VALUES (1005, 'TOM HILL',         'LONDON',     '1239284',  10, TO_DATE('25-JUN-15','DD-MON-YY'), 'MALE');
INSERT INTO CUSTOMER VALUES (1006, 'KAMILA JOSEF',     'PARISE',     '124568',    9, TO_DATE('28-JUL-11','DD-MON-YY'), 'FEMALE');
INSERT INTO CUSTOMER VALUES (1007, 'ANDRU SYMON',      'TAXES',      '125654',   15, TO_DATE('01-APR-16','DD-MON-YY'), 'MALE');
INSERT INTO CUSTOMER VALUES (1008, 'SANJU SAMSUNG',    'NEW YORK',   '12346341',  4, TO_DATE('20-JAN-16','DD-MON-YY'), 'MALE');

--vendors table
CREATE TABLE VENDORS (
    VID           NUMBER(6)        PRIMARY KEY,
    VNAME         VARCHAR2(35),
    VADD          VARCHAR2(20),
    VCONTACT      NUMBER(15),
    VCREDITDAYS   NUMBER(5),
    VJ_DATE       DATE
);

INSERT INTO VENDORS VALUES (2001, 'KIRAN PATIL',    'PUNE',      '20535535', 20, TO_DATE('20-JAN-10','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2002, 'PRAKASH JAIN',   'MUMBAI',    '2063564',  10, TO_DATE('05-NOV-11','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2003, 'SWAPNIL THETE',  'NASHIK',    '25355352', 15, TO_DATE('18-MAR-10','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2004, 'AMOL SHENDE',    'SATARA',    '23674776', 18, TO_DATE('07-APR-15','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2005, 'KARAN SINTRE',   'BULDHANA',  '256756',   30, TO_DATE('22-APR-09','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2006, 'RAM KULKARNI',   'OSMANABAD', '20367454', 21, TO_DATE('09-JUL-10','DD-MON-YY'));

-- employee table
CREATE TABLE EMPLOYEE (
    EID       NUMBER(6)        PRIMARY KEY,
    ENAME     VARCHAR2(35),
    JOB       VARCHAR2(20),
    EADD      VARCHAR2(20),
    ECONTACT  NUMBER(15),
    ESAL      NUMBER(10),
    EDOJ      DATE,
    EDOL      DATE
);

INSERT INTO EMPLOYEE VALUES (3001, 'STEVEN KING',   'PAINTER',  'NEW YORK',  '10367454', 1200, TO_DATE('09-JUL-10','DD-MON-YY'), NULL);
INSERT INTO EMPLOYEE VALUES (3002, 'DAVID AUSTIN',  'FITTER',   'MANHATTON', '10367434', 1100, TO_DATE('19-AUG-10','DD-MON-YY'), NULL);
INSERT INTO EMPLOYEE VALUES (3003, 'BRUCE ERNST',   'MECHANIC', 'NEW JERCY', '1036726',  2200, TO_DATE('08-SEP-10','DD-MON-YY'), NULL);
INSERT INTO EMPLOYEE VALUES (3004, 'LUIS POPP',     'MECHANIC', 'NEW JERCY', '10367264', 1700, TO_DATE('19-OCT-09','DD-MON-YY'), TO_DATE('06-SEP-10','DD-MON-YY'));
INSERT INTO EMPLOYEE VALUES (3005, 'SHERI GOMES',   'FITTER',   'PARIS',     '10327264', 1000, TO_DATE('19-OCT-09','DD-MON-YY'), TO_DATE('01-AUG-10','DD-MON-YY'));
INSERT INTO EMPLOYEE VALUES (3000, 'JAMES PHILLIP', 'FITTER',   'PARIS',     '10322264', NULL, TO_DATE('01-JAN-08','DD-MON-YY'), NULL);

--sparepart table
CREATE TABLE SPAREPART (
    SPID    NUMBER(6)      PRIMARY KEY,
    SPNAME  VARCHAR2(50),
    SPRATE  NUMBER(10),
    SPUNIT  VARCHAR2(10)
);

INSERT INTO SPAREPART VALUES (4001, 'TWO WHEELER TUBE',            250,  'NOS');
INSERT INTO SPAREPART VALUES (4002, 'TWO WHEELER ENGINE OIL',      400,  'LTRS');
INSERT INTO SPAREPART VALUES (4003, 'FOUR WHEELER ENGINE OIL',     5000, 'LTRS');
INSERT INTO SPAREPART VALUES (4004, 'TWO WHEELER CARBURETOR',      680,  'NOS');
INSERT INTO SPAREPART VALUES (4005, 'TWO WHEELER CLUTCH WIRE',     129,  'MTRS');
INSERT INTO SPAREPART VALUES (4006, 'TWO WHEELER TAIL LIGHT',      100,  'NOS');
INSERT INTO SPAREPART VALUES (4007, 'TWO WHEELER INDICATORS',      150,  'NOS');
INSERT INTO SPAREPART VALUES (4008, 'FOUR WHEELER GASKET',         1340, 'NOS');
INSERT INTO SPAREPART VALUES (4009, 'WHITE COLOUR',                340,  'LTRS');
INSERT INTO SPAREPART VALUES (4010, 'BLACK COLOUR',                240,  'LTRS');
INSERT INTO SPAREPART VALUES (4011, 'TWO WHEELER SIDE MIRROR',     250,  'NOS');
INSERT INTO SPAREPART VALUES (4012, 'FOUR WHEELER SIDE MIRROR',    450,  'NOS');
INSERT INTO SPAREPART VALUES (4013, 'TWO WHEELER SHOCKUP',         1320, 'PAIR');
INSERT INTO SPAREPART VALUES (4014, 'FOUR WHEELER BUMPER',         6000, 'NOS');
INSERT INTO SPAREPART VALUES (4015, 'FOUR WHEELER FRONT GLASS',    7000, 'PCS');

-- purchase table
CREATE TABLE PURCHASE (
    PID        NUMBER(6)      PRIMARY KEY,
    VID        NUMBER(6)      NOT NULL,
    SPID       NUMBER(6)      NOT NULL,
    PQTY       NUMBER(6),
    SPRATE     NUMBER(10),
    SPGST      NUMBER(10),
    PDATE      DATE,
    TRANCOST   NUMBER(10),
    TOTAL      NUMBER(10,2),
    RCV_EID    NUMBER(6),
    CONSTRAINT FK_PURCHASE_VENDOR   FOREIGN KEY (VID)     REFERENCES VENDORS(VID),
    CONSTRAINT FK_PURCHASE_SPARE   FOREIGN KEY (SPID)    REFERENCES SPAREPART(SPID),
    CONSTRAINT FK_PURCHASE_EMP     FOREIGN KEY (RCV_EID) REFERENCES EMPLOYEE(EID)
);

INSERT INTO PURCHASE VALUES (5001, 2001, 4001, 10, 250,  350,   TO_DATE('01-JAN-11','DD-MON-YY'), 1300, 4150,   3001);
INSERT INTO PURCHASE VALUES (5002, 2002, 4002, 4,  400,  288,   TO_DATE('02-MAR-11','DD-MON-YY'), 100,  1988,   3001);
INSERT INTO PURCHASE VALUES (5003, 2003, 4004, 8,  680,  761.6, TO_DATE('12-JUN-11','DD-MON-YY'), 50,   6251.6, 3003);
INSERT INTO PURCHASE VALUES (5004, 2004, 4005, 10, 129,  154.8, TO_DATE('22-AUG-11','DD-MON-YY'), 125,  1569.8, 3004);
INSERT INTO PURCHASE VALUES (5005, 2005, 4006, 20, 100,  300,   TO_DATE('07-SEP-11','DD-MON-YY'), 20,   2320,   3003);
INSERT INTO PURCHASE VALUES (5006, 2006, 4007, 30, 150,  630,   TO_DATE('12-OCT-11','DD-MON-YY'), 60,   5190,   3000);
INSERT INTO PURCHASE VALUES (5007, 2001, 4003, 20, 5000, 14000, TO_DATE('07-SEP-11','DD-MON-YY'), 1000, 115000, 3000);
INSERT INTO PURCHASE VALUES (5008, 2006, 4005, 1,  129,  15.48, TO_DATE('12-OCT-11','DD-MON-YY'), 50,   194.48, 3005);
INSERT INTO PURCHASE VALUES (5009, 2006, 4005, 1,  129,  15.48, TO_DATE('15-OCT-11','DD-MON-YY'), 50,   194.48, 3005);
INSERT INTO PURCHASE VALUES (5010, 2006, 4009, 5,  340,  238,   TO_DATE('20-OCT-11','DD-MON-YY'), 0,    2938,   3005);

-- ser_det table
CREATE TABLE SER_DET (
    SID        NUMBER(6)      PRIMARY KEY,
    CID        NUMBER(6),
    EID        NUMBER(6),
    SPID       NUMBER(6),
    TYP_VEH    VARCHAR2(20),
    VEH_NO     VARCHAR2(20),
    TYP_SER    VARCHAR2(30),
    SER_DATE   DATE,
    QTY        NUMBER(6,2),
    SP_RATE    NUMBER(10),
    SP_AMT     NUMBER(10),
    SP_GST     NUMBER(10),
    SER_AMT    NUMBER(10),
    COMM       NUMBER(10),
    TOTAL      NUMBER(10),
    CONSTRAINT FK_SERDET_CUST FOREIGN KEY (CID)  REFERENCES CUSTOMER(CID),
    CONSTRAINT FK_SERDET_EMP  FOREIGN KEY (EID)  REFERENCES EMPLOYEE(EID),
    CONSTRAINT FK_SERDET_SPARE FOREIGN KEY (SPID) REFERENCES SPAREPART(SPID)
);

INSERT INTO SER_DET VALUES (6001, 1001, 3001, 4001, 'TWO WHEELER',  'MH15CA3228', 'TUBE DAMAGED',   TO_DATE('02-JAN-11','DD-MON-YY'), 1,   250, 250, 35,  50,  0,   335);
INSERT INTO SER_DET VALUES (6002, 1002, 3002, 4002, 'TWO WHEELER',  'MH-16U5713', 'FULL SERVICING', TO_DATE('04-MAR-11','DD-MON-YY'), 1,   400, 400, 52,  300, 50,  752);
INSERT INTO SER_DET VALUES (6003, 1003, 3004, 4005, 'TWO WHEELER',  'MH12PQ1313', 'CLUTCH WIRE',    TO_DATE('22-AUG-11','DD-MON-YY'), 1,   129, 129, 0,   10,  0,   139);
INSERT INTO SER_DET VALUES (6004, 1002, 3002, 4002, 'TWO WHEELER',  'MH-16U5713', 'FULL SERVICING', TO_DATE('05-MAY-11','DD-MON-YY'), 1,   400, 400, 52,  300, 50,  752);
INSERT INTO SER_DET VALUES (6005, 1004, 3001, 4009, 'TWO WHEELER',  'MH-14PA335', 'COLOR',          TO_DATE('21-OCT-11','DD-MON-YY'), 2.5, 340, 850, 119, 500, 150, 1469);
INSERT INTO SER_DET VALUES (6006, 1006, 3001, 4009, 'TWO WHEELER',  'MH-12WE334', 'COLOR',          TO_DATE('01-DEC-11','DD-MON-YY'), 2.5, 340, 850, 119, 500, 150, 1469);
INSERT INTO SER_DET VALUES (6007, 1007, 3001, 4001, 'FOUR WHEELER', 'MH17BB1345', 'TUBE DAMAGED',   TO_DATE('01-JAN-12','DD-MON-YY'), 1,   250, 250, 35,  150, 0,   435);

COMMIT;

SELECT * FROM CUSTOMER;
SELECT * FROM VENDORS;
SELECT * FROM EMPLOYEE;
SELECT * FROM SPAREPART;
SELECT * FROM PURCHASE;
SELECT * FROM SER_DET;


Garage System Questions.
-- Q.1 List all the customers serviced.
SELECT * FROM customer
WHERE cid IN (SELECT cid FROM ser_det)

-- Q.2 Customers who are not serviced.
SELECT * FROM customer
WHERE cid NOT IN (SELECT cid FROM ser_det);

-- Q.3 Employees who have not received the commission.
SELECT * FROM employee
WHERE eid In ( SELECT eid FROM ser_det WHERE comm = 0);

-- Q.4 Name the employee who have maximum Commission.
SELECT * FROM employee
WHERE eid In ( SELECT eid FROM ser_det WHERE comm = (SELECT MAX(comm) FROM ser_det));

-- Q.5 Show employee name and minimum commission amount received by an employee.
SELECT e.ename, sd.comm
FROM employee e INNER JOIN ser_det sd
ON e.eid = sd.eid
WHERE sd.comm IN (SELECT MIN(comm) FROM ser_det);

-- Q.6 Display the Middle record from any table.
SELECT * FROM (SELECT s.*, rownum AS rno FROM sparepart s)
WHERE rno = (SELECT CEIL(count(*)/2) FROM sparepart);

-- Q.7 Display last 4 records of any table.
SELECT * FROM (SELECT e.*,rownum  AS emp FROM employee e) 
                                              WHERE emp >(SELECT (COUNT(emp)-4) FROM employee)

-- Q.8 Count the number of records without count function from any table.
-- solution 1
SELECT MAX(r_no) 
FROM (SELECT ROW_NUMBER() OVER(ORDER BY spid) as r_no FROM sparepart);
-- solution 2
SELECT MAX(rownum) FROM sparepart;

-- Q.9 Delete duplicate records from "Ser_det" table on cid. (note Please rollback after execution).
DELETE FROM ser_det 
WHERE rowid NOT IN (
SELECT MIN(rowid) FROM ser_det
GROUP BY cid );

SELECT * FROM ser_det

rollback;

-- Q.10 Show the name of Customer who have paid maximum amount 
SELECT * FROM customer WHERE cid In 
                             (SELECT cid FROM ser_det WHERE total = 
                                                            (SELECT MAX(total) FROM ser_det));
-- Another approach
SELECT c.*, sd.total
FROM customer c INNER JOIN ser_det sd
ON c.cid = sd.cid
WHERE sd.total = (SELECT MAX(total) FROM ser_det);

-- Q.11 Display Employees who are not currently working.
SELECT * FROM employee
WHERE edol IS NOT NULL;

-- Q.12 How many customers serviced their two wheelers.
-- Non unique customers
SELECT COUNT(cid) FROM ser_det
WHERE typ_veh LIKE '%TWO WHEELER%';
-- unique customers
SELECT COUNT(DISTINCT(cid)) FROM ser_det
WHERE typ_veh LIKE '%TWO WHEELER%';

-- Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.
-- Another Method
SELECT cid, spid, SUM(qty) FROM ser_det
GROUP BY cid, Spid;
-- Another Method (Without group by cid)
SELECT sd.cid, sd.spid, s.spname, sd.qty
FROM ser_det sd INNER JOIN sparepart s
ON sd.spid = s.spid;

-- Q.14 Customers who have Colored their vehicles.
SELECT c.*
FROM ser_det sd INNER JOIN customer c
ON sd.cid = c.cid
WHERE typ_ser = 'COLOR';

-- Q.15 Find the annual income of each employee inclusive of Commission
SELECT eid, SUM(total+comm) AS total_inc_comm 
FROM ser_det
WHERE ser_date BETWEEN to_date('01/01/2011', 'dd/mm/yyyy') AND to_date('31/12/2011', 'dd/mm/yyyy') 
GROUP BY eid;


-- Q.16 Vendor Names who provides the engine oil.
SELECT * FROM vendors
WHERE vid IN (select vid FROM purchase 
                             WHERE spid IN (SELECT spid FROM sparepart WHERE spname LIKE '%ENGINE OIL%'));
-- Another Approach
SELECT v.*
FROM vendors v INNER JOIN purchase p
ON v.vid = p.vid
INNER JOIN sparepart s
ON p.spid = s.spid
WHERE s.spname LIKE '%ENGINE OIL%';

-- Q.17 Total Cost to purchase the Color and name the color purchased.
SELECT s.spname, SUM(sd.total) 
FROM ser_det sd INNER JOIN sparepart s
ON sd.spid = s.spid
WHERE sd.typ_ser = 'COLOR' 
GROUP BY s.spname


-- Q.18 Purchased Items which are not used in "Ser_det".
SELECT * FROM purchase
WHERE spid NOT IN (SELECT spid FROM ser_det);

-- Q.19 Spare Parts Not Purchased but existing in Sparepart
SELECT * FROM sparepart
WHERE spid NOT IN (SELECT spid FROM purchase);

--Q.20 Calculate the Profit/Loss of the Firm. consider one month salary of each employee for Calculation.
SELECT 
    (SELECT SUM(total) FROM ser_det) AS service_revenu,
    (SELECT SUM(total) FROM purchase) AS purchase_cost,
    (SELECT SUM(esal)  FROM employee) AS one_month_sal,
    (SELECT SUM(total) FROM ser_det)
      - (SELECT SUM(total) FROM purchase)
      - (SELECT SUM(esal)  FROM employee)  AS profit_loss_amt,
    CASE
        WHEN ((SELECT SUM(total) FROM ser_det) - (SELECT SUM(total) FROM purchase) - (SELECT SUM(esal) FROM employee)) > 0 THEN 'Profit'
        WHEN ((SELECT SUM(total) FROM ser_det) - (SELECT SUM(total) FROM purchase) - (SELECT SUM(esal) FROM employee)) < 0 THEN 'Loss'
        ELSE 'BreakEven'
    END profit_loss
FROM DUAL;

--PROFIT/LOSS = total revenue - total expense

--Q.21 Specify the names of customers who have serviced their vehicles more than one time.
SELECT * FROM customer
WHERE cid IN (SELECT cid FROM ser_det GROUP BY cid HAVING count(cid) > 1 );

-- Q.22 List the Items purchased from vendors location wise.
SELECT v.vadd, LISTAGG(p.pid, ' | ') WITHIN GROUP(ORDER BY NULL)
FROM purchase p INNER JOIN vendors v
ON p.vid = v.vid
GROUP BY v.vadd;

-- Q.23 Display count of two wheeler and four wheeler from ser_details
SELECT count(*) FROM ser_det WHERE typ_veh = 'TWO WHEELER'
UNION
SELECT count(*) FROM ser_det WHERE typ_veh = 'FOUR WHEELER';

--
SELECT 
     (SELECT count(*) FROM ser_det WHERE typ_veh = 'TWO WHEELER') AS count_2_wheel,
     (SELECT count(*) FROM ser_det WHERE typ_veh = 'FOUR WHEELER') AS count_4_wheel 
FROM DUAL;
--
SELECT 
 COUNT(CASE WHEN typ_veh = 'TWO WHEELER' THEN 1 END) AS count_2_wheel,
 COUNT(CASE WHEN typ_veh = 'FOUR WHEELER' THEN 1 END) AS count_4_wheel
FROM ser_det;
--
SELECT typ_veh, count(*) FROM ser_det GROUP BY typ_veh;

-- Q24 Display name of customers who paid highest SPGST and for which item 
SELECT c.cname, s.spname
FROM customer c INNER JOIN ser_det sd 
ON c.cid = sd.cid 
INNER JOIN sparepart s 
ON sd.spid = s.spid
WHERE sd.sp_gst = (SELECT MAX(sp_gst) FROM ser_det);

-- Q25 Display vendors name who have charged highest SPGST rate for which item
SELECT v.vname, s.spname
FROM vendors v INNER JOIN purchase p 
ON v.vid = p.vid 
INNER JOIN sparepart s 
ON p.spid = s.spid
WHERE p.spgst = (SELECT MAX(spgst) FROM purchase);

-- Q26   list name of item and employee name who have received item 
SELECT e.ename, s.spname
FROM employee e INNER JOIN purchase p 
ON e.eid = p.rcv_eid
INNER JOIN sparepart s 
ON p.spid = s.spid
WHERE p.rcv_eid = e.eid;

-- Q27 Display the Name and Vehicle Number of Customer who serviced his vehicle, 
--And Name the Item used for Service, And specify the purchase date of that Item with his vendor and Item Unit 
--and Location, And employee Name who serviced the vehicle. for Vehicle NUMBER "MH-14PA335".'
SELECT c.cname, sd.veh_no, s.spname, p.pdate , p.pqty, v.vadd, e.ename
FROM ser_det sd INNER JOIN customer c
ON sd.cid = c.cid
INNER JOIN sparepart s
ON sd.spid = s.spid
INNER JOIN purchase p
On sd.spid = p.spid
INNER JOIN vendors v
On p.vid = v.vid
INNER JOIN employee e
On sd.eid= e.eid
WHERE sd.veh_no = 'MH-14PA335';


-- Q28 who belong this vehicle  MH-14PA335" Display the customer name 
SELECT cname FROM customer
WHERE cid = (SELECT cid FROM ser_det WHERE veh_no = 'MH-14PA335');

-- Q29 Display the name of customer who belongs to New York and when he /she service their  vehicle on which date 
SELECT c.cname, sd.ser_date 
FROM customer c INNER JOIN ser_det sd
ON c.cid = sd.cid
WHERE c.cadd = 'NEW YORK';
   
-- Q30 from whom we have purchased items having maximum cost?
SELECT * FROM vendors WHERE vid = 
                              (SELECT vid FROM purchase WHERE total = 
                                                              (SELECT MAX(total) FROM purchase));
--method 2
SELECT v.* 
FROM vendors v INNER JOIN purchase p
ON v.vid = p.vid
WHERE p.total = (SELECT MAX(total) FROM purchase);
                                                              
-- Q31 Display the names of employees who are not working as Mechanic and that employee done services.
SELECT ename FROM employee
WHERE job <> 'MECHANIC' AND eid IN (SELECT eid FROM ser_det);

-- Q32 Display the various jobs along with total number of employees in each job. 
--The output should contain only those jobs with more than two employees.
SELECT job, COUNT(eid) FROM employee 
GROUP BY job 
HAVING  count(eid) > 2;

-- Q33 Display the details of employees who done service  and give them rank according to their no. of services .
SELECT e.*,
RANK() OVER(PARTITION BY sd.eid ORDER BY sd.sid)
FROM employee e INNER JOIN ser_det sd
ON e.eid = sd.eid;

-- Q 34 Display those employees who are working as Painter and fitter and who provide service 
-- and total count of service done by fitter and painter  
SELECT e.eid, e.job, count(sd.eid)
FROM employee e INNER JOIN ser_det sd
ON e.eid = sd.eid
WHERE e.job IN ('PAINTER', 'FITTER')
GROUP BY e.eid, e.job; 

-- Q35 Display employee salary and as per highest salary provide Grade to employee 
SELECT esal ,
       CASE
            WHEN rnk =1 THEN 'No_GRADE'
            WHEN rnk =2 THEN 'A'
            WHEN rnk =3 THEN 'B'
            WHEN rnk =4 THEN 'C'
            WHEN rnk =5 THEN 'D'
            when rnk =6 THEN 'E'
       END grade
FROM (SELECT esal, DENSE_RANK() OVER(ORDER BY esal DESC) rnk FROM employee);
---
SELECT esal ,
       CASE
            WHEN rnk =1 THEN 'A'
            WHEN rnk =2 THEN 'B'
            WHEN rnk =3 THEN 'C'
            WHEN rnk =4 THEN 'D'
            when rnk =5 THEN 'E'
            ELSE 'F'
       END grade
FROM (SELECT esal, DENSE_RANK() OVER(ORDER BY esal DESC NULLS LAST) rnk FROM employee);

-- Q36  display the 4th record of emp table without using group by and rowid.
SELECT eid, ename, job, eadd, econtact, esal, edoj, edol FROM (
SELECT eid, ename, job, eadd, econtact, esal, edoj, edol, rownum,
ROW_NUMBER() OVER(ORDER BY rownum) AS rowno
FROM EMPLOYEE )
WHERE rowno = 4;

-- Q37 Provide a commission 100 to employees who are not earning any commission.
UPDATE ser_det
SET comm=100
WHERE comm = '0';

SELECT  * FROM ser_det;

rollback;

-- Q38 write a query that totals no. of services  for each day and place the results in descending order
SELECT ser_date, count(sid) FROM ser_det GROUP BY ser_date ORDER BY ser_date DESC;

-- Q39 Display the service details of those customer who belong from same city 
SELECT c.* 
FROM customer c INNER JOIN ser_det sd
ON c.cid =  sd.cid 
INNER JOIN employee e
ON sd.eid = e.eid
WHERE c.cadd = e.eadd;

-- Q40 write a query join customers table to itself to find all pairs of customers service by a single employee
SELECT c1.*, c2.* 
FROM customer c1 INNER JOIN customer c2 
ON c1.cadd = c2.cadd
WHERE c1.cid < c2.cid;

-- Q41 List each service number follow by name of the customer who made  that service
SELECT c.cname, LISTAGG(sd.sid, ' | ') WITHIN  GROUP(ORDER BY NULL) 
 FROM ser_det sd INNER JOIN customer c
 ON sd.cid = c.cid
 GROUP BY c.cname;

-- Q42 Write a query to get details of employee and provide rating on basis of  maximum services provide by employee.
--Note (rating should be like A,B,C,D)
SELECT e.*, sd1.ser_count, 
       CASE 
         NTILE(4) OVER (ORDER BY sd1.ser_count DESC)
         WHEN  1 THEN 'A'
         WHEN  2 THEN 'B'
         WHEN  3 THEN 'C'
       END rating
FROM employee e INNER JOIN (SELECT eid, count(*) AS ser_count FROM ser_det GROUP BY eid) sd1
ON e.eid = sd1.eid;


-- Q43 Write a query to get maximum service amount of each customer with their customer details ?
SELECT DISTINCT(sd.cid), c.cname, c.cadd, c.c_contact, c.c_creditdays, c.cj_date, c.sex, 
MAX(sd.total) OVER(PARTITION BY sd.cid ORDER BY sd.total) max_ser_cost
FROM ser_det sd INNER JOIN customer c
ON sd.cid = c.cid;


-- Q44 Get the details of customers with his total no of services ?
WITH count_cte_ser AS (
SELECT cid , count(sid) as total_ser
FROM ser_det sd 
GROUP BY sd.cid)

SELECT * FROM customer c INNER JOIN count_cte_ser cte
ON c.cid = cte.cid;

-- Q45 From which location sparpart purchased  with highest cost ?
SELECT vadd FROM vendors WHERE vid = (SELECT vid FROM purchase WHERE total = (SELECT MAX(total) FROM purchase));



-- Q46 Get the details of employee with their service details who has salary is null
SELECT e.*, sd.* 
FROM employee e FULL JOIN ser_det sd 
ON e.eid = sd.eid
WHERE e.esal IS NULL;

-- Q47 find the sum of purchase location wise 
SELECT v.vadd, SUM(p.total)
FROM vendors v INNER JOIN purchase p 
ON v.vid = p.vid
GROUP BY v.vadd

-- Q48 write a query sum of purchase amount in word location wise ?
SELECT v.vadd, SUM(p.total), to_char(TRUNC(sum(p.total)),'999999999SP')
FROM vendors v INNER JOIN purchase p 
ON v.vid = p.vid
GROUP BY v.vadd;
------------------------------------------------------------------------not solved

-- Q49 Has the customer who has spent the largest amount money has been give highest rating
SELECT c.cid, SUM(sd.total),
DENSE_RANK() OVER(ORDER BY SUM(sd.total) DESC)
FROM customer c INNER JOIN ser_det sd
ON c.cid = sd.cid
GROUP BY c.cid

-- Q50 select the total amount in service for each customer for which 
--the total is greater than the amount of the largest service amount in the table
SELECT cid, SUM(total) FROM ser_det
WHERE total > (SELECT max(total) FROM ser_det)
GROUP BY cid;

-- Q51  List the customer name and sparepart name used for their vehicle and  vehicle type
SELECT c.cname, s.spname, sd.veh_no, sd.typ_veh
FROM customer c INNER JOIN ser_det sd
ON c.cid = sd.cid
INNER JOIN sparepart s
On sd.spid = s.spid;

-- Q52 Write a query to get spname ,ename,cname quantity ,rate ,service amount for record exist in service table 
SELECT s.spname, e.ename, c.cname, sd.qty, sd.sp_rate, sd.sp_amt
FROM employee e INNER JOIN ser_det sd
ON e.eid = sd.eid
INNER JOIN customer c
ON sd.cid = c.cid
INNER JOIN sparepart s
On sd.spid = s.spid;

-- Q53 specify the vehicles owners who’s tube damaged.
SELECT * FROM customer WHERE cid IN (SELECT cid FROM ser_det WHERE typ_ser = 'TUBE DAMAGED');
-- 2 method
SELECT c.*
FROM ser_det sd INNER JOIN customer c
ON sd.cid = c.cid
WHERE typ_ser = 'TUBE DAMAGED';

-- Q.54 Specify the details who have taken full service.
SELECT * FROM customer WHERE cid IN (SELECT cid FROM ser_det WHERE typ_ser = 'FULL SERVICING');
-- 2 method
SELECT c.*
FROM ser_det sd INNER JOIN customer c
ON sd.cid = c.cid
WHERE typ_ser = 'FULL SERVICING';

-- Q.55 Select the employees who have not worked yet and left the job.
SELECT * FROM employee WHERE (eid NOT IN (SELECT eid FROM ser_det)) AND (edol IS NOT NULL);

-- Q.56  Select employee who have worked first ever.
SELECT * FROM employee WHERE eid In (SELECT eid FROM ser_det
GROUP BY eid
HAVING count(eid) = 1);


-- Q.57 Display all records falling in odd date
SELECT * FROM ser_det
WHERE MOD(extract(day from ser_date),2) = 1;

-- Q.58 Display all records falling in even date
SELECT * FROM ser_det
WHERE MOD(extract(day from ser_date),2) = 0;

-- Q.59 Display the vendors whose material is not yet used.
SELECT * FROM vendors WHERE vid NOT IN (SELECT vid FROM purchase WHERE spid IN (SELECT spid FROM ser_det));


-- Q.60 Difference between purchase date and used date of spare part.
SELECT sd.sid, sd.spid, sd.ser_date, p.pdate, (sd.ser_date - p.pdate) day_bet
FROM purchase p INNER JOIN ser_det sd
ON sd.spid = p.spid


48, 49
