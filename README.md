
# Data Quality & Transformation Pipeline

## Overview
This project focuses on cleaning and standardizing raw data using SQL and Python.  
The dataset contains common data quality issues such as duplicates, null values, and inconsistent records.

The goal is to transform raw data into a clean and reliable dataset that can be used for analysis.

---

## Tools & Technologies
- Python (pandas)
- MySQL
- SQL (Window Functions, Aggregations)
- SQLAlchemy

---

## Pipeline Workflow

1. **Data Generation (Python)**
   - Created a dataset with intentional issues (duplicates, nulls)

2. **Data Loading (MySQL)**
   - Loaded raw data into a MySQL table (`raw_orders`)

3. **Data Cleaning (SQL)**
   - Removed duplicates using `ROW_NUMBER()`
   - Handled null values using `COALESCE()`
   - Filtered invalid records

4. **Data Validation**
   - Compared row counts between raw and clean tables
   - Measured number of removed records

5. **Data Extraction (Python)**
   - Retrieved cleaned data back into pandas

---

## Key Concepts Applied
- Data Cleaning & Standardization
- Window Functions (`ROW_NUMBER()`)
- Data Quality Validation
- ETL (Extract, Transform, Load)
- Python-SQL Integration

---

## 📊 Results
- Successfully removed duplicate records
- Handled missing values
- Generated a clean dataset ready for analysis
- Built a reproducible data pipeline

---

## Project Structure
```
data-quality-pipeline/
│
├── Data_generation.py
├── Data_cleaning.sql
├── Data_Extraction.sql
└── README.md
```

## Future Improvements
- Automate pipeline execution
- Add scheduling (e.g., Airflow)
- Improve data validation checks

---

## Author
Ginna Ospino  
Data enthusiast transitioning into Data Engineering
