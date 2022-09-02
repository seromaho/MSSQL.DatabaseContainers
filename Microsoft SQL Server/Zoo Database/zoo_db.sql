USE [master]
GO

-- RESTORE DATABASE [Zoo_DB]
-- FROM DISK = N'/var/opt/mssql/data/zoo_db.bak'

CREATE DATABASE [Zoo_DB] ON 
(FILENAME = N'/var/opt/mssql/data/zoo_db.mdf'),
(FILENAME = N'/var/opt/mssql/data/zoo_db.ldf')
FOR ATTACH ;
GO
