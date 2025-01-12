SELECT * FROM top_companies_financial_data ;

##Data Cleaning and Update
#updating Sales,Profit,Assets,Market Value column to numeric values

ALTER TABLE top_companies_financial_data
ADD COLUMN sales_in_dollars BIGINT,
ADD COLUMN profit_in_dollars BIGINT,
ADD COLUMN assets_in_dollars BIGINT,
ADD COLUMN market_value_in_dollars BIGINT;

UPDATE top_companies_financial_data
SET 
    sales_in_dollars = CAST(REPLACE(REPLACE(Sales, '$', ''), ' B', '') AS DECIMAL(15,2)) * 1000000000,
    profit_in_dollars = CAST(REPLACE(REPLACE(Profit, '$', ''), ' B', '') AS DECIMAL(15,2)) * 1000000000,
    assets_in_dollars = CAST(REPLACE(REPLACE(Assets, '$', ''), ' B', '') AS DECIMAL(15,2)) * 1000000000,
    market_value_in_dollars = CAST(REPLACE(REPLACE(`Market Value`, '$', ''), ' B', '') AS DECIMAL(15,2)) * 1000000000;


## 1. General Overview
# (a) Top 10 Companies by Total Revenue

SELECT Name, Country, sales_in_dollars
From top_companies_financial_data
ORDER BY sales_in_dollars DESC
LIMIT 10;

# (b) Top 10 Companies by Net Income

SELECT Name, Country, profit_in_dollars
from top_companies_financial_data
ORDER BY profit_in_dollars DESC
LIMIT 10;

# (c) Top 10 Countries by Market Capitaliztion

SELECT Name, Country, market_value_in_dollars
FROM top_companies_financial_data
ORDER BY market_value_in_dollars DESC
LIMIT 10;

#(d) Which Countries Host the Most Companies?

SELECT Country, COUNT(*) AS Company_Count
FROM top_companies_financial_data
GROUP BY Country
ORDER BY Company_Count DESC;

## 2. Revenue and Profit Analysis
# (a) Average, Median, and Range of Revenues

-- Average Revenue
SELECT AVG(sales_in_dollars) AS Average_Revenue
FROM top_companies_financial_data;

-- Median Revenue
SELECT sales_in_dollars AS Median_Revenue
FROM (
    SELECT sales_in_dollars, 
           ROW_NUMBER() OVER (ORDER BY sales_in_dollars) AS row_num
    FROM top_companies_financial_data
) AS numbered
WHERE row_num = (SELECT FLOOR(COUNT(*) / 2) + 1 FROM top_companies_financial_data);

-- Range of Revenues
SELECT 
    MAX(sales_in_dollars) AS Max_Revenue,
    MIN(sales_in_dollars) AS Min_Revenue
FROM top_companies_financial_data;

#(b) Are There High-Revenue but Low-Profit Companies?

SELECT Name, Country, sales_in_dollars, profit_in_dollars, 
profit_in_dollars/sales_in_dollars * 100 As Profit_Margin_Percentage
FROM top_companies_financial_data
WHERE sales_in_dollars>1000000000
AND profit_in_dollars<50000000;

## 3. Market Capitalization and Valuation
# (a)  Market Capitalization Correlation with Revenue

SELECT Name, sales_in_dollars AS Revenue , market_value_in_dollars AS Market_Cap
FROM top_companies_financial_data
ORDER BY Market_Cap DESC;

# (b) Which companies have the largest difference between market capitalization and revenue?

SELECT Name, sales_in_dollars, market_value_in_dollars, 
sales_in_dollars - market_value_in_dollars AS Difference
FROM top_companies_financial_data
ORDER BY Difference DESC;

