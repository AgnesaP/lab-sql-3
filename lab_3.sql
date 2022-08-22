
USE sakila;

-- 1.How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT a.last_name) FROM sakila.actor AS a;

-- 2.In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT f.language_id) FROM sakila.film AS f ;

-- 3.How many movies were released with "PG-13" rating?
SELECT COUNT(distinct f.film_id) AS released_movies FROM sakila.film AS f
WHERE rating = 'PG-13'; 

-- 4.Get 10 the longest movies from 2006.
SELECT * FROM sakila.film AS f 
WHERE f.release_year = 2006
ORDER BY f.length DESC 
LIMIT 10; 

-- 5.How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date),min(rental_date))as company_days from rental;

-- 6.Show rental info with additional columns month and weekday. Get 20.
 
 SELECT *, MONTHNAME(rental_date) AS rental_month, DAYOFWEEK(rental_date) AS rental_weekday FROM rental;
 
-- 7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, MONTHNAME(rental_date) AS rental_month, DAYOFWEEK(rental_date) AS rental_weekday, 
CASE WHEN DAYOFWEEK(rental_date) IN (1,7) THEN 'Weekend' ELSE 'Weekday' END day_type
 FROM rental;

-- 8.How many rentals were in the last month of activity?
SELECT COUNT(DISTINCT rental_id) rentals, EXTRACT(year_month FROM rental_date) AS  last_month_of_activity FROM rental AS r 
GROUP BY last_month_of_activity
HAVING last_month_of_activity = (SELECT MAX(EXTRACT(year_month FROM rental_date)) FROM rental);
















