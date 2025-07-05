-- Write your PostgreSQL query statement below
SELECT
    machine_id, 
    ROUND(AVG(end_t - start_T)::numeric, 3) as processing_time
FROM(
    SELECT 
        machine_id, process_id,
        Max(CASE WHEN activity_type='start' THEN timestamp END) AS start_t,    
        Max(CASE WHEN activity_type='end' THEN timestamp END) AS end_t
    FROM Activity 
    GROUP BY machine_id, process_id
)as times
GROUP BY machine_id;

