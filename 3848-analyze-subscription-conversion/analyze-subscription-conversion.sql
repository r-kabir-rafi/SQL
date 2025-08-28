SELECT 
    user_id,
    ROUND(AVG(case when activity_type = 'free_trial' THEN activity_duration end):: numeric, 2) as trial_avg_duration,
    ROUND(AVG(CASE WHEN activity_type = 'paid' THEN activity_duration END)::numeric, 2)  as paid_avg_duration
FROM UserActivity
GROUP BY user_id
HAVING COUNT(CASE WHEN activity_type = 'free_trial' THEN 1 END) > 0
   AND COUNT(CASE WHEN activity_type = 'paid' THEN 1 END) > 0
ORDER BY user_id;

