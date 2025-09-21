-- Write your PostgreSQL query statement below

SELECT 
    sell_date,
    count(distinct product) as num_sold,
    string_agg(distinct product, ',' order by product) as products
from 
    Activities
GROUP BY
    sell_date
ORDER BY 
    sell_date;