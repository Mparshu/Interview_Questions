### Lead or Lag
In SQL, **LEAD** and **LAG** are window functions that allow you to access data from subsequent or preceding rows in the result set without the need for a self-join. 

- **LEAD**: This function returns the value of a specified column from a subsequent row in the result set. For example, `LEAD(salary, 1) OVER (ORDER BY hire_date)` retrieves the salary of the next employee based on the hire date.

- **LAG**: Conversely, this function returns the value of a specified column from a preceding row. For instance, `LAG(salary, 1) OVER (ORDER BY hire_date)` retrieves the salary of the previous employee.

### Star Schema vs. Snowflake Schema
Both star and snowflake schemas are used in data warehousing to organize data efficiently, but they differ in structure and complexity.

#### Star Schema
- **Structure**: Contains a central fact table connected to multiple dimension tables.
- **Normalization**: Dimension tables are denormalized, which can lead to redundancy.
- **Query Performance**: Generally faster for queries due to fewer joins.
- **Design Complexity**: Simpler to design and understand.
- **Storage**: May require more storage space due to redundancy.

#### Snowflake Schema
- **Structure**: Contains a central fact table connected to dimension tables, which may be further normalized into sub-dimension tables.
- **Normalization**: Dimension tables are normalized, reducing redundancy.
- **Query Performance**: May be slower for queries due to more complex joins.
- **Design Complexity**: More complex to design and maintain.
- **Storage**: More efficient in terms of storage space due to normalization.

### Fact vs. Dimension
- **Fact Table**: Contains quantitative data for analysis, such as sales amounts or transaction counts. It typically has foreign keys linking to dimension tables.
- **Dimension Table**: Contains descriptive attributes related to the facts, such as product details, customer information, or time periods.

### Differences Between Fact and Dimension
- **Content**: Fact tables store numerical data, while dimension tables store descriptive attributes.
- **Granularity**: Fact tables are often at a lower level of granularity, while dimension tables provide context to the facts.
- **Relationships**: Fact tables are linked to dimension tables through foreign keys, allowing for complex queries and analyses.

### WITH Clause
The **WITH** clause, also known as Common Table Expressions (CTEs), allows you to define temporary result sets that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement. This improves readability and organization of complex queries.

#### Example Usage
```sql
WITH SalesCTE AS (
    SELECT product_id, SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY product_id
)
SELECT p.product_name, s.total_sales
FROM products p
JOIN SalesCTE s ON p.product_id = s.product_id;
```
In this example, `SalesCTE` aggregates sales data, which is then joined with the `products` table to retrieve product names alongside their total sales. 

These concepts are fundamental in SQL for data analysis and structuring data efficiently in data warehouses.


1. *What is a Star Schema and how does it differ from a Snowflake Schema?*

A Star Schema is a data warehouse schema that consists of a central fact table surrounded by dimension tables. 
A Snowflake Schema is a more normalized version of a Star Schema, where each dimension table is further divided into multiple related tables.

2. *What is the difference between a Fact Table and a Dimension Table?*

A Fact Table stores measurable data, such as sales or revenue, 
whereas a Dimension Table stores descriptive data, such as date, time, or geography.

3. *What is Data Aggregation and how is it used in a Data Warehouse?*

Data Aggregation is the process of grouping and summarizing data to provide a higher level of detail. In a Data Warehouse, aggregation is used to improve query performance and provide faster access to data.

4. *What is Data Partitioning and why is it used in a Data Warehouse?*

Data Partitioning is the process of dividing large tables into smaller, more manageable pieces. It is used in a Data Warehouse to improve query performance, reduce data loading times, and make maintenance easier.

5. *What is the difference between a Type 1 and Type 2 Slowly Changing Dimension (SCD)?*

A Type 1 SCD overwrites old data with new data, while a Type 2 SCD creates a new record for each change, preserving historical data.


1. **Types of Joins:** Understand the differences and outputs of inner, outer, left, and right joins. Also, explore non-equi joins for handling more complex scenarios.

2. **Window Functions:** Be familiar with the various window functions like ROW_NUMBER(), RANK(), and DENSE_RANK(), and understand their distinct use cases based on different analytical needs.

3. **'WHERE' vs 'HAVING':** Distinguish between WHERE clauses for row filtering and HAVING clauses for filtering aggregated results.

4. **Query Execution Order:** Remember the correct sequence of SQL query execution: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY.

5. **Common Table Expressions (CTEs):** Learn how to use CTEs to simplify and clarify complex queries.

6. **Advanced Aggregation Functions:** Explore how to nest aggregate functions within window functions for detailed analytics.

7. **Frequently Asked Queries:** Practice solving common problems like finding the nth highest salary, calculating cumulative totals, using LEAD() and LAG() functions, and working with self-joins and other join types.

8. **Subqueries:** Master the use of nested queries for complex data manipulations and filtering.

9. **Indexing:** Understand the importance of indexing for optimizing query performance by improving data retrieval speeds.

10. **Handling NULL Values:** Develop techniques for accurately processing NULL values in SQL queries.

11. **Joins vs. Subqueries:** Know when to use joins and subqueries to design efficient queries, considering data relationships and performance.


1. What is SQL and what are its main features?

SQL (Structured Query Language) is a programming language designed for managing and manipulating data stored in relational database management systems (RDBMS). Its main features include:

Data definition: creating and modifying database structures
Data manipulation: inserting, updating, and deleting data
Data control: controlling access to data and managing user permissions
Data query: retrieving specific data from the database
2. Order of writing SQL query?

The typical order of writing an SQL query is:

SELECT: specify the columns to retrieve
FROM: specify the tables to retrieve data from
WHERE: specify conditions to filter data
GROUP BY: group data by one or more columns
HAVING: specify conditions to filter grouped data
ORDER BY: sort data in ascending or descending order
LIMIT: limit the number of rows to retrieve
3. Order of execution of SQL query?

The order of execution of an SQL query is:

FROM: retrieve data from specified tables
WHERE: filter data based on conditions
GROUP BY: group data by one or more columns
HAVING: filter grouped data based on conditions
SELECT: retrieve specified columns
ORDER BY: sort data in ascending or descending order
LIMIT: limit the number of rows to retrieve
4. What are some of the most common SQL commands?

Some common SQL commands include:

