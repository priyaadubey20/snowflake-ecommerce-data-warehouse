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
