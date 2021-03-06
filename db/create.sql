USE [master]
GO
/****** Object:  Database [ssf.buzzbuzzhome.com]    Script Date: 02/19/2015 17:11:05 ******/
CREATE DATABASE [ssf.buzzbuzzhome.com] ON  PRIMARY 
( NAME = N'ssf.buzzbuzzhome.com', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ssf.buzzbuzzhome.com.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ssf.buzzbuzzhome.com_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ssf.buzzbuzzhome.com_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ssf.buzzbuzzhome.com].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET ARITHABORT OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET  DISABLE_BROKER
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET  READ_WRITE
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET RECOVERY FULL
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET  MULTI_USER
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ssf.buzzbuzzhome.com] SET DB_CHAINING OFF
GO
USE [ssf.buzzbuzzhome.com]
GO
/****** Object:  Table [dbo].[Feeds]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feeds](
	[ID] [uniqueidentifier] NOT NULL,
	[FeedType] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units_Changes]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units_Changes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[ProviderPlanID] [nvarchar](100) NULL,
	[ProviderDevelopmentID] [nvarchar](100) NULL,
	[ProviderUnitID] [nvarchar](100) NOT NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[FullRawAddress] [nvarchar](425) NULL,
	[Status] [int] NULL,
	[Price] [decimal](19, 4) NULL,
	[Type] [int] NULL,
	[UnitSqFeet] [int] NULL,
	[NoOfBedrooms] [int] NULL,
	[NoOfBathrooms] [int] NULL,
	[NoOfHalfBathrooms] [int] NULL,
	[MaintenanceFee] [decimal](19, 4) NULL,
	[CeilingHeight] [decimal](8, 2) NULL,
	[PropertyTax] [decimal](19, 4) NULL,
	[ListingUrl] [nvarchar](2100) NULL,
	[ListingDescription] [nvarchar](max) NULL,
	[AgentName] [nvarchar](50) NULL,
	[AgentEmail] [nvarchar](50) NULL,
	[SalesCompany] [nvarchar](50) NULL,
	[DateBuilt] [datetime] NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[ChangedFields] [nvarchar](max) NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
 CONSTRAINT [PK_Units_Changes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[ProviderPlanID] [nvarchar](100) NULL,
	[ProviderDevelopmentID] [nvarchar](100) NULL,
	[ProviderUnitID] [nvarchar](100) NOT NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[FullRawAddress] [nvarchar](425) NULL,
	[Status] [int] NULL,
	[Price] [decimal](19, 4) NULL,
	[Type] [int] NULL,
	[UnitSqFeet] [int] NULL,
	[NoOfBedrooms] [int] NULL,
	[NoOfBathrooms] [int] NULL,
	[NoOfHalfBathrooms] [int] NULL,
	[MaintenanceFee] [decimal](19, 4) NULL,
	[CeilingHeight] [decimal](8, 2) NULL,
	[PropertyTax] [decimal](19, 4) NULL,
	[ListingUrl] [nvarchar](2100) NULL,
	[ListingDescription] [nvarchar](max) NULL,
	[AgentName] [nvarchar](50) NULL,
	[AgentEmail] [nvarchar](50) NULL,
	[SalesCompany] [nvarchar](50) NULL,
	[DateBuilt] [datetime] NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plans_Changes]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans_Changes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[ProviderPlanID] [nvarchar](100) NOT NULL,
	[PlanName] [nvarchar](100) NULL,
	[SqFeetFrom] [int] NULL,
	[SqFeetTo] [int] NULL,
	[PriceFrom] [decimal](19, 4) NULL,
	[PriceTo] [decimal](19, 4) NULL,
	[NoOfBedroomsFrom] [int] NULL,
	[NoOfBedroomsTo] [int] NULL,
	[NoOfBathroomsFrom] [int] NULL,
	[NoOfBathroomsTo] [int] NULL,
	[NoOfHalfBathroomsFrom] [int] NULL,
	[NoOfHalfBathroomsTo] [int] NULL,
	[CeilingHeightFrom] [decimal](8, 2) NULL,
	[CeilingHeightTo] [decimal](8, 2) NULL,
	[SalesCompany] [nvarchar](100) NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[ChangedFields] [nvarchar](max) NULL,
 CONSTRAINT [PK_Plans_Changes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plans]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[ProviderPlanID] [nvarchar](100) NOT NULL,
	[PlanName] [nvarchar](100) NULL,
	[SqFeetFrom] [int] NULL,
	[SqFeetTo] [int] NULL,
	[PriceFrom] [decimal](19, 4) NULL,
	[PriceTo] [decimal](19, 4) NULL,
	[NoOfBedroomsFrom] [int] NULL,
	[NoOfBedroomsTo] [int] NULL,
	[NoOfBathroomsFrom] [int] NULL,
	[NoOfBathroomsTo] [int] NULL,
	[NoOfHalfBathroomsFrom] [int] NULL,
	[NoOfHalfBathroomsTo] [int] NULL,
	[CeilingHeightFrom] [decimal](8, 2) NULL,
	[CeilingHeightTo] [decimal](8, 2) NULL,
	[SalesCompany] [nvarchar](100) NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
 CONSTRAINT [PK_Plans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mappings]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mappings](
	[ID] [uniqueidentifier] NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[FeedObjectID] [nvarchar](100) NOT NULL,
	[ObjectID] [uniqueidentifier] NOT NULL,
	[MapType] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Mappings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[TargetObjectID] [uniqueidentifier] NOT NULL,
	[TargetObjectType] [int] NOT NULL,
	[ImageID] [nvarchar](100) NULL,
	[ImageName] [nvarchar](50) NULL,
	[ImageCaption] [nvarchar](150) NULL,
	[ImageUrl] [nvarchar](2100) NOT NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feeds_Status]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feeds_Status](
	[StatusID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[JsonDetails] [varchar](max) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Feeds_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feeds_Logs]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feeds_Logs](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[LogMessages] [varchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Feeds_Logs] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Developments_Changes]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developments_Changes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[ProviderDevelopmentID] [nvarchar](50) NOT NULL,
	[CommunityName] [nvarchar](100) NULL,
	[DevelopmentName] [nvarchar](100) NOT NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[FullRawAddress] [nvarchar](425) NULL,
	[SalesCenterFullRawAddress] [nvarchar](425) NULL,
	[SalesCenterPhoneNumber] [nvarchar](20) NULL,
	[SalesCenterHours] [nvarchar](50) NULL,
	[NumberOfUnits] [int] NULL,
	[NumberOfStories] [int] NULL,
	[MaintenanceFee] [decimal](19, 4) NULL,
	[MaintenanceFeeType] [int] NULL,
	[HousingAssociationFee] [decimal](19, 4) NULL,
	[ParkingPrice] [decimal](19, 4) NULL,
	[LockerPrice] [decimal](19, 4) NULL,
	[ProjectSummary] [nvarchar](max) NULL,
	[FeaturesAndFinishes] [nvarchar](max) NULL,
	[CurrentIncentives] [nvarchar](max) NULL,
	[PaymentStructure] [nvarchar](500) NULL,
	[RealtorCommission] [decimal](19, 4) NULL,
	[PrimaryContactAdmin] [nvarchar](100) NULL,
	[DevelopmentWebsite] [nvarchar](2100) NULL,
	[FacebookLink] [nvarchar](2100) NULL,
	[TwitterLink] [nvarchar](2100) NULL,
	[GooglePlusLink] [nvarchar](2100) NULL,
	[SellingStatus] [int] NULL,
	[ConstructionStatus] [int] NULL,
	[IsForSale] [bit] NULL,
	[IsForRent] [bit] NULL,
	[IsCondoApartmentType] [bit] NULL,
	[IsHouseType] [bit] NULL,
	[IsTownhouseType] [bit] NULL,
	[IsCondominiumOwnership] [bit] NULL,
	[IsCoopOwnership] [bit] NULL,
	[IsCondopOwnership] [bit] NULL,
	[IsFreeholdOwnership] [bit] NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ChangedFields] [nvarchar](max) NULL,
	[CompletionMonth] [int] NULL,
	[CompletionYear] [int] NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
 CONSTRAINT [PK_Developments_Changes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developments]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[ProviderDevelopmentID] [nvarchar](50) NOT NULL,
	[CommunityName] [nvarchar](100) NULL,
	[DevelopmentName] [nvarchar](100) NOT NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[FullRawAddress] [nvarchar](425) NULL,
	[SalesCenterFullRawAddress] [nvarchar](425) NULL,
	[SalesCenterPhoneNumber] [nvarchar](20) NULL,
	[SalesCenterHours] [nvarchar](50) NULL,
	[NumberOfUnits] [int] NULL,
	[NumberOfStories] [int] NULL,
	[MaintenanceFee] [decimal](19, 4) NULL,
	[MaintenanceFeeType] [int] NULL,
	[HousingAssociationFee] [decimal](19, 4) NULL,
	[ParkingPrice] [decimal](19, 4) NULL,
	[LockerPrice] [decimal](19, 4) NULL,
	[ProjectSummary] [nvarchar](max) NULL,
	[FeaturesAndFinishes] [nvarchar](max) NULL,
	[CurrentIncentives] [nvarchar](max) NULL,
	[PaymentStructure] [nvarchar](500) NULL,
	[RealtorCommission] [decimal](19, 4) NULL,
	[PrimaryContactAdmin] [nvarchar](100) NULL,
	[DevelopmentWebsite] [nvarchar](2100) NULL,
	[FacebookLink] [nvarchar](2100) NULL,
	[TwitterLink] [nvarchar](2100) NULL,
	[GooglePlusLink] [nvarchar](2100) NULL,
	[SellingStatus] [int] NULL,
	[ConstructionStatus] [int] NULL,
	[IsForSale] [bit] NULL,
	[IsForRent] [bit] NULL,
	[IsCondoApartmentType] [bit] NULL,
	[IsHouseType] [bit] NULL,
	[IsTownhouseType] [bit] NULL,
	[IsCondominiumOwnership] [bit] NULL,
	[IsCoopOwnership] [bit] NULL,
	[IsCondopOwnership] [bit] NULL,
	[IsFreeholdOwnership] [bit] NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CompletionMonth] [int] NULL,
	[CompletionYear] [int] NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
 CONSTRAINT [PK_Developments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Communities_Changes]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Communities_Changes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[CommunityName] [nvarchar](100) NULL,
	[NumberOfUnits] [int] NULL,
	[PrimaryContactEmail] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](25) NULL,
	[FullRawAddress] [nvarchar](425) NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[ChangedFields] [nvarchar](max) NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[CreatedDate] [datetime] NULL,
	[ProviderCommunityID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Communities_Changes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Communities]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Communities](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[CommunityName] [nvarchar](100) NULL,
	[NumberOfUnits] [int] NULL,
	[PrimaryContactEmail] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](25) NULL,
	[FullRawAddress] [nvarchar](425) NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ProviderCommunityID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Communities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenities_Changes]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities_Changes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[ProviderDevelopmentID] [nvarchar](50) NOT NULL,
	[AmenityName] [nvarchar](50) NULL,
	[IsRemoved] [bit] NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[ChangedFields] [nvarchar](max) NULL,
 CONSTRAINT [PK_Amenities_Changes_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[ProviderDevelopmentID] [nvarchar](50) NOT NULL,
	[AmenityName] [nvarchar](50) NULL,
	[IsRemoved] [bit] NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
 CONSTRAINT [PK_Amenities_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agencies_Changes]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencies_Changes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[AgencyName] [nvarchar](100) NOT NULL,
	[AgencyType] [int] NOT NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[ChangedFields] [nvarchar](max) NULL,
	[ProviderAgencyID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Agencies_Changes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agencies]    Script Date: 02/19/2015 17:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencies](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeedID] [uniqueidentifier] NOT NULL,
	[AgencyName] [nvarchar](100) NOT NULL,
	[AgencyType] [int] NOT NULL,
	[IsRemoved] [bit] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadyToBeProcessed] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[ProviderAgencyID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Agencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Units_Changes_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Units_Changes]  WITH CHECK ADD  CONSTRAINT [FK_Units_Changes_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Units_Changes] CHECK CONSTRAINT [FK_Units_Changes_Feeds]
GO
/****** Object:  ForeignKey [FK_Units_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [FK_Units_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [FK_Units_Feeds]
GO
/****** Object:  ForeignKey [FK_Plans_Changes_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Plans_Changes]  WITH CHECK ADD  CONSTRAINT [FK_Plans_Changes_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Plans_Changes] CHECK CONSTRAINT [FK_Plans_Changes_Feeds]
GO
/****** Object:  ForeignKey [FK_Plans_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Plans]  WITH CHECK ADD  CONSTRAINT [FK_Plans_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Plans] CHECK CONSTRAINT [FK_Plans_Feeds]
GO
/****** Object:  ForeignKey [FK_Mappings_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Mappings]  WITH CHECK ADD  CONSTRAINT [FK_Mappings_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Mappings] CHECK CONSTRAINT [FK_Mappings_Feeds]
GO
/****** Object:  ForeignKey [FK_Images_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Feeds]
GO
/****** Object:  ForeignKey [FK_Feeds_Status_FeedID]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Feeds_Status]  WITH CHECK ADD  CONSTRAINT [FK_Feeds_Status_FeedID] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Feeds_Status] CHECK CONSTRAINT [FK_Feeds_Status_FeedID]
GO
/****** Object:  ForeignKey [FK_Feeds_Logs_FeedID]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Feeds_Logs]  WITH CHECK ADD  CONSTRAINT [FK_Feeds_Logs_FeedID] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Feeds_Logs] CHECK CONSTRAINT [FK_Feeds_Logs_FeedID]
GO
/****** Object:  ForeignKey [FK_Developments_Changes_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Developments_Changes]  WITH CHECK ADD  CONSTRAINT [FK_Developments_Changes_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Developments_Changes] CHECK CONSTRAINT [FK_Developments_Changes_Feeds]
GO
/****** Object:  ForeignKey [FK_Developments_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Developments]  WITH CHECK ADD  CONSTRAINT [FK_Developments_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Developments] CHECK CONSTRAINT [FK_Developments_Feeds]
GO
/****** Object:  ForeignKey [FK_Communities_Changes_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Communities_Changes]  WITH CHECK ADD  CONSTRAINT [FK_Communities_Changes_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Communities_Changes] CHECK CONSTRAINT [FK_Communities_Changes_Feeds]
GO
/****** Object:  ForeignKey [FK_Communities_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Communities]  WITH CHECK ADD  CONSTRAINT [FK_Communities_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Communities] CHECK CONSTRAINT [FK_Communities_Feeds]
GO
/****** Object:  ForeignKey [FK_Amenities_Changes_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Amenities_Changes]  WITH CHECK ADD  CONSTRAINT [FK_Amenities_Changes_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Amenities_Changes] CHECK CONSTRAINT [FK_Amenities_Changes_Feeds]
GO
/****** Object:  ForeignKey [FK_Amenities_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Amenities]  WITH CHECK ADD  CONSTRAINT [FK_Amenities_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Amenities] CHECK CONSTRAINT [FK_Amenities_Feeds]
GO
/****** Object:  ForeignKey [FK_Agencies_Changes_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Agencies_Changes]  WITH CHECK ADD  CONSTRAINT [FK_Agencies_Changes_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Agencies_Changes] CHECK CONSTRAINT [FK_Agencies_Changes_Feeds]
GO
/****** Object:  ForeignKey [FK_Agencies_Feeds]    Script Date: 02/19/2015 17:11:07 ******/
ALTER TABLE [dbo].[Agencies]  WITH CHECK ADD  CONSTRAINT [FK_Agencies_Feeds] FOREIGN KEY([FeedID])
REFERENCES [dbo].[Feeds] ([ID])
GO
ALTER TABLE [dbo].[Agencies] CHECK CONSTRAINT [FK_Agencies_Feeds]
GO
