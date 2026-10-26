--Username and email of all active users
SELECT username,email FROM users
WHERE is_active;

--All inactive users
SELECT username,email FROM users
WHERE is_active =FALSE;

--The user with username alice
SELECT username,email FROM users
WHERE username ='alice';

--Users whose username starts with test, ignoring case
SELECT username,email FROM users
WHERE email LIKE 'test%';

--Users with no email
SELECT username,email FROM users
WHERE email IS NULL;

--The five most recent users
SELECT * FROM users
ORDER BY created_at DESC
LIMIT 5;

--The next five (page 2)
SELECT * FROM users
ORDER BY created_at DESC
LIMIT 5 OFFSET 5;

--Users created in the last 7 days
SELECT * FROM users
WHERE created_at >= NOW() -INTERVAL '7 days';

--Users who are inactive or have no email
SELECT * FROM users
WHERE is_active =FALSE OR email IS NULL 

--Active users with no email
SELECT * FROM users
WHERE is_active and email IS NULL;

--Username and a status column saying active or inactive
SELECT username,
CASE 
WHEN is_active THEN 'active'
ELSE 'inactive'
END AS status
FROM Users

--list of distinct emails
SELECT Distinct email FROM Users 

--Usernames containing a literal underscore
SELECT * FROM users
WHERE username LIKE '%\_%';

