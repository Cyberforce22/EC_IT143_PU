-- File: EC_IT143_6.3_fwt_s5_PU.sql
-- Step 5 – Test Trigger
UPDATE dbo.t_w3_schools_customers
SET City = 'Test'
WHERE CustomerID = 1;

SELECT
    CustomerID,
    LastModifiedDate,
    LastModifiedBy
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
