-- Connect to the [master] database to run this snippet
USE [master]
GO
-- Attach the database [Nordwind_DB]
CREATE DATABASE [Nordwind_DB] ON 
(FILENAME = N'/var/opt/mssql/data/nordwind_db.mdf'),
(FILENAME = N'/var/opt/mssql/data/nordwind_db.ldf')
FOR ATTACH
GO
