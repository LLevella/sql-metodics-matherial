SELECT *
	FROM public.actor;

alter table public.actor
	alter column last_name set not null;
	
alter table public.actor
	rename column first_name TO FN;

SELECT *
	FROM public.actor;
	