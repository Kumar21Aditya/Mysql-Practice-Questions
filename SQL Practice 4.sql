-- 1. From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.
CREATE TABLE orders1(
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders1 (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001);
select sum(purch_amt) from orders1;

-- 2. From the following table, write a SQL query to calculate the average purchase amount of all orders.
--  Return average purchase amount. 
select avg(purch_amt) from orders1;

-- 3. From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople
select count(distinct(salesman_id)) from orders1;

-- 4. From the following table, write a SQL query to count the number of customers. Return number of customers.
select count(customer_id) from customer1;

-- 5. From the following table, write a SQL query to determine the number of customers who received at least one grade for
--   their activity.
select * from customer1;  
select count(grade) from customer1
where grade is not null;

-- Or

-- This query counts the total number of rows where the 'grade' column is not NULL in the 'customer' table.
SELECT COUNT(ALL grade)
-- Specifies the table from which to retrieve the data (in this case, 'customer').
FROM customer1;

-- 6. From the following table, write a SQL query to find the maximum purchase amount.  
-- Sample table: orders
select * from orders;
select max(purch_amt) from orders;

-- 7. From the following table, write a SQL query to find the minimum purchase amount. 
select min(purch_amt) from orders;

-- 8. From the following table, write a SQL query to find the highest grade of the customers in each city.
--  Return city, maximum grade.  
-- Sample table: customer
select * from customer1;
select city,max(grade) from customer1
group by city;

-- 9. From the following table, write a SQL query to find the highest purchase amount ordered by each customer.
-- Return customer ID, maximum purchase amount. 
-- Sample table: orders
select * from orders1;
select customer_id,max(purch_amt) from orders1
group by customer_id;

-- 10. From the following table, write a SQL query to find the highest purchase amount ordered by each customer on a particular 
-- date. Return, order date and highest purchase amount.
select customer_id,ord_date,max(purch_amt)
from orders1
group by customer_id,ord_date;

-- 11. From the following table, write a SQL query to determine the highest purchase amount made by each salesperson on
--  '2012-08-17'. Return salesperson ID, purchase amount 
--  Sample table: orders
select salesman_id,max(purch_amt)
from orders1
where ord_date='2012-08-17' group by salesman_id;

-- 12. From the following table, write a SQL query to find the highest order (purchase) amount by each customer on a particular
--  order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum 
--  purchase amount.
select customer_id,ord_date,max(purch_amt)
from orders1
 group by customer_id,ord_date
 having max(purch_amt)>2000;
 
 -- 13. From the following table, write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 
 -- (Begin and end values are included.) by combination of each customer and order date. Return customer id, order date and 
 -- maximum purchase amount.
 select customer_id,ord_date,max(purch_amt)
 from orders1
 group by customer_id,ord_date
 having max(purch_amt) between 2000 and 6000;
 
 -- 14. From the following table, write a SQL query to find the maximum order (purchase) amount based on the combination of 
 -- each customer and order date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return 
 -- customer id, order date and maximum purchase amount.]
 select customer_id,ord_date,max(purch_amt)
 from orders1
 group by customer_id,ord_date
 having max(purch_amt) in(2000,3000,5760,6000)
 
 -- 15. From the following table, write a SQL query to determine the maximum order amount for each customer. The customer ID 
 -- should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount.
 select customer_id,max(purch_amt)
 from orders1
 where customer_id between 3002 and 3007
 group by customer_id;
 
 -- 16. From the following table, write a SQL query to find the maximum order (purchase) amount for each customer. The customer 
 -- ID should be in the range 3002 and 3007(Begin and end values are included.). Filter the rows for maximum order (purchase) 
 -- amount is higher than 1000. Return customer id and maximum purchase amount.
-- Sample table: orders
 select customer_id,max(purch_amt)
 from orders1
 where customer_id between 3002 and 3007
 group by customer_id
 having max(purch_amt)>1000;
 
 -- 17. From the following table, write a SQL query to determine the maximum order (purchase) amount generated by each 
 -- salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.).
 -- Return salesperson id and maximum purchase amount.
 select salesman_id,max(purch_amt)
 from orders1
 group by salesman_id
 having salesman_id between 5003 and 5008;
 
 -- 18. From the following table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.
 select count(salesman_id)
 from orders1
 where ord_date='2012-08-17'
 
 -- 19. From the following table, write a SQL query to count the number of salespeople in a city. Return number of salespeople.
-- Sample table: salesman
select * from salesman2
-- This query counts the number of rows in the 'salesman' table where the 'city' is not NULL.
SELECT COUNT(*)
-- Specifies the table from which to retrieve the data (in this case, 'salesman').
FROM salesman2
-- Filters the rows to only include those where the 'city' is not NULL.
WHERE city IS NOT NULL;

--  20. From the following table, write a SQL query to count the number of orders based on the combination of each order
--  date and salesperson. Return order date, salesperson id.
-- Sample table: orders
-- This query counts the number of orders for each combination of 'ord_date' and 'salesman_id' in the 'orders' table.
SELECT ord_date, salesman_id, COUNT(*)
-- Specifies the table from which to retrieve the data (in this case, 'orders').
FROM orders1
-- Groups the result set by the 'ord_date' and 'salesman_id' columns.
GROUP BY ord_date, salesman_id;

-- From the following table, write a SQL query to calculate the average product price. Return average product price.
-- Sample table: item_mast
 CREATE TABLE item_mast1 (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);

INSERT INTO item_mast1 (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);

-- This query calculates the average 'pro_price' from the 'item_mast' table and assigns it the alias "Average Price".
SELECT AVG(pro_price) AS "Average Price"
-- Specifies the table from which to retrieve the data (in this case, 'item_mast').
FROM item_mast;

-- 22. From the following table, write a SQL query to count the number of products whose price are higher than or equal to 350. 
-- Return number of products.
-- This query counts the number of products in the 'item_mast' table where the 'pro_price' is greater than or equal to 350.
SELECT COUNT(*) AS "Number of Products"
-- Specifies the table from which to retrieve the data (in this case, 'item_mast').
FROM item_mast
-- Filters the rows to only include those where the 'pro_price' is greater than or equal to 350.
WHERE pro_price >= 350;

-- 23. From the following table, write a SQL query to compute the average price for unique companies. Return average price and
--  company id.
-- Sample table: item_mast
-- This query calculates the average 'pro_price' for each 'pro_com' (Company ID) in the 'item_mast' table.
SELECT AVG(pro_price) AS "Average Price",
       pro_com AS "Company ID"
-- Specifies the table from which to retrieve the data (in this case, 'item_mast').
FROM item_mast
-- Groups the result set by the 'pro_com' column.
GROUP BY pro_com;

-- 24. From the following table, write a SQL query to compute the sum of the allotment amount of all departments. Return sum 
-- of the allotment amount.
-- Sample table: emp_department
-- This query calculates the sum of 'dpt_allotment' from the 'emp_department' table.
SELECT SUM(dpt_allotment)
-- Specifies the table from which to retrieve the data (in this case, 'emp_department').
FROM emp_department;


-- 25. From the following table, write a SQL query to count the number of employees in each department. Return department
--  code and number of employees.
-- Sample table: emp_details
-- This query counts the number of employees in each department ('emp_dept') from the 'emp_details' table.
SELECT emp_dept, COUNT(*)
-- Specifies the table from which to retrieve the data (in this case, 'emp_details').
FROM emp_details
-- Groups the result set by the 'emp_dept' column.
GROUP BY emp_dept;
