CREATE DATABASE mssql_one;
    GO

USE mssql_one
    GO

EXEC sys.sp_changedbowner
    @loginame = 'sa'
GO
