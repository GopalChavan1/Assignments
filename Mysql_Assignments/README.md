# 5-Day SQL Advanced Hands-on Pack

## Files
- `00_company_sql_practice_setup.sql` — separate schema + large generated dataset.
- `Day1_SQL_Fundamentals_3to4Yrs.ipynb`
- `Day2_Joins_Advanced_Queries.ipynb`
- `Day3_Window_Functions_Analytics.ipynb`
- `Day4_Stored_Programs_Cursors.ipynb`
- `Day5_Advanced_SQL_Optimization_Project.ipynb`

## Dataset
The setup script creates a MySQL database named `company_sql_practice`.
Core business tables:
1. departments
2. employees
3. customers
4. projects
5. orders

Additional supporting tables used for realistic joins/procedural practice:
- order_items
- employee_projects
- performance_reviews
- salary_audit

The generated dataset contains thousands of order/order-item rows plus hundreds of employees/customers/projects, so window functions, joins and EXPLAIN practice have meaningful row volume.

## Run order
1. Open MySQL 8.x.
2. Run `00_company_sql_practice_setup.sql` once.
3. Verify:
   `USE company_sql_practice;`
   `SHOW TABLES;`
4. Open Day 1 notebook and execute the queries manually.
5. Continue one notebook per day.
