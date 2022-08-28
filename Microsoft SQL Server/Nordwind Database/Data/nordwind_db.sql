USE [master]
GO

-- RESTORE DATABASE [Nordwind_DB]
-- FROM DISK = N'/var/opt/mssql/data/nordwind_db.bak'

CREATE DATABASE [Nordwind_DB] ON 
(FILENAME = N'/var/opt/mssql/data/nordwind_db.mdf'),
(FILENAME = N'/var/opt/mssql/data/nordwind_db.ldf')
FOR ATTACH ;
GO
