/* DATABASE: postgresSQL */

SELECT Symptom_ID FROM Symptom
GROUP BY Symptom_ID
HAVING Count(Row_ID) = (
	SELECT COUNT(Row_ID) AS Symptom_Count FROM Symptom 
	GROUP BY Symptom_ID
	ORDER BY Symptom_Count DESC
	LIMIT 1
);