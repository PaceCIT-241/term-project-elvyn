--SECURITY — ROLE, USERS, PRIVILEGES
-- ============================================================
-- 1. Create the Role
CREATE ROLE IF NOT EXISTS 'readonly_analyst';

-- 2. Grant SELECT privileges to the role
GRANT SELECT ON produce_prices.* TO 'readonly_analyst';

-- 3. Create the Users 
-- (If these already exist, the script will just move on)
CREATE USER IF NOT EXISTS 'analyst_alice'@'localhost' IDENTIFIED BY 'securepass1';
CREATE USER IF NOT EXISTS 'analyst_bob'@'localhost' IDENTIFIED BY 'securepass2';
CREATE USER IF NOT EXISTS 'analyst_carol'@'localhost' IDENTIFIED BY 'securepass3';

-- 4. Assign the role to the users
GRANT 'readonly_analyst' TO 'analyst_alice'@'localhost';
GRANT 'readonly_analyst' TO 'analyst_bob'@'localhost';
GRANT 'readonly_analyst' TO 'analyst_carol'@'localhost';

-- 5. Final Refresh
FLUSH PRIVILEGES;