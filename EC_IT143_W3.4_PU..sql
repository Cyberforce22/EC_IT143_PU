/*==========================================================
Author: Prince Innocent Ukandu
Course: IT 143
Assignment: W3.4 Adventure Works – Create Answers
Database: AdventureWorks2022
Estimated Runtime: < 10 seconds
==========================================================*/

USE AdventureWorks2022;
GO

/*----------------------------------------------------------
Q1 (Marginal) – Top 10 most expensive products
Author: Prince Innocent Ukandu
----------------------------------------------------------*/
SELECT TOP 10
       Name,
       ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO

/*----------------------------------------------------------
Q2 (Marginal) – Discontinued products
Author: Prince Innocent Ukandu
----------------------------------------------------------*/
SELECT
       Name,
       DiscontinuedDate
FROM Production.Product
WHERE DiscontinuedDate IS NOT NULL;
GO

/*----------------------------------------------------------
Q3 (Moderate) – Top 5 products by total sales revenue
Author: Prince Innocent Ukandu
----------------------------------------------------------*/
SELECT TOP 5
       p.Name AS ProductName,
       SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
  ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;
GO

/*----------------------------------------------------------
Q4 (Moderate) – Customers with highest number of orders
Author: Prince Innocent Ukandu
----------------------------------------------------------*/
SELECT
       c.CustomerID,
       COUNT(soh.SalesOrderID) AS TotalOrders
FROM Sales.Customer c
JOIN Sales.SalesOrderHeader soh
  ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalOrders DESC;
GO

/*----------------------------------------------------------
Q5 (Increased) – Monthly road bike sales in 2012
Author: Prince Innocent Ukandu
----------------------------------------------------------*/
SELECT
       MONTH(soh.OrderDate) AS OrderMonth,
       SUM(sod.OrderQty) AS QuantitySold,
       AVG(p.ListPrice) AS AvgListPrice,
       AVG(p.StandardCost) AS AvgStandardCost,
       SUM((p.ListPrice - p.StandardCost) * sod.OrderQty) AS EstimatedNetRevenue
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod
  ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product p
  ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps
  ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE ps.Name = 'Road Bikes'
  AND YEAR(soh.OrderDate) = 2012
GROUP BY MONTH(soh.OrderDate)
ORDER BY OrderMonth;
GO

/*----------------------------------------------------------
Q6 (Increased) – Sales performance by sales representative
Author: Prince Innocent Ukandu
----------------------------------------------------------*/
SELECT
       sp.BusinessEntityID AS SalesPersonID,
       SUM(soh.SubTotal) AS TotalSalesRevenue,
       COUNT(soh.SalesOrderID) AS NumberOfOrders,
       sp.TerritoryID
FROM Sales.SalesPerson sp
JOIN Sales.SalesOrderHeader soh
  ON sp.BusinessEntityID = soh.SalesPersonID
GROUP BY sp.BusinessEntityID, sp.TerritoryID;
GO

/*----------------------------------------------------------
Q7 (Metadata) – Tables containing ProductID column
Author: Prince Innocent Ukandu
----------------------------------------------------------*/
SELECT
       TABLE_SCHEMA,
       TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID'
ORDER BY TABLE_SCHEMA, TABLE_NAME;
GO

/*----------------------------------------------------------
Q8 (Metadata) – Foreign keys referencing SalesOrderID
Author: Prince Innocent Ukandu
----------------------------------------------------------*/
SELECT
       fk.name AS ForeignKeyName,
       OBJECT_NAME(fk.parent_object_id) AS TableName
FROM sys.foreign_keys fk
JOIN sys.foreign_key_columns fkc
  ON fk.object_id = fkc.constraint_object_id
JOIN sys.columns c
  ON fkc.parent_object_id = c.object_id
 AND fkc.parent_column_id = c.column_id
WHERE c.name = 'SalesOrderID';
GO
