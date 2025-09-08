-- Creating database for this data
CREATE DATABASE supermarket_sales;
-- importing the supermarket sales cleaned data into mysql workbench using Table Data Import Wizard
-- making the database active
USE supermarket_sales; 

-- 	Data extraction
 -- 1 Extract all information on the table
 SELECT * FROM supermarket_sales_new;
 
 -- 2 CALCULATE THE AVERAGE PURCHASE AMOUNT, 
 -- TOTAL SALES, AND NUMBER OF PURCHASE FOR EACH COMBINATION OF CUSTOMER TYPE AND GENDER
 SELECT Customer_type, Gender, 
 AVG(Total) AS Avg_purchase_amount, SUM(Total) AS Total_sales, 
 Count(*) AS Purchase_count FROM supermarket_sales_new GROUP BY Customer_type, Gender;

-- 3 CALCULATE THE AVERAGE QUANTITY SOLD PER TRANSACTION FOR EACH PRODUCT LINE
-- TO IDENTIFY HIGH-DEMAND PRODUCTS
Select Product_line, Avg(Quantity) As Average_quantity_sold
FROM supermarket_sales_new GROUP BY Product_line
HAVING AVG(Quantity) > 5 order by avg(Quantity) desc;

-- 4 Extract Branch and Rating distribution to get branch with the highest rating
SELECT Branch, Sum(Rating) AS Rating FROM supermarket_sales_new GROUP BY Branch ORDER BY Rating desc;

-- 5 Identify Product_line with the highest unit price
SELECT Product_line, sum(Unit_price) 
FROM supermarket_sales_new GROUP BY Product_line 
ORDER BY Sum(Unit_price) DESC LIMIT 1;   