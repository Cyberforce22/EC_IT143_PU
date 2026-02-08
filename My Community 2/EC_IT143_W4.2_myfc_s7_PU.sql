USE MyFC;
GO

CREATE OR ALTER PROCEDURE usp_load_myfc_total_players
AS
BEGIN
    TRUNCATE TABLE myfc_total_players;

    INSERT INTO myfc_total_players (total_players)
    SELECT TotalPlayers
    FROM vw_myfc_total_players;
END;
GO
