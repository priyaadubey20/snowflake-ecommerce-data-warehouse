# ❄️ End-to-End E-Commerce Cloud Data Warehouse on Snowflake

An end-to-end cloud data warehousing project demonstrating multi-tier schema architecture, Star Schema dimensional modeling, data cleansing, and SQL analytics using **Snowflake**.

---

## 🏗️ Architecture & Data Pipeline

```text
  Raw Data Ingestion
       │
       ▼
 ┌─────────────────────────────────────────┐
 │       STAGING SCHEMA (RAW DATA)         │
 │ (stg_customers, stg_orders, stg_items)  │
 └────────────────────┬────────────────────┘
                      │
            ELT Transformations
                      │
                      ▼
 ┌─────────────────────────────────────────┐
 │      ANALYTICS SCHEMA (STAR SCHEMA)     │
 │    (dim_customers, fact_sales)          │
 └────────────────────┬────────────────────┘
                      │
            Executive SQL Views
                      │
                      ▼
 ┌─────────────────────────────────────────┐
 │     CUSTOMER LIFETIME VALUE (CLV)       │
 └─────────────────────────────────────────┘

Project Output & Execution
🚀 Key Features Implemented
Multi-Tier Schema Governance: Isolated staging tables (RAW_STAGING) from business production schemas (ANALYTICS).

Data Cleansing & Transformation: Applied SQL functions (INITCAP, LOWER, UPPER) to normalize raw data.

Star Schema Dimensional Modeling: Designed Dimension (dim_customers) and Fact (fact_sales) tables while filtering out invalid/cancelled transactions.

Advanced SQL Analytics: Engineered automated reporting views incorporating window functions (DENSE_RANK()) to evaluate top spending customers (CLV).

Role-Based Access Control (RBAC): Administered warehouse operations using Snowflake's ACCOUNTADMIN role.

💻 Tech Stack
Platform: Snowflake Cloud Data Platform

Language: SQL (SnowSQL)

Data Modeling: Star Schema (Facts & Dimensions)
