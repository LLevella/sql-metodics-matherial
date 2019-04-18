WITH RECURSIVE r AS (
    -- стартовая часть рекурсии (т.н. "anchor")
    SELECT 
        2 AS i, 
		1 AS fn_2,
		1 AS fn_1,		
        2 AS fn
    
    UNION 
    
    -- рекурсивная часть 
    SELECT 
        i+1 AS i, 
		fn_1 AS fn_2,
		fn AS fn_1,	
        fn_2 + fn_1 AS fn
    FROM r
    WHERE i < 15
)

SELECT i, fn FROM r;