SELECT: retrieve data from a database
INSERT: insert new data into a database
UPDATE: modify existing data in a database
DELETE: delete data from a database
CREATE: create a new database or table
DROP: delete a database or table
ALTER: modify the structure of a database or table
5. What’s a primary key & foreign key?

Primary key: a unique identifier for each row in a table, used to ensure data integrity and prevent duplicate records.
Foreign key: a field in a table that references the primary key of another table, used to establish relationships between tables.
6. All types of joins and questions on their outputs?

There are several types of joins:

INNER JOIN: returns records that have matching values in both tables.
LEFT JOIN: returns all records from the left table and matching records from the right table.
RIGHT JOIN: returns all records from the right table and matching records from the left table.
FULL OUTER JOIN: returns all records from both tables, with null values in the columns where there are no matches.
7. Explain all window functions and difference between them?
011-40849270
Window functions perform calculations across a set of rows that are related to the current row. Common window functions include:

ROW_NUMBER(): assigns a unique number to each row within a partition.
RANK(): assigns a ranking to each row within a partition based on a specific column.
DENSE_RANK(): assigns a ranking to each row within a partition based on a specific column, without gaps.
NTILE(): divides a partition into a specified number of groups.
LAG(): returns the value of a column from a previous row within a partition.
LEAD(): returns the value of a column from a next row within a partition.
8. What is stored procedure?

A stored procedure is a set of SQL statements that are stored in a database and can be executed repeatedly. Stored procedures can take input parameters and return output parameters.

9. Difference between stored procedure & Functions in SQL?

The main differences between stored procedures and functions are:

Purpose: stored procedures are used to perform a set of operations, while functions are used to return a single value.
Return value: stored procedures can return multiple values, while functions return a single value.
Input parameters: stored procedures can take input parameters, while functions can take input parameters but also return a value.
10. What is trigger in SQL?

A trigger is a set of SQL statements that are automatically executed in response to a specific event, such as inserting, updating, or deleting data. Triggers can be used to enforce data integrity, perform calculations, or send notifications.

Here is some sample code to illustrate some of these concepts:

sql
Edit
Copy code
-- Create a table
CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

-- Insert data into the table
INSERT INTO customers (id, name, email) VALUES (1, 'John Doe', 'john.doe@example.com');

-- Create a stored procedure
CREATE PROCEDURE get_customer_by_id
  @id INT
AS
BEGIN
  SELECT

##Q. What are SCD’s ?
##Q. Difference between SCD1, SCD2, SCD3.
Ans-----
A Slowly Changing Dimension (SCD) is a dimension that
stores and manages both current and historical data over
time in a data warehouse.
The ‘Slowly Changing Dimension’ problem is a common one
particular to data warehousing. This applies to cases where
the attribute for a record varies over time.
There are three types of SCD (SCD1,SCD2,SCD3)
SCD1- Overwrite
SCD2 - Append
SCD3 - Update
SCD: Slowly changing dimensions explained with real ex…
##Q. What are Surrogate Keys ?
##Q. Difference between primary key and surrogate key.,"
Tech Coach Channel
Ans------
Types of Keys in Database |Primary Key |Candidate Key …
Primary Key Surrogate Key
1.Primary Key is used to
maintain unique records in
OLTP system
1.surrogate Key is used to
maintain
Unique records in DWH
system.
2. Primary Key values are
entered by the user.
2.Surrogate Key values are
generated by the system.
(By ETL Mechanism)
3.Primary Key values can be
alpha-numeric
(can be characters,numbers
or combination of both)
3.Surrogate key values
always numeric values.
(Surrogate Key values
cannot be characters)
4. Primary Key values are
belongs to business data or
table data.
4.Surrogate Key is not
belongs to business data or
table data.
The primary key is a unique key in your table that you
choose that best uniquely identifies a record in the table.
All tables should have a primary key, because if you ever
need to update or delete a record you need to know how to
uniquely identify it.
A surrogate key is an artificially generated key. They're
useful when your records essentially have no natural key
(such as a Person table, since it's possible for two people
born on the same date to have the same name, or records
in a log, since it's possible for two events to happen such
that they carry the same timestamp). Most often you'll see
these implemented as integers in an automatically
incrementing field, or as GUIDs that are generated
automatically for each record. ID numbers are almost
always surrogate keys.
Unlike primary keys, not all tables need surrogate keys,
however. If you have a table that lists the states in America,
you don't really need an ID number for them. You could use
the state abbreviation as a primary key code.
The main advantage of the surrogate key is that they're
easy to guarantee as unique. The main disadvantage is
that they don't have any meaning. There's no meaning that
"28" is Wisconsin, for example, but when you see 'WI' in the
State column of your Address table, you know what state
you're talking about without needing to look up which state
is which in your State table.
Q.What are Fact Tables?
Fact Tables and Types of fact tables
Ans- where summarized or aggregated data stored such
tables are called fact tables.
Ex- Orders.
Fact tables are at centre of star or snowflake schema
surrounded by dimension table.
##Q. What are dimension tables?
##Q. explain your current project architecture?
##Q. difference between delete, truncate and drop?
Delete vs Truncate vs Drop :Oracle Interview Questions …
##Q. What are the functions you have used?
ANS: character function
Aggregate function
Q difference between Rank and Dense_rank?
##Q. Write a sql query to check duplicates?
Use group by command.
Find and remove duplicate records in a table | delete d…
##Q. What is a lookup transformation?
Ans------ Dynamic Lookup
Dynamic Lookup Transformation in Informatica
Ans–
Lookup transformation is used to lookup data in flat files,
tables or views. Lookup transformation is used to get a
value from a lookup table based on the source table.
Q.Diff between UNION and UNION ALL
Union Union All
It combines the result sets
of the two or more queries
It combines the result sets
of the two or more queries
and removes duplicates
from result set.
but does not removes
duplicates from the result
set.
It has slower performance. It has faster performance.
It rearranges the output
result.
It does not rearrange the
output result.
Q.What are Joins? What is CROSS
Join?
Joins in Oracle (SQL) Explained in detail with practical …
##Q. How will you calculate 2nd Highest Salary?


To address your queries regarding ETL testing and SQL clauses, here’s a detailed response:

## 1. Test Approach for Missing Records in ETL

