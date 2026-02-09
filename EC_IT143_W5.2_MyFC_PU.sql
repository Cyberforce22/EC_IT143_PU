-- =====================================================
-- Author: Prince Innocent Ukandu
-- Course: EC_IT143
-- Assignment: 5.2 My Communities Analysis – Create Answers
-- Community: MyFC
-- =====================================================

-- -----------------------------------------------------
-- Question 1
-- Question Author: Prince Innocent Ukandu
-- Question: How many players are in the MyFC community?
-- -----------------------------------------------------
SELECT COUNT(*) AS TotalPlayers
FROM dbo.tblPlayerDim;

-- -----------------------------------------------------
-- Question 2
-- Question Author: Prince Innocent Ukandu
-- Question: How many players belong to each position?
-- -----------------------------------------------------
SELECT Pos.p_name AS PositionName, COUNT(P.pl_id) AS TotalPlayers
FROM dbo.tblPlayerDim AS P
JOIN dbo.tblPositionDim AS Pos
    ON P.p_id = Pos.p_id
GROUP BY Pos.p_name
ORDER BY TotalPlayers DESC;

-- -----------------------------------------------------
-- Question 3
-- Question Author: Kwitonda Jean Baptiste
-- Question: How many players belong to each team?
-- -----------------------------------------------------
SELECT T.t_code AS TeamCode, COUNT(P.pl_id) AS TotalPlayers
FROM dbo.tblPlayerDim AS P
JOIN dbo.tblTeamDim AS T
    ON P.t_id = T.t_id
GROUP BY T.t_code
ORDER BY TotalPlayers DESC;

-- -----------------------------------------------------
-- Question 4
-- Question Author: Prince Innocent Ukandu
-- Question: How many players have a player number greater than 50?
-- -----------------------------------------------------
SELECT COUNT(*) AS PlayersWithHighNumber
FROM dbo.tblPlayerDim
WHERE pl_num > 50;
