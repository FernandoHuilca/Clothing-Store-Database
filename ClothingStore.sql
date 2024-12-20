USE [master]
GO
/****** Object:  Database [ClothingStore]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE DATABASE [ClothingStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClothingStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClothingStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClothingStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClothingStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ClothingStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClothingStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClothingStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClothingStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClothingStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClothingStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClothingStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClothingStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClothingStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClothingStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClothingStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClothingStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClothingStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClothingStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClothingStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClothingStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClothingStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClothingStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClothingStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClothingStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClothingStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClothingStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClothingStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClothingStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClothingStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClothingStore] SET  MULTI_USER 
GO
ALTER DATABASE [ClothingStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClothingStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClothingStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClothingStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClothingStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClothingStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClothingStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [ClothingStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ClothingStore]
GO
/****** Object:  Table [dbo].[BRANCH_OFFICE]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRANCH_OFFICE](
	[BRANCHOFFICEID] [int] NOT NULL,
	[DIRECTIONID] [int] NULL,
	[NAMEBRANCHOFFICE] [char](256) NULL,
 CONSTRAINT [PK_BRANCH_OFFICE] PRIMARY KEY NONCLUSTERED 
(
	[BRANCHOFFICEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENT]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENT](
	[CLIENTID] [int] NOT NULL,
	[PERSONID] [int] NULL,
	[NUMBEROFPURCHASES] [int] NULL,
 CONSTRAINT [PK_CLIENT] PRIMARY KEY NONCLUSTERED 
(
	[CLIENTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLOTHES]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLOTHES](
	[CLOTHESID] [int] NOT NULL,
	[SUPPLIERID] [int] NULL,
	[CLOTHINGSTATE_] [int] NULL,
	[SIZE] [int] NOT NULL,
	[BRAND] [char](256) NOT NULL,
	[MATERIAL] [char](256) NOT NULL,
	[COLOR] [char](256) NOT NULL,
	[PRICE] [decimal](18, 0) NOT NULL,
	[TYPE] [char](256) NOT NULL,
	[DESCRIPTION] [text] NOT NULL,
 CONSTRAINT [PK_CLOTHES] PRIMARY KEY NONCLUSTERED 
(
	[CLOTHESID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLOTHINGSTATE]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLOTHINGSTATE](
	[CLOTHINGSTATE_] [int] NOT NULL,
	[CLOTHESID] [int] NULL,
	[WEARABLE] [bit] NULL,
 CONSTRAINT [PK_CLOTHINGSTATE] PRIMARY KEY NONCLUSTERED 
(
	[CLOTHINGSTATE_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRECTION]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRECTION](
	[DIRECTIONID] [int] NOT NULL,
	[SUPPLIERID] [int] NULL,
	[BRANCHOFFICEID] [int] NULL,
	[MAINSTREET] [char](256) NULL,
	[SECONDARYSTREET] [char](256) NULL,
	[NEIGHBORHOOD] [char](256) NULL,
	[CITY] [char](256) NULL,
 CONSTRAINT [PK_DIRECTION] PRIMARY KEY NONCLUSTERED 
(
	[DIRECTIONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[PERSONID] [int] NOT NULL,
	[VENDORID] [int] NULL,
	[DIRECTIONID] [int] NULL,
	[CLIENTID] [int] NULL,
	[NAMEPERSON] [char](256) NULL,
	[LASTNAMEPERSON] [char](256) NULL,
	[EMAIL] [char](256) NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY NONCLUSTERED 
(
	[PERSONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALE]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALE](
	[SALEID] [int] NOT NULL,
	[CLIENTID] [int] NULL,
	[SALESTATEID] [int] NULL,
	[VENDORID] [int] NULL,
	[BRANCHOFFICEID] [int] NULL,
	[TOTALTOPAY] [decimal](18, 0) NULL,
	[DATE] [datetime] NULL,
	[PAYMENTMETHOD] [char](256) NULL,
 CONSTRAINT [PK_SALE] PRIMARY KEY NONCLUSTERED 
(
	[SALEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALESDETAIL]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALESDETAIL](
	[SALESDETAILID] [int] NOT NULL,
	[CLOTHESID] [int] NULL,
	[SALEID] [int] NULL,
	[AMOUNTOFCLOTH] [int] NULL,
 CONSTRAINT [PK_SALESDETAIL] PRIMARY KEY NONCLUSTERED 
(
	[SALESDETAILID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALESTATE]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALESTATE](
	[SALESTATEID] [int] NOT NULL,
	[SALEID] [int] NULL,
	[COMPLETED] [bit] NULL,
	[CANCELED] [bit] NULL,
 CONSTRAINT [PK_SALESTATE] PRIMARY KEY NONCLUSTERED 
(
	[SALESTATEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUPPLIER]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPPLIER](
	[SUPPLIERID] [int] NOT NULL,
	[DIRECTIONID] [int] NULL,
	[NAMESUPPLIER] [char](256) NULL,
 CONSTRAINT [PK_SUPPLIER] PRIMARY KEY NONCLUSTERED 
(
	[SUPPLIERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUPPLYDETAIL]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPPLYDETAIL](
	[SUPPLYDETAILID] [int] NOT NULL,
	[BRANCHOFFICEID] [int] NULL,
	[SUPPLIERID] [int] NULL,
	[QUANTITYSUPPLIED] [int] NULL,
	[SUPPLYDATE] [datetime] NULL,
 CONSTRAINT [PK_SUPPLYDETAIL] PRIMARY KEY NONCLUSTERED 
(
	[SUPPLYDETAILID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENDOR]    Script Date: 11/24/2024 12:21:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENDOR](
	[VENDORID] [int] NOT NULL,
	[PERSONID] [int] NULL,
	[BRANCHOFFICEID] [int] NULL,
	[NUMBEROFSALES] [int] NULL,
	[ENTRYTIME] [datetime] NOT NULL,
	[EXITTIME] [datetime] NOT NULL,
	[STARTDATE] [datetime] NOT NULL,
	[SALARY] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_VENDOR] PRIMARY KEY NONCLUSTERED 
(
	[VENDORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [HAS2_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [HAS2_FK] ON [dbo].[BRANCH_OFFICE]
(
	[DIRECTIONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IS_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [IS_FK] ON [dbo].[CLIENT]
(
	[PERSONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [BELONGS2_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [BELONGS2_FK] ON [dbo].[CLOTHES]
(
	[CLOTHINGSTATE_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [SUPPLIER_CLOTHES_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [SUPPLIER_CLOTHES_FK] ON [dbo].[CLOTHES]
(
	[SUPPLIERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [HAS5_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [HAS5_FK] ON [dbo].[CLOTHINGSTATE]
(
	[CLOTHESID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [HAS3_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [HAS3_FK] ON [dbo].[DIRECTION]
(
	[BRANCHOFFICEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [RESIDES_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [RESIDES_FK] ON [dbo].[DIRECTION]
(
	[SUPPLIERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [DIRECTION_PERSON_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [DIRECTION_PERSON_FK] ON [dbo].[PERSON]
(
	[DIRECTIONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IS2_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [IS2_FK] ON [dbo].[PERSON]
(
	[CLIENTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IS4_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [IS4_FK] ON [dbo].[PERSON]
(
	[VENDORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [BELONGS_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [BELONGS_FK] ON [dbo].[SALE]
(
	[SALESTATEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [BRANCHOFFICE_SALE_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [BRANCHOFFICE_SALE_FK] ON [dbo].[SALE]
(
	[BRANCHOFFICEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CLIENT_SALE_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [CLIENT_SALE_FK] ON [dbo].[SALE]
(
	[CLIENTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [VENDOR_SALE_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [VENDOR_SALE_FK] ON [dbo].[SALE]
(
	[VENDORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [SALE_SALESDETAIL_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [SALE_SALESDETAIL_FK] ON [dbo].[SALESDETAIL]
(
	[SALEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [SALESDETAIL_CLOTHES_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [SALESDETAIL_CLOTHES_FK] ON [dbo].[SALESDETAIL]
(
	[CLOTHESID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [HAS4_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [HAS4_FK] ON [dbo].[SALESTATE]
(
	[SALEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [HAS_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [HAS_FK] ON [dbo].[SUPPLIER]
(
	[DIRECTIONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [SUPPLIER_SUPPLYDETAIL_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [SUPPLIER_SUPPLYDETAIL_FK] ON [dbo].[SUPPLYDETAIL]
(
	[SUPPLIERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [SUPPLYDETAIL_BRANCHOFFICE_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [SUPPLYDETAIL_BRANCHOFFICE_FK] ON [dbo].[SUPPLYDETAIL]
(
	[BRANCHOFFICEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IS3_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [IS3_FK] ON [dbo].[VENDOR]
(
	[PERSONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [VENDOR_BRANCHOFFICE_FK]    Script Date: 11/24/2024 12:21:00 AM ******/
