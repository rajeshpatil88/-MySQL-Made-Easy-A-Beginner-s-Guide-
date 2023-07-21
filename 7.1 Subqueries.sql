-- 7.1 Subqueries

-- 7.1.1 Single-Row Subquery

-- 7.1.1 Single-Row Subquery: below is demonstration of how to use single-row subqueries in SELECT and WHERE clauses.

-- Example 1: Using a Single-Row Subquery in SELECT
SELECT product_name, product_price,
       (SELECT MAX(product_price) FROM products) AS max_price
FROM products;

/*This query retrieves the product_name, product_price, and the maximum product_price from the products table. 
The single-row subquery (SELECT MAX(product_price) FROM products) is used to calculate the maximum price and display it in the result for each product.*/

-- Example 2: Using a Single-Row Subquery in WHERE
SELECT product_name, product_price
FROM products
WHERE product_price > (SELECT AVG(product_price) FROM products);

/*This query retrieves the product_name and product_price from the products table where the product_price is greater than the average product_price of all products.
The single-row subquery (SELECT AVG(product_price) FROM products) calculates the average price and is used as a condition in the WHERE clause.*/

-- 7.1.2 Multi-Row Subquery

-- 7.1.2 Multi-Row Subquery: Shows how to use multi-row subqueries with IN, NOT IN, and ANY operators.

-- Example 3: Using a Multi-Row Subquery with IN
SELECT product_name, product_price
FROM products
WHERE product_id IN (SELECT product_id FROM order_items);

 /*This query retrieves the product_name and product_price from the products table for products that have their product_id listed in the order_items table. 
The multi-row subquery (SELECT product_id FROM order_items) retrieves all the product_ids from the order_items table.*/

-- Example 4: Using a Multi-Row Subquery with NOT IN
SELECT product_name, product_price
FROM products
WHERE product_id NOT IN (SELECT product_id FROM order_items);

/*This query retrieves the product_name and product_price from the products table for products that do not have their product_id listed in the order_items table. 
The multi-row subquery (SELECT product_id FROM order_items) retrieves all the product_ids from the order_items table, and NOT IN negates the condition.*/

-- Example 5: Using a Multi-Row Subquery with ANY
SELECT product_name, product_price
FROM products
WHERE product_price > ANY (SELECT product_price FROM products WHERE product_id <> 1);

/*This query retrieves the product_name and product_price from the products table for products that have a price greater than any product_price where the 
product_id is not 1. The multi-row subquery (SELECT product_price FROM products WHERE product_id <> 1) retrieves all product_prices except for the product
with product_id = 1.*/

-- 7.1.3 Correlated Subquery

-- 7.1.3 Correlated Subquery: Illustrates the usage of correlated subqueries, which reference columns from the outer query.

-- Example 6: Using a Correlated Subquery
SELECT product_name, product_price,
       (SELECT AVG(product_price) FROM products p2 WHERE p1.product_category = p2.product_category) AS avg_price_by_category
FROM products p1;

/*This query retrieves the product_name, product_price, and the average product_price for each product_category from the products table. 
The correlated subquery (SELECT AVG(product_price) FROM products p2 WHERE p1.product_category = p2.product_category) calculates the average price for each
product_category based on the outer query.*/

-- Example 7: Using a Correlated Subquery in the WHERE Clause
SELECT order_id, order_date
FROM orders o
WHERE EXISTS (SELECT 1 FROM order_items oi WHERE o.order_id = oi.order_id AND oi.product_id = 1001);

/* This query retrieves the order_id and order_date from the orders table for orders that have at least one order_items record with product_id = 1001. 
The correlated subquery (SELECT 1 FROM order_items oi WHERE o.order_id = oi.order_id AND oi.product_id = 1001) checks for the existence of a 
matching order_items record for each order in the outer query.*/

-- Example 8: Using a Correlated Subquery with Comparison
SELECT product_name, product_price
FROM products p
WHERE product_price > (SELECT AVG(product_price) FROM products WHERE product_category = p.product_category);

/*This query retrieves the product_name and product_price from the products table for products that have a price greater than the average product_price
for the same product_category. The correlated subquery (SELECT AVG(product_price) FROM products WHERE product_category = p.product_category) calculates
the average price for each product_category based on the outer query and is used as a condition in the WHERE clause.*/
