-- Beginner — Getting Comfortable with OVER() and PARTITION BY
-- B1. Show each payment row with the total amount that customer has ever paid across all their payments.
-- B2. Show each payment row with the total number of payments that customer has made.
-- B3. Show each film with its rental rate, and also the average rental rate across all films in the same rating category (G, PG, PG-13 etc).
-- (Tables needed: film. Columns: film_id, title, rating, rental_rate)
-- B4. Show each payment with the highest single payment amount that customer has ever made.
-- B5. Show each payment with the lowest single payment amount that customer has ever made, and also the highest — both in the same query.

SELECT * , sum(amount) over ( partition by customer_id ) from payment;

select * , count(payment_id) over ( partition by customer_id) from payment;

select film_id , title, rental_rate , avg(rental_rate) over ( partition by rating ) as average_rental_rate_across_all_films_in_the_same_rating_category
from film;

SELECT * , MAX(amount) over( partition by customer_id) 
from payment;

SELECT * , MAX(amount) over( partition by customer_id) , MIN(amount) over (partition by customer_id)
from payment;

-- Intermediate — ORDER BY Inside OVER(), Frames, Subquery Pattern
-- These introduce running calculations, default frames, and computing on top of window results.
-- I1. Show each payment with a running total of amount for that customer, ordered by payment date.
-- I2. Show each payment with a running count of how many payments that customer has made so far, ordered by payment date.
-- I3. From the results of I1 — show only those rows where the running total has crossed 100 for that customer.
-- (You'll need the subquery/CTE pattern here)
-- I4. Show each payment with the difference between that customer's total spend and their running total at that point — i.e. how much is remaining after this payment.
-- (Subquery pattern)
-- I5. Show each film with its rental rate, the average rental rate for its rating category, and the difference between its rental rate and that category average.
-- (Subquery pattern, uses film table)
-- I6. Show each payment with a 3-payment moving average of amount for that customer ordered by payment date.
-- (Explicit frame needed)

SELECT * , sum(amount) over ( partition by customer_id order by payment_date) AS running_total
from payment;

SELECT * , 
		COUNT(PAYMENT_ID) over ( partition by customer_id
								order by payment_date 
                                rows between unbounded preceding AND current row ) 
from payment;


SELECT * 
FROM (
SELECT * , sum(amount) over ( partition by customer_id order by payment_date) AS running_total
from payment) as running_total_table
where running_total > 100;

select * , (total - running_total ) as remaining_payment 
from (
       SELECT * , 
		sum(amount) over ( partition by customer_id ) AS total,
       sum(amount) over ( partition by customer_id order by payment_date) AS running_total
from payment) as running_total_table;

select * , (rental_rate - average_rental_rate_across_all_films_in_the_same_rating_category  ) as diff 
from (
		select film_id , title, rental_rate , avg(rental_rate) over ( partition by rating ) as average_rental_rate_across_all_films_in_the_same_rating_category
from film ) as avg_rental;


SELECT * , 
        avg(amount) over ( partition by customer_id 
        order by payment_date 
        rows between 3 preceding and current row 
        ) AS average_running 
from payment;
