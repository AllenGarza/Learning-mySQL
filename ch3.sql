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