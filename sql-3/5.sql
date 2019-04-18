SELECT avg(raiting), max(raiting), min(raiting), sum(raiting)
	FROM public.shipper;

SELECT count(sid), count(distinct sid)
	FROM public.supply;