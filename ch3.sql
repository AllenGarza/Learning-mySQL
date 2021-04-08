DESC customer;

SELECT *
FROM department;

SELECT dept_id
FROM department;

SELECT emp_id,
'ACTIVE',
emp_id *3.14159,
UPPER(lname)
FROM employee;

SELECT emp_id,
'ACTIVE' status,
emp_id * 3.14159 empid_x_pi,
UPPER(lname) last_name_upper
FROM employee;

SELECT cust_id
FROM account; 
# an example of duplicates

SELECT DISTINCT cust_id
FROM account;
# distinct requires sorted data. do not use to check uniqueness regularly. use intuition
# of data to determine of uniqueness is an inherent characteristic of the data you are working with.alter

# SUBQUERIES
# Creates an instance of a new temporary table, visible to other query clauses.

SELECT e.emp_id, e.fname, e.lname
FROM (SELECT emp_id, fname, lname, start_date, title
FROM employee) e;

# views
# - a query that stored in the data dictionary.
# looks and acts like a table, but no data is associated.alter

# View def that queries employee table and includes
# a call to a built-in function:

CREATE VIEW employee_vw AS
SELECT emp_id, fname, lname, 
YEAR(start_date) start_year
FROM employee;

# Now that view is created, no additional data is created.
# select statement is stored by the server.
# We can now query against our view.

SELECT emp_id, start_year
FROM employee_vw;

# Views can be used to hid columns from users
# and simplify complex databse designs.alter

# Table links
# Using a join in the FROM clause to link two tables on a column.
SELECT employee.emp_id id, employee.fname fn, employee.lname ln,
department.name dept_name
FROM employee INNER JOIN department 
ON employee.dept_id = department.dept_id;

# Defining Table Aliases

# two main choices when referencing a column in the SELECT, WHERE, GROUP BY,
# HAVING, and ORDER BY clauses

# 1.) use entire table name ex. employee.emp_id
# 2.) assign each table an alias and us alias throughout query

# ex 2.), pay attention to e and d.
SELECT e.emp_id, e.fname, e.lname, d.name dept_name
FROM employee e INNER JOIN department d
ON e.dept_id = d.dept_id;

# The WHERE clause
# Meant to filter out rows.

# single filter condition
SELECT emp_id, fname, lname, start_date, title
FROM employee
WHERE title = 'Head Teller';

# Other conditions can be used like AND, OR, and NOT

SELECT emp_id, fname, lname, start_date, title
FROM employee
WHERE title = 'Head Teller'
AND start_date > '2002-01-01';

SELECT emp_id, fname, lname, start_date, title
FROM employee
WHERE title = 'Head Teller'
OR start_date > '2002-01-01';

# Grouping conditions using parantheses
# Always group with parantheses.

SELECT emp_id, fname, lname, start_date, title
FROM employee
WHERE (title = 'Head Teller' AND start_date > '2002-01-01')
OR (title = 'Teller' AND start_date > '2003-01-01');

# ORDER BY clause
SELECT open_emp_id, product_cd
FROM account
ORDER BY open_emp_id, product_cd;

# Ascending (ASC) vs Descending (DESC)

SELECT account_id, product_cd, open_date, avail_balance
FROM account
ORDER BY avail_balance DESC;

# Sorting via Experessions

# Suppose you want to sort by some expression
# Sort by last (rightmost)(RIGHT) 3 digits 
SELECT cust_id, cust_type_cd, city, state, fed_id
FROM customer
ORDER BY RIGHT(fed_id, 3);

# Sorting via Numeric Placeholders

# Sorting columns 2 and 5
SELECT emp_id, title, start_date, fname, lname
FROM employee
ORDER BY 2, 5;


# 3-1
# Retrieve emp id, fname, lname forall emp. Sort by lname then fname

SELECT emp_id, fname, lname
FROM employee
ORDER BY lname, fname;

# 3-2
# Rerieve the acc id, cust id, avaiable balance for all 'ACTIVE' status whose avail bal x > 2500

SELECT account_id, cust_id, avail_balance
FROM account
WHERE (avail_balance > 2500 AND status = 'ACTIVE');

# 3-3
# Write a query against the account table that returns IDs of emp who opened acc, include
# a single row for each distinct employee

SELECT DISTINCT e.emp_id
FROM employee e INNER JOIN account a
ON a.open_emp_id = e.emp_id;


# 3-4
# Fill in blanks

SELECT p.product_cd, a.cust_id, a.avail_balance
FROM product p INNER JOIN account a
	ON p.product_cd = a.product_cd
WHERE p.product_type_cd = 'ACCOUNT';




