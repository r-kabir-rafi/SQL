
SELECT s.name
FROM SalesPerson s
where s.sales_id not in(
SELECT sales_id
FROM Orders o
left join company c
on o.com_id = c.com_id
where c.name = 'RED'
);

