USE [master]
GO
/****** Object:  Database [rmDB]    Script Date: 2/9/2023 12:14:21 AM ******/
CREATE DATABASE [rmDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rmDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\rmDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rmDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\rmDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [rmDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rmDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rmDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rmDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rmDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rmDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rmDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [rmDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rmDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rmDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rmDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rmDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rmDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rmDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rmDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rmDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rmDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [rmDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rmDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rmDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rmDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rmDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rmDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rmDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rmDB] SET RECOVERY FULL 
GO
ALTER DATABASE [rmDB] SET  MULTI_USER 
GO
ALTER DATABASE [rmDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rmDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rmDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rmDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rmDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [rmDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'rmDB', N'ON'
GO
ALTER DATABASE [rmDB] SET QUERY_STORE = OFF
GO
USE [rmDB]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 2/9/2023 12:14:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[CustId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFName] [nvarchar](20) NOT NULL,
	[CustomerLName] [nvarchar](20) NULL,
	[PhoneNo] [varchar](17) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[designation]    Script Date: 2/9/2023 12:14:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[designation](
	[DesigId] [int] IDENTITY(1,1) NOT NULL,
	[Titlename] [varchar](52) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DesigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 2/9/2023 12:14:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DesigId] [int] NULL,
	[PhoneNo] [nvarchar](17) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[NID] [char](13) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Empcity] [nvarchar](20) NOT NULL,
	[Empcountry] [nvarchar](30) NULL,
	[EmpImage] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fooditem]    Script Date: 2/9/2023 12:14:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fooditem](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[CatagoryId] [int] NULL,
	[ItemName] [varchar](100) NOT NULL,
	[ItemDate] [date] NULL,
	[UnitPrice] [money] NOT NULL,
	[strock] [bit] NOT NULL,
	[Image] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foodItemlist]    Script Date: 2/9/2023 12:14:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foodItemlist](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[CatagoryId] [int] NULL,
	[ItemName] [varchar](100) NOT NULL,
	[ItemDate] [date] NULL,
	[UnitPrice] [money] NOT NULL,
	[strock] [bit] NOT NULL,
	[Image] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foodMenu]    Script Date: 2/9/2023 12:14:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foodMenu](
	[CatagoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CatagoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2/9/2023 12:14:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustId] [int] NULL,
	[TableId] [int] NULL,
	[ItemId] [int] NULL,
	[OrderDate] [date] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [money] NOT NULL,
	[Amount]  AS ([Quantity]*[UnitPrice]),
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableDetails]    Script Date: 2/9/2023 12:14:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableDetails](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[EmpId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([CustId], [CustomerFName], [CustomerLName], [PhoneNo]) VALUES (1, N'Md', N'kabir', N'0174855452')
INSERT [dbo].[customers] ([CustId], [CustomerFName], [CustomerLName], [PhoneNo]) VALUES (2, N'Afsana', N'sorkar', N'0174855844')
INSERT [dbo].[customers] ([CustId], [CustomerFName], [CustomerLName], [PhoneNo]) VALUES (3, N'Md', N'kabim', N'0174855454')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[fooditem] ON 

INSERT [dbo].[fooditem] ([ItemId], [CatagoryId], [ItemName], [ItemDate], [UnitPrice], [strock], [Image]) VALUES (2, NULL, N'bababa', CAST(N'2020-07-07' AS Date), 420.0000, 1, NULL)
SET IDENTITY_INSERT [dbo].[fooditem] OFF
GO
SET IDENTITY_INSERT [dbo].[foodItemlist] ON 

INSERT [dbo].[foodItemlist] ([ItemId], [CatagoryId], [ItemName], [ItemDate], [UnitPrice], [strock], [Image]) VALUES (2, NULL, N'mdrana', CAST(N'2022-10-10' AS Date), 520.0000, 1, NULL)
INSERT [dbo].[foodItemlist] ([ItemId], [CatagoryId], [ItemName], [ItemDate], [UnitPrice], [strock], [Image]) VALUES (3, NULL, N'Pizza', CAST(N'2012-05-05' AS Date), 200.0000, 1, NULL)
SET IDENTITY_INSERT [dbo].[foodItemlist] OFF
GO
SET IDENTITY_INSERT [dbo].[foodMenu] ON 

INSERT [dbo].[foodMenu] ([CatagoryId], [Name]) VALUES (1, N'Pizza')
INSERT [dbo].[foodMenu] ([CatagoryId], [Name]) VALUES (2, N'Shop')
INSERT [dbo].[foodMenu] ([CatagoryId], [Name]) VALUES (3, N'Burger')
INSERT [dbo].[foodMenu] ([CatagoryId], [Name]) VALUES (4, N'Buger')
INSERT [dbo].[foodMenu] ([CatagoryId], [Name]) VALUES (5, N'Pizza')
INSERT [dbo].[foodMenu] ([CatagoryId], [Name]) VALUES (6, N'Mdkabir')
INSERT [dbo].[foodMenu] ([CatagoryId], [Name]) VALUES (7, N'hgfd')
SET IDENTITY_INSERT [dbo].[foodMenu] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__employee__C7DEC3324825BFC9]    Script Date: 2/9/2023 12:14:32 AM ******/
ALTER TABLE [dbo].[employees] ADD UNIQUE NONCLUSTERED 
(
	[NID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customers] ADD  DEFAULT (NULL) FOR [PhoneNo]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT ('N/A') FOR [EmpImage]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([DesigId])
REFERENCES [dbo].[designation] ([DesigId])
GO
ALTER TABLE [dbo].[fooditem]  WITH CHECK ADD FOREIGN KEY([CatagoryId])
REFERENCES [dbo].[foodMenu] ([CatagoryId])
GO
ALTER TABLE [dbo].[foodItemlist]  WITH CHECK ADD FOREIGN KEY([CatagoryId])
REFERENCES [dbo].[foodMenu] ([CatagoryId])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([CustId])
REFERENCES [dbo].[customers] ([CustId])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[fooditem] ([ItemId])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([TableId])
REFERENCES [dbo].[tableDetails] ([TableId])
GO
ALTER TABLE [dbo].[tableDetails]  WITH CHECK ADD FOREIGN KEY([EmpId])
REFERENCES [dbo].[employees] ([EmpId])
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD CHECK  (([PhoneNo] like '%[0-9]'))
GO
USE [master]
GO
ALTER DATABASE [rmDB] SET  READ_WRITE 
GO
