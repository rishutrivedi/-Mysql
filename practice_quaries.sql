------------------------------------------Sir's quaries---------------------
--C:\Program Files\MySQL\MySQL Server 8.0\bin
-- mysql installation
-- workbench

-- Check version
mysql -V 

-- Access MySQL  -- Command prompt  -- gui editors: 

mysql -u root -p 

-- crud operations

-- Show Database
show databases;
SHOW DATABASES;

-- Create Database
CREATE DATABASE prodapt_database;

-- use database

USE prodapt_database;

-- Show tables / LIST TABLES
SHOW TABLES;

-- create table 
--VARCHAR(M) 1 AND 255

CREATE TABLE course_list (
    course_id INT NOT NULL AUTO_INCREMENT,
    course_title VARCHAR(50) NOT NULL,
    course_author VARCHAR(40) NOT NULL,
    course_date DATE,
    PRIMARY KEY(course_id)
);

-- drop table
DROP TABLE course_list; 

-- insert one record data into table

INSERT INTO course_list (course_title, course_author, course_date) VALUES ("Java", "Venkat", NOW());

-- insert multiple records  into table

INSERT INTO course_list (course_title, course_author, course_date) 
    VALUES
    ("MySQL", "Venkat", NOW()),
    ("Angular", "Venkat", NOW()),
    ("API", "Venkat", NOW());

-- Select data from table

select * from course_list;
select course_title from course_list;

-- update records in the table

UPDATE course_list SET course_title="API Testing" WHERE course_id=4;

-- Delete query

DELETE FROM course_list  WHERE course_id=4;

-- rename table
RENAME TABLE old_table_name TO new_table_name;

ALTER TABLE course_list RENAME TO new_table_name;


RENAME TABLE course_list TO tech_stack;
-- alter tables
    -- drop colums
    -- addcolumns

-- ALTER TABLE table_name 
-- ADD 
--    new_column_name column_definition 

ALTER TABLE course_list 
ADD 
   course_score VARCHAR(100) NOT NULL; 

-- add multiple columns
ALTER TABLE course_list 
    ADD course_score VARCHAR(100) NOT NULL,
    ADD course_score_two VARCHAR(100) NOT NULL;

--describe table
describe table_name; 

-- Modify column type
ALTER TABLE course_list
    MODIFY course_score_two VARCHAR(50) NOT NULL,
    MODIFY course_title VARCHAR(100) NOT NULL;

-- Rename column name
ALTER TABLE course_list
    CHANGE COLUMN old_column_name new_column_name INT NOT NULL;

ALTER TABLE course_list
    CHANGE COLUMN course_score_two course_status INT NOT NULL;


-- delete column
ALTER TABLE course_list
    DROP COLUMN column_name;

--RelationShips--
-- FOREIGN KEY RelationShips

CREATE TABLE Orders (
    OrderID INT NOT NULL,
    OrderNumer INT NOT NULL,
    PersonID int,
    PRIMARY KEY(OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
);

-- ALTER FOREIGN KEY 
ALTER TABLE Orders 
ADD CONSTRAINT FK_PersonOrder FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)

-- Drop FOREIGN KEY
ALTER TABLE Orders DROP CONSTRAINT FK_PersonOrder;

--- Import existing database 
-- inside mysql terminal

source path/mysql_file_name

source I:\Training\KValuent\Prodast\tech_stack\MySQL\mysqlsampledatabase.sql

-----------------------------

-- Query data 
--     select 
--     sort
--     filter 
--     joining 
--     group 
--     subqueries
--     set 
--     modify 


--SELECT filed_name FROM tablename;

-- FROM -> SELECT 

SELECT lastName FROM employees;

SELECT firstName, lastName, jobTitle FROM employees;

SELECT * FROM employees;

-- SELECT 

SELECT 1 + 1;

SELECT CONCAT("BVS", ' ', "RAO");

SELECT NOW();

-- column alias

