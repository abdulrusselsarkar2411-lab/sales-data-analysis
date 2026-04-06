use sales_project;
CREATE TABLE orders (
    order_id VARCHAR(20),
    order_date DATE,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales FLOAT,
    profit FLOAT,
    quantity INT
);
SELECT * FROM `global_superstore(csv)` LIMIT 10;
SELECT * FROM superstore LIMIT 10;
SELECT COUNT(*) FROM superstore;
DESCRIBE superstore;
SELECT ROUND(SUM(Sales),2) AS total_sales FROM superstore;
SELECT ROUND(SUM(Profit),2) AS total_profit FROM superstore;
SELECT Region, ROUND(SUM(Sales),2) AS total_sales
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;
SELECT Category, ROUND(SUM(Profit),2) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY total_profit DESC;
SELECT `Customer Name`, ROUND(SUM(Sales),2) AS total_sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 5;
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
       ROUND(SUM(Sales),2) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;
SELECT `Sub-Category`, ROUND(SUM(Profit),2) AS total_profit
FROM superstore
GROUP BY `Sub-Category`
HAVING total_profit < 0;
SELECT `Sub-Category`,
       ROUND(SUM(Profit),2) AS total_profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY total_profit DESC
LIMIT 5;
SELECT Category,
       ROUND(SUM(Sales),2) AS total_sales,
       ROUND(SUM(Profit),2) AS total_profit
FROM superstore
GROUP BY Category;
SELECT ROUND(SUM(Sales)/COUNT(DISTINCT `Order ID`),2) AS avg_order_value
FROM superstore;