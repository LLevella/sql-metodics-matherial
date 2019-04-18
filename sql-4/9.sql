WITH RECURSIVE r AS (
    -- стартовая часть рекурсии (т.н. "anchor")
    SELECT 
        1 AS i, 
        1 AS factorial
    
    UNION 
    
    -- рекурсивная часть 
    SELECT 
        i+1 AS i, 
        factorial * (i+1) as factorial 
    FROM r
    WHERE i < 10
)

SELECT * FROM r;