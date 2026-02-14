-- File: EC_IT143_6.3_fwt_s4_PU.sql
-- Step 4 – Create Trigger

ALTER TABLE dbo.t_w3_schools_customers
ADD LastModifiedDate DATETIME,
    LastModifiedBy VARCHAR(100);
GO

CREATE TRIGGER trg_update_last_modified
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET
        LastModifiedDate = GETDATE(),
        LastModifiedBy = SUSER_NAME()
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i
        ON c.CustomerID = i.CustomerID;
END;
GO
