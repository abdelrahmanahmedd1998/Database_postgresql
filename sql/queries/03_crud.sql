-- 0. CLEAN: remove leftovers from an earlier failed run
--    (delete users whose username starts with test_user_)
SELECT * from users;
DELETE FROM users
WHERE username LIKE 'test\_user\_%'
RETURNING username;

-- 1. BEFORE: how many users are there?  (expect 12)
SELECT COUNT(*) AS total_users FROM users;

-- 2. CREATE: insert 'test_crud_01' with email 'crud01@example.com'
--    use RETURNING to show the new row
INSERT INTO users (username,email) 
VALUES ('test_crud_01','crud01@example.com')
RETURNING *;

-- 3. VERIFY create: a query that returns t if exactly 1 row exists
SELECT COUNT(*) =1 AS existed_user FROM users
WHERE username='test_crud_01';

-- 4. UPDATE: change the email to 'crud01_changed@example.com'
--    expect: UPDATE 1
UPDATE users
SET email ='crud01_changed@example.com'
WHERE email ='crud01@example.com';

-- 5. VERIFY update: the new email is there, AND the old email finds no rows
SELECT COUNT (*) =1 AS new_email_exists from users
WHERE email ='crud01_changed@example.com';

SELECT COUNT (*) =0 AS old_email_not_found from users
WHERE email ='crud01@example.com';

-- 6. DELETE: remove 'test_crud_01'
DELETE FROM users
WHERE username ='test_crud_01' 
RETURNING username;

-- 7. VERIFY delete: the user is gone, AND the total is back to 11
SELECT COUNT(*) = 0 AS user_is_gone
FROM users
WHERE username = 'test_crud_01';

SELECT COUNT(*) = 11 AS total_is_11
FROM users;

BEGIN;
UPDATE users SET is_active = FALSE;
SELECT * FROM users;
RoLLBACK;
SELECT * FROM users;

--Insert three users in one statement, with usernames test_bulk_01 to test_bulk_03, where the second has no email.
--Verify they exist: 3 rows match the prefix (remember to escape the underscores).
--Deactivate all three with one UPDATE. Expected tag: UPDATE 3.
--Prove nothing else changed: the number of inactive users should be 5 (dave, heidi and your three).
--Delete them by prefix. Expected: DELETE 3. Then confirm the total is back to 12.

INSERT INTO users (username,email)
VALUES ('test_bulk_01','test_bulk_01@bulk.com'),('test_bulk_02',NULL),('test_bulk_03','test_bulk_03@bulk.com')
RETURNING username,email;

SELECT COUNT(*) =3 AS Inserted_users
FROM users 
WHERE username LIKE 'test\_bulk%';

UPDATE users SET is_active=FALSE
WHERE username LIKE 'test\_bulk%';

SELECT COUNT(*) = 5 AS inactive_count_is_5
FROM users
WHERE is_active = FALSE;

DELETE FROM users
WHERE username LIKE 'test\_bulk\_%';
SELECT COUNT(*) = 10 AS total_is_10
FROM users;