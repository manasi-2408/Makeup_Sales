# 💄 Makeup Sales & Customer Behavior Analysis

## 📌 Project Overview

This project is an end-to-end business analytics case study focused on analyzing a skincare and makeup sales dataset using:

- SQL
- Python
- Power BI
- Machine Learning

The objective of this project is to understand the major factors influencing:

- Revenue growth
- Customer purchasing behavior
- Product performance
- Pricing effectiveness
- Customer satisfaction
- Product return behavior

The project combines:

- Business Analysis
- Data Cleaning
- Feature Engineering
- SQL Analytics
- Data Visualization
- Predictive Modeling
- Interactive Dashboards

---

# 📂 Project Structure

```bash
Makeup/
│
├── data/
│   └── makeup.csv
│
├── documentation/
│   └── makeup.docx
│
├── notebook/
│   ├── cleaned.csv
│   ├── data_visualization.ipynb
│   ├── predictive_model.ipynb
│   └── makeup.xlsx
│
├── power_bi/
│   └── makeup.pbix
│
├── sql/
│   └── makeup.sql
│
└── README.md
```

---

# 🎯 Business Problem Statement

The skincare business is generating sales, but the company does not clearly understand which factors are driving:

- Revenue growth
- Customer satisfaction
- Product returns

The goal of this analysis is to identify the key drivers behind:

- Customer purchasing behavior
- Product performance
- Pricing effectiveness
- Regional and sales channel performance

so the business can improve:

- Profitability
- Customer satisfaction
- Strategic decision-making

---

# 📊 Dataset Overview

The dataset contains information related to:

- Product brands
- Categories
- Pricing
- Discounts
- Revenue
- Units sold
- Customer ratings
- Product returns
- Customer demographics
- Sales channels
- Regional performance

---

# 🛠️ Feature Engineering

Additional columns were created to improve analytical depth.

| Added Column | Purpose |
|---|---|
| Age_Group | Customer segmentation |
| Price_Range | Pricing analysis |
| Quarter | Seasonal analysis |
| Is_weekend | Weekend sales analysis |
| Revenue_Per_Unit | Revenue efficiency |
| High_Rating | Satisfaction analysis |

---

# 📈 SQL Analysis

The project includes structured SQL analysis across 6 major business areas.

## 1. Sales & Revenue Analysis
- Revenue by brand
- Revenue by category
- Revenue by region
- Weekend vs weekday sales
- Seasonal sales trends
- Discount impact on revenue

## 2. Customer Behavior Analysis
- Age group analysis
- Gender analysis
- Skin type analysis
- Premium product preference
- Customer spending behavior

## 3. Pricing & Discount Analysis
- Discount dependency
- Revenue contribution from discounts
- Pricing vs sales relationship
- Optimal discount ranges

## 4. Product & Brand Performance Analysis
- Top-performing brands
- High revenue low rating products
- Regional category performance

## 5. Customer Satisfaction Analysis
- Rating analysis
- High rating revenue impact
- Low rating product identification

## 6. Return Analysis
- Return rate analysis
- Return-causing factors
- Pricing vs return relationship

---

# 🐍 Python Visualization Analysis

Python was used for:

- Data cleaning
- Exploratory data analysis
- Business visualization
- Revenue analysis
- Customer segmentation
- Return analysis

## Libraries Used

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
```

## Visualization Types

- Bar Charts
- Horizontal Bar Charts
- Pie Charts
- Stacked Charts
- Heatmaps
- Revenue Trend Analysis

---

# 🤖 Machine Learning Analysis

Two predictive machine learning models were developed.

---

## 🔹 Model 1 — Product Return Prediction

### Objective
Predict whether a product is likely to be returned.

### Algorithms Used
- Logistic Regression
- Random Forest Classifier

### Features Used
- Pricing
- Discounts
- Ratings
- Customer demographics
- Product category
- Brand
- Sales channel

### Evaluation Metrics
- Accuracy Score
- Classification Report
- Confusion Matrix
- ROC Curve
- ROC-AUC Score

---

## 🔹 Model 2 — High Rating Prediction

### Objective
Predict whether a product will receive a high customer rating.

### Algorithms Used
- Logistic Regression
- Random Forest Classifier

### Key Insights
- Product quality strongly affects ratings
- Returns influence customer satisfaction
- Customer behavior patterns affect ratings

---

# 📊 Power BI Dashboard

An interactive Power BI dashboard was created for business intelligence reporting.

## Dashboard Sections

- Executive Overview
- Sales & Revenue Dashboard
- Customer Behavior Dashboard
- Pricing & Discount Dashboard
- Product Performance Dashboard
- Return Analysis Dashboard
- Machine Learning Insights Dashboard

## KPI Metrics

- Total Revenue
- Total Units Sold
- Average Rating
- Return Rate %
- Average Discount %
- Total Brands
- Total Categories

---

# 📌 Key Business Insights

- Non-discounted products generated strong revenue
- Premium products contributed significantly to sales
- Customer demographics strongly influenced purchasing behavior
- Highly rated products generated better revenue
- Low-rated products showed higher return rates
- Some brands depended heavily on discounts
- Regional and sales channel performance varied significantly

---

# ✅ Final Conclusion

The analysis concludes that revenue growth and customer satisfaction are driven more by:

- Product quality
- Premium product positioning
- Customer demographics
- Regional performance
- Customer experience

than discounts alone.

The project demonstrates how businesses can use:

- SQL
- Python
- Machine Learning
- Power BI

to make data-driven business decisions.

---

# 🧠 Skills Demonstrated

## Data Analytics
- SQL Analysis
- Business Intelligence
- Data Cleaning
- Feature Engineering
- Customer Segmentation
- Revenue Analysis

## Python
- Pandas
- Matplotlib
- Seaborn

## Machine Learning
- Logistic Regression
- Random Forest
- Classification Models
- Feature Importance
- ROC-AUC Analysis

## Power BI
- Dashboard Design
- KPI Reporting
- Interactive Visualization
- DAX Measures

---

# 🚀 Tools & Technologies

| Tool | Purpose |
|---|---|
| SQL | Data Analysis |
| Python | Data Processing |
| Pandas | Data Manipulation |
| Matplotlib | Visualization |
| Seaborn | Statistical Visualization |
| Power BI | Dashboarding |
| Scikit-learn | Machine Learning |

---

# 📬 Author

**Manasi**

End-to-end Data Analytics & Business Intelligence Project.

Because apparently one dashboard was not enough suffering, the project evolved into SQL + ML + Power BI + predictive analytics.
