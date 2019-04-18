SELECT sid, pid, jid, num, color, id, name, weight, city
	FROM public.supply 
	join public.products 
	on True
	
SELECT sid, pid, jid, num, color, id, name, weight, city
	FROM public.supply 
	cross join public.products;