-- SELECT expression AS column_alias;

SELECT CONCAT("BVS", ' ', "RAO") AS fullname;

-- Sort quries

-- FROM -> SELECT -> ORDER BY

SELECT 
    filed_names
FROM
    table_name
ORDER BY 
    column1 [asc|desc],
    column2 [asc|desc],
    ....;

-- user customer table to practce sort

--- ORDER BY lastname 

SELECT 
    contactLastName,
    contactFirstName
FROM
    customers 
ORDER BY 
    contactLastName;


SELECT 
    contactLastName,
    contactFirstName
FROM
    customers 
ORDER BY 
    contactLastName DESC;


SELECT 
    contactLastName,
    contactFirstName
FROM
    customers 
ORDER BY 
    contactLastName DESC,
    contactFirstName ASC;

-- orderdetails table 
SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach
FROM 
    orderdetails
ORDER BY
    quantityOrdered * priceEach DESC;

SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM 
    orderdetails
ORDER BY
    subtotal DESC;


-- status 
    -- In Progress 
    -- On Hold 
    -- Canceled 
    -- Resolved
    -- Disputed 
    -- Shipped 

SELECT 
    orderNumber, status
FROM 
    orders 
ORDER BY FIELD(status,
    "In Process",
    "On Hold",
    "Cancelled",
    "Resolved",
    "Disputed",
    "Shipped");

SELECT 
    firstName,
    lastName,
    reportsTo
FROM
    employees
ORDER BY reportsTo;

SELECT 
    firstName,
    lastName,
    reportsTo
FROM
    employees
ORDER BY reportsTo DESC;


--- Filtering data 
-- WHERE 
-- SELECT DISTINCT 
-- AND 
-- OR 
-- IN 
-- NOT IN 
-- BETWEEN 
-- LIMIT 
-- IS NULL 

-- FROM -> WHERE -> SELECT -> ORDER BY 

SELECT
    firstName,
    lastName,
    jobTitle
FROM 
    employees
WHERE
    jobTitle = "Sales Rep";
---
SELECT
    firstName,
    lastName,
    jobTitle
FROM 
    employees
WHERE
    jobTitle = "Sales Rep" AND 
    officeCode = 1;

-- 
SELECT
    firstName,
    lastName,
    jobTitle,
    officeCode
FROM 
    employees
WHERE
    jobTitle = "Sales Rep" OR 
    officeCode = 1;
---

SELECT
    firstName,
    lastName,
    jobTitle,
    officeCode
FROM 
    employees
WHERE
    jobTitle = "Sales Rep" OR 
    officeCode = 1
ORDER BY 
    officeCode,
    jobTitle;

---
SELECT
    firstName,
    lastName,
    officeCode
FROM 
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;

---
-- LIKE clause 

SELECT
    firstName,
    lastName
FROM 
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;

"Tho%"
'%son'
'%att%'
"_r%"
"a_%"
"a__%"
't%n'

-- IN operator 

SELECT
    firstName,
    lastName,
    officeCode
FROM 
    employees
WHERE
    officeCode IN (1, 2, 3)
ORDER By
    officeCode;
--- 
SELECT 
    customerName,
    customerNumber
FROM 
    customers
ORDER BY
    creditLimit DESC
    LIMIT 5;

------------pagination

SELECT 
    customerNumber,    
    customerName
   
FROM 
    customers
ORDER BY
    customerName
    LIMIT 10;

SELECT 
    customerNumber,    
    customerName
   
FROM 
    customers
ORDER BY
    customerName
    LIMIT 10,10;


SELECT DISTINCT
    `state`
FROM
    `customers`
WHERE
    state IS NOT NULL
    LIMIT 5;

------------------------

SELECT
    CONCAT_WS(",",firstName,lastName) AS `fullName`
FROM 
    employees
ORDER BY
    fullName;

---------------oreder detail---------
SELECT 
    orderNumber `order no.`,
    SUM(priceEach*quantityOrdered) total
