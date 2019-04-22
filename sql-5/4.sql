CREATE OR REPLACE FUNCTION public.cnt_jid(character varying)
  returns bigint AS
  $BODY$
    SELECT count(*) as cnt
    FROM public.supply
    where jid = $1;
  $BODY$
  LANGUAGE 'sql' VOLATILE;


SELECT *, cnt_jid(id) AS numjid
  FROM public.job
