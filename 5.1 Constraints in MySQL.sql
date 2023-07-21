-- Creating Database
CREATE DATABASE IF NOT EXISTS yourdb;

-- Using a Database
USE yourdb;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creating Table1 with Constraints
CREATE TABLE IF NOT EXISTS employees (
    emp_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(50),
    salary DECIMAL(10, 2) NOT NULL CHECK (salary >= 0)
);

-- the "UNSIGNED" attribute is used with numeric data types (e.g., INT, BIGINT) to specify that the column will only store positive values, zero, or no value.. 

/* DECIMAL(10,2) specifies the precision and scale. In this case, it means the number can have up to 10 digits in total, with 2 digits after the decimal point.
For example, a value of 12345.67 would be valid for this data type. */

-- VARCHAR(50) specifies the maximum number of characters that the column can hold, in the above case, up to 50 characters.


----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Creating Table2 with PRIMARY KEY Constraint
CREATE TABLE IF NOT EXISTS orders (
    order_id INT UNSIGNED NOT NULL PRIMARY KEY,
    order_date DATE,
    customer_id INT UNSIGNED,
    total_amount DECIMAL(10, 2)
);

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Creating Table3 with CHECK Constraint
CREATE TABLE IF NOT EXISTS products (
    product_id INT UNSIGNED NOT NULL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0)
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Creating Table4 with FOREIGN KEY Constraint
CREATE TABLE IF NOT EXISTS order_items (
    item_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNSIGNED,
    product_id INT UNSIGNED,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Using alter commands to make changes in the defined constraints.

-- Adding NOT NULL Constraint
ALTER TABLE employees MODIFY department VARCHAR(50) NOT NULL;

-- Adding CHECK Constraint
ALTER TABLE employees ADD CHECK (salary >= 1000);

-- Adding UNIQUE Constraint
ALTER TABLE orders ADD UNIQUE (order_date, customer_id);

-- Adding FOREIGN KEY Constraint
ALTER TABLE order_items ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);
ALTER TABLE order_items ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

-- Adding PRIMARY KEY Constraint
ALTER TABLE orders ADD PRIMARY KEY (order_id);

-- Adding CHECK Constraint
ALTER TABLE products ADD CHECK (price > 0);

-- Dropping Constraints
ALTER TABLE employees DROP CONSTRAINT employees_ibfk_1;
ALTER TABLE employees DROP CHECK salary;

-- Adding DEFAULT Constraint
ALTER TABLE products MODIFY COLUMN stock_quantity INT NOT NULL DEFAULT 0;

-- Modifying UNIQUE Constraint
ALTER TABLE orders DROP INDEX order_date;
ALTER TABLE orders ADD UNIQUE (order_date, customer_id);

/* the above code first removes the existing UNIQUE constraint on the order_date column and then adds a new UNIQUE constraint on the combination of 
order_date and customer_id columns. This ensures that each order made by a customer on a specific date is unique in the table.*/
