USE [master]
GO

-- RESTORE DATABASE [WAWI_DB]
-- FROM DISK = N'/var/opt/mssql/data/wawi_db.bak'

CREATE DATABASE [WAWI_DB] ON 
(FILENAME = N'/var/opt/mssql/data/wawi_db.mdf'),
(FILENAME = N'/var/opt/mssql/data/wawi_db.ldf')
FOR ATTACH ;
GO
