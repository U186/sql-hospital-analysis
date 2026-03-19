-- ============================================================
-- FILE: 03_advanced.sql
-- PROJECT: Hospital Data Analysis
-- AUTHOR: Ujjwal Jain
-- DESCRIPTION: Window functions, correlated subqueries, LAG, rankings
-- ============================================================

-- Q: Find the second highest medical expense
SELECT medical_expenses
FROM hospital_data
ORDER BY medical_expenses DESC
LIMIT 1 OFFSET 1;

-- Q: Show top 5 hospitals with longest average patient stay
SELECT hospital_name,
       AVG(discharge_date - admission_date) AS avg_stay_days
FROM hospital_data
GROUP BY hospital_name
ORDER BY avg_stay_days DESC
LIMIT 5;

-- Q: Display hospitals whose expenses are higher than their city average
--    (Correlated Subquery)
SELECT hospital_name, medical_expenses, location
FROM hospital_data h1
WHERE medical_expenses > (
    SELECT AVG(medical_expenses)
    FROM hospital_data h2
    WHERE h2.location = h1.location
);

-- Q: Rank departments by total patients
SELECT department,
       SUM(patients_count) AS total_patients,
       RANK() OVER (ORDER BY SUM(patients_count) DESC) AS dept_rank
FROM hospital_data
GROUP BY department;

-- Q: Assign a rank to hospitals based on total expenses
SELECT hospital_name,
       SUM(medical_expenses) AS total_expense,
       RANK() OVER (ORDER BY SUM(medical_expenses) DESC) AS hospital_rank
FROM hospital_data
GROUP BY hospital_name;

-- Q: Find the running total of patients ordered by admission date
SELECT admission_date,
       SUM(patients_count) OVER (ORDER BY admission_date) AS running_total
FROM hospital_data
ORDER BY admission_date;

-- Q: Show the top hospital in each city based on expenses
--    (PARTITION BY + RANK)
SELECT hospital_name, location, medical_expenses
FROM (
    SELECT hospital_name, location, medical_expenses,
           RANK() OVER (
               PARTITION BY location
               ORDER BY medical_expenses DESC
           ) AS rnk
    FROM hospital_data
) t
WHERE rnk = 1;

-- Q: Find hospitals with expenses greater than their previous record
--    (LAG Window Function)
SELECT hospital_name, medical_expenses
FROM (
    SELECT hospital_name,
           medical_expenses,
           LAG(medical_expenses) OVER (ORDER BY admission_date) AS prev_expense
    FROM hospital_data
) t
WHERE medical_expenses > prev_expense;

-- Q: Show dense rank of departments based on patient totals
SELECT department, total_patients,
       DENSE_RANK() OVER (ORDER BY total_patients DESC) AS dept_rank
FROM (
    SELECT department,
           SUM(patients_count) AS total_patients
    FROM hospital_data
    GROUP BY department
) t;
