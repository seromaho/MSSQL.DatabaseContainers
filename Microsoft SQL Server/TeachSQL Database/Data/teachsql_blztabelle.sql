-- Create a new database called 'TeachSQL'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS	(
					SELECT name
					FROM sys.databases
					WHERE name = N'TeachSQL'
				)
				CREATE DATABASE [TeachSQL]
GO

USE [TeachSQL]
GO
-- Create a new table called 'BLZTabelle'
-- Drop the table if it already exists
IF OBJECT_ID('BLZTabelle', 'U') IS NOT NULL
DROP TABLE [BLZTabelle]
GO
-- Create the table
CREATE TABLE [BLZTabelle]
(
	[BLZ] [nvarchar](50) NULL,
	[Merkmal] [smallint] NULL,
	[Bezeichnung] [varchar](58) NULL,
	[PLZ] [int] NULL,
	[Ort] [varchar](35) NULL,
	[Kurzbezeichnung] [varchar](27) NULL,
	[PAN] [int] NULL,
	[BIC] [varchar](11) NULL,
	[Pruefzifferberechnungsmethode] [varchar](2) NULL,
	[Datensatznummer] [int] NULL,
	[Aenderungskennzeichen] [varchar](1) NULL,
	[Bankleitzahlloeschung] [smallint] NULL,
	[NachfolgeBLZ] [nvarchar](50) NULL
)
GO

-- Import table data into table 'BLZTabelle' from the specified file
-- Skip the header (first row)
-- Use a pipe (|) as the field terminator
-- Use the default row terminator: the newline character (\n)
BULK INSERT [BLZTabelle]
FROM '/tmp/teachsql_blztabelle_data.csv'
WITH
(
	-- CODEPAGE = 'ACP',
	FIELDTERMINATOR = '|',
	FIRSTROW = 2
)
GO

ALTER TABLE [BLZTabelle] ADD ID INT IDENTITY(1,1) NOT NULL
GO

ALTER TABLE [BLZTabelle] ADD CONSTRAINT PK_BLZDaten PRIMARY KEY(ID)
GO
