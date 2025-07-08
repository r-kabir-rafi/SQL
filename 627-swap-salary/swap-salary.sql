-- Write your PostgreSQL query statement below
UPDATE Salary
SET sex= CASE
    when sex= 'm' THEN 'f'
    WHEN sex = 'f' THEN 'm'
END;
     