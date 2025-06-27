-- Write your PostgreSQL query statement below

SELECT 
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(100.0 * poor / total, 2) AS poor_query_percentage
FROM (
    SELECT 
        query_name,
        rating,
        position,
        COUNT(*) OVER (PARTITION BY query_name) AS total,
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) OVER (PARTITION BY query_name) AS poor
    FROM Queries
) AS sub
GROUP BY query_name, poor, total;
