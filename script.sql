USE [MMEmergencyCall]
GO
/****** Object:  Table [dbo].[EmergencyRequests]    Script Date: 1/26/2025 11:00:06 PM ******/
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
/****** Object:  Table [dbo].[EmergencyServices]    Script Date: 1/26/2025 11:00:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyServices](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ServiceGroup] [nvarchar](50) NOT NULL,
	[ServiceType] [nvarchar](50) NOT NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Location] [nvarchar](max) NULL,
	[Availability] [char](1) NULL,
	[TownshipCode] [nvarchar](200) NULL,
	[ServiceStatus] [varchar](10) NULL,
	[Lng] [decimal](18, 4) NULL,
	[ltd] [decimal](18, 4) NULL,
 CONSTRAINT [PK__Emergenc__C51BB00A372E00BB] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 1/26/2025 11:00:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[ExpireTime] [datetime] NOT NULL,
	[LogoutTime] [datetime] NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateRegions]    Script Date: 1/26/2025 11:00:07 PM ******/
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
/****** Object:  Table [dbo].[Townships]    Script Date: 1/26/2025 11:00:07 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 1/26/2025 11:00:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[EmergencyType] [nvarchar](50) NULL,
	[EmergencyDetails] [nvarchar](max) NULL,
	[TownshipCode] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](100) NOT NULL,
	[UserStatus] [varchar](11) NULL,
	[IsVerified] [varchar](1) NULL,
	[OTP] [varchar](50) NULL,
 CONSTRAINT [PK__Users__1788CC4C78D5D195] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmergencyRequests] ON 
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (101, 72, 2, 36, CAST(N'2024-10-30T07:10:19.940' AS DateTime), N'Pending', CAST(N'2024-10-30T12:55:19.940' AS DateTime), N'Emergency reported by user_1', N'MMR013038')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (102, 59, 4, 23, CAST(N'2024-10-30T07:39:19.940' AS DateTime), N'Pending', NULL, N'Emergency reported by user_2', N'MMR013044')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (103, 95, 2, 50, CAST(N'2024-10-30T09:18:19.940' AS DateTime), N'Pending', NULL, N'Emergency reported by user_3', N'MMR013016')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (104, 36, 2, 15, CAST(N'2024-10-29T21:13:19.940' AS DateTime), N'Pending', CAST(N'2024-10-30T12:51:19.940' AS DateTime), N'Emergency reported by user_4', N'MMR013030')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (105, 37, 4, 76, CAST(N'2024-10-30T07:26:19.940' AS DateTime), N'Completed', NULL, N'Emergency reported by user_5', N'MMR01301')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (106, 22, 3, 61, CAST(N'2024-10-30T02:49:19.940' AS DateTime), N'Completed', NULL, N'Emergency reported by user_6', N'MMR013031')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (107, 76, 4, 72, CAST(N'2024-10-29T23:37:19.940' AS DateTime), N'Pending', CAST(N'2024-10-30T13:03:19.940' AS DateTime), N'Emergency reported by user_7', N'MMR013032')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (108, 90, 3, 24, CAST(N'2024-10-29T23:30:19.940' AS DateTime), N'Completed', CAST(N'2024-10-30T13:07:19.940' AS DateTime), N'Emergency reported by user_8', N'MMR013029')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (109, 84, 4, 59, CAST(N'2024-10-29T21:26:20.067' AS DateTime), N'Completed', CAST(N'2024-10-30T13:39:20.067' AS DateTime), N'Emergency reported by user_9', N'MMR013046')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (110, 99, 3, 67, CAST(N'2024-10-30T05:56:20.067' AS DateTime), N'Pending', NULL, N'Emergency reported by user_10', N'MMR013026')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (111, 42, 3, 66, CAST(N'2024-10-29T22:16:20.067' AS DateTime), N'Pending', CAST(N'2024-10-30T13:05:20.067' AS DateTime), N'Emergency reported by user_11', N'MMR01301')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (112, 76, 4, 70, CAST(N'2024-10-29T21:30:20.067' AS DateTime), N'Completed', CAST(N'2024-10-30T12:54:20.067' AS DateTime), N'Emergency reported by user_12', N'MMR01301')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (113, 7, 3, 62, CAST(N'2024-10-30T07:38:20.067' AS DateTime), N'Completed', CAST(N'2024-10-30T13:03:20.067' AS DateTime), N'Emergency reported by user_13', N'MMR01301')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (114, 98, 1, 66, CAST(N'2024-10-30T02:12:20.067' AS DateTime), N'Pending', NULL, N'Emergency reported by user_14', N'MMR013019')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (115, 58, 2, 69, CAST(N'2024-10-30T00:21:20.067' AS DateTime), N'Pending', NULL, N'Emergency reported by user_15', N'MMR013038')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (116, 63, 3, 89, CAST(N'2024-10-30T12:40:20.067' AS DateTime), N'Completed', NULL, N'Emergency reported by user_16', N'MMR013013')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (117, 91, 1, 95, CAST(N'2024-10-30T09:49:20.067' AS DateTime), N'Completed', NULL, N'Emergency reported by user_17', N'MMR013023')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (118, 49, 1, 70, CAST(N'2024-10-30T12:33:20.067' AS DateTime), N'Completed', NULL, N'Emergency reported by user_18', N'MMR013026')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (119, 51, 1, 79, CAST(N'2024-10-30T02:37:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_19', N'MMR013029')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (120, 71, 1, 95, CAST(N'2024-10-29T23:13:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_20', N'MMR01306')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (121, 34, 1, 62, CAST(N'2024-10-30T07:19:20.070' AS DateTime), N'Pending', NULL, N'Emergency reported by user_21', N'MMR013013')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (122, 38, 4, 45, CAST(N'2024-10-30T08:40:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_22', N'MMR013044')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (123, 55, 3, 95, CAST(N'2024-10-29T23:05:20.070' AS DateTime), N'Completed', CAST(N'2024-10-30T13:07:20.070' AS DateTime), N'Emergency reported by user_23', N'MMR013029')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (124, 55, 1, 86, CAST(N'2024-10-30T01:30:20.070' AS DateTime), N'Pending', NULL, N'Emergency reported by user_24', N'MMR01307')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (125, 85, 4, 47, CAST(N'2024-10-30T05:18:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T12:49:20.070' AS DateTime), N'Emergency reported by user_25', N'MMR013018')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (126, 33, 4, 100, CAST(N'2024-10-29T22:19:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T13:31:20.070' AS DateTime), N'Emergency reported by user_26', N'MMR01308')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (127, 10, 1, 100, CAST(N'2024-10-30T05:50:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T13:13:20.070' AS DateTime), N'Emergency reported by user_27', N'MMR013031')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (128, 41, 1, 73, CAST(N'2024-10-30T06:39:20.070' AS DateTime), N'Pending', NULL, N'Emergency reported by user_28', N'MMR01304')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (129, 75, 3, 94, CAST(N'2024-10-30T10:53:20.070' AS DateTime), N'Completed', CAST(N'2024-10-30T12:55:20.070' AS DateTime), N'Emergency reported by user_29', N'MMR013014')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (130, 27, 2, 93, CAST(N'2024-10-30T05:24:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_30', N'MMR013029')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (131, 56, 2, 61, CAST(N'2024-10-30T06:32:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T13:24:20.070' AS DateTime), N'Emergency reported by user_31', N'MMR013028')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (132, 61, 2, 28, CAST(N'2024-10-30T01:40:20.070' AS DateTime), N'Pending', NULL, N'Emergency reported by user_32', N'MMR013020')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (133, 4, 1, 100, CAST(N'2024-10-30T08:33:20.070' AS DateTime), N'Pending', CAST(N'2024-10-30T13:15:20.070' AS DateTime), N'Emergency reported by user_33', N'MMR01306')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (134, 34, 2, 48, CAST(N'2024-10-30T02:03:20.070' AS DateTime), N'Completed', NULL, N'Emergency reported by user_34', N'MMR013041')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (135, 100, 1, 48, CAST(N'2024-10-30T04:55:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_35', N'MMR013027')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (136, 5, 4, 9, CAST(N'2024-10-30T01:27:20.073' AS DateTime), N'Pending', NULL, N'Emergency reported by user_36', N'MMR013025')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (137, 88, 1, 90, CAST(N'2024-10-29T21:38:20.073' AS DateTime), N'Pending', CAST(N'2024-10-30T13:39:20.073' AS DateTime), N'Emergency reported by user_37', N'MMR01304')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (138, 4, 4, 82, CAST(N'2024-10-30T05:25:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_38', N'MMR013028')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (139, 9, 3, 59, CAST(N'2024-10-30T11:27:20.073' AS DateTime), N'Completed', CAST(N'2024-10-30T13:14:20.073' AS DateTime), N'Emergency reported by user_39', N'MMR013022')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (140, 53, 1, 67, CAST(N'2024-10-30T05:33:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_40', N'MMR013046')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (141, 6, 2, 86, CAST(N'2024-10-29T22:09:20.073' AS DateTime), N'Pending', CAST(N'2024-10-30T13:25:20.073' AS DateTime), N'Emergency reported by user_41', N'MMR013013')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (142, 5, 2, 74, CAST(N'2024-10-30T02:27:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_42', N'MMR013011')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (143, 25, 2, 98, CAST(N'2024-10-29T22:25:20.073' AS DateTime), N'Completed', CAST(N'2024-10-30T13:32:20.073' AS DateTime), N'Emergency reported by user_43', N'MMR013011')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (144, 77, 4, 29, CAST(N'2024-10-30T11:50:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_44', N'MMR013022')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (145, 76, 2, 38, CAST(N'2024-10-29T20:19:20.073' AS DateTime), N'Completed', NULL, N'Emergency reported by user_45', N'MMR013031')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (146, 91, 2, 29, CAST(N'2024-10-30T01:23:20.073' AS DateTime), N'Pending', NULL, N'Emergency reported by user_46', N'MMR013042')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (147, 34, 3, 71, CAST(N'2024-10-30T10:57:20.073' AS DateTime), N'Pending', CAST(N'2024-10-30T12:54:20.073' AS DateTime), N'Emergency reported by user_47', N'MMR01302')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (148, 13, 1, 65, CAST(N'2024-10-30T00:45:20.077' AS DateTime), N'Completed', CAST(N'2024-10-30T12:50:20.077' AS DateTime), N'Emergency reported by user_48', N'MMR013021')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (149, 68, 1, 50, CAST(N'2024-10-30T06:40:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T13:34:20.077' AS DateTime), N'Emergency reported by user_49', N'MMR013012')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (150, 72, 1, 95, CAST(N'2024-10-30T09:03:20.077' AS DateTime), N'Completed', CAST(N'2024-10-30T13:20:20.077' AS DateTime), N'Emergency reported by user_50', N'MMR013037')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (151, 37, 2, 21, CAST(N'2024-10-30T04:35:20.077' AS DateTime), N'Completed', NULL, N'Emergency reported by user_51', N'MMR013046')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (152, 67, 3, 96, CAST(N'2024-10-30T10:17:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T13:06:20.077' AS DateTime), N'Emergency reported by user_52', N'MMR01308')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (153, 28, 3, 77, CAST(N'2024-10-30T11:54:20.077' AS DateTime), N'Pending', NULL, N'Emergency reported by user_53', N'MMR013024')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (154, 95, 3, 80, CAST(N'2024-10-30T11:59:20.077' AS DateTime), N'Completed', NULL, N'Emergency reported by user_54', N'MMR01300')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (155, 45, 1, 82, CAST(N'2024-10-30T10:08:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T13:02:20.077' AS DateTime), N'Emergency reported by user_55', N'MMR013028')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (156, 47, 3, 23, CAST(N'2024-10-30T08:35:20.077' AS DateTime), N'Completed', NULL, N'Emergency reported by user_56', N'MMR013030')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (157, 22, 1, 29, CAST(N'2024-10-29T21:11:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T12:49:20.077' AS DateTime), N'Emergency reported by user_57', N'MMR013019')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (158, 37, 4, 82, CAST(N'2024-10-30T04:06:20.077' AS DateTime), N'Completed', CAST(N'2024-10-30T13:05:20.077' AS DateTime), N'Emergency reported by user_58', N'MMR01308')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (159, 30, 4, 76, CAST(N'2024-10-30T08:23:20.077' AS DateTime), N'Pending', CAST(N'2024-10-30T13:45:20.077' AS DateTime), N'Emergency reported by user_59', N'MMR013037')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (160, 89, 4, 67, CAST(N'2024-10-30T01:48:20.077' AS DateTime), N'Pending', NULL, N'Emergency reported by user_60', N'MMR01303')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (161, 61, 1, 39, CAST(N'2024-10-30T07:58:20.077' AS DateTime), N'Pending', NULL, N'Emergency reported by user_61', N'MMR013033')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (162, 35, 1, 78, CAST(N'2024-10-29T23:36:20.077' AS DateTime), N'Pending', NULL, N'Emergency reported by user_62', N'MMR013013')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (163, 65, 4, 22, CAST(N'2024-10-29T23:45:20.077' AS DateTime), N'Completed', NULL, N'Emergency reported by user_63', N'MMR013011')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (164, 23, 1, 15, CAST(N'2024-10-30T10:04:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:14:20.080' AS DateTime), N'Emergency reported by user_64', N'MMR013026')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (165, 90, 2, 74, CAST(N'2024-10-29T20:12:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_65', N'MMR01300')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (166, 90, 4, 84, CAST(N'2024-10-29T22:44:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:33:20.080' AS DateTime), N'Emergency reported by user_66', N'MMR013036')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (167, 13, 1, 49, CAST(N'2024-10-30T07:12:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_67', N'MMR013024')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (168, 76, 1, 32, CAST(N'2024-10-30T00:13:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:07:20.080' AS DateTime), N'Emergency reported by user_68', N'MMR013023')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (169, 92, 1, 17, CAST(N'2024-10-30T10:32:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_69', N'MMR013038')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (170, 72, 1, 47, CAST(N'2024-10-29T22:39:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:11:20.080' AS DateTime), N'Emergency reported by user_70', N'MMR01309')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (171, 34, 1, 74, CAST(N'2024-10-29T20:37:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:35:20.080' AS DateTime), N'Emergency reported by user_71', N'MMR013014')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (172, 43, 3, 70, CAST(N'2024-10-29T22:47:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:26:20.080' AS DateTime), N'Emergency reported by user_72', N'MMR013013')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (173, 55, 1, 63, CAST(N'2024-10-30T01:44:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:33:20.080' AS DateTime), N'Emergency reported by user_73', N'MMR013016')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (174, 98, 1, 2, CAST(N'2024-10-29T21:00:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:16:20.080' AS DateTime), N'Emergency reported by user_74', N'MMR013038')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (175, 70, 3, 42, CAST(N'2024-10-30T10:00:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:36:20.080' AS DateTime), N'Emergency reported by user_75', N'MMR013014')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (176, 3, 4, 73, CAST(N'2024-10-29T21:12:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_76', N'MMR013041')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (177, 73, 2, 76, CAST(N'2024-10-30T00:15:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_77', N'MMR01300')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (178, 28, 1, 69, CAST(N'2024-10-29T21:30:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_78', N'MMR013040')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (179, 59, 3, 57, CAST(N'2024-10-30T12:18:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_79', N'MMR013041')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (180, 8, 1, 26, CAST(N'2024-10-30T01:04:20.080' AS DateTime), N'Completed', CAST(N'2024-10-30T13:36:20.080' AS DateTime), N'Emergency reported by user_80', N'MMR013038')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (181, 65, 3, 79, CAST(N'2024-10-30T12:22:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_81', N'MMR013039')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (182, 47, 3, 9, CAST(N'2024-10-29T23:27:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:02:20.080' AS DateTime), N'Emergency reported by user_82', N'MMR013026')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (183, 89, 4, 5, CAST(N'2024-10-30T11:40:20.080' AS DateTime), N'Completed', NULL, N'Emergency reported by user_83', N'MMR013035')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (184, 16, 2, 31, CAST(N'2024-10-30T07:10:20.080' AS DateTime), N'Pending', NULL, N'Emergency reported by user_84', N'MMR013029')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (185, 25, 2, 88, CAST(N'2024-10-30T07:35:20.080' AS DateTime), N'Pending', CAST(N'2024-10-30T13:08:20.080' AS DateTime), N'Emergency reported by user_85', N'MMR013022')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (186, 86, 4, 17, CAST(N'2024-10-30T08:17:20.083' AS DateTime), N'Pending', CAST(N'2024-10-30T13:36:20.083' AS DateTime), N'Emergency reported by user_86', N'MMR013044')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (187, 6, 4, 47, CAST(N'2024-10-30T07:04:20.083' AS DateTime), N'Completed', NULL, N'Emergency reported by user_87', N'MMR013044')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (188, 32, 2, 19, CAST(N'2024-10-30T09:34:20.083' AS DateTime), N'Pending', NULL, N'Emergency reported by user_88', N'MMR013016')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (189, 11, 3, 52, CAST(N'2024-10-30T07:15:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:47:20.083' AS DateTime), N'Emergency reported by user_89', N'MMR01300')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (190, 55, 1, 83, CAST(N'2024-10-30T02:25:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:32:20.083' AS DateTime), N'Emergency reported by user_90', N'MMR013046')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (191, 14, 3, 50, CAST(N'2024-10-30T08:38:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:45:20.083' AS DateTime), N'Emergency reported by user_91', N'MMR01303')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (192, 60, 2, 65, CAST(N'2024-10-30T05:48:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:35:20.083' AS DateTime), N'Emergency reported by user_92', N'MMR013018')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (193, 87, 3, 29, CAST(N'2024-10-30T09:32:20.083' AS DateTime), N'Pending', CAST(N'2024-10-30T13:15:20.083' AS DateTime), N'Emergency reported by user_93', N'MMR013033')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (194, 81, 1, 83, CAST(N'2024-10-29T23:01:20.083' AS DateTime), N'Pending', NULL, N'Emergency reported by user_94', N'MMR013012')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (195, 16, 3, 76, CAST(N'2024-10-30T01:20:20.083' AS DateTime), N'Completed', CAST(N'2024-10-30T13:46:20.083' AS DateTime), N'Emergency reported by user_95', N'MMR013036')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (196, 34, 3, 26, CAST(N'2024-10-30T04:51:20.083' AS DateTime), N'Pending', CAST(N'2024-10-30T13:30:20.083' AS DateTime), N'Emergency reported by user_96', N'MMR013016')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (197, 61, 2, 4, CAST(N'2024-10-30T00:48:20.083' AS DateTime), N'Completed', NULL, N'Emergency reported by user_97', N'MMR013020')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (198, 19, 3, 15, CAST(N'2024-10-29T21:22:20.083' AS DateTime), N'Completed', NULL, N'Emergency reported by user_98', N'MMR013032')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (199, 49, 4, 99, CAST(N'2024-10-29T23:55:20.083' AS DateTime), N'Completed', NULL, N'Emergency reported by user_99', N'MMR013046')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (200, 62, 4, 20, CAST(N'2024-10-29T21:23:20.083' AS DateTime), N'Pending', CAST(N'2024-10-30T13:37:20.083' AS DateTime), N'Emergency reported by user_100', N'MMR013022')
GO
INSERT [dbo].[EmergencyRequests] ([RequestId], [UserId], [ServiceId], [ProviderId], [RequestTime], [Status], [ResponseTime], [Notes], [TownshipCode]) VALUES (201, 11, 1, 12451, CAST(N'2024-11-15T17:54:36.973' AS DateTime), N'Open', CAST(N'2024-11-15T17:54:36.973' AS DateTime), N'Testing', N'MMR013038')
GO
SET IDENTITY_INSERT [dbo].[EmergencyRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[EmergencyServices] ON 
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (1, 1, N'EmergencyServices', N'Rescue', N'Rescue_Service_1', N'09-5.03254e+008', N'Location_1', N'Y', N'MMR017001', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (2, 1, N'EmergencyServices', N'Rescue', N'Rescue_Service_2', N'09-7.7252e+008', N'Location_2', N'N', N'MMR013043', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (3, 1, N'EmergencyServices', N'Fire', N'Fire_Service_3', N'09-9.92677e+006', N'Location_3', N'N', N'MMR015018', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (4, 1, N'EmergencyServices', N'Medical', N'Medical_Service_4', N'09-5.29952e+008', N'Location_4', N'N', N'MMR015304', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (5, 1, N'EmergencyServices', N'Police', N'Police_Service_5', N'09-1.38093e+008', N'Location_5', N'Y', N'MMR016001', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (6, 1, N'EmergencyServices', N'Fire', N'Fire_Service_6', N'09-8.37415e+008', N'Location_6', N'Y', N'MMR015318', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (7, 1, N'EmergencyServices', N'Medical', N'Medical_Service_7', N'09-3.28779e+008', N'Location_7', N'N', N'MMR017005', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (8, 1, N'EmergencyServices', N'Rescue', N'Rescue_Service_8', N'09-5.70761e+008', N'Location_8', N'N', N'MMR015018', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (9, 1, N'EmergencyServices', N'Rescue', N'Rescue_Service_9', N'09-4.47579e+008', N'Location_9', N'Y', N'MMR017025', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (10, 1, N'EmergencyServices', N'Rescue', N'Rescue_Service_10', N'09-8.28774e+008', N'Location_10', N'Y', N'MMR001012', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (11, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_11', N'09-1.28477e+008', N'Location_11', N'Y', N'MMR006005', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (12, 2, N'EmergencyServices', N'Fire', N'Fire_Service_12', N'09-5.96933e+008', N'Location_12', N'Y', N'MMR015312', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (13, 2, N'EmergencyServices', N'Fire', N'Fire_Service_13', N'09-2.5951e+008', N'Location_13', N'Y', N'MMR012007', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (14, 2, N'EmergencyServices', N'Police', N'Police_Service_14', N'09-9.42654e+008', N'Location_14', N'N', N'MMR013034', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (15, 2, N'EmergencyServices', N'Fire', N'Fire_Service_15', N'09-3.93801e+008', N'Location_15', N'N', N'MMR011001', N'Pending', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (16, 2, N'EmergencyServices', N'Fire', N'Fire_Service_16', N'09-1.69967e+008', N'Location_16', N'N', N'MMR013012', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (17, 2, N'EmergencyServices', N'Police', N'Police_Service_17', N'09-9.54991e+008', N'Location_17', N'N', N'MMR005028', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (18, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_18', N'09-8.20493e+008', N'Location_18', N'N', N'MMR013034', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (19, 2, N'EmergencyServices', N'Fire', N'Fire_Service_19', N'09-7.19643e+006', N'Location_19', N'Y', N'MMR014009', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (20, 2, N'EmergencyServices', N'Medical', N'Medical_Service_20', N'09-1.88888e+008', N'Location_20', N'Y', N'MMR009001', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (21, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_21', N'09-1.04267e+007', N'Location_21', N'Y', N'MMR013017', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (22, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_22', N'09-8.0869e+008', N'Location_22', N'Y', N'MMR013009', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (23, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_23', N'09-3.97712e+008', N'Location_23', N'Y', N'MMR013010', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (24, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_24', N'09-1.73586e+008', N'Location_24', N'Y', N'MMR005036', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (25, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_25', N'09-3.59222e+007', N'Location_25', N'Y', N'MMR016003', N'Pending', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (26, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_26', N'09-2.79983e+008', N'Location_26', N'N', N'MMR010010', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (27, 2, N'EmergencyServices', N'Police', N'Police_Service_27', N'09-2.01653e+008', N'Location_27', N'N', N'MMR017007', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (28, 2, N'EmergencyServices', N'Police', N'Police_Service_28', N'09-8.9828e+008', N'Location_28', N'N', N'MMR007008', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (29, 2, N'EmergencyServices', N'Fire', N'Fire_Service_29', N'09-7.28609e+008', N'Location_29', N'Y', N'MMR014019', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (30, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_30', N'09-1.05603e+008', N'Location_30', N'N', N'MMR012006', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (31, 2, N'EmergencyServices', N'Medical', N'Medical_Service_31', N'09-1.90632e+008', N'Location_31', N'Y', N'MMR009021', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (32, 2, N'EmergencyServices', N'Fire', N'Fire_Service_32', N'09-2.41575e+008', N'Location_32', N'N', N'MMR005034', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (33, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_33', N'09-2.09367e+008', N'Location_33', N'N', N'MMR014004', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (34, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_34', N'09-6.76365e+008', N'Location_34', N'Y', N'MMR015303', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (35, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_35', N'09-2.02086e+008', N'Location_35', N'Y', N'MMR014019', N'Pending', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (36, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_36', N'09-7.87902e+008', N'Location_36', N'N', N'MMR017016', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (37, 2, N'EmergencyServices', N'Fire', N'Fire_Service_37', N'09-9.48699e+008', N'Location_37', N'N', N'MMR013011', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (38, 2, N'EmergencyServices', N'Police', N'Police_Service_38', N'09-3.7883e+008', N'Location_38', N'N', N'MMR013040', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (39, 2, N'EmergencyServices', N'Police', N'Police_Service_39', N'09-5.3626e+008', N'Location_39', N'Y', N'MMR001015', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (40, 2, N'EmergencyServices', N'Police', N'Police_Service_40', N'09-2.43581e+008', N'Location_40', N'N', N'MMR009013', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (41, 2, N'EmergencyServices', N'Police', N'Police_Service_41', N'09-8.16064e+008', N'Location_41', N'N', N'MMR009009', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (42, 2, N'EmergencyServices', N'Police', N'Police_Service_42', N'09-8.25927e+008', N'Location_42', N'Y', N'MMR016323', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (43, 2, N'EmergencyServices', N'Police', N'Police_Service_43', N'09-7.06962e+008', N'Location_43', N'Y', N'MMR014016', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (44, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_44', N'09-3.82132e+008', N'Location_44', N'N', N'MMR017004', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (45, 2, N'EmergencyServices', N'Police', N'Police_Service_45', N'09-6.75145e+008', N'Location_45', N'Y', N'MMR017012', N'Pending', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (46, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_46', N'09-5.55884e+008', N'Location_46', N'N', N'MMR002005', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (47, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_47', N'09-4.36041e+008', N'Location_47', N'Y', N'MMR012004', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (48, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_48', N'09-8.98564e+008', N'Location_48', N'N', N'MMR010001', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (49, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_49', N'09-3.40066e+008', N'Location_49', N'Y', N'MMR012015', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (50, 2, N'EmergencyServices', N'Police', N'Police_Service_50', N'09-5.14996e+007', N'Location_50', N'N', N'MMR013018', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (51, 2, N'EmergencyServices', N'Fire', N'Fire_Service_51', N'09-3.0895e+008', N'Location_51', N'N', N'MMR015201', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (52, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_52', N'09-7.10211e+008', N'Location_52', N'N', N'MMR011001', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (53, 2, N'EmergencyServices', N'Fire', N'Fire_Service_53', N'09-4.80699e+008', N'Location_53', N'N', N'MMR016011', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (54, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_54', N'09-2.94186e+008', N'Location_54', N'Y', N'MMR011004', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (55, 2, N'EmergencyServices', N'Medical', N'Medical_Service_55', N'09-2.71161e+008', N'Location_55', N'Y', N'MMR010020', N'Pending', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (56, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_56', N'09-4.31741e+008', N'Location_56', N'N', N'MMR003004', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (57, 2, N'EmergencyServices', N'Police', N'Police_Service_57', N'09-2.51952e+008', N'Location_57', N'N', N'MMR013011', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (58, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_58', N'09-8.42109e+008', N'Location_58', N'Y', N'MMR015315', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (59, 2, N'EmergencyServices', N'Police', N'Police_Service_59', N'09-4.75713e+008', N'Location_59', N'N', N'MMR005034', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (60, 2, N'EmergencyServices', N'Medical', N'Medical_Service_60', N'09-1.12247e+008', N'Location_60', N'N', N'MMR010014', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (61, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_61', N'09-8.14341e+008', N'Location_61', N'Y', N'MMR012014', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (62, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_62', N'09-7.40644e+008', N'Location_62', N'N', N'MMR005015', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (63, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_63', N'09-7.16415e+008', N'Location_63', N'N', N'MMR008007', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (64, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_64', N'09-3.5994e+008', N'Location_64', N'N', N'MMR007010', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (65, 2, N'EmergencyServices', N'Police', N'Police_Service_65', N'09-5.84594e+008', N'Location_65', N'Y', N'MMR005001', N'Pending', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (66, 2, N'EmergencyServices', N'Fire', N'Fire_Service_66', N'09-3.03951e+008', N'Location_66', N'N', N'MMR014010', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (67, 2, N'EmergencyServices', N'Fire', N'Fire_Service_67', N'09-4.52392e+008', N'Location_67', N'N', N'MMR007004', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (68, 2, N'EmergencyServices', N'Fire', N'Fire_Service_68', N'09-3.17613e+008', N'Location_68', N'N', N'MMR010011', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (69, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_69', N'09-7.38845e+008', N'Location_69', N'Y', N'MMR005012', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (70, 2, N'EmergencyServices', N'Fire', N'Fire_Service_70', N'09-9.85071e+008', N'Location_70', N'N', N'MMR005025', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (71, 2, N'EmergencyServices', N'Rescue', N'Rescue_Service_71', N'09-6.302e+008', N'Location_71', N'N', N'MMR001016', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (72, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_72', N'09-8.14323e+008', N'Location_72', N'N', N'MMR001007', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (73, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_73', N'09-4.64877e+008', N'Location_73', N'N', N'MMR010004', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (74, 2, N'EmergencyServices', N'Police', N'Police_Service_74', N'09-7.48429e+008', N'Location_74', N'N', N'MMR017026', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (75, 2, N'EmergencyServices', N'Fire', N'Fire_Service_75', N'09-6.02517e+008', N'Location_75', N'N', N'MMR005030', N'Pending', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (76, 2, N'EmergencyServices', N'Medical', N'Medical_Service_76', N'09-7.91475e+008', N'Location_76', N'N', N'MMR005014', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (77, 2, N'EmergencyServices', N'Police', N'Police_Service_77', N'09-4.54169e+008', N'Location_77', N'N', N'MMR008003', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (78, 2, N'EmergencyServices', N'Police', N'Police_Service_78', N'09-8.06139e+008', N'Location_78', N'Y', N'MMR010008', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (79, 2, N'EmergencyServices', N'Fire', N'Fire_Service_79', N'09-4.11689e+008', N'Location_79', N'Y', N'MMR004003', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (80, 2, N'EmergencyServices', N'Fire', N'Fire_Service_80', N'09-8.20761e+008', N'Location_80', N'Y', N'MMR002001', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (81, 2, N'EmergencyServices', N'Fire', N'Fire_Service_81', N'09-7.35274e+008', N'Location_81', N'Y', N'MMR013029', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (82, 2, N'EmergencyServices', N'Fire', N'Fire_Service_82', N'09-5.58644e+008', N'Location_82', N'Y', N'MMR005006', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (83, 2, N'EmergencyServices', N'Medical', N'Medical_Service_83', N'09-2.43022e+008', N'Location_83', N'Y', N'MMR005026', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (84, 2, N'EmergencyServices', N'Medical', N'Medical_Service_84', N'09-6.91551e+008', N'Location_84', N'Y', N'MMR010023', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (85, 2, N'EmergencyServices', N'Medical', N'Medical_Service_85', N'09-9.938e+008', N'Location_85', N'Y', N'MMR013024', N'Pending', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (86, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_86', N'09-7.99838e+008', N'Location_86', N'Y', N'MMR015203', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (87, 2, N'EmergencyServices', N'Fire', N'Fire_Service_87', N'09-9.45172e+008', N'Location_87', N'Y', N'MMR015310', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (88, 2, N'EmergencyServices', N'Fire', N'Fire_Service_88', N'09-1.52999e+008', N'Location_88', N'N', N'MMR005005', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (89, 2, N'EmergencyServices', N'Medical', N'Medical_Service_89', N'09-9.7737e+008', N'Location_89', N'N', N'MMR005022', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (90, 2, N'EmergencyServices', N'Police', N'Police_Service_90', N'09-8.38796e+008', N'Location_90', N'Y', N'MMR001004', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (91, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_91', N'09-8.88966e+008', N'Location_91', N'Y', N'MMR013042', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (92, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_92', N'09-7.33466e+008', N'Location_92', N'N', N'MMR007005', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (93, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_93', N'09-5.29805e+008', N'Location_93', N'Y', N'MMR017021', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (94, 2, N'EmergencyServices', N'Police', N'Police_Service_94', N'09-3.63033e+008', N'Location_94', N'Y', N'MMR008012', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (95, 2, N'EmergencyServices', N'Fire', N'Fire_Service_95', N'09-6.09795e+008', N'Location_95', N'N', N'MMR014001', N'Pending', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (96, 2, N'EmergencyServices', N'Ambulance', N'Ambulance_Service_96', N'09-9.3826e+008', N'Location_96', N'N', N'MMR014013', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (97, 2, N'EmergencyServices', N'Medical', N'Medical_Service_97', N'09-9.99265e+008', N'Location_97', N'N', N'MMR011001', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (98, 2, N'EmergencyServices', N'Police', N'Police_Service_98', N'09-6.20145e+008', N'Location_98', N'Y', N'MMR014020', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (99, 2, N'EmergencyServices', N'Medical', N'Medical_Service_99', N'09-6.21443e+008', N'Location_99', N'N', N'MMR015007', N'Approved', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (100, 2, N'EmergencyServices', N'Police', N'Police_Service_100', N'09-4.98342e+008', N'Location_100', N'Y', N'MMR014018', N'Rejected', NULL, NULL)
GO
INSERT [dbo].[EmergencyServices] ([ServiceId], [UserId], [ServiceGroup], [ServiceType], [ServiceName], [PhoneNumber], [Location], [Availability], [TownshipCode], [ServiceStatus], [Lng], [ltd]) VALUES (101, 101, N'EmergencyServices', N'Rescue', N'Rescue_Service_1', N'09964557349', N'Yangon', N'Y', N'MMR017001', N'Deleted', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[EmergencyServices] OFF
GO
SET IDENTITY_INSERT [dbo].[StateRegions] ON 
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (1, N'MMR001', N'Kachin', N'ကချင်ပြည်နယ်')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (2, N'MMR002', N'Kayah', N'ကယားပြည်နယ်')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (3, N'MMR003', N'Kayin', N'ကရင်ပြည်နယ်')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (4, N'MMR004', N'Chin', N'ချင်းပြည်နယ်')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (5, N'MMR005', N'Sagaing', N'စစ်ကိုင်းတိုင်းဒေသကြီး')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (6, N'MMR006', N'Tanintharyi', N'တနင်္သာရီတိုင်းဒေသကြီး')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (7, N'MMR007', N'Bago (East)', N'ပဲခူးတိုင်းဒေသကြီး (အရှေ့)')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (8, N'MMR008', N'Bago (West)', N'ပဲခူးတိုင်းဒေသကြီး (အနောက်)')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (9, N'MMR009', N'Magway', N'မကွေးတိုင်းဒေသကြီး')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (10, N'MMR010', N'Mandalay', N'မန္တလေးတိုင်းဒေသကြီး')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (11, N'MMR011', N'Mon', N'မွန်ပြည်နယ်')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (12, N'MMR012', N'Rakhine', N'ရခိုင်ပြည်နယ်')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (13, N'MMR013', N'Yangon', N'ရန်ကုန်တိုင်းဒေသကြီး')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (14, N'MMR014', N'Shan (South)', N'ရှမ်းပြည်နယ် (တောင်)')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (15, N'MMR015', N'Shan (North)', N'ရှမ်းပြည်နယ် (မြောက်)')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (16, N'MMR016', N'Shan (East)', N'ရှမ်းပြည်နယ် (အရှေ့)')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (17, N'MMR017', N'Ayeyarwady', N'ဧရာဝတီတိုင်းဒေသကြီး')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (18, N'MMR018', N'Nay Pyi Taw', N'နေပြည်တော်')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (19, N'MMR111', N'Bago', N'ပဲခူးတိုင်းဒေသကြီး')
GO
INSERT [dbo].[StateRegions] ([StateRegionId], [StateRegionCode], [StateRegionNameEn], [StateRegionNameMm]) VALUES (20, N'MMR222', N'Shan', N'ရှမ်းပြည်နယ်')
GO
SET IDENTITY_INSERT [dbo].[StateRegions] OFF
GO
SET IDENTITY_INSERT [dbo].[Townships] ON 
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (1, N'MMR017024', N'Bogale', N'ဘိုကလေး', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (2, N'MMR017022', N'Danubyu', N'ဓနုဖြူ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (3, N'MMR017026', N'Dedaye', N'ဒေးဒရဲ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (4, N'MMR017015', N'Einme', N'အိမ်မဲ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (5, N'MMR017008', N'Hinthada', N'ဟင်္သာတ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (6, N'MMR017013', N'Ingapu', N'အင်္ဂပူ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (7, N'MMR017002', N'Kangyidaunt', N'ကန်ကြီးထောင့်', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (8, N'MMR017025', N'Kyaiklat', N'ကျိုက်လတ်', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (9, N'MMR017012', N'Kyangin', N'ကြံခင်း', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (10, N'MMR017007', N'Kyaunggon', N'ကျောင်းကုန်း', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (11, N'MMR017005', N'Kyonpyaw', N'ကျုံပျော်', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (12, N'MMR017016', N'Labutta', N'လပွတ္တာ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (13, N'MMR017010', N'Lemyethna', N'လေးမျက်နှာ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (14, N'MMR017019', N'Maubin', N'မအူပင်', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (15, N'MMR017018', N'Mawlamyinegyun', N'မော်လမြိုင်ကျွန်း', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (16, N'MMR017011', N'Myanaung', N'မြန်အောင်', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (17, N'MMR017014', N'Myaungmya', N'မြောင်းမြ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (18, N'MMR017004', N'Ngapudaw', N'ငပုတော', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (19, N'MMR017021', N'Nyaungdon', N'ညောင်တုန်း', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (20, N'MMR017020', N'Pantanaw', N'ပန်းတနော်', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (21, N'MMR017001', N'Pathein', N'ပုသိမ်', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (22, N'MMR017023', N'Pyapon', N'ဖျာပုံ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (23, N'MMR017003', N'Thabaung', N'သာပေါင်း', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (24, N'MMR017017', N'Wakema', N'ဝါးခယ်မ', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (25, N'MMR017006', N'Yegyi', N'ရေကြည်', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (26, N'MMR017009', N'Zalun', N'ဇလွန်', N'MMR017')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (27, N'MMR007001', N'Bago', N'ပဲခူး', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (28, N'MMR007007', N'Daik-U', N'ဒိုက်ဦး', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (29, N'MMR007014', N'Htantabin', N'ထန်းတပင်', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (30, N'MMR007003', N'Kawa', N'ကဝ', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (31, N'MMR007011', N'Kyaukkyi', N'ကျောက်ကြီး', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (32, N'MMR007006', N'Kyauktaga', N'ကျောက်တံခါး', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (33, N'MMR007005', N'Nyaunglebin', N'ညောင်လေးပင်', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (34, N'MMR007013', N'Oktwin', N'အုတ်တွင်း', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (35, N'MMR007012', N'Phyu', N'ဖြူး', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (36, N'MMR007008', N'Shwegyin', N'ရွှေကျင်', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (37, N'MMR007009', N'Taungoo', N'တောင်ငူ', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (38, N'MMR007002', N'Thanatpin', N'သနပ်ပင်', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (39, N'MMR007004', N'Waw', N'ဝေါ', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (40, N'MMR007010', N'Yedashe', N'ရေတာရှည်', N'MMR007')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (41, N'MMR008014', N'Gyobingauk', N'ကြို့ပင်ကောက်', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (42, N'MMR008008', N'Letpadan', N'လက်ပံတန်း', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (43, N'MMR008009', N'Minhla', N'မင်းလှ', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (44, N'MMR008013', N'Monyo', N'မိုးညို', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (45, N'MMR008012', N'Nattalin', N'နတ်တလင်း', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (46, N'MMR008010', N'Okpho', N'အုတ်ဖို', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (47, N'MMR008003', N'Padaung', N'ပန်းတောင်း', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (48, N'MMR008002', N'Paukkhaung', N'ပေါက်ခေါင်း', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (49, N'MMR008004', N'Paungde', N'ပေါင်းတည်', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (50, N'MMR008001', N'Pyay', N'ပြည်', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (51, N'MMR008006', N'Shwedaung', N'ရွှေတောင်', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (52, N'MMR008007', N'Thayarwady', N'သာယာဝတီ', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (53, N'MMR008005', N'Thegon', N'သဲကုန်း', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (54, N'MMR008011', N'Zigon', N'ဇီးကုန်း', N'MMR008')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (55, N'MMR004001', N'Falam', N'ဖလမ်း', N'MMR004')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (56, N'MMR004002', N'Hakha', N'ဟားခါး', N'MMR004')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (57, N'MMR004008', N'Kanpetlet', N'ကန်ပက်လက်', N'MMR004')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (58, N'MMR004007', N'Matupi', N'မတူပီ', N'MMR004')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (59, N'MMR004006', N'Mindat', N'မင်းတပ်', N'MMR004')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (60, N'MMR004009', N'Paletwa', N'ပလက်ဝ', N'MMR004')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (61, N'MMR004004', N'Tedim', N'တီးတိန်', N'MMR004')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (62, N'MMR004003', N'Thantlang', N'ထန်တလန်', N'MMR004')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (63, N'MMR004005', N'Tonzang', N'တွန်းဇန်', N'MMR004')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (64, N'MMR001010', N'Bhamo', N'ဗန်းမော်', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (65, N'MMR001005', N'Chipwi', N'ချီ​ဖွေ', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (66, N'MMR001009', N'Hpakant', N'ဖားကန့်', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (67, N'MMR001003', N'Injangyang', N'အင်ဂျန်းယန်', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (68, N'MMR001018', N'Khaunglanhpu', N'ခေါင်လန်ဖူး', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (69, N'MMR001016', N'Machanbaw', N'မချမ်းဘော', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (70, N'MMR001013', N'Mansi', N'မံစီ', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (71, N'MMR001008', N'Mogaung', N'မိုးကောင်း', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (72, N'MMR001007', N'Mohnyin', N'မိုးညှင်း', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (73, N'MMR001012', N'Momauk', N'မိုးမောက်', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (74, N'MMR001001', N'Myitkyina', N'မြစ်ကြီးနား', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (75, N'MMR001017', N'Nawngmun', N'နောင်မွန်း', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (76, N'MMR001014', N'Puta-O', N'ပူတာအို', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (77, N'MMR001011', N'Shwegu', N'ရွှေကူ', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (78, N'MMR001015', N'Sumprabum', N'ဆွမ်ပရာဘွမ်', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (79, N'MMR001004', N'Tanai', N'တနိုင်း', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (80, N'MMR001006', N'Tsawlaw', N'ဆော့လော်', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (81, N'MMR001002', N'Waingmaw', N'ဝိုင်းမော်', N'MMR001')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (82, N'MMR002005', N'Bawlake', N'ဘောလခဲ', N'MMR002')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (83, N'MMR002002', N'Demoso', N'ဒီးမော့ဆို', N'MMR002')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (84, N'MMR002006', N'Hpasawng', N'ဖားဆောင်း', N'MMR002')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (85, N'MMR002003', N'Hpruso', N'ဖရူဆို', N'MMR002')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (86, N'MMR002001', N'Loikaw', N'လွိုင်ကော်', N'MMR002')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (87, N'MMR002007', N'Mese', N'မယ်စဲ့', N'MMR002')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (88, N'MMR002004', N'Shadaw', N'ရှားတော', N'MMR002')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (89, N'MMR003002', N'Hlaingbwe', N'လှိုင်းဘွဲ့', N'MMR003')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (90, N'MMR003001', N'Hpa-An', N'ဘားအံ', N'MMR003')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (91, N'MMR003003', N'Hpapun', N'ဖာပွန်', N'MMR003')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (92, N'MMR003006', N'Kawkareik', N'ကော့ကရိတ်', N'MMR003')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (93, N'MMR003007', N'Kyainseikgyi', N'ကြာအင်းဆိပ်ကြီး', N'MMR003')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (94, N'MMR003005', N'Myawaddy', N'မြဝတီ', N'MMR003')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (95, N'MMR003004', N'Thandaunggyi', N'သံတောင်ကြီး', N'MMR003')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (96, N'MMR009016', N'Aunglan', N'အောင်လံ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (97, N'MMR009003', N'Chauk', N'ချောက်', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (98, N'MMR009023', N'Gangaw', N'ဂန့်ဂေါ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (99, N'MMR009015', N'Kamma', N'ကံမ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (100, N'MMR009001', N'Magway', N'မကွေး', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (101, N'MMR009007', N'Minbu', N'မင်းဘူး', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (102, N'MMR009014', N'Mindon', N'မင်းတုန်း', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (103, N'MMR009013', N'Minhla', N'မင်းလှ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (104, N'MMR009020', N'Myaing', N'မြိုင်', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (105, N'MMR009005', N'Myothit', N'မြို့သစ်', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (106, N'MMR009006', N'Natmauk', N'နတ်မောက်', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (107, N'MMR009009', N'Ngape', N'ငဖဲ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (108, N'MMR009018', N'Pakokku', N'ပခုက္ကူ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (109, N'MMR009021', N'Pauk', N'ပေါက်', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (110, N'MMR009008', N'Pwintbyu', N'ပွင့်ဖြူ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (111, N'MMR009010', N'Salin', N'စလင်း', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (112, N'MMR009025', N'Saw', N'ဆော', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (113, N'MMR009022', N'Seikphyu', N'ဆိပ်ဖြူ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (114, N'MMR009011', N'Sidoktaya', N'စေတုတ္ထရာ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (115, N'MMR009017', N'Sinbaungwe', N'ဆင်ပေါင်ဝဲ', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (116, N'MMR009004', N'Taungdwingyi', N'တောင်တွင်းကြီး', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (117, N'MMR009012', N'Thayet', N'သရက်', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (118, N'MMR009024', N'Tilin', N'ထီးလင်း', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (119, N'MMR009002', N'Yenangyaung', N'ရေနံချောင်း', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (120, N'MMR009019', N'Yesagyo', N'ရေစကြို', N'MMR009')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (121, N'MMR010006', N'Amarapura', N'အမရပူရ', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (122, N'MMR010001', N'Aungmyaythazan', N'အောင်မြေသာစံ', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (123, N'MMR010002', N'Chanayethazan', N'ချမ်းအေးသာစံ', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (124, N'MMR010004', N'Chanmyathazi', N'ချမ်းမြသာစည်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (125, N'MMR010020', N'Kyaukpadaung', N'ကျောက်ပန်းတောင်း', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (126, N'MMR010013', N'Kyaukse', N'ကျောက်ဆည်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (127, N'MMR010009', N'Madaya', N'မတ္တရာ', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (128, N'MMR010003', N'Mahaaungmyay', N'မဟာအောင်မြေ', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (129, N'MMR010029', N'Mahlaing', N'မလှိုင်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (130, N'MMR010028', N'Meiktila', N'မိတ္ထီလာ', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (131, N'MMR010011', N'Mogoke', N'မိုးကုတ်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (132, N'MMR010017', N'Myingyan', N'မြင်းခြံ', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (133, N'MMR010015', N'Myittha', N'မြစ်သား', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (134, N'MMR010019', N'Natogyi', N'နွားထိုးကြီး', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (135, N'MMR010021', N'Ngazun', N'ငါန်းဇွန်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (136, N'MMR010022', N'Nyaung-U', N'ညောင်ဦး', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (137, N'MMR010007', N'Patheingyi', N'ပုသိမ်ကြီး', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (138, N'MMR010024', N'Pyawbwe', N'ပျော်ဘွယ်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (139, N'MMR010005', N'Pyigyitagon', N'ပြည်ကြီးတံခွန်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (140, N'MMR010008', N'Pyinoolwin', N'ပြင်ဦးလွင်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (141, N'MMR010010', N'Singu', N'စဉ့်ကူး', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (142, N'MMR010014', N'Sintgaing', N'စဉ့်ကိုင်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (143, N'MMR010016', N'Tada-U', N'တံတားဦး', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (144, N'MMR010018', N'Taungtha', N'တောင်သာ', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (145, N'MMR010012', N'Thabeikkyin', N'သပိတ်ကျင်း', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (146, N'MMR010030', N'Thazi', N'သာစည်', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (147, N'MMR010031', N'Wundwin', N'ဝမ်းတွင်း', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (148, N'MMR010023', N'Yamethin', N'ရမည်းသင်း', N'MMR010')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (149, N'MMR011010', N'Bilin', N'ဘီးလင်း', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (150, N'MMR011003', N'Chaungzon', N'ချောင်းဆုံ', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (151, N'MMR011002', N'Kyaikmaraw', N'ကျိုက်မရော', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (152, N'MMR011009', N'Kyaikto', N'ကျိုက်ထို', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (153, N'MMR011001', N'Mawlamyine', N'မော်လမြိုင်', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (154, N'MMR011005', N'Mudon', N'မုဒုံ', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (155, N'MMR011008', N'Paung', N'ပေါင်', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (156, N'MMR011004', N'Thanbyuzayat', N'သံဖြူဇရပ်', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (157, N'MMR011007', N'Thaton', N'သထုံ', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (158, N'MMR011006', N'Ye', N'ရေး', N'MMR011')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (159, N'MMR018004', N'Det Khi Na Thi Ri', N'ဒက္ခိဏသီရိ', N'MMR018')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (160, N'MMR018007', N'Lewe', N'လယ်ဝေး', N'MMR018')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (161, N'MMR018008', N'Oke Ta Ra Thi Ri', N'ဥတ္တရသီရိ', N'MMR018')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (162, N'MMR018005', N'Poke Ba Thi Ri', N'ပုဗ္ဗသီရိ', N'MMR018')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (163, N'MMR018006', N'Pyinmana', N'ပျဉ်းမနား', N'MMR018')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (164, N'MMR018003', N'Tatkon', N'တပ်ကုန်း', N'MMR018')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (165, N'MMR018002', N'Za Bu Thi Ri', N'ဇမ္ဗူသီရိ', N'MMR018')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (166, N'MMR018001', N'Zay Yar Thi Ri', N'ဇေယျာသီရိ', N'MMR018')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (167, N'MMR012014', N'Ann', N'အမ်း', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (168, N'MMR012010', N'Buthidaung', N'ဘူးသီးတောင်', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (169, N'MMR012017', N'Gwa', N'ဂွ', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (170, N'MMR012011', N'Kyaukpyu', N'ကျောက်ဖြူ', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (171, N'MMR012004', N'Kyauktaw', N'ကျောက်တော်', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (172, N'MMR012009', N'Maungdaw', N'မောင်တော', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (173, N'MMR012005', N'Minbya', N'မင်းပြား', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (174, N'MMR012003', N'Mrauk-U', N'မြောက်ဦး', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (175, N'MMR012012', N'Munaung', N'မာန်အောင်', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (176, N'MMR012006', N'Myebon', N'မြေပုံ', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (177, N'MMR012007', N'Pauktaw', N'ပေါက်တော', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (178, N'MMR012002', N'Ponnagyun', N'ပုဏ္ဏားကျွန်း', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (179, N'MMR012013', N'Ramree', N'ရမ်းဗြဲ', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (180, N'MMR012008', N'Rathedaung', N'ရသေ့တောင်', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (181, N'MMR012001', N'Sittwe', N'စစ်တွေ', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (182, N'MMR012015', N'Thandwe', N'သံတွဲ', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (183, N'MMR012016', N'Toungup', N'တောင်ကုတ်', N'MMR012')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (184, N'MMR005014', N'Ayadaw', N'အရာတော်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (185, N'MMR005023', N'Banmauk', N'ဗန်းမောက်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (186, N'MMR005013', N'Budalin', N'ဘုတလင်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (187, N'MMR005015', N'Chaung-U', N'ချောင်းဦး', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (188, N'MMR005033', N'Hkamti', N'ခန္တီး', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (189, N'MMR005034', N'Homalin', N'ဟုမ္မလင်း', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (190, N'MMR005021', N'Indaw', N'အင်းတော်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (191, N'MMR005027', N'Kale', N'ကလေး', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (192, N'MMR005028', N'Kalewa', N'ကလေးဝ', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (193, N'MMR005007', N'Kanbalu', N'ကန့်ဘလူ', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (194, N'MMR005017', N'Kani', N'ကနီ', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (195, N'MMR005020', N'Katha', N'ကသာ', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (196, N'MMR005024', N'Kawlin', N'ကောလင်း', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (197, N'MMR005005', N'Khin-U', N'ခင်ဦး', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (198, N'MMR005008', N'Kyunhla', N'ကျွန်းလှ', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (199, N'MMR005036', N'Lahe', N'လဟယ်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (200, N'MMR005035', N'Layshi', N'လေရှီး', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (201, N'MMR005031', N'Mawlaik', N'မော်လိုက်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (202, N'MMR005029', N'Mingin', N'မင်းကင်း', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (203, N'MMR005012', N'Monywa', N'မုံရွာ', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (204, N'MMR005003', N'Myaung', N'မြောင်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (205, N'MMR005002', N'Myinmu', N'မြင်းမူ', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (206, N'MMR005037', N'Nanyun', N'နန်းယွန်း', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (207, N'MMR005019', N'Pale', N'ပုလဲ', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (208, N'MMR005032', N'Paungbyin', N'ဖောင်းပြင်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (209, N'MMR005026', N'Pinlebu', N'ပင်လည်ဘူး', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (210, N'MMR005001', N'Sagaing', N'စစ်ကိုင်း', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (211, N'MMR005018', N'Salingyi', N'ဆားလင်းကြီး', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (212, N'MMR005004', N'Shwebo', N'ရွှေဘို', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (213, N'MMR005010', N'Tabayin', N'ဒီပဲယင်း', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (214, N'MMR005030', N'Tamu', N'တမူး', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (215, N'MMR005011', N'Taze', N'တန့်ဆည်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (216, N'MMR005022', N'Tigyaing', N'ထီးချိုင့်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (217, N'MMR005006', N'Wetlet', N'ဝက်လက်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (218, N'MMR005025', N'Wuntho', N'ဝန်းသို', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (219, N'MMR005009', N'Ye-U', N'ရေဦး', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (220, N'MMR005016', N'Yinmarbin', N'ယင်းမာပင်', N'MMR005')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (221, N'MMR016320', N'Ho Tawng (Ho Tao)', N'ဟိုတောင်း', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (222, N'MMR016001', N'Kengtung', N'ကျိုင်းတုံ', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (223, N'MMR016319', N'Mong Hpen', N'မိုင်းဖျန်', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (224, N'MMR016322', N'Mong Kar', N'မိုင်းကာ', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (225, N'MMR016321', N'Mong Pawk', N'မိုင်းပေါက်', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (226, N'MMR016010', N'Monghpyak', N'မိုင်းဖြတ်', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (227, N'MMR016006', N'Monghsat', N'မိုင်းဆတ်', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (228, N'MMR016002', N'Mongkhet', N'မိုင်းခတ်', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (229, N'MMR016005', N'Mongla', N'မိုင်းလား', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (230, N'MMR016007', N'Mongping', N'မိုင်းပျဉ်း', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (231, N'MMR016008', N'Mongton', N'မိုင်းတုံ', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (232, N'MMR016003', N'Mongyang', N'မိုင်းယန်း', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (233, N'MMR016011', N'Mongyawng', N'မိုင်းယောင်း', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (234, N'MMR016323', N'Nam Hpai', N'နမ့်ဖိုင်', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (235, N'MMR016009', N'Tachileik', N'တာချီလိတ်', N'MMR016')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (236, N'MMR015311', N'Aik Chan (Ai'' Chun)', N'အိုက်ချန်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (237, N'MMR015203', N'Chinshwehaw Sub-township (Kokang SAZ)', N'ချင်းရွှေဟော်မြို့နယ်ခွဲ (အထူးဒေသ ၁)', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (238, N'MMR015306', N'Hkun Mar (Hkwin Ma)', N'ခွန်းမား', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (239, N'MMR015021', N'Hopang', N'ဟိုပန်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (240, N'MMR015305', N'Hsawng Hpa (Saun Pha)', N'ဆောင်ဖ', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (241, N'MMR015002', N'Hseni', N'သိန္နီ', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (242, N'MMR015014', N'Hsipaw', N'သီပေါ', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (243, N'MMR015310', N'Ka Lawng Hpar', N'ကလောင်ဖါ', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (244, N'MMR015304', N'Kawng Min Hsang', N'ကောင်မင်ဆန်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (245, N'MMR015023', N'Konkyan', N'ကုန်းကြမ်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (246, N'MMR015201', N'Konkyan (Kokang SAZ)', N'ကုန်းကြမ်း (အထူးဒေသ ၁)', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (247, N'MMR015020', N'Kunlong', N'ကွမ်းလုံ', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (248, N'MMR015011', N'Kutkai', N'ကွတ်ခိုင်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (249, N'MMR015012', N'Kyaukme', N'ကျောက်မဲ', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (250, N'MMR015001', N'Lashio', N'လားရှိုး', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (251, N'MMR015022', N'Laukkaing', N'လောက်ကိုင်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (252, N'MMR015202', N'Laukkaing (Kokang SAZ)', N'လောက်ကိုင် (အထူးဒေသ ၁)', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (253, N'MMR015309', N'Lin Haw', N'လင်ဟော်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (254, N'MMR015307', N'Long Htan', N'လုံထန်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (255, N'MMR015018', N'Mabein', N'မဘိမ်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (256, N'MMR015313', N'Man Man Hseng', N'မန်မန်ဆိုင်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (257, N'MMR015303', N'Man Tun', N'မန်တွန်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (258, N'MMR015019', N'Manton', N'မန်တုံ', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (259, N'MMR015024', N'Matman', N'မက်မန်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (260, N'MMR015008', N'Mongmao', N'မိုင်းမော', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (261, N'MMR015017', N'Mongmit', N'မိုးမိတ်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (262, N'MMR015003', N'Mongyai', N'မိုင်းရယ်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (263, N'MMR015009', N'Muse', N'မူဆယ်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (264, N'MMR015315', N'Nam Hkam Wu', N'နမ်ခမ်းဝူး', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (265, N'MMR015301', N'Nam Tit', N'နမ့် တစ်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (266, N'MMR015010', N'Namhkan', N'နမ့်ခမ်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (267, N'MMR015016', N'Namhsan', N'နမ့်ဆန်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (268, N'MMR015015', N'Namtu', N'နမ္မတူ', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (269, N'MMR015316', N'Nar Kawng', N'နားကောင်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (270, N'MMR015302', N'Nar Wee (Na Wi)', N'နာဝီး', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (271, N'MMR015006', N'Narphan', N'နားဖန်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (272, N'MMR015314', N'Nawng Hkit', N'နောင်ခစ်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (273, N'MMR015013', N'Nawnghkio', N'နောင်ချို', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (274, N'MMR015317', N'Pang Hkam', N'ပန်ခမ့်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (275, N'MMR015318', N'Pang Yang', N'ပန်ယန်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (276, N'MMR015005', N'Pangsang (Panghkam)', N'ပန်ဆန်း (ပန်ခမ်း)', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (277, N'MMR015007', N'Pangwaun', N'ပန်ဝိုင်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (278, N'MMR015004', N'Tangyan', N'တန့်ယန်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (279, N'MMR015308', N'Yawng Lin', N'ယောင်လင်း', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (280, N'MMR015312', N'Yin Pang', N'ရင်ဖန့်', N'MMR015')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (281, N'MMR014003', N'Hopong', N'ဟိုပုံး', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (282, N'MMR014004', N'Hsihseng', N'ဆီဆိုင်', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (283, N'MMR014005', N'Kalaw', N'ကလော', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (284, N'MMR014014', N'Kunhing', N'ကွန်ဟိန်း', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (285, N'MMR014015', N'Kyethi', N'ကျေးသီး', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (286, N'MMR014012', N'Laihka', N'လဲချား', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (287, N'MMR014018', N'Langkho', N'လင်းခေး', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (288, N'MMR014008', N'Lawksawk', N'ရပ်စောက်', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (289, N'MMR014011', N'Loilen', N'လွိုင်လင်', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (290, N'MMR014020', N'Mawkmai', N'မောက်မယ်', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (291, N'MMR014017', N'Monghsu', N'မိုင်းရှူး', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (292, N'MMR014016', N'Mongkaing', N'မိုင်းကိုင်', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (293, N'MMR014019', N'Mongnai', N'မိုးနဲ', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (294, N'MMR014021', N'Mongpan', N'မိုင်းပန်', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (295, N'MMR014013', N'Nansang', N'နမ့်စန်', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (296, N'MMR014002', N'Nyaungshwe', N'ညောင်ရွှေ', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (297, N'MMR014010', N'Pekon', N'ဖယ်ခုံ', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (298, N'MMR014006', N'Pindaya', N'ပင်းတယ', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (299, N'MMR014009', N'Pinlaung', N'ပင်လောင်း', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (300, N'MMR014001', N'Taunggyi', N'တောင်ကြီး', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (301, N'MMR014007', N'Ywangan', N'ရွာငံ', N'MMR014')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (302, N'MMR006010', N'Bokpyin', N'ဘုတ်ပြင်း', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (303, N'MMR006001', N'Dawei', N'ထားဝယ်', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (304, N'MMR006009', N'Kawthoung', N'ကော့သောင်း', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (305, N'MMR006006', N'Kyunsu', N'ကျွန်းစု', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (306, N'MMR006002', N'Launglon', N'လောင်းလုံး', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (307, N'MMR006005', N'Myeik', N'မြိတ်', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (308, N'MMR006007', N'Palaw', N'ပုလော', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (309, N'MMR006008', N'Tanintharyi', N'တနင်္သာရီ', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (310, N'MMR006003', N'Thayetchaung', N'သရက်ချောင်း', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (311, N'MMR006004', N'Yebyu', N'ရေဖြူ', N'MMR006')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (312, N'MMR013037', N'Ahlone', N'အလုံ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (313, N'MMR013044', N'Bahan', N'ဗဟန်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (314, N'MMR013017', N'Botahtaung', N'ဗိုလ်တထောင်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (315, N'MMR013032', N'Cocokyun', N'ကိုကိုးကျွန်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (316, N'MMR013043', N'Dagon', N'ဒဂုံ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (317, N'MMR013020', N'Dagon Myothit (East)', N'ဒဂုံမြို့သစ် (အရှေ့ပိုင်း)', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (318, N'MMR013019', N'Dagon Myothit (North)', N'ဒဂုံမြို့သစ် (မြောက်ပိုင်း)', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (319, N'MMR013021', N'Dagon Myothit (Seikkan)', N'ဒဂုံမြို့သစ် (ဆိပ်ကမ်း)', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (320, N'MMR013018', N'Dagon Myothit (South)', N'ဒဂုံမြို့သစ် (တောင်ပိုင်း)', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (321, N'MMR013030', N'Dala', N'ဒလ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (322, N'MMR013014', N'Dawbon', N'ဒေါပုံ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (323, N'MMR013040', N'Hlaing', N'လှိုင်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (324, N'MMR013008', N'Hlaingtharya', N'လှိုင်သာယာ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (325, N'MMR013004', N'Hlegu', N'လှည်းကူး', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (326, N'MMR013003', N'Hmawbi', N'မှော်ဘီ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (327, N'MMR013006', N'Htantabin', N'ထန်းတပင်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (328, N'MMR013001', N'Insein', N'အင်းစိန်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (329, N'MMR013041', N'Kamaryut', N'ကမာရွတ်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (330, N'MMR013028', N'Kawhmu', N'ကော့မှူး', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (331, N'MMR013026', N'Kayan', N'ခရမ်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (332, N'MMR013029', N'Kungyangon', N'ကွမ်းခြံကုန်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (333, N'MMR013033', N'Kyauktada', N'ကျောက်တံတား', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (334, N'MMR013024', N'Kyauktan', N'ကျောက်တန်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (335, N'MMR013038', N'Kyeemyindaing', N'ကြည့်မြင်တိုင်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (336, N'MMR013035', N'Lanmadaw', N'လမ်းမတော်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (337, N'MMR013036', N'Latha', N'လသာ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (338, N'MMR013042', N'Mayangone', N'မရမ်းကုန်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (339, N'MMR013002', N'Mingaladon', N'မင်္ဂလာဒုံ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (340, N'MMR013022', N'Mingalartaungnyunt', N'မင်္ဂလာတောင်ညွန့်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (341, N'MMR013012', N'North Okkalapa', N'မြောက်ဥက္ကလာပ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (342, N'MMR013034', N'Pabedan', N'ပန်းဘဲတန်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (343, N'MMR013016', N'Pazundaung', N'ပုဇွန်တောင်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (344, N'MMR013039', N'Sanchaung', N'စမ်းချောင်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (345, N'MMR013031', N'Seikgyikanaungto', N'ဆိပ်ကြီး/ခနောင်တို', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (346, N'MMR013045', N'Seikkan', N'ဆိပ်ကမ်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (347, N'MMR013007', N'Shwepyithar', N'ရွှေပြည်သာ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (348, N'MMR013011', N'South Okkalapa', N'တောင်ဥက္ကလာပ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (349, N'MMR013005', N'Taikkyi', N'တိုက်ကြီး', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (350, N'MMR013015', N'Tamwe', N'တာမွေ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (351, N'MMR013013', N'Thaketa', N'သာကေတ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (352, N'MMR013023', N'Thanlyin', N'သန်လျင်', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (353, N'MMR013009', N'Thingangyun', N'သင်္ဃန်းကျွန်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (354, N'MMR013025', N'Thongwa', N'သုံးခွ', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (355, N'MMR013027', N'Twantay', N'တွံတေး', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (356, N'MMR013010', N'Yankin', N'ရန်ကင်း', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (357, N'MMR013046', N'Hlaingtharya (East)', N'လှိုင်သာယာ (အရှေ့ပိုင်း)', N'MMR013')
GO
INSERT [dbo].[Townships] ([TownshipId], [TownshipCode], [TownshipNameEn], [TownshipNameMm], [StateRegionCode]) VALUES (358, N'MMR013047', N'Hlaingtharya (West)', N'လှိုင်သာယာ (အနောက်ပိုင်း)', N'MMR013')
GO
SET IDENTITY_INSERT [dbo].[Townships] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (1, N'User_1', N'User_1@gmail.com', N'User_1@gmail.com', N'09-5.73559e+008', N'Address_1', N'Fire', N'Severe injury accident', N'MMR015008', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (2, N'User_2', N'User_2@gmail.com', N'User_2@gmail.com', N'09-3.77564e+008', N'Address_2', N'Medical', N'Severe injury accident', N'MMR003002', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (3, N'User_3', N'User_3@gmail.com', N'User_3@gmail.com', N'09-8.44637e+008', N'Address_3', N'Medical', N'Severe injury accident', N'MMR016007', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (4, N'User_4', N'User_4@gmail.com', N'User_4@gmail.com', N'09-3.76549e+008', N'Address_4', N'Police', N'Suspicious activity in neighborhood', N'MMR010030', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (5, N'User_5', N'User_5@gmail.com', N'User_5@gmail.com', N'09-2.82642e+008', N'Address_5', N'Medical', N'Severe injury accident', N'MMR013006', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (6, N'User_6', N'User_6@gmail.com', N'User_6@gmail.com', N'09-7.25978e+008', N'Address_6', N'Medical', N'Fire at apartment', N'MMR009017', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (7, N'User_7', N'User_7@gmail.com', N'User_7@gmail.com', N'09-2.12544e+008', N'Address_7', N'Police', N'Severe injury accident', N'MMR007004', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (8, N'User_8', N'User_8@gmail.com', N'User_8@gmail.com', N'09-3.25759e+008', N'Address_8', N'Police', N'Severe injury accident', N'MMR009024', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (9, N'User_9', N'User_9@gmail.com', N'User_9@gmail.com', N'09-6.74806e+008', N'Address_9', N'Fire', N'Suspicious activity in neighborhood', N'MMR003007', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (10, N'User_10', N'User_10@gmail.com', N'User_10@gmail.com', N'09-1.54985e+008', N'Address_10', N'Fire', N'Fire at apartment', N'MMR016005', N'Service Provider', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (11, N'User_11', N'User_11@gmail.com', N'User_11@gmail.com', N'09-4.86799e+008', N'Address_11', N'Police', N'Fire at apartment', N'MMR017007', N'Normal User', N'Deactivated', N'Y', NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (12, N'User_12', N'User_12@gmail.com', N'User_12@gmail.com', N'09-2.02957e+008', N'Address_12', N'Fire', N'Severe injury accident', N'MMR009005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (13, N'User_13', N'User_13@gmail.com', N'User_13@gmail.com', N'09-7.05358e+008', N'Address_13', N'Fire', N'Severe injury accident', N'MMR009005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (14, N'User_14', N'User_14@gmail.com', N'User_14@gmail.com', N'09-5.44591e+008', N'Address_14', N'Fire', N'Suspicious activity in neighborhood', N'MMR015019', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (15, N'User_15', N'User_15@gmail.com', N'User_15@gmail.com', N'09-2.15084e+008', N'Address_15', N'Medical', N'Severe injury accident', N'MMR015303', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (16, N'User_16', N'User_16@gmail.com', N'User_16@gmail.com', N'09-7.37477e+008', N'Address_16', N'Police', N'Severe injury accident', N'MMR017008', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (17, N'User_17', N'User_17@gmail.com', N'User_17@gmail.com', N'09-9.86952e+008', N'Address_17', N'Police', N'Severe injury accident', N'MMR010030', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (18, N'User_18', N'User_18@gmail.com', N'User_18@gmail.com', N'09-7.13543e+008', N'Address_18', N'Fire', N'Suspicious activity in neighborhood', N'MMR012011', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (19, N'User_19', N'User_19@gmail.com', N'User_19@gmail.com', N'09-6.78337e+008', N'Address_19', N'Medical', N'Fire at apartment', N'MMR015313', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (20, N'User_20', N'User_20@gmail.com', N'User_20@gmail.com', N'09-9.85633e+008', N'Address_20', N'Police', N'Severe injury accident', N'MMR009011', N'Normal User', N'Deactivated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (21, N'User_21', N'User_21@gmail.com', N'User_21@gmail.com', N'09-4.19111e+008', N'Address_21', N'Medical', N'Fire at apartment', N'MMR013005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (22, N'User_22', N'User_22@gmail.com', N'User_22@gmail.com', N'09-3.50303e+008', N'Address_22', N'Medical', N'Severe injury accident', N'MMR009012', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (23, N'User_23', N'User_23@gmail.com', N'User_23@gmail.com', N'09-3.06382e+008', N'Address_23', N'Medical', N'Severe injury accident', N'MMR018005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (24, N'User_24', N'User_24@gmail.com', N'User_24@gmail.com', N'09-3.73541e+008', N'Address_24', N'Medical', N'Fire at apartment', N'MMR013047', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (25, N'User_25', N'User_25@gmail.com', N'User_25@gmail.com', N'09-7.41138e+008', N'Address_25', N'Fire', N'Fire at apartment', N'MMR005030', N'Normal User', N'Deactivated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (26, N'User_26', N'User_26@gmail.com', N'User_26@gmail.com', N'09-8.07822e+008', N'Address_26', N'Police', N'Suspicious activity in neighborhood', N'MMR014014', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (27, N'User_27', N'User_27@gmail.com', N'User_27@gmail.com', N'09-9.33168e+008', N'Address_27', N'Police', N'Severe injury accident', N'MMR013038', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (28, N'User_28', N'User_28@gmail.com', N'User_28@gmail.com', N'09-5.35291e+008', N'Address_28', N'Fire', N'Severe injury accident', N'MMR011009', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (29, N'User_29', N'User_29@gmail.com', N'User_29@gmail.com', N'09-8.27302e+008', N'Address_29', N'Medical', N'Suspicious activity in neighborhood', N'MMR006002', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (30, N'User_30', N'User_30@gmail.com', N'User_30@gmail.com', N'09-5.92599e+008', N'Address_30', N'Police', N'Severe injury accident', N'MMR015006', N'Normal User', N'Deactivated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (31, N'User_31', N'User_31@gmail.com', N'User_31@gmail.com', N'09-7.13384e+007', N'Address_31', N'Fire', N'Fire at apartment', N'MMR017019', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (32, N'User_32', N'User_32@gmail.com', N'User_32@gmail.com', N'09-8.43959e+008', N'Address_32', N'Medical', N'Suspicious activity in neighborhood', N'MMR001002', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (33, N'User_33', N'User_33@gmail.com', N'User_33@gmail.com', N'09-4.68839e+007', N'Address_33', N'Medical', N'Fire at apartment', N'MMR017001', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (34, N'User_34', N'User_34@gmail.com', N'User_34@gmail.com', N'09-1.39344e+008', N'Address_34', N'Medical', N'Suspicious activity in neighborhood', N'MMR008009', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (35, N'User_35', N'User_35@gmail.com', N'User_35@gmail.com', N'09-9.20859e+007', N'Address_35', N'Police', N'Fire at apartment', N'MMR017012', N'Normal User', N'Deactivated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (36, N'User_36', N'User_36@gmail.com', N'User_36@gmail.com', N'09-2.37935e+008', N'Address_36', N'Medical', N'Fire at apartment', N'MMR013044', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (37, N'User_37', N'User_37@gmail.com', N'User_37@gmail.com', N'09-8.6176e+008', N'Address_37', N'Medical', N'Suspicious activity in neighborhood', N'MMR004008', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (38, N'User_38', N'User_38@gmail.com', N'User_38@gmail.com', N'09-3.62895e+007', N'Address_38', N'Fire', N'Severe injury accident', N'MMR001017', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (39, N'User_39', N'User_39@gmail.com', N'User_39@gmail.com', N'09-2.59749e+008', N'Address_39', N'Fire', N'Suspicious activity in neighborhood', N'MMR005036', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (40, N'User_40', N'User_40@gmail.com', N'User_40@gmail.com', N'09-2.37218e+008', N'Address_40', N'Fire', N'Suspicious activity in neighborhood', N'MMR010004', N'Normal User', N'Deactivated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (41, N'User_41', N'User_41@gmail.com', N'User_41@gmail.com', N'09-5.01321e+008', N'Address_41', N'Medical', N'Severe injury accident', N'MMR001017', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (42, N'User_42', N'User_42@gmail.com', N'User_42@gmail.com', N'09-6.7152e+008', N'Address_42', N'Medical', N'Fire at apartment', N'MMR005034', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (43, N'User_43', N'User_43@gmail.com', N'User_43@gmail.com', N'09-7.00263e+008', N'Address_43', N'Fire', N'Severe injury accident', N'MMR015010', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (44, N'User_44', N'User_44@gmail.com', N'User_44@gmail.com', N'09-7.31708e+008', N'Address_44', N'Fire', N'Severe injury accident', N'MMR004003', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (45, N'User_45', N'User_45@gmail.com', N'User_45@gmail.com', N'09-1.71381e+008', N'Address_45', N'Medical', N'Fire at apartment', N'MMR010017', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (46, N'User_46', N'User_46@gmail.com', N'User_46@gmail.com', N'09-4.37239e+008', N'Address_46', N'Fire', N'Fire at apartment', N'MMR013047', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (47, N'User_47', N'User_47@gmail.com', N'User_47@gmail.com', N'09-3.65446e+008', N'Address_47', N'Fire', N'Suspicious activity in neighborhood', N'MMR018002', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (48, N'User_48', N'User_48@gmail.com', N'User_48@gmail.com', N'09-2.09752e+008', N'Address_48', N'Fire', N'Severe injury accident', N'MMR014010', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (49, N'User_49', N'User_49@gmail.com', N'User_49@gmail.com', N'09-9.49061e+008', N'Address_49', N'Medical', N'Fire at apartment', N'MMR013001', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (50, N'User_50', N'User_50@gmail.com', N'User_50@gmail.com', N'09-5.27169e+008', N'Address_50', N'Police', N'Severe injury accident', N'MMR013045', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (51, N'User_51', N'User_51@gmail.com', N'User_51@gmail.com', N'09-2.39534e+007', N'Address_51', N'Medical', N'Severe injury accident', N'MMR017012', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (52, N'User_52', N'User_52@gmail.com', N'User_52@gmail.com', N'09-7.54846e+008', N'Address_52', N'Medical', N'Fire at apartment', N'MMR010023', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (53, N'User_53', N'User_53@gmail.com', N'User_53@gmail.com', N'09-2.76641e+008', N'Address_53', N'Medical', N'Fire at apartment', N'MMR017008', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (54, N'User_54', N'User_54@gmail.com', N'User_54@gmail.com', N'09-3.1223e+008', N'Address_54', N'Fire', N'Severe injury accident', N'MMR013019', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (55, N'User_55', N'User_55@gmail.com', N'User_55@gmail.com', N'09-2.56924e+008', N'Address_55', N'Medical', N'Fire at apartment', N'MMR007011', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (56, N'User_56', N'User_56@gmail.com', N'User_56@gmail.com', N'09-3.56404e+008', N'Address_56', N'Medical', N'Suspicious activity in neighborhood', N'MMR015010', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (57, N'User_57', N'User_57@gmail.com', N'User_57@gmail.com', N'09-8.61397e+007', N'Address_57', N'Police', N'Severe injury accident', N'MMR015310', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (58, N'User_58', N'User_58@gmail.com', N'User_58@gmail.com', N'09-7.31127e+008', N'Address_58', N'Fire', N'Fire at apartment', N'MMR004002', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (59, N'User_59', N'User_59@gmail.com', N'User_59@gmail.com', N'09-4.87599e+008', N'Address_59', N'Medical', N'Suspicious activity in neighborhood', N'MMR012013', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (60, N'User_60', N'User_60@gmail.com', N'User_60@gmail.com', N'09-8.87407e+008', N'Address_60', N'Medical', N'Severe injury accident', N'MMR001005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (61, N'User_61', N'User_61@gmail.com', N'User_61@gmail.com', N'09-9.77983e+008', N'Address_61', N'Fire', N'Suspicious activity in neighborhood', N'MMR004005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (62, N'User_62', N'User_62@gmail.com', N'User_62@gmail.com', N'09-3.0966e+007', N'Address_62', N'Fire', N'Severe injury accident', N'MMR017021', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (63, N'User_63', N'User_63@gmail.com', N'User_63@gmail.com', N'09-7.45114e+008', N'Address_63', N'Medical', N'Fire at apartment', N'MMR018002', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (64, N'User_64', N'User_64@gmail.com', N'User_64@gmail.com', N'09-6.00234e+008', N'Address_64', N'Fire', N'Severe injury accident', N'MMR001016', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (65, N'User_65', N'User_65@gmail.com', N'User_65@gmail.com', N'09-7.5424e+008', N'Address_65', N'Medical', N'Severe injury accident', N'MMR016323', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (66, N'User_66', N'User_66@gmail.com', N'User_66@gmail.com', N'09-6.06402e+008', N'Address_66', N'Medical', N'Severe injury accident', N'MMR017016', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (67, N'User_67', N'User_67@gmail.com', N'User_67@gmail.com', N'09-2.60576e+008', N'Address_67', N'Medical', N'Suspicious activity in neighborhood', N'MMR012008', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (68, N'User_68', N'User_68@gmail.com', N'User_68@gmail.com', N'09-5.35198e+008', N'Address_68', N'Police', N'Severe injury accident', N'MMR005019', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (69, N'User_69', N'User_69@gmail.com', N'User_69@gmail.com', N'09-5.40221e+008', N'Address_69', N'Fire', N'Fire at apartment', N'MMR005005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (70, N'User_70', N'User_70@gmail.com', N'User_70@gmail.com', N'09-8.69391e+008', N'Address_70', N'Police', N'Severe injury accident', N'MMR015020', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (71, N'User_71', N'User_71@gmail.com', N'User_71@gmail.com', N'09-5.14731e+008', N'Address_71', N'Medical', N'Fire at apartment', N'MMR017016', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (72, N'User_72', N'User_72@gmail.com', N'User_72@gmail.com', N'09-1.16882e+008', N'Address_72', N'Medical', N'Severe injury accident', N'MMR011005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (73, N'User_73', N'User_73@gmail.com', N'User_73@gmail.com', N'09-2.42872e+007', N'Address_73', N'Fire', N'Severe injury accident', N'MMR010009', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (74, N'User_74', N'User_74@gmail.com', N'User_74@gmail.com', N'09-9.70554e+007', N'Address_74', N'Medical', N'Severe injury accident', N'MMR018003', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (75, N'User_75', N'User_75@gmail.com', N'User_75@gmail.com', N'09-8.85662e+008', N'Address_75', N'Police', N'Fire at apartment', N'MMR017022', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (76, N'User_76', N'User_76@gmail.com', N'User_76@gmail.com', N'09-6.70752e+008', N'Address_76', N'Medical', N'Suspicious activity in neighborhood', N'MMR015303', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (77, N'User_77', N'User_77@gmail.com', N'User_77@gmail.com', N'09-8.29628e+008', N'Address_77', N'Medical', N'Severe injury accident', N'MMR013029', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (78, N'User_78', N'User_78@gmail.com', N'User_78@gmail.com', N'09-2.12562e+008', N'Address_78', N'Police', N'Severe injury accident', N'MMR007010', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (79, N'User_79', N'User_79@gmail.com', N'User_79@gmail.com', N'09-5.84173e+008', N'Address_79', N'Fire', N'Suspicious activity in neighborhood', N'MMR002007', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (80, N'User_80', N'User_80@gmail.com', N'User_80@gmail.com', N'09-8.19384e+008', N'Address_80', N'Police', N'Suspicious activity in neighborhood', N'MMR007003', N'Normal User', N'Activated', N'Y', NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (81, N'User_81', N'User_81@gmail.com', N'User_81@gmail.com', N'09-6.70487e+007', N'Address_81', N'Police', N'Severe injury accident', N'MMR015003', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (82, N'User_82', N'User_82@gmail.com', N'User_82@gmail.com', N'09-9.94495e+008', N'Address_82', N'Fire', N'Suspicious activity in neighborhood', N'MMR007010', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (83, N'User_83', N'User_83@gmail.com', N'User_83@gmail.com', N'09-6.04238e+008', N'Address_83', N'Fire', N'Severe injury accident', N'MMR005003', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (84, N'User_84', N'User_84@gmail.com', N'User_84@gmail.com', N'09-4.04454e+008', N'Address_84', N'Medical', N'Severe injury accident', N'MMR006008', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (85, N'User_85', N'User_85@gmail.com', N'User_85@gmail.com', N'09-2.01812e+008', N'Address_85', N'Medical', N'Severe injury accident', N'MMR007005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (86, N'User_86', N'User_86@gmail.com', N'User_86@gmail.com', N'09-4.4346e+008', N'Address_86', N'Medical', N'Suspicious activity in neighborhood', N'MMR005010', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (87, N'User_87', N'User_87@gmail.com', N'User_87@gmail.com', N'09-9.43291e+008', N'Address_87', N'Fire', N'Fire at apartment', N'MMR004007', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (88, N'User_88', N'User_88@gmail.com', N'User_88@gmail.com', N'09-1.30448e+008', N'Address_88', N'Medical', N'Fire at apartment', N'MMR010007', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (89, N'User_89', N'User_89@gmail.com', N'User_89@gmail.com', N'09-7.48799e+008', N'Address_89', N'Medical', N'Severe injury accident', N'MMR013004', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (90, N'User_90', N'User_90@gmail.com', N'User_90@gmail.com', N'09-3.88336e+008', N'Address_90', N'Medical', N'Suspicious activity in neighborhood', N'MMR016322', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (91, N'User_91', N'User_91@gmail.com', N'User_91@gmail.com', N'09-8.50024e+008', N'Address_91', N'Fire', N'Fire at apartment', N'MMR006001', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (92, N'User_92', N'User_92@gmail.com', N'User_92@gmail.com', N'09-9.91503e+008', N'Address_92', N'Medical', N'Severe injury accident', N'MMR017015', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (93, N'User_93', N'User_93@gmail.com', N'User_93@gmail.com', N'09-7.72155e+008', N'Address_93', N'Medical', N'Suspicious activity in neighborhood', N'MMR013008', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (94, N'User_94', N'User_94@gmail.com', N'User_94@gmail.com', N'09-4.51909e+008', N'Address_94', N'Fire', N'Suspicious activity in neighborhood', N'MMR015007', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (95, N'User_95', N'User_95@gmail.com', N'User_95@gmail.com', N'09-4.0142e+008', N'Address_95', N'Medical', N'Severe injury accident', N'MMR017023', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (96, N'User_96', N'User_96@gmail.com', N'User_96@gmail.com', N'09-4.52348e+008', N'Address_96', N'Medical', N'Fire at apartment', N'MMR007012', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (97, N'User_97', N'User_97@gmail.com', N'User_97@gmail.com', N'09-3.86003e+008', N'Address_97', N'Medical', N'Suspicious activity in neighborhood', N'MMR008009', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (98, N'User_98', N'User_98@gmail.com', N'User_98@gmail.com', N'09-3.05861e+008', N'Address_98', N'Fire', N'Severe injury accident', N'MMR005035', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (99, N'User_99', N'User_99@gmail.com', N'User_99@gmail.com', N'09-1.10614e+008', N'Address_99', N'Fire', N'Fire at apartment', N'MMR010013', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (100, N'User_100', N'User_100@gmail.com', N'User_100@gmail.com', N'09-3.81592e+008', N'Address_100', N'Fire', N'Severe injury accident', N'MMR014005', N'Normal User', N'Activated', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [PhoneNumber], [Address], [EmergencyType], [EmergencyDetails], [TownshipCode], [Role], [UserStatus], [IsVerified], [OTP]) VALUES (102, N'Admin1', N'admin1@gmail.com', N'admin1password', N'09775089754', N'Yangon', NULL, NULL, N'', N'admin', N'Activated', N'Y', NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[EmergencyRequests] ADD  DEFAULT (getdate()) FOR [RequestTime]
GO
ALTER TABLE [dbo].[EmergencyServices] ADD  CONSTRAINT [DF__Emergency__Servi__403A8C7D]  DEFAULT ('Pending') FOR [ServiceStatus]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserStatus]  DEFAULT ('Pending') FOR [UserStatus]
GO
/****** Object:  StoredProcedure [dbo].[sp_Dashboard_DailyWeeklyMonthlyPerRequest]    Script Date: 1/26/2025 11:00:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO















-----------------------------------
-- Test Script
-----------------------------------
/*
DBCC DROPCLEANBUFFERS
GO 

DECLARE @UserId			nvarchar(50)	SET @UserId='HEIN'

EXEC sp_Dashboard_DailyWeeklyMonthlyPerRequest	@UserId

select * from EmergencyRequests
*/

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Change History
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 15/De/2024 HEIN	- create the sp for Dashboard
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[sp_Dashboard_DailyWeeklyMonthlyPerRequest]    
	( 
	@UserId					nvarchar(50)
	) 
