USE MyFC;
GO

TRUNCATE TABLE myfc_total_players;

INSERT INTO myfc_total_players (total_players)
SELECT TotalPlayers
FROM vw_myfc_total_players;
