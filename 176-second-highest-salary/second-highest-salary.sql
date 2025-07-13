-- Write your PostgreSQL query statement below

/*
SELECT max(salary) As SecondHighestSalary FROM Employee
WHERE salary  <  (SELECT max(salary) FROM Employee)
*/


WITH first_max As(
    SELECT max(salary) as m
    FROM Employee
)
SELECT max(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (Select m from first_max);