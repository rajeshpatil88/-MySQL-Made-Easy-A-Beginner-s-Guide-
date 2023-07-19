-- Inserting Data
INSERT INTO products VALUES (1001, 'PEN', 'Pen Red', 5000, 1.23);

-- Inserting Multiple Values
INSERT INTO products VALUES 
	(NULL, 'PEN', 'Pen Blue', 8000, 1.25),
    (NULL, 'PEN', 'Pen Black', 2000, 1.25);

-- Inserting Data into Selected Columns
INSERT INTO products (productCode, name, quantity, price) VALUES 
	('PEC', 'Pencil 2B', 10000, 0.48),
    ('PEC', 'Pencil 2H', 8000, 0.49);

-- Inserting Data into Not Null Columns with Default Values
INSERT INTO products (productCode, name) VALUES ('PEC', 'Pencil HB');

-- Viewing the inserted data
SELECT * FROM products;

-- Accessing Rows with WHERE Clause
SELECT * FROM products WHERE productCode = 'PEC';

-- Accessing Specific Columns
SELECT name, price FROM products;

-- WHERE Clause with Logical Operators (AND, OR, NOT)
SELECT * FROM products WHERE quantity >= 5000 AND price < 1.0;

-- WHERE Clause with BETWEEN/NOT BETWEEN
SELECT * FROM products WHERE price BETWEEN 1.0 AND 2.0;

-- WHERE Clause with NULL/NOT NULL
SELECT * FROM products WHERE productCode IS NULL;

-- Using AS to Rename Columns
SELECT productCode AS 'Code', name AS 'Product Name' FROM products;

-- Using DISTINCT to Retrieve Unique Rows
SELECT DISTINCT productCode FROM products;

-- WHERE Clause with IN/NOT IN
SELECT * FROM products WHERE productCode IN ('PEN', 'PEC');

-- GROUP BY Clause
SELECT productCode, COUNT(*) FROM products GROUP BY productCode;

-- ORDER BY Clause
SELECT * FROM products WHERE name LIKE 'Pen%' ORDER BY price DESC;

-- Using LIMIT to Limit the Number of Rows Returned
SELECT * FROM products ORDER BY price LIMIT 2;

-- Using LIKE to Perform Pattern Matching
SELECT * FROM products WHERE name LIKE 'Pen%';

-- Using CONCAT Function to Concatenate Columns
SELECT CONCAT(productCode, '-', name) AS 'Product Description' FROM products;

-- Using COUNT Function to Count Rows
SELECT COUNT(*) AS 'Total Products' FROM products;

-- Using SUM Function to Calculate Sum
SELECT SUM(quantity) AS 'Total Quantity' FROM products;

-- Using AVG Function to Calculate Average
SELECT AVG(price) AS 'Average Price' FROM products;

-- Using MAX and MIN Functions to Find Maximum and Minimum Values
SELECT MAX(price) AS 'Max Price', MIN(price) AS 'Min Price' FROM products;

-- Updating Data (Modifying all rows)
UPDATE products SET price = price * 0.9;

-- Modifying Selected Rows (Using WHERE clause)
UPDATE products SET quantity = quantity - 100 WHERE name = 'Pen Red';

-- Updating Multiple Values (Using WHERE clause)
UPDATE products SET quantity = quantity + 50, price = 1.23 WHERE name = 'Pen Red';

-- Viewing the updated data
SELECT * FROM products WHERE name = 'Pen Red';

-- Deleting Rows (Using WHERE clause)
DELETE FROM products WHERE name LIKE 'Pencil%';

-- Viewing the remaining data after deletion
SELECT * FROM products;
