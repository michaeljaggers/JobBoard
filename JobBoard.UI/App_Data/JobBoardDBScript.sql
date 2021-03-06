/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Positions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT IF EXISTS [FK_Locations_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_OpenPositions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_ApplicationStatus]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP INDEX IF EXISTS [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP INDEX IF EXISTS [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP INDEX IF EXISTS [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[Positions]
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[OpenPositions]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[Locations]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[ApplicationStatus]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[Applications]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Database [JobBoard]    Script Date: 7/15/2021 7:44:32 PM ******/
DROP DATABASE IF EXISTS [JobBoard]
GO
/****** Object:  Database [JobBoard]    Script Date: 7/15/2021 7:44:32 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'JobBoard')
BEGIN
CREATE DATABASE [JobBoard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JobBoard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\JobBoard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JobBoard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\JobBoard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [JobBoard] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobBoard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobBoard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobBoard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobBoard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobBoard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobBoard] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobBoard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobBoard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobBoard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobBoard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobBoard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobBoard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobBoard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobBoard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobBoard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobBoard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobBoard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobBoard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobBoard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobBoard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobBoard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobBoard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobBoard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobBoard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JobBoard] SET  MULTI_USER 
GO
ALTER DATABASE [JobBoard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobBoard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobBoard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobBoard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobBoard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JobBoard] SET QUERY_STORE = OFF
GO
USE [JobBoard]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[OpenPositionId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[ManagerNotes] [varchar](2000) NULL,
	[ApplicationStatus] [int] NOT NULL,
	[ResumeFilename] [varchar](75) NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationStatus](
	[ApplicationStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[StatusDescription] [varchar](250) NULL,
 CONSTRAINT [PK_ApplicationStatus] PRIMARY KEY CLUSTERED 
(
	[ApplicationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[StoreNumber] [varchar](10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ManagerId] [nvarchar](128) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpenPositions](
	[OpenPositionId] [int] IDENTITY(1,1) NOT NULL,
	[PositionId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[IsFeatured] [bit] NOT NULL,
 CONSTRAINT [PK_OpenPositions] PRIMARY KEY CLUSTERED 
(
	[OpenPositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Positions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Positions](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[JobDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 7/15/2021 7:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ResumeFilename] [varchar](75) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106290232361_InitialCreate', N'JobBoard.UI.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C6D6FE33612FE7EC0FD07419F7A87D4CACBED622FB05B649DA497EBE605EBA4E8B7052DD18EB012A94A549AE0D05FD60FFD49FD0B37942859E28B5E6CC5768A051616397C66381C92C3E1307FFEFEC7F8FBE730B09E709CF8944CECA3D1A16D61E252CF27CB899DB2C5B71FECEFBFFBFBDFC6175EF86CFD54D09D703A68499289FDC85874EA3889FB8843948C42DF8D6942176CE4D2D0411E758E0F0FFFED1C1D3918206CC0B2ACF1E794303FC4D9077C4E297171C452145C530F078928879A59866ADDA010271172F1C4FE2F9D7FA428F6460F57A39CDAB6CE021F8124331C2C6C0B1142196220E7E94382672CA664398BA00005F72F1106BA050A122CE43F5D9177EDCAE131EF8AB36A5840B969C268D813F0E844E8C6919BAFA561BBD41D68EF02B4CC5E78AF330D4EEC2B0F67459F69000A90199E4E8398134FECEB92C55912DD60362A1A8E72C8CB18E07EA5F1D75115F1C0EADCEEA0B4A5E3D121FF77604DD380A5319E109CB2180507D65D3A0F7CF747FC724FBF623239399A2F4E3EBC7B8FBC93F7FFC227EFAA3D85BE025DAD008AEE621AE11864C38BB2FFB6E5D4DB3972C3B259A54DAE15B0259816B6758D9E3F61B2648F30618E3FD8D6A5FF8CBDA24418D703F16116412316A7F0799306019A07B8AC771A79F2FF1BB81EBF7B3F08D71BF4E42FB3A197F8C3C489615E7DC641569B3CFA513EBD6AE3FD45905DC634E4DF75FBCA6BBFCC681ABBBC33D448728FE2256675E9C6CECA783B9934871ADEAC0BD4FD376D2EA96ADE5A52DEA1756642C162DBB3A190F775F976B6B8B32882C1CB4C8B6BA4C9E0D4CD6A24B53EB02A342BD339EA6A3A04BAF4575E092F42E407032C851DB88017B2F0E31097BDFC48C1F010E92DF31D4A125809BCFFA0E4B14174F83980E833ECA63118E88CA1307A756E778F94E09B349C73BBDF1EAFC186E6FE577A895C46E30BC25B6D8CF789BA5F69CA2E88778E187E606E01C83FEFFDB03BC020E29CB92E4E924B3066EC4D2938D905E0156127C7BDE1F802B56B57641A203FD4FB22D252FAA5205DF9237A0AC5273190E9FC9226513FD1A54FBA895A909A45CD295A4515647D45E560DD24159466413382563973AAC13CBD6C848677F532D8FDF7F536DBBC4D6B41458D335821F10F98E0189631EF0E318663B21A812EEBC62E9C856CF838D357DF9B324E3FA1201D9AD55AB3215B04869F0D19ECFECF864C4C287EF23DEE9574380015C400DF895E7FB66A9F739264DB9E0EB56E6E9BF976D600D374394B12EAFAD92CD084BE44E0A22E3FF870567B1423EF8D1C09818E81A1FB7CCB8312E89B2D1BD52D39C70166D83A73F3D0E014252EF254354287BC1E82153BAA46B05544A42EDC3F159E60E938E68D103F042530537DC2D469E113D78F50D0AA25A965C72D8CF7BDE421D79CE30813CEB055135D98EB03205C80928F34286D1A1A3B158B6B364483D76A1AF336177635EE4A5C622B36D9E23B1BEC52F86FAF6298CD1ADB827136ABA48B00C660DE2E0C549C55BA1A807C70D93703954E4C0603152ED5560CB4AEB11D18685D256FCE40F3236AD7F197CEABFB669EF583F2F6B7F54675EDC0366BFAD833D3CC7D4F68C3A0058E55F33C9FF34AFCCC34873390539CCF12E1EACA26C2C16798D543362B7F57EB873ACD20B2113501AE0CAD05545C032A40CA84EA215C11CB6B944E78113D608BB85B23AC58FB25D88A0DA8D8D5EBD00AA1F9D25436CE4EA78FB267A5352846DEE9B050C1D11884BC78D53BDE4129A6B8ACAA982EBE701F6FB8D23131180D0A6AF15C0D4A2A3A33B8960AD36CD792CE21EBE3926DA425C97D3268A9E8CCE05A1236DAAE248D53D0C32DD84845F52D7CA0C956443ACADDA6AC1B3B79969428183B8674AAF1358A229F2C2BE955A2C49AE5B955D36F67FD938EC21CC371134DEE51296DC989D1182DB1540BAC41D24B3F4ED83962688E789C67EA850A99766F352CFF05CBEAF6A90E62B10F14D4FC77DE4273795FDB6B556744605C420F43EED1646174CDF8EB9B5B3CDD0D0528D644EEA73448436276B0CCADF3FBBB6AFBBC4445183B92FC8A03A5684B7173EBAAEF3430EAA41868904AFF65FD81324398D45D789F55859B3C52334A11A0AAA29882563B1B389323D36BB0641FB1FF58B522BCCEBC128929550051D413A392DBA08055EABAA3D6D34FAA98F59AEE88528E491552AAEA21653593A42664B5622D3C8346F514DD39A8B9235574B5B63BB2268BA40AADA95E035B23B35CD71D5593685205D65477C75E659DC88BE81EEF5CC693CBDA5B577EB8DD6CEF3260BCCE8A38CCD657B9C3AF02558A7B62895B7A054C94EFA535194F786B5B531ED3D8CC9A0C18E695A776FB5D5F781AAFECCD98B52BEDDAE2DE74A56FC6EB67B3AF6A19CA014F2629B997073DE940371687ABF64734CA692B27B1AD428DB0B1BF240C87234E309AFD124C031FF365BC20B846C45FE084E5691CF6F1E1D1B1F40E677FDEC43849E2059AC3A9E9614C7DCCB69091459E50EC3EA258CD8FD8E0DDC80A54093D5F110F3F4FECFF65AD4EB32806FF95151F5857C903F17F49A1E23E4EB1F59B9AEF394C1E7D87971BA5A0BFBD892711DD557EF5F397BCE981751BC3743AB50E2545AF33FCF58712BDA4C99B6E20CDDACF27DEEE6CABBD4DD0A24AB365FDA708739F0DF20CA190F29B103DFFA3AF68DAA7061B216A9E130C8537880A4DCF05D6C1323E15F0E093654F05FA7556FF74601DD18CCF067CD21F4C7E34D07D192A5AEE701FD21C98B6B124657A6E4DBADE280373D77B93929BBDD14457F3AF7BC00D9A63BD998BF2C6729707DB3A35A9C98361EFD2EE5F3D1F795F5290574EFB6E338FB7996CDC70A1F497CA31DE83AC384D96CFEE3389B76D6BA608F09EA763F6CB17DE336313DBFCEEB382B76D6CA600F19E1B5BAFDCDF3DB3B55DED9F3BB6B4CE5BE8CE3379D5A424C34D8E2E8ADC96A99B87DCE1F83FA76004B947993FB0D4A78635A5B5B6305C9198999A73D264C6CAC451F82A14CD6CFBF5556CF88D9D1534CD6C0D999C4DBCC5FADFC85BD034F336E447EE22C7589BA1A8CBFB6E59C79AD2A7DE524E71AD272D29EC6D3E6BE3B5FC5B4A211E4429B5D963B85D7E3B19C383A864C8A9D3234358BD2886BDB3F2371961FF4EFCE50A82FF854682DDDAAE59D25C91052D366F49A282448AD05C63863CD852CF62E62F90CBA09A07A0B317E259508F5F83CCB177456E5316A50CBA8CC379500B787127A0897F96065D97797C1BF1AF64882E80983E0FDCDF928FA91F78A5DC979A989001827B1722DCCBC792F1B0EFF2A544BAA1A42390505FE914DDE3300A002CB92533F484D7910DCCEF135E22F76515013481B40F445DEDE3731F2D6314260263D51E3EC186BDF0F9BBFF037669EA199A540000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (1, 1, N'a731f781-5c8e-4dce-a79a-ad7dcd24f4ae', CAST(N'2021-07-11' AS Date), NULL, 3, N'Test Resume.docx')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (2, 2, N'a731f781-5c8e-4dce-a79a-ad7dcd24f4ae', CAST(N'2021-07-12' AS Date), N'Awesome candidate.  Hire them NOW!', 3, N'Test Resume.docx')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (3, 4, N'a731f781-5c8e-4dce-a79a-ad7dcd24f4ae', CAST(N'2021-07-13' AS Date), NULL, 3, N'Test Resume.docx')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (4, 18, N'a731f781-5c8e-4dce-a79a-ad7dcd24f4ae', CAST(N'2021-07-14' AS Date), NULL, 3, N'Test Resume.docx')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (5, 18, N'eca968d4-5bbb-49e4-a26f-549802b257ef', CAST(N'2021-07-14' AS Date), NULL, 3, N'Test Resume 2.docx')
SET IDENTITY_INSERT [dbo].[Applications] OFF
SET IDENTITY_INSERT [dbo].[ApplicationStatus] ON 

INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (1, N'Declined', N'Applicant was removed from the selection process.')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (2, N'Accepted', N'Applicant was accepted through the selection process and has an offer pending.')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (3, N'Pending', N'Applicant has started the application process but an outcome has not been determined.')
SET IDENTITY_INSERT [dbo].[ApplicationStatus] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'49307003-a863-48be-b8e7-a2ce0cfeb7de', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c3d4e474-d52c-40c3-9a9e-53b96d2baa94', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0a7a1fe5-aa86-4cd0-bc71-a9cbc3f68cc5', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2d2e41eb-1a6b-4139-9863-1ad99cd87c01', N'0a7a1fe5-aa86-4cd0-bc71-a9cbc3f68cc5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4ecd7a30-0a84-42d2-b407-da83ba6fc378', N'0a7a1fe5-aa86-4cd0-bc71-a9cbc3f68cc5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c8ee409a-1af5-4c21-805d-70b354c2459d', N'0a7a1fe5-aa86-4cd0-bc71-a9cbc3f68cc5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e1f9651a-45c2-4900-bd3d-346bf6e716bf', N'0a7a1fe5-aa86-4cd0-bc71-a9cbc3f68cc5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e2943270-af36-44ec-a63a-ebaa12b0a032', N'0a7a1fe5-aa86-4cd0-bc71-a9cbc3f68cc5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7c3424d2-444a-458d-850f-c5e08c6d254e', N'49307003-a863-48be-b8e7-a2ce0cfeb7de')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a731f781-5c8e-4dce-a79a-ad7dcd24f4ae', N'c3d4e474-d52c-40c3-9a9e-53b96d2baa94')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd4e4fc8d-5a8b-4e05-8167-9099937207f7', N'c3d4e474-d52c-40c3-9a9e-53b96d2baa94')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eca968d4-5bbb-49e4-a26f-549802b257ef', N'c3d4e474-d52c-40c3-9a9e-53b96d2baa94')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f03b75ff-5c02-408f-b02f-6e7e2dd7eff2', N'c3d4e474-d52c-40c3-9a9e-53b96d2baa94')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2d2e41eb-1a6b-4139-9863-1ad99cd87c01', N'shannon.foster@techsavvy.net', 0, N'ABaAvqcL0DIjVaaPTmNIEp63Fp1ZGc/SgEnKmxScLa6kJ/1ru5/xd2lGFQ6iMDAiDw==', N'87a56cbb-3a4b-4747-bd46-7e2ae15db627', NULL, 0, 0, NULL, 1, 0, N'shannon.foster@techsavvy.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4ecd7a30-0a84-42d2-b407-da83ba6fc378', N'stephanie.rhoades@techsavvy.net', 0, N'ADkUF0yzobqhgj0zFMVzMuGJsyiZqYw1axhdXpSM4WKYbd7uCL2eAGjltuzLG4+AAw==', N'7c89b094-ad52-45dc-a128-8052ff96bb29', NULL, 0, 0, NULL, 1, 0, N'stephanie.rhoades@techsavvy.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7c3424d2-444a-458d-850f-c5e08c6d254e', N'admin@techsavvy.net', 0, N'AJKlJzl55jk7IwNYN/svgp8RJV32OzIID9AS/2uHDMc7u9hYuZzlYWgmUrC92a+D9w==', N'c41bed40-c79b-438e-9bc2-d8f32a201d80', NULL, 0, 0, NULL, 1, 0, N'admin@techsavvy.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a731f781-5c8e-4dce-a79a-ad7dcd24f4ae', N'employee@techsavvy.net', 0, N'APM/+TbgXnBzx9652S/kGij8rzGW1H/MpqrqPl5N29mZVy5tZJTPv6D57LeEImilzw==', N'4c864b1a-b8cf-43e4-8e90-dc398d97ff55', NULL, 0, 0, NULL, 1, 0, N'employee@techsavvy.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c8ee409a-1af5-4c21-805d-70b354c2459d', N'martha.mckenna@tachsavvy.net', 0, N'ABednGkMjlRrUT+J5KLNV/hmdlINkjyYDwe++UzgDmjlnr1U+7HvMJk/wwZz9QR+6Q==', N'537a4e2e-8255-476b-874f-9c399dc21673', NULL, 0, 0, NULL, 1, 0, N'martha.mckenna@tachsavvy.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd4e4fc8d-5a8b-4e05-8167-9099937207f7', N'michael.jaggers@techsavvy.net', 1, N'AJ7dSXlp+utQGGOsN2YY8P1JOj+knvibt4KicDXy1PoYI8/TqWToM4V3pme+XS6X0w==', N'fd8d16cb-6f77-4e1d-a3e7-2e718efb49ec', NULL, 0, 0, NULL, 1, 0, N'michael.jaggers@techsavvy.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e1f9651a-45c2-4900-bd3d-346bf6e716bf', N'manager@techsavvy.net', 0, N'ABlHorcAesiEEX7xh832BWaiTVvXnlVh4uB6gatdBFCD8M7fj71jVLCWN8e2jZRLyA==', N'03a025d5-9e24-4d47-b153-bb94aad55684', NULL, 0, 0, NULL, 1, 0, N'manager@techsavvy.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e2943270-af36-44ec-a63a-ebaa12b0a032', N'jarrett.berman@techsavvy.net', 0, N'AOh2ljir8TGnubF+nLn0LzgHXRl7GiYGXKqaX7YyuB7n27cLZAKAfPKOBAi63WBkRg==', N'87f4243a-42a9-4063-b635-1acb97125c8d', NULL, 0, 0, NULL, 1, 0, N'jarrett.berman@techsavvy.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'eca968d4-5bbb-49e4-a26f-549802b257ef', N'alex.hanson@techsavvy.net', 0, N'AECa/dQoQYdlZp5gxYZOckly4zUhI3iQHJwts+UHph7lSnDecVvmf6L9xc/vQlHxOw==', N'ed82d21b-e78d-46e8-a98f-0ec2e7ca85a7', NULL, 0, 0, NULL, 1, 0, N'alex.hanson@techsavvy.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f03b75ff-5c02-408f-b02f-6e7e2dd7eff2', N'robert.melasky@techsavvy.net', 0, N'ANVJ5Pr8mfxvvhyclW4cO6lttzaW+rklA5+I2b4E+7EjL7xMCx/1CxkmrY/De+pV3Q==', N'fa8d0548-5783-40eb-b54a-fdd335815bdc', NULL, 0, 0, NULL, 1, 0, N'robert.melasky@techsavvy.net')
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (1, N'1001', N'Burlington', N'VT', N'2d2e41eb-1a6b-4139-9863-1ad99cd87c01')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (2, N'1002', N'Kansas City', N'MO', N'e2943270-af36-44ec-a63a-ebaa12b0a032')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (3, N'1003', N'Atlanta', N'GA', N'c8ee409a-1af5-4c21-805d-70b354c2459d')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (4, N'1004', N'Dallas', N'TX', N'4ecd7a30-0a84-42d2-b407-da83ba6fc378')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (5, N'1005', N'Las Vegas', N'NV', N'e1f9651a-45c2-4900-bd3d-346bf6e716bf')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[OpenPositions] ON 

INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (1, 2, 2, 1)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (2, 18, 5, 1)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (3, 19, 5, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (4, 17, 5, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (5, 7, 5, 1)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (6, 12, 1, 1)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (7, 21, 1, 1)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (8, 10, 1, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (9, 15, 1, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (10, 11, 3, 1)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (11, 24, 3, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (12, 8, 3, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (13, 5, 3, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (14, 3, 2, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (15, 13, 2, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (16, 6, 4, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (17, 1, 4, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (18, 22, 4, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (19, 15, 4, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (20, 20, 4, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (21, 23, 4, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (22, 15, 4, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (23, 9, 3, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (24, 4, 1, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (25, 13, 1, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId], [IsFeatured]) VALUES (26, 17, 1, 0)
SET IDENTITY_INSERT [dbo].[OpenPositions] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (1, N'Technical Support Specialist II', N'TechSavvy is currently hiring a Technical Support Specialist II to join our Digital Retail team. This position is remote/work from home and can be located anywhere within the United States.  The Technical Support Specialist II, Digital Retailing serves as a primary point of contact for strategic customer escalations, partners, and team members providing technical, and general assistance to customers and internal stakeholders. Full ownership of issue resolution is required, including troubleshooting, resolving, escalating, or delegating of technical Digital Retailing issues.  The Technical Support Specialist II handles VIP accounts and pilot programs with the utmost attention to detail, confidence. Due to the strategic nature of these partners, this role will provide high-touch, concierge-level service, and exceptional customer skills are required.  The Technical Support Specialist II, Digital Retailing is expected to have an advanced level of knowledge regarding multiple Cox Automotive products. In this role it is crucial to maintain product expertise and technical skills in order to be a resource on best practices and functionality of the vast Digital Retailing landscape. You are a self-starter that embraces an ever changing and demanding work environment. You have a technology background and are seeking to grow your skills and knowledge base. You are curious and quick to learn, always looking for ways to improve. Strong interpersonal and communications skills will be necessary to succeed.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (2, N'User Interface Engineer I', N'As a UI Engineer I, you will work in a collaborative Agile team environment that encourages you to perform at your best and challenges you to engineer elegant solutions for complex business problems.  You will be applying your knowledge of object-oriented design with appropriate use of best practices, design patterns, and frameworks, with an understanding of application performance and maintainability.   Dealer Brand & Identity’s teams take pride in their Agile approach of delivering the highest value work to clients. The nature of that work and the technologies used to deliver the value can vary. We are looking for Software Engineers who want to use multiple technologies across our tech stack to help solve the most challenging client requests. Delivering the client value is the focus, which requires the ability to work throughout our tech stack and potentially utilizing all of the technologies listed below. ')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (3, N'Strategic Project Manager', N'Dealer Marketing Solutions is changing the way people shop for and purchase vehicles through our innovative digital marketing solutions, and our team members are tech-savvy, adaptable thinkers with diverse skillsets who lead the auto industry’s digital revolution with a world-class software platform for automotive dealers. The Project Manager is a highly motivated, collaborative, results-oriented individual who drives the delivery of business solutions for Dealer Marketing Solutions, focused on the Dealer.com brand and our customers. The Project Manager successfully plans and executes client-facing software projects with a focus on large, organization-wide initiatives. Strong facilitation and communication skills, astute client relationship management, focus on managing changing priorities, organization, tenacity and dynamic team building skills describe the successful candidates for this position.   The ideal candidate is a curious, strategic thinker who is highly experienced with Agile and Waterfall delivery methodologies. Experience in the automotive dealer and OEM space, or in specialty retail / sales and marketing, will help those candidates who already have a solid Project Management foundation in place. Collaboration is woven into the fabric of everything we do; from 24-hour Hackathons with the agile engineering teams to strategic business conversations with our account directors and program managers, you’ll be immersed in an environment that nurtures individualism, creative problem-solving, and intellect.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (4, N'Senior Implementation Project Manager', N'Reporting to the Manager, the Senior Implementation Project Manager is the primary person responsible for the successful delivery of a variety of solutions to the automotive marketplace, as well as for coordinating with multiple internal and external resources to ensure project success. The Senior Implementation Project Manager builds and configures new and existing client accounts, according to the requirements defined in the signed sales contract, as well as applicable addenda and statements of work. In most cases, the Senior Implementation Project Manager is the primary contact with the client, guiding them through the implementation process. The Senior Implementation Project Manager will be crossed-trained to perform all variations of account set-ups and upgrades, though based on job volume and department capacity, an area of specialty may be determined. A Senior Implementation Project Manager is expected to manage multiple account set ups, with varying requirements, for different clients concurrently. Typically works on projects of broad scope that may be tied to high-profile clients or to important business initiatives, with limited oversight. These projects may be less clearly defined, requiring you to solve complex challenges while working independently and receiving minimal guidance. Once the account is fully configured and/or launched, the Senior Implementation Project Manager conducts a handoff to appropriate TechSavvy stakeholder team(s).    Due to product and platform complexity, this role requires specific domain expertise, and will either be focused on websites or digital retailing. This is a client-facing team where you will apply technical knowledge, digital marketing guidance, and project management skills. ')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (5, N'Senior Product Owner', N'	 TechSavvy is seeking a Sr Product Owner for a full-time position.  This Senior Product Owner will be instrumental in developing our new marketing platform. We are utilizing cutting edge technologies to build cloud-first solutions. Our world-class platform enables dealers to engage with consumers the moment they begin their shopping journey and continues engagement throughout the ownership lifecycle.     The Senior Product Owner will be responsible for developing and executing a comprehensive approach to deliver one or more products, capabilities, services, or enhancements in accordance with the product roadmap. Works with Product Managers, Business Leaders, and a cross-functional Scrum team to deliver the product to the Client.  Manages the overall effort to deliver products, capabilities, services and enhancements using the strategic vision as well as established key performance indicators. Understands the functionality and determines the release sequence.  Prioritizes and maintains the product backlog and performs just-in-time story elaboration with the development team.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (6, N'Launch Consultant I', N'The Launch Consultant works on the Implementation Team and is responsible for the successful planning, set-up, and configuration of the software suite. A Launch Consultant must be a multi-tasker, who has excellent organization and time management skills and is a superb communicator. The Launch Consultant I is accountable for conducting set-ups and configuration of products. Responsible to assist the customer in selecting the appropriate settings/configurations/ form mapping to meet their needs and deliver high-impact educational content to clients to improve their understanding of the purchased products. Team members are responsible for being a reliable resource to the Launch Consultant team & a dependable team member to assist with the tasks of client on-boarding. ')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (7, N'Systems Engineer II', N'	 TechSavvy, is currently looking for a Systems Engineer to join our team in.  At TechSavvy, we’re passionate about building software that solves problems. Our systems engineers are a key to this success by helping accelerate deliveries and increasing application resilience. Founded on the premise to standardize tooling across a set of teams and to evangelize new technologies and processes, the systems engineers regularly investigate engineering pain-points and then thoughtfully provide scalable solutions.  A perfect candidate is one that likes automating tedious tasks, create safety guards from mistakes being made, prefers simplifying problems instead of overcomplicating things, being proactive instead of reactive, mindfully accepting tech-debt, and, most importantly, working as a team. If this describes you, or you want to hear more, click the Apply button and we look forward to connecting.   At TechSavvy, collaboration and support are woven into the fabric of everything we do. Risk-taking is encouraged and we reward great results. Giving back to the community is important at TechSavvy. You will be given time during working hours to volunteer at local charities.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (8, N'Senior Software Engineer', N'Job Summary:  As a Sr. Software Engineer on the Marketing and Advertising Release Train, you will work in a collaborative agile team environment that encourages you to perform at your best and challenges you to engineer elegant solutions for complex business challenges.  You will apply your knowledge of object-oriented design along with engineering best practices, design patterns, and frameworks to deliver real product value.  Technologies:  Java, Spring, AWS (EMR, ECS, EC2, S3, Glue, Athena, QuickSight, Lambda, API Gateway, SQS, Kinesis, Terraform, CloudFront, CloudWatch, RDS), Active MQ, Maven, NewRelic/DataDog/SumoLogic, Cucumber, REST/gRPC, Hibernate, MySQL, GitHub, TeamCity/Jenkins, Apache Airflow')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (9, N'Technical Business Analyst', N'The Technical Business Analyst is responsible for technical and business analysis of software solutions delivered by software engineers. The Technical Business Analyst defines requirements for improving processes and systems, reducing their costs, enhancing their sustainability, and the quantification of potential business benefits. The Technical Business Analyst also plays a role in ensuring software quality, process modeling, providing advice and guidance and monitoring emerging technologies. ')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (10, N'Marketing Analytics Manager', N'As part of the TechSavvy marketing team, the Marketing Analytics Manager will be a strategic contributor helping to shape future initiatives within our omnichannel marketing efforts. They will be a key influencer playing a pivotal role in not only gathering data insights but also translating these insights into meaningful findings to align with business goals and drive results.  We are seeking a dynamic individual, who will leverage advanced analytical skills to create reporting and analysis with tailored insights and visualization that tells the story within the data and provides actionable recommendations.  This individual will develop innovative analytics and multi-touch attribution reporting solutions that inspire and influence positive change within marketing and the broader organization.  The Marketing Analytics Manager should have a passion for data, and a collaborative spirit that lends itself to partnering with key stakeholders to create solutions that link campaign goals with business objectives and create winning growth strategies.    In essence, this individual will help evolve our current measurement and attribution framework to provide deeper insights on the impact of marketing efforts on revenue.  They will need to be both reactive and proactive in providing key analytics, data and reporting to meet the needs of our marketing team.  This individual will drive the delivery of targeted lists and insightful campaign analysis for the TechSavvy marketing team and its broader group of stakeholders and has a deep understanding of multiple brand’s data. Along with robust analytical skills, this person must be a strategic thinking, self-starter with the ability to manage multiple projects simultaneously.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (11, N'Lead Technical Architect', N'We know you’ve got options as an experienced Technical or Solution Architect, so why work for TechSavvy? TechSavvy is a respected industry leader. We aren’t in “maintenance mode.” We’re innovating and we know our employees are our most valuable resource so we are looking to add to our team.  Do you have a passion for helping to deliver world-class software solutions? Would you like to do this using the newest computing technologies? Do you have a knack for helping an organization understand application architectures and integration approaches, architect advanced cloud-based solutions, and launch the build-out of those systems? Are you one of those rare technologists with the communications, consultative, and leadership skills to help guide major projects to success? If the answer is "Yes" and you meet the qualifications, then the Enterprise Architecture team would like to talk to you!! ')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (12, N'Product Strategist', N'The Product Strategy Manager is a member of the TechSavvy products team, responsible for driving validation and refinement of our adjacency growth strategies.  Supporting the exploration, definition, and ideation of strategic products and concepts by conducting research, exploring current activity in the segment, and identifying new product opportunities based on unmet needs. In order to determine and validate opportunities that are desirable, feasible and viable, this role will own and manage proof of concept projects. In working through these complex, and often ambiguous problems, this role will influence the future products of the organization.    The role will support the Director of Product Strategy as we refine and evolve the product strategies to support the shifting software/marketing needs of clients.  TechSavvy offers a suite of solutions for clients supporting marketing, CRM, ERP (DMS), and  workflow solutions.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (13, N'Instructional Designer', N'Are you a highly creative and innovative designer of learning?  Do you love to imagine how learning can be more interactive and exciting? Are you collaborative and team-minded?  Well, we may have just the opportunity for you.  Job Description:  Our Instructional Designers partner with their peers and our internal clients to analyze and identify learning needs. From there, they design and develop solutions for a variety of audiences that can include a different types of modalities…everything from eLearning modules, multi-day structured learning events for virtual and in-person audiences, blended designs, to exciting media-based learning. We’re big on gamification, interactive multimedia, video micro-learning, peer-to-peer learning, scenario-based learning and content curation. Our designs are optimized for both mobile and desktop applications. Our Instructional Designers partner with others in our Learning & Workforce Capability organization to manage the deliverables for a training solution and create evaluation strategies for levels 1, 2 and 3.  We’re all about helping our stakeholders see how learning can improve business results!   ')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (14, N'Finance Manager, Regional Operations', N'The Finance Manager, Region Operations will report to the Director, Finance and be responsible for leading finance focused initiatives and projects across the region and act as the main liaison with the Accounting COE, P&P and other Centralized teams across TechSavvy.  The Finance Manager is the key business partner and trusted advisor to the Director, Finance; Senior Finance Managers in all areas of finance.     The Finance Manager, Region Operations supports the overall financial management of the assigned Region to include financial analysis, performance management, budgeting and forecasting, as well as strategic initiatives and business case development.  The role will engage proactively with the Senior Finance Managers and business leaders to drive continuous finance process improvement across the Region and share best practices across all of Manheim.  The other primary responsibilities include consolidating ad-hoc requests, leading special projects within the region and supporting the Director, Finance with RVP specific reporting.     A focus on continuous improvement including the enhancement of Finance processes and procedures is essential to success in this position. This includes partnering across the broader finance organization and with key business stakeholders to optimize upstream and downstream processes and integrate improvements into operating plans and goals.  Ongoing individual development within the finance organization is another critical success factor including the ability to transform and adapt the organization to the Company’s shifting business model and strategies.  ')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (15, N'Senior Client Services Rep', N'As the Sr Client Service Rep, you will serve as the client advocate and will be responsible for the client satisfaction based on task ownership and accurate resolution in a call center environment.  You will manage a high volume of tasks that require you to leverage various resources to identify the client’s need, clarify and communicate information, research issues, and provide effective resolution while keeping the client satisfaction at the core of every decision and behavior.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (16, N'Executive Customer Resolution Specialist', N'Establish, preserve or restore customer loyalty by researching, investigating and responding to high profile, time sensitive, complex complaints and disputes to drive total satisfaction of our customers. Responds to complaints that require a high level of sensitivity (e.g., risk, complexity, confidentiality) received from customers, third party agencies, the Better Business Bureau, regulatory agencies, the corporate office, region General Manager and Vice Presidents, Government Relations, Managers and Care Center Directors in a timely manner. Gets to the right resolution of problems by balancing total customer satisfaction with corporate fiscal responsibility.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (17, N'Social Media Support Specialist', N'To provide troubleshooting assistance and education via social media outlets about installation and use of TechSavvy products to residential customers in order to minimize truck rolls and repeat calls.  Presents additional or upgraded service opportunities to customers and completes the service order or provides warm transfer to sales to complete the service order.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (18, N'Senior Accounting Analyst', N'TechSavvy is seeking a Senior Accounting Analyst to join our growing Enterprise Accounting team. This Senior Accounting Analyst is responsible for completing month end close, asset management, and providing CAPEX guidance. This Senior Accounting Analyst will look to automate the day to day operations and metrics so that more time can be spent providing information to our business partners helping drive better business decisions. This is an opportunity to think strategically and drive change within an accounting function.  This role will report into a Senior Manager of Accounting.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (19, N'Senior Marketing Analyst', N'As the Senior Analyst, Media & Creative Sciences, you will be a key member of the Marketing Sciences team responsible for TechSavvy’s residential efforts to develop an analytically driven unified media/message mix and comprehensive marketing investment optimization strategy.   Combining the knowledge of investment and impact modeling, message mix/creative analysis techniques, advanced analytical skills, as well as a solid aptitude of the media landscape, will enable TechSavvy to dramatically improve its marketing efficiency and media effectiveness. This Senior Analyst will partner with external and internal teams – media, creative, marketing mix & attribution modeling partners and agencies, such as Analytic Partners, Visual IQ, FCB and iProspect/Vizeum; Customer and Non-Customer Strategy, Brand, Consumer Insights, and Sales Strategy.  This member will lead the day-to-day management of high-impact initiatives to deliver on key marketing measurement enhancements and new partner on-boarding.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (20, N'Client Trainer II', N'Some trainers help people build up their muscles, leading them through intense fitness regimens.  Thankfully, this trainer role won’t require a single crunch or push-up.    Nope, this job is a Client Trainer for TechSavvy. You’ll show your strength by traveling to client sites to train them up on our products so they can complete all their registration and titling documentation electronically with ease and speed  So, if you love being on the road (this is a 75% field-based travel gig), and dig the idea of driving client satisfaction in person, by phone, or via web meetings, stay with us…this may just be your kind of workout.  WHAT YOU''LL DO You''ll keep training on track, as you work with users on product implementation to make sure they can utilize it completely and are thrilled with the results. You might do this one on one, in a classroom setting or even remotely. You''ll help clients learn and understand the use of an online registration system and the RegUSA Portal, as well as, the creation of eLearning content.  You will provide insights to the business development teams that will assist in identifying new product enhancements.  If you''re going to train, you''ll need to stay trained yourself, so attending training sessions (in person and remotely) will be expected so you can keep your skill sets top tier. You''ll also work with and mentor fellow TechSavvy team members (via phone, email, and IM) so they can improve our overall success and client satisfaction.  Pack your bags, because you''ll be on the road a bunch – using wheels and wings – to implement the product onsite with our clients. This will give you the chance to identify opportunities that you can relay to your leadership team.  We''ll look to you to work well against deadlines with a “no sweat” attitude, as you use your amazing analytical and people skills to take care of customer concerns. You''re a keen listener, who conveys information clearly and concisely, whether in person or via the written word.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (21, N'Manager, Software Engineering', N'This position is remote/work from home.  You need to reside in the Eastern or Central Time Zone.  TechSavvy, is currently looking for a  Manager, Software Engineering to join our team. As part of the Engineering Enablement group, this individual is responsible for leading a team of individuals chartered to deliver best-in-class tooling and platforms to enable hundreds of teams across the organization to be successful and productive. This individual will act in a servant leader role and be an agent of innovation while inspiring those around them. This individual also plays a role in consultation, coaching, and engineering practice leadership for internal customers and stakeholders.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (22, N'Client Experience Specialist', N'TechSavvy is currently looking for a Bi-lingual Client Service Representative to join our Client Experience Team.  This position is remote/work from home and can be located anywhere within the United States. The schedule for this position is 10:30AM-7:00PM.  As a Client Service Representative II, you handle inbound demands regarding account and service inquiries from our client base. You will work closely with all internal departments to identify and resolve client concerns. Ideal candidates should be dynamic and ambitious individuals excited to work with our clients.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (23, N'Sales Executive', N'The Sales Executive (SE) is a full time outside sales position.  The position requires a structured approach to developing new business in a defined territory.  The SE will be responsible for achieving target level volumes in new applications, activations and monthly new business revenue for TechSavvy as well as the company’s ancillary products and services. The SE will be responsible to maintain relationships with auction general managers to maximize TechSavvy’s business opportunity within assigned auto auctions. The SE will work closely with TechSavvy''s Portfolio Managers in their assigned territory to exceed budgeted goals.  ')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (24, N'Lead Software Test Engineer', N'A Lead Software Test Engineer is responsible for a range of testing activities including designing and maintaining test frameworks, leading team members and training them on industry best practices, analyzing metrics, and finding gaps in process where automation can help. As the Lead STE you would be actively looking to improve existing frameworks, suites, and processes across TechSavvy. This may include areas such as Performance testing, Unit Testing, and Code reviews.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (25, N'Senior Network Security Consultant', N'Successful candidates will demonstrate strong business acumen and possess a blend of general Business, Technology and Security competencies.  Specifically, this individual will have a versatile background, critical thinking and analytical capabilities, as well as a proven ability to bridge organization boundaries to validate network security controls in infrastructure designs and risk mitigation strategies. ')
SET IDENTITY_INSERT [dbo].[Positions] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'2d2e41eb-1a6b-4139-9863-1ad99cd87c01', N'Shannon', N'Foster', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'4ecd7a30-0a84-42d2-b407-da83ba6fc378', N'Stephanie', N'Rhoades', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'a731f781-5c8e-4dce-a79a-ad7dcd24f4ae', N'Test', N'Employee', N'Test Resume.docx')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'c8ee409a-1af5-4c21-805d-70b354c2459d', N'Martha', N'McKenna', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'd4e4fc8d-5a8b-4e05-8167-9099937207f7', N'Michael', N'Jaggers', N'Michael Jaggers Resume IT.docx')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'e1f9651a-45c2-4900-bd3d-346bf6e716bf', N'Test', N'Manager', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'e2943270-af36-44ec-a63a-ebaa12b0a032', N'Jarrett', N'Berman', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'eca968d4-5bbb-49e4-a26f-549802b257ef', N'Alex', N'Hanson', N'Test Resume 2.docx')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'f03b75ff-5c02-408f-b02f-6e7e2dd7eff2', N'Robert', N'Melasky', NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/15/2021 7:44:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/15/2021 7:44:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/15/2021 7:44:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 7/15/2021 7:44:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/15/2021 7:44:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/15/2021 7:44:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_ApplicationStatus] FOREIGN KEY([ApplicationStatus])
REFERENCES [dbo].[ApplicationStatus] ([ApplicationStatusId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_ApplicationStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_OpenPositions] FOREIGN KEY([OpenPositionId])
REFERENCES [dbo].[OpenPositions] ([OpenPositionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_OpenPositions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Locations_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_UserDetails] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Locations_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Positions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([PositionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Positions]
GO
ALTER DATABASE [JobBoard] SET  READ_WRITE 
GO
