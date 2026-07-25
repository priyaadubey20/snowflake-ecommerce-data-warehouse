-- Step 0: Set Permissions & Create Database
USE ROLE ACCOUNTADMIN;

CREATE DATABASE IF NOT EXISTS ECOMMERCE_DW;
USE DATABASE ECOMMERCE_DW;

-- Step 1: Create Staging Schema & Tables
CREATE SCHEMA IF NOT EXISTS RAW_STAGING;

CREATE OR REPLACE TABLE ECOMMERCE_DW.RAW_STAGING.stg_customers (
    customer_id INT,
    customer_name STRING,
    email STRING,
    country STRING,
    signup_date DATE
);

CREATE OR REPLACE TABLE ECOMMERCE_DW.RAW_STAGING.stg_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_status STRING
);

CREATE OR REPLACE TABLE ECOMMERCE_DW.RAW_STAGING.stg_order_items (
    item_id INT,
    order_id INT,
    product_name STRING,
    category STRING,
    unit_price NUMBER(10,2),
    quantity INT
);

-- Step 2: Insert Raw Staging Data
INSERT INTO ECOMMERCE_DW.RAW_STAGING.stg_customers VALUES
    (101, 'Ananya Sharma', 'ananya@example.com', 'India', '2025-01-10'),
    (102, 'John Smith', 'john@example.com', 'USA', '2025-02-14'),
    (103, 'Maria Garcia', 'maria@example.com', 'Spain', '2025-03-01'),
    (104, 'Liam Wilson', 'liam@example.com', 'UK', '2025-03-15');

INSERT INTO ECOMMERCE_DW.RAW_STAGING.stg_orders VALUES
    (5001, 101, '2026-01-05', 'COMPLETED'),
    (5002, 102, '2026-01-06', 'COMPLETED'),
    (5003, 101, '2026-02-10', 'COMPLETED'),
    (5004, 103, '2026-02-15', 'CANCELLED'),
    (5005, 104, '2026-03-01', 'COMPLETED');

INSERT INTO ECOMMERCE_DW.RAW_STAGING.stg_order_items VALUES
    (1, 5001, 'Wireless Headphones', 'Electronics', 150.00, 1),
    (2, 5001, 'Smartphone Case', 'Accessories', 25.00, 2),
    (3, 5002, '4K Monitor', 'Electronics', 400.00, 1),
    (4, 5003, 'Mechanical Keyboard', 'Electronics', 120.00, 1),
    (5, 5004, 'Fitness Tracker', 'Electronics', 90.00, 1),
    (6, 5005, 'Ergonomic Chair', 'Furniture', 250.00, 1);
