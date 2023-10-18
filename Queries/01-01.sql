SELECT
  emp.firstName EmpFirstName,
  emp.lastName EmpLastName,
  mng.firstName MngFirstName,
  mng.lastName MngLastName
FROM employee emp
INNER JOIN employee mng 
ON emp.managerId = mng.employeeId
  