# E-commerce Sales & Customer Analysis

## 📌 Project Overview

This project analyzes e-commerce sales, customer, order, and product data to identify sales trends, customer behavior, top-performing products, and overall business performance.

The analysis was performed using SQL Server for data analysis and Power BI for interactive data visualization and dashboard development.

## 🎯 Project Objective

The main objective of this project is to transform e-commerce data into meaningful business insights that can help understand:

- Overall sales and revenue performance
- Customer purchasing behavior
- Product and category performance
- Monthly sales trends
- Top-performing products
- Customer segment performance
- Geographic sales performance
- Order and sales patterns

## ❓ Business Questions

The analysis focuses on answering the following questions:

1. What is the total revenue generated from completed sales?
2. How many completed orders were placed?
3. What is the average order value?
4. What is the total quantity of products sold?
5. What is the monthly revenue trend?
6. Which products generate the highest revenue?
7. Which products have the highest quantity sold?
8. Which product categories generate the highest revenue?
9. Which customer segments generate the highest revenue?
10. Which countries generate the highest revenue?
11. How does sales performance vary across different markets and regions?
12. Which products and categories contribute the most to overall business performance?

## 🗂️ Dataset

The project uses five cleaned CSV files containing customer, order, order item, product, and sales information.

### Data Files

- `customers_cleaned.csv` – Customer information
- `orders_cleaned.csv` – Order-level information
- `order_items_cleaned.csv` – Individual items within orders
- `products_cleaned.csv` – Product information
- `sales_Ccleaned.csv` – Sales transaction data

All dataset files are stored in the `Data` folder.

## 🛠️ Tools & Technologies

- **SQL Server** – Data analysis and business queries
- **Power BI** – Interactive dashboard and data visualization
- **Excel / CSV** – Data preparation and storage

## 🔍 SQL Analysis

SQL was used to analyze the data and answer the business questions using:

- Aggregations
- Joins
- Filtering
- Grouping
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Ranking and Top-N analysis

The complete SQL queries are available in:

`ECommerce_Sales_Analysis.sql`

## 📊 Power BI Dashboard

An interactive Power BI dashboard was created to present key business metrics and insights.

The dashboard includes analysis of:

- Total Revenue
- Completed Orders
- Average Order Value
- Total Quantity Sold
- Monthly Revenue Trends
- Top Products
- Product Category Performance
- Customer Segment Performance
- Geographic Sales Performance

The Power BI dashboard file is available in:

`Ecommerce_Sales_Dashboard.pbix`

## 💡 Key Insights

The analysis provides insights into:

- Overall sales and revenue performance
- Top revenue-generating products
- Products with the highest sales volume
- High-performing product categories
- Customer segments with stronger purchasing activity
- Geographic markets with higher sales
- Changes in sales performance over time

## 📁 Project Structure

```text
ecommerce-sales-customer-analysis/
│
├── Data/
│   ├── customers_cleaned.csv
│   ├── order_items_cleaned.csv
│   ├── orders_cleaned.csv
│   ├── products_cleaned.csv
│   └── sales_Ccleaned.csv
│
├── ECommerce_Sales_Analysis.sql
├── Ecommerce_Sales_Dashboard.pbix
├── README.md
└── LICENSE
