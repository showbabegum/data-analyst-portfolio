# Data Analyst Portfolio — Showba Begum

Portfolio projects demonstrating data analysis, SQL, visualization, and dashboard skills.

## Projects

### 1. E-commerce Sales Performance Analysis (`project1_sales_analysis.html`)
Analyzed 6,194 orders ($5.6M revenue) across 2024–2025.
- Monthly revenue trends, seasonality, YoY growth
- Regional and category performance breakdowns
- Sales rep benchmarking
- **Skills:** Python, pandas, matplotlib, KPI design, business recommendations

### 2. Customer Churn Analysis (`project2_churn_analysis.html`)
Analyzed 2,500 telecom customers (27.9% churn rate).
- Churn drivers: contract type, tenure, charges, payment method
- Revenue-at-risk quantification
- Targeted retention recommendations
- **Skills:** Python, pandas, segmentation analysis, stakeholder communication

### 3. Interactive Sales Dashboard (`project3_sales_dashboard.html`)
Filterable dashboard built with Chart.js.
- Live filters by region, category, and year
- KPI cards, trend lines, regional/category breakdowns, rep leaderboard
- **Skills:** JavaScript, Chart.js, dashboard design, data storytelling

### 4. SQL Analysis (`project4_sql_analysis.html`, `sql_analysis.sql`)
12 analytical queries on the orders & customers data (SQLite).
- Aggregations, GROUP BY, CTEs, subqueries, window functions (RANK, running totals), CASE
- Database: `data/portfolio.db` (tables: `orders`, `customers`)
- **Skills:** SQL, SQLite, analytical querying

### 5. Excel Sales Workbook (`project5_sales_workbook.xlsx`)
KPI dashboard with charts plus a filterable data sample.
- Monthly revenue trend (line), revenue by region (bar), category share (pie)
- **Skills:** Excel formulas, charts, dashboard layout, data formatting

### 6. Power BI Dashboard (in progress)
Step-by-step build guide: `project6_powerbi_guide.md`.

## Data
Synthetic datasets in `data/` (`sales.csv`, `churn.csv`) — generated to mirror real-world
e-commerce and telecom patterns. Build scripts included (`gen_data.py`, `project*_*.py`).

## Live demos
Once GitHub Pages is enabled on this repo:
- https://showbabegum.github.io/data-analyst-portfolio/project1_sales_analysis.html
- https://showbabegum.github.io/data-analyst-portfolio/project2_churn_analysis.html
- https://showbabegum.github.io/data-analyst-portfolio/project3_sales_dashboard.html
- https://showbabegum.github.io/data-analyst-portfolio/project4_sql_analysis.html
