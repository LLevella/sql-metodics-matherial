	
SELECT f.title, description, first_name, last_name, count(f.film_id) over(partition by first_name, last_name)
	FROM public.film f
	inner join public.film_actor fa
		on fa.film_id = f.film_id
	inner join public.actor a
		on a.actor_id = fa.actor_id