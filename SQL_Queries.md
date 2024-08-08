1. Write a query to delete duplicate rows from a table.
```-- Delete duplicate rows from a table
DELETE FROM table_name
WHERE rowid NOT IN (
  SELECT MIN(rowid)
  FROM table_name
  GROUP BY column1, column2, ...
);```

2. Write a query to retrieve the names of employees who work in the same department as 'John'.
```-- Retrieve names of employees in the same department as 'John'
SELECT name
FROM employees
WHERE department = (
  SELECT department
  FROM employees
  WHERE name = 'John'
);```

3. Write a query to display the second highest salary from the Employee table.
```-- Display the second highest salary from the employee table
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
  SELECT MAX(salary)
  FROM employees
);```

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
        UPDATE
        INPUT_TABLE SET GENDER =
        CASE
        WHEN GENDER = 'M' THEN 'F'
        WHEN GENDER = 'F' THEM 'M'
        ELSE NULL
        END;

18. How do you identify the duplicate records? write a query.
Select empno,count(empno) from emp group by empno having count(empno) > 1;

19."Write a SQL query to find the second highest salary from an Employee table."
Here's an example query that can be used to solve this problem':

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);

This query uses a subquery with the MAX function to find the second highest salary from an Employee table. It assumes that there are no ties for the highest salary. If there are ties, the query needs to be modified accordingly.

Q.How to identify duplicate records?
Use group by command
SELECT
country,
COUNT(*)
FROM
world_population
GROUP BY
country
HAVING
COUNT(*) > 1;

2. How do you identify the duplicate records? write a query.
SQL>
Select empno,count(empno) from emp group by empno
having count(empno) > 1;
3. Write a query for 2nd highest salary.
ANS: select * from emp a where 2=(select count(sal)
From emp b where b.sal>=a.sal);

9. Write a query using case Statement
SELECT OrderID, Quantity,
CASE
WHEN Quantity > 30 THEN 'The quantity is greater than
30'
WHEN Quantity = 30 THEN 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

5. Write syntax to create a view on two tables?
Create view <viewname>
As select * from emp e, dept d where e.deptno=d.deptno;

11. Self join query for find in the manager name for each
employee.
Ans.
Oracle Format
select e.ename,m.ename
from employee e, employee m
where e.empno = m.mgr;
Univer wesal Format
select e.ename,m.ename
from employee e inner join employee m
on e.empno = m.mgr;
Q.Convert the null values in a column to 'NA'.
Ans. Syntax
Select NVL(<Column Name>,<Value>) from <Table Name>;
select NVL (ename,'NA') from employee;


Q. How you remove the duplicate records from table.
ANS: delete from <tablename> a where rowid <>(select
max(rowid) from <tablename> b
where a.id=b.id);


17) Tell me the output of the following queries.
A) Select substr('Accenture',1,3) from dual;
Output- Acc
B) Select substr('Accenture',1) from dual;
Output- Accenture
C) Select substr('Accenture',1,3,4) from dual;
Output- Too many arguments for function

24) WAQ to remove the spaces from both left and right side.
SQL> Select trim (' prasad ') from dual;

25) WAQ.
Input string: Ug am
Output string: Ugam
SQL> select ('ug'||'am') from dual;
SQL>select replace('ug am',' ') from dual;

27) Consider in a table column, there is data in some rows,
blank spaces in some rows and null values in remaining
rows. Wherever there is null value or blank space, it should
be displayed as 'UNKNOWN' and remaining data should be
displayed as it is.
WAQ for this.
SQL> Select
replace(to_char(nvl(comm,0.1)),0.1,'UNKNOWN')from emp;

13) Display ID of the employee who is getting third highest
salary in the organization.
SQL>
select empno from
(select emp.*, dense_rank() over (order by sal desc) as
highest_sal from emp)
where highest_sal =&n;

23) Let us consider your mail id. The output should be only
gmail.com.
WAQ.
SQL>
select substr ('PrasadBhakalya@gmail.com',
Instr('PrasadBhakalya@gmail.com','@' )+1)
from dual;

