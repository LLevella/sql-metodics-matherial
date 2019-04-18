SELECT sid, pid, jid, num, sw
	FROM public.supply
	inner join (
		SELECT id, sum(weight) as sw
		FROM public.products
		group by id
	) as p
	on p.id = pid
 where sid = 'S1';
 
 
WITH sumprod(id, sumwieght) 
as (
	SELECT id, sum(weight) as sw
	FROM public.products
	group by id
 )		
 SELECT sid, pid, jid, num, sumwieght
	FROM public.supply
	inner join sumprod
	on id = pid
 where sid = 'S1';
