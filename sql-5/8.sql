CREATE OR REPLACE FUNCTION public.count_percent()
  RETURNS TABLE(sid varchar, pid varchar, jid varchar, percents varchar) AS
  $BODY$ 
    declare
     rec RECORD;
     cur_percents CURSOR for
         SELECT public.supply.sid, 
              public.supply.pid, 
              public.supply.jid, 
              round(100 * public.supply.num/public.sum_with_cursor(public.supply.sid, public.supply.pid), 3) as percents
        FROM public.supply  ;        
   BEGIN
  FOR rec IN cur_percents
    LOOP
    sid = rec.sid;
    pid =rec.pid;
    jid = rec.jid;
    percents = cast(rec.percents as varchar)|| '%';
    RETURN next;
  END LOOP;
  END;
  $BODY$
  LANGUAGE 'plpgsql' VOLATILE

SELECT * from public.count_percent();
