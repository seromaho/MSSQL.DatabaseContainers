USE [master]
GO

-- RESTORE DATABASE [Personal_DB]
-- FROM DISK = N'/var/opt/mssql/data/personal_db.bak'

CREATE DATABASE [Personal_DB] ON 
(FILENAME = N'/var/opt/mssql/data/personal_db.mdf'),
(FILENAME = N'/var/opt/mssql/data/personal_db.ldf')
FOR ATTACH ;
GO
