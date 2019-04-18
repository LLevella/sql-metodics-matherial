SELECT color, id, name, weight, city
	FROM public.products;
	
SELECT id, name, avg(weight)
 	FROM public.products
group by id, name;

SELECT *
 	FROM public.supply 
 	inner join (
 		SELECT id, name, avg(weight)
 			FROM public.products
 		group by id, name 
	) as pp
on pp.id = pid;

select * 
	from public.supply 
where pid in ( 
		select id 
			from  public.products 
		where city = 'Лондон');

select * 
	from public.supply 
where num > ( select avg(num) from public.supply )


	
	