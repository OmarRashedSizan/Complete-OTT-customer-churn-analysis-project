# OTT Customer Churn Analysis

## 📌 Project Overview

This project analyzes customer churn for an OTT streaming business to identify high-risk customer segments and provide actionable retention insights.

The analysis combines customer demographics, subscription information, customer support interactions, and customer lifetime value (CLTV) to understand the major patterns associated with customer churn.

The project follows an end-to-end data analytics workflow:

**Data Understanding → Data Cleaning → Exploratory Data Analysis → Business Insights → Recommendations**

---

## 🎯 Business Problem

The OTT business is experiencing a significant customer retention problem.

The objective of this project is to answer:

- How large is the current churn problem?
- Which subscription plans have the highest churn?
- Does contract type influence churn?
- Which plan-contract combinations are most risky?
- Does acquisition channel show different churn patterns?
- Do support interactions and CSAT show a clear relationship with churn?
- How does customer lifetime value differ between active and churned customers?
- Which customer segments should be prioritized for retention?

---

## 📊 Dataset

The project contains three main datasets:

| Dataset | Records | Columns |
|---|---:|---:|
| Customer | 600 | 8 |
| Subscription | 600 | 11 |
| Support | 648 | 7 |

### Customer Data

Contains customer-level information such as:

- Customer ID
- Name
- Country
- State
- Gender
- Date of Birth
- Interests
- Pincode

### Subscription Data

Contains subscription and financial information such as:

- Subscription Start Date
- Subscription Type
- Renewal Date
- Plan Type
- Contract Type
- Cancellation Date
- Cancellation Reason
- Monthly Charges
- CLTV
- Churn Score

### Support Data

Contains customer support interaction information such as:

- Support ID
- Customer ID
- Complaint Date
- Escalations
- CSAT Score
- Issue Category
- Comment

---

## 🧹 Data Cleaning

Data quality issues were identified and handled before analysis.

Key cleaning activities included:

- Missing value analysis
- Categorical value standardization
- Duplicate record checks
- Date validation
- Invalid CSAT value detection
- Churn score validation
- Monthly charge anomaly detection
- Column-level data profiling
- Referential integrity checks

The cleaned datasets were saved and used for subsequent analysis.

### Data Quality Notes

Two anomalous monthly charge values were identified:

- Negative monthly charge: `-10`
- Extremely high monthly charge: `999`

These values were retained as anomalies because there was no reliable source value available for replacement.

---

## 📈 Exploratory Data Analysis

The EDA focused on identifying patterns associated with customer churn.

### Overall Churn

- Total Customers: **600**
- Churned: **329**
- Active: **271**
- Overall Churn Rate: **54.83%**

### Churn by Plan Type

| Plan | Churn Rate |
|---|---:|
| Basic | **81.94%** |
| Premium | **58.30%** |
| Standard | **34.76%** |

Basic-plan customers have the highest observed churn rate.

### Churn by Contract Type

| Contract | Churn Rate |
|---|---:|
| Monthly | **70.27%** |
| Annual | **39.80%** |

Monthly-contract customers show substantially higher observed churn.

### Plan × Contract

| Plan | Contract | Churn Rate |
|---|---|---:|
| Basic | Annual | 50.00% |
| Basic | Monthly | **82.86%** |
| Premium | Annual | 42.24% |
| Premium | Monthly | **100.00%** |
| Standard | Annual | 36.69% |
| Standard | Monthly | 31.91% |

The Premium + Monthly result is based on **62 customers** and should therefore be interpreted with appropriate caution.

### Churn by Subscription Type

| Subscription Type | Churn Rate |
|---|---:|
| Organic | 48.53% |
| Paid | 53.16% |
| Referral | **61.18%** |

The Unknown category contains only **1 customer** and is therefore not considered a meaningful business segment.

### CLTV by Churn Status

| Churn Status | Median CLTV |
|---|---:|
| Active | **935** |
| Churned | **555** |

Active customers have substantially higher median CLTV than churned customers.

### Support Analysis

Support escalation count did not show a clear relationship with churn.

Similarly, CSAT groups showed relatively similar churn rates without a strong consistent pattern.

---

## 💡 Key Business Insights

The analysis identified several important observations:

### 1. High Overall Churn

More than half of the analyzed customers have churned, indicating a significant retention challenge.

### 2. Basic Plan Is a High-Risk Segment

Basic-plan customers have an observed churn rate of **81.94%**.

### 3. Monthly Contracts Are High Risk

Monthly-contract customers have a **70.27%** churn rate compared with **39.80%** for Annual contracts.

### 4. Specific Plan-Contract Segments Require Attention

Basic + Monthly customers have an **82.86%** churn rate.

### 5. Referral Customers Show Higher Churn

Referral customers have a **61.18%** observed churn rate among the known acquisition types.

### 6. Customer Value Differs by Churn Status

Churned customers have a lower median CLTV than active customers.

---

## 🎯 Business Recommendations

### 1. Prioritize Monthly Customers

Develop targeted retention strategies for high-risk Monthly-contract customers.

### 2. Investigate the Basic Plan

Review pricing, features, content value, and customer expectations associated with the Basic plan.

### 3. Target High-Risk Segments

Prioritize Basic + Monthly customers and other high-risk plan-contract combinations for retention monitoring.

### 4. Review Referral Customer Retention

Investigate the onboarding experience and expectations of Referral-acquired customers.

### 5. Combine Churn Risk with Customer Value

Use CLTV together with churn risk to prioritize customers for retention activities.

---

## 🛠️ Tools & Technologies

- Python
- Pandas
- NumPy
- Matplotlib
- Jupyter Notebook
- SQL
- MySQL
- Data Cleaning
- Exploratory Data Analysis
- Business Analytics

---

## 📁 Project Structure

```text
OTT-Customer-Churn-Analysis/
│
├── 04_SQL_Data_Profiling/
│   ├── 01_Database_Health_Check.sql
│   ├── 02_Table_Structure_Review.sql
│   ├── 03_Record_Count.sql
│   ├── 04_Missing_Value_Analysis.sql
│   ├── 05_Duplicate_Analysis.sql
│   ├── 06_Categorical_Data_Profiling.sql
│   ├── 07_Numerical_Data_Profiling.sql
│   ├── 08_Date_Validation.sql
│   ├── 09_Referential_Integrity.sql
│   ├── 10_Business_Rule_Validation.sql
│   └── 11_Data_Profiling_Report.md
│
├── notebooks/
│   ├── 01_Data_Cleaning.ipynb
│   ├── 02_EDA.ipynb
│   └── 03_Business_Insight.ipynb
│
├── images/
│
├── README.md
│
└── [Project Documents]