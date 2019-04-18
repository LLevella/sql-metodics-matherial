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