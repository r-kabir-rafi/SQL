SELECT 
    employee_id,
    CASE WHEN (employee_id%2 =1 and name NOT LIKE 'M%') THEN salary ELSE 0 END As bonus
FROM Employees
ORDER BY employee_id ASC;