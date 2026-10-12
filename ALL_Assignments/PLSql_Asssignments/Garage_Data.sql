
-- CREATING TABLE CUSTOMER
CREATE TABLE Customer_table
( 
CID number PRIMARY KEY,
CNAME varchar(100), 
CADD varchar(50),
C_CONTACT number,
C_CREDITDAYS number, 
CJ_DATE date, 
SEX varchar(100)
);


-- INSERTING DATA INTO SALESPEOPLE TABLE
INSERT INTO Customer_table Values(1001, 'CYONA BLAKE', 'NEW YORK', 1235684, 20, TO_DATE('20-JAN-11','DD-MON-YY'), 'FEMALE');

INSERT INTO Customer_table Values (1002, 'JOHN SMITH', 'NEW JERSI', 1341684, 20, TO_DATE('21-FEB-11','DD-MON-YY'), 'MALE');

INSERT INTO Customer_table Values(1003, 'JORDAN WOOD', 'PRAG', 1805184, 20, TO_DATE('22-MAR-11','DD-MON-YY'), 'MALE');

INSERT INTO Customer_table values(1004, 'CHRISTNA', 'MANHATTON', 1125684, 31, TO_DATE('23-APR-13','DD-MON-YY'), 'FEMALE');

INSERT INTO Customer_table Values(1005, 'TOM HILL', 'LONDON', 1239284, 10, TO_DATE('25-JUN-15','DD-MON-YY'), 'MALE');

INSERT INTO Customer_table Values(1006, 'KAMILA JOSEF', 'PARISE', 124568, 9, TO_DATE('28-JUL-11','DD-MON-YY'), 'FEMALE');

INSERT INTO Customer_table Values(1007, 'ANDRU SYMON', 'TAXES', 125654, 15, TO_DATE('1-APR-16','DD-MON-YY'), 'MALE')

INSERT INTO Customer_table Values(1008, 'SANJU SAMSUNG', 'NEW YORK', 12346341, 4, TO_DATE('20-JAN-16','DD-MON-YY'), 'MALE');


-- SHOW DATA PRESENT IN CUSTOMER TABLE
SELECT * FROM Customer_table;

------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATING TABLE VENDORS
CREATE TABLE Vendors_table
(
VID number PRIMARY KEY,
VNAME varchar(100), 
VADD varchar (80), 
VCONTACT number, 
V_CREDITDAYS number,
VJ_DATE date
);

-- INSERTING DATA INTO VENDORS TABLE
INSERT INTO Vendors_table Values(2001, 'KIRAN PATIL', 'PUNE', 20535535, 20, TO_DATE('20-JAN-10','DD-MON-YY'))

INSERT INTO Vendors_table Values(2002, 'PRAKASH JAIN', 'MUMBAI', 2063564, 10, TO_DATE('05-NOV-11','DD-MON-YY'))

INSERT INTO Vendors_table Values(2003, 'SWAPNIL THETE', 'NASHIK', 25355352, 15, TO_DATE('18-MAR-10','DD-MON-YY'));

INSERT INTO Vendors_table Values(2004, 'AMOL SHENDE', 'SATARA', 23674776, 18, TO_DATE('07-APR-15','DD-MON-YY')); 

INSERT INTO Vendors_table Values(2005, 'KARAN SINTRE', 'BULDHANA', 256756, 30, TO_DATE('22-APR-09','DD-MON-YY'));

INSERT INTO Vendors_table Values(2006, 'RAM KULKARNI', 'OSMANABAD', 20367454, 21, TO_DATE('09-JUL-10','DD-MON-YY'));

-- SHOW DATA PRESENT IN VENDORS TABLE
SELECT * FROM Vendors_table;

------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATING TABLE EMPLOYEES
CREATE TABLE Employees_table
(
EID number PRIMARY KEY, 
ENAME varchar(100), 
EJOB varchar(100), 
EADD varchar (100), 
E_CONTACT number, 
ESAL number, 
EDOJ date,
EDOL date
);

-- INSERTING DATA INTO EMPLOYEES TABLE
INSERT INTO Employees_table Values(3001, 'STEVEN KING', 'PAINTER', 'NEW YORK', 10367454, 1200, TO_DATE('09-JUL-10','DD-MON-YY'), NULL);

INSERT INTO Employees_table Values(3002, 'DAVID AUSTIN', 'FITTER', 'MAN HATON', 10367434, 1100, TO_DATE('19-AUG-10','DD-MON-YY'), NULL);

