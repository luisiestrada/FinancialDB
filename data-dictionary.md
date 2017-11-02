Data Dictionary

|   Table  |     Field    | Data Type | Size |       Description       |  Constraint |
|:--------:|:------------:|:---------:|:----:|:-----------------------:|:-----------:|
| Bank     | bank_id      | int       | 10   | Bank ID                 | Primary key |
| Bank     | bank_name    | varchar   | 50   | Bank name               |
| ATMs     | atm_id       | int       | 10   | ATM ID                  | Primary key |
| ATMs     | atm_address  | varchar   | 50   | ATM location            |
| ATMs     | bill_limit   | smallint  | 4    | Limit of physical bills |
| ATMs     | cash_limit   | smallint  | 5    | Limit of cash value     |
| Users    | user_id      | int       | 10   | User ID                 | Primary key |
| Users    | first_name   | varchar   | 10   | First name              |
| Users    | last_name    | varchar   | 10   | Last name               |
| Users    | address      | varchar   | 50   | Client address          |
| Users    | phone_num    | varchar   | 15   | Client phone #          |
| Cards    | card_id      | int       | 10   | Card ID                 | Primary key |
| Cards    | card_num     | char      | 16   | Card number             | Unique key  |
| Cards    | pin          | char      | 4    | Card pin #              |
| Accounts | account_num  | int       | 10   | Account #               | Primary key |
| Accounts | balance      | decimal   | 50   | Account balance         |
| Deposit  | trans_id     | int       | 10   | Transaction ID          | Primary key |
| Deposit  | trans_amount | decimal   | 10   | Deposit amount          |
| Deposit  | trans_date   | timestamp |      | Deposit timestamp       |
| Withdraw | trans_id     | int       | 10   | Transaction ID          | Primary Key |
| Withdraw | trans_amount | decimal   | 10   | Withdrawal amount       |
| Withdraw | trans_date   | timestamp |      | Withdrawal timestamp    |