When only 900 out of 1000 records are loaded into the target, the testing approach should include:

- **Count Comparison**: First, compare the record counts between the source and target tables. Use a query like `SELECT COUNT(*) FROM source_table` and `SELECT COUNT(*) FROM target_table` to verify the total number of records[1].

- **Data Profiling**: Profile the data in the source to understand the expected values and types. After loading, validate that the data types and values in the target match the source[1].

- **Error Handling**: Implement checks for error and reject handling to capture records that contain invalid values. Use functions like `IS_DATE` or `IS_NUMBER` to validate data formats[1].

- **Detailed Comparison**: For a deeper analysis, perform a row-by-row comparison of key fields between the source and target. This may involve exporting data to a tool like Excel for detailed comparisons if the dataset is large[1].

## 2. SQL Clauses: Where, Group By, and Having

- **Where Clause**: This clause is used to filter records based on specific conditions. For example, `SELECT * FROM table WHERE column = 'value'` retrieves records that meet the condition.

- **Group By Clause**: This clause is used to group rows that have the same values in specified columns into summary rows. For example, `SELECT column, COUNT(*) FROM table GROUP BY column` counts the number of occurrences of each value in the specified column.

- **Having Clause**: This clause is used in conjunction with `GROUP BY` to filter groups based on a specified condition. For example, `SELECT column, COUNT(*) FROM table GROUP BY column HAVING COUNT(*) > 1` retrieves groups that have more than one record[1].

## 3. Testing Different Databases (MySQL to Oracle)

To test data transfer between different database systems like MySQL and Oracle, follow these steps:

- **Data Extraction**: Extract data from the MySQL source using appropriate queries.

- **Data Transformation**: Ensure that any necessary transformations are applied to match the target Oracle database schema.

- **Data Loading**: Load the transformed data into the Oracle database.

- **Validation**: Perform validation checks including:
  - Record count comparison between MySQL and Oracle.
  - Data type validation to ensure compatibility.
  - Data integrity checks to confirm that the data matches in both systems[1][5].

## 4. Writing a MINUS Query in Non-Oracle Systems

In systems other than Oracle, such as SQL Server or MySQL, you can achieve similar functionality to the `MINUS` operator by using the `EXCEPT` operator or a `LEFT JOIN`. For example:

```sql
SELECT * FROM source_table
EXCEPT
SELECT * FROM target_table;
```

Alternatively, using a `LEFT JOIN`:

```sql
SELECT s.*
FROM source_table s
LEFT JOIN target_table t ON s.id = t.id
WHERE t.id IS NULL;
```

This retrieves records present in the source but not in the target[1].

## 5. Regression Testing

Regression testing is a type of software testing that ensures that previously developed and tested software still performs after a change. This includes re-running functional and non-functional tests to confirm that the new code changes have not adversely affected existing features. It is crucial after updates, bug fixes, or enhancements to validate that the software continues to function as intended[1].


Company: 2) NESS rechno oeies,
I) Explain your Project architecture.
Here are the key differences between the SQL DELETE and TRUNCATE commands:

## Definition
- **DELETE** removes one or more rows from a table based on specified conditions[1][2][3][4][5].
- **TRUNCATE** removes all rows from a table without using any conditions[1][2][3][4][5].

## Language Type
- **DELETE** is a DML (Data Manipulation Language) command[1][2][3][4].
- **TRUNCATE** is a DDL (Data Definition Language) command[1][2][3][4].

## Conditions
- **DELETE** uses the WHERE clause to specify conditions for deleting rows[1][2][3][4][5]. 
- **TRUNCATE** does not allow using the WHERE clause[1][2][3][4][5].

## Speed
- **DELETE** is slower, especially for large tables, as it deletes rows one-by-one[1][3][4].
- **TRUNCATE** is faster as it removes all rows at once by deallocating data pages[1][2][3][4].

## Transaction Log
- **DELETE** logs each deleted row in the transaction log[1][2][3][4].
- **TRUNCATE** only logs the deallocation of data pages in the transaction log[1][2][3][4].

## Rollback
- **DELETE** allows rollback of deleted data using ROLLBACK before COMMIT[1][3][4].
- **TRUNCATE** cannot be rolled back after execution[1][2][3][4].

## Identity
- **DELETE** does not reset the identity column to its seed value[1][2][3].
- **TRUNCATE** resets the identity column to its seed value[1][2][3].

## Locking
- **DELETE** acquires locks on each deleted row[1][2][3].
- **TRUNCATE** acquires table and page locks to remove all rows[1][2][3].

In summary, **TRUNCATE** is faster and uses less transaction log space, but cannot be rolled back. **DELETE** is slower but allows selective deletion of rows and rollback of changes. The choice depends on the specific requirements of the task at hand.

##Q. Tell me about yourself.

4. Explain about your project.
5. Explain the data flow in your project.
6. What tables were present in your project? Explain.
7. How do you associate Joiner transformation in your
project?
8. How do you move a file in Unix?
9. How do you check for a particular text/line in Unix?
10. Grep command
1##Q. Create directory
12. How do you find a file from the folder?
Company: 71 ITC infoTech
##Q. Explain about your project.
2. How many fact and dimension tables are there in your
project. Write the table names.
DWH Interview Question :Number of fact and Dimensio…
3. I low many columns are there in your fact table. Apart
from the columns corning from your dimension table, what
other columns are there.
4. What is your source table from where dimension is
getting the data
ANS: flat file,oracle db,terrdata db
5. Write duplicate query.
6. How to search a string in your file using unix.
7. How to get 4th record in the file using unix.
8. What is touch command? •
9. What is the difference between database and DWH
testing?
10. Does your table get data from DB or flat file? How do you
compare then.
11. What are the performance issues that you face while
testing.
12. How many records are there in your table?
Ans : 10 million
13. What you observed while testing the database and DWH.
14. Unix scripting.
Company: Datamatrix: (Client Honeywell Interview )
First round:
I. Tell me about yourself
2. Which tool you use
3. Reason for change
4. Difference between test plan and test lab
5. Difference between test case and test strategy
Company: 4)1MS Health First Round
##Q. Tell me about ur self?
2. What are ur responsibilities?
3. What is Tresability Matrix?
4. Rate ur self in data warehousing, SQL, unix?
5. What are Joins? And why we use therm,/
6. Types of joins?..,"
7. ExPlain all types of joins using venn diagrams.
Joins in Oracle (SQL) Explained in detail with practical …
8. How to find the current date in SQL?
Sysdate function
Select sysdate from dual;

