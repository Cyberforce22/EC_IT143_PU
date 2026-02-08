DROP TABLE IF EXISTS hello_world_table;

CREATE TABLE hello_world_table (
    message_id INT IDENTITY(1,1) PRIMARY KEY,
    message_text VARCHAR(50) NOT NULL
);
