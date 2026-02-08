USE MyFC;
GO

CREATE OR ALTER VIEW vw_myfc_total_players
AS
SELECT COUNT(*) AS TotalPlayers
FROM tblPlayerDim;
GO
