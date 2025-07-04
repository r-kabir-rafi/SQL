-- Write your PostgreSQL query statement below

SELECT 
    machine_id,
    ROUND(AVG(end_t - start_t)::numeric, 3) AS processing_time
FROM(
    SELECT 
        machine_id,
        process_id, 
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) as start_t,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) as end_t
    FROM 
        Activity a
    GROUP BY
        a.machine_id, a.process_id
) as times
GROUP BY 
    machine_id;