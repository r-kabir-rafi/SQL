-- Write your PostgreSQL query statement below

SELECT p.product_name , SUM(o.unit) AS unit
FROM Orders o
LEFT JOIN Products p
    ON p.product_id = o.product_id
WHERE o.order_date between '2020-02-01' and '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100

;