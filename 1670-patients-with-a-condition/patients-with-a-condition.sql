-- Write your PostgreSQL query statement below

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE
    EXISTS( SELECT 1 FROM
                unnest(string_to_array(conditions, ' ')) AS cond
                WHERE cond LIKE 'DIAB1%');
