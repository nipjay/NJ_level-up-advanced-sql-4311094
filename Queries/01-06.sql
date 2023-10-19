SELECT
   s.employeeId,
  e.firstName,
  e.lastName,
  count(s.salesId) NumberofSales
FROM sales s
INNER JOIN employee e 
ON s.employeeId = e.employeeId
WHERE soldDate >= Date('now','Start of year')
GROUP BY s.employeeId
HAVING NumberofSales>5