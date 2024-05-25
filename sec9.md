```sql

-- 60 - data types
-- bool, char/varchar/text, int/float, date/time/timestamp/interval
-- UUID, array, JSON, hstore (k-v pair), network addr, geometric

-- sequence - SERIAL 

-- 61 - PK and FK

-- 62 - constrains

-- table VS column - level
-- NOT NULL, UNIQUE, PK, FK
-- CHECK (ensures that all values satisfy a certain condition)
-- EXCLUSION (O_o not all comparisons of 2 rows will return True)

-- table -- also CHECK and REFERENCES (must exist there)
-- UNIQUE on several columns

-- 63 CREATE table
-- PK should be SERIAL (only PK in the table where it is primary)

CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
)

-- 64 - INSERT
INSERT INTO account(username, password, email, created_on)
VALUES
('Joe', 'pass', 'qwe@qew.com', CURRENT_TIMESTAMP)

INSERT INTO account(username, password, email, created_on)
VALUES
('Jill', 'pass1', 'qwe1@qew.com', CURRENT_TIMESTAMP),
('Jake', 'pass2', 'qwe2@qew.com', CURRENT_TIMESTAMP),
('Juke', 'pass3', 'qwe3@qew.com', CURRENT_TIMESTAMP)

INSERT INTO job(job_name)
VALUES
('Qqweqwe'),
('Foo'),
('Barr')

SELECT * FROM account inner join account_job 
on account.user_id = account_job.user_id
inner join job on
account_job.job_id = job.job_id

-- 65 - UPDATE
-- general syntax
UPDATE table 
SET col1 = val1, col2 = val2, ...
WHERE condition -- optional

-- update based on another col in the same table
UPDATE account
SET last_login = created_on

-- update and join - using a col from another table
UPDATE tableA SET orig_col = tableB.new_col
FROM tableB 
WHERE tableA.id = tableB.id

-- return affected rows
UPDATE account
SET last_login = created_on
RETURNING account_id, last_login

update account_job
set hire_date = account.created_on
from account
where account_job.user_id = account.user_id

-- 66 - DELETE
DELETE FROM table
WHERE row_id = 1

-- or - delete rows based on their presence in other tables
DELETE FROM tableA
USING tableB
WHERE tableA.id = tableB.id

-- delete all rows
DELETE FROM table

-- 67 - ALTER clause:
-- add/drop/rename cols
-- change cols data type
-- set default vals to col
-- add CHECK constraints
-- rename table

ALTER TABLE table_name some_action

-- add a col
ALTER TABLE table_name
ADD COLUMN new_col TYPE 
-- alter constrains
ALTER TABLE table_name
ALTER COLUMN col_name
SET NOT NULL

ALTER TABLE table_name
ALTER COLUMN col_name
DROP NOT NULL

ALTER TABLE info
RENAME TO new_info

ALTER TABLE new_info
RENAME COLUMN person TO people

-- 68 DROP table






```

