-- Write your PostgreSQL query statement below


SELECT 
    e.name
FROM 
    Employee e
join (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) as mgr
ON 
    e.id = mgr.managerId;