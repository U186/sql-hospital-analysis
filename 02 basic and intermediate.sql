-- ============================================================
-- FILE: 02_basic_queries.sql
-- PROJECT: Hospital Data Analysis
-- AUTHOR: Ujjwal Jain
-- ============================================================

-- Q: Total number of patients across all hospitals
SELECT SUM(patients_count) AS total_patients
FROM hospital_data;

-- Q: Average number of doctors per hospital
SELECT hospital_name,
       AVG(doctors_count) AS avg_doctors
FROM hospital_data
GROUP BY hospital_name;

-- Q: Show all hospitals located in Delhi
SELECT hospital_name, location
FROM hospital_data
WHERE location = 'Delhi';

-- Q: Find hospitals where doctors count is less than 50
SELECT hospital_name, doctors_count
FROM hospital_data
WHERE doctors_count < 50;

-- Q: Display only hospital name and department
SELECT hospital_name, department
FROM hospital_data;

-- Q: Count total records in the table
SELECT COUNT(*) AS total_records
FROM hospital_data;

-- Q: Show all patients admitted after 1 Jan 2023
SELECT patients_count, admission_date
FROM hospital_data
WHERE admission_date > '2023-01-01';

-- ============================================================
-- FILE: 03_intermediate.sql
-- PROJECT: Hospital Data Analysis
-- AUTHOR: Ujjwal Jain
-- ============================================================

-- Q: Top 3 departments with the highest number of patients
SELECT department,
       SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients DESC
LIMIT 3;

-- Q: Find the total medical expenses per hospital
SELECT hospital_name,
       SUM(medical_expenses) AS total_expense
FROM hospital_data
GROUP BY hospital_name
ORDER BY total_expense DESC;

-- Q: Show the average number of patients per city
SELECT location,
       AVG(patients_count) AS avg_patients_per_city
FROM hospital_data
GROUP BY location;

-- Q: Find the maximum medical expense in each department
SELECT department,
       MAX(medical_expenses) AS max_expense
FROM hospital_data
GROUP BY department
ORDER BY max_expense DESC;

-- Q: List hospitals where patients_count is above the overall average
SELECT hospital_name, patients_count
FROM hospital_data
WHERE patients_count > (
    SELECT AVG(patients_count) FROM hospital_data
);

-- Q: Count how many hospitals exist in each city
SELECT location,
       COUNT(*) AS no_of_hospitals
FROM hospital_data
GROUP BY location;

-- Q: Calculate monthly patient totals
SELECT DATE_TRUNC('month', admission_date) AS month,
       SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY month;
