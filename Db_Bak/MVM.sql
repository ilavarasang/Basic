﻿USE [master]
GO
/****** Object:  Database [MVM]    Script Date: 03/24/2016 17:14:19 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'MVM')
BEGIN
CREATE DATABASE [MVM] ON  PRIMARY 
( NAME = N'MVM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MVM.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MVM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MVM_1.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [MVM] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVM] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MVM] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MVM] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MVM] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MVM] SET ARITHABORT OFF
GO
ALTER DATABASE [MVM] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MVM] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MVM] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MVM] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MVM] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MVM] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MVM] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MVM] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MVM] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MVM] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MVM] SET  DISABLE_BROKER
GO
ALTER DATABASE [MVM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MVM] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MVM] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MVM] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MVM] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MVM] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MVM] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MVM] SET  READ_WRITE
GO
ALTER DATABASE [MVM] SET RECOVERY FULL
GO
ALTER DATABASE [MVM] SET  MULTI_USER
GO
ALTER DATABASE [MVM] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MVM] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVM', N'ON'
GO
USE [MVM]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_EMP_ID]    Script Date: 03/24/2016 17:14:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_EMP_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_EMP_ID]
GO
/****** Object:  StoredProcedure [dbo].[uspEmployeePrint]    Script Date: 03/24/2016 17:14:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspEmployeePrint]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspEmployeePrint]
GO
/****** Object:  Table [dbo].[MASTER_TABLE]    Script Date: 03/24/2016 17:14:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MASTER_TABLE]') AND type in (N'U'))
DROP TABLE [dbo].[MASTER_TABLE]
GO
/****** Object:  Table [dbo].[USER_MASTER]    Script Date: 03/24/2016 17:14:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USER_MASTER]') AND type in (N'U'))
DROP TABLE [dbo].[USER_MASTER]
GO
/****** Object:  StoredProcedure [dbo].[uspEmployeeList]    Script Date: 03/24/2016 17:14:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspEmployeeList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspEmployeeList]
GO
/****** Object:  Table [dbo].[COMPANY_MASTER]    Script Date: 03/24/2016 17:14:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMPANY_MASTER]') AND type in (N'U'))
DROP TABLE [dbo].[COMPANY_MASTER]
GO
/****** Object:  Table [dbo].[EMPLOYEE_EXPERIENCE]    Script Date: 03/24/2016 17:14:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_EXPERIENCE]') AND type in (N'U'))
DROP TABLE [dbo].[EMPLOYEE_EXPERIENCE]
GO
/****** Object:  Table [dbo].[EMPLOYEE_FAMILY]    Script Date: 03/24/2016 17:14:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_FAMILY]') AND type in (N'U'))
DROP TABLE [dbo].[EMPLOYEE_FAMILY]
GO
/****** Object:  Table [dbo].[EMPLOYEE_MASTER]    Script Date: 03/24/2016 17:14:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_MASTER]') AND type in (N'U'))
DROP TABLE [dbo].[EMPLOYEE_MASTER]
GO
/****** Object:  Table [dbo].[EMPLOYEE_QUALIFICATION]    Script Date: 03/24/2016 17:14:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_QUALIFICATION]') AND type in (N'U'))
DROP TABLE [dbo].[EMPLOYEE_QUALIFICATION]
GO
/****** Object:  Table [dbo].[EMPLOYEE_QUALIFICATION]    Script Date: 03/24/2016 17:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_QUALIFICATION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLOYEE_QUALIFICATION](
	[SYS_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMP_SYS_ID] [int] NULL,
	[QUALIFICATION] [nvarchar](max) NULL,
	[SUBJECT] [nvarchar](max) NULL,
	[DEGREE] [nvarchar](max) NULL,
	[INSTUT] [nvarchar](max) NULL,
	[MEDIUM] [nvarchar](max) NULL,
	[PASS_YEAR] [nvarchar](max) NULL,
	[PERCENTAGE] [nvarchar](max) NULL,
	[ISDELETED] [tinyint] NULL,
 CONSTRAINT [PK_EMPLOYEE_QUALIFICATION] PRIMARY KEY CLUSTERED 
(
	[SYS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EMPLOYEE_QUALIFICATION] ON
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (1, 1, N'SSLC', N'dfs', NULL, N'sdf', N'sdf', N'sdf', N'sdf', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (2, 1, N'HSC', N'fsd', NULL, N'sdf', N'sdf', N'dsf', N'sdfs', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (3, 2, N'Diploma', N'JADE', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (4, 2, N'HSC', N'HGFF', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (5, 4, N'SSLC', NULL, NULL, N'Kendriya Vidyalaya', N'English', N'1988', N'I', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (6, 4, N'HSC', N'PCBM', NULL, N'Kendriya Vidyalaya', N'English', N'1990', N'I', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (7, 4, N'Diploma', NULL, NULL, N'D.B.H.P. Sabha', N'Hindi', N'1995', N'I', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (8, 4, N'UG', N'Zoology', NULL, N'Madras University', N'English', N'1993', N'68 %', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (9, 4, N'PG', N'Zoology', NULL, N'Madras University', N'English', N'2010', N'65%', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (10, 4, N'PG', N'Hindi', NULL, N'D.B.H.P Sabha', N'Hindi', N'1997', N'59%', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (11, 4, N'B.Ed', N'Biology, Hindi', NULL, N'D.B.H.P. Sabha', N'Hindi', N'1994', N'74%', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (12, 5, N'SSLC', NULL, NULL, N'Kendriya Vidyalaya', N'English', N'1981', NULL, 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (13, 5, N'HSC', NULL, NULL, N'Kendriya Vidyalaya', N'English', N'1983', N'65%', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (14, 5, N'Diploma', NULL, NULL, N'IIMB-Bangalore', N'English', N'2011', NULL, 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (15, 5, N'UG', N'English', NULL, N'Venkateshwara college- DElhi', N'English', N'1987', N'60%', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (16, 5, N'PG', N'English', NULL, N'TNOU-Mysore University', N'English', N'2007', N'73%', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (17, 5, N'PG', N'Hindi', NULL, N'TNOU- Mysore University', N'Hindi', N'1996', N'65%', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (18, 5, N'B.Ed', NULL, NULL, N'TNOU', N'History', N'1992', N'60%', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (19, 5, N'Others', N'English, Hindi', NULL, N'Vinayaka Mission', N'English', N'2008', N'63%', 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (20, 6, N'SSLC', N'U', NULL, N'YUI', N'HUI', NULL, NULL, 0)
INSERT [dbo].[EMPLOYEE_QUALIFICATION] ([SYS_ID], [EMP_SYS_ID], [QUALIFICATION], [SUBJECT], [DEGREE], [INSTUT], [MEDIUM], [PASS_YEAR], [PERCENTAGE], [ISDELETED]) VALUES (21, 6, N'HSC', N'HUK', NULL, N'KH', N'KH', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[EMPLOYEE_QUALIFICATION] OFF
/****** Object:  Table [dbo].[EMPLOYEE_MASTER]    Script Date: 03/24/2016 17:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_MASTER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLOYEE_MASTER](
	[SYS_ID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [nvarchar](max) NULL,
	[FULL_NAME] [nvarchar](max) NULL,
	[DIVISION] [nvarchar](max) NULL,
	[GRADE] [nvarchar](max) NULL,
	[DESIGNATION] [nvarchar](max) NULL,
	[DOB] [datetime] NULL,
	[PLACE_BIRTH] [nvarchar](max) NULL,
	[DOJ] [datetime] NULL,
	[PANCARD] [nvarchar](max) NULL,
	[PASSPORT] [nvarchar](max) NULL,
	[BG] [nvarchar](max) NULL,
	[RELIGION] [nvarchar](max) NULL,
	[CAST] [nvarchar](max) NULL,
	[SALARY] [nvarchar](max) NULL,
	[ESI] [nvarchar](max) NULL,
	[EPF] [nvarchar](max) NULL,
	[PERM_ADDR] [nvarchar](max) NULL,
	[PERM_EMAIL] [nvarchar](max) NULL,
	[PERM_MOBILE] [nvarchar](max) NULL,
	[PRES_ADDR] [nvarchar](max) NULL,
	[PRES_EMAIL] [nvarchar](max) NULL,
	[PRES_MOBILE] [nvarchar](max) NULL,
	[EMG_CON_NAME] [nvarchar](max) NULL,
	[EMG_CON_PHONE] [nvarchar](max) NULL,
	[EMG_CON_MOBILE] [nvarchar](max) NULL,
	[IMG] [nvarchar](max) NULL,
	[ISDELETED] [tinyint] NULL,
 CONSTRAINT [PK_EMPLOYEE_MASTER] PRIMARY KEY CLUSTERED 
(
	[SYS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EMPLOYEE_MASTER] ON
INSERT [dbo].[EMPLOYEE_MASTER] ([SYS_ID], [ID], [FULL_NAME], [DIVISION], [GRADE], [DESIGNATION], [DOB], [PLACE_BIRTH], [DOJ], [PANCARD], [PASSPORT], [BG], [RELIGION], [CAST], [SALARY], [ESI], [EPF], [PERM_ADDR], [PERM_EMAIL], [PERM_MOBILE], [PRES_ADDR], [PRES_EMAIL], [PRES_MOBILE], [EMG_CON_NAME], [EMG_CON_PHONE], [EMG_CON_MOBILE], [IMG], [ISDELETED]) VALUES (1, N'EMP-160201', N'Test', N'Pre_Primary', N'I', N'Ministrail Staff', CAST(0x0000A5B800000000 AS DateTime), NULL, CAST(0x0000A5B800000000 AS DateTime), NULL, NULL, NULL, N'Hindu', NULL, NULL, NULL, NULL, N'Test', N'fdf', N'sdfsd', N'Test', NULL, NULL, N'dsfs', NULL, N'sdfs', N'/App_Upload//User_Img//1602261739313931_face3.png', 1)
INSERT [dbo].[EMPLOYEE_MASTER] ([SYS_ID], [ID], [FULL_NAME], [DIVISION], [GRADE], [DESIGNATION], [DOB], [PLACE_BIRTH], [DOJ], [PANCARD], [PASSPORT], [BG], [RELIGION], [CAST], [SALARY], [ESI], [EPF], [PERM_ADDR], [PERM_EMAIL], [PERM_MOBILE], [PRES_ADDR], [PRES_EMAIL], [PRES_MOBILE], [EMG_CON_NAME], [EMG_CON_PHONE], [EMG_CON_MOBILE], [IMG], [ISDELETED]) VALUES (2, N'EMP-160302', N'Prabakaran', N'Pre_Primary', N'LKG', N'Teacher', CAST(0x0000A5C500000000 AS DateTime), N'dfsdfghjg', CAST(0x0000A5CC00000000 AS DateTime), N'fsdf', N'dsfs', N'fsdf', N'Hindu', N'sdfsd', N'fsdfsdf', N'sdfsd', N'dsd', N'SALEM', N'fsdf', N'sdf', N'HOSUR', NULL, NULL, N'sdfs', NULL, N'dfsdfs', N'/App_Upload//User_Img//1603101249284928_Prabakaran_Developer.png', 1)
INSERT [dbo].[EMPLOYEE_MASTER] ([SYS_ID], [ID], [FULL_NAME], [DIVISION], [GRADE], [DESIGNATION], [DOB], [PLACE_BIRTH], [DOJ], [PANCARD], [PASSPORT], [BG], [RELIGION], [CAST], [SALARY], [ESI], [EPF], [PERM_ADDR], [PERM_EMAIL], [PERM_MOBILE], [PRES_ADDR], [PRES_EMAIL], [PRES_MOBILE], [EMG_CON_NAME], [EMG_CON_PHONE], [EMG_CON_MOBILE], [IMG], [ISDELETED]) VALUES (3, N'EMP-160303', N'xczxc', N'Pre_Primary', N'LKG', N'Teacher', CAST(0x0000A5C500000000 AS DateTime), N'xzczxc', CAST(0x0000A5C500000000 AS DateTime), N'xcvzxvc', N'xczvzx', N'zxc', N'Hindu', N'zxczxc', N'czxc', N'cxzczxczxc', N'zvxczx', N'xczx', N'czxczxczxc', N'czx', N'czxcz', NULL, NULL, N'xczxc', NULL, N'zxczx', N'/App_Upload//User_Img//1603101240524052_periyaruniversity.png', 1)
INSERT [dbo].[EMPLOYEE_MASTER] ([SYS_ID], [ID], [FULL_NAME], [DIVISION], [GRADE], [DESIGNATION], [DOB], [PLACE_BIRTH], [DOJ], [PANCARD], [PASSPORT], [BG], [RELIGION], [CAST], [SALARY], [ESI], [EPF], [PERM_ADDR], [PERM_EMAIL], [PERM_MOBILE], [PRES_ADDR], [PRES_EMAIL], [PRES_MOBILE], [EMG_CON_NAME], [EMG_CON_PHONE], [EMG_CON_MOBILE], [IMG], [ISDELETED]) VALUES (4, N'EMP-160304', N'HARIPRIYA. C', N'Senior_Secondary', N'XII', N'Teacher', CAST(0x000068C100000000 AS DateTime), N'VELLORE', CAST(0x000092F500000000 AS DateTime), N'AGPPH2717W', N'M2593323', N'O+ve', N'Hindu', N'FC', NULL, NULL, NULL, N'SHRI SAI NIVAS, THIRUMALAI NAGAR
3/494-H AVALAPALLI ROAD
HOSUR', N'prsdpm689@gmail.com', N'9442054229', NULL, NULL, NULL, N'P.M.Prasad', NULL, N'9442054229', N'/App_Upload//User_Img//160312140730730_HARIPRIYA. C.bmp', 0)
INSERT [dbo].[EMPLOYEE_MASTER] ([SYS_ID], [ID], [FULL_NAME], [DIVISION], [GRADE], [DESIGNATION], [DOB], [PLACE_BIRTH], [DOJ], [PANCARD], [PASSPORT], [BG], [RELIGION], [CAST], [SALARY], [ESI], [EPF], [PERM_ADDR], [PERM_EMAIL], [PERM_MOBILE], [PRES_ADDR], [PRES_EMAIL], [PRES_MOBILE], [EMG_CON_NAME], [EMG_CON_PHONE], [EMG_CON_MOBILE], [IMG], [ISDELETED]) VALUES (5, N'EMP-160305', N'SHAILA.R', N'Senior_Secondary', N'XII', N'Teacher', CAST(0x0000890A00000000 AS DateTime), N'CHENNAI', CAST(0x00007F2100000000 AS DateTime), N'BNHPS4675Q', N'F8979093', N'Ab+', N'Hindu', N'BRAHMIN', NULL, NULL, NULL, N'No. 537, New Astc Hudco,Phase VIII, 
Near Thirupathi Store, 
Hosur', N'shaila.balaji@yahoo.com', N'9443511232', N'No. 537, New Astc Hudco,Phase VIII, 
Near Thirupathi Store, 
Hosur', NULL, NULL, N'BALAJI.R', NULL, N'9443708863', N'/App_Upload//User_Img//160312133107317_SHAILA.R.bmp', 0)
INSERT [dbo].[EMPLOYEE_MASTER] ([SYS_ID], [ID], [FULL_NAME], [DIVISION], [GRADE], [DESIGNATION], [DOB], [PLACE_BIRTH], [DOJ], [PANCARD], [PASSPORT], [BG], [RELIGION], [CAST], [SALARY], [ESI], [EPF], [PERM_ADDR], [PERM_EMAIL], [PERM_MOBILE], [PRES_ADDR], [PRES_EMAIL], [PRES_MOBILE], [EMG_CON_NAME], [EMG_CON_PHONE], [EMG_CON_MOBILE], [IMG], [ISDELETED]) VALUES (6, N'EMP-160306', N'Jade', N'Pre_Primary', N'UKG', N'Teacher', CAST(0x0000A5C300000000 AS DateTime), N'SALEM', CAST(0x0000A5C300000000 AS DateTime), N'1234', N'1234', NULL, N'Hindu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/App_Upload/User_Img/avatar.png', 1)
SET IDENTITY_INSERT [dbo].[EMPLOYEE_MASTER] OFF
/****** Object:  Table [dbo].[EMPLOYEE_FAMILY]    Script Date: 03/24/2016 17:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_FAMILY]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLOYEE_FAMILY](
	[SYS_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMP_SYS_ID] [int] NULL,
	[RELATION_TYPE] [nvarchar](max) NULL,
	[NAME] [nvarchar](max) NULL,
	[DOB] [nvarchar](max) NULL,
	[QUALIFICATION] [nvarchar](max) NULL,
	[EMP_NAME] [nvarchar](max) NULL,
	[BG] [nvarchar](max) NULL,
	[MEDIC_PROBLEM] [nvarchar](max) NULL,
	[PHY_DISABILITY] [nvarchar](max) NULL,
	[ISDELETED] [tinyint] NULL,
 CONSTRAINT [PK_EMPLOYEE_FAMILY] PRIMARY KEY CLUSTERED 
(
	[SYS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EMPLOYEE_FAMILY] ON
INSERT [dbo].[EMPLOYEE_FAMILY] ([SYS_ID], [EMP_SYS_ID], [RELATION_TYPE], [NAME], [DOB], [QUALIFICATION], [EMP_NAME], [BG], [MEDIC_PROBLEM], [PHY_DISABILITY], [ISDELETED]) VALUES (1, 1, N'Child', N'dfsd', NULL, N'fsd', N'fsdf', N'sdfsd', N'sdfsd', N'sdfsdf', 0)
INSERT [dbo].[EMPLOYEE_FAMILY] ([SYS_ID], [EMP_SYS_ID], [RELATION_TYPE], [NAME], [DOB], [QUALIFICATION], [EMP_NAME], [BG], [MEDIC_PROBLEM], [PHY_DISABILITY], [ISDELETED]) VALUES (2, 2, N'Spouse', N'RTY', NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[EMPLOYEE_FAMILY] ([SYS_ID], [EMP_SYS_ID], [RELATION_TYPE], [NAME], [DOB], [QUALIFICATION], [EMP_NAME], [BG], [MEDIC_PROBLEM], [PHY_DISABILITY], [ISDELETED]) VALUES (3, 2, N'Child', N'FHCGH', NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[EMPLOYEE_FAMILY] ([SYS_ID], [EMP_SYS_ID], [RELATION_TYPE], [NAME], [DOB], [QUALIFICATION], [EMP_NAME], [BG], [MEDIC_PROBLEM], [PHY_DISABILITY], [ISDELETED]) VALUES (4, 4, N'Spouse', N'P.M.Prasad', NULL, N'B.Sc, Bed, MA', N'Govt School', N'O+ve', NULL, NULL, 0)
INSERT [dbo].[EMPLOYEE_FAMILY] ([SYS_ID], [EMP_SYS_ID], [RELATION_TYPE], [NAME], [DOB], [QUALIFICATION], [EMP_NAME], [BG], [MEDIC_PROBLEM], [PHY_DISABILITY], [ISDELETED]) VALUES (5, 4, N'Child', N'P.Harish Reddy', NULL, N'IX', N'MVM.Sr.Sec.School', N'O+ve', NULL, NULL, 0)
INSERT [dbo].[EMPLOYEE_FAMILY] ([SYS_ID], [EMP_SYS_ID], [RELATION_TYPE], [NAME], [DOB], [QUALIFICATION], [EMP_NAME], [BG], [MEDIC_PROBLEM], [PHY_DISABILITY], [ISDELETED]) VALUES (6, 4, N'Child', N'P.Harshitashri', NULL, N'IX', N'MVM.Sr.Sec.School', N'O+ve', NULL, NULL, 0)
INSERT [dbo].[EMPLOYEE_FAMILY] ([SYS_ID], [EMP_SYS_ID], [RELATION_TYPE], [NAME], [DOB], [QUALIFICATION], [EMP_NAME], [BG], [MEDIC_PROBLEM], [PHY_DISABILITY], [ISDELETED]) VALUES (7, 5, N'Spouse', N'BALAJI.R', NULL, N'MA Sociology', N'Titan Industry Ltd', N'A+ve', N'Diabetes, Acute Renal Failure', NULL, 0)
INSERT [dbo].[EMPLOYEE_FAMILY] ([SYS_ID], [EMP_SYS_ID], [RELATION_TYPE], [NAME], [DOB], [QUALIFICATION], [EMP_NAME], [BG], [MEDIC_PROBLEM], [PHY_DISABILITY], [ISDELETED]) VALUES (8, 5, N'Child', N'ARVIND.B', NULL, N'M.S.W', N'Delphi Tvs', N'AB+ve', NULL, NULL, 0)
INSERT [dbo].[EMPLOYEE_FAMILY] ([SYS_ID], [EMP_SYS_ID], [RELATION_TYPE], [NAME], [DOB], [QUALIFICATION], [EMP_NAME], [BG], [MEDIC_PROBLEM], [PHY_DISABILITY], [ISDELETED]) VALUES (9, 5, N'Child', N'ANIRUD.B', NULL, N'B.Com, MBA Hr', N'Bubbles Pvt Ltd', N'B+ve', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[EMPLOYEE_FAMILY] OFF
/****** Object:  Table [dbo].[EMPLOYEE_EXPERIENCE]    Script Date: 03/24/2016 17:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_EXPERIENCE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLOYEE_EXPERIENCE](
	[SYS_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMP_SYS_ID] [int] NULL,
	[SCHOOL] [nvarchar](max) NULL,
	[FRM_DT] [nvarchar](max) NULL,
	[TO_DT] [nvarchar](max) NULL,
	[DESIGNATION] [nvarchar](max) NULL,
	[ISDELETED] [tinyint] NULL,
 CONSTRAINT [PK_EMPLOYEE_EXPERIENCE] PRIMARY KEY CLUSTERED 
(
	[SYS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EMPLOYEE_EXPERIENCE] ON
INSERT [dbo].[EMPLOYEE_EXPERIENCE] ([SYS_ID], [EMP_SYS_ID], [SCHOOL], [FRM_DT], [TO_DT], [DESIGNATION], [ISDELETED]) VALUES (1, 1, N'dsfsd', N'sdfsd', N'sdfs', N'sdfsd', 0)
INSERT [dbo].[EMPLOYEE_EXPERIENCE] ([SYS_ID], [EMP_SYS_ID], [SCHOOL], [FRM_DT], [TO_DT], [DESIGNATION], [ISDELETED]) VALUES (2, 2, N'LFHSS', N'2010', N'1090', N'TEST', 0)
INSERT [dbo].[EMPLOYEE_EXPERIENCE] ([SYS_ID], [EMP_SYS_ID], [SCHOOL], [FRM_DT], [TO_DT], [DESIGNATION], [ISDELETED]) VALUES (3, 4, N'Model Matric School - chennai', N'1994', N'1997', N'Teacher', 0)
INSERT [dbo].[EMPLOYEE_EXPERIENCE] ([SYS_ID], [EMP_SYS_ID], [SCHOOL], [FRM_DT], [TO_DT], [DESIGNATION], [ISDELETED]) VALUES (4, 4, N'Swamy Sivanandha Educational Society, Bangalore', N'1999', N'2000', N'Ass. Head . Mistress', 0)
INSERT [dbo].[EMPLOYEE_EXPERIENCE] ([SYS_ID], [EMP_SYS_ID], [SCHOOL], [FRM_DT], [TO_DT], [DESIGNATION], [ISDELETED]) VALUES (5, 5, N'MVM.Sr.Sec.School', N'08-02-89', N'2009', N'Teacher', 0)
INSERT [dbo].[EMPLOYEE_EXPERIENCE] ([SYS_ID], [EMP_SYS_ID], [SCHOOL], [FRM_DT], [TO_DT], [DESIGNATION], [ISDELETED]) VALUES (6, 5, N'MVM.Sr.Sec.School', N'2009', NULL, N'Principal', 0)
SET IDENTITY_INSERT [dbo].[EMPLOYEE_EXPERIENCE] OFF
/****** Object:  Table [dbo].[COMPANY_MASTER]    Script Date: 03/24/2016 17:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMPANY_MASTER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[COMPANY_MASTER](
	[SYS_ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[ADDRESS_1] [nvarchar](50) NULL,
	[ADDRESS_2] [nvarchar](50) NULL,
	[CITY] [nvarchar](50) NULL,
	[PHONE] [nvarchar](50) NULL,
	[MOBILE] [nvarchar](50) NULL,
	[IMG] [nvarchar](50) NULL,
	[ISDELETED] [nvarchar](50) NULL,
 CONSTRAINT [PK_COMPANY_MASTER] PRIMARY KEY CLUSTERED 
(
	[SYS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[uspEmployeeList]    Script Date: 03/24/2016 17:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspEmployeeList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Saravanan
-- Modified On: 2016-02-26
-- Description:	Returns the Employee list
-- =============================================
-- exec uspEmployeeList ''1'',''100'',''FULL_NAME'',''DESC'','''','''',''''
CREATE PROCEDURE [dbo].[uspEmployeeList]
	@intPageNo as int, @intPageSize as int,
	@strOrderBy as varchar(MAX), @strOrderType as varchar(MAX),
	@strSearchBy as varchar(MAX), @strSearchText as varchar(MAX),
	@intItemCount as int out
AS
BEGIN
BEGIN TRY
	--Declare @IncludeDelete as varchar(MAX) Set @IncludeDelete=0;
	
	SET @strOrderBy = REPLACE(@strOrderBy, "''","")
	SET @strOrderType = REPLACE(@strOrderType, "''","")
	SET @strSearchBy = REPLACE(@strSearchBy, "''","")
	SET @strSearchText = REPLACE(@strSearchText, "''","''''")
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @fromIdx as int
	Declare @toIdx as int 

	Set @fromIdx = (@intPageNo-1) * @intPageSize+1;
	Set @toIdx = (@intPageNo * @intPageSize);
	
	IF(@strSearchText<>'''') BEGIN
		--SET @strSearchBy = "AND " + @strSearchBy + " like ''%" + @strSearchText + "%''";
		SET @strSearchBy = "AND " + @strSearchBy + " like ''%'' + @strSearchText + ''%''";
	END
	ELSE BEGIN
		SET @strSearchBy = '''';
	END
	
	Declare @DeleteQuery as varchar(MAX)
	SET @DeleteQuery = " And EMP.ISDELETED <> 1";
	
	Declare @CountSql as varchar(MAX)
	Set @CountSql = "
	DECLARE @strSearchText AS nvarchar(MAX) SET @strSearchText = ''" + @strSearchText + "''
	   SELECT	 
		  COUNT(1)    
	   FROM EMPLOYEE_MASTER EMP
	   WHERE 1=1 " + @DeleteQuery + @strSearchBy;
	PRINT(@CountSql)
	exec(@CountSql);

	Declare @Sql as varchar(MAX)
	Set @Sql = "
	DECLARE @strSearchText AS nvarchar(MAX) SET @strSearchText = ''" + @strSearchText + "''
	;WITH result_set AS (
	  SELECT
		  ROW_NUMBER() OVER (ORDER BY " + @strOrderBy + " " + @strOrderType + ") AS [SNo],
		  *
	   FROM EMPLOYEE_MASTER EMP
	   WHERE 1=1 " + @DeleteQuery + @strSearchBy + "
	)
	SELECT 
	  * 
	FROM 
	  result_set 
	WHERE 
	  [SNo] BETWEEN " + Cast(@fromIdx as varchar(20)) + " AND " + Cast(@toIdx as varchar(20)) + "";
	print (@Sql);
	exec(@Sql);
END TRY
BEGIN CATCH
	RAISERROR (''Error while excuting your request'', 16,0)
END CATCH
END
' 
END
GO
/****** Object:  Table [dbo].[USER_MASTER]    Script Date: 03/24/2016 17:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USER_MASTER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USER_MASTER](
	[SYS_ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](max) NULL,
	[LOGIN_NAME] [nvarchar](max) NULL,
	[PASSWORD] [nvarchar](max) NULL,
	[IMG] [nvarchar](max) NULL,
	[ISDELETED] [tinyint] NULL,
 CONSTRAINT [PK_USER_MASTER] PRIMARY KEY CLUSTERED 
(
	[SYS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MASTER_TABLE]    Script Date: 03/24/2016 17:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MASTER_TABLE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MASTER_TABLE](
	[SYS_ID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [nvarchar](max) NULL,
	[NAME] [nvarchar](max) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
	[TYPE] [nvarchar](max) NULL,
	[ISDELETED] [tinyint] NULL,
 CONSTRAINT [PK_MASTER_TABLE] PRIMARY KEY CLUSTERED 
(
	[SYS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[uspEmployeePrint]    Script Date: 03/24/2016 17:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspEmployeePrint]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Saravanan
-- Modified On: 2016-02-26
-- Description:	Returns the Employee list
-- =============================================
-- exec uspEmployeeList ''1'',''100'',''FULL_NAME'',''DESC'','''','''',''''
CREATE PROCEDURE [dbo].[uspEmployeePrint]
	@EMP_SYS_ID AS INT
AS
BEGIN
BEGIN TRY
	--Declare @IncludeDelete as varchar(MAX) Set @IncludeDelete=0;
	
	SELECT [SYS_ID]
      ,[ID]
      ,[FULL_NAME]
      ,[DIVISION]
      ,[GRADE]
      ,[DESIGNATION]
      ,convert(varchar(10), DOB,105) DOB
      ,[PLACE_BIRTH]
      ,convert(varchar(10), DOJ,105) DOJ
      ,[PANCARD]
      ,[PASSPORT]
      ,[BG]
      ,[RELIGION]
      ,[CAST]
      ,[SALARY]
      ,[ESI]
      ,[EPF]
      ,[PERM_ADDR]
      ,[PERM_EMAIL]
      ,[PERM_MOBILE]
      ,[PRES_ADDR]
      ,[PRES_EMAIL]
      ,[PRES_MOBILE]
      ,[EMG_CON_NAME]
      ,[EMG_CON_PHONE]
      ,[EMG_CON_MOBILE]
      ,IMG 
      ,[ISDELETED]
       FROM dbo.EMPLOYEE_MASTER WHERE ISDELETED <> 1 AND SYS_ID = @EMP_SYS_ID
	SELECT * FROM dbo.EMPLOYEE_QUALIFICATION WHERE ISDELETED <> 1 AND EMP_SYS_ID = @EMP_SYS_ID
	SELECT * FROM dbo.EMPLOYEE_EXPERIENCE WHERE ISDELETED <> 1 AND EMP_SYS_ID = @EMP_SYS_ID
	SELECT * FROM dbo.EMPLOYEE_FAMILY WHERE ISDELETED <> 1 AND EMP_SYS_ID = @EMP_SYS_ID
END TRY
BEGIN CATCH
	RAISERROR (''Error while excuting your request'', 16,0)
END CATCH
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GET_EMP_ID]    Script Date: 03/24/2016 17:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_EMP_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <06/10/2015>
-- Description:	<AutoGenerateId>
-- =============================================
-- SELECT  dbo.GET_EMP_ID()
CREATE FUNCTION [dbo].[GET_EMP_ID]
(
)RETURNS VARCHAR(50)

AS
BEGIN
		DECLARE @ID AS VARCHAR(50) 

		DECLARE @PREFIX AS VARCHAR(50)

			SET @PREFIX = ''EMP-''
		-- Add the T-SQL statements to compute the return value here
		SELECT
			@ID = @PREFIX + RIGHT(LEFT(CONVERT(VARCHAR(50), GETDATE(), 112),6),4) + 
			(CASE 
				WHEN LEN(COUNT(1) + 1) = 1 THEN ''0'' 
			ELSE 
				'''' 
			END) + CAST(COUNT(1) + 1 as VARCHAR(20))
		FROM EMPLOYEE_MASTER EMP

	-- print(@CusNo)
	-- Return the result of the function
	RETURN @ID
END
' 
END
GO


USE [SMS]
GO
/****** Object:  ForeignKey [FK_Sms_Mark_Entry_Sms_Mark_Entry]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sms_Mark_Entry_Sms_Mark_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry] DROP CONSTRAINT [FK_Sms_Mark_Entry_Sms_Mark_Entry]
GO
/****** Object:  ForeignKey [Fk_studentid map from student reg]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_studentid map from student reg]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] DROP CONSTRAINT [Fk_studentid map from student reg]
GO
/****** Object:  ForeignKey [Fk_subject id map from subject]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_subject id map from subject]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] DROP CONSTRAINT [Fk_subject id map from subject]
GO
/****** Object:  ForeignKey [FK_sms_subject_Mapping_Sms_department_Entry]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] DROP CONSTRAINT [FK_sms_subject_Mapping_Sms_department_Entry]
GO
/****** Object:  ForeignKey [FK_sms_subject_Mapping_Sms_Subject_Entry2]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_Subject_Entry2]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] DROP CONSTRAINT [FK_sms_subject_Mapping_Sms_Subject_Entry2]
GO
/****** Object:  StoredProcedure [dbo].[subjectname]    Script Date: 05/14/2016 19:15:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subjectname]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[subjectname]
GO
/****** Object:  Table [dbo].[subject_Mapping]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] DROP CONSTRAINT [FK_sms_subject_Mapping_Sms_department_Entry]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_Subject_Entry2]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] DROP CONSTRAINT [FK_sms_subject_Mapping_Sms_Subject_Entry2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subject_Mapping]') AND type in (N'U'))
DROP TABLE [dbo].[subject_Mapping]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_Department_ID]    Script Date: 05/14/2016 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_Department_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_Department_ID]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_STUDENT_ID]    Script Date: 05/14/2016 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_STUDENT_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_STUDENT_ID]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_subject_ID]    Script Date: 05/14/2016 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_subject_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_subject_ID]
GO
/****** Object:  Table [dbo].[Mark_Entry]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sms_Mark_Entry_Sms_Mark_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry] DROP CONSTRAINT [FK_Sms_Mark_Entry_Sms_Mark_Entry]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mark_Entry]') AND type in (N'U'))
DROP TABLE [dbo].[Mark_Entry]
GO
/****** Object:  Table [dbo].[Mark_Entry_Details]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_studentid map from student reg]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] DROP CONSTRAINT [Fk_studentid map from student reg]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_subject id map from subject]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] DROP CONSTRAINT [Fk_subject id map from subject]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]') AND type in (N'U'))
DROP TABLE [dbo].[Mark_Entry_Details]
GO
/****** Object:  Table [dbo].[Student_Registration]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student_Registration]') AND type in (N'U'))
DROP TABLE [dbo].[Student_Registration]
GO
/****** Object:  Table [dbo].[Subject_Entry]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subject_Entry]') AND type in (N'U'))
DROP TABLE [dbo].[Subject_Entry]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type in (N'U'))
DROP TABLE [dbo].[Login]
GO
/****** Object:  Table [dbo].[Department_Entry]    Script Date: 05/14/2016 19:15:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Entry]') AND type in (N'U'))
DROP TABLE [dbo].[Department_Entry]
GO
/****** Object:  Table [dbo].[Department_Entry]    Script Date: 05/14/2016 19:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department_Entry](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[Pk_DepartmentID] [varchar](50) NOT NULL,
	[Department_Name] [varchar](50) NOT NULL,
	[Age_Limit] [smallint] NOT NULL,
 CONSTRAINT [PK_Sms_departmentEntry] PRIMARY KEY CLUSTERED 
(
	[Pk_DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Department_Entry] ON
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (21, N'DEPT001', N'1st Std', 5)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (23, N'DEPT022', N'2nd Std', 6)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (25, N'DEPT024', N'3rd Std', 7)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (34, N'DEPT027', N'4th Std', 8)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (83, N'DEPT035', N'5th Std', 9)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (86, N'DEPT084', N'6th Std', 10)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (94, N'DEPT087', N'7th std', 11)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (95, N'DEPT095', N'8th std', 12)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (96, N'DEPT096', N'9th std', 13)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (97, N'DEPT097', N'10th std', 14)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (98, N'DEPT098', N'11th std', 15)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (100, N'DEPT099', N'12th std', 16)
SET IDENTITY_INSERT [dbo].[Department_Entry] OFF
/****** Object:  Table [dbo].[Login]    Script Date: 05/14/2016 19:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Login](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Login] ([UserName], [Password], [FullName]) VALUES (N'cool', N'cool1', N'Ilavarasan')
INSERT [dbo].[Login] ([UserName], [Password], [FullName]) VALUES (N'Test', N'Test', N'Elakiya')
/****** Object:  Table [dbo].[Subject_Entry]    Script Date: 05/14/2016 19:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subject_Entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Subject_Entry](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[PK_SubjectID] [varchar](50) NOT NULL,
	[Subject_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sms_SubjectEntry] PRIMARY KEY CLUSTERED 
(
	[PK_SubjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Subject_Entry] ON
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (21, N'SUB001', N'tamil')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (22, N'SUB022', N'english')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (23, N'SUB023', N'maths')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (24, N'SUB024', N'science')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (26, N'SUB025', N'social science')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (27, N'SUB027', N'biology')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (28, N'SUB028', N'chemistry')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (29, N'SUB029', N'Zoology')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (32, N'SUB030', N'economics')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (37, N'SUB033', N'Computer Science')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (38, N'SUB038', N'Botany')
SET IDENTITY_INSERT [dbo].[Subject_Entry] OFF
/****** Object:  Table [dbo].[Student_Registration]    Script Date: 05/14/2016 19:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student_Registration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student_Registration](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[PK_StudentID] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Caste] [varchar](50) NOT NULL,
	[FK_DepartmentID] [varchar](10) NOT NULL,
	[PhoneNo] [varchar](15) NOT NULL,
	[DOJ] [date] NOT NULL,
	[BloodGroup] [varchar](10) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[FatherName] [varchar](50) NOT NULL,
	[MotherName] [varchar](50) NOT NULL,
	[Boarding] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Sms_Student Registration] PRIMARY KEY CLUSTERED 
(
	[PK_StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Student_Registration] ON
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (10, N'SMS010', N'KAVI', CAST(0xF1F20A00 AS Date), N'F', N'SC', N'DEPT001', N'8547572477', CAST(0x58250B00 AS Date), N'B+', N'london', N'mrg', N'malar', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (13, N'SMS013', N'gowtham', CAST(0x01220B00 AS Date), N'M', N'MBC', N'DEPT027', N'9867532412', CAST(0x401D0B00 AS Date), N'O+', N'salem', N'raju', N'malar', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (28, N'SMS028', N'ilavarasan', CAST(0xA8190B00 AS Date), N'M', N'MBC', N'DEPT001', N'9940923740', CAST(0x2D190B00 AS Date), N'O+', N'salem', N'guna', N'parimala', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (38, N'SMS038', N'ss', CAST(0x1C1D0B00 AS Date), N'F', N'SC', N'DEPT022', N'9636594651', CAST(0x612B0B00 AS Date), N'O-', N'hj', N'asrfas', N'xvdf', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (40, N'SMS039', N'elakki', CAST(0x223C0B00 AS Date), N'F', N'BC', N'DEPT084', N'9876573134', CAST(0x12250B00 AS Date), N'O+', N'vjnfgj', N'hust', N'cust', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (41, N'SMS041', N'raathi', CAST(0xEE1D0B00 AS Date), N'F', N'MBC', N'DEPT097', N'9345613457', CAST(0x613B0B00 AS Date), N'B+', N'raasipuram', N'jagir', N'kulobi', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (42, N'SMS042', N'tamil', CAST(0x1C1D0B00 AS Date), N'F', N'MBC', N'DEPT001', N'9546579846', CAST(0x612B0B00 AS Date), N'A+', N'dhdh', N'asrfas', N'kulobi', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (43, N'SMS043', N'ss', CAST(0x1C1D0B00 AS Date), N'F', N'ST', N'DEPT001', N'9465432132', CAST(0x612B0B00 AS Date), N'A-', N'hfghdhdf', N'honey', N'kulobi', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (44, N'SMS044', N'ela', CAST(0x1C1D0B00 AS Date), N'F', N'BC', N'DEPT001', N'9124564626', CAST(0x612B0B00 AS Date), N'O+', N'hjktg', N'honey', N'cust', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (45, N'SMS045', N'ss', CAST(0x3E240B00 AS Date), N'F', N'MBC', N'DEPT001', N'9321446511', CAST(0x612B0B00 AS Date), N'O-', N'gfj', N'honey', N'cust', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (46, N'SMS046', N'ss', CAST(0x3E240B00 AS Date), N'F', N'BC', N'DEPT001', N'9213453743', CAST(0x612B0B00 AS Date), N'O-', N'r5utfu', N'honey', N'cust', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (47, N'SMS047', N'english', CAST(0x1C1D0B00 AS Date), N'F', N'BC', N'DEPT001', N'9265465798', CAST(0x612B0B00 AS Date), N'A-', N'dfghd', N'honey', N'cust', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (48, N'SMS048', N'english', CAST(0x1C1D0B00 AS Date), N'F', N'BC', N'DEPT001', N'9632658745', CAST(0x612B0B00 AS Date), N'B-', N'hkjhl', N'honey', N'cust', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (53, N'SMS053', N'ela', CAST(0x83320B00 AS Date), N'F', N'MBC', N'2nd Std', N'9876543244', CAST(0x613B0B00 AS Date), N'O-', N'w', N'sedqw', N'weq', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (54, N'SMS054', N'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij', CAST(0x553B0B00 AS Date), N'F', N'MBC', N'DEPT022', N'9867532432', CAST(0x613B0B00 AS Date), N'O-', N'sa', N'sd', N'as', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (55, N'SMS055', N'lakki', CAST(0x16310B00 AS Date), N'F', N'MBC', N'DEPT024', N'9454587451', CAST(0x613B0B00 AS Date), N'B+', N'gykhkuy', N'fgjh', N'ghfjgh', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (56, N'SMS056', N'tamil', CAST(0x9F320B00 AS Date), N'F', N'MBC', N'DEPT001', N'9642676246', CAST(0xA5390B00 AS Date), N'A+', N'dfhdfh', N'dfghdfhf', N'xgvxdgcfhdf', N'Regular')
SET IDENTITY_INSERT [dbo].[Student_Registration] OFF
/****** Object:  Table [dbo].[Mark_Entry_Details]    Script Date: 05/14/2016 19:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mark_Entry_Details](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[FK_StudentID] [varchar](50) NOT NULL,
	[Fk_SubjectID] [varchar](50) NOT NULL,
	[Mark] [decimal](5, 2) NOT NULL,
	[FK_Mark_Entry_Slno] [int] NULL,
 CONSTRAINT [PK_sms_MarkEntryDetails] PRIMARY KEY CLUSTERED 
(
	[Slno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Mark_Entry_Details] ON
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (1, N'SMS028', N'SUB022', CAST(80.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (2, N'SMS010', N'SUB023', CAST(70.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (3, N'SMS010', N'SUB024', CAST(60.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (4, N'SMS013', N'SUB022', CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (5, N'SMS013', N'SUB023', CAST(48.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (6, N'SMS013', N'SUB024', CAST(39.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (8, N'SMS028', N'sub025', CAST(40.00 AS Decimal(5, 2)), 1)
SET IDENTITY_INSERT [dbo].[Mark_Entry_Details] OFF
/****** Object:  Table [dbo].[Mark_Entry]    Script Date: 05/14/2016 19:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mark_Entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mark_Entry](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[Fk_DepatmentID] [varchar](50) NOT NULL,
	[ExamName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sms_MarkEntry] PRIMARY KEY CLUSTERED 
(
	[Slno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Mark_Entry] ON
INSERT [dbo].[Mark_Entry] ([Slno], [Fk_DepatmentID], [ExamName]) VALUES (1, N'DEPT001', N'Praba_Test_Exam')
SET IDENTITY_INSERT [dbo].[Mark_Entry] OFF
/****** Object:  UserDefinedFunction [dbo].[GET_subject_ID]    Script Date: 05/14/2016 19:15:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_subject_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[GET_subject_ID]
(
	
)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID AS VARCHAR(50) 
	
	DECLARE @REC_COUNT AS INT
	DECLARE @PREFIX AS VARCHAR(50)
	SET @PREFIX = ''SUB''	
	SELECT @REC_COUNT = ISNULL(MAX(Slno),0) + 1 FROM dbo.Subject_Entry
		
	SELECT
		@ID = @PREFIX  + 
		(CASE 
			WHEN LEN(@REC_COUNT) = 1 THEN ''00''
		ELSE
			CASE 
				WHEN LEN(@REC_COUNT) = 2 THEN ''0''
			ELSE
				''''
			END
		END) + CAST(@REC_COUNT as VARCHAR(20))
	RETURN @ID
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GET_STUDENT_ID]    Script Date: 05/14/2016 19:15:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_STUDENT_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Prabakaran
-- Create date: 04-05-2016
-- Description:	Genrate Next Department ID
-- =============================================
CREATE FUNCTION [dbo].[GET_STUDENT_ID]
(
	
)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID AS VARCHAR(50) 
	
	DECLARE @REC_COUNT AS INT
	DECLARE @PREFIX AS VARCHAR(50)
	SET @PREFIX = ''SMS''	
	SELECT @REC_COUNT = ISNULL(MAX(Slno),0) + 1 FROM Student_Registration
		
	SELECT
		@ID = @PREFIX  + 
		(CASE 
			WHEN LEN(@REC_COUNT) = 1 THEN ''00''
		ELSE
			CASE 
				WHEN LEN(@REC_COUNT) = 2 THEN ''0''
			ELSE
				''''
			END
		END) + CAST(@REC_COUNT as VARCHAR(20))
	RETURN @ID
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GET_Department_ID]    Script Date: 05/14/2016 19:15:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_Department_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GET_Department_ID]
(
	
)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID AS VARCHAR(50) 
	
	DECLARE @REC_COUNT AS INT
	DECLARE @PREFIX AS VARCHAR(50)
	SET @PREFIX = ''DEPT''	
	SELECT @REC_COUNT = ISNULL(MAX(Slno),0) + 1 FROM Department_Entry
		
	SELECT
		@ID = @PREFIX  + 
		(CASE 
			WHEN LEN(@REC_COUNT) = 1 THEN ''00''
		ELSE
			CASE 
				WHEN LEN(@REC_COUNT) = 2 THEN ''0''
			ELSE
				''''
			END
		END) + CAST(@REC_COUNT as VARCHAR(20))
	RETURN @ID
END
' 
END
GO
/****** Object:  Table [dbo].[subject_Mapping]    Script Date: 05/14/2016 19:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subject_Mapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[subject_Mapping](
	[Pk_subjectmappingID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_DepartmentID] [varchar](50) NOT NULL,
	[FK_SubjectID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sms_subjectmapping] PRIMARY KEY CLUSTERED 
(
	[Pk_subjectmappingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[subject_Mapping] ON
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (121, N'DEPT001', N'SUB001')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (126, N'DEPT001', N'SUB022')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (128, N'DEPT027', N'SUB022')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (129, N'DEPT027', N'SUB023')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (130, N'DEPT027', N'SUB024')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (131, N'DEPT024', N'SUB001')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (132, N'DEPT024', N'SUB022')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (134, N'DEPT022', N'SUB001')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (138, N'DEPT001', N'SUB025')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (144, N'DEPT022', N'SUB022')
SET IDENTITY_INSERT [dbo].[subject_Mapping] OFF
/****** Object:  StoredProcedure [dbo].[subjectname]    Script Date: 05/14/2016 19:15:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subjectname]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec dbo.subjectname ''DEPT001'', ''Praba_Test_Exam''
CREATE PROCEDURE [dbo].[subjectname]
	-- Add the parameters for the stored procedure here
	@Dep_ID as NVARCHAR(10), @Exm_Name as NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @cols AS NVARCHAR(MAX),  @query  AS NVARCHAR(MAX)
	
	Set @cols	 = STUFF(
							(
								SELECT '','' + QUOTENAME(REPLACE(Sub.Subject_Name, '' '' , ''_'') + ''-'' + Sub.PK_SubjectID) 
										from subject_Mapping as Map
										join Subject_Entry as Sub on Sub.PK_SubjectID = Map.FK_SubjectID 
										Where Map.Fk_DepartmentID = @Dep_ID
										GROUP BY Sub.Subject_Name, Sub.PK_SubjectID
								FOR XML PATH(''''), TYPE
							).value(''.'', ''NVARCHAR(MAX)'') 
					,1,1, '''')
	print @cols
	
	set @query= N''
	Select * From 
	(
		select 
			'''''''' Me_Slno, stu.Name, stu.PK_StudentID, REPLACE(Sub.Subject_Name, '''' '''' , ''''_'''') + ''''-'''' + Sub.PK_SubjectID Subject_Name, isnull(Med.Mark, 0.00) Mark
		from Student_Registration as stu 
		join Department_Entry as dep on dep.Pk_DepartmentID = stu.Fk_departmentId
		join subject_Mapping as Map on dep.Pk_DepartmentID = Map.Fk_DepartmentID 
		join Subject_Entry as Sub on Sub.PK_SubjectID = Map.FK_SubjectID 
		Left Join dbo.Mark_Entry Me on Me.Fk_DepatmentID = Map.Fk_DepartmentID
			And me.ExamName = ''''''+@Exm_Name+''''''
		Left Join dbo.Mark_Entry_Details Med on Med.FK_Mark_Entry_Slno = Me.Slno
			And Med.Fk_SubjectID = Sub.PK_SubjectID And Med.FK_StudentID = stu.PK_StudentID
		where dep.Pk_DepartmentID = ''''''+@Dep_ID+''''''
	)x
	PIVOT
	(
		Sum(Mark)
		FOR Subject_Name IN (''+@cols+'')
	) AS PVTTable''
	print @query
	exec sp_executesql @query;
END
' 
END
GO
/****** Object:  ForeignKey [FK_Sms_Mark_Entry_Sms_Mark_Entry]    Script Date: 05/14/2016 19:15:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sms_Mark_Entry_Sms_Mark_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry]  WITH CHECK ADD  CONSTRAINT [FK_Sms_Mark_Entry_Sms_Mark_Entry] FOREIGN KEY([Fk_DepatmentID])
REFERENCES [dbo].[Department_Entry] ([Pk_DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sms_Mark_Entry_Sms_Mark_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry] CHECK CONSTRAINT [FK_Sms_Mark_Entry_Sms_Mark_Entry]
GO
/****** Object:  ForeignKey [Fk_studentid map from student reg]    Script Date: 05/14/2016 19:15:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_studentid map from student reg]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details]  WITH CHECK ADD  CONSTRAINT [Fk_studentid map from student reg] FOREIGN KEY([FK_StudentID])
REFERENCES [dbo].[Student_Registration] ([PK_StudentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_studentid map from student reg]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] CHECK CONSTRAINT [Fk_studentid map from student reg]
GO
/****** Object:  ForeignKey [Fk_subject id map from subject]    Script Date: 05/14/2016 19:15:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_subject id map from subject]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details]  WITH CHECK ADD  CONSTRAINT [Fk_subject id map from subject] FOREIGN KEY([Fk_SubjectID])
REFERENCES [dbo].[Subject_Entry] ([PK_SubjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_subject id map from subject]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] CHECK CONSTRAINT [Fk_subject id map from subject]
GO
/****** Object:  ForeignKey [FK_sms_subject_Mapping_Sms_department_Entry]    Script Date: 05/14/2016 19:15:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_sms_subject_Mapping_Sms_department_Entry] FOREIGN KEY([Fk_DepartmentID])
REFERENCES [dbo].[Department_Entry] ([Pk_DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] CHECK CONSTRAINT [FK_sms_subject_Mapping_Sms_department_Entry]
GO
/****** Object:  ForeignKey [FK_sms_subject_Mapping_Sms_Subject_Entry2]    Script Date: 05/14/2016 19:15:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_Subject_Entry2]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_sms_subject_Mapping_Sms_Subject_Entry2] FOREIGN KEY([FK_SubjectID])
REFERENCES [dbo].[Subject_Entry] ([PK_SubjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_Subject_Entry2]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] CHECK CONSTRAINT [FK_sms_subject_Mapping_Sms_Subject_Entry2]
GO


Imports System.Data.SqlClient
Imports System.Globalization
Public Class MarkEntry
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then
            Load_Department()
            load_examtype()
        End If

    End Sub

    Private Sub btnsubmit_Click1(sender As Object, e As EventArgs) Handles btnsubmit.Click
        OpenConnection()

        btnsave.Visible = True
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim dt As New DataTable
            Dim da As SqlDataAdapter


            cmd.CommandText = "dbo.subjectname"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Dep_ID", ddlDepartmentname.SelectedValue)
            cmd.Parameters.AddWithValue("@Exm_Name", ddlexamtype.SelectedValue)
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)

            For Each dc As DataColumn In dt.Columns
                dc.ColumnName.ToString()
                If dc.ColumnName = "Name" Then
                    'Dim Stu_Name As New BoundField()
                    'Stu_Name.DataField = dc.ColumnName.Split("-")(0).ToString()
                    'Stu_Name.HeaderText = "Student Name"
                    'GvListview2.Columns.Add(Stu_Name)
                ElseIf dc.ColumnName <> "Me_Slno" And dc.ColumnName <> "Name" And dc.ColumnName <> "PK_StudentID" Then
                    Dim Sub_Temp As New TemplateField()
                    Sub_Temp.HeaderTemplate = New GridViewTemplate(ListItemType.Header, dc.ColumnName)
                    Sub_Temp.ItemTemplate = New GridViewTemplate(ListItemType.Item, dc.ColumnName)
                    GvListview2.Columns.Add(Sub_Temp)
                End If
            Next
            GvListview2.DataSource = dt
            GvListview2.DataBind()
        Catch

        Finally
            CloseConnection()
        End Try


    End Sub

    Public Sub OpenConnection()
        Try
            If con.State <> ConnectionState.Open Then
                con = New SqlConnection(ConfigurationManager.ConnectionStrings("sqlconnectionstring").ToString())
                con.Open()
            End If
        Catch ex As Exception
            ShowError(ex.Message)
        End Try
    End Sub
    Public Sub CloseConnection()
        Try
            If con.State = ConnectionState.Open Then
                con.Close()
                con.Dispose()
            End If
        Catch ex As Exception
            ShowError(ex.Message)
        End Try
    End Sub
    Public Sub ShowAlert(Msg As String)
        pnalert.Visible = True
        pnalert.CssClass = "alert alert-success"
        lblMessage.Text = Msg
    End Sub
    Public Sub ShowError(Msg As String)
        pnalert.Visible = True
        pnalert.CssClass = "alert alert-danger"
        lblMessage.Text = Msg

    End Sub
    Public Sub Load_Department()
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim dt As New DataTable
            Dim da As SqlDataAdapter
            cmd.CommandText = "select '0' Department_ID, '-Please Select-' Department_Name union all select Pk_DepartmentID, Department_Name from dbo.Department_Entry "
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)
            ddlDepartmentname.DataSource = dt
            ddlDepartmentname.DataBind()
        Catch ex As Exception
            ShowError(ex.Message)
        Finally
            CloseConnection()
        End Try
    End Sub
    Public Sub load_examtype()
        OpenConnection()
        Try
            Dim cmd As New SqlCommand()
            Dim msg As String = String.Empty

            Dim dt As New DataTable
            Dim da As SqlDataAdapter
            cmd.Connection = con
            cmd.CommandText = "select '0' slno, '-Please Select-' examname union all select slno,examName from mark_entry"
            da = New SqlDataAdapter(cmd)
            da.Fill(dt)
            ddlexamtype.DataSource = dt
            ddlexamtype.DataBind()

        Catch
        Finally
            CloseConnection()
        End Try

    End Sub

    Protected Sub GvListview2_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        'If e.Row.RowType = DataControlRowType.DataRow Then
        '    Dim drv As DataRowView = DirectCast(e.Row.DataItem, DataRowView)
        '    For i As Integer = 0 To e.Row.Cells.Count
        '        Dim hf As New HiddenField()
        '        hf.Value = e.Row.Cells(i).Text.Split("-")(0)
        '        e.Row.Cells(i).Text = " "
        '        e.Row.Cells(i).Controls.Add(hf)
        '    Next

        'End If
    End Sub

    Private Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        OpenConnection()
        Try
            Dim dtSubject As New DataTable()
            Dim cmd As New SqlCommand()
            cmd.Connection = con
            Dim da As SqlDataAdapter
            cmd.CommandText = "select PK_SubjectID,Subject_Name from Subject_Entry"
            da = New SqlDataAdapter(cmd)
            da.Fill(dtSubject)
            'cmd.CommandText = "insert into mark_entry values('" + ddlDepartmentname.SelectedValue + "','" + ddlexamtype.SelectedValue + "')"

            With GvListview2
                For i As Integer = 0 To .Rows.Count - 1

                    For Sub_Index As Integer = 0 To dtSubject.Rows.Count - 1
                        Dim dr As DataRow = dtSubject.Rows(Sub_Index)



                        Dim CtrlSuffix = dr("Subject_Name").Replace(" ", "_").ToString()

                        Dim Student_Id As String = DirectCast(.Rows(i).FindControl("hfstudentid"), HiddenField).Value
                        Dim Subject_Mark As String = DirectCast(.Rows(i).Cells(Sub_Index + 1).FindControl("gvtxt" + CtrlSuffix), TextBox).Text
                        Dim Subject_Id As String = DirectCast(.Rows(i).Cells(Sub_Index + 1).FindControl("gvhf" + CtrlSuffix), HiddenField).Value
                        'Insert Mark Details


                        'cmd.CommandText = "insert into  values('" + Student_Id + "','" + Subject_Id + "','" + +"')"

                    Next
                Next
            End With

        Catch ex As Exception

        Finally

        End Try
    End Sub
End Class
