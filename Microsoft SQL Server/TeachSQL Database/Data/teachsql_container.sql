------------------------------------------------------------------------------------------------
-- (created in 2008) by IT-Akademie Dr. Heuer GmbH
-- (modified in 2022) by seromaho
-- Achtung!!!!!!!!!!!!!!!!!!! 
-- Dieses Beispiel ben�tigt die Bild-Dateien aus dem Ordner "Data" aus dem TeachSQL-Verzeichnis.
------------------------------------------------------------------------------------------------

-- Create a new database called 'TeachSQL'
-- Connect to the 'master' database to run this snippet
USE [master]
-- Create the new database if it does not exist already
IF NOT EXISTS	(
					SELECT name
					FROM sys.databases 
					WHERE name = N'TeachSQL'
				)
				CREATE DATABASE [TeachSQL]
GO

-- Create a new table called 'tblContainer'
-- Drop the table if it already exists
Use [TeachSQL]
IF	OBJECT_ID('tblContainer', 'U') IS NOT NULL
	DROP TABLE [tblContainer]
GO
-- Create the table
CREATE TABLE [tblContainer] 
(
	[ContID] int identity(1,1) primary key,
	[CType] varchar(50) not null,			
	[Length] float not null default 0,			-- in mm
	[Width] float not null default 0,			-- in mm
	[Height] float not null default 0,			-- in mm
	[TareWeight] float not null default 0,		-- in kg
	[MaxGrossWeight] float not null default 0,	-- in kg
	[Pic] varbinary(max) not null
)
GO

INSERT INTO [tblContainer] ([CType],[Length],[Width],[Height],[TareWeight],[MaxGrossWeight],[Pic])
SELECT 'Standard-Container',5895,2350,2392,2250,30480,BulkColumn
from Openrowset( Bulk '/tmp/teachsql_container_1.jpg', Single_Blob)
as Pic

INSERT INTO [tblContainer] ([CType],[Length],[Width],[Height],[TareWeight],[MaxGrossWeight],[Pic])
SELECT 'Tank-Container',6058,2438,2438,4190,30480,BulkColumn
from Openrowset( Bulk '/tmp/teachsql_container_tank.jpg', Single_Blob)
as Pic

INSERT INTO [tblContainer] ([CType],[Length],[Width],[Height],[TareWeight],[MaxGrossWeight],[Pic])
SELECT 'High-Cube-Container',12024,2350,2697,4020,30480,BulkColumn
from Openrowset( Bulk '/tmp/teachsql_container_3.jpg', Single_Blob)
as Pic

INSERT INTO [tblContainer] ([CType],[Length],[Width],[Height],[TareWeight],[MaxGrossWeight],[Pic])
SELECT 'Hardtop-Container',5886,2342,2388,2700,30480,BulkColumn
from Openrowset( Bulk '/tmp/teachsql_container_3.jpg', Single_Blob)
as Pic

INSERT INTO [tblContainer] ([CType],[Length],[Width],[Height],[TareWeight],[MaxGrossWeight],[Pic])
SELECT 'Open Top-Container',5897,2350,2377,2350,30480,BulkColumn
from Openrowset( Bulk '/tmp/teachsql_container_4.jpg', Single_Blob)
as Pic

INSERT INTO [tblContainer] ([CType],[Length],[Width],[Height],[TareWeight],[MaxGrossWeight],[Pic])
SELECT 'Isolier- und K�hl-Container',5770,2260,2110,2900,24100,BulkColumn
from Openrowset( Bulk '/tmp/teachsql_container_91.jpg', Single_Blob)
as Pic

INSERT INTO [tblContainer] ([CType],[Length],[Width],[Height],[TareWeight],[MaxGrossWeight],[Pic])
SELECT 'Bulk-Container',5931,2358,2326,2370,24000, BulkColumn
from Openrowset( Bulk '/tmp/teachsql_container_10.jpg', Single_Blob)
as Pic
GO
