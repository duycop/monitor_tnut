USE [master]
GO
/****** Object:  Database [tnut-monitor]    Script Date: 2024-10-02 14:34:15 ******/
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
/****** Object:  Table [dbo].[day_nha]    Script Date: 2024-10-02 14:34:15 ******/
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
/****** Object:  Table [dbo].[History]    Script Date: 2024-10-02 14:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPhong] [int] NULL,
	[status] [int] NULL,
	[time] [datetime] NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2024-10-02 14:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[key] [nvarchar](50) NULL,
	[msg] [nvarchar](max) NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phong]    Script Date: 2024-10-02 14:34:15 ******/
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
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_phong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 2024-10-02 14:34:15 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2024-10-02 14:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[uid] [varchar](50) NOT NULL,
	[pwd] [varbinary](20) NULL,
	[name] [nvarchar](50) NULL,
	[role] [int] NULL,
	[lastLogin] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2024-10-02 14:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[id] [int] NOT NULL,
	[roleName] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
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
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (1, 70101, 1, CAST(N'2024-09-22T08:15:54.810' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (2, 70101, 2, CAST(N'2024-09-22T08:15:59.677' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (3, 70101, 3, CAST(N'2024-09-22T08:16:02.740' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (4, 70101, 1, CAST(N'2024-09-22T08:16:04.840' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (5, 70102, 3, CAST(N'2024-09-22T09:17:19.713' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (6, 70102, 3, CAST(N'2024-09-22T09:17:23.453' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (7, 70102, 3, CAST(N'2024-09-22T09:18:15.847' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (8, 70102, 2, CAST(N'2024-09-22T09:18:51.427' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (9, 70102, 1, CAST(N'2024-09-22T09:18:54.300' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (10, 70102, 2, CAST(N'2024-09-22T09:18:56.023' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (11, 70102, 1, CAST(N'2024-09-22T09:18:57.530' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (12, 70102, 2, CAST(N'2024-09-22T09:18:59.637' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (13, 70102, 2, CAST(N'2024-09-22T09:19:04.223' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (14, 70102, 2, CAST(N'2024-09-22T09:19:06.017' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (15, 70102, 1, CAST(N'2024-09-22T09:19:07.613' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (16, 70102, 3, CAST(N'2024-09-22T09:20:57.080' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (17, 70102, 1, CAST(N'2024-09-22T09:21:00.763' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (18, 70102, 3, CAST(N'2024-09-22T09:21:03.603' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (19, 70102, 2, CAST(N'2024-09-22T09:21:06.080' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (20, 70104, 3, CAST(N'2024-09-22T09:21:08.513' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (21, 70104, 1, CAST(N'2024-09-22T09:21:10.510' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (22, 70104, 3, CAST(N'2024-09-22T09:21:12.340' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (23, 70104, 2, CAST(N'2024-09-22T09:21:14.547' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (24, 70104, 1, CAST(N'2024-09-22T09:21:16.573' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (25, 160701, 3, CAST(N'2024-09-22T09:22:32.120' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (26, 160702, 2, CAST(N'2024-09-22T09:22:34.080' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (27, 160601, 3, CAST(N'2024-09-22T09:22:37.880' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (28, 160601, 2, CAST(N'2024-09-22T09:22:41.613' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (29, 160601, 1, CAST(N'2024-09-22T09:22:44.817' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (30, 160601, 2, CAST(N'2024-09-22T09:22:49.603' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (31, 160701, 2, CAST(N'2024-09-22T09:23:27.113' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (32, 160701, 1, CAST(N'2024-09-22T09:23:29.040' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (33, 160102, 3, CAST(N'2024-09-22T09:23:31.367' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (34, 160102, 1, CAST(N'2024-09-22T09:23:33.827' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (35, 90205, 3, CAST(N'2024-09-22T09:31:58.317' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (36, 90205, 1, CAST(N'2024-09-22T09:32:00.440' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (37, 90205, 3, CAST(N'2024-09-22T09:32:02.240' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (38, 90205, 1, CAST(N'2024-09-22T09:32:05.357' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (39, 70104, 2, CAST(N'2024-09-22T09:50:59.447' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (40, 70104, 3, CAST(N'2024-09-22T09:51:01.033' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (41, 70104, 2, CAST(N'2024-09-22T09:56:33.310' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (42, 70104, 3, CAST(N'2024-09-22T09:58:28.140' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (43, 70104, 1, CAST(N'2024-09-22T09:58:32.540' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (44, 70101, 3, CAST(N'2024-09-22T09:58:35.830' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (45, 70102, 3, CAST(N'2024-09-22T09:58:37.663' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (46, 70103, 3, CAST(N'2024-09-22T09:58:39.223' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (47, 70101, 2, CAST(N'2024-09-22T09:58:43.547' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (48, 70102, 2, CAST(N'2024-09-22T09:58:45.667' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (49, 70104, 2, CAST(N'2024-09-22T09:59:19.660' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (50, 70104, 3, CAST(N'2024-09-22T09:59:46.553' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (51, 90105, 1, CAST(N'2024-09-22T10:00:23.613' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (52, 70104, 1, CAST(N'2024-09-22T10:00:37.100' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (53, 70104, 2, CAST(N'2024-09-22T10:00:48.650' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (54, 70103, 2, CAST(N'2024-09-22T10:01:18.513' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (55, 70104, 1, CAST(N'2024-09-22T10:01:21.123' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (56, 70103, 3, CAST(N'2024-09-22T10:01:26.147' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (57, 70104, 3, CAST(N'2024-09-22T10:01:28.973' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (58, 70103, 2, CAST(N'2024-09-22T10:01:31.373' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (59, 70104, 2, CAST(N'2024-09-22T10:01:32.923' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (60, 160101, 2, CAST(N'2024-09-22T10:01:42.657' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (61, 160201, 3, CAST(N'2024-09-22T10:01:46.530' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (62, 80101, 3, CAST(N'2024-09-22T10:01:48.910' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (63, 80202, 3, CAST(N'2024-09-22T10:01:50.650' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (64, 80301, 3, CAST(N'2024-09-22T10:01:52.247' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (65, 80202, 2, CAST(N'2024-09-22T10:02:21.133' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (66, 100401, 3, CAST(N'2024-09-22T10:02:48.553' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (67, 100402, 2, CAST(N'2024-09-22T10:02:50.213' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (68, 80102, 2, CAST(N'2024-09-22T10:03:05.250' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (69, 80103, 2, CAST(N'2024-09-22T10:03:07.027' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (70, 100403, 2, CAST(N'2024-09-22T10:03:08.383' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (71, 100404, 2, CAST(N'2024-09-22T10:03:09.750' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (72, 100404, 1, CAST(N'2024-09-22T10:03:12.697' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (73, 100404, 3, CAST(N'2024-09-22T10:03:17.287' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (74, 100403, 1, CAST(N'2024-09-22T10:03:18.933' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (75, 80202, 1, CAST(N'2024-09-22T10:03:26.987' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (76, 80301, 2, CAST(N'2024-09-22T10:03:29.803' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (77, 80301, 1, CAST(N'2024-09-22T10:19:33.780' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (78, 80103, 3, CAST(N'2024-09-22T10:19:35.707' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (79, 70204, 2, CAST(N'2024-09-22T12:09:21.320' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (80, 70203, 2, CAST(N'2024-09-22T12:09:22.513' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (81, 70202, 2, CAST(N'2024-09-22T12:09:23.227' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (82, 70201, 2, CAST(N'2024-09-22T12:09:24.120' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (83, 70301, 2, CAST(N'2024-09-22T12:09:25.060' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (84, 70302, 2, CAST(N'2024-09-22T12:09:25.640' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (85, 70303, 2, CAST(N'2024-09-22T12:09:26.190' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (86, 80301, 2, CAST(N'2024-09-22T12:09:27.400' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (87, 80302, 2, CAST(N'2024-09-22T12:09:28.097' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (88, 70304, 2, CAST(N'2024-09-22T12:09:45.247' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (89, 70304, 2, CAST(N'2024-09-22T12:09:47.207' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (90, 70304, 2, CAST(N'2024-09-22T12:09:48.473' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (91, 70304, 1, CAST(N'2024-09-22T12:09:49.970' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (92, 70304, 1, CAST(N'2024-09-22T12:09:51.360' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (93, 70303, 1, CAST(N'2024-09-22T12:09:52.663' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (94, 90305, 3, CAST(N'2024-09-22T12:10:25.100' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (95, 90304, 3, CAST(N'2024-09-22T12:10:27.290' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (96, 90302, 3, CAST(N'2024-09-22T12:10:28.423' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (97, 160403, 2, CAST(N'2024-09-22T12:10:43.050' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (98, 160404, 2, CAST(N'2024-09-22T12:10:43.690' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (99, 160603, 2, CAST(N'2024-09-22T12:10:45.040' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (100, 160502, 2, CAST(N'2024-09-22T12:10:45.647' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (101, 160302, 2, CAST(N'2024-09-22T12:10:46.337' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (102, 160203, 2, CAST(N'2024-09-22T12:10:46.977' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (103, 70104, 1, CAST(N'2024-09-22T12:10:50.577' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (104, 70203, 1, CAST(N'2024-09-22T12:10:51.430' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (105, 70202, 1, CAST(N'2024-09-22T12:10:52.777' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (106, 70204, 1, CAST(N'2024-09-22T12:11:13.287' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (107, 70103, 1, CAST(N'2024-09-22T12:11:13.897' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (108, 90302, 2, CAST(N'2024-09-22T12:11:22.127' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (109, 90301, 2, CAST(N'2024-09-22T12:11:24.017' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (110, 90201, 2, CAST(N'2024-09-22T12:11:24.990' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (111, 90101, 2, CAST(N'2024-09-22T12:11:25.660' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (112, 90102, 2, CAST(N'2024-09-22T12:11:26.380' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (113, 90103, 2, CAST(N'2024-09-22T12:11:27.073' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (114, 90203, 2, CAST(N'2024-09-22T12:11:27.810' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (115, 90303, 2, CAST(N'2024-09-22T12:11:28.460' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (116, 90304, 1, CAST(N'2024-09-22T12:11:30.380' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (117, 160701, 2, CAST(N'2024-09-22T12:11:35.627' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (118, 160501, 2, CAST(N'2024-09-22T12:11:36.600' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (119, 160603, 1, CAST(N'2024-09-22T12:11:37.560' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (120, 160301, 2, CAST(N'2024-09-22T12:11:44.267' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (121, 160201, 2, CAST(N'2024-09-22T12:11:45.070' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (122, 160303, 2, CAST(N'2024-09-22T12:11:45.770' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (123, 160103, 2, CAST(N'2024-09-22T12:11:46.483' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (124, 160102, 2, CAST(N'2024-09-22T12:11:47.150' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (125, 160403, 1, CAST(N'2024-09-22T12:11:48.267' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (126, 160404, 1, CAST(N'2024-09-22T12:11:49.007' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (127, 160703, 2, CAST(N'2024-09-22T12:11:51.383' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (128, 160503, 2, CAST(N'2024-09-22T12:11:52.420' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (129, 100401, 2, CAST(N'2024-09-22T12:11:55.683' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (130, 100301, 2, CAST(N'2024-09-22T12:11:57.057' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (131, 100201, 2, CAST(N'2024-09-22T12:11:57.733' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (132, 100501, 2, CAST(N'2024-09-22T12:11:59.457' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (133, 100101, 2, CAST(N'2024-09-22T12:12:00.590' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (134, 100502, 2, CAST(N'2024-09-22T12:12:01.360' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (135, 100503, 2, CAST(N'2024-09-22T12:12:02.307' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (136, 100403, 2, CAST(N'2024-09-22T12:12:03.110' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (137, 100303, 2, CAST(N'2024-09-22T12:12:03.970' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (138, 100202, 2, CAST(N'2024-09-22T12:12:04.963' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (139, 100402, 1, CAST(N'2024-09-22T12:12:07.003' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (140, 100503, 2, CAST(N'2024-09-22T12:12:08.997' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (141, 100302, 2, CAST(N'2024-09-22T12:12:10.057' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (142, 100202, 1, CAST(N'2024-09-22T12:12:11.037' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (143, 100404, 2, CAST(N'2024-09-22T12:12:12.143' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (144, 90305, 2, CAST(N'2024-09-22T12:12:13.417' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (145, 90305, 2, CAST(N'2024-09-22T12:12:16.883' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (146, 90305, 1, CAST(N'2024-09-22T12:12:18.483' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (147, 80301, 1, CAST(N'2024-09-22T12:12:20.247' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (148, 80101, 2, CAST(N'2024-09-22T12:12:22.660' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (149, 80202, 2, CAST(N'2024-09-22T12:12:23.323' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (150, 80302, 1, CAST(N'2024-09-22T12:12:24.190' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (151, 80102, 2, CAST(N'2024-09-22T12:12:24.820' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (152, 80103, 2, CAST(N'2024-09-22T12:12:25.560' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (153, 80102, 1, CAST(N'2024-09-22T12:12:26.667' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (154, 100404, 1, CAST(N'2024-09-22T12:12:28.550' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (155, 70304, 2, CAST(N'2024-09-22T12:12:46.317' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (156, 70303, 2, CAST(N'2024-09-22T12:12:46.930' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (157, 70203, 2, CAST(N'2024-09-22T12:12:47.593' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (158, 70103, 2, CAST(N'2024-09-22T12:12:48.183' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (159, 70104, 2, CAST(N'2024-09-22T12:12:48.760' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (160, 70302, 1, CAST(N'2024-09-22T12:12:49.423' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (161, 70301, 1, CAST(N'2024-09-22T12:12:50.917' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (162, 70201, 1, CAST(N'2024-09-22T12:12:52.057' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (163, 70101, 1, CAST(N'2024-09-22T12:12:53.527' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (164, 70102, 1, CAST(N'2024-09-22T12:12:54.130' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (165, 160703, 1, CAST(N'2024-09-22T12:13:07.537' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (166, 160702, 1, CAST(N'2024-09-22T12:13:08.170' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (167, 160701, 1, CAST(N'2024-09-22T12:13:08.633' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (168, 160601, 1, CAST(N'2024-09-22T12:13:09.363' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (169, 160602, 2, CAST(N'2024-09-22T12:13:12.150' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (170, 160502, 2, CAST(N'2024-09-22T12:13:12.780' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (171, 160502, 2, CAST(N'2024-09-22T12:13:13.967' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (172, 160502, 1, CAST(N'2024-09-22T12:13:15.167' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (173, 160704, 1, CAST(N'2024-09-22T12:13:18.160' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (174, 160704, 2, CAST(N'2024-09-22T12:13:19.533' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (175, 80101, 3, CAST(N'2024-09-22T12:13:55.293' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (176, 80202, 3, CAST(N'2024-09-22T12:13:56.210' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (177, 80102, 3, CAST(N'2024-09-22T12:13:57.930' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (178, 80103, 3, CAST(N'2024-09-22T12:13:58.883' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (179, 80102, 3, CAST(N'2024-09-22T12:14:00.070' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (180, 80103, 3, CAST(N'2024-09-22T12:14:00.790' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (181, 80102, 2, CAST(N'2024-09-22T12:14:03.613' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (182, 80101, 2, CAST(N'2024-09-22T12:14:05.820' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (183, 80202, 2, CAST(N'2024-09-22T12:14:06.510' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (184, 80102, 1, CAST(N'2024-09-22T12:14:08.187' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (185, 80103, 1, CAST(N'2024-09-22T12:14:09.270' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (186, 80202, 1, CAST(N'2024-09-22T12:14:35.020' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (187, 90303, 1, CAST(N'2024-09-22T12:14:47.830' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (188, 90302, 1, CAST(N'2024-09-22T12:14:48.620' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (189, 90301, 1, CAST(N'2024-09-22T12:14:49.267' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (190, 90101, 1, CAST(N'2024-09-22T12:14:50.490' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (191, 90201, 1, CAST(N'2024-09-22T12:14:51.143' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (192, 90103, 1, CAST(N'2024-09-22T12:14:52.480' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (193, 90203, 1, CAST(N'2024-09-22T12:14:53.227' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (194, 90102, 1, CAST(N'2024-09-22T12:14:54.613' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (195, 70304, 1, CAST(N'2024-09-22T12:15:25.313' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (196, 70303, 1, CAST(N'2024-09-22T12:15:26.270' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (197, 90301, 2, CAST(N'2024-09-22T12:15:41.960' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (198, 90302, 3, CAST(N'2024-09-22T12:15:44.520' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (199, 90301, 3, CAST(N'2024-09-22T12:15:45.427' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (200, 90303, 3, CAST(N'2024-09-22T12:15:46.143' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (201, 90304, 3, CAST(N'2024-09-22T12:15:47.023' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (202, 90203, 3, CAST(N'2024-09-22T12:15:48.337' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (203, 90103, 3, CAST(N'2024-09-22T12:15:48.997' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (204, 90305, 3, CAST(N'2024-09-22T12:15:49.723' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (205, 90301, 1, CAST(N'2024-09-22T12:15:53.163' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (206, 90305, 1, CAST(N'2024-09-22T12:15:54.370' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (207, 70303, 2, CAST(N'2024-09-22T12:16:14.503' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (208, 70304, 2, CAST(N'2024-09-22T12:16:15.210' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (209, 90301, 3, CAST(N'2024-09-22T12:21:56.577' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (210, 90305, 2, CAST(N'2024-09-22T12:21:58.767' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (211, 90204, 2, CAST(N'2024-09-22T12:22:02.057' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (212, 90204, 1, CAST(N'2024-09-22T12:22:04.017' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (213, 90304, 1, CAST(N'2024-09-22T12:22:05.937' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (214, 90305, 3, CAST(N'2024-09-22T12:22:08.230' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (215, 90304, 3, CAST(N'2024-09-22T12:22:09.697' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (216, 90202, 3, CAST(N'2024-09-22T12:22:12.727' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (217, 90204, 2, CAST(N'2024-09-22T12:26:44.070' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (218, 90205, 3, CAST(N'2024-09-22T12:26:46.500' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (219, 90205, 1, CAST(N'2024-09-22T12:26:48.640' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (220, 90205, 2, CAST(N'2024-09-22T12:26:52.120' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (221, 90204, 1, CAST(N'2024-09-22T12:26:54.240' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (222, 90204, 2, CAST(N'2024-09-22T12:28:19.227' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (223, 90201, 3, CAST(N'2024-09-22T12:28:27.780' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (224, 90204, 3, CAST(N'2024-09-22T12:28:32.700' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (225, 90205, 3, CAST(N'2024-09-22T12:28:34.597' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (226, 90103, 1, CAST(N'2024-09-22T12:28:38.470' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (227, 90303, 1, CAST(N'2024-09-22T12:28:43.203' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (228, 90303, 2, CAST(N'2024-09-22T12:30:26.807' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (229, 90303, 1, CAST(N'2024-09-22T12:30:29.153' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (230, 90303, 2, CAST(N'2024-09-22T12:30:33.290' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (231, 90303, 1, CAST(N'2024-09-22T12:30:44.337' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (232, 90303, 2, CAST(N'2024-09-22T12:31:00.123' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (233, 90302, 2, CAST(N'2024-09-22T12:31:07.437' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (234, 90304, 1, CAST(N'2024-09-22T12:31:26.783' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (235, 90102, 3, CAST(N'2024-09-22T12:32:14.920' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (236, 90104, 2, CAST(N'2024-09-22T12:32:19.270' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (237, 90304, 2, CAST(N'2024-09-22T16:08:08.947' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (238, 90104, 3, CAST(N'2024-09-22T16:08:10.730' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (239, 160202, 3, CAST(N'2024-09-22T16:08:24.627' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (240, 100402, 2, CAST(N'2024-09-22T16:08:27.057' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (241, 100402, 1, CAST(N'2024-09-22T16:08:30.597' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (242, 90104, 2, CAST(N'2024-09-25T10:44:41.040' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (243, 90104, 1, CAST(N'2024-09-25T10:44:45.850' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (244, 90104, 3, CAST(N'2024-09-25T10:44:49.427' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (245, 90104, 1, CAST(N'2024-09-25T10:44:51.897' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (246, 90104, 3, CAST(N'2024-09-25T10:44:57.780' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (247, 90104, 1, CAST(N'2024-09-25T10:45:00.520' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (248, 90104, 3, CAST(N'2024-09-25T10:45:03.717' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (249, 90103, 3, CAST(N'2024-09-25T11:03:37.550' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (250, 90103, 1, CAST(N'2024-09-25T11:03:39.300' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (251, 80102, 3, CAST(N'2024-09-25T11:03:45.080' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (252, 80103, 2, CAST(N'2024-09-25T11:03:47.203' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (253, 80102, 1, CAST(N'2024-09-25T11:03:49.947' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (254, 80103, 1, CAST(N'2024-09-25T11:03:52.067' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (255, 80103, 3, CAST(N'2024-09-26T07:42:56.607' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (256, 80103, 2, CAST(N'2024-09-26T07:42:59.420' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (257, 80103, 1, CAST(N'2024-09-26T07:43:01.560' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (258, 80103, 3, CAST(N'2024-09-26T07:43:05.380' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (259, 80103, 1, CAST(N'2024-09-26T07:43:07.523' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (260, 80103, 3, CAST(N'2024-09-26T07:43:30.213' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (261, 80102, 3, CAST(N'2024-09-26T08:39:54.720' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (262, 80102, 1, CAST(N'2024-09-26T08:40:00.027' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (263, 70301, 2, CAST(N'2024-09-26T08:45:57.443' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (264, 70302, 3, CAST(N'2024-09-26T08:46:03.150' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (265, 70302, 2, CAST(N'2024-09-26T08:46:05.427' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (266, 70201, 3, CAST(N'2024-09-26T08:46:10.760' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (267, 70201, 2, CAST(N'2024-09-26T08:46:28.303' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (268, 70101, 3, CAST(N'2024-09-26T08:50:49.587' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (269, 70102, 3, CAST(N'2024-09-26T08:52:30.230' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (270, 70102, 2, CAST(N'2024-09-26T08:52:36.450' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (271, 80102, 2, CAST(N'2024-09-26T08:54:08.297' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (272, 80102, 1, CAST(N'2024-09-26T08:54:10.177' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (273, 80101, 3, CAST(N'2024-09-26T08:54:59.947' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (274, 70204, 3, CAST(N'2024-09-26T08:57:30.923' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (275, 70204, 2, CAST(N'2024-09-26T08:57:32.957' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (276, 80101, 2, CAST(N'2024-09-26T08:59:14.023' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (277, 70202, 3, CAST(N'2024-09-26T09:04:41.887' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (278, 70202, 2, CAST(N'2024-09-26T09:04:45.997' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (279, 70202, 1, CAST(N'2024-09-26T09:04:48.207' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (280, 70202, 3, CAST(N'2024-09-26T09:04:53.387' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (281, 70202, 1, CAST(N'2024-09-26T09:07:41.160' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (282, 70101, 1, CAST(N'2024-09-26T09:07:44.140' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (283, 80301, 3, CAST(N'2024-09-26T22:11:15.960' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (284, 80302, 3, CAST(N'2024-09-26T22:11:20.637' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (285, 80303, 3, CAST(N'2024-09-26T22:11:23.910' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (286, 80304, 3, CAST(N'2024-09-26T22:11:28.087' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (287, 80304, 2, CAST(N'2024-09-26T22:11:29.230' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (288, 80304, 1, CAST(N'2024-09-26T22:11:30.450' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (289, 80304, 3, CAST(N'2024-09-26T22:11:31.223' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (290, 80304, 1, CAST(N'2024-09-26T22:11:32.050' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (291, 70101, 3, CAST(N'2024-09-26T22:25:10.003' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (292, 70101, 1, CAST(N'2024-09-26T22:25:12.407' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (293, 70202, 3, CAST(N'2024-09-26T22:25:54.243' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (294, 70202, 2, CAST(N'2024-09-26T22:25:55.437' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (295, 70202, 3, CAST(N'2024-09-26T22:25:56.430' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (296, 70202, 2, CAST(N'2024-09-26T22:25:57.433' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (297, 70202, 3, CAST(N'2024-09-26T22:25:58.270' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (298, 70202, 2, CAST(N'2024-09-26T22:25:58.730' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (299, 70202, 3, CAST(N'2024-09-26T22:25:59.363' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (300, 70202, 2, CAST(N'2024-09-26T22:25:59.750' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (301, 70202, 3, CAST(N'2024-09-26T22:26:01.657' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (302, 70202, 2, CAST(N'2024-09-26T22:26:02.600' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (303, 70202, 3, CAST(N'2024-09-26T22:26:03.273' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (304, 70202, 2, CAST(N'2024-09-26T22:26:03.743' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (305, 70202, 3, CAST(N'2024-09-26T22:26:04.203' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (306, 70202, 2, CAST(N'2024-09-26T22:26:04.730' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (307, 70202, 3, CAST(N'2024-09-26T22:26:05.207' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (308, 70202, 2, CAST(N'2024-09-26T22:26:05.737' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (309, 70202, 3, CAST(N'2024-09-26T22:26:06.273' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (310, 70101, 3, CAST(N'2024-09-26T22:26:40.433' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (311, 70101, 2, CAST(N'2024-09-26T22:26:41.493' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (312, 70101, 3, CAST(N'2024-09-26T22:26:42.503' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (313, 70202, 1, CAST(N'2024-09-26T22:26:59.413' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (314, 70202, 2, CAST(N'2024-09-26T22:27:00.067' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (315, 70202, 1, CAST(N'2024-09-26T22:27:00.600' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (316, 80102, 3, CAST(N'2024-09-26T22:48:46.920' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (317, 80102, 2, CAST(N'2024-09-26T22:48:47.717' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (318, 80102, 3, CAST(N'2024-09-26T22:48:48.170' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (319, 70101, 2, CAST(N'2024-09-26T22:48:55.490' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (320, 70101, 1, CAST(N'2024-09-26T22:48:56.317' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (321, 70101, 2, CAST(N'2024-09-26T22:48:56.937' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (322, 70101, 1, CAST(N'2024-09-26T22:48:57.480' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (323, 70101, 2, CAST(N'2024-09-26T22:48:57.937' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (324, 70101, 1, CAST(N'2024-09-26T22:48:58.397' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (325, 70101, 2, CAST(N'2024-09-26T22:48:58.817' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (326, 70101, 1, CAST(N'2024-09-26T22:48:59.307' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (327, 70101, 2, CAST(N'2024-09-26T22:48:59.720' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (328, 70101, 1, CAST(N'2024-09-26T22:49:00.277' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (329, 70101, 2, CAST(N'2024-09-26T22:49:00.680' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (330, 80101, 3, CAST(N'2024-09-26T22:49:04.773' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (331, 70203, 1, CAST(N'2024-09-26T22:49:17.340' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (332, 70204, 1, CAST(N'2024-09-26T22:49:20.890' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (333, 160305, 2, CAST(N'2024-09-26T22:49:43.407' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (334, 160205, 2, CAST(N'2024-09-26T22:49:45.627' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (335, 160105, 2, CAST(N'2024-09-26T22:49:48.137' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (336, 160405, 2, CAST(N'2024-09-26T22:50:24.080' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (337, 160505, 2, CAST(N'2024-09-26T22:50:26.470' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (338, 160605, 2, CAST(N'2024-09-26T22:50:28.427' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (339, 160705, 2, CAST(N'2024-09-26T22:50:30.653' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (340, 100201, 1, CAST(N'2024-09-26T22:50:34.477' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (341, 100101, 1, CAST(N'2024-09-26T22:50:36.233' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (342, 100401, 1, CAST(N'2024-09-26T22:50:45.680' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (343, 160704, 1, CAST(N'2024-09-26T22:50:50.073' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (344, 80101, 1, CAST(N'2024-09-26T22:51:03.880' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (345, 80102, 1, CAST(N'2024-09-26T22:51:06.023' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (346, 80302, 1, CAST(N'2024-09-26T22:51:08.460' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (347, 80301, 1, CAST(N'2024-09-26T22:51:10.187' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (348, 80101, 2, CAST(N'2024-09-26T22:51:14.847' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (349, 80202, 2, CAST(N'2024-09-26T22:51:16.747' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (350, 80103, 1, CAST(N'2024-09-26T22:51:19.890' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (351, 80303, 1, CAST(N'2024-09-26T22:51:22.367' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (352, 160202, 1, CAST(N'2024-09-26T22:51:44.527' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (353, 90101, 2, CAST(N'2024-09-26T22:52:13.910' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (354, 70302, 1, CAST(N'2024-09-26T22:52:16.757' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (355, 70303, 1, CAST(N'2024-09-26T22:52:18.920' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (356, 70304, 1, CAST(N'2024-09-26T22:52:21.180' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (357, 90201, 2, CAST(N'2024-09-26T22:52:29.790' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (358, 90301, 2, CAST(N'2024-09-26T22:52:32.223' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (359, 90202, 1, CAST(N'2024-09-26T22:52:35.007' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (360, 90203, 1, CAST(N'2024-09-26T22:52:37.350' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (361, 90102, 1, CAST(N'2024-09-26T22:52:39.737' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (362, 90204, 1, CAST(N'2024-09-26T22:52:41.880' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (363, 90104, 1, CAST(N'2024-09-26T22:52:43.987' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (364, 90205, 1, CAST(N'2024-09-26T22:52:46.103' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (365, 90305, 2, CAST(N'2024-09-26T22:52:48.287' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (366, 160701, 3, CAST(N'2024-09-26T22:53:10.817' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (367, 160701, 1, CAST(N'2024-09-26T22:53:16.800' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (368, 90205, 3, CAST(N'2024-09-26T22:54:03.277' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (369, 90205, 2, CAST(N'2024-09-26T22:54:03.760' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (370, 90205, 3, CAST(N'2024-09-26T22:54:04.057' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (371, 90205, 3, CAST(N'2024-09-26T22:54:04.560' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (372, 90205, 2, CAST(N'2024-09-26T22:54:05.043' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (373, 90205, 2, CAST(N'2024-09-26T22:54:05.287' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (374, 90205, 2, CAST(N'2024-09-26T22:54:05.513' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (375, 90205, 2, CAST(N'2024-09-26T22:54:05.713' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (376, 90205, 2, CAST(N'2024-09-26T22:54:05.913' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (377, 90205, 2, CAST(N'2024-09-26T22:54:06.103' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (378, 90205, 3, CAST(N'2024-09-26T22:54:06.523' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (379, 90205, 2, CAST(N'2024-09-26T22:54:07.120' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (380, 90205, 1, CAST(N'2024-09-26T22:54:11.903' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (381, 70304, 2, CAST(N'2024-09-26T22:57:05.190' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (382, 70304, 1, CAST(N'2024-09-26T22:57:06.840' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (383, 70304, 3, CAST(N'2024-09-26T22:57:07.690' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (384, 70304, 1, CAST(N'2024-09-26T22:57:09.940' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (385, 70304, 3, CAST(N'2024-09-26T22:57:12.090' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (386, 70304, 1, CAST(N'2024-09-26T22:57:13.100' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (387, 70304, 3, CAST(N'2024-09-26T22:57:13.617' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (388, 70304, 1, CAST(N'2024-09-26T22:57:14.070' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (389, 70304, 3, CAST(N'2024-09-26T22:57:14.457' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (390, 70304, 1, CAST(N'2024-09-26T22:57:14.877' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (391, 70304, 3, CAST(N'2024-09-26T22:57:15.223' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (392, 70304, 1, CAST(N'2024-09-26T22:57:15.590' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (393, 70304, 3, CAST(N'2024-09-26T22:57:15.940' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (394, 70304, 2, CAST(N'2024-09-26T22:57:21.043' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (395, 70304, 1, CAST(N'2024-09-26T22:57:22.200' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (396, 70304, 2, CAST(N'2024-09-26T22:57:23.497' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (397, 70304, 1, CAST(N'2024-09-26T22:57:24.677' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (398, 70304, 2, CAST(N'2024-09-26T22:57:25.147' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (399, 70304, 1, CAST(N'2024-09-26T22:57:25.567' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (400, 70304, 2, CAST(N'2024-09-26T22:57:25.913' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (401, 70304, 3, CAST(N'2024-09-26T22:57:26.337' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (402, 70304, 2, CAST(N'2024-09-26T22:57:27.233' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (403, 70304, 3, CAST(N'2024-09-26T22:57:27.583' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (404, 70304, 2, CAST(N'2024-09-26T22:57:27.937' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (405, 70304, 3, CAST(N'2024-09-26T22:57:28.270' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (406, 70304, 2, CAST(N'2024-09-26T22:57:28.633' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (407, 70304, 1, CAST(N'2024-09-26T22:57:29.097' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (408, 70304, 2, CAST(N'2024-09-26T22:57:29.507' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (409, 70304, 1, CAST(N'2024-09-26T22:57:29.903' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (410, 70304, 2, CAST(N'2024-09-26T22:57:30.230' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (411, 70304, 1, CAST(N'2024-09-26T22:57:30.693' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (412, 70304, 2, CAST(N'2024-09-26T22:57:31.060' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (413, 70304, 1, CAST(N'2024-09-26T22:57:31.427' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (414, 70304, 2, CAST(N'2024-09-26T22:57:36.167' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (415, 70304, 1, CAST(N'2024-09-26T22:57:37.050' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (416, 70304, 2, CAST(N'2024-09-26T22:57:38.093' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (417, 70304, 1, CAST(N'2024-09-26T22:57:38.520' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (418, 70304, 3, CAST(N'2024-09-26T22:57:41.060' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (419, 70304, 2, CAST(N'2024-09-26T22:57:41.980' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (420, 70304, 3, CAST(N'2024-09-26T22:57:42.377' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (421, 70304, 2, CAST(N'2024-09-26T22:57:42.680' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (422, 70304, 3, CAST(N'2024-09-26T22:57:43.010' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (423, 70304, 2, CAST(N'2024-09-26T22:57:43.303' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (424, 70304, 3, CAST(N'2024-09-26T22:57:43.640' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (425, 70304, 2, CAST(N'2024-09-26T22:57:43.977' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (426, 70304, 3, CAST(N'2024-09-26T22:57:44.310' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (427, 70304, 2, CAST(N'2024-09-26T22:57:44.643' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (428, 70304, 3, CAST(N'2024-09-26T22:57:45.560' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (429, 70304, 1, CAST(N'2024-09-26T22:57:46.423' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (430, 70304, 3, CAST(N'2024-09-26T22:57:49.730' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (431, 70304, 1, CAST(N'2024-09-26T22:57:50.710' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (432, 70304, 3, CAST(N'2024-09-26T22:57:51.380' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (433, 70304, 1, CAST(N'2024-09-26T22:57:52.123' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (434, 70304, 3, CAST(N'2024-09-26T22:57:52.697' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (435, 70304, 1, CAST(N'2024-09-26T22:57:53.113' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (436, 70202, 2, CAST(N'2024-09-27T07:51:26.880' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (437, 70202, 3, CAST(N'2024-09-27T07:51:33.127' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (438, 70202, 1, CAST(N'2024-09-27T07:51:44.100' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (439, 70202, 3, CAST(N'2024-09-27T07:51:45.970' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (440, 70202, 1, CAST(N'2024-09-27T07:51:56.430' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (441, 70202, 3, CAST(N'2024-09-27T07:51:59.557' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (442, 70202, 1, CAST(N'2024-09-27T07:56:04.433' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (443, 70202, 3, CAST(N'2024-09-27T07:56:09.500' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (444, 70202, 1, CAST(N'2024-09-27T07:56:10.450' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (445, 70202, 2, CAST(N'2024-09-27T07:56:11.313' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (446, 70202, 3, CAST(N'2024-09-27T07:58:49.993' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (447, 70202, 1, CAST(N'2024-09-27T07:58:53.490' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (448, 70202, 2, CAST(N'2024-09-27T07:58:56.267' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (449, 70304, 3, CAST(N'2024-09-27T08:00:18.180' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (450, 70304, 2, CAST(N'2024-09-27T08:00:25.047' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (451, 70302, 3, CAST(N'2024-09-27T08:03:08.320' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (452, 70303, 3, CAST(N'2024-09-27T08:03:31.010' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (453, 70303, 1, CAST(N'2024-09-27T08:03:33.173' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (454, 70303, 3, CAST(N'2024-09-27T08:03:35.173' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (455, 70303, 2, CAST(N'2024-09-28T18:02:23.790' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (456, 70303, 1, CAST(N'2024-09-28T18:02:25.027' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (457, 70302, 1, CAST(N'2024-09-28T18:02:27.267' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (458, 70303, 3, CAST(N'2024-09-28T18:02:29.733' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (459, 70302, 2, CAST(N'2024-09-28T18:05:57.490' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (460, 160704, 2, CAST(N'2024-09-28T18:10:04.813' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (461, 70203, 3, CAST(N'2024-09-28T23:32:24.753' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (462, 70204, 2, CAST(N'2024-09-29T00:38:48.770' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (463, 70204, 3, CAST(N'2024-09-29T00:38:49.840' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (464, 80301, 3, CAST(N'2024-09-29T00:56:49.453' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (465, 80301, 1, CAST(N'2024-09-29T00:56:51.483' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (466, 80301, 3, CAST(N'2024-09-29T00:56:52.647' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (467, 80301, 1, CAST(N'2024-09-29T00:56:54.453' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (468, 90203, 3, CAST(N'2024-09-29T01:00:12.627' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (469, 90203, 1, CAST(N'2024-09-29T01:00:14.260' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (470, 80301, 3, CAST(N'2024-09-29T01:05:31.223' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (471, 80301, 1, CAST(N'2024-09-29T01:05:36.787' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (472, 80301, 3, CAST(N'2024-09-29T01:05:37.510' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (473, 80301, 1, CAST(N'2024-09-29T01:07:45.913' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (474, 80301, 3, CAST(N'2024-09-29T01:07:47.613' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (475, 80304, 3, CAST(N'2024-09-29T01:14:13.093' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (476, 80204, 3, CAST(N'2024-09-29T01:14:16.350' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (477, 80303, 3, CAST(N'2024-09-29T01:14:34.370' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (478, 80302, 3, CAST(N'2024-09-29T01:14:39.970' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (479, 80103, 2, CAST(N'2024-09-29T01:14:47.837' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (480, 100401, 2, CAST(N'2024-09-29T01:14:52.330' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (481, 80301, 2, CAST(N'2024-09-29T01:26:07.850' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (482, 70304, 3, CAST(N'2024-09-29T01:42:27.703' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (483, 80203, 3, CAST(N'2024-09-29T01:45:54.490' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (484, 80203, 1, CAST(N'2024-09-29T01:46:01.733' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (485, 80304, 1, CAST(N'2024-09-29T01:46:14.710' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (486, 70203, 1, CAST(N'2024-09-29T07:49:26.380' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (487, 70304, 2, CAST(N'2024-09-29T07:49:29.833' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (488, 70304, 1, CAST(N'2024-09-29T07:49:30.780' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (489, 70304, 2, CAST(N'2024-09-29T08:43:50.737' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (490, 70304, 3, CAST(N'2024-09-29T08:43:51.807' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (491, 70203, 2, CAST(N'2024-09-29T08:48:27.157' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (492, 70203, 3, CAST(N'2024-09-29T08:48:28.030' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (493, 80304, 2, CAST(N'2024-09-29T09:07:40.580' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (494, 80304, 1, CAST(N'2024-09-29T09:07:42.110' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (495, 70304, 1, CAST(N'2024-09-29T09:40:45.250' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (496, 70304, 2, CAST(N'2024-09-29T09:40:52.283' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (497, 80304, 2, CAST(N'2024-09-29T09:43:15.760' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (498, 70304, 3, CAST(N'2024-09-29T10:03:18.470' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (499, 70203, 1, CAST(N'2024-09-29T10:52:55.703' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (500, 70304, 1, CAST(N'2024-09-29T10:53:07.547' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (501, 70304, 3, CAST(N'2024-09-29T10:53:08.147' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (502, 70304, 1, CAST(N'2024-09-29T10:53:08.573' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (503, 70304, 3, CAST(N'2024-09-29T10:53:09.020' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (504, 70304, 1, CAST(N'2024-09-29T10:53:09.343' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (505, 70304, 3, CAST(N'2024-09-29T10:53:09.790' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (506, 70304, 2, CAST(N'2024-09-29T10:53:10.237' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (507, 70304, 3, CAST(N'2024-09-29T10:53:10.650' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (508, 70304, 2, CAST(N'2024-09-29T10:53:10.980' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (509, 70304, 3, CAST(N'2024-09-29T10:53:11.213' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (510, 70304, 1, CAST(N'2024-09-29T10:53:11.610' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (511, 70304, 2, CAST(N'2024-09-29T10:53:12.057' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (512, 70304, 1, CAST(N'2024-09-29T10:53:12.377' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (513, 70304, 2, CAST(N'2024-09-29T10:53:12.627' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (514, 70304, 1, CAST(N'2024-09-29T10:53:12.880' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (515, 70304, 2, CAST(N'2024-09-29T10:53:13.167' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (516, 70304, 1, CAST(N'2024-09-29T10:53:13.547' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (517, 70304, 2, CAST(N'2024-09-29T10:53:14.393' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (518, 70304, 3, CAST(N'2024-09-29T10:53:14.963' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (519, 70304, 2, CAST(N'2024-09-29T10:53:15.330' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (520, 70304, 3, CAST(N'2024-09-29T10:53:15.657' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (521, 70304, 1, CAST(N'2024-09-29T10:53:16.217' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (522, 70304, 2, CAST(N'2024-09-29T10:53:16.607' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (523, 70304, 1, CAST(N'2024-09-29T10:53:17.023' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (524, 70304, 2, CAST(N'2024-09-29T10:53:17.380' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (525, 70304, 1, CAST(N'2024-09-29T10:53:18.300' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (526, 70304, 3, CAST(N'2024-09-29T10:53:18.893' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (527, 70304, 2, CAST(N'2024-09-29T10:53:19.323' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (528, 70304, 3, CAST(N'2024-09-29T10:53:19.713' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (529, 70304, 2, CAST(N'2024-09-29T10:53:20.047' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (530, 70304, 1, CAST(N'2024-09-29T10:53:20.540' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (531, 70304, 3, CAST(N'2024-09-29T10:53:21.960' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (532, 70304, 2, CAST(N'2024-09-29T10:53:22.653' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (533, 70304, 1, CAST(N'2024-09-29T10:53:23.410' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (534, 70304, 2, CAST(N'2024-09-29T10:53:23.823' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (535, 70304, 1, CAST(N'2024-09-29T10:53:24.143' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (536, 70304, 2, CAST(N'2024-09-29T10:53:24.543' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (537, 70304, 1, CAST(N'2024-09-29T10:53:24.837' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (538, 70304, 2, CAST(N'2024-09-29T10:53:25.153' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (539, 70304, 1, CAST(N'2024-09-29T10:53:25.427' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (540, 90105, 3, CAST(N'2024-09-29T11:01:22.663' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (541, 90105, 1, CAST(N'2024-09-29T11:01:24.173' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (542, 160202, 3, CAST(N'2024-09-29T11:34:32.840' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (543, 160202, 1, CAST(N'2024-09-29T11:34:34.053' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (544, 70304, 2, CAST(N'2024-09-29T12:36:46.080' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (545, 70304, 3, CAST(N'2024-09-29T12:36:48.060' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (546, 70303, 2, CAST(N'2024-09-29T12:36:52.403' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (547, 70304, 3, CAST(N'2024-09-29T12:38:54.250' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (548, 70304, 1, CAST(N'2024-09-29T12:38:55.347' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (549, 70304, 3, CAST(N'2024-09-29T12:38:56.657' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (550, 70304, 1, CAST(N'2024-09-29T12:39:07.977' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (551, 70304, 3, CAST(N'2024-09-29T12:39:09.313' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (552, 70304, 1, CAST(N'2024-09-29T12:39:09.807' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (553, 70303, 2, CAST(N'2024-09-29T12:39:14.133' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (554, 70303, 1, CAST(N'2024-09-29T12:39:15.107' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (555, 70303, 3, CAST(N'2024-09-29T12:39:15.593' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (556, 160704, 3, CAST(N'2024-09-29T12:39:19.447' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (557, 80201, 2, CAST(N'2024-09-29T12:46:15.907' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (558, 80201, 3, CAST(N'2024-09-29T12:46:18.770' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (559, 80201, 1, CAST(N'2024-09-29T12:46:19.463' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (560, 80201, 3, CAST(N'2024-09-29T12:46:20.037' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (561, 80201, 2, CAST(N'2024-09-29T12:46:25.923' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (562, 80104, 3, CAST(N'2024-09-29T12:46:31.137' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (563, 80104, 1, CAST(N'2024-09-29T12:46:32.110' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (564, 70304, 3, CAST(N'2024-09-29T13:41:57.390' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (565, 70203, 2, CAST(N'2024-09-29T13:42:00.193' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (566, 70203, 3, CAST(N'2024-09-29T13:42:01.433' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (567, 70304, 2, CAST(N'2024-09-29T13:49:27.193' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (568, 70304, 3, CAST(N'2024-09-29T13:49:28.510' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (569, 70304, 1, CAST(N'2024-09-29T13:49:29.810' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (570, 70304, 3, CAST(N'2024-09-29T13:49:30.303' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (571, 70304, 1, CAST(N'2024-09-29T13:49:31.063' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (572, 70304, 3, CAST(N'2024-09-29T13:49:31.490' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (573, 70304, 1, CAST(N'2024-09-29T13:49:34.313' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (574, 70304, 3, CAST(N'2024-09-29T13:56:13.917' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (575, 80203, 3, CAST(N'2024-09-29T14:25:16.177' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (576, 70203, 2, CAST(N'2024-09-29T14:25:53.200' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (577, 90205, 3, CAST(N'2024-09-29T14:27:19.553' AS DateTime), NULL)
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (578, 70304, 2, CAST(N'2024-09-29T14:34:52.247' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (579, 70304, 1, CAST(N'2024-09-29T14:34:53.240' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (580, 70203, 1, CAST(N'2024-09-29T14:34:55.780' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (581, 70304, 2, CAST(N'2024-09-29T14:38:23.663' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (582, 70304, 1, CAST(N'2024-09-29T14:38:25.050' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (583, 70304, 3, CAST(N'2024-09-29T14:38:26.863' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (584, 70304, 1, CAST(N'2024-09-29T14:38:27.450' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (585, 70304, 2, CAST(N'2024-09-29T14:39:49.887' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (586, 70304, 1, CAST(N'2024-09-29T14:39:54.567' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (587, 70304, 3, CAST(N'2024-09-29T14:40:02.457' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (588, 70203, 3, CAST(N'2024-09-29T14:41:53.013' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (589, 70203, 1, CAST(N'2024-09-29T14:41:54.280' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (590, 70304, 1, CAST(N'2024-09-29T14:42:06.970' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (591, 70304, 3, CAST(N'2024-09-29T14:42:08.107' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (592, 70304, 1, CAST(N'2024-09-29T14:43:19.720' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (593, 70304, 2, CAST(N'2024-09-29T14:43:21.607' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (594, 70203, 3, CAST(N'2024-09-29T14:43:27.230' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (595, 70203, 1, CAST(N'2024-09-29T14:43:28.140' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (596, 70203, 2, CAST(N'2024-09-29T14:43:44.990' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (597, 70203, 1, CAST(N'2024-09-29T14:43:46.537' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (598, 70203, 3, CAST(N'2024-09-29T14:43:58.510' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (599, 70303, 1, CAST(N'2024-09-29T14:44:09.240' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (600, 70303, 3, CAST(N'2024-09-29T15:16:38.447' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (601, 70204, 2, CAST(N'2024-09-29T16:11:15.677' AS DateTime), N'cop')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (602, 70204, 3, CAST(N'2024-09-29T16:11:16.760' AS DateTime), N'cop')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (603, 70204, 1, CAST(N'2024-09-29T16:11:17.417' AS DateTime), N'cop')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (604, 70304, 3, CAST(N'2024-09-29T16:19:47.777' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (605, 70304, 1, CAST(N'2024-09-29T16:19:48.860' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (606, 80304, 1, CAST(N'2024-10-01T12:37:38.453' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (607, 80302, 1, CAST(N'2024-10-01T12:37:46.160' AS DateTime), N'an')
GO
INSERT [dbo].[History] ([id], [idPhong], [status], [time], [uid]) VALUES (608, 70304, 3, CAST(N'2024-10-02T11:37:42.170' AS DateTime), N'an')
GO
SET IDENTITY_INSERT [dbo].[History] OFF
GO
SET IDENTITY_INSERT [dbo].[Log] ON 
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (1, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Sửa chữa', CAST(N'2024-09-29T13:41:57.390' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (2, N'phong change status: A7-203', N'A7-203 change from Phòng trống -> Đang học', CAST(N'2024-09-29T13:42:00.197' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (3, N'phong change status: A7-203', N'A7-203 change from Đang học -> Sửa chữa', CAST(N'2024-09-29T13:42:01.433' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (4, N'phong change status: A7-304', N'A7-304 change from Sửa chữa -> Đang học', CAST(N'2024-09-29T13:49:27.197' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (5, N'phong change status: A7-304', N'A7-304 change from Đang học -> Sửa chữa', CAST(N'2024-09-29T13:49:28.513' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (6, N'phong change status: A7-304', N'A7-304 change from Sửa chữa -> Phòng trống', CAST(N'2024-09-29T13:49:29.810' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (7, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Sửa chữa', CAST(N'2024-09-29T13:49:30.303' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (8, N'phong change status: A7-304', N'A7-304 change from Sửa chữa -> Phòng trống', CAST(N'2024-09-29T13:49:31.063' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (9, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Sửa chữa', CAST(N'2024-09-29T13:49:31.493' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (10, N'phong change status: A7-304', N'A7-304 change from Sửa chữa -> Phòng trống', CAST(N'2024-09-29T13:49:34.317' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (11, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T13:56:13.920' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (12, N'Login OK', N'Login OK', CAST(N'2024-09-29T14:19:52.613' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (13, N'Không tồn tại user', N'admin', CAST(N'2024-09-29T14:20:27.907' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (14, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:19:52', CAST(N'2024-09-29T14:20:31.750' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (15, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:20:31', CAST(N'2024-09-29T14:23:26.697' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (16, N'Login OK', N'An: Nguyễn An An, Last Login: 2024-09-29 14:23:26', CAST(N'2024-09-29T14:24:28.523' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (17, N'Logout', N'an thoát!', CAST(N'2024-09-29T14:24:30.707' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (18, N'Login OK', N'An: Nguyễn An An, Last Login: 2024-09-29 14:24:28', CAST(N'2024-09-29T14:24:33.520' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (19, N'phong change status: A8-203', N'A8-203 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:25:16.180' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (20, N'Logout', N'an thoát!', CAST(N'2024-09-29T14:25:38.440' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (21, N'Login OK', N'Binh: Nguyễn Văn Bình, Last Login: 2024-09-29 09:13:26', CAST(N'2024-09-29T14:25:46.420' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (22, N'phong change status: A7-203', N'A7-203 change from Sửa chữa -> Đang học. Change by binh: Nguyễn Văn Bình', CAST(N'2024-09-29T14:25:53.200' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (23, N'phong change status: A9-205', N'A9-205 change from Phòng trống -> Sửa chữa. Change by binh: Nguyễn Văn Bình', CAST(N'2024-09-29T14:27:19.557' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (24, N'Login error user', N'Không tồn tại user: sa', CAST(N'2024-09-29T14:29:33.987' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (25, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:24:33', CAST(N'2024-09-29T14:29:38.260' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (26, N'phong change status: A7-304', N'A7-304 change from Sửa chữa -> Đang học. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:34:52.250' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (27, N'phong change status: A7-304', N'A7-304 change from Đang học -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:34:53.240' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (28, N'phong change status: A7-203', N'A7-203 change from Đang học -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:34:55.780' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (29, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:29:38', CAST(N'2024-09-29T14:38:05.190' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (30, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Đang học. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:38:23.667' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (31, N'phong change status: A7-304', N'A7-304 change from Đang học -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:38:25.053' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (32, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:38:26.867' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (33, N'phong change status: A7-304', N'A7-304 change from Sửa chữa -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:38:27.453' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (34, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:38:05', CAST(N'2024-09-29T14:39:03.667' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (35, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:39:03', CAST(N'2024-09-29T14:39:37.757' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (36, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Đang học. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:39:49.887' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (37, N'phong change status: A7-304', N'A7-304 change from Đang học -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:39:54.570' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (38, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:40:02.460' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (39, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:39:37', CAST(N'2024-09-29T14:41:27.610' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (40, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:41:27', CAST(N'2024-09-29T14:41:42.277' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (41, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:41:42', CAST(N'2024-09-29T14:41:50.950' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (42, N'phong change status: A7-203', N'A7-203 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:41:53.013' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (43, N'phong change status: A7-203', N'A7-203 change from Sửa chữa -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:41:54.280' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (44, N'phong change status: A7-304', N'A7-304 change from Sửa chữa -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:42:06.973' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (45, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:42:08.110' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (46, N'phong change status: A7-304', N'A7-304 change from Sửa chữa -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:43:19.720' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (47, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Đang học. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:43:21.610' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (48, N'phong change status: A7-203', N'A7-203 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:43:27.230' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (49, N'phong change status: A7-203', N'A7-203 change from Sửa chữa -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:43:28.143' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (50, N'phong change status: A7-203', N'A7-203 change from Phòng trống -> Đang học. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:43:44.993' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (51, N'phong change status: A7-203', N'A7-203 change from Đang học -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:43:46.540' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (52, N'phong change status: A7-203', N'A7-203 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:43:58.513' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (53, N'phong change status: A7-303', N'A7-303 change from Sửa chữa -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T14:44:09.243' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (54, N'Login error user', N'Không tồn tại user: admin', CAST(N'2024-09-29T14:55:37.937' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (55, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:41:50', CAST(N'2024-09-29T14:55:41.647' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (56, N'Logout', N'an thoát!', CAST(N'2024-09-29T15:05:53.973' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (57, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 14:55:41', CAST(N'2024-09-29T15:05:57.077' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (58, N'phong change status: A7-303', N'A7-303 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T15:16:38.450' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (59, N'Login error user', N'Không tồn tại user: an`', CAST(N'2024-09-29T15:57:12.867' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (60, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 15:05:57', CAST(N'2024-09-29T15:57:16.490' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (61, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 15:57:16', CAST(N'2024-09-29T15:58:45.243' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (62, N'Logout', N' thoát!', CAST(N'2024-09-29T16:01:07.980' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (63, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 15:58:45', CAST(N'2024-09-29T16:01:11.953' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (64, N'Logout', N' thoát!', CAST(N'2024-09-29T16:05:13.720' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (65, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 16:01:11', CAST(N'2024-09-29T16:05:17.090' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (66, N'Logout', N'an thoát!', CAST(N'2024-09-29T16:05:37.817' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (67, N'Login error password', N'cop3: Nhập password sai rồi!', CAST(N'2024-09-29T16:05:43.180' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (68, N'Login error password', N'cop3: Nhập password sai rồi!', CAST(N'2024-09-29T16:05:45.337' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (69, N'Login error password', N'an: Nhập password sai rồi!', CAST(N'2024-09-29T16:08:58.197' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (70, N'Login error password', N'an: Nhập password sai rồi!', CAST(N'2024-09-29T16:09:02.043' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (71, N'Login error password', N'an: Nhập password sai rồi!', CAST(N'2024-09-29T16:09:07.387' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (72, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 16:05:17', CAST(N'2024-09-29T16:09:25.463' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (73, N'Logout', N'an thoát!', CAST(N'2024-09-29T16:09:46.600' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (74, N'Login OK', N'cop4: cop4, Last Login: ', CAST(N'2024-09-29T16:09:51.710' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (75, N'Logout', N'cop4 thoát!', CAST(N'2024-09-29T16:11:08.960' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (76, N'Login OK', N'cop: Đỗ Duy Cốp, Last Login: ', CAST(N'2024-09-29T16:11:12.120' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (77, N'phong change status: A7-204', N'A7-204 change from Sửa chữa -> Đang học. Change by cop: Đỗ Duy Cốp', CAST(N'2024-09-29T16:11:15.680' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (78, N'phong change status: A7-204', N'A7-204 change from Đang học -> Sửa chữa. Change by cop: Đỗ Duy Cốp', CAST(N'2024-09-29T16:11:16.760' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (79, N'phong change status: A7-204', N'A7-204 change from Sửa chữa -> Phòng trống. Change by cop: Đỗ Duy Cốp', CAST(N'2024-09-29T16:11:17.420' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (80, N'Logout', N' thoát!', CAST(N'2024-09-29T16:13:21.350' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (81, N'Login OK', N'cop: Đỗ Duy Cốp, Last Login: 2024-09-29 16:11:12', CAST(N'2024-09-29T16:13:25.483' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (82, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 16:09:25', CAST(N'2024-09-29T16:19:43.497' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (83, N'phong change status: A7-304', N'A7-304 change from Đang học -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-09-29T16:19:47.780' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (84, N'phong change status: A7-304', N'A7-304 change from Sửa chữa -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-09-29T16:19:48.863' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (85, N'Logout', N'an thoát!', CAST(N'2024-09-29T16:21:36.473' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (86, N'Login OK', N'admin: admin, Last Login: ', CAST(N'2024-09-29T16:21:40.810' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (87, N'Logout', N'admin thoát!', CAST(N'2024-09-29T16:24:53.720' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (88, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 16:19:43', CAST(N'2024-09-29T16:25:10.347' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (89, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-29 16:25:10', CAST(N'2024-09-30T20:18:11.943' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (90, N'Login error password', N'an: Nhập password sai rồi!', CAST(N'2024-10-01T12:36:42.817' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (91, N'Login error password', N'an: Nhập password sai rồi!', CAST(N'2024-10-01T12:36:45.227' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (92, N'Login error password', N'an: Nhập password sai rồi!', CAST(N'2024-10-01T12:36:48.930' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (93, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-09-30 20:18:11', CAST(N'2024-10-01T12:37:09.327' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (94, N'Logout', N'an thoát!', CAST(N'2024-10-01T12:37:22.300' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (95, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-10-01 12:37:09', CAST(N'2024-10-01T12:37:26.197' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (96, N'phong change status: A8-304', N'A8-304 change from Đang học -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-10-01T12:37:38.457' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (97, N'phong change status: A8-302', N'A8-302 change from Sửa chữa -> Phòng trống. Change by an: Nguyễn An An', CAST(N'2024-10-01T12:37:46.163' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (98, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-10-01 12:37:26', CAST(N'2024-10-02T10:08:15.923' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (99, N'Logout', N'an thoát!', CAST(N'2024-10-02T10:08:23.347' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (100, N'Login error password', N'an: Nhập password sai rồi!', CAST(N'2024-10-02T10:08:33.883' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (101, N'Login error password', N'an: Nhập password sai rồi!', CAST(N'2024-10-02T10:08:40.953' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (102, N'Login error password', N'an: Nhập password sai rồi!', CAST(N'2024-10-02T10:09:10.497' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (103, N'Login error captcha', N'an: Nhập sai captcha', CAST(N'2024-10-02T10:09:26.113' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (104, N'Login error captcha', N'an: Nhập sai captcha', CAST(N'2024-10-02T10:09:35.487' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (105, N'Login error captcha', N'an: Nhập sai captcha', CAST(N'2024-10-02T10:09:42.750' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (106, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-10-02 10:08:15', CAST(N'2024-10-02T10:09:54.827' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (107, N'Login OK', N'an: Nguyễn An An, Last Login: 2024-10-02 10:09:54', CAST(N'2024-10-02T11:37:14.590' AS DateTime))
GO
INSERT [dbo].[Log] ([id], [key], [msg], [time]) VALUES (108, N'phong change status: A7-304', N'A7-304 change from Phòng trống -> Sửa chữa. Change by an: Nguyễn An An', CAST(N'2024-10-02T11:37:42.173' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Log] OFF
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70101, 7, N'A7-101', 2, CAST(N'2024-09-26T22:49:00.680' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70102, 7, N'A7-102', 2, CAST(N'2024-09-26T08:52:36.450' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70103, 7, N'A7-103', 2, CAST(N'2024-09-22T12:12:48.183' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70104, 7, N'A7-104', 2, CAST(N'2024-09-22T12:12:48.760' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70201, 7, N'A7-201', 2, CAST(N'2024-09-26T08:46:28.303' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70202, 7, N'A7-202', 2, CAST(N'2024-09-27T07:58:56.267' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70203, 7, N'A7-203', 3, CAST(N'2024-09-29T14:43:58.510' AS DateTime), N'an')
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70204, 7, N'A7-204', 1, CAST(N'2024-09-29T16:11:17.417' AS DateTime), N'cop')
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70301, 7, N'A7-301', 2, CAST(N'2024-09-26T08:45:57.443' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70302, 7, N'A7-302', 2, CAST(N'2024-09-28T18:05:57.490' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70303, 7, N'A7-303', 3, CAST(N'2024-09-29T15:16:38.447' AS DateTime), N'an')
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (70304, 7, N'A7-304', 3, CAST(N'2024-10-02T11:37:42.170' AS DateTime), N'an')
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80101, 8, N'A8-101', 2, CAST(N'2024-09-26T22:51:14.847' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80102, 8, N'A8-102', 1, CAST(N'2024-09-26T22:51:06.023' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80103, 8, N'A8-103', 2, CAST(N'2024-09-29T01:14:47.837' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80104, 8, N'A8-104', 1, CAST(N'2024-09-29T12:46:32.110' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80201, 8, N'A8-201', 2, CAST(N'2024-09-29T12:46:25.923' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80202, 8, N'A8-202', 2, CAST(N'2024-09-26T22:51:16.747' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80203, 8, N'A8-203', 3, CAST(N'2024-09-29T14:25:16.177' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80204, 8, N'A8-204', 3, CAST(N'2024-09-29T01:14:16.350' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80301, 8, N'A8-301', 2, CAST(N'2024-09-29T01:26:07.850' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80302, 8, N'A8-302', 1, CAST(N'2024-10-01T12:37:46.160' AS DateTime), N'an')
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80303, 8, N'A8-303', 3, CAST(N'2024-09-29T01:14:34.370' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (80304, 8, N'A8-304', 1, CAST(N'2024-10-01T12:37:38.453' AS DateTime), N'an')
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90101, 9, N'A9-101', 2, CAST(N'2024-09-26T22:52:13.910' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90102, 9, N'A9-102', 1, CAST(N'2024-09-26T22:52:39.737' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90103, 9, N'A9-103', 1, CAST(N'2024-09-25T11:03:39.300' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90104, 9, N'A9-104', 1, CAST(N'2024-09-26T22:52:43.987' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90105, 9, N'A9-105', 1, CAST(N'2024-09-29T11:01:24.173' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90201, 9, N'A9-201', 2, CAST(N'2024-09-26T22:52:29.790' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90202, 9, N'A9-202', 1, CAST(N'2024-09-26T22:52:35.007' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90203, 9, N'A9-203', 1, CAST(N'2024-09-29T01:00:14.260' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90204, 9, N'A9-204', 1, CAST(N'2024-09-26T22:52:41.880' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90205, 9, N'A9-205', 3, CAST(N'2024-09-29T14:27:19.553' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90301, 9, N'A9-301', 2, CAST(N'2024-09-26T22:52:32.223' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90302, 9, N'A9-302', 2, CAST(N'2024-09-22T12:31:07.437' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90303, 9, N'A9-303', 2, CAST(N'2024-09-22T12:31:00.123' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90304, 9, N'A9-304', 2, CAST(N'2024-09-22T16:08:08.947' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (90305, 9, N'A9-305', 2, CAST(N'2024-09-26T22:52:48.287' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100101, 10, N'A10-101', 1, CAST(N'2024-09-26T22:50:36.233' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100102, 10, N'A10-102', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100103, 10, N'A10-103', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100104, 10, N'A10-104', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100105, 10, N'A10-105', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100201, 10, N'A10-201', 1, CAST(N'2024-09-26T22:50:34.477' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100202, 10, N'A10-202', 1, CAST(N'2024-09-22T12:12:11.037' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100203, 10, N'A10-203', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100204, 10, N'A10-204', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100205, 10, N'A10-205', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100301, 10, N'A10-301', 2, CAST(N'2024-09-22T12:11:57.057' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100302, 10, N'A10-302', 2, CAST(N'2024-09-22T12:12:10.057' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100303, 10, N'A10-303', 2, CAST(N'2024-09-22T12:12:03.970' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100304, 10, N'A10-304', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100305, 10, N'A10-305', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100401, 10, N'A10-401', 2, CAST(N'2024-09-29T01:14:52.330' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100402, 10, N'A10-402', 1, CAST(N'2024-09-22T16:08:30.597' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100403, 10, N'A10-403', 2, CAST(N'2024-09-22T12:12:03.110' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100404, 10, N'A10-404', 1, CAST(N'2024-09-22T12:12:28.550' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100405, 10, N'A10-405', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100501, 10, N'A10-501', 2, CAST(N'2024-09-22T12:11:59.457' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100502, 10, N'A10-502', 2, CAST(N'2024-09-22T12:12:01.360' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100503, 10, N'A10-503', 2, CAST(N'2024-09-22T12:12:08.997' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100504, 10, N'A10-504', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (100505, 10, N'A10-505', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160101, 16, N'A16-101', 2, CAST(N'2024-09-22T10:01:42.657' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160102, 16, N'A16-102', 2, CAST(N'2024-09-22T12:11:47.150' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160103, 16, N'A16-103', 2, CAST(N'2024-09-22T12:11:46.483' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160104, 16, N'A16-104', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160105, 16, N'A16-105', 2, CAST(N'2024-09-26T22:49:48.137' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160201, 16, N'A16-201', 2, CAST(N'2024-09-22T12:11:45.070' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160202, 16, N'A16-202', 1, CAST(N'2024-09-29T11:34:34.053' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160203, 16, N'A16-203', 2, CAST(N'2024-09-22T12:10:46.977' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160204, 16, N'A16-204', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160205, 16, N'A16-205', 2, CAST(N'2024-09-26T22:49:45.627' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160301, 16, N'A16-301', 2, CAST(N'2024-09-22T12:11:44.267' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160302, 16, N'A16-302', 2, CAST(N'2024-09-22T12:10:46.337' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160303, 16, N'A16-303', 2, CAST(N'2024-09-22T12:11:45.770' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160304, 16, N'A16-304', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160305, 16, N'A16-305', 2, CAST(N'2024-09-26T22:49:43.407' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160401, 16, N'A16-401', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160402, 16, N'A16-402', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160403, 16, N'A16-403', 1, CAST(N'2024-09-22T12:11:48.267' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160404, 16, N'A16-404', 1, CAST(N'2024-09-22T12:11:49.007' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160405, 16, N'A16-405', 2, CAST(N'2024-09-26T22:50:24.080' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160501, 16, N'A16-501', 2, CAST(N'2024-09-22T12:11:36.600' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160502, 16, N'A16-502', 1, CAST(N'2024-09-22T12:13:15.167' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160503, 16, N'A16-503', 2, CAST(N'2024-09-22T12:11:52.420' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160504, 16, N'A16-504', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160505, 16, N'A16-505', 2, CAST(N'2024-09-26T22:50:26.470' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160601, 16, N'A16-601', 1, CAST(N'2024-09-22T12:13:09.363' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160602, 16, N'A16-602', 2, CAST(N'2024-09-22T12:13:12.150' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160603, 16, N'A16-603', 1, CAST(N'2024-09-22T12:11:37.560' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160604, 16, N'A16-604', 1, NULL, NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160605, 16, N'A16-605', 2, CAST(N'2024-09-26T22:50:28.427' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160701, 16, N'A16-701', 1, CAST(N'2024-09-26T22:53:16.800' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160702, 16, N'A16-702', 1, CAST(N'2024-09-22T12:13:08.170' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160703, 16, N'A16-703', 1, CAST(N'2024-09-22T12:13:07.537' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160704, 16, N'A16-704', 3, CAST(N'2024-09-29T12:39:19.447' AS DateTime), NULL)
GO
INSERT [dbo].[phong] ([id], [idDay], [name], [status], [time], [uid]) VALUES (160705, 16, N'A16-705', 2, CAST(N'2024-09-26T22:50:30.653' AS DateTime), NULL)
GO
INSERT [dbo].[Status] ([id], [name]) VALUES (1, N'Phòng trống')
GO
INSERT [dbo].[Status] ([id], [name]) VALUES (2, N'Đang học')
GO
INSERT [dbo].[Status] ([id], [name]) VALUES (3, N'Sửa chữa')
GO
INSERT [dbo].[User] ([uid], [pwd], [name], [role], [lastLogin]) VALUES (N'admin', 0x7C4A8D09CA3762AF61E59520943DC26494F8941B, N'admin', 3, CAST(N'2024-09-29T16:21:40.803' AS DateTime))
GO
INSERT [dbo].[User] ([uid], [pwd], [name], [role], [lastLogin]) VALUES (N'an', 0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF, N'Nguyễn An An', 4, CAST(N'2024-10-02T11:37:14.567' AS DateTime))
GO
INSERT [dbo].[User] ([uid], [pwd], [name], [role], [lastLogin]) VALUES (N'binh', 0xB7E0563EB517F1842C3FC718E0984669C2B8D9B7, N'Nguyễn Văn Bình', 4, CAST(N'2024-09-29T14:25:46.420' AS DateTime))
GO
INSERT [dbo].[User] ([uid], [pwd], [name], [role], [lastLogin]) VALUES (N'cop', 0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF, N'Đỗ Duy Cốp', 1, CAST(N'2024-09-29T16:13:25.430' AS DateTime))
GO
INSERT [dbo].[User] ([uid], [pwd], [name], [role], [lastLogin]) VALUES (N'hehe', 0x40BD001563085FC35165329EA1FF5C5ECBDBBEEF, N'hehe', 2, NULL)
GO
INSERT [dbo].[User] ([uid], [pwd], [name], [role], [lastLogin]) VALUES (N'xx', 0x7110EDA4D09E062AA5E4A390B0A572AC0D2C0220, N'xxxxxx', 2, NULL)
GO
INSERT [dbo].[UserRole] ([id], [roleName], [Note]) VALUES (1, N'Guest', N'View only')
GO
INSERT [dbo].[UserRole] ([id], [roleName], [Note]) VALUES (2, N'Member', N'View + Control')
GO
INSERT [dbo].[UserRole] ([id], [roleName], [Note]) VALUES (3, N'Admin', N'Control User')
GO
INSERT [dbo].[UserRole] ([id], [roleName], [Note]) VALUES (4, N'SystemAdmin', N'FULL')
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF_History_time]  DEFAULT (getdate()) FOR [time]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_time]  DEFAULT (getdate()) FOR [time]
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
/****** Object:  StoredProcedure [dbo].[SP_LOG]    Script Date: 2024-10-02 14:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Do Duy Cop
-- Create date: 2024-09-29
-- Description:	SP_LOG dùng để lưu vết mọi thứ
-- =============================================
CREATE PROCEDURE [dbo].[SP_LOG]
	@action varchar(50),
	@key  nvarchar(max)=null,
	@msg  nvarchar(max)=null
AS
BEGIN
	SET NOCOUNT ON;
	declare @json nvarchar(max)='';
	if(@action='add_log')
	begin
		insert into [Log]([key],[msg])values(@key,@msg);
		select 1 as ok, N'add_log ok' as msg for json path, without_array_wrapper;
	end
	else if(@action='get_log')
	begin
		select @json=(
			select 1 as ok, N'get_log ok' as msg,
				(select top 100 [id],[key],[msg],convert(varchar(19), [time], 120) as [time] from [Log] order by [id] desc for json path)as [data]
			for json path, without_array_wrapper
		);
		select @json as [json];
	end 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Phong]    Script Date: 2024-10-02 14:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		do duy cop
-- Create date: 21.9.2024
-- Description:	tnut monitor classroom
-- =============================================
CREATE PROCEDURE [dbo].[SP_Phong]
	@action		varchar(50) = 'get_all_status',
	@idDay		int = null,
	@idPhong	int = null,
	@status		int = null,
	@uid		varchar(50)=null
AS
BEGIN
	SET NOCOUNT ON;
	declare @json nvarchar(max);

	if(@action = 'get_status')
	begin
		select @json = (
			select 
				1 as [ok], 
				'ok get_status' as [msg],
				@idDay as [idDay],
				(	select [phong].[id], [phong].[name], [phong].[status], convert(varchar(19), [time], 120) as [time],[user].[name]as [by]
					from [phong] left join [user] on [phong].[uid]=[user].[uid]
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
				(	select [phong].[id], [phong].[name], [phong].[status], convert(varchar(19), [time], 120) as [time],[user].[name]as [by]
					from [phong] left join [user] on [phong].[uid]=[user].[uid]
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
						[History].[status],
						convert(varchar(19), [History].[time], 120) as [time],
						[user].[name] as [by]
					from [History] left join [user] on [History].[uid]=[user].[uid]
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
		declare @now datetime = getdate(), @old_status int, @old_status_name nvarchar(50), @new_status_name nvarchar(50), @ten_phong Nvarchar(7), @username nvarchar(50);
		
		select @old_status=[status],@ten_phong=[name] from [Phong] where [id] = @idPhong;

		if(@old_status != @status)
		begin
			select @username=[name] from [user] where [uid]=@uid;
			select @old_status_name=[name] from [Status] where [id] = @old_status;
			select @new_status_name=[name] from [Status] where [id] = @status;		
			update Phong set [status] = @status, [time] = @now, [uid]=@uid where id = @idPhong;		
			insert into [History]([idPhong], [status], [time], [uid]) values(@idPhong, @status, @now, @uid);
			insert into [Log]([key],[msg])values(FORMATMESSAGE(N'phong change status: %s',@ten_phong),FORMATMESSAGE(N'%s change from %s -> %s. Change by %s: %s',@ten_phong,@old_status_name,@new_status_name,@uid,@username));
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
		end
		else
		begin
			select @json = (
				select 
					0 as [ok], 
					N'Trạng thái nó vẫn thế!' as [msg]					
				for json path, without_array_wrapper
			);
		end

		select @json as [json];
	end;	
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_User]    Script Date: 2024-10-02 14:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Do Duy Cop
-- Create date: 28.09.2024
-- Description:	xử lý user
-- =============================================
CREATE PROCEDURE [dbo].[SP_User]
	@action varchar(50)=null,
	@uid	varchar(50)=null,
	@pwd	varbinary(20)=null,
	@name   Nvarchar(50)=null,
	@role   int=null
AS
BEGIN
	SET NOCOUNT ON;
	declare @json nvarchar(max);
	if(@action='get_user')
	begin		
		if exists(select * from [user] where [uid] = @uid) --nếu tồn tại user trùng uid và pwd
		begin
			SET NOCOUNT ON;
			select @json = (
				select 1 as ok,N'get_user ok' as [msg], [user].[uid], [user].[name], [user].[role], [userRole].[roleName], convert(varchar(19), [lastLogin], 120) as [lastLogin]
				from [user] join [userRole] on [user].[role] = [userRole].[id]
				where uid = @uid
				for json path, without_array_wrapper
			);
			--cập nhật thời gian login lần này!
			update [user] set [lastLogin] = getdate() where [uid] = @uid
			select @json as [json];
		end;
		else
		begin
			select 0 as ok,N'Không tồn tại user này' as msg 
			for json path, without_array_wrapper;
		end;
	end;
	else if(@action='GetStoredPasswordHash')
	begin
		SELECT [pwd] FROM [user] WHERE [uid] = @uid;
	end;
	--else if(@action='login')
	--begin
	--	--trả về json={ok:1,msg:welcome,uid=uid,name=name,lastLogin=time} nếu login ok, ngược lại cũng trả về json: ok=0,msg=báo lỗi nào đó
	--	if exists(select * from [user] where ([uid] = @uid) and (pwd = HASHBYTES('SHA1',@pwd)) ) --nếu tồn tại user trùng uid và pwd
	--	begin
	--		SET NOCOUNT ON;
	--		select @json = (
	--			select 1 as ok,N'Login thành công' as [msg], [uid], [name], convert(varchar(19), [lastLogin], 120) as [lastLogin]
	--			from [user]
	--			where uid = @uid --and pwd= HASHBYTES ('SHA1',@pwd) --chỗ này ko cần phải HASH nữa
	--			for json path, without_array_wrapper
	--		);
	--		--cập nhật thời gian lần này.
	--		update [user] set lastLogin=getdate() where uid = @uid; --cập nhật now là lần login thành công cuối cùng
	--		select @json as [json];
	--	end;
	--	else
	--	begin
	--		select 0 as ok,N'Có gì đó sai sai' as msg 
	--		for json path, without_array_wrapper;
	--	end;
	--end;
	else if(@action='get_list_role')
	begin
		select 1 as ok,N'get_list_role ok' as [msg],
			(
			select [id],[roleName],[note]
			from [userRole]
			for json path
			) as [data]
		for json path, without_array_wrapper
	end;
	else if(@action='get_list_user')
	begin	
		select @json = (
			select 1 as ok,N'get_list_user ok' as [msg],
			(
			select [user].[uid], [user].[name], [user].[role], [userRole].[roleName], convert(varchar(19), [lastLogin], 120) as [lastLogin]
			from [user] join [userRole] on [user].[role] = [userRole].[id]
			for json path
			) as [data]
			for json path, without_array_wrapper
		);
		--cập nhật thời gian login lần này!
		update [user] set [lastLogin] = getdate() where [uid] = @uid
		select @json as [json];
	end;
	else if(@action='add_user')
	begin
		insert into [User]([uid],[pwd],[name],[role])values(@uid,@pwd,@name,@role);
		select 1 as ok, N'add_user ok' as msg for json path, without_array_wrapper;
	end
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'đây chỉ là id status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SHA1 trả về 160bit = 20 byte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'name'
GO
USE [master]
GO
ALTER DATABASE [tnut-monitor] SET  READ_WRITE 
GO
