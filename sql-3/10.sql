SELECT language_id, name, last_update
	FROM public.language;

SELECT count(film_id)
	FROM public.film
	where language_id in (
		SELECT language_id
		FROM public.language
		where name in ('English', 'German'))