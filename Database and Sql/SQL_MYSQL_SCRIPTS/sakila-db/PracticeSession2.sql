EXPLAIN SELECT * 
FROM actor 
WHERE first_name = 'NICK';

-- EXPLAIN 
-- FROM actor ;

select  table_name,table_rows 
from information_schema.tables
where table_name = 'actor';

explain select * from actor;



-- Find all customers who are from the same country as customer with customer_id = 3 AND have spent more than $100 total. Show full name, country and total amount.


explain Select CONCAT(c.first_name,' ',c.last_name) as customers
 from customer c
 join address a on a.address_id = c.address_id
 join city on city.city_id = a.city_id
 join country on country.country_id = city.country_id
  where country = (SELECT  country.country
from customer c
 join address a on a.address_id = c.address_id
 join city on city.city_id = a.city_id
 join country on country.country_id = city.country_id
  where customer_id = 3);
  
  explain Select CONCAT(c.first_name,' ',c.last_name) as customers
 from customer c
 join address a on a.address_id = c.address_id
 join city on city.city_id = a.city_id
 join country on country.country_id = city.country_id
  where country.country_id = (SELECT  country.country_id
from country
join city using( country_id)
 join address using(city_id)
 join customer using(address_id)
  where customer_id = 3);
  
  
       
 Select CONCAT(c.first_name,' ',c.last_name) as customers
 from customer c
 join address a on a.address_id = c.address_id
 join city on city.city_id = a.city_id
 join country on country.country_id = city.country_id
  where country.country_id = (SELECT country_id from city where city_id = 
															( select city_id from address where address_id = 
																										( select address_id from customer where customer_id = 3)));
                                               


-- Questions
-- Count how many films each category has.
-- Total number of rentals per customer.
-- Total revenue generated (SUM of payments).
-- Average rental rate of films.
-- Number of films per actor.

use sakila;

explain select category_id, count(film_id) as total_films 
from film_category
group by category_id;

explain select customer_id , count(rental_id)
from rental
group by customer_id;

-- Questions
-- Find customers who made more than 10 rentals.
-- Categories with more than 50 films.
-- Actors who acted in more than 20 films.
-- Customers who spent more than $100.

explain 
select customer_id , count(rental_id)
from rental
group by customer_id
having count(rental_id) > 10;

explain select category_id, count(film_id) as total_films 
from film_category
group by category_id
having count(film_id) > 50;

SELECT actor_id , COUNT(film_id) 
FROM film_actor
GROUP BY actor_id
HAVING count(film_id)> 20;

-- Questions
-- Find films with rental rate higher than average.
-- Get customers who never rented anything.
-- Find the most rented film.
-- Find customers who rented more than average rentals.

EXPLAIN ANALYZE
SELECT film_id
FROM film
where rental_rate > ( SELECT AVG(rental_rate) FROM film);

-- -> Filter: (film.rental_rate > (select #2))  (cost=36.3 rows=333) (actual time=0.567..0.906 rows=659 loops=1)
--     -> Table scan on film  (cost=36.3 rows=1000) (actual time=0.153..0.378 rows=1000 loops=1)
--     -> Select #2 (subquery in condition; run only once)
--         -> Aggregate: avg(film.rental_rate)  (cost=203 rows=1) (actual time=0.402..0.402 rows=1 loops=1)
--             -> Table scan on film  (cost=103 rows=1000) (actual time=0.101..0.307 rows=1000 loops=1)

explain 


SELECT c.name , ct.total_films
from (
select category_id, count(film_id) as total_films 
from film_category
group by category_id
having count(film_id) > 50) as ct
join category as c using(category_id);


explain 
SELECT c.name , ct.total_films
from (
select category_id, count(film_id) as total_films 
from film_category
group by category_id
having count(film_id) > 50) as ct
join category as c 
ON c.category_id = ct.category_id
where c.category_id between 50 and 100



-- practce files


SELECT r.rental_id, r.rental_date, c.create_date
FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id
AND r.rental_date > c.create_date;

SELECT 
    p1.payment_id,
    p1.customer_id,
    p1.amount
FROM payment p1
JOIN payment p2
    ON p1.customer_id = p2.customer_id
    AND p1.amount > p2.amount;

ANALYZE TABLE payment;

SELECT category_id, SUM(film_id) over ( partition by category_id) as total_film
from film_category
GROUP BY category_id;

select customer_id,
		payment_id,
		amount, 
        SUM(amount) over (partition by customer_id) as total_spent_by_customer ,
        max(amount) over (partition by customer_id) as largest_payment
from payment;

SELECT 
    p.payment_id,
    p.customer_id,
    p.amount,
    (
        SELECT SUM(amount)
        FROM payment p2
        WHERE p2.customer_id = p.customer_id
    ) AS customer_total
FROM payment p;

select * from payment;

SELECT customer_id,
		payment_id,
        amount,
        SUM(amount) OVER ( partition by customer_id ) as totol,
        SUM(amount) OVER ( partition by customer_id order by payment_date ) as running_totol,
        AVG(amount) OVER ( partition by customer_id ) as average,
		AVG(amount) OVER ( partition by customer_id order by payment_date) as running_average,
        (totol-running_totol) as diff 
	FROM payment;

SELECT
    customer_id,
    payment_id,
    amount,
    total,
    running_total,
    payment_date,
    (total - running_total) AS remaining
FROM (
    SELECT
        customer_id,
        payment_id,
        amount,
        payment_date,
        SUM(amount) OVER (PARTITION BY customer_id) AS total,
        SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS running_total
    FROM payment
) AS window_result;

SELECT customer_id,
		payment_id,
        amount,
        SUM(amount) OVER ( partition by customer_id ) as totol,
        SUM(amount) OVER ( partition by customer_id order by payment_date desc ) as running_totol,
		SUM(amount) OVER ( partition by customer_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) as running_totol,
        SUM(amount) OVER ( partition by customer_id order by payment_date rows between 2 preceding and current row) as last_two_plus_current,
                SUM(amount) OVER ( partition by customer_id order by payment_date desc rows between 2 preceding and current row) as last_two_plus_current
	FROM payment
    where customer_id = 1;




