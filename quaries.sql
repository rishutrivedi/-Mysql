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

-----------------------------------------------

-- SELECT 
--     filed_names
-- FROM
--     table_name
-- LIMIT [offset,] row_count;

SELECT 
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC 
LIMIT 5; 
---

SELECT 
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit,
    customerNumber 
LIMIT 5; 

---

-- pagination queries

SELECT 
    customerNumber,
    customerName
FROM
    customers
ORDER BY 
    customerName
LIMIT 10; 

-- This query returns 10 rows for the row 11-20
SELECT 
    customerNumber,
    customerName
FROM
    customers
ORDER BY 
    customerName
LIMIT 10, 10 ; 

--
SELECT DISTINCT
    `state`
FROM
    `customers` 
WHERE 
    `state` IS NOT NULL
LIMIT 5;

----------------

SELECT 
    CONCAT_WS(', ', lastName, firstName) AS `Full Name`
FROM
    employees;
---
SELECT 
    CONCAT_WS(', ', lastName, firstName) AS `Full Name`
FROM
    employees
ORDER BY 
    `Full Name`;

-----

SELECT
    orderNumber `Order no.`,
    SUM(priceEach * quantityOrdered) total 
FROM
    orderdetails
GROUP BY 
    `Order no.`
HAVING 
    total > 60000;

-------------------------------

-- Joining queries

CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);

INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');

-- MySQL INNER JOIN clause
-- The following shows the basic syntax of the 
-- inner join clause that joins two tables table_1 and table_2:

-- SELECT column_list
-- FROM table_1
-- INNER JOIN table_2 ON join_condition;

-- If the join condition uses the equality operator (=) and the column names in both tables used for matching are the same, and you can use the USING clause instead:

-- SELECT column_list
-- FROM table_1
-- INNER JOIN table_2 USING (column_name);

----------- MySQL INNER JOIN clause
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c ON c.name = m.name;


+-----------+--------+--------------+-----------+
| member_id | member | committee_id | committee |
+-----------+--------+--------------+-----------+
|         1 | John   |            1 | John      |
|         3 | Mary   |            2 | Mary      |
|         5 | Amelia |            3 | Amelia    |
+-----------+--------+--------------+-----------+

-- Because both tables use the same column to match, 
-- you can use the USING clause as shown in the following query:

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c USING(name);

----------------MySQL LEFT JOIN clause

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(name);

+-----------+--------+--------------+-----------+
| member_id | member | committee_id | committee |
+-----------+--------+--------------+-----------+
|         1 | John   |            1 | John      |
|         2 | Jane   |         NULL | NULL      |
|         3 | Mary   |            2 | Mary      |
|         4 | David  |         NULL | NULL      |
|         5 | Amelia |            3 | Amelia    |
+-----------+--------+--------------+-----------+

-- To find members who are not the committee members, 
-- you add a WHERE clause and IS NULL operator as follows:

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(name)
WHERE c.committee_id IS NULL;

+-----------+--------+--------------+-----------+
| member_id | member | committee_id | committee |
+-----------+--------+--------------+-----------+
|         2 | Jane   |         NULL | NULL      |
|         4 | David  |         NULL | NULL      |
+-----------+--------+--------------+-----------+


----------------------------- MySQL RIGHT JOIN clause


SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c on c.name = m.name;

+-----------+--------+--------------+-----------+
| member_id | member | committee_id | committee |
+-----------+--------+--------------+-----------+
|         1 | John   |            1 | John      |
|         3 | Mary   |            2 | Mary      |
|         5 | Amelia |            3 | Amelia    |
|      NULL | NULL   |            4 | Joe       |
+-----------+--------+--------------+-----------+

-- The following statement uses the right join clause with the USING syntax:

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c USING(name);

--

-- To find the committee members who are not in the members table, you use this query:

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c USING(name)
WHERE m.member_id IS NULL;


----  MySQL CROSS JOIN clause

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
CROSS JOIN committees c;

+-----------+--------+--------------+-----------+
| member_id | member | committee_id | committee |
+-----------+--------+--------------+-----------+
|         1 | John   |            4 | Joe       |
|         1 | John   |            3 | Amelia    |
|         1 | John   |            2 | Mary      |
|         1 | John   |            1 | John      |
|         2 | Jane   |            4 | Joe       |
|         2 | Jane   |            3 | Amelia    |
|         2 | Jane   |            2 | Mary      |
|         2 | Jane   |            1 | John      |
|         3 | Mary   |            4 | Joe       |
|         3 | Mary   |            3 | Amelia    |
|         3 | Mary   |            2 | Mary      |
|         3 | Mary   |            1 | John      |
|         4 | David  |            4 | Joe       |
|         4 | David  |            3 | Amelia    |
|         4 | David  |            2 | Mary      |
|         4 | David  |            1 | John      |
|         5 | Amelia |            4 | Joe       |
|         5 | Amelia |            3 | Amelia    |
|         5 | Amelia |            2 | Mary      |
|         5 | Amelia |            1 | John      |
+-----------+--------+--------------+-----------+

