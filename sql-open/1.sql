with fct as ( -- Обобщенное табличное выражение
	select  -- извлечение данных
             count(flight_id) as flight_count, -- агрегатная функция - счетчик
             departure_airport as airport_code -- псевдоним результирующего столбца
	from bookings.flights -- таблица-источник данных
	where actual_departure between '2016-09-20 00:00:00' and '2016-09-27 23:59:59'
	group by departure_airport -- определяет, как строки будут группироваться
	order by flight_count desc -- упорядочивание строк
	limit 5 -- не более 5 строк 
)
select airport_code, airport_name, city, flight_count
from bookings.airports
inner join fct -- внутреннее соединение таблиц - источников
using (airport_code) -- условие соединения (аналог on )