10. Difference between delete and Truncate, drop and
truncate-----
11. What is V-model (he asked rne to draw v-model diag)
12. What are the data modelling techniques u use in your
project.
Conceptual
Logical
Physical
13. What is star and snowflake schema
Star and Snowflake schema explained with real scenari…
14. Any idea about hybrid schema
Ans- No, Hybrid schemas are very rarely used thats why I dont have any hands on experience on hybrid schema.
15. What is a mapping?
Ans- Mapping is data flow from source system to target
system.
Kind of like a set of instructions
16. What is ETL?
Ans- It is mechanism to extract data from source, transform
into desired format
And load into target.
17. How does u validate the targeted data?
18. What is a fact, types of facts
Second Round
1. Tell see about ur self and ur project?
2. Rate ur self in SQL?
3. What is sequence Generator? Write syntax
4. What are views?
View is table which is derived from existing table in DB

6. Write syntax to extract data from two tables of different
schemas
Ans—- In oracle schema means user
7. What is an index and its syntax /-
8. Types of indices
2021/10/28 15,17
6. What is V model and agile model
7. What is Join 7--
8. What is your approach of testing (what r the ETL test
steps)
9. How do you test transformations?
10. What is severity and priority (explain with examples) ,-
Second round:
##Q. He gave me one report format and asked me how do you
test.
2. Join query
3. Minus query
4. Tablel: empid, empname, salry, dept Table2: empid salary
5. How do u write the minus query to find missing records in
the above table.
6. Group by and having clause concept
7. DB link concept
8. If there is one DB file and one fiat file both contain same
data if u load the data into data warehouse how do u test?
9. Rownum and rowid concept
10. Department wise second max salary

##Q. Records are updates in source table, Write SQL to
compare both using source table and target table?
##Q. How can we compare the source file with the target
table?
##Q. What is data warehouse?
Q.Count the number of lines in a file in UNIX.
ANS: USE WC -L<FILENAME>.
##Q. Compare command in unix, how you compare the files
and what will be the output.

##Q. How you design the test cases to test the ETL jobs.
ANS:by referring STM and BRD docs.
##Q. Difference between Union and Union All.
##Q. Difference between Delete, truncate, Drop.
##Q. Difference between view and materialized view.
Ans-
View Materialized View
Data will store logically Data will store physically
It occupies less memory It occupies more memory.
It reduces performance at
time of reports.
It increases performance at
time of reports.
With user interaction it can
refresh at the time of
calling.
It can refresh without user
interaction based on time
interval.
Possibility of duplicate rows
in the view.
We can avoid duplicate rows
by assigning PK at the time
of creation.
Capgemini Interview 29-05-2021
##Q. What are the 3 layers in ETL?
##Q. What is BI(Business Intelligence)?
##Q. What are ETL tools which you worked with?
##Q. What is the difference between DWH and Data Mining?
##Q. What is OLTP and OLAP?
##Q. What is Data Mart and give me example.
Ans-
Data mart is one which is used to store subject oriented
data.
Example: HR data
##Q. What is difference between ETL and Database Testing?
DATABASE TESTING DWH TESTING
Smaller in scale Larger in scale
Usually used to test data at
the source instead of
testing using GUI.
2) Include several facts, ETL
mech.
Being major one.
Usually homogeneous 3) heterogeneous data
Normalized data 4) de-normalized data
CRUD operation 5) Read only operation
##Q. What are the characteristics of DWH?
ANS> 1. SUBJECT ORIENTED,
2. NON-VOLATILE,
3. TIME - VARIENT,
4. INTEGRATED
##Q. What are types of DWH systems?
ANS >
##Q. What are the possibilities of ETL bugs?
ANS >
      *Duplicate data
      *Null data
      *Data discrepancy
      *Table Structure issues
      *Index unable to drop issue
      *Data issue in source table
      *Index is not created after job run
      *Data count mismatch between source and target
      *Data not matching between source and target
      *Duplicate data loaded issue
      *Trim and null issue
      *Data precision issue
      *Date Format issue
      *Business Transformation rules issue
      *Performance issue.
##Q. What is ODS?
      ODS database (Operation data Store ), Its properties a…
      ODS: ODS is also a similar small DWH which will help
      analyst to analysis the business. It will have data for less
      number of days. Generally it will be around 30-45 days. Like
      DWH here also surrogate keys will be generated, error and
      reject handling will be done.
      Operational Data store is used by many organizations for
      analysis purpose as well as for data backup and data
      recovery. Data stored in ODS is usually in Normalized form
      as in transactional DBs.
      While in DWH data will be denormalized. ODS is actually a
      replica of Transactional Database, collecting two or more
      Business functions data. Ex ODS may store CRM as well as
      ERP data.
##Q. What is partitioning?
##Q. What is ETL mapping?
ANS> It represents data flow from source to target.
##Q. What is a mapplet?
ANS> Maplets creates or configures a set of transformation
which is reusable.
##Q. What is Data Purging?
ANS> permanently deleting data which is not relevant for
business purpose from DWH.
##Q. What is Normalization and denormalization?
What is Normalization in SQL? | Database Normalizatio…
ANS>
Normalization : - it is a technique of db design which is
used to reduce the redundant data or to avoid duplicate
data.
De- Normalization : - it is a technique of db design which
is used to add the duplicate data.
##Q. What is Index and its types?
Index Types
ANS>
Index is a pointer which is used to point the data.
TYPES : B-TREE, BITMAP indexing
##Q. What trigger?
##Q. What are the constraints?
ANS: It is used to limit the type of data that can go into the
table.
Specified while creating the table or after table is created
with alter command.
NOT NULL
UNIQUE
PRIMARY KEY
CHECK
FOREIGN KEY/REFERENCE KEY
##Q. What is Data Integrity?
##Q. What are the advantages of stored procedures?


