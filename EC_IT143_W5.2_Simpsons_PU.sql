-- =====================================================
-- Author: Prince Innocent Ukandu
-- Course: EC_IT143
-- Assignment: 5.2 My Communities Analysis – Create Answers
-- Community: Simpsons
-- =====================================================

-- -----------------------------------------------------
-- Question 1
-- Question Author: Prince Innocent Ukandu
-- Question: How many employees are in Family_Data?
-- -----------------------------------------------------
SELECT COUNT(*) AS TotalEmployees
FROM dbo.Family_Data;

-- -----------------------------------------------------
-- Question 2
-- Question Author: Kwitonda Jean Baptiste
-- Question: How many employees are Active vs Terminated?
-- -----------------------------------------------------
SELECT Status, COUNT(*) AS TotalEmployees
FROM dbo.Family_Data
GROUP BY Status
ORDER BY TotalEmployees DESC;

-- -----------------------------------------------------
-- Question 3
-- Question Author: Prince Innocent Ukandu
-- Question: How many transactions in FBS_Viza_Costmo have Debit > 1000?
-- -----------------------------------------------------
SELECT COUNT(*) AS HighDebitTransactions
FROM dbo.FBS_Viza_Costmo
WHERE Debit > 1000;

-- -----------------------------------------------------
-- Question 4
-- Question Author: Prince Innocent Ukandu
-- Question: How many transactions exist per Account in Planet_Express?
-- -----------------------------------------------------
SELECT Account, COUNT(*) AS TotalTransactions
FROM dbo.Planet_Express
GROUP BY Account
ORDER BY TotalTransactions DESC;
