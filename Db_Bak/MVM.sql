USE [master]
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
