--Find the sales of cars that are electric by using a subquery

SELECT
  sum(s.salesAmount) totalsales,
  count(s.salesId) numberofSales,
  i.modelId ModelID
  --model.model CarModel
FROM sales s 
INNER JOIN inventory i 
ON s.inventoryId = i.inventoryId
WHERE i.modelId IN (
  SELECT modelId
  FROM model m
  WHERE EngineType = 'Electric')
GROUP BY i.modelId
ORDER BY totalsales DESC