1) Tell me about yourself .
2) Roles and responsibilities.
3) Tell me about your project.
4) What is your role in your project?
5) Explain the complete data flow of your project.
6) You have source and target. And you have test case to
check if expected data is loaded correctly or not. Then will
you validate?
Ans- Yes, Why not.
7) I have 10 tables in oracle database. The data is loaded
into sequel database. How will you validate if data has
migrated successfully?
Ans-
First I will check if Db link is established or not.
If established then I can compare data with column
mapping
If not established then I have to export both source and
target to flat files and then I have to compare them.
8) How will you check if any record is missing in target
table?
Ans-MINUS Query
Or Column Mapping Validations
9) Can you tell me the duplicate queries.
Ans-
Select empno,count(empno) from emp group by empno
having count(empno)>1;
10) What is join? What are the different types of joins?
11) What is self join?
12) What are different SQL functions you have used in your
project?
13) How to get the 3rd highest salary?
select * from
(select emp.*, dense_rank() over (order by sal desc) as
highest_sal from emp)
where highest_sal =&n;
14) What are set operators?
ANS> UNION
UNION ALL
INTERSECT
MINUS
15) Tell me the difference between union and union all?
16) Which tool are you using for defect management?
17) What is priority and severity?
18) What is data masking?
ACCENTURE R1
1) Which methodology is used in your project?
2) What is sprint?
3) What is sprint review and sprint retrospective meeting in
agile?
4) What is sprint backlog?
5) What is story point?
6) What is estimated time for one story point?
7) Who will assign the story points?
8) What are joins in SQL?
9) Tell me the difference between inner join and self join.
10) What is star scheme?
11) From where the data is coming into fact table?
12) Tell me some column names in fact table in your project.
13) How will you relate the fact to the dimension table?
14) Can you tell me the defect that you have raised recently?
15) How will you define severity and priority?
16) If you find a defect and assign it to development team
and dev team says it’s not a defect. Then what is your
response?

18) Consider a table having salary as one of the column.
Wherever salary is null that should be displayed as NOT
APPLICABLE. Write a query for the same.
19) Where, order by, having, select, group by, distinct. Write
these clauses in correct order.
Select > Distinct>from>where>group by>having>order by.
21) Which tool are you using for test management?
22) Which ETL tool are you using?
23) What is job scheduling? Which tool are you using for it?
Ans- Tidal
25) What is regression testing?
26) What is retesting?


ACCENTURE L2
1) Tell me about yourself.
2) What is star schema?
3) What is fact table and dimension table?
4) What is snowflake schema?
5) Tell me the difference between star schema and
snowflake schema.
6) What is the difference between normalization and
denormalization?
7) What is SCD? Explain the types of SCD.
8) Can you tell me the difference between the database and
data warehouse?
9) Tell me about your project.
10) What is your role in your project? What are all activities
you do as tester?
11) How many tables you are testing in your project?
12) Tell me the source table names that you have tested.
13) What are the validations you perform to test the data in
target system?
14) Tell me the duplicate query.
15) What are transformations you have used in your project?
UGAM SOLUTIONS R1
1) Tell me about your project.
2) What are the different sources in your project? In which
format the data is coming?
3) Can you tell me the complete data flow of your project?
4) What are the validations you perform from source to
target?
5) Which query will you write to validate data completeness
test?
6) Tell me the the query to find the duplicates.
7) Which query will you write to check if any duplicates
present in target table?
8) What are the test cases you are validating when data is
coming from flat files?
9) How will you compare the data if data is coming from flat
files?
10) What are the documents you refer in your project?
11) What is BRD and FSD document?
12) What are the contents of mapping document?
13) Who provides you mapping document?
Ans - Developer
14) If you have any doubt regarding requirements, then to
whom will you contact?
15) What is star schema and snowflake schema?
16) Which schema you are following in your project?
17) Which methodology you are using in your project?
Ans- Agile Methodology
18) What are the meetings you are involved in?
Ans- Scrum Call Meeting (Stand up Call) (Daily 20 minutes)
Sprint Retrospective
Sprint Planning Meeting
19) What are your daily activities as tester?
20) Tell me the difference between primary, surrogate key
and natural key.
21) Can you explain the difference between delete, drop and
truncate?
22) What are the analytical functions you have used?
23) If I have some void spaces in column and I have to
remove those spaces from left side. Then which function will
you use?
Ltrim() function


26) Which function do you use to get the position of
character? Give an example.
Ans— Instr

28) What are the different types of join


1) As an ETL tester, what do you think is an most challenging
aspect when you start testing?
2) What do you prefer to use, joins or subqueries? Why?
3) What is the basic difference between inner join and outer
joins? When will you use which join?
ANS: joins
4) Can you tell me briefly about your QA team in the
project?
5) How will you coordinate with client?
6) Who assign you the work? And To whom do you update
the work status?
7) If you have any question on the task assigned to you, to
whom will you contact?
8) If you are working on a ticket and you have a question.
Then what will you do?
9) What is the work of BA ?
10) How your business team is structured? Where does the
BA fit and where does the product owner fit in?
11) Let’s say you are working on a ticket and you identify a
defect? When you talk to the developer, developer says that
it’s an expected scenario. What will you do next?

14) What is dense_ rank?
15) What kind of technologies have you used?
16) What is the use of aggregator transformation?
17) How to update the records in the target?
18) What is the difference between Source qualifier
transformation and Joiner transformation?
19) How the flags are changing when records are updated in
source table?
20) Can you explain the SCD type 2 map you have built?
L&T R1
1) What is referential integrity?
2) What is foreign key?
3) How will you validate the source data loaded properly in
target or not if both source & target are tables?
4) How will you validate there is no duplicates in target
table?
5) Do you have any idea of composite key?
6) How will you validate if the composite key is implemented
correctly or not?
7) What is left join?
8) Can you tell me one scenario where left join can be used?
9) What do you know about inner join?
11) What is surrogate key?
12) Do you have any idea about slowly changing dimension?
13) Let us consider there is a target table which is SCD type
2. How will you validate the
table?
14) Do you have any idea about view?
15) What commands you are aware of in Unix?
16) What is the use of grep command?
17) I want to rename a file. Then which command will you
use?
Ans- mv <old filename><new filename>
18) Do you know joins?
Ans- Yes.
19) What is the difference between Union and Join?
Union Joins
Column Count should be
same
1.Column Count may or may
not be same
2.Data type should be same Column Data type May or
may not be same
But condition column
data type should be
same
Column order should be
same
3. Column Order may or may
not be the same
20) What is differed defect?
21) How will you decide the severity of defect?
22) What was the last defect you found?
Ans- Duplicate Records Found


