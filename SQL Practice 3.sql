-- SQL Exercises, Practice, Solution - Wildcard and Special operators
-- 1. From the following table, write a SQL query to find the details of those salespeople who come from the 'Paris' City
--    or 'Rome' City. Return salesman_id, name, city, commission.
--    Sample table: sale
CREATE TABLE sale (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(4, 2)
);

INSERT INTO sale (salesman_id, name, city, commission) VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);
select * from sale
where city="Paris" or city= "Rome";

-- 2. From the following table, write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'.
--  Return salesman_id, name, city, commission. 
-- This query selects all columns from the 'salesman' table.
SELECT *
FROM sale
WHERE city = 'Paris' OR city = 'Rome';

-- 3. From the following table, write a SQL query to find the details of those salespeople who live in cities other than 
-- Paris and Rome. Return salesman_id, name, city, commission. 
SELECT *
FROM sale
where city not in ("Paris" ,"Rome");

-- 4. From the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the
-- values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.
select * from customers
where customer_id in (3007,3008,3009);


-- 5. From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 
-- (begin and end values are included). Return salesman_id, name, city, and commission. 
select * from salesman 
where commission between 0.12 and 0.14;

-- 6. From the following table, write a SQL query to select orders between 500 and 4000 (begin and end values are included).
--  Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.
select * from orders
where (purch_amt between 500 and 4000) and purch_amt not in (948.50,1983.43);

-- 7. From the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter
--  between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 
-- This query selects all columns from the 'salesman' table.
SELECT *
-- Specifies the table from which to retrieve the data (in this case, 'salesman').
FROM salesman
-- Filters the rows to only include those where the 'name' column is between 'A' and 'L'.
WHERE name BETWEEN 'A' AND 'L';

-- 8. From the following table, write a SQL query to find the details of all salespeople except those whose names begin with 
-- any letter between 'A' and 'M'. Return salesman_id, name, city, commission.  
SELECT *
-- Specifies the table from which to retrieve the data (in this case, 'salesman').
FROM salesman
-- Filters the rows to only include those where the 'name' column is not between 'A' and 'L'.
WHERE name NOT BETWEEN 'A' AND 'L';

-- 9.From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'.
-- Return customer_id, cust_name, city, grade, salesman_id.
CREATE TABLE modifify (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
);
INSERT INTO modifify (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan', 'London', NULL, 5005);
select * from modifify
where cust_name LIKE "B%";

-- 10. From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. 
-- Return customer_id, cust_name, city, grade, salesman_id.
select * from modifify
where cust_name LIKE "%n";

-- 11. From the following table, write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the
--  fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission.
select * from salesman2
where name like "N__l%";

-- 12. From the following table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). 
-- Return col1.
CREATE TABLE testtable (
    col1 VARCHAR(255)
);

INSERT INTO testtable (col1) VALUES
('A001/DJ-402\44_/100/2015'),
('A001_\DJ-402\44_/100/2015'),
('A001_DJ-402-2014-2015'),
('A002_DJ-401-2014-2015'),
('A001/DJ_401'),
('A001/DJ_402\44'),
('A001/DJ_402\44\2015'),
('A001/DJ-402%45\2015/200'),
('A001/DJ_402\45\2015%100'),
('A001/DJ_402%45\2015/300'),
('A001/DJ-402\44');
select * from testtable
where col1 like "%/_%" ESCAPE '/';

-- 13. From the following table, write a SQL query to identify those rows where col1 does not contain the escape character 
-- underscore ( _ ). Return col1.
-- Sample table: testtable
select * from testtable
where col1 not like "%/_%" ESCAPE '/';

-- 14. From the following table, write a SQL query to find rows in which col1 contains the forward slash character ( / ).
--  Return col1.
-- Sample table: testtable
select * from testtable
WHERE col1 LIKE '%//%' ESCAPE '/';

-- 15. From the following table, write a SQL query to identify those rows where col1 does not contain the forward slash
--  character ( / ). Return col1.
select * from testtable
WHERE col1 not LIKE '%//%' ESCAPE '/';

-- 16. From the following table, write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.
-- Sample table: testtable
-- This query selects all columns from the 'testtable'.
SELECT *
-- Specifies the table from which to retrieve the data (in this case, 'testtable').
FROM testtable
-- Filters the rows to only include those where the 'col1' column:
-- - Contains the sequence of characters '%/_//%' where the underscore '_' is followed by a forward slash '/'.
-- The ESCAPE clause is used to escape the special character '/' in the pattern.
WHERE col1 LIKE '%/_//%' ESCAPE '/';

-- 17. From the following table, write a SQL query to find those rows where col1 does not contain the string ( _/ ).
--  Return col1
SELECT *
FROM testtable
WHERE col1 not LIKE '%/_//%' ESCAPE '/';

-- 18. From the following table, write a SQL query to find those rows where col1 contains the character percent ( % ).
--  Return col1.
-- Sample table: testtable
SELECT *
FROM testtable
WHERE col1 LIKE '%/%%' ESCAPE '/';

-- 19. From the following table, write a SQL query to find those rows where col1 does not contain the character percent ( % ). 
-- Return col1.
SELECT *
FROM testtable
WHERE col1 not LIKE '%/%%' ESCAPE '/';

-- 20. From the following table, write a SQL query to find all those customers who does not have any grade. Return customer_id,
-- cust_name, city, grade, salesman_id.
CREATE TABLE customer1(
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
);

INSERT INTO customer1 (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);
-- This query selects all columns from the 'customer' table.
SELECT *
-- Specifies the table from which to retrieve the data (in this case, 'customer').
FROM customer1
-- Filters the rows to only include those where the 'grade' column is NULL.
WHERE grade IS NULL;

-- 21. From the following table, write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,
-- city, grade, salesman_id.
SELECT *
-- Specifies the table from which to retrieve the data (in this case, 'customer').
FROM customer1
-- Filters the rows to only include those where the 'grade' column is NULL.
WHERE grade IS not NULL;

-- 22. From the following table, write a SQL query to locate the employees whose last name begins with the letter 'D'.
--  Return emp_idno, emp_fname, emp_lname and emp_dept. Go to the editor
-- Sample table: emp_details
CREATE TABLE employees1 (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(255),
    EMP_LNAME VARCHAR(255),
    EMP_DEPT INT
);

INSERT INTO employees1 (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);
select * from employees1
where EMP_LNAME LIKE "D%";