USE [master]
GO
/****** Object:  Database [tnut-monitor]    Script Date: 2024-09-22 16:04:29 ******/
--chỉnh sửa đường dẫn của db nếu bạn có ý định chạy lại file này!
CREATE DATABASE [tnut-monitor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tnut-monitor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\tnut-monitor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tnut-monitor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\tnut-monitor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [tnut-monitor] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tnut-monitor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tnut-monitor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tnut-monitor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tnut-monitor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tnut-monitor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tnut-monitor] SET ARITHABORT OFF 
GO
ALTER DATABASE [tnut-monitor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tnut-monitor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tnut-monitor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tnut-monitor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tnut-monitor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tnut-monitor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tnut-monitor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tnut-monitor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tnut-monitor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tnut-monitor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tnut-monitor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tnut-monitor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tnut-monitor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tnut-monitor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tnut-monitor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tnut-monitor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tnut-monitor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tnut-monitor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tnut-monitor] SET  MULTI_USER 
GO
ALTER DATABASE [tnut-monitor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tnut-monitor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tnut-monitor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tnut-monitor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tnut-monitor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tnut-monitor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tnut-monitor] SET QUERY_STORE = ON
GO
ALTER DATABASE [tnut-monitor] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tnut-monitor]
GO
/****** Object:  Table [dbo].[day_nha]    Script Date: 2024-09-22 16:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[day_nha](
	[id] [int] NOT NULL,
	[name] [nvarchar](3) NULL,
 CONSTRAINT [PK_day_nha] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 2024-09-22 16:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPhong] [int] NULL,
	[status] [int] NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phong]    Script Date: 2024-09-22 16:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phong](
	[id] [int] NOT NULL,
	[idDay] [int] NULL,
	[name] [varchar](7) NULL,
	[status] [int] NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_phong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 2024-09-22 16:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[day_nha] ([id], [name]) VALUES (7, N'A7')
GO
INSERT [dbo].[day_nha] ([id], [name]) VALUES (8, N'A8')
GO
INSERT [dbo].[day_nha] ([id], [name]) VALUES (9, N'A9')
GO
INSERT [dbo].[day_nha] ([id], [name]) VALUES (10, N'A10')
GO
INSERT [dbo].[day_nha] ([id], [name]) VALUES (16, N'A16')
GO
SET IDENTITY_INSERT [dbo].[History] ON 
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (1, 70101, 1, CAST(N'2024-09-22T08:15:54.810' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (2, 70101, 2, CAST(N'2024-09-22T08:15:59.677' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (3, 70101, 3, CAST(N'2024-09-22T08:16:02.740' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (4, 70101, 1, CAST(N'2024-09-22T08:16:04.840' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (5, 70102, 3, CAST(N'2024-09-22T09:17:19.713' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (6, 70102, 3, CAST(N'2024-09-22T09:17:23.453' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (7, 70102, 3, CAST(N'2024-09-22T09:18:15.847' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (8, 70102, 2, CAST(N'2024-09-22T09:18:51.427' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (9, 70102, 1, CAST(N'2024-09-22T09:18:54.300' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (10, 70102, 2, CAST(N'2024-09-22T09:18:56.023' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (11, 70102, 1, CAST(N'2024-09-22T09:18:57.530' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (12, 70102, 2, CAST(N'2024-09-22T09:18:59.637' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (13, 70102, 2, CAST(N'2024-09-22T09:19:04.223' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (14, 70102, 2, CAST(N'2024-09-22T09:19:06.017' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (15, 70102, 1, CAST(N'2024-09-22T09:19:07.613' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (16, 70102, 3, CAST(N'2024-09-22T09:20:57.080' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (17, 70102, 1, CAST(N'2024-09-22T09:21:00.763' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (18, 70102, 3, CAST(N'2024-09-22T09:21:03.603' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (19, 70102, 2, CAST(N'2024-09-22T09:21:06.080' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (20, 70104, 3, CAST(N'2024-09-22T09:21:08.513' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (21, 70104, 1, CAST(N'2024-09-22T09:21:10.510' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (22, 70104, 3, CAST(N'2024-09-22T09:21:12.340' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (23, 70104, 2, CAST(N'2024-09-22T09:21:14.547' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (24, 70104, 1, CAST(N'2024-09-22T09:21:16.573' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (25, 160701, 3, CAST(N'2024-09-22T09:22:32.120' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (26, 160702, 2, CAST(N'2024-09-22T09:22:34.080' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (27, 160601, 3, CAST(N'2024-09-22T09:22:37.880' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (28, 160601, 2, CAST(N'2024-09-22T09:22:41.613' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (29, 160601, 1, CAST(N'2024-09-22T09:22:44.817' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (30, 160601, 2, CAST(N'2024-09-22T09:22:49.603' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (31, 160701, 2, CAST(N'2024-09-22T09:23:27.113' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (32, 160701, 1, CAST(N'2024-09-22T09:23:29.040' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (33, 160102, 3, CAST(N'2024-09-22T09:23:31.367' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (34, 160102, 1, CAST(N'2024-09-22T09:23:33.827' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (35, 90205, 3, CAST(N'2024-09-22T09:31:58.317' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (36, 90205, 1, CAST(N'2024-09-22T09:32:00.440' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (37, 90205, 3, CAST(N'2024-09-22T09:32:02.240' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (38, 90205, 1, CAST(N'2024-09-22T09:32:05.357' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (39, 70104, 2, CAST(N'2024-09-22T09:50:59.447' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (40, 70104, 3, CAST(N'2024-09-22T09:51:01.033' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (41, 70104, 2, CAST(N'2024-09-22T09:56:33.310' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (42, 70104, 3, CAST(N'2024-09-22T09:58:28.140' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (43, 70104, 1, CAST(N'2024-09-22T09:58:32.540' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (44, 70101, 3, CAST(N'2024-09-22T09:58:35.830' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (45, 70102, 3, CAST(N'2024-09-22T09:58:37.663' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (46, 70103, 3, CAST(N'2024-09-22T09:58:39.223' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (47, 70101, 2, CAST(N'2024-09-22T09:58:43.547' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (48, 70102, 2, CAST(N'2024-09-22T09:58:45.667' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (49, 70104, 2, CAST(N'2024-09-22T09:59:19.660' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (50, 70104, 3, CAST(N'2024-09-22T09:59:46.553' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (51, 90105, 1, CAST(N'2024-09-22T10:00:23.613' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (52, 70104, 1, CAST(N'2024-09-22T10:00:37.100' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (53, 70104, 2, CAST(N'2024-09-22T10:00:48.650' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (54, 70103, 2, CAST(N'2024-09-22T10:01:18.513' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (55, 70104, 1, CAST(N'2024-09-22T10:01:21.123' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (56, 70103, 3, CAST(N'2024-09-22T10:01:26.147' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (57, 70104, 3, CAST(N'2024-09-22T10:01:28.973' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (58, 70103, 2, CAST(N'2024-09-22T10:01:31.373' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (59, 70104, 2, CAST(N'2024-09-22T10:01:32.923' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (60, 160101, 2, CAST(N'2024-09-22T10:01:42.657' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (61, 160201, 3, CAST(N'2024-09-22T10:01:46.530' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (62, 80101, 3, CAST(N'2024-09-22T10:01:48.910' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (63, 80202, 3, CAST(N'2024-09-22T10:01:50.650' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (64, 80301, 3, CAST(N'2024-09-22T10:01:52.247' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (65, 80202, 2, CAST(N'2024-09-22T10:02:21.133' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (66, 100401, 3, CAST(N'2024-09-22T10:02:48.553' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (67, 100402, 2, CAST(N'2024-09-22T10:02:50.213' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (68, 80102, 2, CAST(N'2024-09-22T10:03:05.250' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (69, 80103, 2, CAST(N'2024-09-22T10:03:07.027' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (70, 100403, 2, CAST(N'2024-09-22T10:03:08.383' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (71, 100404, 2, CAST(N'2024-09-22T10:03:09.750' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (72, 100404, 1, CAST(N'2024-09-22T10:03:12.697' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (73, 100404, 3, CAST(N'2024-09-22T10:03:17.287' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (74, 100403, 1, CAST(N'2024-09-22T10:03:18.933' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (75, 80202, 1, CAST(N'2024-09-22T10:03:26.987' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (76, 80301, 2, CAST(N'2024-09-22T10:03:29.803' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (77, 80301, 1, CAST(N'2024-09-22T10:19:33.780' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (78, 80103, 3, CAST(N'2024-09-22T10:19:35.707' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (79, 70204, 2, CAST(N'2024-09-22T12:09:21.320' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (80, 70203, 2, CAST(N'2024-09-22T12:09:22.513' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (81, 70202, 2, CAST(N'2024-09-22T12:09:23.227' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (82, 70201, 2, CAST(N'2024-09-22T12:09:24.120' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (83, 70301, 2, CAST(N'2024-09-22T12:09:25.060' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (84, 70302, 2, CAST(N'2024-09-22T12:09:25.640' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (85, 70303, 2, CAST(N'2024-09-22T12:09:26.190' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (86, 80301, 2, CAST(N'2024-09-22T12:09:27.400' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (87, 80302, 2, CAST(N'2024-09-22T12:09:28.097' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (88, 70304, 2, CAST(N'2024-09-22T12:09:45.247' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (89, 70304, 2, CAST(N'2024-09-22T12:09:47.207' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (90, 70304, 2, CAST(N'2024-09-22T12:09:48.473' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (91, 70304, 1, CAST(N'2024-09-22T12:09:49.970' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (92, 70304, 1, CAST(N'2024-09-22T12:09:51.360' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (93, 70303, 1, CAST(N'2024-09-22T12:09:52.663' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (94, 90305, 3, CAST(N'2024-09-22T12:10:25.100' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (95, 90304, 3, CAST(N'2024-09-22T12:10:27.290' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (96, 90302, 3, CAST(N'2024-09-22T12:10:28.423' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (97, 160403, 2, CAST(N'2024-09-22T12:10:43.050' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (98, 160404, 2, CAST(N'2024-09-22T12:10:43.690' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (99, 160603, 2, CAST(N'2024-09-22T12:10:45.040' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (100, 160502, 2, CAST(N'2024-09-22T12:10:45.647' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (101, 160302, 2, CAST(N'2024-09-22T12:10:46.337' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (102, 160203, 2, CAST(N'2024-09-22T12:10:46.977' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (103, 70104, 1, CAST(N'2024-09-22T12:10:50.577' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (104, 70203, 1, CAST(N'2024-09-22T12:10:51.430' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (105, 70202, 1, CAST(N'2024-09-22T12:10:52.777' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (106, 70204, 1, CAST(N'2024-09-22T12:11:13.287' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (107, 70103, 1, CAST(N'2024-09-22T12:11:13.897' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (108, 90302, 2, CAST(N'2024-09-22T12:11:22.127' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (109, 90301, 2, CAST(N'2024-09-22T12:11:24.017' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (110, 90201, 2, CAST(N'2024-09-22T12:11:24.990' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (111, 90101, 2, CAST(N'2024-09-22T12:11:25.660' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (112, 90102, 2, CAST(N'2024-09-22T12:11:26.380' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (113, 90103, 2, CAST(N'2024-09-22T12:11:27.073' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (114, 90203, 2, CAST(N'2024-09-22T12:11:27.810' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (115, 90303, 2, CAST(N'2024-09-22T12:11:28.460' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (116, 90304, 1, CAST(N'2024-09-22T12:11:30.380' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (117, 160701, 2, CAST(N'2024-09-22T12:11:35.627' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (118, 160501, 2, CAST(N'2024-09-22T12:11:36.600' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (119, 160603, 1, CAST(N'2024-09-22T12:11:37.560' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (120, 160301, 2, CAST(N'2024-09-22T12:11:44.267' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (121, 160201, 2, CAST(N'2024-09-22T12:11:45.070' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (122, 160303, 2, CAST(N'2024-09-22T12:11:45.770' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (123, 160103, 2, CAST(N'2024-09-22T12:11:46.483' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (124, 160102, 2, CAST(N'2024-09-22T12:11:47.150' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (125, 160403, 1, CAST(N'2024-09-22T12:11:48.267' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (126, 160404, 1, CAST(N'2024-09-22T12:11:49.007' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (127, 160703, 2, CAST(N'2024-09-22T12:11:51.383' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (128, 160503, 2, CAST(N'2024-09-22T12:11:52.420' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (129, 100401, 2, CAST(N'2024-09-22T12:11:55.683' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (130, 100301, 2, CAST(N'2024-09-22T12:11:57.057' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (131, 100201, 2, CAST(N'2024-09-22T12:11:57.733' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (132, 100501, 2, CAST(N'2024-09-22T12:11:59.457' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (133, 100101, 2, CAST(N'2024-09-22T12:12:00.590' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (134, 100502, 2, CAST(N'2024-09-22T12:12:01.360' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (135, 100503, 2, CAST(N'2024-09-22T12:12:02.307' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (136, 100403, 2, CAST(N'2024-09-22T12:12:03.110' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (137, 100303, 2, CAST(N'2024-09-22T12:12:03.970' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (138, 100202, 2, CAST(N'2024-09-22T12:12:04.963' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (139, 100402, 1, CAST(N'2024-09-22T12:12:07.003' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (140, 100503, 2, CAST(N'2024-09-22T12:12:08.997' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (141, 100302, 2, CAST(N'2024-09-22T12:12:10.057' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (142, 100202, 1, CAST(N'2024-09-22T12:12:11.037' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (143, 100404, 2, CAST(N'2024-09-22T12:12:12.143' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (144, 90305, 2, CAST(N'2024-09-22T12:12:13.417' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (145, 90305, 2, CAST(N'2024-09-22T12:12:16.883' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (146, 90305, 1, CAST(N'2024-09-22T12:12:18.483' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (147, 80301, 1, CAST(N'2024-09-22T12:12:20.247' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (148, 80101, 2, CAST(N'2024-09-22T12:12:22.660' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (149, 80202, 2, CAST(N'2024-09-22T12:12:23.323' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (150, 80302, 1, CAST(N'2024-09-22T12:12:24.190' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (151, 80102, 2, CAST(N'2024-09-22T12:12:24.820' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (152, 80103, 2, CAST(N'2024-09-22T12:12:25.560' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (153, 80102, 1, CAST(N'2024-09-22T12:12:26.667' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (154, 100404, 1, CAST(N'2024-09-22T12:12:28.550' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (155, 70304, 2, CAST(N'2024-09-22T12:12:46.317' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (156, 70303, 2, CAST(N'2024-09-22T12:12:46.930' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (157, 70203, 2, CAST(N'2024-09-22T12:12:47.593' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (158, 70103, 2, CAST(N'2024-09-22T12:12:48.183' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (159, 70104, 2, CAST(N'2024-09-22T12:12:48.760' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (160, 70302, 1, CAST(N'2024-09-22T12:12:49.423' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (161, 70301, 1, CAST(N'2024-09-22T12:12:50.917' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (162, 70201, 1, CAST(N'2024-09-22T12:12:52.057' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (163, 70101, 1, CAST(N'2024-09-22T12:12:53.527' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (164, 70102, 1, CAST(N'2024-09-22T12:12:54.130' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (165, 160703, 1, CAST(N'2024-09-22T12:13:07.537' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (166, 160702, 1, CAST(N'2024-09-22T12:13:08.170' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (167, 160701, 1, CAST(N'2024-09-22T12:13:08.633' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (168, 160601, 1, CAST(N'2024-09-22T12:13:09.363' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (169, 160602, 2, CAST(N'2024-09-22T12:13:12.150' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (170, 160502, 2, CAST(N'2024-09-22T12:13:12.780' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (171, 160502, 2, CAST(N'2024-09-22T12:13:13.967' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (172, 160502, 1, CAST(N'2024-09-22T12:13:15.167' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (173, 160704, 1, CAST(N'2024-09-22T12:13:18.160' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (174, 160704, 2, CAST(N'2024-09-22T12:13:19.533' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (175, 80101, 3, CAST(N'2024-09-22T12:13:55.293' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (176, 80202, 3, CAST(N'2024-09-22T12:13:56.210' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (177, 80102, 3, CAST(N'2024-09-22T12:13:57.930' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (178, 80103, 3, CAST(N'2024-09-22T12:13:58.883' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (179, 80102, 3, CAST(N'2024-09-22T12:14:00.070' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (180, 80103, 3, CAST(N'2024-09-22T12:14:00.790' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (181, 80102, 2, CAST(N'2024-09-22T12:14:03.613' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (182, 80101, 2, CAST(N'2024-09-22T12:14:05.820' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (183, 80202, 2, CAST(N'2024-09-22T12:14:06.510' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (184, 80102, 1, CAST(N'2024-09-22T12:14:08.187' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (185, 80103, 1, CAST(N'2024-09-22T12:14:09.270' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (186, 80202, 1, CAST(N'2024-09-22T12:14:35.020' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (187, 90303, 1, CAST(N'2024-09-22T12:14:47.830' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (188, 90302, 1, CAST(N'2024-09-22T12:14:48.620' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (189, 90301, 1, CAST(N'2024-09-22T12:14:49.267' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (190, 90101, 1, CAST(N'2024-09-22T12:14:50.490' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (191, 90201, 1, CAST(N'2024-09-22T12:14:51.143' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (192, 90103, 1, CAST(N'2024-09-22T12:14:52.480' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (193, 90203, 1, CAST(N'2024-09-22T12:14:53.227' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (194, 90102, 1, CAST(N'2024-09-22T12:14:54.613' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (195, 70304, 1, CAST(N'2024-09-22T12:15:25.313' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (196, 70303, 1, CAST(N'2024-09-22T12:15:26.270' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (197, 90301, 2, CAST(N'2024-09-22T12:15:41.960' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (198, 90302, 3, CAST(N'2024-09-22T12:15:44.520' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (199, 90301, 3, CAST(N'2024-09-22T12:15:45.427' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (200, 90303, 3, CAST(N'2024-09-22T12:15:46.143' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (201, 90304, 3, CAST(N'2024-09-22T12:15:47.023' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (202, 90203, 3, CAST(N'2024-09-22T12:15:48.337' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (203, 90103, 3, CAST(N'2024-09-22T12:15:48.997' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (204, 90305, 3, CAST(N'2024-09-22T12:15:49.723' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (205, 90301, 1, CAST(N'2024-09-22T12:15:53.163' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (206, 90305, 1, CAST(N'2024-09-22T12:15:54.370' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (207, 70303, 2, CAST(N'2024-09-22T12:16:14.503' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (208, 70304, 2, CAST(N'2024-09-22T12:16:15.210' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (209, 90301, 3, CAST(N'2024-09-22T12:21:56.577' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (210, 90305, 2, CAST(N'2024-09-22T12:21:58.767' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (211, 90204, 2, CAST(N'2024-09-22T12:22:02.057' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (212, 90204, 1, CAST(N'2024-09-22T12:22:04.017' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (213, 90304, 1, CAST(N'2024-09-22T12:22:05.937' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (214, 90305, 3, CAST(N'2024-09-22T12:22:08.230' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (215, 90304, 3, CAST(N'2024-09-22T12:22:09.697' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (216, 90202, 3, CAST(N'2024-09-22T12:22:12.727' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (217, 90204, 2, CAST(N'2024-09-22T12:26:44.070' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (218, 90205, 3, CAST(N'2024-09-22T12:26:46.500' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (219, 90205, 1, CAST(N'2024-09-22T12:26:48.640' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (220, 90205, 2, CAST(N'2024-09-22T12:26:52.120' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (221, 90204, 1, CAST(N'2024-09-22T12:26:54.240' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (222, 90204, 2, CAST(N'2024-09-22T12:28:19.227' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (223, 90201, 3, CAST(N'2024-09-22T12:28:27.780' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (224, 90204, 3, CAST(N'2024-09-22T12:28:32.700' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (225, 90205, 3, CAST(N'2024-09-22T12:28:34.597' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (226, 90103, 1, CAST(N'2024-09-22T12:28:38.470' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (227, 90303, 1, CAST(N'2024-09-22T12:28:43.203' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (228, 90303, 2, CAST(N'2024-09-22T12:30:26.807' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (229, 90303, 1, CAST(N'2024-09-22T12:30:29.153' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (230, 90303, 2, CAST(N'2024-09-22T12:30:33.290' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (231, 90303, 1, CAST(N'2024-09-22T12:30:44.337' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (232, 90303, 2, CAST(N'2024-09-22T12:31:00.123' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (233, 90302, 2, CAST(N'2024-09-22T12:31:07.437' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (234, 90304, 1, CAST(N'2024-09-22T12:31:26.783' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (235, 90102, 3, CAST(N'2024-09-22T12:32:14.920' AS DateTime))
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time]) VALUES (236, 90104, 2, CAST(N'2024-09-22T12:32:19.270' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[History] OFF
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70101, 7, N'A7-101', 1, CAST(N'2024-09-22T12:12:53.527' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70102, 7, N'A7-102', 1, CAST(N'2024-09-22T12:12:54.130' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70103, 7, N'A7-103', 2, CAST(N'2024-09-22T12:12:48.183' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70104, 7, N'A7-104', 2, CAST(N'2024-09-22T12:12:48.760' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70201, 7, N'A7-201', 1, CAST(N'2024-09-22T12:12:52.057' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70202, 7, N'A7-202', 1, CAST(N'2024-09-22T12:10:52.777' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70203, 7, N'A7-203', 2, CAST(N'2024-09-22T12:12:47.593' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70204, 7, N'A7-204', 1, CAST(N'2024-09-22T12:11:13.287' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70301, 7, N'A7-301', 1, CAST(N'2024-09-22T12:12:50.917' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70302, 7, N'A7-302', 1, CAST(N'2024-09-22T12:12:49.423' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70303, 7, N'A7-303', 2, CAST(N'2024-09-22T12:16:14.503' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (70304, 7, N'A7-304', 2, CAST(N'2024-09-22T12:16:15.210' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80101, 8, N'A8-101', 2, CAST(N'2024-09-22T12:14:05.820' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80102, 8, N'A8-102', 1, CAST(N'2024-09-22T12:14:08.187' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80103, 8, N'A8-103', 1, CAST(N'2024-09-22T12:14:09.270' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80104, 8, N'A8-104', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80201, 8, N'A8-201', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80202, 8, N'A8-202', 1, CAST(N'2024-09-22T12:14:35.020' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80203, 8, N'A8-203', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80204, 8, N'A8-204', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80301, 8, N'A8-301', 1, CAST(N'2024-09-22T12:12:20.247' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80302, 8, N'A8-302', 1, CAST(N'2024-09-22T12:12:24.190' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80303, 8, N'A8-303', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (80304, 8, N'A8-304', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90101, 9, N'A9-101', 1, CAST(N'2024-09-22T12:14:50.490' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90102, 9, N'A9-102', 3, CAST(N'2024-09-22T12:32:14.920' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90103, 9, N'A9-103', 1, CAST(N'2024-09-22T12:28:38.470' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90104, 9, N'A9-104', 2, CAST(N'2024-09-22T12:32:19.270' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90105, 9, N'A9-105', 1, CAST(N'2024-09-22T10:00:23.613' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90201, 9, N'A9-201', 3, CAST(N'2024-09-22T12:28:27.780' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90202, 9, N'A9-202', 3, CAST(N'2024-09-22T12:22:12.727' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90203, 9, N'A9-203', 3, CAST(N'2024-09-22T12:15:48.337' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90204, 9, N'A9-204', 3, CAST(N'2024-09-22T12:28:32.700' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90205, 9, N'A9-205', 3, CAST(N'2024-09-22T12:28:34.597' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90301, 9, N'A9-301', 3, CAST(N'2024-09-22T12:21:56.577' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90302, 9, N'A9-302', 2, CAST(N'2024-09-22T12:31:07.437' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90303, 9, N'A9-303', 2, CAST(N'2024-09-22T12:31:00.123' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90304, 9, N'A9-304', 1, CAST(N'2024-09-22T12:31:26.783' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (90305, 9, N'A9-305', 3, CAST(N'2024-09-22T12:22:08.230' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100101, 10, N'A10-101', 2, CAST(N'2024-09-22T12:12:00.590' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100102, 10, N'A10-102', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100103, 10, N'A10-103', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100104, 10, N'A10-104', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100105, 10, N'A10-105', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100201, 10, N'A10-201', 2, CAST(N'2024-09-22T12:11:57.733' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100202, 10, N'A10-202', 1, CAST(N'2024-09-22T12:12:11.037' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100203, 10, N'A10-203', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100204, 10, N'A10-204', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100205, 10, N'A10-205', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100301, 10, N'A10-301', 2, CAST(N'2024-09-22T12:11:57.057' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100302, 10, N'A10-302', 2, CAST(N'2024-09-22T12:12:10.057' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100303, 10, N'A10-303', 2, CAST(N'2024-09-22T12:12:03.970' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100304, 10, N'A10-304', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100305, 10, N'A10-305', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100401, 10, N'A10-401', 2, CAST(N'2024-09-22T12:11:55.683' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100402, 10, N'A10-402', 1, CAST(N'2024-09-22T12:12:07.003' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100403, 10, N'A10-403', 2, CAST(N'2024-09-22T12:12:03.110' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100404, 10, N'A10-404', 1, CAST(N'2024-09-22T12:12:28.550' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100405, 10, N'A10-405', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100501, 10, N'A10-501', 2, CAST(N'2024-09-22T12:11:59.457' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100502, 10, N'A10-502', 2, CAST(N'2024-09-22T12:12:01.360' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100503, 10, N'A10-503', 2, CAST(N'2024-09-22T12:12:08.997' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100504, 10, N'A10-504', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (100505, 10, N'A10-505', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160101, 16, N'A16-101', 2, CAST(N'2024-09-22T10:01:42.657' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160102, 16, N'A16-102', 2, CAST(N'2024-09-22T12:11:47.150' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160103, 16, N'A16-103', 2, CAST(N'2024-09-22T12:11:46.483' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160104, 16, N'A16-104', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160105, 16, N'A16-105', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160201, 16, N'A16-201', 2, CAST(N'2024-09-22T12:11:45.070' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160202, 16, N'A16-202', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160203, 16, N'A16-203', 2, CAST(N'2024-09-22T12:10:46.977' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160204, 16, N'A16-204', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160205, 16, N'A16-205', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160301, 16, N'A16-301', 2, CAST(N'2024-09-22T12:11:44.267' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160302, 16, N'A16-302', 2, CAST(N'2024-09-22T12:10:46.337' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160303, 16, N'A16-303', 2, CAST(N'2024-09-22T12:11:45.770' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160304, 16, N'A16-304', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160305, 16, N'A16-305', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160401, 16, N'A16-401', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160402, 16, N'A16-402', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160403, 16, N'A16-403', 1, CAST(N'2024-09-22T12:11:48.267' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160404, 16, N'A16-404', 1, CAST(N'2024-09-22T12:11:49.007' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160405, 16, N'A16-405', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160501, 16, N'A16-501', 2, CAST(N'2024-09-22T12:11:36.600' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160502, 16, N'A16-502', 1, CAST(N'2024-09-22T12:13:15.167' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160503, 16, N'A16-503', 2, CAST(N'2024-09-22T12:11:52.420' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160504, 16, N'A16-504', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160505, 16, N'A16-505', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160601, 16, N'A16-601', 1, CAST(N'2024-09-22T12:13:09.363' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160602, 16, N'A16-602', 2, CAST(N'2024-09-22T12:13:12.150' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160603, 16, N'A16-603', 1, CAST(N'2024-09-22T12:11:37.560' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160604, 16, N'A16-604', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160605, 16, N'A16-605', 1, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160701, 16, N'A16-701', 1, CAST(N'2024-09-22T12:13:08.633' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160702, 16, N'A16-702', 1, CAST(N'2024-09-22T12:13:08.170' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160703, 16, N'A16-703', 1, CAST(N'2024-09-22T12:13:07.537' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160704, 16, N'A16-704', 2, CAST(N'2024-09-22T12:13:19.533' AS DateTime))
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time]) VALUES (160705, 16, N'A16-705', 1, NULL)
GO
INSERT [dbo].[Status] ([id], [name]) VALUES (1, N'Phòng trống')
GO
INSERT [dbo].[Status] ([id], [name]) VALUES (2, N'Đang học')
GO
INSERT [dbo].[Status] ([id], [name]) VALUES (3, N'Sửa chữa')
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF_History_time]  DEFAULT (getdate()) FOR [time]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_phong] FOREIGN KEY([idPhong])
REFERENCES [dbo].[phong] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_phong]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Status]
GO
ALTER TABLE [dbo].[phong]  WITH CHECK ADD  CONSTRAINT [FK_phong_day_nha] FOREIGN KEY([idDay])
REFERENCES [dbo].[day_nha] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[phong] CHECK CONSTRAINT [FK_phong_day_nha]
GO
ALTER TABLE [dbo].[phong]  WITH CHECK ADD  CONSTRAINT [FK_phong_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[phong] CHECK CONSTRAINT [FK_phong_Status]
GO
/****** Object:  StoredProcedure [dbo].[SP_API]    Script Date: 2024-09-22 16:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		do duy cop
-- Create date: 21.9.2024
-- Description:	tnut monitor classroom
-- =============================================
CREATE PROCEDURE [dbo].[SP_API]
	@action		varchar(50) = 'get_all_status',
	@idDay		int = null,
	@idPhong	int = null,
	@status		int = null
AS
BEGIN
	declare @json nvarchar(max);

	if(@action = 'get_status')
	begin
		select @json = (
			select 
				1 as [ok], 
				'ok get_status' as [msg],
				@idDay as [idDay],
				(	select [id], [name], [status], [time]
					from [phong]
					where [idDay] = @idDay
					order by [id]
					for json path
				) as [data]
				for json path, without_array_wrapper
			);

		select @json as [json];
	end;
	else if(@action = 'get_all_status')
	begin
		select @json = (
			select 
				1 as [ok], 
				'ok get_all_status' as [msg],
				@idDay as [idDay],
				(	select [id], [name], [status], [time]
					from [phong]
					--where [idDay] = @idDay
					order by [id]
					for json path
				) as [data]
				for json path, without_array_wrapper
			);

		select @json as [json];
	end;
	else if(@action ='get_history')
	begin		
		select @json = (
			select 
				1 as [ok], 
				'ok get_history' as [msg],
				@idPhong as [idPhong],
				(	select top 100 
						[status],
						convert(varchar(19), [time], 120) as [time]
					from [History]
					where [idPhong] = @idPhong
					order by [id] desc
					for json path
				) as [data]
				for json path, without_array_wrapper
			);

		select @json as [json];
	end;
	else if(@action = 'change_status')
	begin
		declare @now datetime = getdate();
		
		update Phong set [status] = @status, [time] = @now where id = @idPhong;
		
		insert into History([idPhong], [status], [time]) values(@idPhong, @status, @now);

		select @json = (
			select 
				1 as [ok], 
				'ok change_status' as [msg],
				[id], 
				[name],
				[status],
				convert(varchar(19), [time], 120) as [time]
			from [Phong]
			where [id] = @idPhong
			for json path, without_array_wrapper
		);

		select @json as [json];
	end;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'đây chỉ là id status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'status'
GO
USE [master]
GO
ALTER DATABASE [tnut-monitor] SET  READ_WRITE 
GO
