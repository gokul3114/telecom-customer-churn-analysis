# 📊 Telecom Customer Churn Analysis

## 📌 Project Overview

Customer churn is a critical business challenge in the telecommunications industry. Retaining existing customers is often more cost-effective than acquiring new ones. This project analyzes customer behavior to identify the key factors influencing churn and provides actionable insights to support customer retention strategies.

The analysis includes data cleaning, SQL-based exploratory analysis, and an interactive Power BI dashboard to visualize key business metrics and trends.

---

## 🎯 Project Objective

The objective of this project is to analyze customer churn data, identify the factors contributing to customer attrition, and provide data-driven insights that help improve customer retention and business decision-making.

---

## 🛠️ Tools & Technologies

- **Excel** – Initial data validation
- **Python (Pandas)** – Data cleaning and preprocessing
- **MySQL** – Exploratory data analysis using SQL
- **Power BI** – Interactive dashboard creation
- **Git & GitHub** – Version control and project hosting

---

## 📂 Dataset Information

- **Dataset:** Telco Customer Churn
- **Records:** 7,043 customers
- **Columns:** 21
- **Target Variable:** `Churn`

Each row represents one telecom customer with demographic information, subscribed services, contract details, billing information, and churn status.

---

## 🧹 Data Cleaning & Preprocessing

The dataset was cleaned before analysis to ensure accuracy and consistency.

### Cleaning Steps

- Verified there were no duplicate customer IDs.
- Checked for missing values across all columns.
- Identified 11 missing values in the `TotalCharges` column.
- Verified all missing `TotalCharges` belonged to customers with `tenure = 0`.
- Replaced missing `TotalCharges` values with `0`.
- Converted `TotalCharges` from text to numeric.
- Standardized all column names to lowercase for consistency.

---

## 📈 SQL Analysis

Business questions answered during the SQL analysis include:

- Total customers
- Total churned customers
- Total retained customers
- Overall churn rate
- Average customer tenure
- Average monthly charges
- Average total charges
- Customer distribution by contract type
- Customer distribution by payment method
- Customer distribution by internet service
- Churn by gender
- Churn by senior citizen
- Churn by contract type
- Churn by payment method
- Churn by online security
- Churn by tech support
- Revenue by contract type
- Customer segmentation and churn analysis

---

## 📊 Power BI Dashboard

The dashboard provides an interactive overview of customer churn using KPIs, charts, and slicers.

### Dashboard Features

- Total Customers
- Churned Customers
- Retained Customers
- Churn Rate
- Average Tenure
- Average Monthly Charges
- Average Total Charges

### Interactive Filters

- Gender
- Contract
- Internet Service
- Payment Method
- Senior Citizen
- Churn Status

---

## 📌 Key Business Insights

- Customers with **Month-to-Month contracts** experience the highest churn rate.
- Customers using **Electronic Check** as their payment method have the highest churn.
- Customers without **Online Security** are more likely to churn.
- Customers without **Tech Support** have a significantly higher churn rate.
- **Fiber Optic** internet users represent a large portion of churned customers.
- Customers paying higher monthly charges tend to churn more frequently.
- Long-term contract customers are more likely to remain with the company.

---

## 💡 Business Recommendations

- Encourage customers to switch from Month-to-Month to long-term contracts through incentives.
- Offer bundled plans that include Online Security and Tech Support.
- Investigate customer experience for Fiber Optic users and improve service quality.
- Review the Electronic Check payment experience and encourage alternative payment methods.
- Develop targeted retention campaigns for high-risk customer segments.

---

## 📁 Repository Structure

```
telecom-customer-churn-analysis/
│
├── data/
│   └── telco_churn_cleaned.csv
│
├── python/
│   └── data_cleaning.ipynb
│
├── sql/
│   └── churn_analysis.sql
│
├── powerbi/
│   └── Telecom_Customer_Churn.pbix
│
├── images/
│   └── dashboard.png
│
└── README.md
```

---

## 🔄 Project Workflow

```
Raw Dataset (CSV)
        │
        ▼
Excel Validation
        │
        ▼
Python Data Cleaning
        │
        ▼
MySQL Data Analysis
        │
        ▼
Power BI Dashboard
        │
        ▼
Business Insights & Recommendations
```

---

## 🚀 Skills Demonstrated

- Data Cleaning
- Data Validation
- Exploratory Data Analysis (EDA)
- SQL Query Writing
- Aggregate Functions
- Conditional Aggregation
- Business Intelligence
- Data Visualization
- Dashboard Design
- Business Insight Generation

---

## 📷 Dashboard Preview

> *(Add your dashboard screenshot here after uploading it to the `images` folder.)*

```markdown
![Dashboard]()
```

---

## 👤 Author

**Gokul G**

Aspiring Data Analyst skilled in SQL, Python, Excel, Power BI, Tableau, and Data Visualization, with a strong interest in transforming raw data into actionable business insights.

---

## ⭐ If you found this project helpful, consider giving it a star!