L&T R2
1) Describe your project.
2) What is the data flow of your project?
3) What are the validations you do in your project?

SLK
1) Tell me about your project.
2) Can you tell me the end to end details of your project and
different databases used?
3) What kind of scheme have you used in the data
warehouse?
Ans- STAR SCHEMA
4) Why do you prefer star schema? Why not snowflake or
other schema?
Ans-
Because of denormalized data it is easy to implement.
According to clients requirement DWH needs high
performance
It cannot be achieved by any schema other than star
schema due to joins
Thats why Star schema is preferred.
5) What is metadata in DWH?
6) What is an ODS?
ODS: ODS is also a similar small DWH which will help
analyst to analysis the business. It will have data for less
number of days. Generally it will be around 30-45 days. Like
DWH here also surrogate keys will be generated, error and
reject handling will be done.
Operational Data store is used by many organizations for
analysis purpose as well as for data backup and data
recovery. Data stored in ODS is usually in Normalized form
as in transactional DBs.
While in DWH data will be denormalized. ODS is actually a
replica of Transactional Database, collecting two or more
Business functions data. Ex ODS may store CRM as well as
ERP data.
7) What is the difference between OLTP and OLAP
databases?
8) What is SCD? Explain me SCD type 1, type 2 & type 3. 9)
What are the aggregate functions in SQL?
10) What are the constraints in SQL?
11) What is the difference between self join and inner join?
12) What is data integrity?
13) What is E-R diagram?
14) What is view?
15) What is difference between Delete and Truncate
statements?
16) Can you explain the defect life cycle?

18) In oracle database if you want to compare two tables,
which keyword do you use?
19) If source table is having 4 columns and target table is
having 6 columns, can you perform Minus query to
compare?
Ans- No, We cannot perform Minus query.
For Minus query to work Column order, Column data type
and column count should be match.
20) What is the error when column count is not same in
Minus query?
Ans- ORA-01789: query block has incorrect number of result
columns
Data Mismatch,
Column Mapping failed
FIRST ROUND
1) Tell me about yourself, Roles and Responsibilities & about
your Project.
2) Which Methodology you are using in your project?
3) Can you Explain briefly about Agile Methodology?
4) Which Tool you are using for Sprint Board Planning?
5) How you are attending the scrum call, from where you
pick the stories, if you got stucked somewhere how will you
give your status overall? which Tool you are using for this?
6) Suppose if you are getting a Defect in particular story
then how will you comment, to whom you are assigning and
How you are sending that Defect?
7) What data integration Tool you are using (which ETL tool
you are using?)
8) Can you explain me the concept of ETL?
9) Data is coming from multiple sources how will you verify
OR identify that all data is loaded into target table means
suppose I have 1000 records then how will you verify 1000
records loaded into target table n if 10 records are missing
how you are going to validate?
10) Where you can see the log file?
11) Can you tell me why we need the staging layer in ETL
process?
12) Suppose my source is flat file how you are going to
validate those flat files?
13) What is the difference between OLTP & OLAP?
14) What is Dimension table?
15) How it is different from the Fact table?
16) What is Datamart? Give Example.
17) What type of ETL Validations you are doing?
18) Recent bug that you have encountered?
19) What are SCD Type-1, Type-2, Type-3?
20) Any function you are using for validating the SCD
Type-2?
21) What is a Maplet?
Ans-
Mapplet- A Mapplet creates or configures a set of
transformations which is reusable.
22) What is worklet?
23) What is workflow?
Ans- Workflow- A workflow is set of instructions that tells the
Informatica server how to execute the task.
24) What is a session?
Ans-
Session- A session is a set of instructions that describe how
and when to move (scheduling to run the jobs) data from
source to target.
25) What is the difference between junk dimension and
conformed dimension?
26) Customer dimension is a junk dimension or conformed
dimension?
Ans- Conformed Dimension
27) Tell me the difference between Joins & Subquery?
28) Can you find out the first 3 characters of your name?
SQL> Select substr (‘Prasad’,1,3) from dual;

30) Do you have experience on MDM?

SECOND ROUND
1) Introduce yourself
2) Do you have any idea on writing Test Scenarios, Test
cases?
3) Which tool you are using for writing Test cases, Test
strategy?
Ans- Quality Center From Mercury Softwares
4) Can you take a particular scenario and Explain me and
tell me your Approach on that?
5) Your project is running on which methodology?
Ans- Agile Methodology.
6) What is the duration of your SPRINT?
Ans- 2 Weeks.
7) Assume that you have given a story to test then what is
the basis for writing your test cases?
8) During your testing if you encountered a DEFECT, What
will you do?
Ans- Raise the defect in defect management tool like HP
ALM or Jira
9) Explain Defect life cycle?
Ans-
10) What are various types of the TESTING usually you do in
a software projects?
11) Who will do the UNIT Testing?
Ans- Unit and Integration Testing is done by Developer.
12) What is Integration Testing? Who will be responsible for
that?
Ans- Unit and Integration Testing is done by Developer.
13) What is Regression Testing?
14) Have you ever done Performance Testing?
15) Who will be responsible for UAT(User Acceptance
Testing?
16) Suppose you have completed one story without getting
any Defect how is tested code move in Production
Environment?
17) Have you ever developed any report status while testing?
18) What kind of scenarios you have used to test in the
Database?
19) In your project what is the source for your application
and what is the destination?
20) What are the challenges you have faced while testing
the data?
21) I want to hear any one specific example where u said
that ok I was putted into this challenge, I gained this much
knowledge because of that it made me more professional in
terms of testing.
22) In your __years of experience have ever felt that I m
doing repetitive work?
23) Have you ever thought that in your project we can bring
some automation tools?
24) What do you think is your biggest strength?
Ans- Ability To learn new things.
25) What is your weakness?
Ans- I dont have much patience.. I have to work on that.
26) Have you ever heard about data lakes?
Ans-
WIPRO
1) Tell me about yourself.
2) Which version of INFORMATICA tool are you using?
Ans- 9.0 Version
3) Could you tell me what is your source and target system?
(which database and in which format)
Ans- Flat Files as Source to
Oracle Database as Target
4) Which tool you are using in order to connect to
database?
Ans- Oracle SQL developer, TOAD for Oracle
(Any one of them)
5) Which Methodology you are using in your project?
Ans- Agile Methodology
6) While Assigning the stories, Resolving the stories or
updating the stories which tool you are using?
7) Can you tell me the difference between BUG & DEFECT?
Ans- As per my understanding both are same.
8) Can you explain BUG / DEFECT life cycle.
Ans-
9) What is the difference between RETEST & REGRESSION
TESTING.
10) Can you tell me the difference between TEST SCENARIO
& TEST CASES with
example.

