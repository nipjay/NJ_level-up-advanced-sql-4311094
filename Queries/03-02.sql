--Display the number of sales for each employee by month for 2021

SELECT
  s.employeeId,
  e.firstName,
  e.lastName,
  count(salesId) SalesCount,
  FORMAT('$%.2f',sum(salesAmount)) TotalSales,
  strftime('%m',soldDate) Month
FROM sales s 
JOIN employee e 
ON s.employeeId = e.employeeId
WHERE strftime('%Y',soldDate) = '2021'
GROUP BY Month,s.employeeId;

--using CASE statement


