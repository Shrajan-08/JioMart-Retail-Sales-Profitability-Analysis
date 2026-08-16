# JioMart Retail Sales & Performance Analysis Dashboard

## 📊 Project Overview

An end-to-end business analytics project focused on analyzing JioMart sales performance using SQL, Power BI, DAX and R.

The project analyzes 5,000+ transactions across products, customers, channels, regions and store formats to identify sales and profitability trends and investigate a significant decline in November sales.

## 🎯 Objectives

- Analyze overall sales and profitability performance
- Track KPIs such as Sales, Profit, Orders, Customers, AOV and Profit Margin
- Identify trends across categories, channels, regions and store formats
- Analyze quarterly performance
- Investigate the sharp decline in November sales
- Use statistical regression to identify factors associated with transaction-level sales

## 🛠️ Tools Used

- SQL Server
- Power BI
- DAX
- R
- Microsoft Excel

## 📌 Key Analysis

### Overall Performance
The dashboard tracks:
- Total Sales
- Total Profit
- Total Orders
- Total Customers
- Profit Margin
- Average Order Value

### November Sales Decline Analysis

Net Sales declined significantly from October to November while order volume remained relatively stable.

Electronics was identified as the dominant contributor to the decline, accounting for approximately 98% of the month-over-month sales reduction.

### Regression Analysis

A regression model was developed in R using:

- Quantity
- Selling Price
- Discount Percentage
- Product Category
- Channel
- Store Format

The dependent variable was log(Net Sales).

The model achieved:
- R-squared: 80.83%
- Adjusted R-squared: 80.76%
- Overall model p-value: < 2.2e-16

The model was statistically significant overall and explained approximately 80.83% of the variation in log(Net Sales).

## 📈 Dashboard

The Power BI dashboard provides interactive analysis of:

- Sales & Profitability
- Quarterly Performance
- Category Performance
- Channel Performance
- Store Format Performance
- Regional Performance
- November Sales Decline

## 💡 Key Learnings

- Data modelling using SQL
- Building analytical models in Power BI
- Creating DAX measures
- Designing business dashboards
- Financial-year analysis
- Root-cause analysis
- Regression analysis using R
- Translating statistical results into business insights

## 👤 Author
Shrajan 
