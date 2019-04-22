CREATE OR REPLACE FUNCTION return_int() RETURNS int AS
$$
BEGIN
  RETURN 1;
END
$$ LANGUAGE plpgsql

SELECT return_int();


CREATE OR REPLACE FUNCTION return_setof_int() RETURNS SETOF int AS
$$
BEGIN
  RETURN NEXT 1;
  RETURN NEXT 2;
  RETURN NEXT 3;
  RETURN; -- Необязательный
END
$$ LANGUAGE plpgsql;

select return_setof_int();

CREATE OR REPLACE FUNCTION return_out_int(OUT result1 int, OUT result2 int) AS
$$
BEGIN
  result1 := 1;
  RETURN;
END
$$ LANGUAGE plpgsql;


SELECT * from return_out_int();

CREATE OR REPLACE FUNCTION return_table() RETURNS table(id int, name varchar) AS
$$
BEGIN
  id := 1;
  name := 'name';
  RETURN NEXT;
  RETURN NEXT;
END
$$ LANGUAGE plpgsql;

SELECT * FROM return_table();