FROM 
    orderdetails
GROUP BY 
    `order no.`
HAVING 
total>60000;
-------------------------join tables------------------------------
SELECT 
    CONCAT(m.lastName,",",m.firstName) AS Manager,
    CONCAT(e.lastName,",",e.firstName) AS `Direct report`

FROM
    employees e 
INNER JOIN employees m On
m.employeeNumber=e.reportsTo
ORDER BY 
Manager;

---------------update in join-------=

CREATE DATABASE IF NOT EXISTS empdb;

USE empdb;

-----------create table---

CREATE TABLE merits(
    performance INT(11) NOT NULL,
    percentage FLOAT NOT NULL,
    PRIMARY KEY(performance)
);

CREATE TABLE employees(
    emp_id INT(11) NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(255)NOT NULL,
    performance INT(11) DEFAULT NULL,
    salary FLOAT DEFAULT NULL,
    PRIMARY KEY (emp_id),
    CONSTRAINT fk_performance FOREIGN KEY (performance)
    REFERENCES merits(performance)
);

------------insert data merit table-----------
INSERT INTO merits(performance,percentage) VALUES(1,0),(2,.01),(3,.03),(4,.05),(5,.08);

------------insert data in employe table----------

INSERT INTO employees(emp_name,performance,salary)
VALUES ('mary doe',1,50000),('Cindy Smith',3,65000),('SUE green',4,75000),('GRACE dell',5,125000),
('Nancy Jonso',3,85000),('john deo',2,45000),('Lily wish',3,55000);

UPDATE employees
INNER JOIN 
merits ON employees.performance=merits.performance
SET 
salary=salary+salary*percentage;

---------------mysql update join example with left join---
INSERT INTO employees(emp_name,performance,salary)
VALUES ('Jck Wilkian',NULL,43000),('RickyBond',NULL,52000);


------you can increase the salry for a new hire by 1.5% using the following statement---------

UPDATE employees
LEFT JOIN 
merits ON employees.performance=merits.performance
SET 
salary=salary+salary*.015
WHERE 
 merits.percentage IS NULL;

 --------------DELETE join ----------

 DROP TABLE IF EXISTS t1,t2;
 CREATE TABLE t1(
    id INT PRIMARY KEY AUTO_INCREMENT
 );

 CREATE TABLE t2(
    id VARCHAR(20) PRIMARY KEY,
    ref INT NOT NULL
 );

 INSERT INTO t1 VALUES(1),(2),(3);

 INSERT INTO t2 VALUES('A',1),('B',2),('C',3);

 DELETE t1,t2 FROM t1
 INNER JOIN 
 t2 ON t2.ref=t1.id
 WHERE 
 t1.id=1;



 -----------SUB quaries-----------

 -----------customer who has the highest payment -------
 SELECT
   customerNumber,
   checkNumber,
   amount
   FROM
   payments
   WHERE
   amount=(SELECT MAX(amount) FROM payments);

---------you can find customers whose payments are greater than the average payment using a subquery
SELECT
   customerNumber,
   checkNumber,
   amount
   FROM
   payments
   WHERE
           amount>(SELECT
           AVG(amount)
           FROM payments);

---------to find the customer who have not placed any order------------
SELECT 
customerName
FROM 
customers
WHERE
customerNumber NOT IN (SELECT DISTINCT
                        customerNumber
                        FROM 
                        orders);

-------correlate subquery-------
-----unlike a standalone subquery ,a correlate subquery is a subquery
-----that uses the data from the outer query
-----a correlate subquery is evaluated once for each row in the outer query

SELECT 
productname,
buyprice
FROM 
products p1
WHERE
buyprice>(SELECT
                   AVG(buyprice)
                   FROM 
                   products
                   WHERE
                   productline=p1.productline );

---------customers who have placed at least one sales order with the total value 
---------greater than 60k by using the exists operator

