# E-Commerce-Sales-Analytics-Project
This project simulates a realistic retail sales analytics scenario using **6 CSV files (25,000 rows each)** and full stack analytics using MySQL, Python (Pandas)and Power BI
Excel Tasks
Removed duplicate rows
Applied TRIM() to clean text data
Used TEXT(date, "yyyy-mm-dd") for formatting
Converted date/time into usable formats

 Dataset Files
customers.csv` – Customer profile
products.csv` – Product catalog
employees.csv` – Staff records
orders.csv` – Customer orders
sales.csv` – Sales line items
returns.csv` – Product returns


MySQL Schema

![A_digital_Entity-Relationship_(ER)_Diagram_display](https://github.com/user-attachments/assets/c21a2346-f05a-4ed8-995e-4eb4cb07f52a)

SQL script: 

**Tables and Relationships**:
orders.customer_id → customers.customer_id`
orders.employee_id → employees.employee_id`
sales.order_id → orders.order_id`
sales.product_id → products.product_id`
returns.sale_id → sales.sale_id`

📊 Power BI Dashboard

**Visual KPIs**:
- Total Revenue, Profit Margin, Returns
- Sales by Category (Pie/Bar)
- Sales by Region (Map)
- Sales and Profit by Month
![sales_analytics_deshbord](https://github.com/user-attachments/assets/db10697c-cb5e-40f6-ac52-c3937ca4d3ce)

- 
 How to Use

1. Import all CSVs into MySQL using the provided SQL script.
2. Run Python notebook to clean and export `sales_enriched.csv`.
3. Open Power BI Desktop and load the enriched file.
4. Build dashboard using charts shown in the mockup.

---

Requirements

- Python 3.x, pandas
- MySQL 8.x
- Power BI Desktop (Windows)
- Jupyter Notebook 

