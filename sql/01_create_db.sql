CREATE DATABASE IF NOT EXISTS retail_analysis;
USE retail_analysis;

CREATE TABLE IF NOT EXISTS online_retail (
  InvoiceNo    VARCHAR(20),
  StockCode    VARCHAR(20),
  Description  TEXT,
  Quantity     INT,
  InvoiceDate  VARCHAR(30),
  UnitPrice    DECIMAL(10,2),
  CustomerID   VARCHAR(10),
  Country      VARCHAR(50)
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 
  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Online_Retail.csv'
INTO TABLE online_retail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

USE retail_analysis;
SELECT COUNT(*) AS total_rows FROM online_retail;

SELECT * FROM online_retail LIMIT 5;

SELECT MIN(InvoiceDate) AS earliest,
       MAX(InvoiceDate) AS latest
FROM online_retail;

SELECT Country,
       COUNT(*) AS total_orders
FROM online_retail
GROUP BY Country
ORDER BY total_orders DESC
LIMIT 5;

SELECT
  COUNT(*)  AS total_rows,
  SUM(CASE WHEN CustomerID IS NULL OR CustomerID = '' THEN 1 ELSE 0 END) AS missing_customers,
  SUM(CASE WHEN Quantity   <= 0 THEN 1 ELSE 0 END) AS negative_quantity,
  SUM(CASE WHEN UnitPrice  <= 0 THEN 1 ELSE 0 END) AS zero_price,
  SUM(CASE WHEN InvoiceNo LIKE 'C%' THEN 1 ELSE 0 END) AS cancellations
FROM online_retail;