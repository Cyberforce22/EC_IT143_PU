USE EC_IT143_DA;
GO

-- =============================================
-- EC_IT143_6.3_fwf_s7_ei.sql
-- Step 7 - Zero Results Test
-- =============================================

WITH cte AS
(
    SELECT
        CustomerID,
        LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHocFirstName,
        dbo.fn_get_first_name(ContactName) AS FunctionFirstName
    FROM dbo.t_w3_schools_customers
)

SELECT *
FROM cte
WHERE AdHocFirstName <> FunctionFirstName;
