1. Write a query to delete duplicate rows from a table.
-- Delete duplicate rows from a table
DELETE FROM table_name
WHERE rowid NOT IN (
  SELECT MIN(rowid)
  FROM table_name
  GROUP BY column1, column2, ...
);

2. Write a query to retrieve the names of employees who work in the same department as 'John'.
-- Retrieve names of employees in the same department as 'John'
SELECT name
FROM employees
WHERE department = (
  SELECT department
  FROM employees
  WHERE name = 'John'
);

3. Write a query to display the second highest salary from the Employee table.
-- Display the second highest salary from the employee table
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
  SELECT MAX(salary)
  FROM employees
);

4. Write a query to find all customers who have made more than Two orders.
-- Find all customers who have made more than two orders
SELECT customer_id, COUNT(order_id) AS num_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2;

5. Write a query to count the number of orders placed by each customer.
-- Count the number of orders placed by each customer
SELECT customer_id, COUNT(order_id) AS num_orders
FROM orders
GROUP BY customer_id;

6. Write a query to retrieve the list of employees who joined in the last 3 months.
-- Retrieve the list of employees who joined in the last 3 months
SELECT *
FROM employees
WHERE join_date >= DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH);

7. Write a query to find duplicate records in a table and count the number of duplicates for each unique record.
-- Find duplicate records in a table and count the number of duplicates for each unique record
SELECT column1, column2, ..., COUNT(*) AS num_duplicates
FROM table_name
GROUP BY column1, column2, ...
HAVING COUNT(*) > 1;

8. Write a query to list all products that have never been sold.
-- List all products that have never been sold
SELECT *
FROM products
WHERE product_id NOT IN (
  SELECT product_id
  FROM orders
);

9. Write a query to update the salary of employees based on their performance rating.
-- Update the salary of employees based on their performance rating
UPDATE employees
SET salary = CASE
  WHEN performance_rating = 'A' THEN salary * 1.1
  WHEN performance_rating = 'B' THEN salary * 1.05
  WHEN performance_rating = 'C' THEN salary * 1.01
  ELSE salary
END;

10. Write a query to find all employees who earn more than the average salary.
SELECT *
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
);

11. Write a query to retrieve the list of employees who joined in the last 3 months.
SELECT *
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
);

12. Write a query to identify the top 10 customers who have not placed an order in the last year.
SELECT *
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
);

13. Create a query to compute the year-over-year growth rate of revenue for each product category.
WITH current_year_revenue AS (
  SELECT product_category, SUM(revenue) AS current_year_revenue
  FROM sales
  WHERE sale_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
  GROUP BY product_category
),
previous_year_revenue AS (
  SELECT product_category, SUM(revenue) AS previous_year_revenue
  FROM sales
  WHERE sale_date >= DATE_SUB(CURRENT_DATE, INTERVAL 2 YEAR)
    AND sale_date < DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
  GROUP BY product_category
)
SELECT cy.product_category, 
       (cy.current_year_revenue - py.previous_year_revenue) / py.previous_year_revenue * 100 AS growth_rate
FROM current_year_revenue cy
JOIN previous_year_revenue py ON cy.product_category = py.product_category;

14. Write a query to join three tables and filter the results to show only records that exist in exactly two of the tables.
SELECT *
FROM table_a
JOIN table_b ON table_a.id = table_b.id
LEFT JOIN table_c ON table_a.id = table_c.id
WHERE table_c.id IS NULL

UNION ALL

SELECT *
FROM table_a
LEFT JOIN table_b ON table_a.id = table_b.id
JOIN table_c ON table_a.id = table_c.id
WHERE table_b.id IS NULL

UNION ALL

SELECT *
FROM table_b
JOIN table_c ON table_b.id = table_c.id
LEFT JOIN table_a ON table_b.id = table_a.id
WHERE table_a.id IS NULL;

15. Write a query to calculate the retention rate of customers over a given time period.
WITH active_customers AS (
  SELECT customer_id
  FROM orders
  WHERE order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
  GROUP BY customer_id
),
retained_customers AS (
  SELECT customer_id
  FROM orders
  WHERE order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 2 YEAR)
    AND order_date < DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
  GROUP BY customer_id
)
SELECT COUNT(DISTINCT rc.customer_id) / COUNT(DISTINCT ac.customer_id) * 100 AS retention_rate
FROM active_customers ac
JOIN retained_customers rc ON ac.customer_id = rc.customer_id;

16.get phone number as 123-456-7890
    1234567890 INPUT
    123-456-7890 OUTPUT
    select substr(number,1,3)||'-'||substr(number,3,6)||'-'||substr(number,6,4) from customer;


17.Update input table to get
ID GENDER
1 M
2 M
3 M
4 F
5 F
6 F
ANSUPDATE
INPUT_TABLE SET GENDER =
CASE
WHEN GENDER = ’M’ THEN ‘F’
WHEN GENDER = ’F’ THEM ‘M’
ELSE NULL
END;

18. How do you identify the duplicate records? write a query.
Select empno,count(empno) from emp group by empno
having count(empno) > 1;

