CREATE OR ALTER PROCEDURE usp_load_hello_world
AS
BEGIN
    TRUNCATE TABLE hello_world_table;

    INSERT INTO hello_world_table (message_text)
    SELECT Message
    FROM vw_hello_world;
END;
GO
