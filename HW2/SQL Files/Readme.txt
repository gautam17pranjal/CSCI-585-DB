1. The entity 'case' has been renamed to 'positive_case' in my database. (since case is a keyword).

2. The entity 'healthstatus' has been renamed to 'health_status' in my database. (maintaining uniformity in the naming convention for the entire database).

3. Using postgresSQL for all the query execution.

4. In q1.sql file, you'll find all the 16 queries (8 for the table creation and 8 for populating the data in those table).

5. The query present in q2.sql gives the information about the most self reported symptom. The query groups the symptoms together and calculates the count. Limit 1 will give me maximum count value for this sub-query. Then this maximum count value will be used to get the symptom_id or ids for the most self reported symptom. 
The query was formed in this way so that even if there are multiple symptoms with the same number of reports, all of them will be shown in the query result.

6. The query present in q3.sql gives the information about the sickest floor present in the office. "Sickest" floor is defined as the floor with the maximum no of employees whose status value in the health_status table is 'sick'. 
The Query is getting the max count of the sick employees by joining the employees table with the health_status table and grouping them by floor_num. Then this value is used to get the floor number. Again Limit 1 is used in the sub query instead of the outer most query so as to get all the floors which has the highest number of sick employees.

7. In q4.sql, 4 different queries have been written, i.e. for a given period (between start, end dates), number of scans, number of tests, number of employees who self-reported symptoms, number of positive cases have been calculated. 

8. In q5.sql, I wrote a query which is giving me the status of the employees who are tested negative for COVID. This information can be used by the HR department in collaboration with the medical team to formulate a working strategy to get their employees to better health. As we have seen that practically there are side effects of COVID after the person recovers. These requires specialised care and treatment. Using this data an early specialised care centre for such patients may be setup for these specialised treatment. This will make the employees mentally and physically fit to contribute to their full capacity. Table division is used here. Using the (emp_id and status) in the dividend and (emp_id) in the divisor, the query returns the the (status).