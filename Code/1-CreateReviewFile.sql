--	Create Voter database

USE [master]
GO

/****** Object:  Database [Voter]    Script Date: 11/4/2021 5:04:46 PM ******/
DROP DATABASE [SF_Development_Pipeline_2020_Q4]
GO

/****** Object:  Database [Voter]    Script Date: 11/4/2021 5:04:46 PM ******/
CREATE DATABASE [SF_Development_Pipeline_2020_Q4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SF_Development_Pipeline_2020_Q4_fact', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cellphone_reviews.mdf' , SIZE = 109504KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'cSF_Development_Pipeline_2020_Q4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SF_Development_Pipeline_2020_Q4_log.ldf' , SIZE = 193536KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

USE [SF_Development_Pipeline_2020_Q4]
GO

--	Create VoterFile table

/****** Object:  Table [dbo].[VoterFile]    Script Date: 11/4/2021 5:03:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SF_Development_Pipeline_2020_Q4]') AND type in (N'U'))
DROP TABLE [dbo].[SF_Development_Pipeline_2020_Q4]
GO

/****** Object:  Table [dbo].[VoterFile]    Script Date: 11/4/2021 5:03:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SF_Development_Pipeline_2020_Q4](
	[LANDUSE] [varchar](50) NULL,
	[BLKLOT] [varchar](50) NULL,
	[NAMEADDR] [varchar](50) NULL,
	[Entitled] [varchar](50) NULL,
	[BESTSTAT] [varchar](50) NULL, -- There's no BOOL in MSSQL
	[BESTDATE] [varchar](50) NULL,
	[UNITS] [varchar](50) NULL,
	[CFCTCO_Date] [varchar](50) NULL,
	[CFCTCO_Units] [varchar](50) NULL,
	[UNITSNET] [varchar](50) NULL,
	[Pipeline Units] [varchar](50) NULL,
	[AFFORDABLE] [varchar](50) NULL,
	[AFFORDABLENET] [varchar](50) NULL,
	[SECTION415] [varchar](50) NULL,
	[AFF_TARGET] [varchar](50) NULL,
	[TENURE_TYPE] [varchar](50) NULL,
	[CASENO] [varchar](50) NULL,
	[DESCRIPT] [varchar](50) NULL,
	[DBIDESC] [varchar](50) NULL,
	[TOTAL_GSF] [varchar](50) NULL,
	[NET_GSF] [varchar](50) NULL,
	[CIE_EXIST] [varchar](50) NULL,
	[CIE] [varchar] (50) NULL,
	[CIENET] [varchar](50) NULL,
	[MED_EXIST] [varchar](50) NULL,
	[MED] [varchar](50) NULL,
	
) ON [PRIMARY]
GO

--	Load VoterFile table from voterfile.csv using BULK INSERT
--	**Change the path to where you stored the csv file**


bulk insert reviews
from 'Y:\RPI\Data Resource Management\Project\SF_Development_Pipeline_2020_Q4.csv'
with (format = 'csv')

--	References
-----------------
--	Create Database
-- https://docs.microsoft.com/en-us/sql/t-sql/statements/create-database-transact-sql?view=sql-server-ver15&tabs=sqlpool
--
--	Create table
--	https://docs.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver15
--
--	Bulk Insert
--	https://docs.microsoft.com/en-us/sql/t-sql/statements/bulk-insert-transact-sql?view=sql-server-ver15
--
--	