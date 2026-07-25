USE DATABASE ECOMMERCE_DW;
CREATE SCHEMA IF NOT EXISTS ANALYTICS;

-- Step 1: Create Clean Dimension & Fact Tables (Star Schema)
CREATE OR REPLACE TABLE ECOMMERCE_DW.ANALYTICS.dim_customers AS
SELECT 
    customer_id,
    INITCAP(customer_name) AS customer_name,
    LOWER(email) AS email,
    UPPER(country) AS country,
    signup_date
FROM ECOMMERCE_DW.RAW_STAGING.stg_customers;

CREATE OR REPLACE TABLE ECOMMERCE_DW.ANALYTICS.fact_sales AS
SELECT 
    i.item_id,
    o.order_id,
    o.customer_id,
    o.order_date,
    i.product_name,
    i.category,
    i.unit_price,
    i.quantity,
    (i.unit_price * i.quantity) AS total_revenue_usd,
    o.order_status
FROM ECOMMERCE_DW.RAW_STAGING.stg_orders o
JOIN ECOMMERCE_DW.RAW_STAGING.stg_order_items i
  ON o.order_id = i.order_id
WHERE o.order_status = 'COMPLETED';

-- Step 2: Executive Customer Lifetime Value (CLV) View
CREATE OR REPLACE VIEW ECOMMERCE_DW.ANALYTICS.view_customer_clv AS
SELECT 
    c.customer_id,
    c.customer_name,
    c.country,
    SUM(s.total_revenue_usd) AS lifetime_spend,
    DENSE_RANK() OVER (ORDER BY SUM(s.total_revenue_usd) DESC) AS customer_rank
FROM ECOMMERCE_DW.ANALYTICS.dim_customers c
JOIN ECOMMERCE_DW.ANALYTICS.fact_sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name, c.country;

-- Query Final Results
SELECT * FROM ECOMMERCE_DW.ANALYTICS.view_customer_clv;
