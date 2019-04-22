CREATE OR REPLACE FUNCTION return_products() RETURNS SETOF products AS
$$
  SELECT * FROM products
$$ LANGUAGE sql;

SELECT * FROM  return_products();