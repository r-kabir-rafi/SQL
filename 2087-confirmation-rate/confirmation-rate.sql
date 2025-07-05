-- Write your PostgreSQL query statement below


SELECT 
    s.user_id,
    round(
        CASE
            WHEN COUNT(c.action) = 0 THEN 0
                ELSE 1.0 * SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / 
                COUNT(c.action)END, 2) AS confirmation_rate
FROM 
    Signups s
LEFT JOIN
    Confirmations c
    on s.user_id = c.user_id
GROUP BY s.user_id;