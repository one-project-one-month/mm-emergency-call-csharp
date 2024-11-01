USE [master]
GO
/****** Object:  Database [MMEmergencyCall]    Script Date: 10/30/2024 1:29:18 PM ******/
CREATE DATABASE [MMEmergencyCall]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MMEmergencyCall', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MMEmergencyCall.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MMEmergencyCall_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MMEmergencyCall_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MMEmergencyCall] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MMEmergencyCall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MMEmergencyCall] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET ARITHABORT OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MMEmergencyCall] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MMEmergencyCall] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MMEmergencyCall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MMEmergencyCall] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MMEmergencyCall] SET  MULTI_USER 
GO
ALTER DATABASE [MMEmergencyCall] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MMEmergencyCall] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MMEmergencyCall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MMEmergencyCall] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MMEmergencyCall] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MMEmergencyCall] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MMEmergencyCall] SET QUERY_STORE = OFF
GO
USE [MMEmergencyCall]
GO
/****** Object:  Table [dbo].[EmergencyRequests]    Script Date: 10/30/2024 1:29:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyRequests](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[ProviderId] [int] NULL,
	[RequestTime] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ResponseTime] [datetime] NULL,
	[Notes] [text] NULL,
	[TownshipCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmergencyServices]    Script Date: 10/30/2024 1:29:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyServices](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceType] [nvarchar](50) NOT NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Location] [nvarchar](max) NULL,
	[Availability] [char](1) NULL,
	[TownshipCode] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceProviders]    Script Date: 10/30/2024 1:29:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceProviders](
	[ProviderId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [varchar](200) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[ContactNumber] [nvarchar](15) NOT NULL,
	[Availability] [char](1) NULL,
	[TownshipCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateRegions]    Script Date: 10/30/2024 1:29:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateRegions](
	[StateRegionId] [int] IDENTITY(1,1) NOT NULL,
	[StateRegionCode] [nvarchar](50) NOT NULL,
	[StateRegionNameEn] [nvarchar](200) NOT NULL,
	[StateRegionNameMm] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateRegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Townships]    Script Date: 10/30/2024 1:29:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Townships](
	[TownshipId] [int] IDENTITY(1,1) NOT NULL,
	[TownshipCode] [nvarchar](50) NOT NULL,
	[TownshipNameEn] [nvarchar](200) NOT NULL,
	[TownshipNameMm] [nvarchar](200) NOT NULL,
	[StateRegionCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Township__8399C0933CD7D010] PRIMARY KEY CLUSTERED 
(
	[TownshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2024 1:29:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[EmergencyType] [nvarchar](50) NULL,
	[EmergencyDetails] [nvarchar](max) NULL,
	[TownshipCode] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Users__1788CC4C78D5D195] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmergencyRequests] ON 

INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (101, 72, 2, 36, CAST(N'2024-10-30T07:10:19.940' AS DateTime), N'Pending', CAST(N'2024-10-30T12:55:19.940' AS DateTime), N'Emergency reported by user_1', N'MMR013038')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (102, 59, 4, 23, CAST(N'2024-10-30T07:39:19.940' AS DateTime), N'Pending', NULL, N'Emergency reported by user_2', N'MMR013044')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (103, 95, 2, 50, CAST(N'2024-10-30T09:18:19.940' AS DateTime), N'Pending', NULL, N'Emergency reported by user_3', N'MMR013016')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (104, 36, 2, 15, CAST(N'2024-10-29T21:13:19.940' AS DateTime), N'Pending', CAST(N'2024-10-30T12:51:19.940' AS DateTime), N'Emergency reported by user_4', N'MMR013030')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (105, 37, 4, 76, CAST(N'2024-10-30T07:26:19.940' AS DateTime), N'Completed', NULL, N'Emergency reported by user_5', N'MMR01301')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (106, 22, 3, 61, CAST(N'2024-10-30T02:49:19.940' AS DateTime), N'Completed', NULL, N'Emergency reported by user_6', N'MMR013031')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (107, 76, 4, 72, CAST(N'2024-10-29T23:37:19.940' AS DateTime), N'Pending', CAST(N'2024-10-30T13:03:19.940' AS DateTime), N'Emergency reported by user_7', N'MMR013032')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (108, 90, 3, 24, CAST(N'2024-10-29T23:30:19.940' AS DateTime), N'Completed', CAST(N'2024-10-30T13:07:19.940' AS DateTime), N'Emergency reported by user_8', N'MMR013029')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (109, 84, 4, 59, CAST(N'2024-10-29T21:26:20.067' AS DateTime), N'Completed', CAST(N'2024-10-30T13:39:20.067' AS DateTime), N'Emergency reported by user_9', N'MMR013046')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (110, 99, 3, 67, CAST(N'2024-10-30T05:56:20.067' AS DateTime), N'Pending', NULL, N'Emergency reported by user_10', N'MMR013026')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (111, 42, 3, 66, CAST(N'2024-10-29T22:16:20.067' AS DateTime), N'Pending', CAST(N'2024-10-30T13:05:20.067' AS DateTime), N'Emergency reported by user_11', N'MMR01301')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (112, 76, 4, 70, CAST(N'2024-10-29T21:30:20.067' AS DateTime), N'Completed', CAST(N'2024-10-30T12:54:20.067' AS DateTime), N'Emergency reported by user_12', N'MMR01301')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (113, 7, 3, 62, CAST(N'2024-10-30T07:38:20.067' AS DateTime), N'Completed', CAST(N'2024-10-30T13:03:20.067' AS DateTime), N'Emergency reported by user_13', N'MMR01301')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (114, 98, 1, 66, CAST(N'2024-10-30T02:12:20.067' AS DateTime), N'Pending', NULL, N'Emergency reported by user_14', N'MMR013019')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (115, 58, 2, 69, CAST(N'2024-10-30T00:21:20.067' AS DateTime), N'Pending', NULL, N'Emergency reported by user_15', N'MMR013038')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (116, 63, 3, 89, CAST(N'2024-10-30T12:40:20.067' AS DateTime), N'Completed', NULL, N'Emergency reported by user_16', N'MMR013013')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (117, 91, 1, 95, CAST(N'2024-10-30T09:49:20.067' AS DateTime), N'Completed', NULL, N'Emergency reported by user_17', N'MMR013023')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (118, 49, 1, 70, CAST(N'2024-10-30T12:33:20.067' AS DateTime), N'Completed', NULL, N'Emergency reported by user_18', N'MMR013026')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (119, 51, 1, 79, CAST(N'2024-10-30T02:37:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_19', N'MMR013029')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (120, 71, 1, 95, CAST(N'2024-10-29T23:13:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_20', N'MMR01306')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (121, 34, 1, 62, CAST(N'2024-10-30T07:19:20.070' AS DateTime), N'Pending', NULL, N'Emergency reported by user_21', N'MMR013013')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (122, 38, 4, 45, CAST(N'2024-10-30T08:40:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_22', N'MMR013044')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (123, 55, 3, 95, CAST(N'2024-10-29T23:05:20.070' AS DateTime), N'Completed', CAST(N'2024-10-30T13:07:20.070' AS DateTime), N'Emergency reported by user_23', N'MMR013029')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (124, 55, 1, 86, CAST(N'2024-10-30T01:30:20.070' AS DateTime), N'Pending', NULL, N'Emergency reported by user_24', N'MMR01307')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (125, 85, 4, 47, CAST(N'2024-10-30T05:18:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T12:49:20.070' AS DateTime), N'Emergency reported by user_25', N'MMR013018')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (126, 33, 4, 100, CAST(N'2024-10-29T22:19:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T13:31:20.070' AS DateTime), N'Emergency reported by user_26', N'MMR01308')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (127, 10, 1, 100, CAST(N'2024-10-30T05:50:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T13:13:20.070' AS DateTime), N'Emergency reported by user_27', N'MMR013031')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (128, 41, 1, 73, CAST(N'2024-10-30T06:39:20.070' AS DateTime), N'Pending', NULL, N'Emergency reported by user_28', N'MMR01304')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (129, 75, 3, 94, CAST(N'2024-10-30T10:53:20.070' AS DateTime), N'Completed', CAST(N'2024-10-30T12:55:20.070' AS DateTime), N'Emergency reported by user_29', N'MMR013014')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (130, 27, 2, 93, CAST(N'2024-10-30T05:24:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_30', N'MMR013029')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (131, 56, 2, 61, CAST(N'2024-10-30T06:32:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T13:24:20.070' AS DateTime), N'Emergency reported by user_31', N'MMR013028')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (132, 61, 2, 28, CAST(N'2024-10-30T01:40:20.070' AS DateTime), N'Pending', NULL, N'Emergency reported by user_32', N'MMR013020')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (133, 4, 1, 100, CAST(N'2024-10-30T08:33:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T13:15:20.070' AS DateTime), N'Emergency reported by user_33', N'MMR01306')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (134, 34, 2, 48, CAST(N'2024-10-30T02:03:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_34', N'MMR013041')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (135, 100, 1, 48, CAST(N'2024-10-30T04:55:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_35', N'MMR013027')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (136, 5, 4, 9, CAST(N'2024-10-30T01:27:20.073' AS DateTime), N'Pending', NULL, N'Emergency reported by user_36', N'MMR013025')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (137, 88, 1, 90, CAST(N'2024-10-29T21:38:20.073' AS DateTime), N'Pending', CAST(N'2024-10-30T13:39:20.073' AS DateTime), N'Emergency reported by user_37', N'MMR01304')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (138, 4, 4, 82, CAST(N'2024-10-30T05:25:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_38', N'MMR013028')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (139, 9, 3, 59, CAST(N'2024-10-30T11:27:20.073' AS DateTime), N'Completed', CAST(N'2024-10-30T13:14:20.073' AS DateTime), N'Emergency reported by user_39', N'MMR013022')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (140, 53, 1, 67, CAST(N'2024-10-30T05:33:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_40', N'MMR013046')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (141, 6, 2, 86, CAST(N'2024-10-29T22:09:20.073' AS DateTime), N'Pending', CAST(N'2024-10-30T13:25:20.073' AS DateTime), N'Emergency reported by user_41', N'MMR013013')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (142, 5, 2, 74, CAST(N'2024-10-30T02:27:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_42', N'MMR013011')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (143, 25, 2, 98, CAST(N'2024-10-29T22:25:20.073' AS DateTime), N'Completed', CAST(N'2024-10-30T13:32:20.073' AS DateTime), N'Emergency reported by user_43', N'MMR013011')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (144, 77, 4, 29, CAST(N'2024-10-30T11:50:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_44', N'MMR013022')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (145, 76, 2, 38, CAST(N'2024-10-29T20:19:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_45', N'MMR013031')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (146, 91, 2, 29, CAST(N'2024-10-30T01:23:20.073' AS DateTime), N'Pending', NULL, N'Emergency reported by user_46', N'MMR013042')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (147, 34, 3, 71, CAST(N'2024-10-30T10:57:20.073' AS DateTime), N'Pending', CAST(N'2024-10-30T12:54:20.073' AS DateTime), N'Emergency reported by user_47', N'MMR01302')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (148, 13, 1, 65, CAST(N'2024-10-30T00:45:20.077' AS DateTime), N'Completed', CAST(N'2024-10-30T12:50:20.077' AS DateTime), N'Emergency reported by user_48', N'MMR013021')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (149, 68, 1, 50, CAST(N'2024-10-30T06:40:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T13:34:20.077' AS DateTime), N'Emergency reported by user_49', N'MMR013012')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (150, 72, 1, 95, CAST(N'2024-10-30T09:03:20.077' AS DateTime), N'Completed', CAST(N'2024-10-30T13:20:20.077' AS DateTime), N'Emergency reported by user_50', N'MMR013037')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (151, 37, 2, 21, CAST(N'2024-10-30T04:35:20.077' AS DateTime), N'Completed', NULL, N'Emergency reported by user_51', N'MMR013046')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (152, 67, 3, 96, CAST(N'2024-10-30T10:17:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T13:06:20.077' AS DateTime), N'Emergency reported by user_52', N'MMR01308')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (153, 28, 3, 77, CAST(N'2024-10-30T11:54:20.077' AS DateTime), N'Pending', NULL, N'Emergency reported by user_53', N'MMR013024')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (154, 95, 3, 80, CAST(N'2024-10-30T11:59:20.077' AS DateTime), N'Completed', NULL, N'Emergency reported by user_54', N'MMR01300')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (155, 45, 1, 82, CAST(N'2024-10-30T10:08:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T13:02:20.077' AS DateTime), N'Emergency reported by user_55', N'MMR013028')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (156, 47, 3, 23, CAST(N'2024-10-30T08:35:20.077' AS DateTime), N'Completed', NULL, N'Emergency reported by user_56', N'MMR013030')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (157, 22, 1, 29, CAST(N'2024-10-29T21:11:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T12:49:20.077' AS DateTime), N'Emergency reported by user_57', N'MMR013019')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (158, 37, 4, 82, CAST(N'2024-10-30T04:06:20.077' AS DateTime), N'Completed', CAST(N'2024-10-30T13:05:20.077' AS DateTime), N'Emergency reported by user_58', N'MMR01308')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (159, 30, 4, 76, CAST(N'2024-10-30T08:23:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T13:45:20.077' AS DateTime), N'Emergency reported by user_59', N'MMR013037')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (160, 89, 4, 67, CAST(N'2024-10-30T01:48:20.077' AS DateTime), N'Pending', NULL, N'Emergency reported by user_60', N'MMR01303')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (161, 61, 1, 39, CAST(N'2024-10-30T07:58:20.077' AS DateTime), N'Pending', NULL, N'Emergency reported by user_61', N'MMR013033')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (162, 35, 1, 78, CAST(N'2024-10-29T23:36:20.077' AS DateTime), N'Pending', NULL, N'Emergency reported by user_62', N'MMR013013')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (163, 65, 4, 22, CAST(N'2024-10-29T23:45:20.077' AS DateTime), N'Completed', NULL, N'Emergency reported by user_63', N'MMR013011')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (164, 23, 1, 15, CAST(N'2024-10-30T10:04:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:14:20.080' AS DateTime), N'Emergency reported by user_64', N'MMR013026')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (165, 90, 2, 74, CAST(N'2024-10-29T20:12:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_65', N'MMR01300')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (166, 90, 4, 84, CAST(N'2024-10-29T22:44:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:33:20.080' AS DateTime), N'Emergency reported by user_66', N'MMR013036')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (167, 13, 1, 49, CAST(N'2024-10-30T07:12:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_67', N'MMR013024')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (168, 76, 1, 32, CAST(N'2024-10-30T00:13:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:07:20.080' AS DateTime), N'Emergency reported by user_68', N'MMR013023')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (169, 92, 1, 17, CAST(N'2024-10-30T10:32:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_69', N'MMR013038')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (170, 72, 1, 47, CAST(N'2024-10-29T22:39:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:11:20.080' AS DateTime), N'Emergency reported by user_70', N'MMR01309')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (171, 34, 1, 74, CAST(N'2024-10-29T20:37:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:35:20.080' AS DateTime), N'Emergency reported by user_71', N'MMR013014')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (172, 43, 3, 70, CAST(N'2024-10-29T22:47:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:26:20.080' AS DateTime), N'Emergency reported by user_72', N'MMR013013')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (173, 55, 1, 63, CAST(N'2024-10-30T01:44:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:33:20.080' AS DateTime), N'Emergency reported by user_73', N'MMR013016')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (174, 98, 1, 2, CAST(N'2024-10-29T21:00:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:16:20.080' AS DateTime), N'Emergency reported by user_74', N'MMR013038')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (175, 70, 3, 42, CAST(N'2024-10-30T10:00:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:36:20.080' AS DateTime), N'Emergency reported by user_75', N'MMR013014')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (176, 3, 4, 73, CAST(N'2024-10-29T21:12:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_76', N'MMR013041')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (177, 73, 2, 76, CAST(N'2024-10-30T00:15:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_77', N'MMR01300')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (178, 28, 1, 69, CAST(N'2024-10-29T21:30:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_78', N'MMR013040')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (179, 59, 3, 57, CAST(N'2024-10-30T12:18:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_79', N'MMR013041')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (180, 8, 1, 26, CAST(N'2024-10-30T01:04:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:36:20.080' AS DateTime), N'Emergency reported by user_80', N'MMR013038')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (181, 65, 3, 79, CAST(N'2024-10-30T12:22:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_81', N'MMR013039')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (182, 47, 3, 9, CAST(N'2024-10-29T23:27:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:02:20.080' AS DateTime), N'Emergency reported by user_82', N'MMR013026')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (183, 89, 4, 5, CAST(N'2024-10-30T11:40:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_83', N'MMR013035')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (184, 16, 2, 31, CAST(N'2024-10-30T07:10:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_84', N'MMR013029')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (185, 25, 2, 88, CAST(N'2024-10-30T07:35:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:08:20.080' AS DateTime), N'Emergency reported by user_85', N'MMR013022')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (186, 86, 4, 17, CAST(N'2024-10-30T08:17:20.083' AS DateTime), N'Pending', CAST(N'2024-10-30T13:36:20.083' AS DateTime), N'Emergency reported by user_86', N'MMR013044')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (187, 6, 4, 47, CAST(N'2024-10-30T07:04:20.083' AS DateTime), N'Completed', NULL, N'Emergency reported by user_87', N'MMR013044')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (188, 32, 2, 19, CAST(N'2024-10-30T09:34:20.083' AS DateTime), N'Pending', NULL, N'Emergency reported by user_88', N'MMR013016')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (189, 11, 3, 52, CAST(N'2024-10-30T07:15:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:47:20.083' AS DateTime), N'Emergency reported by user_89', N'MMR01300')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (190, 55, 1, 83, CAST(N'2024-10-30T02:25:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:32:20.083' AS DateTime), N'Emergency reported by user_90', N'MMR013046')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (191, 14, 3, 50, CAST(N'2024-10-30T08:38:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:45:20.083' AS DateTime), N'Emergency reported by user_91', N'MMR01303')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (192, 60, 2, 65, CAST(N'2024-10-30T05:48:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:35:20.083' AS DateTime), N'Emergency reported by user_92', N'MMR013018')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (193, 87, 3, 29, CAST(N'2024-10-30T09:32:20.083' AS DateTime), N'Pending', CAST(N'2024-10-30T13:15:20.083' AS DateTime), N'Emergency reported by user_93', N'MMR013033')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (194, 81, 1, 83, CAST(N'2024-10-29T23:01:20.083' AS DateTime), N'Pending', NULL, N'Emergency reported by user_94', N'MMR013012')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (195, 16, 3, 76, CAST(N'2024-10-30T01:20:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:46:20.083' AS DateTime), N'Emergency reported by user_95', N'MMR013036')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (196, 34, 3, 26, CAST(N'2024-10-30T04:51:20.083' AS DateTime), N'Pending', CAST(N'2024-10-30T13:30:20.083' AS DateTime), N'Emergency reported by user_96', N'MMR013016')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (197, 61, 2, 4, CAST(N'2024-10-30T00:48:20.083' AS DateTime), N'Completed', NULL, N'Emergency reported by user_97', N'MMR013020')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (198, 19, 3, 15, CAST(N'2024-10-29T21:22:20.083' AS DateTime), N'Completed', NULL, N'Emergency reported by user_98', N'MMR013032')
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (199, 49, 4, 99, CAST(N'2024-10-29T23:55:20.083' AS DateTime), N'Completed', NULL, N'Emergency reported by user_99', N'MMR013046')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (200, 62, 4, 20, CAST(N'2024-10-29T21:23:20.083' AS DateTime), N'Pending', CAST(N'2024-10-30T13:37:20.083' AS DateTime), N'Emergency reported by user_100', N'MMR013022')
SET IDENTITY_INSERT [dbo].[EmergencyRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[EmergencyServices] ON 

INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (1, N'Rescue', N'Rescue_Service_1', N'09-5.03254e+008', N'Location_1', N'Y', N'MMR017001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (2, N'Rescue', N'Rescue_Service_2', N'09-7.7252e+008', N'Location_2', N'N', N'MMR013043')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (3, N'Fire', N'Fire_Service_3', N'09-9.92677e+006', N'Location_3', N'N', N'MMR015018')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (4, N'Medical', N'Medical_Service_4', N'09-5.29952e+008', N'Location_4', N'N', N'MMR015304')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (5, N'Police', N'Police_Service_5', N'09-1.38093e+008', N'Location_5', N'Y', N'MMR016001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (6, N'Fire', N'Fire_Service_6', N'09-8.37415e+008', N'Location_6', N'Y', N'MMR015318')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (7, N'Medical', N'Medical_Service_7', N'09-3.28779e+008', N'Location_7', N'N', N'MMR017005')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (8, N'Rescue', N'Rescue_Service_8', N'09-5.70761e+008', N'Location_8', N'N', N'MMR015018')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (9, N'Rescue', N'Rescue_Service_9', N'09-4.47579e+008', N'Location_9', N'Y', N'MMR017025')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (10, N'Rescue', N'Rescue_Service_10', N'09-8.28774e+008', N'Location_10', N'Y', N'MMR001012')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (11, N'Ambulance', N'Ambulance_Service_11', N'09-1.28477e+008', N'Location_11', N'Y', N'MMR006005')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (12, N'Fire', N'Fire_Service_12', N'09-5.96933e+008', N'Location_12', N'Y', N'MMR015312')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (13, N'Fire', N'Fire_Service_13', N'09-2.5951e+008', N'Location_13', N'Y', N'MMR012007')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (14, N'Police', N'Police_Service_14', N'09-9.42654e+008', N'Location_14', N'N', N'MMR013034')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (15, N'Fire', N'Fire_Service_15', N'09-3.93801e+008', N'Location_15', N'N', N'MMR011001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (16, N'Fire', N'Fire_Service_16', N'09-1.69967e+008', N'Location_16', N'N', N'MMR013012')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (17, N'Police', N'Police_Service_17', N'09-9.54991e+008', N'Location_17', N'N', N'MMR005028')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (18, N'Rescue', N'Rescue_Service_18', N'09-8.20493e+008', N'Location_18', N'N', N'MMR013034')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (19, N'Fire', N'Fire_Service_19', N'09-7.19643e+006', N'Location_19', N'Y', N'MMR014009')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (20, N'Medical', N'Medical_Service_20', N'09-1.88888e+008', N'Location_20', N'Y', N'MMR009001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (21, N'Rescue', N'Rescue_Service_21', N'09-1.04267e+007', N'Location_21', N'Y', N'MMR013017')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (22, N'Ambulance', N'Ambulance_Service_22', N'09-8.0869e+008', N'Location_22', N'Y', N'MMR013009')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (23, N'Ambulance', N'Ambulance_Service_23', N'09-3.97712e+008', N'Location_23', N'Y', N'MMR013010')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (24, N'Rescue', N'Rescue_Service_24', N'09-1.73586e+008', N'Location_24', N'Y', N'MMR005036')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (25, N'Rescue', N'Rescue_Service_25', N'09-3.59222e+007', N'Location_25', N'Y', N'MMR016003')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (26, N'Ambulance', N'Ambulance_Service_26', N'09-2.79983e+008', N'Location_26', N'N', N'MMR010010')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (27, N'Police', N'Police_Service_27', N'09-2.01653e+008', N'Location_27', N'N', N'MMR017007')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (28, N'Police', N'Police_Service_28', N'09-8.9828e+008', N'Location_28', N'N', N'MMR007008')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (29, N'Fire', N'Fire_Service_29', N'09-7.28609e+008', N'Location_29', N'Y', N'MMR014019')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (30, N'Ambulance', N'Ambulance_Service_30', N'09-1.05603e+008', N'Location_30', N'N', N'MMR012006')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (31, N'Medical', N'Medical_Service_31', N'09-1.90632e+008', N'Location_31', N'Y', N'MMR009021')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (32, N'Fire', N'Fire_Service_32', N'09-2.41575e+008', N'Location_32', N'N', N'MMR005034')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (33, N'Ambulance', N'Ambulance_Service_33', N'09-2.09367e+008', N'Location_33', N'N', N'MMR014004')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (34, N'Rescue', N'Rescue_Service_34', N'09-6.76365e+008', N'Location_34', N'Y', N'MMR015303')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (35, N'Ambulance', N'Ambulance_Service_35', N'09-2.02086e+008', N'Location_35', N'Y', N'MMR014019')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (36, N'Rescue', N'Rescue_Service_36', N'09-7.87902e+008', N'Location_36', N'N', N'MMR017016')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (37, N'Fire', N'Fire_Service_37', N'09-9.48699e+008', N'Location_37', N'N', N'MMR013011')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (38, N'Police', N'Police_Service_38', N'09-3.7883e+008', N'Location_38', N'N', N'MMR013040')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (39, N'Police', N'Police_Service_39', N'09-5.3626e+008', N'Location_39', N'Y', N'MMR001015')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (40, N'Police', N'Police_Service_40', N'09-2.43581e+008', N'Location_40', N'N', N'MMR009013')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (41, N'Police', N'Police_Service_41', N'09-8.16064e+008', N'Location_41', N'N', N'MMR009009')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (42, N'Police', N'Police_Service_42', N'09-8.25927e+008', N'Location_42', N'Y', N'MMR016323')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (43, N'Police', N'Police_Service_43', N'09-7.06962e+008', N'Location_43', N'Y', N'MMR014016')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (44, N'Rescue', N'Rescue_Service_44', N'09-3.82132e+008', N'Location_44', N'N', N'MMR017004')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (45, N'Police', N'Police_Service_45', N'09-6.75145e+008', N'Location_45', N'Y', N'MMR017012')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (46, N'Rescue', N'Rescue_Service_46', N'09-5.55884e+008', N'Location_46', N'N', N'MMR002005')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (47, N'Ambulance', N'Ambulance_Service_47', N'09-4.36041e+008', N'Location_47', N'Y', N'MMR012004')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (48, N'Rescue', N'Rescue_Service_48', N'09-8.98564e+008', N'Location_48', N'N', N'MMR010001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (49, N'Ambulance', N'Ambulance_Service_49', N'09-3.40066e+008', N'Location_49', N'Y', N'MMR012015')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (50, N'Police', N'Police_Service_50', N'09-5.14996e+007', N'Location_50', N'N', N'MMR013018')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (51, N'Fire', N'Fire_Service_51', N'09-3.0895e+008', N'Location_51', N'N', N'MMR015201')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (52, N'Ambulance', N'Ambulance_Service_52', N'09-7.10211e+008', N'Location_52', N'N', N'MMR011001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (53, N'Fire', N'Fire_Service_53', N'09-4.80699e+008', N'Location_53', N'N', N'MMR016011')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (54, N'Ambulance', N'Ambulance_Service_54', N'09-2.94186e+008', N'Location_54', N'Y', N'MMR011004')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (55, N'Medical', N'Medical_Service_55', N'09-2.71161e+008', N'Location_55', N'Y', N'MMR010020')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (56, N'Rescue', N'Rescue_Service_56', N'09-4.31741e+008', N'Location_56', N'N', N'MMR003004')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (57, N'Police', N'Police_Service_57', N'09-2.51952e+008', N'Location_57', N'N', N'MMR013011')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (58, N'Rescue', N'Rescue_Service_58', N'09-8.42109e+008', N'Location_58', N'Y', N'MMR015315')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (59, N'Police', N'Police_Service_59', N'09-4.75713e+008', N'Location_59', N'N', N'MMR005034')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (60, N'Medical', N'Medical_Service_60', N'09-1.12247e+008', N'Location_60', N'N', N'MMR010014')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (61, N'Rescue', N'Rescue_Service_61', N'09-8.14341e+008', N'Location_61', N'Y', N'MMR012014')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (62, N'Ambulance', N'Ambulance_Service_62', N'09-7.40644e+008', N'Location_62', N'N', N'MMR005015')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (63, N'Rescue', N'Rescue_Service_63', N'09-7.16415e+008', N'Location_63', N'N', N'MMR008007')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (64, N'Rescue', N'Rescue_Service_64', N'09-3.5994e+008', N'Location_64', N'N', N'MMR007010')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (65, N'Police', N'Police_Service_65', N'09-5.84594e+008', N'Location_65', N'Y', N'MMR005001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (66, N'Fire', N'Fire_Service_66', N'09-3.03951e+008', N'Location_66', N'N', N'MMR014010')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (67, N'Fire', N'Fire_Service_67', N'09-4.52392e+008', N'Location_67', N'N', N'MMR007004')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (68, N'Fire', N'Fire_Service_68', N'09-3.17613e+008', N'Location_68', N'N', N'MMR010011')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (69, N'Ambulance', N'Ambulance_Service_69', N'09-7.38845e+008', N'Location_69', N'Y', N'MMR005012')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (70, N'Fire', N'Fire_Service_70', N'09-9.85071e+008', N'Location_70', N'N', N'MMR005025')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (71, N'Rescue', N'Rescue_Service_71', N'09-6.302e+008', N'Location_71', N'N', N'MMR001016')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (72, N'Ambulance', N'Ambulance_Service_72', N'09-8.14323e+008', N'Location_72', N'N', N'MMR001007')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (73, N'Ambulance', N'Ambulance_Service_73', N'09-4.64877e+008', N'Location_73', N'N', N'MMR010004')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (74, N'Police', N'Police_Service_74', N'09-7.48429e+008', N'Location_74', N'N', N'MMR017026')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (75, N'Fire', N'Fire_Service_75', N'09-6.02517e+008', N'Location_75', N'N', N'MMR005030')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (76, N'Medical', N'Medical_Service_76', N'09-7.91475e+008', N'Location_76', N'N', N'MMR005014')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (77, N'Police', N'Police_Service_77', N'09-4.54169e+008', N'Location_77', N'N', N'MMR008003')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (78, N'Police', N'Police_Service_78', N'09-8.06139e+008', N'Location_78', N'Y', N'MMR010008')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (79, N'Fire', N'Fire_Service_79', N'09-4.11689e+008', N'Location_79', N'Y', N'MMR004003')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (80, N'Fire', N'Fire_Service_80', N'09-8.20761e+008', N'Location_80', N'Y', N'MMR002001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (81, N'Fire', N'Fire_Service_81', N'09-7.35274e+008', N'Location_81', N'Y', N'MMR013029')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (82, N'Fire', N'Fire_Service_82', N'09-5.58644e+008', N'Location_82', N'Y', N'MMR005006')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (83, N'Medical', N'Medical_Service_83', N'09-2.43022e+008', N'Location_83', N'Y', N'MMR005026')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (84, N'Medical', N'Medical_Service_84', N'09-6.91551e+008', N'Location_84', N'Y', N'MMR010023')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (85, N'Medical', N'Medical_Service_85', N'09-9.938e+008', N'Location_85', N'Y', N'MMR013024')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (86, N'Ambulance', N'Ambulance_Service_86', N'09-7.99838e+008', N'Location_86', N'Y', N'MMR015203')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (87, N'Fire', N'Fire_Service_87', N'09-9.45172e+008', N'Location_87', N'Y', N'MMR015310')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (88, N'Fire', N'Fire_Service_88', N'09-1.52999e+008', N'Location_88', N'N', N'MMR005005')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (89, N'Medical', N'Medical_Service_89', N'09-9.7737e+008', N'Location_89', N'N', N'MMR005022')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (90, N'Police', N'Police_Service_90', N'09-8.38796e+008', N'Location_90', N'Y', N'MMR001004')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (91, N'Ambulance', N'Ambulance_Service_91', N'09-8.88966e+008', N'Location_91', N'Y', N'MMR013042')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (92, N'Ambulance', N'Ambulance_Service_92', N'09-7.33466e+008', N'Location_92', N'N', N'MMR007005')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (93, N'Ambulance', N'Ambulance_Service_93', N'09-5.29805e+008', N'Location_93', N'Y', N'MMR017021')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (94, N'Police', N'Police_Service_94', N'09-3.63033e+008', N'Location_94', N'Y', N'MMR008012')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (95, N'Fire', N'Fire_Service_95', N'09-6.09795e+008', N'Location_95', N'N', N'MMR014001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (96, N'Ambulance', N'Ambulance_Service_96', N'09-9.3826e+008', N'Location_96', N'N', N'MMR014013')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (97, N'Medical', N'Medical_Service_97', N'09-9.99265e+008', N'Location_97', N'N', N'MMR011001')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (98, N'Police', N'Police_Service_98', N'09-6.20145e+008', N'Location_98', N'Y', N'MMR014020')
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (99, N'Medical', N'Medical_Service_99', N'09-6.21443e+008', N'Location_99', N'N', N'MMR015007')
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode]) VALUES (100, N'Police', N'Police_Service_100', N'09-4.98342e+008', N'Location_100', N'Y', N'MMR014018')
SET IDENTITY_INSERT [dbo].[EmergencyServices] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceProviders] ON 

INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (1, N'Provider_1', 67, N'09-2.43805e+008', N'Y', N'MMR017014')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (2, N'Provider_2', 32, N'09-6.25933e+008', N'N', N'MMR014003')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (3, N'Provider_3', 69, N'09-5.86587e+008', N'Y', N'MMR010008')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (4, N'Provider_4', 57, N'09-3.82941e+008', N'N', N'MMR017019')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (5, N'Provider_5', 93, N'09-5.12702e+008', N'N', N'MMR009022')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (6, N'Provider_6', 72, N'09-4.78861e+008', N'Y', N'MMR015306')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (7, N'Provider_7', 27, N'09-8.25504e+008', N'Y', N'MMR007014')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (8, N'Provider_8', 44, N'09-2.04979e+008', N'N', N'MMR005004')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (9, N'Provider_9', 24, N'09-9.86562e+008', N'Y', N'MMR014012')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (10, N'Provider_10', 11, N'09-3.1908e+008', N'N', N'MMR001018')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (11, N'Provider_11', 88, N'09-3.41994e+008', N'N', N'MMR011003')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (12, N'Provider_12', 63, N'09-8.95491e+008', N'N', N'MMR009011')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (13, N'Provider_13', 41, N'09-4.07485e+008', N'N', N'MMR017002')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (14, N'Provider_14', 45, N'09-3.44512e+008', N'Y', N'MMR011008')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (15, N'Provider_15', 1, N'09-7.62673e+008', N'Y', N'MMR003004')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (16, N'Provider_16', 27, N'09-6.59775e+008', N'N', N'MMR017004')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (17, N'Provider_17', 67, N'09-8.69689e+008', N'N', N'MMR012010')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (18, N'Provider_18', 29, N'09-4.79781e+008', N'N', N'MMR010004')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (19, N'Provider_19', 26, N'09-5.39636e+008', N'Y', N'MMR014013')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (20, N'Provider_20', 99, N'09-5.43548e+008', N'N', N'MMR011004')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (21, N'Provider_21', 73, N'09-6.70084e+008', N'N', N'MMR004003')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (22, N'Provider_22', 41, N'09-5.03543e+007', N'N', N'MMR010017')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (23, N'Provider_23', 25, N'09-2.95592e+008', N'Y', N'MMR015024')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (24, N'Provider_24', 22, N'09-1.61336e+008', N'N', N'MMR013022')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (25, N'Provider_25', 4, N'09-7.21003e+008', N'N', N'MMR009016')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (26, N'Provider_26', 69, N'09-3.41083e+008', N'N', N'MMR001017')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (27, N'Provider_27', 85, N'09-8.11579e+008', N'Y', N'MMR007009')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (28, N'Provider_28', 74, N'09-5.99282e+008', N'Y', N'MMR005023')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (29, N'Provider_29', 65, N'09-4.81824e+008', N'Y', N'MMR012012')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (30, N'Provider_30', 47, N'09-5.67204e+008', N'N', N'MMR010012')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (31, N'Provider_31', 99, N'09-2.97384e+007', N'Y', N'MMR015008')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (32, N'Provider_32', 38, N'09-5.47775e+008', N'Y', N'MMR017017')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (33, N'Provider_33', 41, N'09-8.66086e+008', N'Y', N'MMR012003')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (34, N'Provider_34', 65, N'09-2.12393e+008', N'Y', N'MMR007014')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (35, N'Provider_35', 21, N'09-7.22384e+008', N'Y', N'MMR015007')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (36, N'Provider_36', 18, N'09-8.08694e+008', N'N', N'MMR012015')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (37, N'Provider_37', 60, N'09-5.94713e+008', N'Y', N'MMR007001')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (38, N'Provider_38', 26, N'09-5.92313e+008', N'N', N'MMR013034')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (39, N'Provider_39', 77, N'09-3.51296e+008', N'N', N'MMR016321')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (40, N'Provider_40', 35, N'09-7.43485e+008', N'Y', N'MMR017015')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (41, N'Provider_41', 24, N'09-7.66073e+008', N'Y', N'MMR005002')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (42, N'Provider_42', 32, N'09-5.21431e+008', N'N', N'MMR016322')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (43, N'Provider_43', 12, N'09-5.85875e+008', N'N', N'MMR001007')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (44, N'Provider_44', 95, N'09-7.69065e+008', N'N', N'MMR001006')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (45, N'Provider_45', 16, N'09-2.16783e+008', N'Y', N'MMR017006')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (46, N'Provider_46', 17, N'09-5.56222e+008', N'N', N'MMR016005')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (47, N'Provider_47', 9, N'09-9.71505e+008', N'Y', N'MMR013017')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (48, N'Provider_48', 9, N'09-1.52241e+008', N'Y', N'MMR014002')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (49, N'Provider_49', 61, N'09-3.30718e+008', N'N', N'MMR009017')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (50, N'Provider_50', 85, N'09-5.11148e+008', N'N', N'MMR018004')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (51, N'Provider_51', 37, N'09-7.82322e+008', N'N', N'MMR002003')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (52, N'Provider_52', 31, N'09-4.07051e+008', N'Y', N'MMR013045')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (53, N'Provider_53', 90, N'09-1.34735e+008', N'Y', N'MMR005036')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (54, N'Provider_54', 20, N'09-1.86136e+008', N'N', N'MMR012017')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (55, N'Provider_55', 2, N'09-9.45949e+008', N'N', N'MMR013002')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (56, N'Provider_56', 75, N'09-4.18976e+008', N'Y', N'MMR017024')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (57, N'Provider_57', 8, N'09-5.21638e+008', N'N', N'MMR012005')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (58, N'Provider_58', 89, N'09-2.48562e+008', N'N', N'MMR009001')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (59, N'Provider_59', 70, N'09-7.99988e+008', N'N', N'MMR017026')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (60, N'Provider_60', 82, N'09-5.61641e+008', N'Y', N'MMR014006')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (61, N'Provider_61', 87, N'09-1.46399e+008', N'N', N'MMR013034')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (62, N'Provider_62', 52, N'09-8.51792e+008', N'Y', N'MMR006005')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (63, N'Provider_63', 69, N'09-4.59513e+008', N'Y', N'MMR015016')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (64, N'Provider_64', 44, N'09-9.55187e+007', N'Y', N'MMR011001')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (65, N'Provider_65', 60, N'09-5.17448e+008', N'Y', N'MMR012008')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (66, N'Provider_66', 39, N'09-7.19336e+008', N'N', N'MMR017013')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (67, N'Provider_67', 89, N'09-4.10809e+008', N'N', N'MMR015310')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (68, N'Provider_68', 83, N'09-9.18354e+008', N'N', N'MMR007012')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (69, N'Provider_69', 50, N'09-7.43385e+008', N'N', N'MMR005026')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (70, N'Provider_70', 92, N'09-9.45932e+008', N'Y', N'MMR006007')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (71, N'Provider_71', 49, N'09-7.17183e+008', N'Y', N'MMR017011')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (72, N'Provider_72', 99, N'09-4.02728e+008', N'N', N'MMR016009')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (73, N'Provider_73', 68, N'09-5.16863e+008', N'N', N'MMR017006')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (74, N'Provider_74', 97, N'09-8.19725e+008', N'Y', N'MMR017025')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (75, N'Provider_75', 25, N'09-9.97446e+007', N'Y', N'MMR017004')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (76, N'Provider_76', 26, N'09-3.1845e+007', N'N', N'MMR015302')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (77, N'Provider_77', 1, N'09-3.71687e+008', N'Y', N'MMR013004')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (78, N'Provider_78', 77, N'09-9.60877e+008', N'Y', N'MMR017009')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (79, N'Provider_79', 51, N'09-5.67806e+008', N'Y', N'MMR005025')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (80, N'Provider_80', 72, N'09-9.91592e+008', N'Y', N'MMR005022')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (81, N'Provider_81', 65, N'09-4.21963e+007', N'N', N'MMR013046')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (82, N'Provider_82', 81, N'09-9.0914e+008', N'Y', N'MMR013016')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (83, N'Provider_83', 39, N'09-5.62621e+008', N'N', N'MMR011003')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (84, N'Provider_84', 48, N'09-8.99087e+008', N'N', N'MMR007008')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (85, N'Provider_85', 1, N'09-1.19817e+008', N'Y', N'MMR015201')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (86, N'Provider_86', 35, N'09-8.44061e+007', N'Y', N'MMR014007')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (87, N'Provider_87', 64, N'09-5.71381e+008', N'Y', N'MMR016001')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (88, N'Provider_88', 34, N'09-3.6717e+008', N'N', N'MMR012010')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (89, N'Provider_89', 74, N'09-3.47585e+008', N'Y', N'MMR003007')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (90, N'Provider_90', 2, N'09-6.14149e+008', N'N', N'MMR013003')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (91, N'Provider_91', 20, N'09-8.97107e+008', N'N', N'MMR013026')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (92, N'Provider_92', 19, N'09-9.42792e+008', N'N', N'MMR015317')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (93, N'Provider_93', 29, N'09-4.76931e+008', N'Y', N'MMR010005')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (94, N'Provider_94', 1, N'09-9.63379e+008', N'Y', N'MMR005027')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (95, N'Provider_95', 56, N'09-5.87166e+008', N'N', N'MMR013043')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (96, N'Provider_96', 8, N'09-7.60276e+008', N'N', N'MMR009010')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (97, N'Provider_97', 90, N'09-2.53267e+007', N'N', N'MMR014003')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (98, N'Provider_98', 92, N'09-6.21278e+008', N'N', N'MMR012013')
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (99, N'Provider_99', 74, N'09-5.35786e+008', N'Y', N'MMR009007')
GO
INSERT [dbo].[ServiceProviders] ([ProviderId], [ProviderName], [ServiceId], [ContactNumber], [Availability], [TownshipCode]) VALUES (100, N'Provider_100', 46, N'09-9.97518e+008', N'Y', N'MMR013009')
SET IDENTITY_INSERT [dbo].[ServiceProviders] OFF
GO
SET IDENTITY_INSERT [dbo].[StateRegions] ON 

INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (1, N'MMR001', N'Kachin', N'ကချင်ပြည်နယ်')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (2, N'MMR002', N'Kayah', N'ကယားပြည်နယ်')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (3, N'MMR003', N'Kayin', N'ကရင်ပြည်နယ်')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (4, N'MMR004', N'Chin', N'ချင်းပြည်နယ်')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (5, N'MMR005', N'Sagaing', N'စစ်ကိုင်းတိုင်းဒေသကြီး')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (6, N'MMR006', N'Tanintharyi', N'တနင်္သာရီတိုင်းဒေသကြီး')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (7, N'MMR007', N'Bago (East)', N'ပဲခူးတိုင်းဒေသကြီး (အရှေ့)')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (8, N'MMR008', N'Bago (West)', N'ပဲခူးတိုင်းဒေသကြီး (အနောက်)')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (9, N'MMR009', N'Magway', N'မကွေးတိုင်းဒေသကြီး')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (10, N'MMR010', N'Mandalay', N'မန္တလေးတိုင်းဒေသကြီး')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (11, N'MMR011', N'Mon', N'မွန်ပြည်နယ်')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (12, N'MMR012', N'Rakhine', N'ရခိုင်ပြည်နယ်')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (13, N'MMR013', N'Yangon', N'ရန်ကုန်တိုင်းဒေသကြီး')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (14, N'MMR014', N'Shan (South)', N'ရှမ်းပြည်နယ် (တောင်)')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (15, N'MMR015', N'Shan (North)', N'ရှမ်းပြည်နယ် (မြောက်)')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (16, N'MMR016', N'Shan (East)', N'ရှမ်းပြည်နယ် (အရှေ့)')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (17, N'MMR017', N'Ayeyarwady', N'ဧရာဝတီတိုင်းဒေသကြီး')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (18, N'MMR018', N'Nay Pyi Taw', N'နေပြည်တော်')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (19, N'MMR111', N'Bago', N'ပဲခူးတိုင်းဒေသကြီး')
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (20, N'MMR222', N'Shan', N'ရှမ်းပြည်နယ်')
SET IDENTITY_INSERT [dbo].[StateRegions] OFF
GO
SET IDENTITY_INSERT [dbo].[Townships] ON 

INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (1, N'MMR017024', N'Bogale', N'ဘိုကလေး', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (2, N'MMR017022', N'Danubyu', N'ဓနုဖြူ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (3, N'MMR017026', N'Dedaye', N'ဒေးဒရဲ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (4, N'MMR017015', N'Einme', N'အိမ်မဲ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (5, N'MMR017008', N'Hinthada', N'ဟင်္သာတ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (6, N'MMR017013', N'Ingapu', N'အင်္ဂပူ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (7, N'MMR017002', N'Kangyidaunt', N'ကန်ကြီးထောင့်', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (8, N'MMR017025', N'Kyaiklat', N'ကျိုက်လတ်', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (9, N'MMR017012', N'Kyangin', N'ကြံခင်း', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (10, N'MMR017007', N'Kyaunggon', N'ကျောင်းကုန်း', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (11, N'MMR017005', N'Kyonpyaw', N'ကျုံပျော်', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (12, N'MMR017016', N'Labutta', N'လပွတ္တာ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (13, N'MMR017010', N'Lemyethna', N'လေးမျက်နှာ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (14, N'MMR017019', N'Maubin', N'မအူပင်', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (15, N'MMR017018', N'Mawlamyinegyun', N'မော်လမြိုင်ကျွန်း', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (16, N'MMR017011', N'Myanaung', N'မြန်အောင်', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (17, N'MMR017014', N'Myaungmya', N'မြောင်းမြ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (18, N'MMR017004', N'Ngapudaw', N'ငပုတော', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (19, N'MMR017021', N'Nyaungdon', N'ညောင်တုန်း', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (20, N'MMR017020', N'Pantanaw', N'ပန်းတနော်', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (21, N'MMR017001', N'Pathein', N'ပုသိမ်', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (22, N'MMR017023', N'Pyapon', N'ဖျာပုံ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (23, N'MMR017003', N'Thabaung', N'သာပေါင်း', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (24, N'MMR017017', N'Wakema', N'ဝါးခယ်မ', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (25, N'MMR017006', N'Yegyi', N'ရေကြည်', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (26, N'MMR017009', N'Zalun', N'ဇလွန်', N'MMR017')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (27, N'MMR007001', N'Bago', N'ပဲခူး', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (28, N'MMR007007', N'Daik-U', N'ဒိုက်ဦး', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (29, N'MMR007014', N'Htantabin', N'ထန်းတပင်', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (30, N'MMR007003', N'Kawa', N'ကဝ', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (31, N'MMR007011', N'Kyaukkyi', N'ကျောက်ကြီး', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (32, N'MMR007006', N'Kyauktaga', N'ကျောက်တံခါး', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (33, N'MMR007005', N'Nyaunglebin', N'ညောင်လေးပင်', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (34, N'MMR007013', N'Oktwin', N'အုတ်တွင်း', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (35, N'MMR007012', N'Phyu', N'ဖြူး', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (36, N'MMR007008', N'Shwegyin', N'ရွှေကျင်', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (37, N'MMR007009', N'Taungoo', N'တောင်ငူ', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (38, N'MMR007002', N'Thanatpin', N'သနပ်ပင်', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (39, N'MMR007004', N'Waw', N'ဝေါ', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (40, N'MMR007010', N'Yedashe', N'ရေတာရှည်', N'MMR007')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (41, N'MMR008014', N'Gyobingauk', N'ကြို့ပင်ကောက်', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (42, N'MMR008008', N'Letpadan', N'လက်ပံတန်း', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (43, N'MMR008009', N'Minhla', N'မင်းလှ', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (44, N'MMR008013', N'Monyo', N'မိုးညို', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (45, N'MMR008012', N'Nattalin', N'နတ်တလင်း', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (46, N'MMR008010', N'Okpho', N'အုတ်ဖို', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (47, N'MMR008003', N'Padaung', N'ပန်းတောင်း', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (48, N'MMR008002', N'Paukkhaung', N'ပေါက်ခေါင်း', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (49, N'MMR008004', N'Paungde', N'ပေါင်းတည်', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (50, N'MMR008001', N'Pyay', N'ပြည်', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (51, N'MMR008006', N'Shwedaung', N'ရွှေတောင်', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (52, N'MMR008007', N'Thayarwady', N'သာယာဝတီ', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (53, N'MMR008005', N'Thegon', N'သဲကုန်း', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (54, N'MMR008011', N'Zigon', N'ဇီးကုန်း', N'MMR008')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (55, N'MMR004001', N'Falam', N'ဖလမ်း', N'MMR004')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (56, N'MMR004002', N'Hakha', N'ဟားခါး', N'MMR004')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (57, N'MMR004008', N'Kanpetlet', N'ကန်ပက်လက်', N'MMR004')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (58, N'MMR004007', N'Matupi', N'မတူပီ', N'MMR004')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (59, N'MMR004006', N'Mindat', N'မင်းတပ်', N'MMR004')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (60, N'MMR004009', N'Paletwa', N'ပလက်ဝ', N'MMR004')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (61, N'MMR004004', N'Tedim', N'တီးတိန်', N'MMR004')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (62, N'MMR004003', N'Thantlang', N'ထန်တလန်', N'MMR004')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (63, N'MMR004005', N'Tonzang', N'တွန်းဇန်', N'MMR004')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (64, N'MMR001010', N'Bhamo', N'ဗန်းမော်', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (65, N'MMR001005', N'Chipwi', N'ချီ​ဖွေ', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (66, N'MMR001009', N'Hpakant', N'ဖားကန့်', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (67, N'MMR001003', N'Injangyang', N'အင်ဂျန်းယန်', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (68, N'MMR001018', N'Khaunglanhpu', N'ခေါင်လန်ဖူး', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (69, N'MMR001016', N'Machanbaw', N'မချမ်းဘော', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (70, N'MMR001013', N'Mansi', N'မံစီ', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (71, N'MMR001008', N'Mogaung', N'မိုးကောင်း', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (72, N'MMR001007', N'Mohnyin', N'မိုးညှင်း', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (73, N'MMR001012', N'Momauk', N'မိုးမောက်', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (74, N'MMR001001', N'Myitkyina', N'မြစ်ကြီးနား', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (75, N'MMR001017', N'Nawngmun', N'နောင်မွန်း', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (76, N'MMR001014', N'Puta-O', N'ပူတာအို', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (77, N'MMR001011', N'Shwegu', N'ရွှေကူ', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (78, N'MMR001015', N'Sumprabum', N'ဆွမ်ပရာဘွမ်', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (79, N'MMR001004', N'Tanai', N'တနိုင်း', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (80, N'MMR001006', N'Tsawlaw', N'ဆော့လော်', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (81, N'MMR001002', N'Waingmaw', N'ဝိုင်းမော်', N'MMR001')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (82, N'MMR002005', N'Bawlake', N'ဘောလခဲ', N'MMR002')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (83, N'MMR002002', N'Demoso', N'ဒီးမော့ဆို', N'MMR002')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (84, N'MMR002006', N'Hpasawng', N'ဖားဆောင်း', N'MMR002')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (85, N'MMR002003', N'Hpruso', N'ဖရူဆို', N'MMR002')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (86, N'MMR002001', N'Loikaw', N'လွိုင်ကော်', N'MMR002')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (87, N'MMR002007', N'Mese', N'မယ်စဲ့', N'MMR002')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (88, N'MMR002004', N'Shadaw', N'ရှားတော', N'MMR002')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (89, N'MMR003002', N'Hlaingbwe', N'လှိုင်းဘွဲ့', N'MMR003')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (90, N'MMR003001', N'Hpa-An', N'ဘားအံ', N'MMR003')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (91, N'MMR003003', N'Hpapun', N'ဖာပွန်', N'MMR003')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (92, N'MMR003006', N'Kawkareik', N'ကော့ကရိတ်', N'MMR003')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (93, N'MMR003007', N'Kyainseikgyi', N'ကြာအင်းဆိပ်ကြီး', N'MMR003')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (94, N'MMR003005', N'Myawaddy', N'မြဝတီ', N'MMR003')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (95, N'MMR003004', N'Thandaunggyi', N'သံတောင်ကြီး', N'MMR003')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (96, N'MMR009016', N'Aunglan', N'အောင်လံ', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (97, N'MMR009003', N'Chauk', N'ချောက်', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (98, N'MMR009023', N'Gangaw', N'ဂန့်ဂေါ', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (99, N'MMR009015', N'Kamma', N'ကံမ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (100, N'MMR009001', N'Magway', N'မကွေး', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (101, N'MMR009007', N'Minbu', N'မင်းဘူး', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (102, N'MMR009014', N'Mindon', N'မင်းတုန်း', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (103, N'MMR009013', N'Minhla', N'မင်းလှ', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (104, N'MMR009020', N'Myaing', N'မြိုင်', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (105, N'MMR009005', N'Myothit', N'မြို့သစ်', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (106, N'MMR009006', N'Natmauk', N'နတ်မောက်', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (107, N'MMR009009', N'Ngape', N'ငဖဲ', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (108, N'MMR009018', N'Pakokku', N'ပခုက္ကူ', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (109, N'MMR009021', N'Pauk', N'ပေါက်', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (110, N'MMR009008', N'Pwintbyu', N'ပွင့်ဖြူ', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (111, N'MMR009010', N'Salin', N'စလင်း', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (112, N'MMR009025', N'Saw', N'ဆော', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (113, N'MMR009022', N'Seikphyu', N'ဆိပ်ဖြူ', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (114, N'MMR009011', N'Sidoktaya', N'စေတုတ္ထရာ', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (115, N'MMR009017', N'Sinbaungwe', N'ဆင်ပေါင်ဝဲ', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (116, N'MMR009004', N'Taungdwingyi', N'တောင်တွင်းကြီး', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (117, N'MMR009012', N'Thayet', N'သရက်', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (118, N'MMR009024', N'Tilin', N'ထီးလင်း', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (119, N'MMR009002', N'Yenangyaung', N'ရေနံချောင်း', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (120, N'MMR009019', N'Yesagyo', N'ရေစကြို', N'MMR009')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (121, N'MMR010006', N'Amarapura', N'အမရပူရ', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (122, N'MMR010001', N'Aungmyaythazan', N'အောင်မြေသာစံ', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (123, N'MMR010002', N'Chanayethazan', N'ချမ်းအေးသာစံ', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (124, N'MMR010004', N'Chanmyathazi', N'ချမ်းမြသာစည်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (125, N'MMR010020', N'Kyaukpadaung', N'ကျောက်ပန်းတောင်း', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (126, N'MMR010013', N'Kyaukse', N'ကျောက်ဆည်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (127, N'MMR010009', N'Madaya', N'မတ္တရာ', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (128, N'MMR010003', N'Mahaaungmyay', N'မဟာအောင်မြေ', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (129, N'MMR010029', N'Mahlaing', N'မလှိုင်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (130, N'MMR010028', N'Meiktila', N'မိတ္ထီလာ', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (131, N'MMR010011', N'Mogoke', N'မိုးကုတ်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (132, N'MMR010017', N'Myingyan', N'မြင်းခြံ', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (133, N'MMR010015', N'Myittha', N'မြစ်သား', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (134, N'MMR010019', N'Natogyi', N'နွားထိုးကြီး', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (135, N'MMR010021', N'Ngazun', N'ငါန်းဇွန်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (136, N'MMR010022', N'Nyaung-U', N'ညောင်ဦး', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (137, N'MMR010007', N'Patheingyi', N'ပုသိမ်ကြီး', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (138, N'MMR010024', N'Pyawbwe', N'ပျော်ဘွယ်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (139, N'MMR010005', N'Pyigyitagon', N'ပြည်ကြီးတံခွန်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (140, N'MMR010008', N'Pyinoolwin', N'ပြင်ဦးလွင်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (141, N'MMR010010', N'Singu', N'စဉ့်ကူး', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (142, N'MMR010014', N'Sintgaing', N'စဉ့်ကိုင်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (143, N'MMR010016', N'Tada-U', N'တံတားဦး', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (144, N'MMR010018', N'Taungtha', N'တောင်သာ', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (145, N'MMR010012', N'Thabeikkyin', N'သပိတ်ကျင်း', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (146, N'MMR010030', N'Thazi', N'သာစည်', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (147, N'MMR010031', N'Wundwin', N'ဝမ်းတွင်း', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (148, N'MMR010023', N'Yamethin', N'ရမည်းသင်း', N'MMR010')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (149, N'MMR011010', N'Bilin', N'ဘီးလင်း', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (150, N'MMR011003', N'Chaungzon', N'ချောင်းဆုံ', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (151, N'MMR011002', N'Kyaikmaraw', N'ကျိုက်မရော', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (152, N'MMR011009', N'Kyaikto', N'ကျိုက်ထို', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (153, N'MMR011001', N'Mawlamyine', N'မော်လမြိုင်', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (154, N'MMR011005', N'Mudon', N'မုဒုံ', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (155, N'MMR011008', N'Paung', N'ပေါင်', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (156, N'MMR011004', N'Thanbyuzayat', N'သံဖြူဇရပ်', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (157, N'MMR011007', N'Thaton', N'သထုံ', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (158, N'MMR011006', N'Ye', N'ရေး', N'MMR011')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (159, N'MMR018004', N'Det Khi Na Thi Ri', N'ဒက္ခိဏသီရိ', N'MMR018')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (160, N'MMR018007', N'Lewe', N'လယ်ဝေး', N'MMR018')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (161, N'MMR018008', N'Oke Ta Ra Thi Ri', N'ဥတ္တရသီရိ', N'MMR018')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (162, N'MMR018005', N'Poke Ba Thi Ri', N'ပုဗ္ဗသီရိ', N'MMR018')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (163, N'MMR018006', N'Pyinmana', N'ပျဉ်းမနား', N'MMR018')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (164, N'MMR018003', N'Tatkon', N'တပ်ကုန်း', N'MMR018')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (165, N'MMR018002', N'Za Bu Thi Ri', N'ဇမ္ဗူသီရိ', N'MMR018')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (166, N'MMR018001', N'Zay Yar Thi Ri', N'ဇေယျာသီရိ', N'MMR018')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (167, N'MMR012014', N'Ann', N'အမ်း', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (168, N'MMR012010', N'Buthidaung', N'ဘူးသီးတောင်', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (169, N'MMR012017', N'Gwa', N'ဂွ', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (170, N'MMR012011', N'Kyaukpyu', N'ကျောက်ဖြူ', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (171, N'MMR012004', N'Kyauktaw', N'ကျောက်တော်', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (172, N'MMR012009', N'Maungdaw', N'မောင်တော', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (173, N'MMR012005', N'Minbya', N'မင်းပြား', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (174, N'MMR012003', N'Mrauk-U', N'မြောက်ဦး', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (175, N'MMR012012', N'Munaung', N'မာန်အောင်', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (176, N'MMR012006', N'Myebon', N'မြေပုံ', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (177, N'MMR012007', N'Pauktaw', N'ပေါက်တော', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (178, N'MMR012002', N'Ponnagyun', N'ပုဏ္ဏားကျွန်း', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (179, N'MMR012013', N'Ramree', N'ရမ်းဗြဲ', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (180, N'MMR012008', N'Rathedaung', N'ရသေ့တောင်', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (181, N'MMR012001', N'Sittwe', N'စစ်တွေ', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (182, N'MMR012015', N'Thandwe', N'သံတွဲ', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (183, N'MMR012016', N'Toungup', N'တောင်ကုတ်', N'MMR012')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (184, N'MMR005014', N'Ayadaw', N'အရာတော်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (185, N'MMR005023', N'Banmauk', N'ဗန်းမောက်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (186, N'MMR005013', N'Budalin', N'ဘုတလင်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (187, N'MMR005015', N'Chaung-U', N'ချောင်းဦး', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (188, N'MMR005033', N'Hkamti', N'ခန္တီး', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (189, N'MMR005034', N'Homalin', N'ဟုမ္မလင်း', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (190, N'MMR005021', N'Indaw', N'အင်းတော်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (191, N'MMR005027', N'Kale', N'ကလေး', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (192, N'MMR005028', N'Kalewa', N'ကလေးဝ', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (193, N'MMR005007', N'Kanbalu', N'ကန့်ဘလူ', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (194, N'MMR005017', N'Kani', N'ကနီ', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (195, N'MMR005020', N'Katha', N'ကသာ', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (196, N'MMR005024', N'Kawlin', N'ကောလင်း', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (197, N'MMR005005', N'Khin-U', N'ခင်ဦး', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (198, N'MMR005008', N'Kyunhla', N'ကျွန်းလှ', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (199, N'MMR005036', N'Lahe', N'လဟယ်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (200, N'MMR005035', N'Layshi', N'လေရှီး', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (201, N'MMR005031', N'Mawlaik', N'မော်လိုက်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (202, N'MMR005029', N'Mingin', N'မင်းကင်း', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (203, N'MMR005012', N'Monywa', N'မုံရွာ', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (204, N'MMR005003', N'Myaung', N'မြောင်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (205, N'MMR005002', N'Myinmu', N'မြင်းမူ', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (206, N'MMR005037', N'Nanyun', N'နန်းယွန်း', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (207, N'MMR005019', N'Pale', N'ပုလဲ', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (208, N'MMR005032', N'Paungbyin', N'ဖောင်းပြင်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (209, N'MMR005026', N'Pinlebu', N'ပင်လည်ဘူး', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (210, N'MMR005001', N'Sagaing', N'စစ်ကိုင်း', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (211, N'MMR005018', N'Salingyi', N'ဆားလင်းကြီး', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (212, N'MMR005004', N'Shwebo', N'ရွှေဘို', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (213, N'MMR005010', N'Tabayin', N'ဒီပဲယင်း', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (214, N'MMR005030', N'Tamu', N'တမူး', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (215, N'MMR005011', N'Taze', N'တန့်ဆည်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (216, N'MMR005022', N'Tigyaing', N'ထီးချိုင့်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (217, N'MMR005006', N'Wetlet', N'ဝက်လက်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (218, N'MMR005025', N'Wuntho', N'ဝန်းသို', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (219, N'MMR005009', N'Ye-U', N'ရေဦး', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (220, N'MMR005016', N'Yinmarbin', N'ယင်းမာပင်', N'MMR005')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (221, N'MMR016320', N'Ho Tawng (Ho Tao)', N'ဟိုတောင်း', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (222, N'MMR016001', N'Kengtung', N'ကျိုင်းတုံ', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (223, N'MMR016319', N'Mong Hpen', N'မိုင်းဖျန်', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (224, N'MMR016322', N'Mong Kar', N'မိုင်းကာ', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (225, N'MMR016321', N'Mong Pawk', N'မိုင်းပေါက်', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (226, N'MMR016010', N'Monghpyak', N'မိုင်းဖြတ်', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (227, N'MMR016006', N'Monghsat', N'မိုင်းဆတ်', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (228, N'MMR016002', N'Mongkhet', N'မိုင်းခတ်', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (229, N'MMR016005', N'Mongla', N'မိုင်းလား', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (230, N'MMR016007', N'Mongping', N'မိုင်းပျဉ်း', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (231, N'MMR016008', N'Mongton', N'မိုင်းတုံ', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (232, N'MMR016003', N'Mongyang', N'မိုင်းယန်း', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (233, N'MMR016011', N'Mongyawng', N'မိုင်းယောင်း', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (234, N'MMR016323', N'Nam Hpai', N'နမ့်ဖိုင်', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (235, N'MMR016009', N'Tachileik', N'တာချီလိတ်', N'MMR016')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (236, N'MMR015311', N'Aik Chan (Ai'' Chun)', N'အိုက်ချန်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (237, N'MMR015203', N'Chinshwehaw Sub-township (Kokang SAZ)', N'ချင်းရွှေဟော်မြို့နယ်ခွဲ (အထူးဒေသ ၁)', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (238, N'MMR015306', N'Hkun Mar (Hkwin Ma)', N'ခွန်းမား', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (239, N'MMR015021', N'Hopang', N'ဟိုပန်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (240, N'MMR015305', N'Hsawng Hpa (Saun Pha)', N'ဆောင်ဖ', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (241, N'MMR015002', N'Hseni', N'သိန္နီ', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (242, N'MMR015014', N'Hsipaw', N'သီပေါ', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (243, N'MMR015310', N'Ka Lawng Hpar', N'ကလောင်ဖါ', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (244, N'MMR015304', N'Kawng Min Hsang', N'ကောင်မင်ဆန်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (245, N'MMR015023', N'Konkyan', N'ကုန်းကြမ်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (246, N'MMR015201', N'Konkyan (Kokang SAZ)', N'ကုန်းကြမ်း (အထူးဒေသ ၁)', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (247, N'MMR015020', N'Kunlong', N'ကွမ်းလုံ', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (248, N'MMR015011', N'Kutkai', N'ကွတ်ခိုင်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (249, N'MMR015012', N'Kyaukme', N'ကျောက်မဲ', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (250, N'MMR015001', N'Lashio', N'လားရှိုး', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (251, N'MMR015022', N'Laukkaing', N'လောက်ကိုင်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (252, N'MMR015202', N'Laukkaing (Kokang SAZ)', N'လောက်ကိုင် (အထူးဒေသ ၁)', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (253, N'MMR015309', N'Lin Haw', N'လင်ဟော်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (254, N'MMR015307', N'Long Htan', N'လုံထန်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (255, N'MMR015018', N'Mabein', N'မဘိမ်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (256, N'MMR015313', N'Man Man Hseng', N'မန်မန်ဆိုင်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (257, N'MMR015303', N'Man Tun', N'မန်တွန်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (258, N'MMR015019', N'Manton', N'မန်တုံ', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (259, N'MMR015024', N'Matman', N'မက်မန်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (260, N'MMR015008', N'Mongmao', N'မိုင်းမော', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (261, N'MMR015017', N'Mongmit', N'မိုးမိတ်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (262, N'MMR015003', N'Mongyai', N'မိုင်းရယ်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (263, N'MMR015009', N'Muse', N'မူဆယ်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (264, N'MMR015315', N'Nam Hkam Wu', N'နမ်ခမ်းဝူး', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (265, N'MMR015301', N'Nam Tit', N'နမ့် တစ်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (266, N'MMR015010', N'Namhkan', N'နမ့်ခမ်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (267, N'MMR015016', N'Namhsan', N'နမ့်ဆန်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (268, N'MMR015015', N'Namtu', N'နမ္မတူ', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (269, N'MMR015316', N'Nar Kawng', N'နားကောင်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (270, N'MMR015302', N'Nar Wee (Na Wi)', N'နာဝီး', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (271, N'MMR015006', N'Narphan', N'နားဖန်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (272, N'MMR015314', N'Nawng Hkit', N'နောင်ခစ်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (273, N'MMR015013', N'Nawnghkio', N'နောင်ချို', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (274, N'MMR015317', N'Pang Hkam', N'ပန်ခမ့်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (275, N'MMR015318', N'Pang Yang', N'ပန်ယန်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (276, N'MMR015005', N'Pangsang (Panghkam)', N'ပန်ဆန်း (ပန်ခမ်း)', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (277, N'MMR015007', N'Pangwaun', N'ပန်ဝိုင်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (278, N'MMR015004', N'Tangyan', N'တန့်ယန်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (279, N'MMR015308', N'Yawng Lin', N'ယောင်လင်း', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (280, N'MMR015312', N'Yin Pang', N'ရင်ဖန့်', N'MMR015')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (281, N'MMR014003', N'Hopong', N'ဟိုပုံး', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (282, N'MMR014004', N'Hsihseng', N'ဆီဆိုင်', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (283, N'MMR014005', N'Kalaw', N'ကလော', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (284, N'MMR014014', N'Kunhing', N'ကွန်ဟိန်း', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (285, N'MMR014015', N'Kyethi', N'ကျေးသီး', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (286, N'MMR014012', N'Laihka', N'လဲချား', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (287, N'MMR014018', N'Langkho', N'လင်းခေး', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (288, N'MMR014008', N'Lawksawk', N'ရပ်စောက်', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (289, N'MMR014011', N'Loilen', N'လွိုင်လင်', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (290, N'MMR014020', N'Mawkmai', N'မောက်မယ်', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (291, N'MMR014017', N'Monghsu', N'မိုင်းရှူး', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (292, N'MMR014016', N'Mongkaing', N'မိုင်းကိုင်', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (293, N'MMR014019', N'Mongnai', N'မိုးနဲ', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (294, N'MMR014021', N'Mongpan', N'မိုင်းပန်', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (295, N'MMR014013', N'Nansang', N'နမ့်စန်', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (296, N'MMR014002', N'Nyaungshwe', N'ညောင်ရွှေ', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (297, N'MMR014010', N'Pekon', N'ဖယ်ခုံ', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (298, N'MMR014006', N'Pindaya', N'ပင်းတယ', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (299, N'MMR014009', N'Pinlaung', N'ပင်လောင်း', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (300, N'MMR014001', N'Taunggyi', N'တောင်ကြီး', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (301, N'MMR014007', N'Ywangan', N'ရွာငံ', N'MMR014')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (302, N'MMR006010', N'Bokpyin', N'ဘုတ်ပြင်း', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (303, N'MMR006001', N'Dawei', N'ထားဝယ်', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (304, N'MMR006009', N'Kawthoung', N'ကော့သောင်း', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (305, N'MMR006006', N'Kyunsu', N'ကျွန်းစု', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (306, N'MMR006002', N'Launglon', N'လောင်းလုံး', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (307, N'MMR006005', N'Myeik', N'မြိတ်', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (308, N'MMR006007', N'Palaw', N'ပုလော', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (309, N'MMR006008', N'Tanintharyi', N'တနင်္သာရီ', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (310, N'MMR006003', N'Thayetchaung', N'သရက်ချောင်း', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (311, N'MMR006004', N'Yebyu', N'ရေဖြူ', N'MMR006')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (312, N'MMR013037', N'Ahlone', N'အလုံ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (313, N'MMR013044', N'Bahan', N'ဗဟန်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (314, N'MMR013017', N'Botahtaung', N'ဗိုလ်တထောင်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (315, N'MMR013032', N'Cocokyun', N'ကိုကိုးကျွန်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (316, N'MMR013043', N'Dagon', N'ဒဂုံ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (317, N'MMR013020', N'Dagon Myothit (East)', N'ဒဂုံမြို့သစ် (အရှေ့ပိုင်း)', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (318, N'MMR013019', N'Dagon Myothit (North)', N'ဒဂုံမြို့သစ် (မြောက်ပိုင်း)', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (319, N'MMR013021', N'Dagon Myothit (Seikkan)', N'ဒဂုံမြို့သစ် (ဆိပ်ကမ်း)', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (320, N'MMR013018', N'Dagon Myothit (South)', N'ဒဂုံမြို့သစ် (တောင်ပိုင်း)', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (321, N'MMR013030', N'Dala', N'ဒလ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (322, N'MMR013014', N'Dawbon', N'ဒေါပုံ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (323, N'MMR013040', N'Hlaing', N'လှိုင်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (324, N'MMR013008', N'Hlaingtharya', N'လှိုင်သာယာ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (325, N'MMR013004', N'Hlegu', N'လှည်းကူး', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (326, N'MMR013003', N'Hmawbi', N'မှော်ဘီ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (327, N'MMR013006', N'Htantabin', N'ထန်းတပင်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (328, N'MMR013001', N'Insein', N'အင်းစိန်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (329, N'MMR013041', N'Kamaryut', N'ကမာရွတ်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (330, N'MMR013028', N'Kawhmu', N'ကော့မှူး', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (331, N'MMR013026', N'Kayan', N'ခရမ်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (332, N'MMR013029', N'Kungyangon', N'ကွမ်းခြံကုန်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (333, N'MMR013033', N'Kyauktada', N'ကျောက်တံတား', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (334, N'MMR013024', N'Kyauktan', N'ကျောက်တန်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (335, N'MMR013038', N'Kyeemyindaing', N'ကြည့်မြင်တိုင်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (336, N'MMR013035', N'Lanmadaw', N'လမ်းမတော်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (337, N'MMR013036', N'Latha', N'လသာ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (338, N'MMR013042', N'Mayangone', N'မရမ်းကုန်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (339, N'MMR013002', N'Mingaladon', N'မင်္ဂလာဒုံ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (340, N'MMR013022', N'Mingalartaungnyunt', N'မင်္ဂလာတောင်ညွန့်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (341, N'MMR013012', N'North Okkalapa', N'မြောက်ဥက္ကလာပ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (342, N'MMR013034', N'Pabedan', N'ပန်းဘဲတန်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (343, N'MMR013016', N'Pazundaung', N'ပုဇွန်တောင်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (344, N'MMR013039', N'Sanchaung', N'စမ်းချောင်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (345, N'MMR013031', N'Seikgyikanaungto', N'ဆိပ်ကြီး/ခနောင်တို', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (346, N'MMR013045', N'Seikkan', N'ဆိပ်ကမ်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (347, N'MMR013007', N'Shwepyithar', N'ရွှေပြည်သာ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (348, N'MMR013011', N'South Okkalapa', N'တောင်ဥက္ကလာပ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (349, N'MMR013005', N'Taikkyi', N'တိုက်ကြီး', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (350, N'MMR013015', N'Tamwe', N'တာမွေ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (351, N'MMR013013', N'Thaketa', N'သာကေတ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (352, N'MMR013023', N'Thanlyin', N'သန်လျင်', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (353, N'MMR013009', N'Thingangyun', N'သင်္ဃန်းကျွန်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (354, N'MMR013025', N'Thongwa', N'သုံးခွ', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (355, N'MMR013027', N'Twantay', N'တွံတေး', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (356, N'MMR013010', N'Yankin', N'ရန်ကင်း', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (357, N'MMR013046', N'Hlaingtharya (East)', N'လှိုင်သာယာ (အရှေ့ပိုင်း)', N'MMR013')
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (358, N'MMR013047', N'Hlaingtharya (West)', N'လှိုင်သာယာ (အနောက်ပိုင်း)', N'MMR013')
SET IDENTITY_INSERT [dbo].[Townships] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (1, N'User_1', N'09-5.73559e+008', N'Address_1', N'Fire', N'Severe injury accident', N'MMR015008')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (2, N'User_2', N'09-3.77564e+008', N'Address_2', N'Medical', N'Severe injury accident', N'MMR003002')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (3, N'User_3', N'09-8.44637e+008', N'Address_3', N'Medical', N'Severe injury accident', N'MMR016007')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (4, N'User_4', N'09-3.76549e+008', N'Address_4', N'Police', N'Suspicious activity in neighborhood', N'MMR010030')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (5, N'User_5', N'09-2.82642e+008', N'Address_5', N'Medical', N'Severe injury accident', N'MMR013006')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (6, N'User_6', N'09-7.25978e+008', N'Address_6', N'Medical', N'Fire at apartment', N'MMR009017')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (7, N'User_7', N'09-2.12544e+008', N'Address_7', N'Police', N'Severe injury accident', N'MMR007004')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (8, N'User_8', N'09-3.25759e+008', N'Address_8', N'Police', N'Severe injury accident', N'MMR009024')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (9, N'User_9', N'09-6.74806e+008', N'Address_9', N'Fire', N'Suspicious activity in neighborhood', N'MMR003007')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (10, N'User_10', N'09-1.54985e+008', N'Address_10', N'Fire', N'Fire at apartment', N'MMR016005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (11, N'User_11', N'09-4.86799e+008', N'Address_11', N'Police', N'Fire at apartment', N'MMR017007')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (12, N'User_12', N'09-2.02957e+008', N'Address_12', N'Fire', N'Severe injury accident', N'MMR009005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (13, N'User_13', N'09-7.05358e+008', N'Address_13', N'Fire', N'Severe injury accident', N'MMR009005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (14, N'User_14', N'09-5.44591e+008', N'Address_14', N'Fire', N'Suspicious activity in neighborhood', N'MMR015019')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (15, N'User_15', N'09-2.15084e+008', N'Address_15', N'Medical', N'Severe injury accident', N'MMR015303')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (16, N'User_16', N'09-7.37477e+008', N'Address_16', N'Police', N'Severe injury accident', N'MMR017008')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (17, N'User_17', N'09-9.86952e+008', N'Address_17', N'Police', N'Severe injury accident', N'MMR010030')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (18, N'User_18', N'09-7.13543e+008', N'Address_18', N'Fire', N'Suspicious activity in neighborhood', N'MMR012011')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (19, N'User_19', N'09-6.78337e+008', N'Address_19', N'Medical', N'Fire at apartment', N'MMR015313')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (20, N'User_20', N'09-9.85633e+008', N'Address_20', N'Police', N'Severe injury accident', N'MMR009011')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (21, N'User_21', N'09-4.19111e+008', N'Address_21', N'Medical', N'Fire at apartment', N'MMR013005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (22, N'User_22', N'09-3.50303e+008', N'Address_22', N'Medical', N'Severe injury accident', N'MMR009012')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (23, N'User_23', N'09-3.06382e+008', N'Address_23', N'Medical', N'Severe injury accident', N'MMR018005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (24, N'User_24', N'09-3.73541e+008', N'Address_24', N'Medical', N'Fire at apartment', N'MMR013047')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (25, N'User_25', N'09-7.41138e+008', N'Address_25', N'Fire', N'Fire at apartment', N'MMR005030')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (26, N'User_26', N'09-8.07822e+008', N'Address_26', N'Police', N'Suspicious activity in neighborhood', N'MMR014014')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (27, N'User_27', N'09-9.33168e+008', N'Address_27', N'Police', N'Severe injury accident', N'MMR013038')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (28, N'User_28', N'09-5.35291e+008', N'Address_28', N'Fire', N'Severe injury accident', N'MMR011009')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (29, N'User_29', N'09-8.27302e+008', N'Address_29', N'Medical', N'Suspicious activity in neighborhood', N'MMR006002')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (30, N'User_30', N'09-5.92599e+008', N'Address_30', N'Police', N'Severe injury accident', N'MMR015006')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (31, N'User_31', N'09-7.13384e+007', N'Address_31', N'Fire', N'Fire at apartment', N'MMR017019')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (32, N'User_32', N'09-8.43959e+008', N'Address_32', N'Medical', N'Suspicious activity in neighborhood', N'MMR001002')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (33, N'User_33', N'09-4.68839e+007', N'Address_33', N'Medical', N'Fire at apartment', N'MMR017001')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (34, N'User_34', N'09-1.39344e+008', N'Address_34', N'Medical', N'Suspicious activity in neighborhood', N'MMR008009')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (35, N'User_35', N'09-9.20859e+007', N'Address_35', N'Police', N'Fire at apartment', N'MMR017012')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (36, N'User_36', N'09-2.37935e+008', N'Address_36', N'Medical', N'Fire at apartment', N'MMR013044')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (37, N'User_37', N'09-8.6176e+008', N'Address_37', N'Medical', N'Suspicious activity in neighborhood', N'MMR004008')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (38, N'User_38', N'09-3.62895e+007', N'Address_38', N'Fire', N'Severe injury accident', N'MMR001017')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (39, N'User_39', N'09-2.59749e+008', N'Address_39', N'Fire', N'Suspicious activity in neighborhood', N'MMR005036')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (40, N'User_40', N'09-2.37218e+008', N'Address_40', N'Fire', N'Suspicious activity in neighborhood', N'MMR010004')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (41, N'User_41', N'09-5.01321e+008', N'Address_41', N'Medical', N'Severe injury accident', N'MMR001017')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (42, N'User_42', N'09-6.7152e+008', N'Address_42', N'Medical', N'Fire at apartment', N'MMR005034')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (43, N'User_43', N'09-7.00263e+008', N'Address_43', N'Fire', N'Severe injury accident', N'MMR015010')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (44, N'User_44', N'09-7.31708e+008', N'Address_44', N'Fire', N'Severe injury accident', N'MMR004003')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (45, N'User_45', N'09-1.71381e+008', N'Address_45', N'Medical', N'Fire at apartment', N'MMR010017')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (46, N'User_46', N'09-4.37239e+008', N'Address_46', N'Fire', N'Fire at apartment', N'MMR013047')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (47, N'User_47', N'09-3.65446e+008', N'Address_47', N'Fire', N'Suspicious activity in neighborhood', N'MMR018002')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (48, N'User_48', N'09-2.09752e+008', N'Address_48', N'Fire', N'Severe injury accident', N'MMR014010')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (49, N'User_49', N'09-9.49061e+008', N'Address_49', N'Medical', N'Fire at apartment', N'MMR013001')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (50, N'User_50', N'09-5.27169e+008', N'Address_50', N'Police', N'Severe injury accident', N'MMR013045')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (51, N'User_51', N'09-2.39534e+007', N'Address_51', N'Medical', N'Severe injury accident', N'MMR017012')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (52, N'User_52', N'09-7.54846e+008', N'Address_52', N'Medical', N'Fire at apartment', N'MMR010023')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (53, N'User_53', N'09-2.76641e+008', N'Address_53', N'Medical', N'Fire at apartment', N'MMR017008')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (54, N'User_54', N'09-3.1223e+008', N'Address_54', N'Fire', N'Severe injury accident', N'MMR013019')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (55, N'User_55', N'09-2.56924e+008', N'Address_55', N'Medical', N'Fire at apartment', N'MMR007011')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (56, N'User_56', N'09-3.56404e+008', N'Address_56', N'Medical', N'Suspicious activity in neighborhood', N'MMR015010')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (57, N'User_57', N'09-8.61397e+007', N'Address_57', N'Police', N'Severe injury accident', N'MMR015310')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (58, N'User_58', N'09-7.31127e+008', N'Address_58', N'Fire', N'Fire at apartment', N'MMR004002')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (59, N'User_59', N'09-4.87599e+008', N'Address_59', N'Medical', N'Suspicious activity in neighborhood', N'MMR012013')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (60, N'User_60', N'09-8.87407e+008', N'Address_60', N'Medical', N'Severe injury accident', N'MMR001005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (61, N'User_61', N'09-9.77983e+008', N'Address_61', N'Fire', N'Suspicious activity in neighborhood', N'MMR004005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (62, N'User_62', N'09-3.0966e+007', N'Address_62', N'Fire', N'Severe injury accident', N'MMR017021')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (63, N'User_63', N'09-7.45114e+008', N'Address_63', N'Medical', N'Fire at apartment', N'MMR018002')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (64, N'User_64', N'09-6.00234e+008', N'Address_64', N'Fire', N'Severe injury accident', N'MMR001016')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (65, N'User_65', N'09-7.5424e+008', N'Address_65', N'Medical', N'Severe injury accident', N'MMR016323')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (66, N'User_66', N'09-6.06402e+008', N'Address_66', N'Medical', N'Severe injury accident', N'MMR017016')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (67, N'User_67', N'09-2.60576e+008', N'Address_67', N'Medical', N'Suspicious activity in neighborhood', N'MMR012008')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (68, N'User_68', N'09-5.35198e+008', N'Address_68', N'Police', N'Severe injury accident', N'MMR005019')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (69, N'User_69', N'09-5.40221e+008', N'Address_69', N'Fire', N'Fire at apartment', N'MMR005005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (70, N'User_70', N'09-8.69391e+008', N'Address_70', N'Police', N'Severe injury accident', N'MMR015020')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (71, N'User_71', N'09-5.14731e+008', N'Address_71', N'Medical', N'Fire at apartment', N'MMR017016')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (72, N'User_72', N'09-1.16882e+008', N'Address_72', N'Medical', N'Severe injury accident', N'MMR011005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (73, N'User_73', N'09-2.42872e+007', N'Address_73', N'Fire', N'Severe injury accident', N'MMR010009')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (74, N'User_74', N'09-9.70554e+007', N'Address_74', N'Medical', N'Severe injury accident', N'MMR018003')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (75, N'User_75', N'09-8.85662e+008', N'Address_75', N'Police', N'Fire at apartment', N'MMR017022')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (76, N'User_76', N'09-6.70752e+008', N'Address_76', N'Medical', N'Suspicious activity in neighborhood', N'MMR015303')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (77, N'User_77', N'09-8.29628e+008', N'Address_77', N'Medical', N'Severe injury accident', N'MMR013029')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (78, N'User_78', N'09-2.12562e+008', N'Address_78', N'Police', N'Severe injury accident', N'MMR007010')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (79, N'User_79', N'09-5.84173e+008', N'Address_79', N'Fire', N'Suspicious activity in neighborhood', N'MMR002007')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (80, N'User_80', N'09-8.19384e+008', N'Address_80', N'Police', N'Suspicious activity in neighborhood', N'MMR007003')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (81, N'User_81', N'09-6.70487e+007', N'Address_81', N'Police', N'Severe injury accident', N'MMR015003')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (82, N'User_82', N'09-9.94495e+008', N'Address_82', N'Fire', N'Suspicious activity in neighborhood', N'MMR007010')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (83, N'User_83', N'09-6.04238e+008', N'Address_83', N'Fire', N'Severe injury accident', N'MMR005003')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (84, N'User_84', N'09-4.04454e+008', N'Address_84', N'Medical', N'Severe injury accident', N'MMR006008')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (85, N'User_85', N'09-2.01812e+008', N'Address_85', N'Medical', N'Severe injury accident', N'MMR007005')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (86, N'User_86', N'09-4.4346e+008', N'Address_86', N'Medical', N'Suspicious activity in neighborhood', N'MMR005010')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (87, N'User_87', N'09-9.43291e+008', N'Address_87', N'Fire', N'Fire at apartment', N'MMR004007')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (88, N'User_88', N'09-1.30448e+008', N'Address_88', N'Medical', N'Fire at apartment', N'MMR010007')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (89, N'User_89', N'09-7.48799e+008', N'Address_89', N'Medical', N'Severe injury accident', N'MMR013004')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (90, N'User_90', N'09-3.88336e+008', N'Address_90', N'Medical', N'Suspicious activity in neighborhood', N'MMR016322')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (91, N'User_91', N'09-8.50024e+008', N'Address_91', N'Fire', N'Fire at apartment', N'MMR006001')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (92, N'User_92', N'09-9.91503e+008', N'Address_92', N'Medical', N'Severe injury accident', N'MMR017015')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (93, N'User_93', N'09-7.72155e+008', N'Address_93', N'Medical', N'Suspicious activity in neighborhood', N'MMR013008')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (94, N'User_94', N'09-4.51909e+008', N'Address_94', N'Fire', N'Suspicious activity in neighborhood', N'MMR015007')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (95, N'User_95', N'09-4.0142e+008', N'Address_95', N'Medical', N'Severe injury accident', N'MMR017023')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (96, N'User_96', N'09-4.52348e+008', N'Address_96', N'Medical', N'Fire at apartment', N'MMR007012')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (97, N'User_97', N'09-3.86003e+008', N'Address_97', N'Medical', N'Suspicious activity in neighborhood', N'MMR008009')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (98, N'User_98', N'09-3.05861e+008', N'Address_98', N'Fire', N'Severe injury accident', N'MMR005035')
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (99, N'User_99', N'09-1.10614e+008', N'Address_99', N'Fire', N'Fire at apartment', N'MMR010013')
GO
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode]) VALUES (100, N'User_100', N'09-3.81592e+008', N'Address_100', N'Fire', N'Severe injury accident', N'MMR014005')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [idx_ProviderId]    Script Date: 10/30/2024 1:29:18 PM ******/
CREATE NONCLUSTERED INDEX [idx_ProviderId] ON [dbo].[EmergencyRequests]
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_ServiceId]    Script Date: 10/30/2024 1:29:18 PM ******/
CREATE NONCLUSTERED INDEX [idx_ServiceId] ON [dbo].[EmergencyRequests]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_UserId]    Script Date: 10/30/2024 1:29:18 PM ******/
CREATE NONCLUSTERED INDEX [idx_UserId] ON [dbo].[EmergencyRequests]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_ServiceType]    Script Date: 10/30/2024 1:29:18 PM ******/
CREATE NONCLUSTERED INDEX [idx_ServiceType] ON [dbo].[EmergencyServices]
(
	[ServiceType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_PhoneNumber]    Script Date: 10/30/2024 1:29:18 PM ******/
CREATE NONCLUSTERED INDEX [idx_PhoneNumber] ON [dbo].[Users]
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmergencyRequests] ADD  DEFAULT (getdate()) FOR [RequestTime]
GO
USE [master]
GO
ALTER DATABASE [MMEmergencyCall] SET  READ_WRITE 
GO