INSERT INTO Employees_table Values(3003, 'BRUCE ERNST', 'MECHANIC', 'NEW JERCY', 10367264, 2200, TO_DATE('08-SEP-10','DD-MON-YY'), NULL);

INSERT INTO Employees_table Values(3004, 'LUIS POPP', 'MECHANIC', 'NEW JERCY', 10367264, 1700, TO_DATE('19-OCT-09','DD-MON-YY'), TO_DATE('06-SEP-10','DD-MON-YY'))

INSERT INTO Employees_table Values(3005, 'SHERI GOMES', 'FITTER', 'PARIS', 10327264, 1000, TO_DATE('19-OCT-09','DD-MON-YY'), TO_DATE('01-AUG-10','DD-MON-YY'))

INSERT INTO Employees_table Values(3000, 'JAMES PHILLIP', 'FITTER', 'PARIS', 10322264, NULL, TO_DATE('01-JAN-08','DD-MON-YY'),NULL);

-- SHOW DATA PRESENT IN Employees TABLE
SELECT * FROM Employees_table;

------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATING TABLE SPAREPART
CREATE TABLE Sparepart_table
(
SPID number PRIMARY KEY, 
SPNAME varchar(350), 
SPRATE number, 
SPUNIT varchar2(20)
);


-- INSERTING DATA INTO SPAREPART TABLE
INSERT INTO Sparepart_table Values(4001, 'TWO WHEELER TUBE', 250, 'NOS');

INSERT INTO Sparepart_table Values (4002, 'TWO WHEELER ENGINE OIL', 400, 'LTRS');

INSERT INTO Sparepart_table values (4003, 'FOUR WHEELER ENGINE OIL', 5000, 'LTRS');

INSERT INTO Sparepart_table Values(4004, 'TWO WHEELER CARBORATOR', 680, 'NOS'); 

INSERT INTO Sparepart_table Values (4005, 'TWO WHEELER CLUTCH WIRE', 129, 'MTRS'); 

INSERT INTO Sparepart_table Values(4006, 'TWO WHEELER TAIIL LIGHT', 100, 'NOS');

INSERT INTO Sparepart_table Values(4007, 'TWO WHEELER INDICATORS', 150, 'NOS');

INSERT INTO Sparepart_table Values(4008, 'FOUR WHEELER GASKIT', 1340, 'NOS');

INSERT INTO Sparepart_table Values (4009, 'WHITE COLOUR', 340, 'LTRS');

INSERT INTO Sparepart_table Values(4010, 'BLACK COLOUR', 240, 'LTRS'); 

INSERT INTO Sparepart_table values(4011, 'TWO WHEELER SIDE MIRROR', 250, 'NOS');

INSERT INTO Sparepart_table values (4012, 'FOUR WHEELER SIDE MIRRIOR', 450, 'NOS');

INSERT INTO Sparepart_table Values (4013, 'TWO WHEELER SHOCKUP', 1320, 'PAIR');

INSERT INTO Sparepart_table Values(4014, 'FOUR WHEELER BUMPER', 6000, 'NOS'); 

INSERT INTO Sparepart_table values(4015, 'FOUR WHEELER FRONT GLASS', 7000, 'PCS');

-- SHOW DATA PRESENT IN Employees TABLE
SELECT * FROM Sparepart_table;

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATING TABLE PURCHASE
CREATE TABLE Purchase_table
(
PID number PRIMARY KEY,
VID number REFERENCES Vendors_table(Vid) ON DELETE CASCADE NOT NULL, 
SPID number REFERENCES Sparepart_table(SPID) ON DELETE CASCADE NOT NULL, 
PQTY number, 
SPRATE number, 
SPGST float(3), 
PDATE date, 
TRANCOST number, 
TOTAL float(3),
RCV_EID number REFERENCES Employees_table(EID) ON DELETE CASCADE NOT NULL
);


-- INSERTING DATA INTO PURCHASE TABLE

INSERT INTO Purchase_table Values(5001, 2001,4001, 10, 250, 350, TO_DATE('01-JAN-11','DD-MON-YY'), 1300, 4150, 3001);

INSERT INTO Purchase_table Values(5002, 2002, 4002, 4, 400, 288, TO_DATE('02-MAR-11','DD-MON-YY'), 100, 1988, 3001); 

INSERT INTO Purchase_table Values(5003, 2003, 4004, 8, 680, 761.6, TO_DATE('12-JUN-11','DD-MON-YY'), 50, 6251.6, 3003); 

