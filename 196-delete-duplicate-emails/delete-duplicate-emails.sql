-- Write your PostgreSQL query statement below
/*
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);
*/

DELETE FROM person p1 USING Person p2
WHERE p1.email = p2.email
  AND p1.id > p2.id;