-- Write your PostgreSQL query statement below

SELECT 
    activity_date as day,
    count(distinct user_id) as active_users
FROM
    Activity
WHERE
    activity_date Between DATE '2019-07-27' - INTERVAL '29 days' AND DATE '2019-07-27'
GROUP BY 
    activity_date;