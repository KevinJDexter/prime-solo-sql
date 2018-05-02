CREATE TABLE accounts (
    user_id serial PRIMARY KEY,
    username character varying(12),
    city character varying(128),
    transactions_completed integer,
    transactions_attempted integer,
    account_balance numeric(12,2)
);

INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('shawn', 'chicago', 5, 10, 355.80),
('cherise', 'minneapolis', 9, 9, 4000.00),
('larry', 'minneapolis', 3, 4, 77.01),
('dallas', 'new york', 6, 12, 0.99),
('anthony', 'chicago', 0, 0, 0.00),
('travis', 'miami', 1, 100, 500000.34),
('davey', 'chicago', 9, 99, 98.04),
('ora', 'phoenix', 88, 90, 3.33),
('grace', 'miami', 7, 9100, 34.78),
('hope', 'phoenix', 4, 10, 50.17);

-- 1. Get all users from Chicago
SELECT * FROM "accounts"
WHERE "city" LIKE 'chicago';

-- 2. Get all users with usernames that contain the letter a
SELECT * FROM "accounts"
WHERE "username" ILIKE '%a%';

-- 3. Update all records with account balance of 0 and 0 transactions attempted. Give them 10 dollars.
SELECT * FROM "accounts"
WHERE "account_balance" = 0 AND "transactions_attempted" = 0;

UPDATE "accounts"
SET "account_balance" = 10
WHERE "account_balance" = 0 AND "transactions_attempted" = 0;

-- 4. Select all users with >= 9 attempted transactions
SELECT * FROM "accounts"
WHERE "transactions_attempted" >= 9;

-- 5. Get username and account balance of 3 highest balances, from highest to lowest
SELECT "username", "account_balance" FROM "accounts"
ORDER BY "account_balance" DESC
LIMIT 3;

-- 6. Get username and account balance of 3 lowest balances, from lowest to highest
SELECT "username", "account_balance" FROM "accounts"
ORDER BY "account_balance" 
LIMIT 3;

-- 7. Get all users with account balances > $100
SELECT * FROM "accounts"
WHERE "account_balance" > 100;

-- 8. Add a new record
INSERT INTO "accounts" ("username", "city", "transactions_completed", "transactions_attempted", "account_balance")
VALUES ('Kevin', 'Crystal', 5, 6, 100000000);

SELECT * FROM "accounts";

-- 9. Delete users from miami or phoenix with less than 5 transactions
SELECT * FROM "accounts"
WHERE "transactions_completed" < 5
AND ("city" LIKE 'phoenix' OR "city" LIKE 'miami');

DELETE FROM "accounts" 
WHERE "transactions_completed" < 5
AND ("city" LIKE 'phoenix' OR "city" LIKE 'miami');
