-- MySQL Essential Commands:
/*
0. Commenting Code in MySQL:

- In MySQL, you can add comments to your SQL statements to make the code more readable and to explain the purpose of specific queries. 
- Comments in MySQL start with '--' for single-line comments or for multi-line comments use - /* and * /
*/

/*
1. SHOW DATABASES:
   - Use: This command is used to display a list of all databases on the MySQL server.
   - Description: It provides information about the databases available on the server, allowing you to see what databases exist.
*/

/*
2. SHOW TABLES:
   - Use: This command is used to display a list of tables within the currently selected database.
   - Description: When you have selected a database using the `USE` command (covered later), you can use `SHOW TABLES` to see all the tables in that specific database.
*/

/*
3. CREATE DATABASE IF NOT EXISTS yourdb:
   - Use: This command creates a new database with the name "yourdb" if it doesn't already exist.
   - Description: The `CREATE DATABASE` statement is used to create a new database. The `IF NOT EXISTS` condition ensures that the database is created only if a database with the same name doesn't already exist.
*/

/*
4. USE yourdb:
   - Use: This command is used to select a specific database to work with.
   - Description: When you want to work with a particular database and perform operations on its tables, you use the `USE` statement to select that database.
*/

/*
5. SELECT DATABASE():
   - Use: This command returns the name of the currently selected database.
   - Description: It can be useful when you want to verify which database is currently selected, especially if you've switched between multiple databases.
*/

/*
6. DESCRIBE table_name (or) SHOW COLUMNS FROM table_name:
   - Use: Both `DESCRIBE` and `SHOW COLUMNS FROM` commands are used to display the structure of a table.
   - Description: They provide information about the columns in a specific table, including column names, data types, and any constraints.
*/

-- Creating Database if not exists
CREATE DATABASE IF NOT EXISTS yourdb;

-- Using a Database
USE yourdb;

-- Creating Table if not exists
CREATE TABLE IF NOT EXISTS products (
	productID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    productCode CHAR(3) NOT NULL DEFAULT '',
    `name` VARCHAR(30) NOT NULL DEFAULT '',
    quantity VARCHAR(30) NOT NULL DEFAULT 0,
    price DECIMAL(7,2) NOT NULL DEFAULT 99999.99,
    PRIMARY KEY (productID)
);

-- Check if the products table has been created
SHOW TABLES;

-- Viewing the table structure
DESCRIBE products;

-- View the complete CREATE TABLE statement used by MySQL to create this table
SHOW CREATE TABLE products;

-- Adding Indexes
CREATE TABLE products_details (
	product_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    product_category VARCHAR(50),
    product_price DECIMAL(10,2) NOT NULL,
    product_sku CHAR(10) NOT NULL, 
    short_description VARCHAR(500),
    PRIMARY KEY (product_id),
    INDEX idx_names (product_name, product_category)
) ENGINE=InnoDB;

-- Adding an additional Index
ALTER TABLE products_details ADD INDEX idx_sku(product_sku);

-- Modifying Table Structure (Adding a new column)
ALTER TABLE products ADD COLUMN newColumn INT;

-- Modifying Table Structure (Modifying column data type)
ALTER TABLE products MODIFY COLUMN quantity INT;

-- Modifying Table Structure (Dropping a column)
ALTER TABLE products DROP COLUMN newColumn;

-- Modifying Table Structure (Renaming a column)
ALTER TABLE products CHANGE COLUMN productCode productCodeNew CHAR(4);

-- Truncate Table (Deletes all rows from the table, but keeps the table structure)
TRUNCATE TABLE products;

-- Drop Table (Deletes the entire table)
DROP TABLE products;

-- Drop Database (Deletes the entire database)
DROP DATABASE yourdb;

-- Rename Table
RENAME TABLE products TO products_backup;

-- Rename Table back to the original name
RENAME TABLE products_backup TO products;