SELECT 
customerNumber,
customerName
FROM
 customers
 WHERE
  EXISTS(SELECT
            orderNumber,SUM(priceEach*quantityOrdered)
            FROM
             orderdetails
             INNER JOIN 
             orders
             USING (orderNumber)
             WHERE 
             customerNumber=customers.customerNumber
             GROUP BY orderNumber
             HAVING SUM(priceEach*quantityOrdered)>60000);

SELECT 
    employeeNumber,
    lastName,
    firstName
FROM
employees
WHERE
jobTitle='Sales Rep';

EXPLAIN SELECT 
    employeeNumber,
    lastName,
    firstName
FROM
employees
WHERE
jobTitle='Sales Rep';

CREATE INDEX jobTitle ON employees (jobTitle);

DROP INDEX jobTitle ON employees;

CREATE INDEX jobTitle ON classiccompany (jobTitle);

CREATE TABLE leads(
    lead_id INT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    information_source VARCHAR (255),
    INDEX name(first_name,last_name),
    UNIQUE email(email),
    PRIMARY KEY (lead_id)
);

CREATE UNIQUE INDEX email
ON employees(email);

ALTER TABLE employees
ADD CONSTRAINT duplicate UNIQUE KEY(email);


---------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS contacts(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    UNIQUE KEY unique_email (email)
);
INSERT INTO contacts(first_name,last_name,phone,email)
VALUES ('john','deo','408-999-9765','john.deo@mysqltutorial.org');

INSERT INTO contacts(first_name,last_name,phone,email)
VALUES ('jonny','deo','408-999-9765','jonny.deo@mysqltutorial.org');


CREATE INDEX name 
ON employees (lastName,firstName);

SELECT
firstName,
lastName,
email
FROM
employees
WHERE 
lastName= 'patterson';

EXPLAIN SELECT
firstName,
lastName,
email
FROM
employees
WHERE 
lastName= 'patterson';

SELECT
firstName,
lastName,
email
FROM
employees
WHERE 
lastName= 'patterson' AND
firstName='Steve';

EXPLAIN SELECT
firstName,
lastName,
email
FROM
employees
WHERE 
lastName= 'patterson' AND
firstName='Steve';

SELECT
firstName,
lastName,
email
FROM
employees
WHERE 
lastName= 'patterson' AND
(firstName='Steve' OR firstName='Mary');

EXPLAIN SELECT
firstName,
lastName,
email
FROM
employees
WHERE 
lastName= 'patterson' AND
(firstName='Steve' OR firstName='Mary');


DELIMITER $$
CREATE PROCEDURE GetCustomers()
BEGIN
    SELECT 
        customerName,
        city,
        state,
        postalCode,
        country
    FROM 
        customers
    ORDER BY customerName;
END$$ 
DELIMITER;
CALL GetCustomers();

DROP PROCEDURE [IF EXISTS] GetCustomers;


DELIMITER $$
CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT 
        firstName,
        lastName,
        city,
        state,
        country
    FROM 
       employees 
    INNER JOIN offices USING (officeCode);
END$$ 
DELIMITER;
CALL GetEmployees();


DELIMITER //
CREATE PROCEDURE GetOfficialByCountry(IN countryName VARCHAR(255))
BEGIN
    SELECT *
    FROM  offices
    WHERE country=countryName;
END //
DELIMITER;
CALL GetOfficialByCountry('USA');

DELIMITER $$
CREATE PROCEDURE GetOrderCountByStatus(
    IN orderStatus VARCHAR(25),
    OUT total INT
)
BEGIN
SELECT COUNT(orderNumber)
INTO total
FROM orders
WHERE status = orderStatus;
END$$
DELIMITER;
CALL GetOrderCountByStatus('Shipped',@total);
SELECT @total;


 SHOW PROCEDURE STATUS WHERE db='classiccompany';

 SHOW PROCEDURE STATUS LIKE '%pattern%';