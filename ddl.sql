CREATE SCHEMA financial;

CREATE TABLE Bank (
  bank_id int(10) NOT NULL,
  bank_name varchar(50) NOT NULL,
  CHECK (bank_id > 0),
  PRIMARY KEY (bank_id)
);

CREATE TABLE ATMs (
  atm_id int(10) NOT NULL,
  atm_address varchar(50) NOT NULL,
  bill_limit smallint(4) NOT NULL DEFAULT 5000,
  cash_limit smallint(5) NOT NULL DEFAULT 10000,
  bank_id int,
  PRIMARY KEY (atm_id),
  FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE
);

CREATE TABLE Users (
  user_id int (10) NOT NULL,
  first_name varchar (10) NOT NULL,
  last_name varchar(10) NOT NULL,
  address varchar(50) NOT NULL,
  phone_num varchar(15) NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE Cards (
  card_id int(10) NOT NULL,
  card_num char(16) NOT NULL,
  pin char(4) NOT NULL,
  user_id int,
  bank_id int,
  PRIMARY KEY (card_id),
  UNIQUE KEY (card_num),
  FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE
);

CREATE TABLE Accounts (
  account_num int(10) NOT NULL,
  balance decimal(50, 2) NOT NULL,
  bank_id int,
  user_id int,
  card_id int,
  PRIMARY KEY (account_num),
  FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE,
  FOREIGN KEY (card_id) REFERENCES Cards(card_id) ON DELETE CASCADE
);

CREATE TABLE Deposit (
  trans_id int(10) NOT NULL,
  trans_amount decimal(10,2) NOT NULL,
  account_num int,
  trans_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CHECK (trans_id > 0 AND trans_amount > 0),
  PRIMARY KEY (trans_id),
  FOREIGN KEY (account_num) REFERENCES Accounts (account_num) ON DELETE CASCADE
);

CREATE TABLE Withdraw (
  trans_id int(10) NOT NULL,
  trans_amount decimal(10,2) NOT NULL,
  account_num int,
  trans_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CHECK (trans_id > 0 AND trans_amount > 0),
  PRIMARY KEY (trans_id),
  FOREIGN KEY (account_num) REFERENCES Accounts (account_num) ON DELETE CASCADE
);

# update account balance after a deposit
CREATE TRIGGER trig_balance_deposit
AFTER INSERT ON Deposit FOR EACH ROW
UPDATE Accounts
SET balance = balance + NEW.trans_amount
WHERE NEW.account_num = Accounts.account_num;

# update account balance after a withdrawal
CREATE TRIGGER trig_balance_withdraw
AFTER INSERT ON Withdraw FOR EACH ROW
UPDATE Accounts
SET balance = balance - NEW.trans_amount
WHERE NEW.account_num = Accounts.account_num;
