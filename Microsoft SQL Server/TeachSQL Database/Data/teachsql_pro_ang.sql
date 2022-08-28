---------------------------------------------------------------------
-- (created in 2008) by IT-Akademie Dr. Heuer GmbH
-- (modified in 2022) by seromaho
---------------------------------------------------------------------

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

Use [TeachSQL]
-- Create a new table called 'pro_ang'
-- Drop the table 'pro_ang' if it already exists
IF	OBJECT_ID('pro_ang', 'U') IS NOT NULL
	DROP TABLE [pro_ang]
GO
-- Create the table
CREATE TABLE pro_ang
(
	p_nr int not null,
	a_nr int not null,
	proz_arb int not null
)
GO
INSERT INTO pro_ang
VALUES
	(17, 198, 30)
INSERT INTO pro_ang
VALUES
	(17, 307, 45)
INSERT INTO pro_ang
VALUES
	(18, 117, 20)
INSERT INTO pro_ang
VALUES
	(18, 198, 70)
INSERT INTO pro_ang
VALUES
	(18, 307, 55)
INSERT INTO pro_ang
VALUES
	(33, 117, 80)
INSERT INTO pro_ang
VALUES
	(33, 400, 100)
INSERT INTO pro_ang
VALUES
	(33, 401, 90)
GO

Use [TeachSQL]
-- Create a new table called 'pro'
-- Drop the table 'pro' if it already exists
IF	OBJECT_ID('pro', 'U') IS NOT NULL
	DROP TABLE [pro]
GO
-- Create the table
CREATE TABLE pro
(
	p_nr int primary key,
	p_name varchar(50) not null,
	p_beschr varchar(50) not null,
	p_leiter int not null
)
GO
INSERT INTO pro
VALUES
	(12, 'P1', 'FIBU', 205)
INSERT INTO pro
VALUES
	(17, 'P3', 'SNA', 307)
INSERT INTO pro
VALUES
	(18, 'P4', 'DBS', 307)
INSERT INTO pro
VALUES
	(33, 'P5', 'ISDB', 117)
GO

Use [TeachSQL]
-- Create a new table called 'ang'
-- Drop the table 'ang' if it already exists
IF OBJECT_ID('ang', 'U') IS NOT NULL
BEGIN
	IF OBJECT_ID('FK_VORGESETZ') IS NOT NULL
		ALTER TABLE ang  DROP CONSTRAINT FK_VORGESETZ
	IF OBJECT_ID('FK_ABT_LEITER') IS NOT NULL
		ALTER TABLE abt  DROP CONSTRAINT FK_ABT_LEITER
	DROP TABLE [ang]
END
GO
-- Create the table
CREATE TABLE ang
(
	a_nr int primary key,
	[name] varchar(50) not null,
	beruf varchar(50) not null,
	abt_nr int not null,
	vorg int null,
	gehalt decimal(10,2) not null
)
GO
INSERT INTO ang
VALUES
	(112, 'Mang', 'Progr', 1, 205, 4300)
INSERT INTO ang
VALUES
	(117, 'Seel', 'Ing', 3, 401, 4100)
INSERT INTO ang
VALUES
	(198, 'Feld', 'Kauf', 3, 401, 4100)
INSERT INTO ang
VALUES
	(205, 'Wind', 'Organ', 1, NULL, 5100)
INSERT INTO ang
VALUES
	(301, 'Karl', 'Progr', 2, 401, 5000)
INSERT INTO ang
VALUES
	(307, 'Mill', 'Progr', 2, 205, 5400)
INSERT INTO ang
VALUES
	(350, 'Otto', 'Kauf', 3, 205, 4700)
INSERT INTO ang
VALUES
	(374, 'Kaemp', 'Sekr', 3, 401, 3800)
INSERT INTO ang
VALUES
	(400, 'Klef', 'Sekr', 3, 198, 3800)
INSERT INTO ang
VALUES
	(401, 'Paul', 'Sekr', 3, 401, 5240)
GO

Use [TeachSQL]
-- Create a new table called 'abt'
-- Drop the table 'abt' if it already exists
IF	OBJECT_ID('abt', 'U') IS NOT NULL
	DROP TABLE [abt]
GO
-- Create the table
CREATE TABLE abt
(
	abt_nr int primary key,
	abt_name varchar(50) not null,
	abt_leiter int not null
)
GO
INSERT INTO abt
VALUES
	(1, 'Verwaltung', 205)
INSERT INTO abt
VALUES
	(2, 'Vertrieb', 307)
INSERT INTO abt
VALUES
	(3, 'Entwicklung', 301)
GO

Use [TeachSQL]
ALTER TABLE abt ADD CONSTRAINT FK_ABT_LEITER FOREIGN KEY (abt_leiter) REFERENCES ang(a_nr)
ALTER TABLE ang ADD CONSTRAINT FK_ABT FOREIGN KEY (abt_nr) REFERENCES abt(abt_nr)
ALTER TABLE ang ADD CONSTRAINT FK_VORGESETZ FOREIGN KEY (vorg) REFERENCES ang(a_nr)
ALTER TABLE pro_ang ADD CONSTRAINT FK_ANG FOREIGN KEY (a_nr) REFERENCES ang(a_nr)
ALTER TABLE pro_ang ADD CONSTRAINT FK_PRO FOREIGN KEY (p_nr) REFERENCES pro(p_nr)
ALTER TABLE pro ADD CONSTRAINT FK_PRO_LEITER FOREIGN KEY (p_leiter) REFERENCES ang(a_nr)
GO
