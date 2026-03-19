-- ============================================================
-- FILE: 01_table_setup.sql
-- PROJECT: Hospital Data Analysis
-- AUTHOR: Ujjwal Jain
-- ============================================================

CREATE TABLE hospital_data (
    hospital_name    TEXT,
    location         TEXT,
    department       TEXT,
    doctors_count    INT,
    patients_count   INT,
    admission_date   DATE,
    discharge_date   DATE,
    medical_expenses NUMERIC
);

-- Verify load
SELECT * FROM hospital_data LIMIT 10;
