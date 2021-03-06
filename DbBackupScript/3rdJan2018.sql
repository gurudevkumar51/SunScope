USE [master]
GO
/****** Object:  Database [SunScopeDb]    Script Date: 1/3/2018 3:20:30 AM ******/
CREATE DATABASE [SunScopeDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SunScopeDb', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SunScopeDb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SunScopeDb_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SunScopeDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SunScopeDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SunScopeDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SunScopeDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SunScopeDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SunScopeDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SunScopeDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SunScopeDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SunScopeDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SunScopeDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SunScopeDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SunScopeDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SunScopeDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SunScopeDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SunScopeDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SunScopeDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SunScopeDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SunScopeDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SunScopeDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SunScopeDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SunScopeDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SunScopeDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SunScopeDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SunScopeDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SunScopeDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SunScopeDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SunScopeDb] SET  MULTI_USER 
GO
ALTER DATABASE [SunScopeDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SunScopeDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SunScopeDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SunScopeDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SunScopeDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SunScopeDb]
GO
/****** Object:  Table [dbo].[Tbl_Customer]    Script Date: 1/3/2018 3:20:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Customer](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](max) NULL,
	[CustomerEmail] [varchar](max) NULL,
	[CustomerLocation] [varchar](max) NULL,
	[CustomerMobile] [varchar](max) NULL,
	[CustomerPassword] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Lead]    Script Date: 1/3/2018 3:20:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Lead](
	[EnquiryID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyType] [varchar](max) NULL,
	[MonthlyElectricBill] [varchar](max) NULL,
	[LeadAddress] [varchar](max) NULL,
	[CustEmail] [varchar](max) NULL,
	[CustMobile] [varchar](max) NULL,
	[CustLandline] [varchar](max) NULL,
	[CallTime] [varchar](max) NULL,
	[IsActive] [varchar](max) NULL,
	[RoofType] [varchar](max) NULL,
	[RoofSize] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[EnquiryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Customer] ON 

INSERT [dbo].[Tbl_Customer] ([CustID], [CustomerName], [CustomerEmail], [CustomerLocation], [CustomerMobile], [CustomerPassword]) VALUES (1, N'gurudev', N'gurudevkumar51@hotmail.com', N'Hyderabad, Telangana, India', N'9110517331', N'123456')
SET IDENTITY_INSERT [dbo].[Tbl_Customer] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Lead] ON 

INSERT [dbo].[Tbl_Lead] ([EnquiryID], [PropertyType], [MonthlyElectricBill], [LeadAddress], [CustEmail], [CustMobile], [CustLandline], [CallTime], [IsActive], [RoofType], [RoofSize]) VALUES (1, N'Residential', N'300', N'Kalidas, 7-2-287, Subhash Nagar, Sriram Nagar, Tulasi Nagar, Sanath Nagar, Hyderabad, Telangana 500018, India', N'gurudevkumar51@hotmail.com', N'9110517331', N'', N'3PM', N'0', N'flat', N'350')
SET IDENTITY_INSERT [dbo].[Tbl_Lead] OFF
/****** Object:  StoredProcedure [dbo].[Usp_Manage_Accounts]    Script Date: 1/3/2018 3:20:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurudev kumar>
-- Create date: <Create Date,,02/01/2018>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usp_Manage_Accounts]
	(
		@LoginID varchar(max)=null,
		@Password varchar(max)=null,
		@Type char(1)=null
	)
AS
BEGIN
	if @Type='A'
	BEGIN
		select * from Tbl_Customer where CustomerEmail=@LoginID and CustomerPassword=@Password;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Manage_Customer]    Script Date: 1/3/2018 3:20:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurudev Kumar>
-- Create date: <Create Date,,30 Dec 2017>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usp_Manage_Customer](
@custName varchar(max)=null,
@custEmail varchar(max)=null,
@custLocation varchar(max)=null,
@custMobile varchar(max)=null,
@custPwd varchar(max)=null,
@Type char(1)=null
)
AS
if @Type='A'
BEGIN
select * from Tbl_Customer;
END
ELSE
if @Type='B'
BEGIN
insert into Tbl_Customer(CustomerName,CustomerEmail,CustomerLocation,CustomerMobile,CustomerPassword) 
values(@custName,@custEmail,@custLocation,@custMobile,@custPwd);
END
ELSE
if @Type ='C'
BEGIN
select * from Tbl_Customer where CustomerEmail=@custEmail;
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Manage_Lead]    Script Date: 1/3/2018 3:20:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurudev Kumar>
-- Create date: <Create Date,,1st Jan 2017>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usp_Manage_Lead](
@PropertyType varchar(max)=null,
@MonthlyElectricBill varchar(max)=null,
@LeadAddress varchar(max)=null,
@CustEmail varchar(max)=null,
@CustMobile varchar(max)=null,
@CustLandline varchar(max)=null,
@CallTime varchar(max)=null,
@RoofSize varchar(max)=null,
@RoofType varchar(max)=null,
@Type char(1)=null
)
AS
if @Type='A'
BEGIN
select * from Tbl_Lead;
END
ELSE
if @Type='B'
BEGIN
insert into Tbl_Lead(PropertyType,MonthlyElectricBill,LeadAddress,CustEmail,CustMobile,CustLandline,CallTime,IsActive,RoofType,RoofSize) 
values(@PropertyType,@MonthlyElectricBill,@LeadAddress,@CustEmail,@CustMobile,@CustLandline,@CallTime,0,@RoofType,@RoofSize);
END

GO
USE [master]
GO
ALTER DATABASE [SunScopeDb] SET  READ_WRITE 
GO
