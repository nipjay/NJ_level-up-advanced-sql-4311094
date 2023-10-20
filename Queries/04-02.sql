--Create a report showing sales per month and an annual total

SELECT
  strf
  sum(CASE
    WHEN strftime('%m',soldDate) = '01'
    THEN salesAmount END) Jan,
  sum(CASE
    WHEN strftime('%m',soldDate) = '02'
    THEN salesAmount END) Feb,
  sum(CASE
    WHEN strftime('%m',soldDate) = '03'
    THEN salesAmount END) March,
  sum(CASE
    WHEN strftime('%m',soldDate) = '04'
    THEN salesAmount END) Apr,
  sum(CASE
    WHEN strftime('%m',soldDate) = '05'
    THEN salesAmount END) May,
  sum(CASE
    WHEN strftime('%m',soldDate) = '06'
    THEN salesAmount END) Jun,
  sum(CASE
    WHEN strftime('%m',soldDate) = '0'
    THEN salesAmount END) Jul,
  sum(CASE
    WHEN strftime('%m',soldDate) = '08'
    THEN salesAmount END) Aug,
  sum(CASE
    WHEN strftime('%m',soldDate) = '09'
    THEN salesAmount END) Sep,
  sum(CASE
    WHEN strftime('%m',soldDate) = '10'
    THEN salesAmount END) Oct,
  sum(CASE
    WHEN strftime('%m',soldDate) = '11'
    THEN salesAmount END) Nov,
  sum(CASE
    WHEN strftime('%m',soldDate) = '12'
    THEN salesAmount END) Dec
FROM sales

--correct

WITH cte AS(
  SELECT
    strftime('%Y',soldDate) SoldYear,
    strftime('%m',soldDate) SoldMonth,
    sum(salesAmount) sales
  FROM sales
  GROUP BY SoldYear,SoldMonth)

SELECT
  SoldYear,
  SoldMonth,
  sum(sales) OVER (
    PARTITION BY sales
    ORDER BY SoldYear,SoldMonth) AnnualSales 
FROM cte
ORDER BY SoldYear,SoldMonth

