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

  