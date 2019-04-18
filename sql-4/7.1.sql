INSERT INTO public.country(country)
VALUES ('Россия') 
RETURNING country_id;

update public.country 
set country = 'RUSSIA'
where country_id = 110;

delete from public.country 
where country = 'RUSSIA';