24) Let us consider there is table where there is Gender
column having 'Male' and 'Female' as data in it.
WAQ to replace male as female and female as male.
SQL>
UPDATE INPUT_TABLE SET GENDER =
CASE
WHEN GENDER = 'M' THEN 'F'
WHEN GENDER = 'F' THEM 'M'
ELSE NULL
END;

4) Display second highest salary in each department.
ANSsql>
SELECT DEPTNO,MAX(SAL) FROM EMP WHERE SAL NOT IN
(SELECT MAX(SAL) FROM EMP GROUP BY deptno)
GROUP BY deptno
5) Display the department which gives maximum
aggregated salary.
SQL>
SELECT DEPTNO FROM
(SELECT DEPTNO,SUM(SAL)AS TOTAL FROM EMP
GROUP BY deptno ORDER BY TOTAL DESC)
WHERE ROWNUM=1;

17) Consider employee table with ID and Ename columns in
it. The pattern of Ename is like prefix_name for each
employee. I want you to perform Select query to display only
names without any prefixes.
Ans-
SQL> select substr(ename,instr(ename,'_')+1) from employee;

29) Suppose the string is 'PrasadBhakalya@gmail.com' then
how will remove @gmail.com?
SQL> select
substr ('PrasadBhakalya@gmail.com' ,1,
Instr('PrasadBhakalya@gmail.com','@' )-1)
from dual;

31) Suppose I have EMP table then how will you display 50%
records of the data?
SQL> select * from emp where rownum <=(select count(*)/2
from emp)

11) I want to find the duplicate records then which SQL
query do you use?

12) In EMP table I want to check salary column is having null
value, which query will you Write?
SQL> select * from emp where sal is null;

4.Write a query to get phone number as 123-456-7890
format.
SQL> select
substr(number,1,3)||'-'||substr(number,3,6)||'-'||substr(number,
6,4) from customer;

5. Write a query to get nth value by using sub query n
correlated query.?

7.write query on coalesce
8.write a query for self join

20. Input Table
ID GENDER
1 F
2 F
3 F
4 M
5 M
6 M
A)Display the Output
ID GENDER
1 F
4 M
2 F
5 M
3 F
6 M
SELECT * FROM
(SELECT INPUT.*,DENSE_RANK() OVER (PARTITION BY
GENDER ORDER BY ID) ORD FROM INPUT)
ORDER BY ORD,GENDER;
B) Update input table to get
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
WHEN GENDER = 'M' THEN 'F'
WHEN GENDER = 'F' THEM 'M'
ELSE NULL
END;

Remove Junk Data in
Aus@tr#al&ia —---> Australia
Select 3 from Dual Where 3 not in (1,2, Null);
What is the output?
Write a query to get name from email Id
Aishwarya12@gmail.com—-------> Aishwarya12

WAQ to get employeename, Avg age,their city.
WAQ to get employee where age is > 30.
EMP
Empno Name CityID
1 ABC 1
2 DEF 1
3 GHI 3
CITY
CityID CityName Age
1 BNG 30
2 MUMBAI 31
3 PUNE 20

WAQ to get desired output in target
Source Target
1 0
0 1
0 1
1 0
1 0
0 1
0 1

WAQ to get data of the last two previous months.
Aish#wa12ry@a —------> Aishwarya


Sid|Product_name|Sales_Quantity|Date
1|LG|30|Apr2020
2|Mobile|15|Mar2020
3|Laptop|20|Apr2020
4|Smartwatch|25|May2020
7|LG|20|Apr2020
2|Mobile|40|Mar2020
WAQ to get third highest Sales_Quantity from the
product table.
WAQ to replace 'LG' to 'LGY' in the target table.

CityId|CityName|Population
10|Bangalore|2,04,768
20|Mumbai|640000
30|Chennai|32,467
WAQ to get population of the city greater than that of
Banglore;
Select population from city where population >
(select population from city where cityName ='Bangalore')

6.How to fetch last record from table and write query.
SQL>
Select * from emp where rowid =
(select max(rowid) from emp);