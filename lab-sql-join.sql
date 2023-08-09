use sakila;

#List the number of films per category.
SELECT c.name AS category, COUNT(f.film_id) AS num_films
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
LEFT JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY num_films DESC;


#Display the first and the last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a ON s.address_id = a.address_id;

#Display the total amount rung up by each staff member in August 2005.

SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_name, 
       SUM(p.amount) AS total_amount
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8
GROUP BY s.staff_id, staff_name
ORDER BY total_amount DESC;

#List all films and the number of actors who are listed for each film.

SELECT f.title AS film_title, COUNT(a.actor_id) AS num_actors
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id
ORDER BY num_actors DESC;

#Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
#List the customers alphabetically by their last names.

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_amount_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name, c.first_name;





