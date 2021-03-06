USE [master]
GO
/****** Object:  Database [nLogin]    Script Date: 01/27/2018 19:30:31 ******/
CREATE DATABASE [nLogin] ON  PRIMARY 
( NAME = N'nLogin_Data', FILENAME = N'C:\AEGIS\DB\nLogin_Data.MDF' , SIZE = 10048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'nLogin_Log', FILENAME = N'C:\AEGIS\DB\nLogin_Log.LDF' , SIZE = 10048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [nLogin] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nLogin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nLogin] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [nLogin] SET ANSI_NULLS OFF
GO
ALTER DATABASE [nLogin] SET ANSI_PADDING OFF
GO
ALTER DATABASE [nLogin] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [nLogin] SET ARITHABORT OFF
GO
ALTER DATABASE [nLogin] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [nLogin] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [nLogin] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [nLogin] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [nLogin] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [nLogin] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [nLogin] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [nLogin] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [nLogin] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [nLogin] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [nLogin] SET  ENABLE_BROKER
GO
ALTER DATABASE [nLogin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [nLogin] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [nLogin] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [nLogin] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [nLogin] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [nLogin] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [nLogin] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [nLogin] SET  READ_WRITE
GO
ALTER DATABASE [nLogin] SET RECOVERY FULL
GO
ALTER DATABASE [nLogin] SET  MULTI_USER
GO
ALTER DATABASE [nLogin] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [nLogin] SET DB_CHAINING OFF
GO
USE [nLogin]
GO
/****** Object:  User [login]    Script Date: 01/27/2018 19:30:31 ******/
CREATE USER [login] FOR LOGIN [login] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[login]    Script Date: 01/27/2018 19:30:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[AID] [int] IDENTITY(100001,1) NOT NULL,
	[ID] [varchar](20) NOT NULL,
	[passwd] [varchar](16) NOT NULL,
	[LastConnecTime] [varchar](20) NULL,
	[grade] [tinyint] NOT NULL,
	[isConfirmed] [tinyint] NOT NULL,
	[regDate] [datetime] NULL,
	[endblockdate] [smalldatetime] NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[account]    Script Date: 01/27/2018 19:30:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[AID] [int] NOT NULL,
	[Name] [char](20) NOT NULL,
	[Address] [char](200) NOT NULL,
	[Phone] [char](50) NOT NULL,
	[HPhone] [char](15) NULL,
	[RegNum] [char](14) NOT NULL,
	[zipcode] [char](10) NOT NULL,
	[sex] [tinyint] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[http] [varchar](50) NULL,
	[News] [tinyint] NOT NULL,
	[job] [varchar](40) NULL,
	[hobby] [varchar](40) NULL,
	[game] [varchar](40) NULL,
	[comment] [varchar](1000) NULL,
	[nation] [varchar](20) NOT NULL,
	[ip] [int] NULL,
	[lasttime] [datetime] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserInfo]    Script Date: 01/27/2018 19:30:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateUserInfo] 
	@AID	int,
	@IP      int,
	@LASTTIME varchar(24)
AS	update account with (rowlock) set ip = @IP, lasttime = @LASTTIME where AID = @AID
GO
/****** Object:  StoredProcedure [dbo].[RetPwd]    Script Date: 01/27/2018 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
kevin
20110104
重置密碼
*/
CREATE      PROC [dbo].[RetPwd]
	@ID varchar(24)
	,@newpwd varchar(16)
AS

set nocount on

if not exists(select id from nlogin.dbo.login where  id = @ID)
begin
	select -11 as result,'查詢遊戲密碼失敗!!(D)' as message
	return -11
end

begin transaction
	update nlogin.dbo.login 
	set passwd = @newpwd 
	where id = @ID
	if @@error != 0 or @@rowcount != 1
	begin
		rollback transaction
		select -101 as result,'遊戲密碼修改失敗!!(D)' as message
		return -101
	end
commit tran

select 1 as result,'遊戲密碼修改成功!!' as message
return 1
GO
/****** Object:  StoredProcedure [dbo].[RemoveBlank]    Script Date: 01/27/2018 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveBlank]
AS
select AID, ID from login where ID like '% %' order by ID
GO
/****** Object:  StoredProcedure [dbo].[GetUserInfo]    Script Date: 01/27/2018 19:30:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserInfo] 
	@AID	int
AS	select sex, RegNum, Email, ip, lasttime from account where AID=@AID
GO
/****** Object:  StoredProcedure [dbo].[GetSexInfo]    Script Date: 01/27/2018 19:30:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetSexInfo]
	@AID	int
AS select sex, RegNum, Email from account where AID=@AID
GO
/****** Object:  StoredProcedure [dbo].[GetAID]    Script Date: 01/27/2018 19:30:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAID] 
	@ID	varchar(16)
AS	select AID from login where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[CheckPassword]    Script Date: 01/27/2018 19:30:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckPassword] 
	@ID	varchar(16)
AS	select AID, Passwd, grade, isConfirmed from login where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 01/27/2018 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AuthenticateUser] 
	@ID	varchar(24)
AS	select ID, Passwd, grade, isConfirmed, AID,convert(varchar,endblockdate,120), convert(varchar,getdate(),120) from login where ID=@ID
GO
