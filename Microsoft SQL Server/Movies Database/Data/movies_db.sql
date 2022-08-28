USE [master]
GO

-- RESTORE DATABASE [Movies_DB]
-- FROM DISK = N'/var/opt/mssql/data/movies_db.bak'

CREATE DATABASE [Movies_DB] ON 
(FILENAME = N'/var/opt/mssql/data/movies_db.mdf'),
(FILENAME = N'/var/opt/mssql/data/movies_db.ldf')
FOR ATTACH ;
GO
