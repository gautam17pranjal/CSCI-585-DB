/* DATABASE: postgresSQL */


SELECT DISTINCT t1.Status FROM (
	SELECT Emp_ID, Status from Health_Status) as t1 INNER JOIN (
	SELECT Emp_ID from Test 
	WHERE Test_Result = 'Negative') as t2
	ON t1.Emp_ID = t2.Emp_ID;






