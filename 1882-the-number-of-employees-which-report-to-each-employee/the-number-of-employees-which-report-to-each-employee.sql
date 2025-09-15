SELECT 
    m.employee_id, 
    m.name , 
    count(e.employee_id) as reports_count, 
    ROUND(avg(e.age)) as average_age
FROM Employees e
join employees m
on e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
order by employee_id, average_age desc;
