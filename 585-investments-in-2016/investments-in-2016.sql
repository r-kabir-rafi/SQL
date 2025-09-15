-- Write your PostgreSQL query statement below

SELECT  
    ROUND(sum(tiv_2016)::numeric, 2) as tiv_2016
FROM Insurance
WHERE tiv_2015 in 
    (
        SELECT tiv_2015
        from Insurance 
        GROUP BY tiv_2015
        HAVING count(*) >1
    )
AND (lat, lon) in
    (
        SELECT lat, lon
        FROM Insurance 
        GROUP BY lat, lon
        having count(*) = 1
    )
; 