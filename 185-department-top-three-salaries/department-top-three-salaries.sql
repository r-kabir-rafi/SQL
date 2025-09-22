Select
    d.name as Department,
    e.name as Employee,
    e.salary as Salary 
FROM (
    SELECT 
    e.*,
    DENSE_RANK() OVER(PARTITION BY departmentID ORDER BY salary desc) as rank_num
    FROM Employee e
) e

LEFT JOIN Department d
on e.departmentId = d.id
where rank_num <=3;