---------
-- To get the whole organization structure, 
-- you can join the employees table to itself using 
-- the employeeNumber and reportsTo columns. 
-- The table employees has two roles: one is the Manager and the other is Direct Reports.


SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;


---------------------



------------------------------------------------------------------------------

--- UPDATE JOIN 

CREATE DATABASE IF NOT EXISTS empdb;

USE empdb;

-- create tables
CREATE TABLE merits (
    performance INT(11) NOT NULL,
    percentage FLOAT NOT NULL,
    PRIMARY KEY (performance)
);

CREATE TABLE employees (
    emp_id INT(11) NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(255) NOT NULL,
    performance INT(11) DEFAULT NULL,
    salary FLOAT DEFAULT NULL,
    PRIMARY KEY (emp_id),
    CONSTRAINT fk_performance FOREIGN KEY (performance)
        REFERENCES merits (performance)
);

-- insert data for merits table
INSERT INTO merits(performance,percentage)
VALUES(1,0),
      (2,0.01),
      (3,0.03),
      (4,0.05),
      (5,0.08);

-- insert data for employees table
INSERT INTO employees(emp_name,performance,salary)      
VALUES('Mary Doe', 1, 50000),
      ('Cindy Smith', 3, 65000),
      ('Sue Greenspan', 4, 75000),
      ('Grace Dell', 5, 125000),
      ('Nancy Johnson', 3, 85000),
      ('John Doe', 2, 45000),
      ('Lily Bush', 3, 55000);

UPDATE employees
        INNER JOIN
    merits ON employees.performance = merits.performance 
SET 
    salary = salary + salary * percentage;

------------------------------------------------

-- MySQL UPDATE JOIN example with LEFT JOIN
-- Suppose the company hires two more employees:

INSERT INTO employees(emp_name,performance,salary)
VALUES('Jack William',NULL,43000),
      ('Ricky Bond',NULL,52000);

-- you can increase the salary for a new hire by 1.5%  using the following statement:

UPDATE employees
        LEFT JOIN
    merits ON employees.performance = merits.performance 
SET 
    salary = salary + salary * 0.015
WHERE
    merits.percentage IS NULL;

-- 
--------------- DELETE JOIN 

DROP TABLE IF EXISTS t1, t2;

CREATE TABLE t1 (
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE t2 (
    id VARCHAR(20) PRIMARY KEY,
    ref INT NOT NULL
);

INSERT INTO t1 VALUES (1),(2),(3);

INSERT INTO t2(id,ref) VALUES('A',1),('B',2),('C',3);

select * from t1;
select * from t2;

DELETE t1,t2 FROM t1
        INNER JOIN
    t2 ON t2.ref = t1.id 
WHERE
    t1.id = 1;

select * from t1;
select * from t2;

----------------------------

--------------- SUB Queries
 -- customer who has the highest payment.
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments);
----------- 

-- you can find customers whose payments are greater than the average payment using a subquery: 

SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount > (SELECT 
            AVG(amount)
        FROM
            payments);

-- you can use a subquery with NOT IN operator 
-- to find the customers who have not placed any orders :

SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber NOT IN (SELECT DISTINCT
            customerNumber
        FROM
            orders);

-- correlated subquery
-- Unlike a standalone subquery, a correlated subquery is a subquery 
-- that uses the data from the outer query. In other words, 
-- a correlated subquery depends on the outer query. 
-- A correlated subquery is evaluated once for each row in the outer query.

/* select products whose buy prices are greater than 
 the average buy price of all products in each product line. */

SELECT 
    productname, 
    buyprice,
    productline
FROM
    products p1
WHERE
    buyprice > (SELECT 
            AVG(buyprice)
        FROM
            products
        WHERE
            productline = p1.productline)

-- customers who placed at least one sales order with the total value 
-- greater than 60K by using the EXISTS operator:

SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS( SELECT 
            orderNumber, SUM(priceEach * quantityOrdered)
        FROM
            orderdetails
                INNER JOIN
            orders USING (orderNumber)
        WHERE
            customerNumber = customers.customerNumber
        GROUP BY orderNumber
        HAVING SUM(priceEach * quantityOrdered) > 60000);




------------------------------------


--- Indexes 


SELECT
    phone_number
FROM 
    phonebooks
WHERE 
    first_name = 'Bob' AND 
    last_name = 'Cat';

-----------

-- create indexes for a table at the time of creation. 
-- For example, the following statement creates a 
-- new table with an index that consists of two columns c2 and c3.

CREATE TABLE t(
   c1 INT PRIMARY KEY,
   c2 INT NOT NULL,
   c3 INT NOT NULL,
   c4 VARCHAR(10),
   INDEX (c2,c3) 
);


-- To add an index for a column or a set of columns, 
-- you use the CREATE INDEX statement as follows:

CREATE INDEX index_name ON table_name (column_list)
CREATE INDEX idx_c4 ON t(c4);

-----------------

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';

EXPLAIN SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';


CREATE INDEX jobTitle ON employees(jobTitle);

EXPLAIN SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';

SHOW INDEXES FROM employees;

--------------

DROP INDEX index_name ON table_name;

