SELECT
  s.employeeId,
  e.firstName,
  e.lastName,
  count(s.salesId) NumberofSales,
  SUM(s.salesAmount) TotalSalesAmount
FROM
  sales s
INNER JOIN employee e 
ON s.employeeId = e.employeeId
GROUP BY s.employeeId
ORDER BY TotalSalesAmount DESC;