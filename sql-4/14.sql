1 ====
select film.title, actor.first_name||' '||actor.last_name, count(film_id) over(partition by actor_id) as films_cnt 
from film 
join film_actor 
using (film_id)
join actor
using (actor_id)

select customer.first_name||' '||customer.last_name, film.title, avg(payment.amount) over(partition by customer.customer_id) 
from customer 
join payment
using(customer_id)
join rental
using(rental_id)
join inventory
using(inventory_id)
join film
using(film_id)

2 ====
with staff_rental as  (
select staff.first_name|| ' ' || staff.last_name as fio, rental_id
from staff
join rental
using(staff_id)
)
select fio, count(rental_id)
from staff_rental
group by fio

with c_category as (
select category_id, name
from category
where category."name" ilike 'c%'
)
select title, name
from c_category
join film_category
using(category_id)
join film 
using(film_id)
3 ===
with recursive factorial as(
 select 1 as n, 1 as fn
 union all
 select n+1 as n, fn*(n+1) as fn
 from factorial
 where n < 10
)
select * from factorial

with recursive fibbonacy as (
select 0 as cur, 0 as fc, 1 as fn
union all
select cur+1 as cur, fn as fc, fn + fc as fn
from fibbonacy
where cur < 10
)
select * from fibbonacy

-- Здесь должен появиться вопрос: для чего нам нужны рекурсии:
-- с помощью рекурсивных запросов можно добиваться значительного прироста производительности 
-- по сравнению с использованием временных таблиц и хранимых процедур.

WITH RECURSIVE r AS (
   SELECT id, parent_id, name
   FROM geo
   WHERE parent_id = 4
   UNION
   SELECT geo.id, geo.parent_id, geo.name
   FROM geo
      JOIN r
          ON geo.parent_id = r.id
)
SELECT * FROM r;
--Еще пример. Можно, например выдать всё, что относится к Европе вместе с самой Европой, и еще посчитать уровень вложенности
WITH RECURSIVE r AS (
   SELECT id, parent_id, name, 1 AS level
   FROM geo
   WHERE id = 4
   UNION ALL
   SELECT geo.id, geo.parent_id, geo.name, r.level + 1 AS level
   FROM geo
      JOIN r
          ON geo.parent_id = r.id
)
SELECT * FROM r;

-- вы недавно изучали подзапросы и тут должно рассказать о том, как рекурсивные cte ведут себя с подзапросами... 
-- однако рассказывать особенно нечего, поскольку подзапросы, как и множественные ссылки на самого себя - запрещены

WITH RECURSIVE r AS (
   SELECT id, parent_id, name
   FROM geo
   WHERE parent_id = 4
   UNION
   SELECT id, parent_id
   FROM geo
   WHERE parent_id IN (
      SELECT id FROM r
   )
)
SELECT * FROM r;

4 ====
CREATE OR REPLACE VIEW public.custrent
AS WITH r AS (
         SELECT rental.rental_id,
            rental.rental_date,
            rental.inventory_id,
            rental.customer_id,
            rental.return_date,
            rental.staff_id,
            rental.last_update,
            row_number() OVER (PARTITION BY rental.customer_id ORDER BY rental.rental_date DESC) AS rnum
           FROM rental
        )
 SELECT c.first_name,
    c.last_name,
    c.email,
    film.title
   FROM r
     JOIN customer c USING (customer_id)
     JOIN inventory USING (inventory_id)
     JOIN film USING (film_id)
  WHERE r.rnum = 1;
  
 CREATE OR REPLACE VIEW public.fa
AS SELECT actor.first_name,
    actor.last_name,
    film.title,
    count(film.film_id) OVER (PARTITION BY actor.actor_id) AS cnt
   FROM film
     JOIN film_actor USING (film_id)
     JOIN actor USING (actor_id)
5 === 
CREATE MATERIALIZED VIEW public.custrentmat
TABLESPACE pg_default
AS WITH r AS (
         SELECT rental.rental_id,
            rental.rental_date,
            rental.inventory_id,
            rental.customer_id,
            rental.return_date,
            rental.staff_id,
            rental.last_update,
            row_number() OVER (PARTITION BY rental.customer_id ORDER BY rental.rental_date DESC) AS rnum
           FROM rental
        )
 SELECT c.first_name,
    c.last_name,
    c.email,
    film.title
   FROM r
     JOIN customer c USING (customer_id)
     JOIN inventory USING (inventory_id)
     JOIN film USING (film_id)
  WHERE r.rnum = 1
WITH NO DATA;
REFRESH MATERIALIZED VIEW avrent;

CREATE MATERIALIZED VIEW public.avrent
TABLESPACE pg_default
AS SELECT category.name,
    avg(film.rental_duration) AS avg_rental
   FROM film
     JOIN film_category USING (film_id)
     JOIN category USING (category_id)
  GROUP BY category.name
WITH NO DATA;

