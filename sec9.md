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







```

