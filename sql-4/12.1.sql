create or replace view vfulladdress as 
(
	SELECT address, address2, district, phone, postal_code, pc.city, pcn.country
	FROM public.address pa
	left outer join public.city pc
		on pa.city_id = pc.city_id
	left outer join public.country pcn
		on pcn.country_id = pc.country_id
);

select * 
from public.vfulladdress
where city = 'Lethbridge';