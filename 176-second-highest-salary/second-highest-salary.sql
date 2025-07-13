-- Write your PostgreSQL query statement below


SELECT max(salary) As SecondHighestSalary FROM Employee
WHERE salary  <  (SELECT max(salary) FROM Employee)