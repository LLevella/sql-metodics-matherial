CREATE OR REPLACE FUNCTION return_cursor_job() RETURNS refcursor AS
$$
DECLARE
  _result CONSTANT refcursor := '_result';
BEGIN
  OPEN _result FOR SELECT * FROM public.job;
  RETURN _result;
END
$$ LANGUAGE plpgsql;

BEGIN;
SELECT * FROM return_cursor_job();
FETCH ALL FROM _result;
COMMIT;
SELECT * FROM return_cursor_job();
FETCH ALL FROM _result;
