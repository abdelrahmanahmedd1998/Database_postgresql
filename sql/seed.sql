TRUNCATE users RESTART IDENTITY;
INSERT INTO users(username,email,is_active,created_at) VALUES
   ('alice',    'alice@example.com',TRUE, NOW() -INTERVAL '60 days'),
   ('bob',          'bob@example.com',    TRUE,  NOW() - INTERVAL '45 days'),
   ('carol',        'carol@example.com',  TRUE,  NOW() - INTERVAL '30 days'),
   ('dave',         'dave@example.com',   FALSE, NOW() - INTERVAL '28 days'),
   ('eve',          'eve@example.com',    TRUE,  NOW() - INTERVAL '21 days'),
   ('frank',        NULL,                 TRUE,  NOW() - INTERVAL '14 days'),
   ('grace',        'grace@example.com',  TRUE,  NOW() - INTERVAL '10 days'),
   ('heidi',        'heidi@example.com',  FALSE, NOW() - INTERVAL '7 days'),
   ('ivan',         'ivan@example.com',   TRUE,  NOW() - INTERVAL '5 days'),
   ('judy',         'judy@example.com',   TRUE,  NOW() - INTERVAL '3 days'),
   ('test_user_01', 'test01@example.com', TRUE,  NOW());