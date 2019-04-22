 CREATE OR REPLACE FUNCTION public.sum_with_cursor(varchar, varchar)
     RETURNS numeric AS
   $BODY$
   DECLARE
  shipper_id ALIAS FOR $1;
  product_id ALIAS for $2;
  --объявляем курсор
  crs_sum CURSOR FOR 
        SELECT pid, num
        FROM public.supply
        where supply.sid = shipper_id;
  --объявляем нужные нам переменные
  pid_cur varchar;
  shipper_num integer;
  shipper_sum integer;
   BEGIN
    shipper_sum:=0;
    OPEN crs_sum;--открываем курсор
    LOOP --начинаем цикл по курсору
    --извлекаем данные из строки и записываем их в переменные
    FETCH crs_sum INTO pid_cur, shipper_num;
    --если такого периода и не возникнет, то мы выходим
    IF NOT FOUND THEN EXIT;
    END IF;
  IF pid_cur = product_id then
    shipper_sum = shipper_sum  + shipper_num;
  END IF;
     END LOOP;--заканчиваем цикл по курсору
     CLOSE crs_sum; --закрываем курсор
    RETURN shipper_sum;--возвращаем результат
   END;
   $BODY$
     LANGUAGE 'plpgsql' volatile;

SELECT *, sum(num) over (partition by sid, pid), public.sum_with_cursor(sid, pid) 
from supply;
