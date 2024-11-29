USE sql_store;

SELECT * FROM customers
-- where customer_id=1
ORDER BY first_name;

#Task 1 - change points to read times by 10 and plus 100
SELECT last_name, first_name, points, points * 10 + 100
FROM customers; 

/*Task 1 pt2 - Change code to create discount factor to 
show discount header and change points to read (point + 10) * 100*/
SELECT last_name, first_name, points,
(points + 10) * 100 AS discount_factor
FROM customers;

/*Task 2 - Return all products, their original price and new price
which is based on expression of (unit price *1.1)*/
SELECT name, unit_price, (unit_price * 1.1) AS new_price
FROM products;

#Task 3 - Returning customers with birthdate of >1990-01-01
SELECT customer_id, last_name, first_name, birth_date
FROM customers
WHERE birth_date > '1990-01-01'; 

#Task 4 - Find out name of product with most amount in stock via sql_inventory
USE sql_inventory;
SELECT name, quantity_in_stock
FROM products
ORDER BY quantity_in_stock DESC;

#Task 5 - Query to find name of most expensive product
SELECT name, unit_price
FROM products
ORDER BY unit_price DESC;

/*Task 6 - Query returning first name, last name, address and birth
date of oldest customer*/
USE sql_store;
SELECT first_name, last_name, address, birth_date
FROM customers
ORDER BY birth_date ASC 
LIMIT 1;





