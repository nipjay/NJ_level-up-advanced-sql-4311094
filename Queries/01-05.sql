SELECT
  e.employeeId,
  e.firstName,
  e.lastName,
  min(salesAmount) LeastValued,
  max(salesAmount) HighestValued
FROM
  sales s 
JOIN employee e 
ON s.employeeId = e.employeeId
WHERE s.soldDate >= Date('now','start of year')
GROUP BY e.employeeId