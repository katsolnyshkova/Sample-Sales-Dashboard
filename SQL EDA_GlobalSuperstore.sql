-- 1. Taking a look at data

SELECT *
FROM GlobalSuperstore.dbo.Orders


-- 2. Checking at total number of rows in the raw data

SELECT COUNT(*)
FROM GlobalSuperstore.dbo.Orders


-- 3. Checking that the last OrderID have same number as total number of orders

SELECT *
FROM GlobalSuperstore.dbo.Orders
ORDER BY 1 DESC


-- 4. Cheking is there are duplicates for OrderID

SELECT [Order ID], count(*)
FROM GlobalSuperstore.dbo.Orders
GROUP BY [Order ID]
HAVING COUNT(*) > 1


-- 5. Checking an example where OrderID repeats in 4 rows. 
-- And we see that there are 4 different ProductId for this Order.
-- So OrderID can not be a Primary Key.


SELECT *
FROM GlobalSuperstore.dbo.Orders
WHERE [Order ID] = 'AG-2012-8490'


-- 6.Cheking is there are duplicates for RowID & OrderID 

SELECT [Row ID],[Order ID], count(*)
FROM GlobalSuperstore.dbo.Orders
GROUP BY [Row ID],[Order ID]
HAVING COUNT(*) > 1


-- 7. Checking if there's no errors in dates. Ship Date should be > then Order Date

SELECT *
FROM GlobalSuperstore.dbo.Orders
WHERE [Ship Date]<[Order Date]


-- 8. Checking distinct Ship Modes that presented in the data

SELECT DISTINCT [Ship Mode]
FROM GlobalSuperstore.dbo.Orders



-- 9. Lets see the delivery timing for every Ship Modes

SELECT DISTINCT 
[Ship Mode], 
MIN(DATEDIFF(DAY,[Order Date],[Ship Date])) as MinNumOfDays, 
MAX(DATEDIFF(DAY,[Order Date],[Ship Date])) as MaxNumOfDays
FROM GlobalSuperstore.dbo.Orders
GROUP BY [Ship Mode]


-- 10. Checkimg if there are duplicates for Customer ID & Order ID to see how many orders Customer make

SELECT [Customer ID], [Order ID], count(*)
FROM GlobalSuperstore.dbo.Orders
GROUP BY [Customer ID], [Order ID]
ORDER BY [Customer ID]


-- 11. Checking an order info

SELECT *
FROM GlobalSuperstore.dbo.Orders
WHERE [Order ID] = 'CA-2011-128055'


