USE [master]
GO
/****** Object:  Database [tnut-monitor]    Script Date: 2024-09-26 11:11:59 ******/
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
/****** Object:  Table [dbo].[day_nha]    Script Date: 2024-09-26 11:11:59 ******/
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
/****** Object:  Table [dbo].[History]    Script Date: 2024-09-26 11:12:00 ******/
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
/****** Object:  Table [dbo].[phong]    Script Date: 2024-09-26 11:12:00 ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 2024-09-26 11:12:00 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2024-09-26 11:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[uid] [varchar](50) NOT NULL,
	[pwd] [varbinary](20) NULL,
	[name] [nvarchar](50) NULL,
	[lastLogin] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[SP_API]    Script Date: 2024-09-26 11:12:00 ******/
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
	@status		int = null,

	--dành cho login:
	@uid		varchar(50)=null,
	@pwd		varchar(50)=null
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
	else if(@action='login')
	begin
		--trả về json={ok:1,msg:welcome,uid=uid,name=name,lastLogin=time} nếu login ok, ngược lại cũng trả về json: ok=0,msg=báo lỗi nào đó
		if exists(select * from [user] where ([uid] = @uid) and (pwd = HASHBYTES('SHA1',@pwd)) ) --nếu tồn tại user trùng uid và pwd
		begin
			SET NOCOUNT ON;

			select 1 as ok,N'Login thành công' as [msg], [uid], [name], [lastLogin]
			from [user]
			where uid = @uid --and pwd= HASHBYTES ('SHA1',@pwd) --chỗ này ko cần phải HASH nữa
			for json path, without_array_wrapper;

			update [user] set lastLogin=getdate() where uid = @uid; --cập nhật now là lần login thành công cuối cùng
		end;
		else
		begin
			select 0 as ok,N'Có gì đó sai sai' as msg 
			for json path, without_array_wrapper;
		end;
	end;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'đây chỉ là id status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SHA1 trả về 160bit = 20 byte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'name'
GO
USE [master]
GO
ALTER DATABASE [tnut-monitor] SET  READ_WRITE 
GO
