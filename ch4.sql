# Chapter 4: Filtering
# Condition Types

# Equality condition
SELECT pt.name product_type, p.name product
FROM product p INNER JOIN product_type pt
ON p.product_type_cd = pt.product_type_cd
WHERE pt.name = 'Customer Accounts';

# All products that are Customer accounts.alter

# Inequality Conditions
SELECT pt.name product_type, p.name product
FROM product p INNER JOIN product_type pt
ON p.product_type_cd = pt.product_type_cd
WHERE pt.name != 'Customer Accounts';

# 4-1
# The following returns ids whose date is before
# exclusively '2005-02-06' and whose txn_type_cd is 
# 'DBT' or whose amount is greater than 100

# txn_date < '2005-02-26' AND (txn_type_cd = 'DBT' OR amount > 100)

# 4-2
# The following filter conditions would return account_ids
# whose account_id is in a set of integers S = (101, 103) and txn_type_cd is NOT
# equal to 'DBT' or amount is less than 100.

# account_id IN (101, 103) AND NOT (txn_type_cd = 'DBT' OR amount > 100)


# 4-3
# Construct a query that retrieves all accounts opened in 2002

SELECT account_id, open_date
FROM account
WHERE (open_date >= '2002-01-01' AND open_date <= '2002-12-31');

# 4-4
# Construct a query that finds all nonbusiness customers whose last name
# contains an 'a' in the second position and an 'e' anywhere after the
# 'a'.

SELECT ind.cust_id, ind.lname, cust.cust_type_cd 
FROM individual ind INNER JOIN customer cust
USING (cust_id)
WHERE (cust.cust_type_cd = 'I') AND (ind.lname LIKE '_a%e%');

