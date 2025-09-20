-- Write your PostgreSQL query statement below

SELECT 
    p.product_id, 
    p.product_name
FROM 
    Product p
LEFT JOIN 
    Sales s
ON 
    p.product_id = s.product_id
GROUP BY
    p.product_id, p.product_name
HAVING
    COUNT(*) FILTER(
        WHERE s.sale_date between '2019-01-01' and '2019-03-31'
    ) > 0
    AND
    COUNT(*) FILTER (
        WHERE s.sale_date < '2019-01-01' OR s.sale_date > '2019-03-31'
    ) = 0
;
    
     
     
     