13) Can you tell me the difference between STAR SCHEMA &
SNOWFLAKE SCHEMA.
14) Suppose I have two tables EMP & DEPT table both are
having relationship of foreign key with department ID. Can
you let me know which table is called as FACT table and
which table is called as DIMENSION table.
15) In order to search a particular string which command is
used? (Unix)
Ans- GREP <string><filename>
16) If I want to find duplicate records in particular file which
command is used?
Ans-
17) In Informatica, How and where do you run the work flow?
Ans- In Workflow Manager and Workflow Monitor we can
run work flow
In Workflow Manager Window
Right Click on Workflow tab then Click on Run Workflow
Right Click on Workflow Designer Window Then Click on Run
Workflow
In Workflow Monitor
If Workflow is Running or Failed
Then we can restart the workflow from here only
18) If the session get failed where will you check?
Click on Session then Get Run Properties
Or you can check in Session Log also
19) If the error was due to database connection failure.
Where will you check the connection details?
20) Have you ever worked with a parameter file?
21) Suppose Developer has given the connection details to
you in PARAMETER file to test with 3 different locations
America, Europe & Asia on only one work flow & the
connection have been parameterized, so if you want to
execute for 3 different locations but default is America. I
want to run Europe or Asia then how will you execute?
Answer: It will be executed through command, By using pm
and cmd line commands where we can change the
parameter and we can run the workflow.
22) Why the views are created on tables?
23) Suppose I am going to execute a view so will it go to its
base table or give the result?
24) Why INDEXES are created?
25) Suppose I am loading data into a table and that table
contains index then what will happen OR which steps I need
to take care before loading?
ANS: In order to load the data you need to drop the INDEX
n then after loading the data you need to create the index.
26) What is INITIAL & DELTA LOADING.
Initial Load
First time loading source data into data warehouse called
initial load.
Initial load will completely truncate existing data from all
the target tables and reload with fresh data.
Delta Load/ Incremental Load
Second time aur modified source data loading to data
warehouse is called incremental load.
Incremental load apply on going changes to one or more
tables based on predefined changes.
Once a data is updated in source then corresponding
target table showing updated data needs to be tested.
In the case of SCD is data behaving as expected needs to
be tested.
27) What are the steps need to be taken while DELTA load?
Citius Tech
1) Smoke testing and sanity testing difference
2) defect life cycle diagram and explain
3) verification and validation difference
4) quality center each Tab explain and how u implement in
ur project
5) regression testing in Ur project
6)what is retesting
7) explain Unix commands used in ur project
8) grep command use and syntax
9) star schema and snow flake schema diagram and
explaination
10) data mart and data warehouse difference
11) ur project architecture and explaination
12) what are the bugs u found in ur project
13) project validations
14) difference between agile and waterfall
15) joins and sub queries related questions and need to
write queries
16) decode, substring,instring, rank, dense rank, set
operators, constraint related queries We need to write (they
given simple tables)
17) what are the transformation u used in ur project and
how u use
18) work flow manager, work flow moniter, mapping,maplet
19) incremental load explain and how u use this in ur project
20) what is normalization and types of normalization
ANSThere
are three types of Normalization
1NF,
2NF,
3 NF
21) how you compare data from different database?
HCL first round
1. Tell me about yourself.?
2.project architecture.
3.diff b/w oltp n olap
3.when we use rank, dense rank n rownum

5. Write a query to get nth value by using sub query n
correlated query.?
6.what is primary and composite key.?
7.write query on coalesce
8.write a query for self join
9 different types of loads.
10.What is fact table , different types of fact tables.?
11.Difference b/w star n snowflake.?
12.In which of schema's we normalized n denormalized
data.?
13.Tel me test scenarios,cases you wrote in ur project.?
14.Which etl tool ur using.?
15.What is workflow, mapping, session n mapplets.?
Ans-
Workflow- A workflow is set of instructions that tells the
Informatica server how to execute the task.
Mapping- Mapping represents dataflow from sources to
targets.
Session- A session is a set of instructions that describe how
and when to move (scheduling to run the jobs) data from
source to target.
Mapplet- A Mapplet creates or configures a set of
transformations which is reusable.
INFY INTERVIEW QUESTIONS
1st round
1. About project & arch
2. About SQL queries
3. Defects - DLC, My defects seen
4. How I work
5. Work types
6. Roles & responsibilites
7. Experience in SQL
8. Experience in Stored procedures
9. ETL & basic info,
10. ETL jobs questions
11. About Informatica & all stages
etc.
2nd round
1. All practical questions
2. Gave user story & asked me my approach
3. Made changes in the user story & now how will I work
4. What is test data - all I did in my project
5. Gave stored procedure & then asked questions on
that - USER story on this as well - made changes in this
as well & asked me to answer
6. About AGILE & how I take part
7. What is my role in the Agile
8. Most of the questions on the practical scenario &
dynamic questions
KPMG interview qsns
1 tell me about yourself
2 project architecture
3 joins types with example
4 duplicate query
5 star schema v/s snowflakes
6 if we use snow flake schema in our project what all the
problem we face in production
7 what is the featured and forward in ur project
8 what are the vessels present in ur project
9 what is BRD in details
10 what type of defects u found during testing.
Forwarded as received
interview questions..
1. Tell me about yourself..
2. Brief about your project architecture.
3. Unix Commands.
4. SQL Joins ( types, explain with real-time examples)
5. Nth highest salary
6. Group by function
7. What is difference between where clause and having
clause.
8. Types of schema, explain star schema.
9. Which type of scd u have in your project.
10. Explain scd and it's types.
11. Tell the validations for incremental loading.
12. Tell the query to retrieve newly added data from scd2
target table.
13. What are the technical attribute you have in scd2 target
table.
14. T1 table have 200 records.
100 records copied to T2 table.
Remaining 100 records copied to T2 table
Write query to check data copied correctly..
Today I have attended interview in UST global
Saturday
1st round
Tel me about urself and project details and tools
Today
2nd
Qsns asked in UST global
1 tel me about yourself
2 duplicate query
3 join query for four table with four diff clm
4 diff PK vs SK
5 Fact table
6 dimension table
7 look up transformation
8 hp alm defect life cycle
9 record count query
10 instring and substring qsns
11 joins query
HCL first round
1. Tell me about yourself.?
2.project architecture.
3.diff b/w oltp n olap
3.when we use rank, dense rank n rownum

