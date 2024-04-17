## How to setup and run

There are 3 CTs:
* dbpsql - runs the db
* db-init - a service CT to fill in the DB with data from archive
* pgadmin - frontend web app


`docker-compose up` -- create and run the CTs

`docker-compose down` -- stop and destroy

`docker-compose start dpsql pgadmin` -- start the existing CTs

`docker-compose stop dbpsql pgadmin` -- stop them without deleting


```sql
-- 15
select distinct(rating) from film;

-- 16 how many rows are there?
select count(name) from table;
select count(distinct(rating)) from film;

```