SELECT 
    d.name as Department, 
    e.name as Employee, 
    e.salary as Salary
FROM Employee e
Join department d
ON e.departmentId = d.id 
WHERE e.salary = (
select max(e.salary)
from employee e
where e.departmentId = d.id
);