AS
BEGIN
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Create Temp Table to Return Data 
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	CREATE TABLE #RequestSummary
	(	
		DailyRequest INT,
		WeeklyRequest INT,
		MonthlyRequest INT
	);
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Retrieving Daily Request
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	DECLARE @DailyRequest INT  SET @DailyRequest = 0
	SELECT @DailyRequest = COUNT(*) FROM EmergencyRequests (NOLOCK) WHERE CONVERT(DATE,RequestTime) = CONVERT(DATE,GETDATE())

	------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Retrieving Weekly Request
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	DECLARE @WeeklyRequest INT  SET @WeeklyRequest = 0
	SELECT @WeeklyRequest = COUNT(*) FROM EmergencyRequests (NOLOCK) WHERE CONVERT(DATE,RequestTime) BETWEEN CONVERT(DATE,GETDATE()-7) AND CONVERT(DATE,GETDATE())

	------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Retrieving Monthly Request
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	DECLARE @MonthlyRequest INT  SET @MonthlyRequest = 0
	SELECT @MonthlyRequest= COUNT(*) FROM EmergencyRequests WHERE CONVERT(DATE,RequestTime) BETWEEN CONVERT(DATE,DATEADD(month, -1, GETDATE())) AND CONVERT(DATE,GETDATE())

	INSERT INTO #RequestSummary(DailyRequest, WeeklyRequest, MonthlyRequest) VALUES 
		(@DailyRequest, @WeeklyRequest, @MonthlyRequest )

	SELECT * FROM #RequestSummary
	DROP TABLE #RequestSummary