CREATE NONCLUSTERED INDEX [VENDOR_BRANCHOFFICE_FK] ON [dbo].[VENDOR]
(
	[BRANCHOFFICEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BRANCH_OFFICE]  WITH CHECK ADD  CONSTRAINT [FK_BRANCH_O_HAS2_DIRECTIO] FOREIGN KEY([DIRECTIONID])
REFERENCES [dbo].[DIRECTION] ([DIRECTIONID])
GO
ALTER TABLE [dbo].[BRANCH_OFFICE] CHECK CONSTRAINT [FK_BRANCH_O_HAS2_DIRECTIO]
GO
ALTER TABLE [dbo].[CLIENT]  WITH CHECK ADD  CONSTRAINT [FK_CLIENT_IS_PERSON] FOREIGN KEY([PERSONID])
REFERENCES [dbo].[PERSON] ([PERSONID])
GO
ALTER TABLE [dbo].[CLIENT] CHECK CONSTRAINT [FK_CLIENT_IS_PERSON]
GO
ALTER TABLE [dbo].[CLOTHES]  WITH CHECK ADD  CONSTRAINT [FK_CLOTHES_BELONGS2_CLOTHING] FOREIGN KEY([CLOTHINGSTATE_])
REFERENCES [dbo].[CLOTHINGSTATE] ([CLOTHINGSTATE_])
GO
ALTER TABLE [dbo].[CLOTHES] CHECK CONSTRAINT [FK_CLOTHES_BELONGS2_CLOTHING]
GO
ALTER TABLE [dbo].[CLOTHES]  WITH CHECK ADD  CONSTRAINT [FK_CLOTHES_SUPPLIER__SUPPLIER] FOREIGN KEY([SUPPLIERID])
REFERENCES [dbo].[SUPPLIER] ([SUPPLIERID])
GO
ALTER TABLE [dbo].[CLOTHES] CHECK CONSTRAINT [FK_CLOTHES_SUPPLIER__SUPPLIER]
GO
ALTER TABLE [dbo].[CLOTHINGSTATE]  WITH CHECK ADD  CONSTRAINT [FK_CLOTHING_HAS5_CLOTHES] FOREIGN KEY([CLOTHESID])
REFERENCES [dbo].[CLOTHES] ([CLOTHESID])
GO
ALTER TABLE [dbo].[CLOTHINGSTATE] CHECK CONSTRAINT [FK_CLOTHING_HAS5_CLOTHES]
GO
ALTER TABLE [dbo].[DIRECTION]  WITH CHECK ADD  CONSTRAINT [FK_DIRECTIO_HAS3_BRANCH_O] FOREIGN KEY([BRANCHOFFICEID])
REFERENCES [dbo].[BRANCH_OFFICE] ([BRANCHOFFICEID])
GO
ALTER TABLE [dbo].[DIRECTION] CHECK CONSTRAINT [FK_DIRECTIO_HAS3_BRANCH_O]
GO
ALTER TABLE [dbo].[DIRECTION]  WITH CHECK ADD  CONSTRAINT [FK_DIRECTIO_RESIDES_SUPPLIER] FOREIGN KEY([SUPPLIERID])
REFERENCES [dbo].[SUPPLIER] ([SUPPLIERID])
GO
ALTER TABLE [dbo].[DIRECTION] CHECK CONSTRAINT [FK_DIRECTIO_RESIDES_SUPPLIER]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_DIRECTION_DIRECTIO] FOREIGN KEY([DIRECTIONID])
REFERENCES [dbo].[DIRECTION] ([DIRECTIONID])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_DIRECTION_DIRECTIO]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_IS2_CLIENT] FOREIGN KEY([CLIENTID])
REFERENCES [dbo].[CLIENT] ([CLIENTID])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_IS2_CLIENT]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_IS4_VENDOR] FOREIGN KEY([VENDORID])
REFERENCES [dbo].[VENDOR] ([VENDORID])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_IS4_VENDOR]
GO
ALTER TABLE [dbo].[SALE]  WITH CHECK ADD  CONSTRAINT [FK_SALE_BELONGS_SALESTAT] FOREIGN KEY([SALESTATEID])
REFERENCES [dbo].[SALESTATE] ([SALESTATEID])
GO
ALTER TABLE [dbo].[SALE] CHECK CONSTRAINT [FK_SALE_BELONGS_SALESTAT]
GO
ALTER TABLE [dbo].[SALE]  WITH CHECK ADD  CONSTRAINT [FK_SALE_BRANCHOFF_BRANCH_O] FOREIGN KEY([BRANCHOFFICEID])
REFERENCES [dbo].[BRANCH_OFFICE] ([BRANCHOFFICEID])
GO
ALTER TABLE [dbo].[SALE] CHECK CONSTRAINT [FK_SALE_BRANCHOFF_BRANCH_O]
GO
ALTER TABLE [dbo].[SALE]  WITH CHECK ADD  CONSTRAINT [FK_SALE_CLIENT_SA_CLIENT] FOREIGN KEY([CLIENTID])
REFERENCES [dbo].[CLIENT] ([CLIENTID])
GO
ALTER TABLE [dbo].[SALE] CHECK CONSTRAINT [FK_SALE_CLIENT_SA_CLIENT]
GO
ALTER TABLE [dbo].[SALE]  WITH CHECK ADD  CONSTRAINT [FK_SALE_VENDOR_SA_VENDOR] FOREIGN KEY([VENDORID])
REFERENCES [dbo].[VENDOR] ([VENDORID])
GO
ALTER TABLE [dbo].[SALE] CHECK CONSTRAINT [FK_SALE_VENDOR_SA_VENDOR]
GO
ALTER TABLE [dbo].[SALESDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_SALESDET_SALE_SALE_SALE] FOREIGN KEY([SALEID])
REFERENCES [dbo].[SALE] ([SALEID])
GO
ALTER TABLE [dbo].[SALESDETAIL] CHECK CONSTRAINT [FK_SALESDET_SALE_SALE_SALE]
GO
ALTER TABLE [dbo].[SALESDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_SALESDET_SALESDETA_CLOTHES] FOREIGN KEY([CLOTHESID])
REFERENCES [dbo].[CLOTHES] ([CLOTHESID])
GO
ALTER TABLE [dbo].[SALESDETAIL] CHECK CONSTRAINT [FK_SALESDET_SALESDETA_CLOTHES]
GO
ALTER TABLE [dbo].[SALESTATE]  WITH CHECK ADD  CONSTRAINT [FK_SALESTAT_HAS4_SALE] FOREIGN KEY([SALEID])
REFERENCES [dbo].[SALE] ([SALEID])
GO
ALTER TABLE [dbo].[SALESTATE] CHECK CONSTRAINT [FK_SALESTAT_HAS4_SALE]
GO
ALTER TABLE [dbo].[SUPPLIER]  WITH CHECK ADD  CONSTRAINT [FK_SUPPLIER_HAS_DIRECTIO] FOREIGN KEY([DIRECTIONID])
REFERENCES [dbo].[DIRECTION] ([DIRECTIONID])
GO
ALTER TABLE [dbo].[SUPPLIER] CHECK CONSTRAINT [FK_SUPPLIER_HAS_DIRECTIO]
GO
ALTER TABLE [dbo].[SUPPLYDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_SUPPLYDE_SUPPLIER__SUPPLIER] FOREIGN KEY([SUPPLIERID])
REFERENCES [dbo].[SUPPLIER] ([SUPPLIERID])
GO
ALTER TABLE [dbo].[SUPPLYDETAIL] CHECK CONSTRAINT [FK_SUPPLYDE_SUPPLIER__SUPPLIER]
GO
ALTER TABLE [dbo].[SUPPLYDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_SUPPLYDE_SUPPLYDET_BRANCH_O] FOREIGN KEY([BRANCHOFFICEID])
REFERENCES [dbo].[BRANCH_OFFICE] ([BRANCHOFFICEID])
GO
ALTER TABLE [dbo].[SUPPLYDETAIL] CHECK CONSTRAINT [FK_SUPPLYDE_SUPPLYDET_BRANCH_O]
GO
ALTER TABLE [dbo].[VENDOR]  WITH CHECK ADD  CONSTRAINT [FK_VENDOR_IS3_PERSON] FOREIGN KEY([PERSONID])
REFERENCES [dbo].[PERSON] ([PERSONID])
GO
ALTER TABLE [dbo].[VENDOR] CHECK CONSTRAINT [FK_VENDOR_IS3_PERSON]
GO
ALTER TABLE [dbo].[VENDOR]  WITH CHECK ADD  CONSTRAINT [FK_VENDOR_VENDOR_BR_BRANCH_O] FOREIGN KEY([BRANCHOFFICEID])
REFERENCES [dbo].[BRANCH_OFFICE] ([BRANCHOFFICEID])
GO
ALTER TABLE [dbo].[VENDOR] CHECK CONSTRAINT [FK_VENDOR_VENDOR_BR_BRANCH_O]
GO
USE [master]
GO
ALTER DATABASE [ClothingStore] SET  READ_WRITE 
GO
