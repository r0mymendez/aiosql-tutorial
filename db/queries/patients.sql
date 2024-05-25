-- name: fn_get_patients_adove_90th_percentile
-- get all the patients that have more visits than the 90th percentile of visits. All this data is stored in encounters table.
WITH patient_visits AS (
    SELECT
        patient,
        COUNT(*) AS visit_count
    FROM
        hospital.encounters
    GROUP BY
        patient
),
percentil_n AS (
    SELECT
        percentile_cont(0.9) WITHIN GROUP (ORDER BY visit_count) AS p_visits
    FROM
        patient_visits
)
SELECT 
    pv.patient, 
    pv.visit_count
FROM 
    patient_visits pv
CROSS JOIN 
    percentil_n  pn
WHERE 
    pv.visit_count >= pn.p_visits;
   

-- name: fn_get_patients_above_n_percentile
-- This query retrieves all patients whose visit count exceeds the nth percentile of all visit counts 
WITH patient_visits AS (
    SELECT
        patient,
        COUNT(*) AS visit_count
    FROM
        hospital.encounters
    GROUP BY
        patient
),
percentil_n AS (
    SELECT
        percentile_cont(:percentil_value) WITHIN GROUP (ORDER BY visit_count) AS p_visits
    FROM
        patient_visits
)
SELECT 
    pv.patient, 
    pv.visit_count
FROM 
    patient_visits pv
CROSS JOIN 
    percentil_n  pn
WHERE 
    pv.visit_count >= pn.p_visits;
   

-- name: fn_get_patients_top_conditions
-- Get patients with top conditions for a given period of time, the patients are sorted by the number of days they had the condition and the source of the data is the hospital schema.
with top_n_conditions as(
SELECT  code, description, COUNT(*) 
     FROM hospital.CONDITIONS 
     GROUP BY  code,description 
     ORDER BY COUNT(*) DESC 
     LIMIT  :num_condition_days
),
top_n_condition_patients as (
SELECT 
    p.ID, 
    p.FIRST, 
    p.LAST, 
    p.CITY, 
    p.GENDER, 
    EXTRACT(YEAR FROM AGE(p.BIRTHDATE)) AS age,
    c.start condition_start_date,
    c.stop condition_stop_date,
    EXTRACT(DAY FROM (c.stop - c.start )) AS condition_days, 
    c.encounter,
    c.code,
    c.description
    from hospital.patients p 
    inner join hospital.conditions c  on c.patient = p.id
    inner join top_n_conditions t on t.code=c.code
)
select * 
    from top_n_condition_patients
    where condition_start_date between :period_start_date and :period_start_end;