END




---------------------------------------------------------------------------------------------
--END Of sp_Dashboard_DailyWeeklyMonthlyPerRequest 
---------------------------------------------------------------------------------------------




GO
/****** Object:  StoredProcedure [dbo].[sp_Dashboard_Process]    Script Date: 1/26/2025 11:00:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO















-----------------------------------
-- Test Script
-----------------------------------
/*
DBCC DROPCLEANBUFFERS
GO 

DECLARE @UserId			nvarchar(50)	SET @UserId='HEIN'

EXEC sp_Dashboard_Process	@UserId

*/

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Change History
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 15/De/2024 HEIN	- create the sp for Dashboard
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[sp_Dashboard_Process]    
	( 
	@UserId					nvarchar(50)
	) 
AS
BEGIN

	EXEC dbo.sp_Dashboard_DailyWeeklyMonthlyPerRequest		@UserId
	
	EXEC dbo.sp_Dashboard_TopTenServicePerTownship			@UserId
	
END



















GO
/****** Object:  StoredProcedure [dbo].[sp_Dashboard_ServiceProviderActivity]    Script Date: 1/26/2025 11:00:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Dashboard_ServiceProviderActivity]

AS

BEGIN
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Create Temp Table to Return Data 
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	CREATE TABLE #ServiceProviderActivity
	(	
		ServiceId		INT,
		ServiceName		NVARCHAR(100),
		ServiceType		NVARCHAR(50),
		PhoneNumber		NVARCHAR(15),
		Location		NVARCHAR(MAX),
		Count			INT
	);
	
	INSERT INTO #ServiceProviderActivity
	(ServiceId, ServiceName, ServiceType, PhoneNumber, Location, Count ) 

	SELECT ER.ServiceId
			,ES.ServiceName
			,ES.ServiceType
			,ES.PhoneNumber
			,ES.Location
			,Count(ER.ServiceId) AS ServiceCount
	FROM EmergencyRequests AS ER
	INNER JOIN EmergencyServices AS ES ON ES.ServiceId = ER.ServiceId
	WHERE Status = 'Completed'
	GROUP BY ER.ServiceId
		,ES.ServiceName
	    ,ES.[ServiceType]
	    ,ES.[PhoneNumber]
	    ,ES.[Location]
	ORDER BY ServiceCount DESC

	SELECT * FROM #ServiceProviderActivity
	DROP TABLE #ServiceProviderActivity
END

---------------------------------------------------------------------------------------------
--END Of [sp_Dashboard_ServiceProviderActivity]
---------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[sp_Dashboard_TopTenRequestPerUser]    Script Date: 1/26/2025 11:00:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Dashboard_TopTenRequestPerUser]

AS

BEGIN
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Create Temp Table to Return Data 
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	CREATE TABLE #TopTenRequestPerUser
	(	
		UserId			INT,
		UserName		NVARCHAR(200),
		UserEmail		NVARCHAR(50),
		UserPhoneNumber	NVARCHAR(20),
		UserAddress		NVARCHAR(300),
		Count			INT
	);
	
	INSERT INTO #TopTenRequestPerUser
	(UserId, UserName, UserEmail, UserPhoneNumber, UserAddress, Count ) 

	SELECT TOP 10 
	    U.UserId, 
	    U.Name, 
	    U.Email,
		U.PhoneNumber,
		U.Address,
	    COUNT(U.UserId) AS UserCount
	FROM EmergencyRequests AS ER
	INNER JOIN Users AS U ON U.UserId = ER.UserId
	INNER JOIN EmergencyServices AS ES ON ES.ServiceId = ER.ServiceId
	GROUP BY 
	    U.UserId, 
	    U.Name, 
	    U.Email,
		U.PhoneNumber,
		U.Address
	ORDER BY UserCount DESC

	SELECT * FROM #TopTenRequestPerUser
	DROP TABLE #TopTenRequestPerUser
END

---------------------------------------------------------------------------------------------
--END Of [sp_Dashboard_TopTenRequestPerUser]
---------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[sp_Dashboard_TopTenServicePerTownship]    Script Date: 1/26/2025 11:00:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-----------------------------------
-- Test Script
-----------------------------------
/*
DBCC DROPCLEANBUFFERS
GO 

DECLARE @UserId			nvarchar(50)	SET @UserId='HEIN'

EXEC sp_Dashboard_TopTenServicePerTownship	@UserId

*/

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Change History
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 17/De/2024 Hnin Wutt Yi	- create the sp for Dashboard
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 18/De/2024 Hnin Wutt Yi	- update the sp for Dashboard
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[sp_Dashboard_TopTenServicePerTownship]    
	( 
	@UserId					nvarchar(50)
	) 
AS
BEGIN
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Create Temp Table to Return Data 
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	CREATE TABLE #TopTenServicePerTownship
	(	
		TownshipCode	 NVARCHAR(100),
		TownshipNameEn	 NVARCHAR(300),
		TownshipNameMM	 NVARCHAR(300),
		Count				INT
	);
	
	INSERT INTO #TopTenServicePerTownship
	(TownshipCode, TownshipNameEn, TownshipNameMM, Count ) 
	SELECT TOP 10 T.TownshipCode,T.TownshipNameEn, T.TownshipNameMm,COUNT(T.TownshipCode) from EmergencyServices AS ES
    INNER JOIN Townships AS T ON T.TOWNSHIPCODE = ES.TownshipCode GROUP BY T.TownshipCode,T.TownshipNameEn, T.TownshipNameMm ORDER BY COUNT(T.TownshipCode) DESC


	SELECT * FROM #TopTenServicePerTownship
	DROP TABLE #TopTenServicePerTownship
END

---------------------------------------------------------------------------------------------
--END Of sp_Dashboard_TopTenServicePerTownship 
---------------------------------------------------------------------------------------------



GO
