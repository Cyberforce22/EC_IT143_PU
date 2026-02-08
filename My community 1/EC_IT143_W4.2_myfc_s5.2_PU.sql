USE MyFC;
GO

DROP TABLE IF EXISTS myfc_total_players;

CREATE TABLE myfc_total_players (
    result_id INT IDENTITY(1,1) PRIMARY KEY,
    total_players INT NOT NULL
);
