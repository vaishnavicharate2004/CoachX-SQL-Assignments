CREATE DATABASE BRANDS;
USE  BRANDS;
CREATE TABLE ITEM_TABLE(
    ITEM_ID INT,
	ITEM_DESCRIPTION VARCHAR(MAX),
	VENDOR_NOS INT,
	VENDOR_NAME VARCHAR(MAX),
	BOTTOLE_SIZE INT,
	BOTTLE_PRICE decimal(10,2)
);
drop table item_table;

INSERT INTO ITEM_TABLE(Item_Id, item_description, vendor_nos, vendor_name, bottole_size, bottle_price)
VALUES
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
(2, 'D''aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12),
(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.50),
(4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
(5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06),
(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);

select * from ITEM_TABLE;

drop table products_table;
CREATE TABLE PRODUCTS_TABLE(
    PRODUCT_ID INT,
	COUNTRY VARCHAR(MAX),
	PRODUCT VARCHAR(MAX),
	UNITS_SOLD decimal(10,2),
	MANUFACTURING_PRICE INT,
	SALE_PRICE INT,
	GROSS_SALES INT,
	SALES INT,
	COGS INT,
	PROFIT INT,
	[DATE] date,
	MONTH_NUMBER INT,
	MONTH_NAME VARCHAR(MAX),
	[YEAR] int
);
DROP TABLE products_table;
 INSERT INTO PRODUCTS_TABLE(
 Product_Id, Country, Product, Units_Sold, Manufacturing_Price, SALE_PRICE,
 GROSS_SALES, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year
) VALUES
(1, 'Canada', 'Carretera', 1618.5, 3, 20, 32370, 32370, 16185, 16185, '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321, 3, 20, 26420, 26420, 13210, 13210, '2015-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3, 15, 32670, 32670, 21780, 10890, '2016-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, 3, 15, 13320, 13320, 8880, 4440, '2017-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3, 15, 37050, 37050, 24700, 12350, '2018-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, 3, 350, 529550, 529550, 393380, 136170, '2019-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, 5, 15, 13815, 13815, 9210, 4605, '2020-03-01', 3, 'March', 2020),
(8, 'Canada', 'Montana', 2518, 5, 12, 30216, 30216, 7554, 22662, '2021-06-01', 6, 'June', 2021);
SELECT * FROM ITEM_TABLE;
SELECT * FROM products_table;

 --Delete those product having the Units Sold 1618.5 , 888 and 2470.--
 DELETE FROM PRODUCTS_TABLE 
 WHERE PRODUCT_ID IN (1,4,5);

 SELECT * FROM products_table;

--Select the item_description and bottle_price for all items 
--in the ITEMS_TABLE table.-- 
SELECT item_description ,bottle_price FROM ITEM_TABLE ;

--Select Unique Country from the product_sales table --
SELECT DISTINCT COUNTRY FROM products_table;

--Count the number of Countries in the product_sales table--
SELECT COUNT(*) AS COUNTRY_COUNT,COUNTRY FROM products_table
GROUP BY COUNTRY;

--How Many Countries are there which contain the 
--sales price between 10 to 20--
SELECT COUNTRY,COUNT (*) AS SALE_PRICE
FROM PRODUCTS_TABLE
WHERE SALE_PRICE BETWEEN 10 AND 20
GROUP BY COUNTRY;

SELECT * FROM PRODUCTS_TABLE;
--Find the Total Sale Price  and  Gross Sales 
SELECT SUM(SALE_PRICE) AS TOTAL_SALES,SUM(GROSS_SALES)AS TOTAL_GROSS
FROM PRODUCTS_TABLE;

--In which year we have got the highest sales--
SELECT  TOP 1 YEAR ,SUM(SALES) AS TOP_SALE FROM PRODUCTS_TABLE
GROUP BY YEAR
ORDER BY TOP_SALE DESC;

--Which Product having the sales of $ 37,050.00--
SELECT PRODUCT , SUM(SALES)AS TOTAL_SALE FROM PRODUCTS_TABLE
GROUP BY PRODUCT
HAVING SUM(SALES) =37050.00;

--Which Countries lies between profit of $ 4605 to $  22662.00--
SELECT COUNTRY, SUM(PROFIT) AS TOTAL_PROFIT FROM PRODUCTS_TABLE
GROUP BY COUNTRY
HAVING SUM(PROFIT) BETWEEN 4605 AND 22662.00;

--Which Product Id having the sales of $ 24700.00--
SELECT PRODUCT_ID, SUM(SALES) AS TOTAL_SALES FROM PRODUCTS_TABLE
GROUP BY  PRODUCT_ID
HAVING SUM(SALES)=24700.00;

SELECT * FROM PRODUCTS_TABLE;

--Find the total Units Sold for each Country.--
SELECT COUNTRY,SUM(UNITS_SOLD) AS TOTAL_UNITS FROM PRODUCTS_TABLE
GROUP BY COUNTRY;

--Find the average sales for each country--
SELECT COUNTRY,AVG(SALES) AS AVG_SALE FROM PRODUCTS_TABLE
GROUP BY COUNTRY;

--Retrieve all products sold in 2014--
SELECT * FROM PRODUCTS_TABLE 
WHERE YEAR=2014;

--Find the maximum Profit in the product_sales table. 
SELECT MAX(PROFIT) AS MAX_PROFIT FROM PRODUCTS_TABLE;

--Retrieve the records from product_sales where Profit is       
--greater than the average Profit of all records. --
SELECT * FROM PRODUCTS_TABLE
 WHERE PROFIT>(SELECT  AVG(PROFIT) FROM PRODUCTS_TABLE);

 SELECT * FROM ITEM_TABLE;
--Find the item_description having the bottle size of 750
SELECT ITEM_DESCRIPTION,BOTTOLE_SIZE FROM ITEM_TABLE
WHERE BOTTOLE_SIZE= 750;

--Find the vendor Name having the vendor_nos 305 , 380 ,391--
SELECT VENDOR_NAME,VENDOR_NOS FROM ITEM_TABLE
WHERE VENDOR_NOS IN (305,380,391);

--What is total Bottle_price--
SELECT SUM(BOTTLE_PRICE) AS TOTAL_PRICE FROM ITEM_TABLE;

--Make Primary Key to Item_id--
ALTER TABLE ITEM_TABLE
ALTER COLUMN Item_id INT NOT NULL;

ALTER TABLE ITEM_TABLE
ADD CONSTRAINT pk_item PRIMARY KEY (Item_id);

SELECT * FROM ITEM_TABLE;

Which item id having the bottle_price of $ 5.06 
SELECT ITEM_ID , BOTTLE_PRICE FROM ITEM_TABLE
WHERE BOTTLE_PRICE=5.06;

--Apply INNER  , FULL OUTER , LEFT JOIN types on both the table--
SELECT * FROM ITEM_TABLE IT INNER JOIN PRODUCTS_TABLE PT
ON IT.ITEM_ID = PT.PRODUCT_ID;

SELECT * FROM ITEM_TABLE IT LEFT JOIN PRODUCTS_TABLE PT
ON IT.ITEM_ID = PT.PRODUCT_ID;

SELECT * FROM ITEM_TABLE IT FULL OUTER JOIN PRODUCTS_TABLE PT
ON IT.ITEM_ID = PT.PRODUCT_ID;

SELECT * FROM ITEM_TABLE;
SELECT * FROM PRODUCTS_TABLE;

--Find the item_description and Product having the gross sales of 13320.00

SELECT IT.ITEM_DESCRIPTION, PT .PRODUCT, SUM(PT.GROSS_SALES) AS TOTAL_GROSS_SALE 
FROM ITEM_TABLE IT INNER JOIN PRODUCTS_TABLE PT
ON IT.ITEM_ID = PT.PRODUCT_ID
GROUP BY IT.ITEM_DESCRIPTION, PT.PRODCUT
HAVING SUM(PT.GROSS_SALES)=13320.00 ;

--Split the Item_description Column into Columns Item_desc1 and Item_desc2 
    SELECT 
    Item_description,
    LEFT(Item_description, CHARINDEX(' ', Item_description) - 1) AS Item_desc1,
    SUBSTRING(Item_description, CHARINDEX(' ', Item_description) + 1, LEN(Item_description)) AS Item_desc2
    FROM ITEM_TABLE;

SELECT * FROM ITEM_TABLE;

--Find the top 3 most expensive items in the ITEMS_TABLE table.--
    SELECT TOP 3 ITEM_DESCRIPTION FROM ITEM_TABLE;

--Find the total Gross Sales and Profit for each Product in each Country.
    SELECT SUM(GROSS_SALES) AS TOTAL_GROSS,SUM(PROFIT) TOTAL_PROFIT,PRODUCT ,COUNTRY 
    FROM PRODUCTS_TABLE
    GROUP BY PRODUCT,COUNTRY;

--Find the vendor_name and item_description of items with a 
--bottle_size of 750 and bottle_price less than 10.-- 

    SELECT VENDOR_NAME,ITEM_DESCRIPTION,bottole_size , bottle_price FROM ITEM_TABLE
    WHERE bottole_size =750 AND bottle_price<10;

    SELECT * FROM PRODUCTS_TABLE;

--Find the Product with the highest Profit in 2019--
    SELECT TOP 1 PRODUCT , SUM(PROFIT) AS TOTAL_PROFIT
    FROM PRODUCTS_TABLE
    WHERE YEAR = 2019
    GROUP BY PRODUCT
    ORDER BY  TOTAL_PROFIT DESC;

--Retrieve the Product_Id and Country of all records where the 
   Profit is at least twice the COGS. 
  SELECT * FROM PRODUCTS_TABLE;
   SELECT SUM(COGS) AS TOTAL_COGS FROM PRODUCTS_TABLE;
   SELECT PRODUCT_ID, COUNTRY FROM PRODUCTS_TABLE
   WHERE PROFIT>2 * COGS;

--Find the Country that had the highest total Gross Sales in 2018 
    SELECT TOP 1 COUNTRY, SUM(GROSS_SALES) AS TOTAL_GROSS FROM PRODUCTS_TABLE
    WHERE YEAR =2018
    GROUP BY COUNTRY
    ORDER BY TOTAL_GROSS DESC;

--Calculate the total Sales for each Month Name across all years--
    SELECT SUM(SALES) AS TOTAL_SALES ,MONTH_NAME,YEAR FROM PRODUCTS_TABLE
    GROUP BY MONTH_NAME,YEAR;

--List the item_description and vendor_name for items 
--whose vendor_nos exists more than once in the ITEMS_TABLE table
    SELECT * FROM ITEM_TABLE;

    SELECT  item_description,vendor_name,vendor_nos FROM ITEM_TABLE
    WHERE vendor_nos IN(
    SELECT vendor_nos FROM ITEM_TABLE
    GROUP BY vendor_nos
    HAVING COUNT(*)>1);

--Find the average Manufacturing Price for Product in each 
--Country and only include those Country and Product 
--combinations where the average is above 3--

SELECT AVG(Manufacturing_Price) AS AVG_Manufacturing_Price,PRODUCT,COUNTRY FROM PRODUCTS_TABLE
GROUP BY PRODUCT, COUNTRY
HAVING AVG(Manufacturing_Price)>3;

--Find the item_description and bottle_price of items that have 
--the same vendor_name as items with Item_Id 1

    SELECT * FROM ITEM_TABLE;

    SELECT item_description, bottle_price,VENDOR_NAME,ITEM_ID FROM ITEM_TABLE
    WHERE VENDOR_NAME =
    (SELECT VENDOR_NAME FROM ITEM_TABLE
    WHERE ITEM_ID = 1);


--Create a stored procedure to retrieve all records from the 
--ITEMS_TABLE table where bottle_price is greater than a given value 
    CREATE PROCEDURE GetItemsAbovePrice
    @MinPrice DECIMAL(10,2)
    AS
    BEGIN
    SET NOCOUNT ON;
    SELECT *
    FROM ITEMS_TABLE
    WHERE bottle_price > @MinPrice;
    END; 

--Create a stored procedure to insert a new record into the 
--product_sales table.
   CREATE PROCEDURE InsertProductSales 
   @Product_ID INT,
   @Sale_price int,
   @gross_sales int,
   @Units_sold DECIMAL(10,2)
   AS 
   BEGIN
   SET NOCOUNT ON;
   INSERT INTO PRODUCTS_TABLE (Product_ID, Sale_price, gross_sales, Units_sold)
   VALUES (@Product_ID, @Sale_price, @gross_sales, @Units_sold);
   END;

   EXEC InsertProductSales 
    @Product_ID = 101, 
    @Sale_price = 500, 
    @gross_sales = 2500, 
    @Units_sold = 5.00;

--Create a trigger to automatically update the Gross_Sales field in 
--the product_sales table whenever Units_Sold or Sale_Price is 
--updated. 






--Write a query to find all item_description in the ITEMS_TABLE 
--table that contain the word "Whisky" regardless of case. 
   SELECT * FROM ITEM_TABLE;
   SELECT ITEM_ID,ITEM_DESCRIPTION FROM ITEM_TABLE
   WHERE ITEM_ID = 4;

--Write a query to find the Country and Product where the Profit 
--is greater than the average Profit of all products. 

    SELECT Country, AVG(Profit) AS AvgProfit
    FROM PRODUCTS_TABLE
    GROUP BY Country
    HAVING AVG(Profit) > (SELECT AVG(Profit) FROM PRODUCTS_TABLE);

--Write a query to join the ITEMS_TABLE and product_sales tables 
--on a common field (e.g., vendor_nos) and select relevant fields 
--from both tables.
    SELECT 
    IT.ITEM_ID,
    IT.ITEM_DESCRIPTION,
    IT.VENDOR_NOS,
    PT.PRODUCT_ID,
    PT.PRODUCT,
    PT.COUNTRY,
    PT.PROFIT
    FROM ITEM_TABLE AS IT
    INNER JOIN PRODUCTS_TABLE AS PT
    ON IT.ITEM_ID = PT.PRODUCT_ID;

SELECT * FROM ITEM_TABLE;
SELECT * FROM PRODUCTS_TABLE;
--Write a query to combine item_description and vendor_name 
--into a single string for each record in the ITEMS_TABLE table, 
--separated by a hyphen.

SELECT CONCAT('ITEM_DESCRIPTION','-','VENDOR_NAME' )AS CombinedString
FROM ITEM_TABLE;

--Write a query to display the bottle_price rounded to one 
--decimal place for each record in the ITEMS_TABLE table.
   UPDATE ITEM_TABLE SET BOTTLE_PRICE =ROUND(bottle_price,1);

 
--Write a query to calculate the number of days between the 
--current date and the Date field for each record in the 
--product_sales table.--

  SELECT Product_ID,Product,Date,
  DATEDIFF(DAY, Date, GETDATE()) AS DaysDifference
  FROM PRODUCTS_TABLE;

   


   








