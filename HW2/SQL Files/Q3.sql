/* DATABASE: postgresSQL */

SELECT e.Floor_Num AS fl FROM Employee e INNER JOIN Health_Status h 
ON e.Emp_ID = h.Emp_Id
WHERE h.Status = 'Sick'
GROUP BY e.floor_num
HAVING Count(e.emp_id) = (
    SELECT Count(e.emp_Id) AS c 
    FROM Employee e INNER JOIN Health_Status h
    ON e.Emp_ID = h.Emp_Id
    WHERE h.Status = 'Sick'
    GROUP BY e.Floor_Num
    ORDER BY c desc
    LIMIT 1
);


