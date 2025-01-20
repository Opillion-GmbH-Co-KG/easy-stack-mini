USE mssql_one
GO


CREATE TABLE test.dbo
(
    id        INT IDENTITY(1,1) PRIMARY KEY,
    name1     NVARCHAR(50) NOT NULL,
    name2     NVARCHAR(50) NOT NULL,
    datum     DATETIME      NOT NULL
);
GO

INSERT INTO test.dbo (name1, name2, datum)
VALUES
('John', 'Doe', '2023-09-01 10:30:00'),
('Jane', 'Smith', '2023-09-05 14:45:00'),
('Alice', 'Johnson', '2022-11-10 08:20:00'),
('Bob', 'Williams', '2023-03-15 09:00:00');
GO
