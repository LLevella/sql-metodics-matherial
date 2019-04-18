SELECT actor_id, first_name, last_name, last_update
	FROM public.actor;
	
SELECT actor_id, film_id, last_update
	FROM public.film_actor;
	
SELECT film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext
	FROM public.film;

	
SELECT f.film_id, f.title, description, first_name, last_name
	FROM public.film f
	inner join public.film_actor fa
		on fa.film_id = f.film_id
	inner join public.actor a
		on a.actor_id = fa.actor_id
where f.film_id = 508;
