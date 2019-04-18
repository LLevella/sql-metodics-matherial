SELECT *
	FROM public.job 
	left outer join public.supply 
	on id = jid;

SELECT *
	FROM public.job 
	right outer join public.supply 
	on id = jid;

SELECT *
	FROM public.job 
	full outer join public.supply 
	on id = jid;
