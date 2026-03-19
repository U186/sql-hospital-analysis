# 🏥 SQL Project – Hospital Data Analysis

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-4479A1?style=flat-square&logo=postgresql&logoColor=white)
![Tool](https://img.shields.io/badge/Tool-pgAdmin-336791?style=flat-square)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)
![Domain](https://img.shields.io/badge/Domain-Healthcare%20Analytics-red?style=flat-square)

## 📌 Project Overview

This project independently designs and analyzes a hospital dataset using **PostgreSQL** to generate insights on patient volumes, department performance, medical expenses, and hospital efficiency.

The goal: apply SQL to a **healthcare domain** — demonstrating that data analysis skills transfer across industries.

---

## 🗂️ Dataset

| Field | Detail |
|---|---|
| **Created by** | Self-designed dataset |
| **Key Columns** | hospital_name, location, department, doctors_count, patients_count, admission_date, discharge_date, medical_expenses |
| **Domain** | Healthcare / Hospital Management |

---

## ❓ Business Questions Answered

### 📊 Basic Hospital Metrics
- What is the total number of patients across all hospitals?
- What is the average number of doctors per hospital?
- Which hospitals are located in Delhi?
- How many total records exist in the dataset?

### 🏢 Department & City Analysis
- Which top 3 departments have the highest patient count?
- How many hospitals exist in each city?
- What is the average number of patients per city?
- Which department has the maximum medical expense?

### 💰 Expense Analysis
- What is the total medical expense per hospital?
- Which hospitals have expenses higher than their city's average?
- Find the second highest medical expense
- Which hospitals have patient counts above the overall average?

### 📅 Time-Based Analysis
- Show all patients admitted after January 2023
- Calculate monthly patient totals
- Show the top 5 hospitals with the longest average patient stay

### 🏆 Advanced Window Analysis
- Rank hospitals by total medical expenses
- Show dense rank of departments by patient totals
- Find the running total of patients ordered by admission date
- Show the top hospital in each city based on expenses
- Find hospitals with expenses greater than their previous record (LAG)

---

## 🧠 SQL Concepts Used

| Concept | Examples Used |
|---|---|
| **Aggregations** | SUM, AVG, COUNT, MAX |
| **GROUP BY / ORDER BY** | Revenue by hospital, department rankings |
| **WHERE / Subqueries** | Above-average filters, city-wise comparisons |
| **Window Functions** | RANK(), DENSE_RANK(), LAG(), running totals |
| **Date Functions** | DATE_TRUNC, admission/discharge duration calc |
| **Correlated Subqueries** | Hospitals above city-level average expense |
| **PARTITION BY** | Top hospital per city |

---

## 📁 File Structure

```
sql-hospital-analysis/
│
├── README.md
├── queries/
│   ├── 01_table_setup.sql        -- Table creation
│   ├── 02_basic_queries.sql      -- Basic filters and counts
│   ├── 03_intermediate.sql       -- Aggregations and city analysis
│   └── 04_advanced.sql           -- Window functions, LAG, rankings
```

---

## 💡 Key Insights Found

1. **Cardiology** and **Orthopaedics** departments consistently had the highest patient volumes
2. **Delhi** had the highest number of hospitals in the dataset
3. A correlated subquery revealed several hospitals charging above their city's average — useful for auditing
4. Running total analysis showed patient admissions peak mid-year
5. LAG function identified hospitals with sudden expense spikes compared to previous records

---

## 🛠️ How to Run

1. Install [PostgreSQL](https://www.postgresql.org/download/) and [pgAdmin](https://www.pgadmin.org/)
2. Run `01_table_setup.sql` to create the table and insert data
3. Run query files in order (02 → 04)

---

## 👨‍💻 Author

**Ujjwal Jain**  
B.Sc. E-Commerce Operations & Digital Applications — DSEU, Delhi  
📧 ujjwalj35@gmail.com | [LinkedIn](https://www.linkedin.com/in/ujjwal-jain-37146b303)
