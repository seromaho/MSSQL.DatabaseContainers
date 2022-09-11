-- Connect to the [master] database to run this snippet
USE [master]
GO
-- Attach the database [Zoo_DB]
CREATE DATABASE [Zoo_DB] ON 
(FILENAME = N'/var/opt/mssql/data/zoo_db.mdf'),
(FILENAME = N'/var/opt/mssql/data/zoo_db.ldf')
FOR ATTACH
GO
