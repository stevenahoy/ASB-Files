USE [master]
GO
/****** Object:  Database [GlobalInfo]    Script Date: 01/27/2018 19:29:10 ******/
CREATE DATABASE [GlobalInfo] ON  PRIMARY 
( NAME = N'GlobalInfo_Data', FILENAME = N'C:\AEGIS\DB\GlobalInfo_Data.MDF' , SIZE = 10048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'GlobalInfo_Log', FILENAME = N'C:\AEGIS\DB\GlobalInfo_Log.LDF' , SIZE = 10048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GlobalInfo] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GlobalInfo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GlobalInfo] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [GlobalInfo] SET ANSI_NULLS OFF
GO
ALTER DATABASE [GlobalInfo] SET ANSI_PADDING OFF
GO
ALTER DATABASE [GlobalInfo] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [GlobalInfo] SET ARITHABORT OFF
GO
ALTER DATABASE [GlobalInfo] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [GlobalInfo] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [GlobalInfo] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [GlobalInfo] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [GlobalInfo] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [GlobalInfo] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [GlobalInfo] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [GlobalInfo] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [GlobalInfo] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [GlobalInfo] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [GlobalInfo] SET  ENABLE_BROKER
GO
ALTER DATABASE [GlobalInfo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [GlobalInfo] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [GlobalInfo] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [GlobalInfo] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [GlobalInfo] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [GlobalInfo] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [GlobalInfo] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [GlobalInfo] SET  READ_WRITE
GO
ALTER DATABASE [GlobalInfo] SET RECOVERY FULL
GO
ALTER DATABASE [GlobalInfo] SET  MULTI_USER
GO
ALTER DATABASE [GlobalInfo] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [GlobalInfo] SET DB_CHAINING OFF
GO
USE [GlobalInfo]
GO
/****** Object:  User [globalinfo]    Script Date: 01/27/2018 19:29:10 ******/
CREATE USER [globalinfo] FOR LOGIN [globalinfo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[StorePassword]    Script Date: 01/27/2018 19:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorePassword](
	[AID] [int] NOT NULL,
	[Pass] [int] NOT NULL,
	[ErrorCount] [int] NOT NULL,
	[PanaltyTime] [int] NOT NULL,
 CONSTRAINT [PK_StorePassword] PRIMARY KEY NONCLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerInfo]    Script Date: 01/27/2018 19:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServerInfo](
	[SID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[IP] [varchar](16) NOT NULL,
	[Port] [int] NOT NULL,
	[DestinationOneSID] [int] NULL,
	[DestinationTwoSID] [int] NULL,
	[SvrName] [varchar](20) NULL,
	[PrivateIP] [varchar](16) NULL,
	[PrivatePort] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SecondPasswd]    Script Date: 01/27/2018 19:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SecondPasswd](
	[AID] [int] NOT NULL,
	[Passwd] [varbinary](8000) NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NPC_PROVIDE_EXP]    Script Date: 01/27/2018 19:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPC_PROVIDE_EXP](
	[SID] [int] NOT NULL,
	[Index] [int] NOT NULL,
	[Exp] [int] NOT NULL,
	[Death] [int] NOT NULL,
	[Drop] [int] NOT NULL,
	[Time] [int] NOT NULL,
 CONSTRAINT [PK_NPC_PROVIDE_EXP] PRIMARY KEY CLUSTERED 
(
	[SID] ASC,
	[Index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mobileEventInsertLog]    Script Date: 01/27/2018 19:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobileEventInsertLog](
	[Mnum] [int] NULL,
	[AID] [int] NULL,
	[itemid] [int] NULL,
	[itemcount] [int] NULL,
	[insertdate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mobileEvent]    Script Date: 01/27/2018 19:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobileEvent](
	[MNum] [int] IDENTITY(1,1) NOT NULL,
	[AID] [int] NULL,
	[money] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemCount] [smallint] NOT NULL,
	[couponNum] [int] NOT NULL,
	[remark] [int] NULL,
 CONSTRAINT [PK_mobileEvent] PRIMARY KEY CLUSTERED 
(
	[MNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_couponEvent] ON [dbo].[mobileEvent] 
(
	[couponNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_mobileEvent] ON [dbo].[mobileEvent] 
(
	[AID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddEventPoint]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddEventPoint]
@RET		TINYINT OUTPUT,
@AID		INT,
@POINT	INT
AS

IF @POINT > 0
BEGIN
	SET @RET = 1
	UPDATE POINT SET POINT = POINT+@POINT WHERE AID = @AID
END
ELSE
	SET @RET = 0
GO
/****** Object:  StoredProcedure [dbo].[GetEventPoint]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetEventPoint]
@AID	INT
AS

SELECT POINT FROM POINT WHERE AID = @AID
GO
/****** Object:  StoredProcedure [dbo].[DelEventPoint]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DelEventPoint]
@RET		TINYINT OUTPUT,
@AID		INT,
@POINT	INT
AS

DECLARE @DelPoint	INT
SET @DelPoint = 0
SELECT @DelPoint = POINT FROM POINT WHERE AID = @AID
IF @DelPoint - @POINT >= 0
BEGIN
	SET @RET = 1
	UPDATE POINT SET POINT = POINT-@POINT WHERE AID = @AID
END
ELSE
	SET @RET = 0
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetNpcProvideExp]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_GetNpcProvideExp]
    @sid            int
AS
SET NOCOUNT ON
DELETE FROM NPC_PROVIDE_EXP WHERE sid=@sid and (time < 0 or time = 0)
SELECT [index], exp, death, [drop], time FROM dbo.NPC_PROVIDE_EXP WHERE sid=@sid
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_user_status_info]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_get_user_status_info]
    @AID    [INT]
AS
    SET NOCOUNT ON
    
    DECLARE @Status    [INT]
    
    SELECT @Status = [Status]
    FROM [SecondPasswd] 
    WHERE AID = @AID;
    
    RETURN @Status
    
    SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateStorePassword]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.UpdateStorePassword    스크립트 날짜: 2005-06-09 오후 8:35:42 ******/
CREATE PROCEDURE [dbo].[UpdateStorePassword]
	@AID		int,
	@Pass		int,
	@ErrorCount	int,
	@PanaltyTime	int
	
AS
update StorePassword with (rowlock) set Pass = @Pass, ErrorCount=@ErrorCount,PanaltyTime=@PanaltyTime  where AID=@AID
GO
/****** Object:  StoredProcedure [dbo].[DeleteMobileEvent]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteMobileEvent] 
	@MNum	int
AS
SET NOCOUNT ON

delete mobileEvent where MNum = @MNum
GO
/****** Object:  StoredProcedure [dbo].[InsertStorePassword]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.InsertStorePassword    스크립트 날짜: 2005-06-09 오후 8:35:42 ******/
CREATE PROCEDURE [dbo].[InsertStorePassword] 
	@AID		int
AS	
insert StorePassword values(@AID, default,default,default )
GO
/****** Object:  StoredProcedure [dbo].[InsertMobileEvent]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[InsertMobileEvent] 
	@AID		int,
	@ItemID		int,
	@ItemCount	int
	
AS	
DECLARE @Mnum int
	


insert into mobileEvent (AID,ItemID,ItemCount)
 values(@AID,@ItemID,@ItemCount )

SELECT top 1 @MNum = MNum
	FROM mobileEvent 
	WHERE Aid = @Aid and ItemId = @ItemId
	ORDER BY MNum Desc

insert into mobileEventInsertLog(MNum,AID,ItemID,ItemCount,InsertDate)
 values(@MNum,@AID,@ItemID,@ItemCount,getdate() )
GO
/****** Object:  StoredProcedure [dbo].[GetStorePassword]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.GetStorePassword    스크립트 날짜: 2005-06-09 오후 8:35:43 ******/
CREATE PROCEDURE [dbo].[GetStorePassword]
	@AID		int
AS
select  Pass, ErrorCount, PanaltyTime  from StorePassword  Where AID=@AID
GO
/****** Object:  StoredProcedure [dbo].[GetServerInfo2]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetServerInfo2]
AS
    SELECT SID,Type, IP, Port,DestinationOneSID, DestinationTwoSID, SvrName, PrivateIP, PrivatePort 
    FROM ServerInfo
GO
/****** Object:  StoredProcedure [dbo].[GetServerInfo]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetServerInfo] AS
	select  SID,Type, IP, Port,DestinationOneSID, DestinationTwoSID, SvrName
	from ServerInfo
GO
/****** Object:  StoredProcedure [dbo].[GetMobileEvent]    Script Date: 01/27/2018 19:29:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMobileEvent] 
	@AID 	int
AS
SET NOCOUNT ON
select *  from mobileEvent  where AID = @AID
GO
/****** Object:  Default [DF_StorePassword_Pass]    Script Date: 01/27/2018 19:29:11 ******/
ALTER TABLE [dbo].[StorePassword] ADD  CONSTRAINT [DF_StorePassword_Pass]  DEFAULT ((-1)) FOR [Pass]
GO
/****** Object:  Default [DF_StorePassword_ErrorCount]    Script Date: 01/27/2018 19:29:11 ******/
ALTER TABLE [dbo].[StorePassword] ADD  CONSTRAINT [DF_StorePassword_ErrorCount]  DEFAULT ((0)) FOR [ErrorCount]
GO
/****** Object:  Default [DF_StorePassword_PanaltyTime]    Script Date: 01/27/2018 19:29:11 ******/
ALTER TABLE [dbo].[StorePassword] ADD  CONSTRAINT [DF_StorePassword_PanaltyTime]  DEFAULT ((0)) FOR [PanaltyTime]
GO
/****** Object:  Default [DF_mobileEvent_money]    Script Date: 01/27/2018 19:29:11 ******/
ALTER TABLE [dbo].[mobileEvent] ADD  CONSTRAINT [DF_mobileEvent_money]  DEFAULT ((0)) FOR [money]
GO
/****** Object:  Default [DF_mobileEvent_ItemID]    Script Date: 01/27/2018 19:29:11 ******/
ALTER TABLE [dbo].[mobileEvent] ADD  CONSTRAINT [DF_mobileEvent_ItemID]  DEFAULT ((0)) FOR [ItemID]
GO
/****** Object:  Default [DF_mobileEvent_ItemCount]    Script Date: 01/27/2018 19:29:11 ******/
ALTER TABLE [dbo].[mobileEvent] ADD  CONSTRAINT [DF_mobileEvent_ItemCount]  DEFAULT ((0)) FOR [ItemCount]
GO
/****** Object:  Default [DF_mobileEvent_couponNum]    Script Date: 01/27/2018 19:29:11 ******/
ALTER TABLE [dbo].[mobileEvent] ADD  CONSTRAINT [DF_mobileEvent_couponNum]  DEFAULT ((0)) FOR [couponNum]
GO
