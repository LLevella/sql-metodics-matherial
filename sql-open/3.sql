with flycnt as (
select 
         book_ref,
         book_date, 
         total_amount/max(total_amount) 
              over ( -- определяет, как нужно разделить строки запроса для обработки оконной функцией
                  partition by  date_trunc('day', book_date) -- указывает, что строки нужно разделить по группам или разделам, объединяя в соответствии с указанным в нём выражением
              ) as pcnt 
from bookings.bookings
where book_date between '2016-09-20 00:00:00' and '2016-09-27 23:59:59'
), 
topflyers as (
	select book_ref,
          book_date, 
          pcnt, 
         row_number() over(partition by  date_trunc('day', book_date) order by pcnt) as top
	from flycnt
) 
select * from topflyers where top <= 5