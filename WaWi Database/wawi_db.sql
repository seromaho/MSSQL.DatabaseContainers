-- Connect to the [master] database to run this snippet
USE [master]
GO
-- Attach the database [WaWi_DB]
CREATE DATABASE [WaWi_DB] ON 
(FILENAME = N'/var/opt/mssql/data/wawi_db.mdf'),
(FILENAME = N'/var/opt/mssql/data/wawi_db.ldf')
FOR ATTACH
GO
