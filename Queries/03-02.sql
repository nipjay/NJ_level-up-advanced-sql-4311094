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

SELECT
  s.employeeId,
  e.firstName,
  e.lastName,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '01'
    THEN salesAmount END) JanuarySales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '02'
    THEN salesAmount END) febSales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '03'
    THEN salesAmount END) MarchSales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '04'
    THEN salesAmount END) AprilSales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '05'
    THEN salesAmount END) MaySales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '06'
    THEN salesAmount END) JuneSales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '07'
    THEN salesAmount END) JulySales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '08'
    THEN salesAmount END) AugustSales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '09'
    THEN salesAmount END) SeptemberSales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '10'
    THEN salesAmount END) OctoberSales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '11'
    THEN salesAmount END) NovemberSales,
  sum(CASE 
    WHEN strftime('%m',soldDate) = '12'
    THEN salesAmount END) DecemberSales
FROM sales s 
INNER JOIN employee e 
ON s.employeeId = e.employeeId
WHERE strftime('%Y',soldDate) = '2021'
GROUP BY s.employeeId
ORDER BY s.employeeId
