-- SQL Portfolio Project — Showba Begum
-- Database: portfolio.db (tables: orders, customers)

-- Total revenue, profit & order count
SELECT COUNT(*) AS orders, ROUND(SUM(revenue),2) AS revenue, ROUND(SUM(profit),2) AS profit FROM orders;

-- Monthly revenue trend
SELECT substr(date,1,7) AS month, ROUND(SUM(revenue),2) AS revenue, COUNT(*) AS orders FROM orders GROUP BY month ORDER BY month;

-- Revenue & margin by region
SELECT region, COUNT(*) AS orders, ROUND(SUM(revenue),2) AS revenue, ROUND(100.0*SUM(profit)/SUM(revenue),1) AS margin_pct FROM orders GROUP BY region ORDER BY revenue DESC;

-- Top 5 product categories by revenue
SELECT category, ROUND(SUM(revenue),2) AS revenue, SUM(units) AS units_sold FROM orders GROUP BY category ORDER BY revenue DESC LIMIT 5;

-- Top 5 sales reps by revenue
SELECT rep, COUNT(*) AS orders, ROUND(SUM(revenue),2) AS revenue, ROUND(AVG(revenue),2) AS avg_order FROM orders GROUP BY rep ORDER BY revenue DESC LIMIT 5;

-- Average order value by quarter (CTE)
WITH q AS (SELECT CASE WHEN cast(substr(date,6,2) AS INT) BETWEEN 1 AND 3 THEN 'Q1' WHEN cast(substr(date,6,2) AS INT) BETWEEN 4 AND 6 THEN 'Q2' WHEN cast(substr(date,6,2) AS INT) BETWEEN 7 AND 9 THEN 'Q3' ELSE 'Q4' END AS quarter, revenue FROM orders) SELECT quarter, COUNT(*) AS orders, ROUND(AVG(revenue),2) AS avg_order_value FROM q GROUP BY quarter ORDER BY quarter;

-- Running monthly revenue total (window function)
WITH m AS (SELECT substr(date,1,7) AS month, SUM(revenue) AS revenue FROM orders GROUP BY month) SELECT month, ROUND(revenue,2) AS revenue, ROUND(SUM(revenue) OVER (ORDER BY month),2) AS running_total FROM m ORDER BY month LIMIT 12;

-- Regions above average order value (subquery)
SELECT region, ROUND(AVG(revenue),2) AS avg_order FROM orders GROUP BY region HAVING AVG(revenue) > (SELECT AVG(revenue) FROM orders);

-- Churn rate by contract type (JOIN-free, second table)
SELECT contract, COUNT(*) AS customers, SUM(churn) AS churned, ROUND(100.0*SUM(churn)/COUNT(*),1) AS churn_pct FROM customers GROUP BY contract ORDER BY churn_pct DESC;

-- High-value customers at risk: month-to-month, tenure < 6 months
SELECT customer_id, tenure_months, monthly_charges, contract FROM customers WHERE churn = 0 AND contract = 'Month-to-month' AND tenure_months < 6 ORDER BY monthly_charges DESC LIMIT 10;

-- Rep ranking with RANK() window function
SELECT rep, ROUND(SUM(revenue),2) AS revenue, RANK() OVER (ORDER BY SUM(revenue) DESC) AS revenue_rank FROM orders GROUP BY rep ORDER BY revenue_rank;

-- Profitable vs unprofitable categories
SELECT category, ROUND(SUM(profit),2) AS profit, CASE WHEN SUM(profit) > 200000 THEN 'High profit' WHEN SUM(profit) > 100000 THEN 'Medium profit' ELSE 'Low profit' END AS tier FROM orders GROUP BY category ORDER BY profit DESC;
