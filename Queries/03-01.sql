WITH cte AS (
  SELECT
    strftime('%Y',soldDate) SoldYear,
    salesAmount
  FROM sales)

SELECT
  SoldYear,
  FORMAT('$%.2f',sum(salesAmount)) AnnualSales
FROM cte
GROUP BY SoldYear

WITH cte AS (
  SELECT
    strftime('%Y',soldDate) SoldYear,
    employeeId,
    salesAmount
    --FORMAT('$%.2f',sum(salesAmount)) TotalSales
  FROM sales
  GROUP BY SoldYear)--,employeeId)

SELECT
  SoldYear,
  employeeId,
  FORMAT('$%.2f',sum(cte.salesAmount)) TotalSales
FROM
  cte
GROUP BY employeeId
  
--Correct method👇
WITH cte AS (
  SELECT
    strftime('%Y',soldDate) AS SoldYear,
    employeeId,
    FORMAT('$%.2f', SUM(salesAmount)) AS TotalSales
  FROM sales
  GROUP BY SoldYear, employeeId
)

SELECT SoldYear, employeeId, TotalSales
FROM cte
ORDER BY employeeId