CREATE TABLE leads(
    lead_id INT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    information_source VARCHAR(255),
    INDEX name(first_name,last_name),
    UNIQUE email(email),
    PRIMARY KEY(lead_id)
);


DROP INDEX name ON leads;


SHOW INDEXES FROM table_name;


SHOW INDEXES FROM table_name IN database_name;

----------------------------

CREATE UNIQUE INDEX index_name
ON table_name(index_column_1,index_column_2,...);

CREATE TABLE table_name(
...
   UNIQUE KEY(index_column_,index_column_2,...) 
);

ALTER TABLE table_name
ADD CONSTRAINT constraint_name UNIQUE KEY(column_1,column_2,...);

----------------------------------------

CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    UNIQUE KEY unique_email (email)
);

INSERT INTO contacts(first_name,last_name,phone,email)
VALUES('John','Doe','(408)-999-9765','john.doe@mysqltutorial.org');

INSERT INTO contacts(first_name,last_name,phone,email)
VALUES('Johny','Doe','(408)-999-4321','john.doe@mysqltutorial.org');

CREATE UNIQUE INDEX idx_name_phone
ON contacts(first_name,last_name,phone);

INSERT INTO contacts(first_name,last_name,phone,email)
VALUES('john','doe','(408)-999-9765','john.d@mysqltutorial.org');

--------------------------------------

-- composite index

CREATE TABLE table_name (
    c1 data_type PRIMARY KEY,
    c2 data_type,
    c3 data_type,
    c4 data_type,
    INDEX index_name (c2,c3,c4)
);


CREATE INDEX index_name 
ON table_name(c2,c3,c4);


Notice that if you have a composite index on (c1,c2,c3), 
you will have indexed search capabilities on one the following column combinations:

(c1)
(c1,c2)
(c1,c2,c3)

SELECT
    *
FROM
    table_name
WHERE
    c1 = v1;


SELECT
    *
FROM
    table_name
WHERE
    c1 = v1 AND 
    c2 = v2;


SELECT  
    *
FROM
    table_name
WHERE
    c1 = v1 AND 
    c2 = v2 AND 
    c3 = v3;



CREATE INDEX name 
ON employees(lastName, firstName);


-- Find employees whose last name is Patterson
SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson';

EXPLAIN SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson';


SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson' AND
    firstName = 'Steve';


EXPLAIN SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson' AND
    firstName = 'Steve';

SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson' AND
    (firstName = 'Steve' OR 
    firstName = 'Mary');

 https://arctype.com/blog/mysql-explain/#:~:text=In%20the%20MySQL%20world%2C%20EXPLAIN,The%20ID%20of%20the%20query 

EXPLAIN SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson' AND
    (firstName = 'Steve' OR 
    firstName = 'Mary');


SHOW INDEXES FROM orders; 

-- MySQL generates the index cardinality based on statistics stored as integers, 
-- therefore, the value may not be necessarily exact.

-- The query optimizer uses the index cardinality to generate an optimal query plan for a given query.
--  It also uses the index cardinality to decide whether to use the index or not in the join operations.

------------------------------------------

-- Create Procedures:

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

DELIMITER ;

CALL GetCustomers();
------------------------

SELECT * FROM products;
--------------
DROP PROCEDURE [IF EXISTS] stored_procedure_name;
-------------------
DELIMITER $$

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT 
        firstName, 
        lastName, 
        city, 
        state, 
        country
    FROM employees
    INNER JOIN offices using (officeCode);
    
END$$

DELIMITER ;

DROP PROCEDURE GetEmployees;

--------

DROP PROCEDURE abc; -- error

DROP PROCEDURE IF EXISTS abc; -- acknowledgement

------------------

----------- Store Procedures with parameters

DELIMITER //

CREATE PROCEDURE GetOfficeByCountry( 
    IN countryName VARCHAR(255) 
    )
BEGIN
	SELECT * 
 	FROM offices
	WHERE country = countryName;
END //

DELIMITER ;

CALL GetOfficeByCountry('USA');

------------------

--- in and out 

DELIMITER $$

CREATE PROCEDURE GetOrderCountByStatus (
	IN  orderStatus VARCHAR(25),
	OUT total INT
)
BEGIN
	SELECT COUNT(orderNumber)
	INTO total
	FROM orders
	WHERE status = orderStatus;
END$$

DELIMITER ;

CALL GetOrderCountByStatus('Shipped',@total);
SELECT @total;

CALL GetOrderCountByStatus('in process',@total);
SELECT @total AS  total_in_process;


---------------------------


DELIMITER $$

CREATE PROCEDURE GetOrderAmount()
BEGIN
    SELECT 
        SUM(quantityOrdered * priceEach) 
    FROM orderDetails;
END$$

DELIMITER ;

--------------------------

SHOW PROCEDURE STATUS;

SHOW PROCEDURE STATUS WHERE db = 'classiccompany';

SHOW PROCEDURE STATUS LIKE '%pattern%'
SHOW PROCEDURE STATUS LIKE '%Order%'

------------------------




--  Listing stored procedures using the data dictionary

SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'PROCEDURE'
        AND routine_schema = '<database_name>';


SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'PROCEDURE'
        AND routine_schema = 'classiccompany';