--Display the number of sales for each employee by month for 2021

SELECT
  employeeId,
  count(salesId) SalesCount,
  strftime('%m',soldDate) Month
FROM sales
WHERE strftime('%Y',soldDate) = '2021'
GROUP BY Month,employeeId;