6.what is the primary and composite key.?

9 different types of loads.
10.What is a fact table , different types of fact tables.?
11.Difference b/w star and snowflake.?
12.In which of schema's we normalized n denormalized
data.?
13.Tel me test scenarios,cases you wrote in your project.?
14.Which etl tool ur using.?
15.What is workflow, mapping, session n mapplets.?
Ans-

Q.Name few ETL bugs that you found?
Ans-
Table Structure Issue
Index unable to drop issue
Index is not created after job run
Data issue in source table
Data Count mismatch between source and target
Data not matching between source and target
Duplicate data loaded issue
Trim and Null issue
Data precision issues
Data format issue
Business transformation rules issue
Performance issue.


Tech Mahindra:
30/08/2021
1. What is your skill area,what is the core area having
presently let us know?
2. How many years of Experience in ETL Now?
3. As Part of ETL Testing what all activities you have done?
how you go with your ETL procedures?
4. What and all testing you done in ETL? null check? How
Good you are at SQL?
5. How do you identify duplicates in a column?
6. In the source table particular column having a PK and In
destination it is mapped to particular table column is not a
PK how do u identify, what all the things you verify?
7. As part of the Schema validation what and all you do?
8. As part of Completeness testing what and all you do?
9. As part of mapping documents is concerned what and all
activities you do?What is RTM?
10. Have you been invloved in migration kind of a project?
11, Presently whatever the data and target you are
working?like Source & Target DB?
12. Are u aware of something related to Terra data?
13. How big is your team? How many memebers in your
team?
14. What is the volume of data that you usually verify? In
that case how do you mange data consistancy?
15. Where are presently based out of?you are basically
from?
16. Is that for any of these when you do once
transformation and all is done in millions of data, is that
you performance testing done by you? or any other guy?
17. What exactly you mean by partioning?
18. Coming to the requirement gathering and all those
things right what are the process usually followed?
19. For example in one of column in the table is null, if you
pass it as 'Blank' value what will happen?


Iqvia Interview Questions
Round 1
Tell me about yourself.
About Project
Duplicate query
Delete Duplicate Record
Dense Rankl

Q. Unix Command to move a file from one source to another source.

Get the employee and their manager name from emp table.

How many log files are there in Informatica?

Validation that you performed.

WAQ to get the following output.
Source Target
20210608 —--> 2021–06-08

Active and Passive Tranformation.

ROUND 2
Tell me about yourself.
Project

Complex Query you worked on recently.
What Transformations have you used in your project?
Unix command to find 5th line in a file
Toad/head command to find 5th line in a file
Command to search a string in a file.
Command to get 5th column from a table.

Case Statement Query

15.
16.
SQL>
select a.id,b.indicator
from a left join b
on a.id=b.id;
17.
Tell me about yourself.

Types of DCL and TCL commands
Ans— DCL (Data Control Language) —--> Commit,
Rollback,savepoint
TCL(Transaction Control Language) —----> Grant,
Revoke
Asked about rollback syntax, savepoint
What is syntax for rollback for savepoint.
Ans- Save point command
By using this statement you can and undo parts of
transaction, instead of the whole transaction.
When you execute the savepoint statement you create
a mark in the transaction Which can be used later to
undo changes that were done after that point.
Everytime you execute the save point statement you
have to provide a name for the savepoint you created.
Syntax
Rollback to savepoint c;
What is mean by Normalization and types, Why it is
required?
What are types of Shell Scripts. Which Shell Script using for
current project.
Tell about Agile Method.
Explain about Joins, types
Difference between equi join, inner join, self join, left join
and left outer join
Team size of your current project.
About waterfall model and V-model.
What are the validations u r doing between source nd
landing area, landing area nd staging, staging area and
dwh
Offline Questions
L & T
1.Tell me about Yourdelf & Roles and responsibilities.
2.What do you mean a views and write a query to
create view.
Ans-
SOL> create view view_example as
Select * from emp;
3Query to create table
4. Query to create a copy of table.
5.Diff between minus and intersect with example.

7. What is ‘First’ function.
8.Diff between normalization and denormalization.
9.Types of normalization.
10.Diff between SQL and Mysql
11. Types of relations in SQL.
12.SDLC and STLC and its process
13.In which defect tool you have experience?
14.What are the activities you will do in ALM?
15.Do you have experience in Jira tool?
16. have you prepared scenarios?
17. Do you know about ISTP?
18. What is Alias in SQL?
19.In which domain you worked?
20 what is Policy Life Cycle?
21.Types of Insurances
1. Defect Life Cycle.
2. How do you compare flat file and database data?
3. How will you compare flat file with target table in
database if flat file data has loaded into target by
applying some business logic?
4. Diff between delete and truncate?
5. Have you prepared test plan? Ans-No
6. Have you prepared test strategy document?
Ans- No
7. Different Unix Commands?
Anscd(
change directory),pwd(print working directory), diff,
mv, grep, cat, wc(word count), touch
vi editor commands
8. Project Architecture?
9. What are test strategies you followed for
validation of data. For
incremental, initial For SCD2,SCD1
10. Why you choose snowflake over star schema? Tell
Differnece
11. What are day-to_day activities of your work?
12. Difficult scenario you have written and write the
query?
13. What are negative approach you have done in
validation?
14. Why you use QC when you are using agile
methodology?
15. What are difficulties you faced in your project?
16. Components of Informatica PowerCenter.
Ans- Repository Manager, Workflow Manager, Designer
Window, Mapping Manager
