-- Create a new database called 'TeachSQL'
-- Connect to the 'master' database to run this snippet
USE master
-- Create the new database if it does not exist already
IF NOT EXISTS	(
					SELECT name
					FROM sys.databases
					WHERE name = N'TeachSQL'
				)
				CREATE DATABASE [TeachSQL]
GO

USE [TeachSQL]
-- Create a new table called 'tblDevice' in schema 'dbo'
-- Drop the table if it already exists
IF EXISTS	(
				SELECT name
				FROM sys.objects
				WHERE object_id = OBJECT_ID(N'[dbo].[tblDevice]') AND type in (N'U')
			)
			DROP TABLE [dbo].[tblDevice]
GO
CREATE TABLE tblDevice
(
	ID			INT				IDENTITY CONSTRAINT PK_DEVICE PRIMARY KEY NONCLUSTERED,
	Name		VARCHAR(100)	NOT NULL,
	Location    VARCHAR(100)	NOT NULL,
	VendorID		INT	NULL,
	-- CONSTRAINT FK_VENDOR FOREIGN KEY (VendorID) REFERENCES tblVendor(ID)
)
CREATE CLUSTERED INDEX IDX_DEVICE_NAME ON tblDevice(Name)
GO
INSERT INTO tblDevice (Name, Location, VendorID) VALUES 
('iPad (Gen1)','Office - Schwab',1),
('iPad (Gen2)','Office - Schwab',1),
('iPad (Gen3)','Office - Schwab',1),
('iPhone 4s','Office - Schwab',1),
('iMac - 2011','Home-Office - Schwab',1),
('MacBook Pro - 2012','Home-Office - Schwab',1),
('PS3','Home-Office - Paul',8),
('PS Vita','Home-Office - Paul',8),
('Laptop - 08/15','Office - Paul',2),
('Radio','Office - Vo�',5),
('Switch - 10Mbit','Office - Vo�', 12),
('Bridge - 10Mbit','Office - Vo�', 100);
GO

USE [TeachSQL]
-- Create a new table called 'tblVendor' in schema 'dbo'
-- Drop the table if it already exists
IF EXISTS	(
				SELECT name
				FROM sys.objects
				WHERE object_id = OBJECT_ID(N'[dbo].[tblVendor]') AND type in (N'U')
			)
			DROP TABLE [dbo].[tblVendor]
GO
CREATE TABLE tblVendor
(
	ID			INT				CONSTRAINT PK_VENDOR PRIMARY KEY NONCLUSTERED,
	Name		VARCHAR(100)	NOT NULL
)
GO
CREATE CLUSTERED INDEX IDX_NAME ON tblVendor(Name);
GO
INSERT INTO tblVendor
VALUES (1,'Apple'),(2,'Compaq/HP'),(3,'Lenovo'),(4,'DELL'),(5,'Samsung'),(6,'Asus'),(7,'Toshiba'),(8,'Sony');
GO
