/* =============================================================================
Phase 3: Fraud Detection 
Description: Utilizing CTEs and Window Functions to compare internal employee
scores against independent auditor scores. This query isolates corrupt 
officials who falsely logged contaminated wells as "Clean".
=============================================================================
*/

WITH Incorrect_records AS (
    SELECT
        auditorRep.location_id,
        visitsTbl.record_id,
        Empl_Table.employee_name,
        auditorRep.true_water_source_score AS auditor_score,
        wq.subjective_quality_score AS employee_score
    FROM auditor_report AS auditorRep
    JOIN visits AS visitsTbl
        ON auditorRep.location_id = visitsTbl.location_id
    JOIN water_quality AS wq
        ON visitsTbl.record_id = wq.record_id
    JOIN employee as Empl_Table
        ON Empl_Table.assigned_employee_id = visitsTbl.assigned_employee_id
    WHERE 
        visitsTbl.visit_count = 1 
        AND auditorRep.true_water_source_score != wq.subjective_quality_score
),
error_count AS (
    SELECT
        employee_name,
        COUNT(employee_name) AS number_of_mistakes
    FROM Incorrect_records
    GROUP BY employee_name
)
SELECT 
    employee_name, 
    number_of_mistakes
FROM 
    error_count
WHERE 
    number_of_mistakes > (SELECT AVG(number_of_mistakes) FROM error_count)
ORDER BY 
    number_of_mistakes DESC;