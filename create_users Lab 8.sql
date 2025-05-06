- Create logins for Frodo and Bilbo with passwords
CREATE USER 'Frodo'@'localhost' IDENTIFIED BY 'password_frodo';
CREATE USER 'Bilbo'@'localhost' IDENTIFIED BY 'password_bilbo';

-- Create a role called hobbit
CREATE ROLE 'hobbit';

-- Grant SELECT, INSERT, UPDATE, DELETE permissions to the hobbit role for the Kitchen database
GRANT SELECT, INSERT, UPDATE, DELETE ON Kitchen.* TO 'hobbit';

-- Assign the hobbit role to Frodo and Bilbo
GRANT 'hobbit' TO 'Frodo'@'localhost';
GRANT 'hobbit' TO 'Bilbo'@'localhost';

-- Grant the hobbit role to Frodo and Bilbo so they inherit the permissions
GRANT 'hobbit' TO 'Frodo'@'localhost';
GRANT 'hobbit' TO 'Bilbo'@'localhost';
