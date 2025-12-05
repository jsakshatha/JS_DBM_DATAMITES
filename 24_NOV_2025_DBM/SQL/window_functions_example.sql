
-- Window Functions Examples for Beginners
-- ---------------------------------------
create database windows_db;
use windows_db;
-- Sample table
CREATE TABLE sales (
    employee VARCHAR(50),
    month VARCHAR(10),
    sales INT
);

-- Insert sample data
INSERT INTO sales (employee, month, sales) VALUES
('Asha', 'Jan', 1000),
('Asha', 'Feb', 1500),
('Asha', 'Mar', 1200),
('Ravi', 'Jan', 900),
('Ravi', 'Feb', 1100);

-- 1. Running Total (Cumulative Sum)
SELECT 
    employee,
    month,
    sales,
    SUM(sales) OVER (PARTITION BY employee ORDER BY month) AS running_total
FROM sales;

-- 2. Ranking Employees by Sales
SELECT
    employee,
    sales,
    RANK() OVER (ORDER BY sales DESC) AS sales_rank
FROM sales;

-- 3. Sum using Window Function (without reducing rows)
SELECT
    employee,
    month,
    sales,
    SUM(sales) OVER (PARTITION BY employee) AS total_sales_per_employee
FROM sales;
