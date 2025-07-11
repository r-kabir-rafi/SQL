-- Write your PostgreSQL query statement below

SELECT 
    e.name AS Employee
FROM 
    Employee e
JOIN 
    Employee m
    ON
    m.id = e.managerId
where
    e.salary > m.salary;
    