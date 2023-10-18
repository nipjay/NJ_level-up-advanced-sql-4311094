SELECT
  employeeId,
  firstName,
  lastName,
  title
FROM
  employee
WHERE title = 'Sales Person'
AND employeeId NOT IN
  (SELECT employeeId
  FROM sales);

SELECT
  emp.employeeId,
  emp.firstName,
  emp.lastName,
  emp.title
FROM
  employee emp 
LEFT JOIN sales sls 
ON emp.employeeId  = sls.employeeId
WHERE title = 'Sales Person' AND salesId IS NULL;