INSERT INTO Purchase_table Values(5004, 2004, 4005, 10, 129, 154.8, TO_DATE('22-AUG-11','DD-MON-YY'), 125,1569.8, 3004);

INSERT INTO Purchase_table Values (5005, 2005, 4006, 20, 100, 300, TO_DATE('07-SEP-11','DD-MON-YY'), 20, 2320, 3003);

INSERT INTO Purchase_table Values(5006, 2006, 4007, 30, 150, 630, TO_DATE('12-OCT-11','DD-MON-YY'), 60, 5190, 3000);

INSERT INTO Purchase_table Values(5007, 2001, 4003, 20, 5000, 14000, TO_DATE('07-SEP-11','DD-MON-YY'), 1000, 115000, 3000);

INSERT INTO Purchase_table Values(5008, 2006, 4005, 1, 129, 15.48, TO_DATE('12-OCT-11','DD-MON-YY'), 50, 194.48, 3005);

INSERT INTO Purchase_table Values(5009, 2006, 4005, 1, 129, 15.48, TO_DATE('15-OCT-11','DD-MON-YY'), 50, 194.48, 3005);

INSERT INTO Purchase_table Values (5010, 2006, 4009, 5, 340, 238, TO_DATE('20-OCT-11','DD-MON-YY'), 0, 2938, 3005);


-- SHOW DATA PRESENT IN PURCHASE TABLE
SELECT * FROM Purchase_table;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- CREATING TABLE SER_DET Table
CREATE TABLE SER_DET_table
(
SID number PRIMARY KEY,
CID number REFERENCES Customer_table(CID) ON DELETE CASCADE NOT NULL,
EID number REFERENCES Employees_table(EID) ON DELETE CASCADE NOT NULL,
SPID number REFERENCES Sparepart_table(SPID) ON DELETE CASCADE NOT NULL,
TYP_VEH varchar(100),
VEH_NO varchar(100), 
TYP_SER varchar (100), 
SER_DATE date,
QTY float(2),
SP_RATE number,
SP_AMT number,
SP_G number,
SER_AMT number,
COMM number, 
TOTAL number
);


-- INSERTING DATA INTO SER_DET Table TABLE

INSERT INTO SER_DET_table Values(6001, 1001, 3001, 4001, 'TWD WHEELER', 'MH15CA3228', 'TUBE DAMAGED',    TO_DATE('02-JAN-11','DD-MON-YY'),   1,   250, 250, 35,  50,  0,   335);
INSERT INTO SER_DET_table values(6002, 1002, 3002, 4002, 'TWO WHEELER', 'MH-16U5713', 'FULL SERVICING',  TO_DATE('04-MAR-11','DD-MON-YY'),   1,   400, 400, 52,  300, 50,  752); 
INSERT INTO SER_DET_table Values(6003, 1003, 3004, 4005, 'TWO WHEELER', 'MH12PQ1313', 'CLUCH WIRE',      TO_DATE('22-AUG-11','DD-MON-YY'),   1,   129, 129, 0,   10,  0,   139); 
INSERT INTO SER_DET_table Values(6004, 1002, 3002, 4002, 'TWO WHEELER', 'MH-16U5713', 'FULL SERVICING',  TO_DATE('05-MAY-11','DD-MON-YY'),   1,   400, 400, 52,  300, 50,  752); 
INSERT INTO SER_DET_table Values(6005, 1004, 3001, 4009, 'TWO WHEELER', 'MH-14PA335', 'COLOR',           TO_DATE('21-OCT-11','DD-MON-YY'),   2.5, 340, 850, 119, 500, 150, 1469); 
INSERT INTO SER_DET_table values(6006, 1006, 3001, 4009, 'TWO WHEELER', 'MH-12WE334', 'COLOR',           TO_DATE('01-DEC-11','DD-MON-YY'),   2.5, 340, 850, 119, 500, 150, 1469); 
INSERT INTO SER_DET_table Values(6007, 1007, 3001, 4001, 'FOUR WHEELER','MH17BB1345', 'TUBE DAMAGED',    TO_DATE('01-JAN-12','DD-MON-YY'),   1,   250, 250, 35,  150, 0,   435);


-- SHOW DATA PRESENT IN SER_DET Table TABLE
SELECT * FROM SER_DET_TABLE;

--------------------------------------------------------------------------------------------------------------------------------------------

---------------------QUESTIONS AND ANSWERS----------------------------------------

--Q
