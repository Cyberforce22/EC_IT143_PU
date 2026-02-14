USE EC_IT143_DA;
GO

-- =============================================
-- EC_IT143_6.3_fwf_s3_PU.sql
-- Step 3 - Ad Hoc Query
-- =============================================

SELECT
    CustomerID,
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;
