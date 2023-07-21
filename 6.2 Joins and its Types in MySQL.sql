-- Creating tables for demonstration
CREATE TABLE employees IF NOT EXISTS (
    emp_id INT UNSIGNED NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL
);

CREATE TABLE departments IF NOT EXISTS (
    department_id INT NOT NULL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Inserting data into tables
INSERT INTO employees (emp_id, first_name, last_name, department_id) VALUES
    (1, 'John', 'Doe', 1),
    (2, 'Jane', 'Smith', 2),
    (3, 'Michael', 'Johnson', 1),
    (4, 'Emily', 'Williams', 3);

INSERT INTO departments (department_id, department_name) VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'IT');

-- 6.2 Types of Joins

-- 6.2.1 INNER JOIN
-- Example 1: Simple INNER JOIN
SELECT employees.emp_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments 
ON employees.department_id = departments.department_id;

-- Example 2: INNER JOIN with WHERE clause
SELECT employees.emp_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE departments.department_id = 1;

-- 6.2.2 LEFT JOIN (or LEFT OUTER JOIN)
-- Example: LEFT JOIN to get all employees and their departments (including employees without departments)
SELECT employees.emp_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments 
ON employees.department_id = departments.department_id;

-- 6.2.3 RIGHT JOIN (or RIGHT OUTER JOIN)
-- Example: RIGHT JOIN to get all departments and their employees (including departments without employees)
SELECT employees.emp_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments
ON employees.department_id = departments.department_id;

-- 6.2.4 FULL JOIN (or FULL OUTER JOIN)
-- Example: FULL JOIN to get all employees and departments (including unmatched rows from both tables)
SELECT employees.emp_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
FULL JOIN departments
ON employees.department_id = departments.department_id;


-- Cleanup (Drop tables)
DROP TABLE employees;
DROP TABLE departments;
