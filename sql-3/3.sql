SELECT *
	FROM public.language;

SELECT *
	FROM public.film;


SELECT film_id, title, description, release_year, ulang.language_id, ulang.name
	FROM public.film ufilm
	inner join public.language ulang
	on ulang.language_id = ufilm.language_id;

