-- Creating Database
CREATE DATABASE IF NOT EXISTS yourdb;

-- Using a Database
USE yourdb;

-- Creating Table with Constraints
CREATE TABLE IF NOT EXISTS employees (
    emp_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(50),
    salary DECIMAL(10, 2) NOT NULL CHECK (salary >= 0)
);

-- Creating Table with PRIMARY KEY Constraint
CREATE TABLE IF NOT EXISTS orders (
    order_id INT UNSIGNED NOT NULL PRIMARY KEY,
    order_date DATE,
    customer_id INT UNSIGNED,
    total_amount DECIMAL(10, 2)
);

-- Creating Table with FOREIGN KEY Constraint
CREATE TABLE IF NOT EXISTS order_items (
    item_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNSIGNED,
    product_id INT UNSIGNED,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Adding NOT NULL Constraint
ALTER TABLE employees MODIFY department VARCHAR(50) NOT NULL;

-- Adding CHECK Constraint
ALTER TABLE employees ADD CHECK (salary >= 1000);

-- Creating Table with CHECK Constraint
CREATE TABLE IF NOT EXISTS products (
    product_id INT UNSIGNED NOT NULL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0)
);

-- Adding UNIQUE Constraint
ALTER TABLE orders ADD UNIQUE (order_date, customer_id);

-- Adding FOREIGN KEY Constraint
ALTER TABLE order_items ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);
ALTER TABLE order_items ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

-- Adding PRIMARY KEY Constraint
ALTER TABLE orders ADD PRIMARY KEY (order_id);

-- Modifying FOREIGN KEY Constraint
ALTER TABLE order_items DROP FOREIGN KEY order_items_ibfk_1;
ALTER TABLE order_items ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE order_items ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Adding CHECK Constraint
ALTER TABLE products ADD CHECK (price > 0);

-- Dropping Constraints
ALTER TABLE employees DROP CONSTRAINT employees_ibfk_1;
ALTER TABLE employees DROP CHECK salary;

-- Adding DEFAULT Constraint
ALTER TABLE products ALTER COLUMN stock_quantity SET DEFAULT 0;

-- Modifying UNIQUE Constraint
ALTER TABLE orders DROP INDEX order_date;
ALTER TABLE orders ADD UNIQUE (order_date, customer_id);
