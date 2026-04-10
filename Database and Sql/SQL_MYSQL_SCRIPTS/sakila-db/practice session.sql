EXPLAIN SELECT * 
FROM actor 
WHERE first_name = 'NICK';

EXPLAIN 
FROM actor ;

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
                                               




 SELECT * from (
  select assigned_to as user_id , coalesce( count(task_id),0) as completed_task,0 as completed_subtask from task where task_status = 'COMPLETED' group by assigned_to
  union all
  SELECT assigned_to AS user_id , 0 as completed_task , coalesce(COUNT(subtask_id),0) as completed_subtask FROM subtask where subtask_status = 'COMPLETED' GROUP BY assigned_to 
  ) as union_of_task_subtask ;
  
  START TRANSACTION;
  
  ALTER TABLE users
  ADD COLUMN user_name VARCHAR(50);
  
  COMMIT;
