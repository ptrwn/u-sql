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

-- 29 GROUP BY must go right after FROM or WHERE 
-- in the SELECT, columns must either have an aggregate func, 
-- or be in the GROUP BY

select company, division, sum(sales) from finances
where division in ('marketing', 'transport')
group by company, division
order by sum(sales);

-- select customer's id and count number of records we have for it
select customer_id, count(customer_id) from payment group by customer_id;

-- get top payers
select customer_id, sum(amount) from payment 
group by customer_id
order by sum(amount) desc;

select customer_id, staff_id, sum(amount) from payment
group by staff_id, customer_id
order by staff_id, customer_id, sum(amount) desc;

-- extract date from timestamp, then group by it
select date(payment_date), sum(amount) from payment
group by date(payment_date)
order by sum(amount)

-- which staff member hadnled the most payments?
select staff_id, count(staff_id) from payment
group by staff_id;

-- average replacement cost per rating
select round(avg(replacement_cost), 3), rating
from film 
group by rating;

-- award top 5 paying customers with coupons
select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc
limit 5;

-- HAVING - to filter after(!) an aggregation
select company, sum(sales) from finances
where company != 'Google' 
group by company
having sum(sales) > 1000;

select customer_id, sum(amount) from payment
where customer_id not in (184, 87, 477)  -- it's ok to put customer_id into where, because we do not aggregate by it
group by customer_id
having sum(amount) > 170  -- we aggregate - sum - by amount, so it goes to having
order by sum(amount) desc;


select customer_id, count(payment_id) from payment
group by customer_id
having count(payment_id) >= 40;

select sum(amount), customer_id from payment
where staff_id = 2
group by customer_id
having sum(amount) > 100;

select sum(amount), customer_id from payment
where staff_id = 2
group by customer_id
having sum(amount) > 100;

-- 35 
select sum(amount), customer_id from payment
where staff_id = 2
group by customer_id
having sum(amount) >= 110

select count(*) from film where title like 'J%'

select * from customer
where first_name like 'E%'
and address_id < 500
order by customer_id desc;



```