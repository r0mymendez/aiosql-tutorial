-- name: fn_create_survey_table#
CREATE TABLE HOSPITAL.VISIT_SURVEY(
    ID SERIAL PRIMARY KEY,
    PATIENT_ID VARCHAR(50),
    SURVEY_DATE TIMESTAMP,
    RATING INT,
    COMMENTS TEXT,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- name: fn_add_one_visit_survey<!
insert into HOSPITAL.VISIT_SURVEY(PATIENT_ID,SURVEY_DATE,RATING,COMMENTS) 
    values (:patient_id, :survey_date, :rating,:comments) returning ID;

-- name: fn_add_many_visit_survey*!
insert into HOSPITAL.VISIT_SURVEY(PATIENT_ID,SURVEY_DATE,RATING,COMMENTS) 
    values (:patient_id, :survey_date, :rating ,:comments) returning ID;

-- name: fn_get_visit_survey
SELECT * FROM HOSPITAL.VISIT_SURVEY;