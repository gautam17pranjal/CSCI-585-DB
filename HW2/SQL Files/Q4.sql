/* DATABASE: postgresSQL */


SELECT Count(Scan_ID) AS Num_Scans FROM Scan
WHERE Scan_Date BETWEEN '2021-10-05' AND '2021-10-10';

SELECT Count(Test_ID) AS Num_Test FROM Test
WHERE Test_Date BETWEEN '2021-10-11' AND '2021-10-14';


SELECT Count(DISTINCT Emp_ID) AS Num_SelfReport FROM Symptom
WHERE Date_Reported BETWEEN '2021-10-05' AND '2021-10-10';


SELECT Count(Test_ID) AS Num_PositiveCase FROM Test
WHERE Test_Date BETWEEN '2021-10-14' AND '2021-10-17' AND 
Test_Result = 'Positive';