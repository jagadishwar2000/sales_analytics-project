CREATE TABLE sales (
    order_id TEXT,
    order_date DATE,
    customer_name TEXT,
    product TEXT,
    category TEXT,
    sales NUMERIC,
    profit NUMERIC,
    quantity INT,
    region TEXT
);
SHOW data_directory;
COPY sales
FROM 'C:/Program Files/PostgreSQL/16/data/csv/sales.csv'
DELIMITER ','
CSV HEADER
QUOTE '"';
DROP TABLE sales;

CREATE TABLE sales (
    order_id TEXT,
    order_date DATE,
    customer_name TEXT,
    product TEXT,
    category TEXT,
    sales TEXT,
    profit TEXT,
    quantity INT,
    region TEXT
);

SELECT COUNT(*) FROM sales;
SELECT * FROM sales LIMIT 10;
SELECT SUM(sales) AS total_sales FROM sales;
SELECT sales, profit
FROM sales
WHERE sales LIKE '%,%' OR profit LIKE '%,%'
LIMIT 5;

ALTER TABLE sales
ALTER COLUMN sales TYPE NUMERIC
USING REPLACE(sales, ',', '')::NUMERIC;

ALTER TABLE sales
ALTER COLUMN profit TYPE NUMERIC
USING REPLACE(profit, ',', '')::NUMERIC;

SELECT sales, profit FROM sales LIMIT 5;
SELECT SUM(sales) AS total_sales FROM sales;
SELECT SUM(profit) AS total_profit FROM sales;
SELECT product, SUM(sales) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC
LIMIT 10;
SELECT category, SUM(profit) AS profit
FROM sales
GROUP BY category
ORDER BY profit DESC;

