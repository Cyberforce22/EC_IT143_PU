-- How do I extract the last name?

CREATE FUNCTION dbo.fn_get_last_name
(
    @ContactName VARCHAR(100)
)
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN RIGHT(@ContactName,
                 LEN(@ContactName) - CHARINDEX(' ', @ContactName + ' '));
END;
GO
