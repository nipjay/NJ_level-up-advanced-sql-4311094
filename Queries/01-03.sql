--selecting all the records in customer table
SELECT
  c.customerId,
  c.firstName,
  c.lastName,
  s.salesAmount
FROM customer c 
LEFT JOIN sales s
  ON c.customerId = s.customerId
UNION
--selecting the reocrds from sales table which are not connected to customer table
SELECT
  c.customerId,
  c.firstName,
  c.lastName,
  s.salesAmount
FROM sales s 
LEFT JOIN customer c 
ON s.customerId = c.customerId
WHERE firstName IS NULL

