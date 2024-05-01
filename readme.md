## How to setup and run

There are 3 CTs:
* dbpsql - runs the db
* db-init - a service CT to fill in the DB with data from archive
* pgadmin - frontend web app


`docker-compose up` -- create and run the CTs

`docker-compose down` -- stop and destroy

`docker-compose start dbpsql pgadmin` -- start the existing CTs

`docker-compose stop dbpsql pgadmin` -- stop them without deleting


```sql
-- 15
select distinct(rating) from film;

-- 16 how many rows are there?
select count(name) from table;
select count(distinct(rating)) from film;

-- 20 order by different columns (makes sense when there are duplicates) in different orders
select store_id, first_name, last_name from customer
order by store_id desc, last_name asc;

-- 20 order by a column that is not selected
select first_name, last_name from customer
order by store_id desc, last_name asc;

-- 22 award first 10 paying customers
select customer_id from payment
where amount != 0
order by payment_date asc,amount desc
limit 10;

-- top 5 shortest movies
select title, length from film
order by length
limit 5;

-- 23 BETWEEN is inclusive on both sides
-- for exlusive - use x>low AND x<high
-- BETWEEN can be used with dates
-- they should be in ISO 8601 format which is YYYY-MM-DD
select * from payment where payment_date between '2007-02-13' and '2007-02-15';

-- 24 IN -- rating is G or R
select * from film where rating in ('G', 'R');

-- 25 LIKE (case-sens) and ILIKE (case-insens)
-- % is a wildcard character, _ is for 1 symbol
-- get all customers whose name ends with 'a'
select * from customer where first_name like '%a';
select * from customer where first_name like '_ar%a' ; -- "Barbara" "Maria" "Martha" "Sara" "Carla" "Tara" "Marcia"
-- postgres supports regex!

-- 26 how many distinct districts are customers from
select count(distinct(district)) from address;

-- 28 aggregates - only in select and having clauses
select  min(replacement_cost), max(replacement_cost) from film;
select  round(avg(replacement_cost), 2) from film;



```