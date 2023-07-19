-- DCL Commands

-- GRANT command to provide specific privileges to users or roles
GRANT SELECT, INSERT, UPDATE, DELETE ON yourdb.products TO user1;

-- REVOKE command to remove privileges from users or roles
REVOKE SELECT, INSERT, UPDATE, DELETE ON yourdb.products FROM user1;

-- Adding User with Specific Privileges
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON yourdb.products TO 'user2'@'localhost';

-- Removing User
DROP USER 'user2'@'localhost';

-- Setting User Password
ALTER USER 'user1'@'localhost' IDENTIFIED BY 'new_password';

-- Displaying User Privileges
SHOW GRANTS FOR 'user1'@'localhost';
