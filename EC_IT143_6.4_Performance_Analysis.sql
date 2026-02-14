-- Query 1: Check performance and get missing index recommendation
SELECT CustomerID, ContactName, City
FROM dbo.t_w3_schools_customers
WHERE City = 'London';  -- Make sure 'City' exists

-- If SQL Server suggests a missing index, create it
CREATE NONCLUSTERED INDEX IX_tW3Customers_City
ON dbo.t_w3_schools_customers(City);

-- Re-run query to check improvement
SELECT CustomerID, ContactName, City
FROM dbo.t_w3_schools_customers
WHERE City = 'London';

------------------------------------------------

-- Query 2: Another example using LastName column (if exists)
SELECT CustomerID, ContactName
FROM dbo.t_w3_schools_customers
WHERE ContactName LIKE 'A%';  -- Filter on unindexed column

-- Missing index recommendation
CREATE NONCLUSTERED INDEX IX_tW3Customers_ContactName
ON dbo.t_w3_schools_customers(ContactName);

-- Re-run query
SELECT CustomerID, ContactName
FROM dbo.t_w3_schools_customers
WHERE ContactName LIKE 'A%';
