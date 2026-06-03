USE univ;

DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts (name, balance) VALUES 
('Adam', 500.00), 
('Bob', 300.00), 
('Charlie', 1000.00);

START TRANSACTION;
UPDATE accounts SET balance = balance - 50 WHERE id = 1;
UPDATE accounts SET balance = balance + 50 WHERE id = 2;
COMMIT;

SELECT * FROM accounts;

START TRANSACTION;
UPDATE accounts SET balance = balance - 200 WHERE id = 1;
SAVEPOINT debit_funds;

UPDATE accounts SET balance = balance +20 WHERE id = 1; #cashback
-- error
ROLLBACK TO debit_funds; #restored until savepoint 
commit;

SELECT * FROM accounts;