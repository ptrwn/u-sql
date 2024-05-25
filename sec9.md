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


```

