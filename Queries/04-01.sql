--For each salesperson, rank the car models they've sold the most

WITH cte AS (
  SELECT
    s.employeeId,
    s.inventoryId,
    i.modelId,
    m.model
  FROM sales s 
  INNER JOIN inventory i 
  ON s.inventoryId = i.inventoryId
  INNER JOIN model m 
  ON m.modelId = i.modelId)

SELECT
  e.firstName,
  e.lastName,
  cte.model,
  count(cte.inventoryId) NumberofSales
FROM cte 
INNER JOIN employee e 
ON e.employeeId = cte.employeeId
GROUP BY cte.modelId,cte.employeeId
ORDER BY e.firstName ASC,NumberofSales DESC

  
--Another approach

SELECT
  e.firstName,
  e.lastName,
  m.model,
  count(s.salesId) NumberofSales,
  rank() OVER (PARTITION BY e.employeeId ORDER BY count(s.salesId) DESC) Rank
FROM
  employee e
INNER JOIN sales s 
ON s.employeeId = e.employeeId
INNER JOIN inventory i 
ON i.inventoryId = s.inventoryId
INNER JOIN model m 
ON m.modelId = i.modelId
GROUP BY e.firstName, e.lastName, m.model
ORDER BY e.firstName