USE EC_IT143_DA;
GO

-- =============================================
-- EC_IT143_6.3_fwf_s5_ei.sql
-- Step 5 - Create Scalar Function
-- =============================================

CREATE FUNCTION dbo.fn_get_first_name
(
    @ContactName VARCHAR(100)
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FirstName VARCHAR(100);

    SET @FirstName =
        LEFT(@ContactName,
             CHARINDEX(' ', @ContactName + ' ') - 1);

    RETURN @FirstName;
END;
GO
