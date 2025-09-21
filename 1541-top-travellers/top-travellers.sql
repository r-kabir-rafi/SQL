-- Write your PostgreSQL query statement below

SELECT 
    u.name as name,
    coalesce(sum(r.distance),0) as travelled_distance
FROM
    Users u
LEFT Join
    Rides r
on
    u.id = r.user_id
GROUP BY 
    u.name, u.id
ORDER BY 
    travelled_distance desc,
    name asc;