USE [master]
GO
/****** Object:  Database [ItemLog]    Script Date: 02/16/2018 13:53:27 ******/
CREATE DATABASE [ItemLog] ON  PRIMARY 
( NAME = N'ItemLog_Data', FILENAME = N'C:\AEGIS\DB\ItemLog_Data.MDF' , SIZE = 10048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'ItemLog_Log', FILENAME = N'C:\AEGIS\DB\ItemLog_Log.LDF' , SIZE = 10048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ItemLog] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ItemLog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ItemLog] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ItemLog] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ItemLog] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ItemLog] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ItemLog] SET ARITHABORT OFF
GO
ALTER DATABASE [ItemLog] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ItemLog] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ItemLog] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ItemLog] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ItemLog] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ItemLog] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ItemLog] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ItemLog] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ItemLog] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ItemLog] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ItemLog] SET  ENABLE_BROKER
GO
ALTER DATABASE [ItemLog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ItemLog] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ItemLog] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ItemLog] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ItemLog] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ItemLog] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ItemLog] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ItemLog] SET  READ_WRITE
GO
ALTER DATABASE [ItemLog] SET RECOVERY FULL
GO
ALTER DATABASE [ItemLog] SET  MULTI_USER
GO
ALTER DATABASE [ItemLog] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [ItemLog] SET DB_CHAINING OFF
GO
USE [ItemLog]
GO
/****** Object:  User [loger]    Script Date: 02/16/2018 13:53:27 ******/
CREATE USER [loger] FOR LOGIN [loger] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[deleteCharacterLog]    Script Date: 02/16/2018 13:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deleteCharacterLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[GID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[characterName] [varchar](24) NULL,
	[IP] [varchar](24) NULL,
	[joblevel] [int] NULL,
	[level] [int] NOT NULL,
	[job] [int] NOT NULL,
 CONSTRAINT [PK_deleteCharacterLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[deleteblockinfo]    Script Date: 02/16/2018 13:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deleteblockinfo](
	[GID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[BlockDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[createCharacterLog]    Script Date: 02/16/2018 13:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[createCharacterLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[GID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[characterName] [varchar](24) NULL,
	[membership] [tinyint] NOT NULL,
	[IP] [varchar](24) NULL,
 CONSTRAINT [PK_createCharacterLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[deleteConnectLog_old]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--------------------------------------------------------------
-- ConnectLog Table 오래된 Data 삭제
--------------------------------------------------------------
create procedure [dbo].[deleteConnectLog_old]
AS
-- DB 복구 모델 변경 ‘최대’
ALTER DATABASE log SET RECOVERY FULL
-- 트랜잭션 로그 파일 증가 : 무제한으로 변경
alter database log
modify file
(	name = log_log,
 	size = 10MB,
 	maxsize = unlimited,
 	filegrowth =50%
)
-- 어제 날짜까지 Data  삭제
delete from connectLog
where [index] in 
(	SELECT   [index]
 	FROM      connectLog
	WHERE  [date] < CONVERT(char(10), getdate(),20)
)
-- character Data 파일과 트랜잭션 로그 축소
DBCC SHRINKFILE (log_Data, NOTRUNCATE)
DBCC SHRINKFILE (log_log, NOTRUNCATE)
-- 트랜잭션 로그 원래 Size로 변경
alter database log
modify file
(	name = log_log,
 	size = 2MB,
 	maxsize = 2MB,
 	filegrowth =10%
)
-- DB 복구 모델 변경 : 단순
ALTER DATABASE log SET RECOVERY simple
GO
/****** Object:  Table [dbo].[compositionLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[compositionLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[accountID] [int] NULL,
	[accountName] [varchar](24) NULL,
	[characterID] [int] NULL,
	[characterName] [varchar](24) NULL,
	[mapName] [varchar](25) NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[addedCardID] [int] NULL,
	[slot1] [int] NULL,
	[slot2] [int] NULL,
	[slot3] [int] NULL,
	[slot4] [int] NULL,
	[equipItem] [int] NULL,
	[serial] [int] NULL,
 CONSTRAINT [PK_compositionLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CLevelLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLevelLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[AID] [int] NULL,
	[GID] [int] NULL,
	[charName] [varchar](24) NULL,
	[clevel] [int] NULL,
	[joblevel] [int] NULL,
 CONSTRAINT [PK_CLevelLog] PRIMARY KEY NONCLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CharConnectLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CharConnectLog](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[AID] [int] NOT NULL,
	[GID] [int] NOT NULL,
	[Membership] [tinyint] NULL,
	[CharName] [varchar](24) NULL,
	[Login] [datetime] NULL,
	[LogOut] [datetime] NULL,
	[ip] [varchar](18) NULL,
	[Job] [int] NULL,
	[cLevel] [smallint] NULL,
	[JobLevel] [int] NULL,
	[PlayTime]  AS (datediff(second,[Login],[Logout])),
 CONSTRAINT [PK_CharConnectLog] PRIMARY KEY CLUSTERED 
(
	[Index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[charblockinfo]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[charblockinfo](
	[GID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[BlockDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[characterLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[characterLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[logdate] [datetime] NULL,
	[action] [int] NULL,
	[accountID] [int] NULL,
	[accountName] [varchar](24) NULL,
	[characterID] [int] NULL,
	[characterName] [varchar](24) NULL,
	[ip] [varchar](20) NULL,
 CONSTRAINT [PK_characterLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[changematerial]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[changematerial](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[action] [int] NOT NULL,
	[zsid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[mapname] [varchar](24) NULL,
	[x] [int] NOT NULL,
	[y] [int] NOT NULL,
	[itid] [int] NOT NULL,
	[itcnt] [int] NOT NULL,
	[itslot1] [int] NOT NULL,
	[itslot2] [int] NOT NULL,
	[itslot3] [int] NOT NULL,
	[itslot4] [int] NOT NULL,
	[itrefinglevel] [int] NOT NULL,
	[itserial] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bossmobhunting]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bossmobhunting](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[sprite] [int] NULL,
	[name] [varchar](24) NULL,
	[mapname] [varchar](16) NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[type] [int] NULL,
	[aid] [int] NULL,
	[gid] [int] NULL,
	[contribution_factor] [int] NULL,
	[finalatk] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UpdateCharLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UpdateCharLog](
	[GID] [int] NOT NULL,
	[CharName_Old] [varchar](24) NULL,
	[CharName_New] [varchar](24) NULL,
	[GDID] [int] NOT NULL,
	[Position] [smallint] NOT NULL,
	[RegDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[statusLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[statusLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[accountID] [int] NULL,
	[accountName] [varchar](24) NULL,
	[characterID] [int] NULL,
	[characterName] [varchar](24) NULL,
	[mapName] [varchar](25) NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[str] [int] NULL,
	[agi] [int] NULL,
	[vit] [int] NULL,
	[int] [int] NULL,
	[dex] [int] NULL,
	[luk] [int] NULL,
	[jobPoint] [int] NULL,
 CONSTRAINT [PK_statusLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[skillLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[skillLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[accountID] [int] NULL,
	[accountName] [varchar](24) NULL,
	[characterID] [int] NULL,
	[characterName] [varchar](24) NULL,
	[mapName] [varchar](25) NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[skillID] [int] NULL,
	[skillLevel] [int] NULL,
	[extraSkillPoint] [int] NULL,
 CONSTRAINT [PK_skillLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[refiningLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[refiningLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[accountID] [int] NULL,
	[accountName] [varchar](24) NULL,
	[characterID] [int] NULL,
	[characterName] [varchar](24) NULL,
	[mapName] [varchar](25) NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[success] [int] NULL,
	[itemID] [int] NULL,
	[itemLevel] [int] NULL,
	[Serialcode] [bigint] NULL,
 CONSTRAINT [PK_refiningLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReAssemblyPacketLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReAssemblyPacketLog](
	[InsertDate] [datetime] NULL,
	[Type] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[GID] [int] NOT NULL,
	[MapName] [varchar](16) NULL,
	[XPos] [int] NOT NULL,
	[YPos] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[presentLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[presentLog](
	[accountID] [int] NULL,
	[accountName] [varchar](24) NULL,
	[characterID] [int] NULL,
	[characterName] [varchar](24) NULL,
	[mapName] [varchar](25) NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[itemID] [int] NULL,
	[date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PetLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PetLog](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[GID] [int] NOT NULL,
	[PetID] [int] NULL,
	[PetName] [varchar](24) NULL,
	[Modified] [tinyint] NULL,
	[SpriteType] [int] NULL,
	[Lv] [int] NULL,
	[Fullness] [int] NULL,
	[Relation] [int] NULL,
	[Accessary] [int] NULL,
	[mapName] [varchar](25) NULL,
	[Action] [int] NULL,
 CONSTRAINT [PK_PetLog] PRIMARY KEY CLUSTERED 
(
	[Index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCInfoUpdateLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCInfoUpdateLog](
	[AID] [int] NOT NULL,
	[SID] [int] NOT NULL,
	[date] [datetime] NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PCInfoUpdateLog', @level2type=N'COLUMN',@level2name=N'AID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PCInfoUpdateLog', @level2type=N'COLUMN',@level2name=N'SID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'기록시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PCInfoUpdateLog', @level2type=N'COLUMN',@level2name=N'date'
GO
/****** Object:  Table [dbo].[mercenary_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mercenary_log](
	[type] [int] NULL,
	[date] [datetime] NOT NULL,
	[account_id] [int] NULL,
	[account_name] [varchar](25) NULL,
	[character_id] [int] NULL,
	[character_name] [varchar](25) NULL,
	[job] [int] NULL,
	[remain_life_second] [int] NULL,
	[approval_monster_kill_counter] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mdungeonLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mdungeonLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[type] [int] NOT NULL,
	[mdungeon_name] [varchar](61) NULL,
	[party_name] [varchar](24) NULL,
	[party_id] [int] NULL,
	[create_zsid] [int] NULL,
 CONSTRAINT [PK_mdungeonLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mapstatisticLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mapstatisticLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[name] [varchar](16) NULL,
	[zsvr] [int] NOT NULL,
	[player] [int] NOT NULL,
 CONSTRAINT [PK_mapstatisticLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[makingLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[makingLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[accountID] [int] NULL,
	[accountName] [varchar](24) NULL,
	[characterID] [int] NULL,
	[characterName] [varchar](24) NULL,
	[mapName] [varchar](25) NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[success] [int] NULL,
	[itemID] [int] NULL,
	[meterial1] [int] NULL,
	[meterial2] [int] NULL,
	[meterial3] [int] NULL,
 CONSTRAINT [PK_makingLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[levelupandjobchange]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[levelupandjobchange](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[aid] [int] NULL,
	[gid] [int] NULL,
	[type] [int] NULL,
	[level] [int] NULL,
	[joblevel] [int] NULL,
	[job] [int] NULL,
	[exp] [int] NULL,
	[mapname] [varchar](16) NULL,
	[x] [int] NULL,
	[y] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[itemLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[itemLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[Ver] [int] NULL,
	[SID] [int] NULL,
	[Action] [int] NULL,
	[logtime] [datetime] NULL,
	[ip] [varchar](20) NULL,
	[eventx] [int] NULL,
	[eventy] [int] NULL,
	[srcAccountID] [int] NULL,
	[srcAccountName] [varchar](24) NULL,
	[srcCharID] [int] NULL,
	[srcCharName] [varchar](24) NULL,
	[srcJobType] [int] NULL,
	[srcLevel] [int] NULL,
	[desAccountID] [int] NULL,
	[desAccountName] [varchar](24) NULL,
	[desCharID] [int] NULL,
	[desCharName] [varchar](24) NULL,
	[Serialcode] [bigint] NULL,
	[ItemName] [varchar](24) NULL,
	[ItemID] [int] NULL,
	[ItemCount] [int] NULL,
	[MapName] [varchar](24) NULL,
	[price] [int] NULL,
	[slot1] [int] NULL,
	[slot2] [int] NULL,
	[slot3] [int] NULL,
	[slot4] [int] NULL,
	[refiningLevel] [int] NULL,
	[AuctionID] [int] NULL,
	[ItemBuyCash] [int] NULL,
	[Zeny] [int] NULL,
	[DestZeny] [int] NULL,
	[ItemHireExpireDate] [datetime] NULL,
	[bizType] [int] NULL,
	[identity] [bigint] NOT NULL,
 CONSTRAINT [PK_itemLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemList]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemList](
	[id] [int] NOT NULL,
	[name] [varchar](40) NULL,
	[type] [smallint] NOT NULL,
 CONSTRAINT [PK_ItemList] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_ItemList] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IrMailLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IrMailLog](
	[Idx] [int] IDENTITY(1,1) NOT NULL,
	[LogDate] [datetime] NULL,
	[TRXID] [bigint] NULL,
	[Action] [int] NULL,
	[MailOffice] [int] NULL,
	[MailID] [int] NULL,
	[Title] [varchar](40) NULL,
	[ReceiverAID] [int] NULL,
	[ReceiverGID] [int] NULL,
	[SenderAID] [int] NULL,
	[SenderGID] [int] NULL,
	[Zeny] [int] NULL,
	[IT_ITID] [smallint] NULL,
	[IT_Count] [smallint] NULL,
	[IT_Kind] [tinyint] NULL,
	[IT_Property] [tinyint] NULL,
	[IT_CreatorGID] [int] NULL,
	[IT_bIdentify] [bit] NULL,
	[IT_bBind] [bit] NULL,
	[IT_bDamaged] [bit] NULL,
	[IT_RefiningLevel] [tinyint] NULL,
	[IT_Card1] [smallint] NULL,
	[IT_Card2] [smallint] NULL,
	[IT_Card3] [smallint] NULL,
	[IT_Card4] [smallint] NULL,
	[IT_SerialNum] [bigint] NULL,
	[IT_HireExpireDate] [smalldatetime] NULL,
	[IT_BonusATK] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Homun]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Homun](
	[homunID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Describe] [varchar](16) NULL,
	[MasterName] [varchar](24) NULL,
	[Name] [varchar](24) NULL,
	[Fullness] [int] NOT NULL,
	[Relation] [int] NOT NULL,
	[job] [smallint] NOT NULL,
	[clevel] [smallint] NOT NULL,
	[hp] [smallint] NOT NULL,
	[maxHP] [smallint] NOT NULL,
	[sp] [smallint] NOT NULL,
	[maxSP] [smallint] NOT NULL,
	[mapName] [varchar](16) NULL,
	[x] [smallint] NOT NULL,
	[y] [smallint] NOT NULL,
	[Str] [smallint] NOT NULL,
	[Agi] [smallint] NOT NULL,
	[Vit] [smallint] NOT NULL,
	[Int] [smallint] NOT NULL,
	[Dex] [smallint] NOT NULL,
	[Luk] [smallint] NOT NULL,
	[SKPoint] [smallint] NOT NULL,
	[aid] [int] NULL,
	[gid] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_zenychecksumlog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_zenychecksumlog]
/*  @date	[date] DATEtime
  @zsid	[zsid] int
  @aid	[aid] int
  @gid	[gid] int
  @vzeny	[valid_zeny]	int
  @izeny	[invalid_zeny] int*/
  
  
  @a int
,  @b varchar
,  @c int
,  @d int
,  @e int
,  @f varchar
,  @g int
,  @h int
  
AS
SET NOCOUNT ON

SET NOCOUNT OFF
GO
/****** Object:  Table [dbo].[zsvrstatisticLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zsvrstatisticLog](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[zsid] [int] NOT NULL,
	[player] [int] NOT NULL,
	[npc] [int] NOT NULL,
	[memory] [int] NOT NULL,
	[totalmap] [int] NOT NULL,
	[instantmap] [int] NOT NULL,
 CONSTRAINT [PK_zsvrstatisticLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zenychecksum_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zenychecksum_log](
	[date] [datetime] NOT NULL,
	[zsid] [int] NULL,
	[aid] [int] NULL,
	[gid] [int] NULL,
	[valid_zeny] [int] NULL,
	[invalid_zeny] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddConnectLogWhenLogout]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROCEDURE [dbo].[AddConnectLogWhenLogout]
	@AID 			int

AS

DECLARE @OUT INT
DECLARE @INOUT INT
DECLARE @COUNT INT
	
	SELECT @INOUT=[INDEX] 
	FROM CONNECTLOG 
	WHERE LOGIN IN (
			SELECT MAX(LOGIN) 
			FROM CONNECTLOG 
			WHERE AID=@AID AND LOGOUT IS NOT  NULL)

SET @COUNT=@@ROWCOUNT
	
	SELECT @OUT =[INDEX]
	FROM CONNECTLOG 
	WHERE LOGIN IN (
			SELECT MAX(LOGIN) 
			FROM CONNECTLOG 
			WHERE AID=@AID AND LOGOUT IS NULL)

IF @COUNT=0


	UPDATE CONNECTLOG 
	SET LOGOUT=GETDATE()
	WHERE [INDEX] IN (
			SELECT [INDEX]
			FROM CONNECTLOG 
			WHERE LOGIN IN (
					SELECT MAX(LOGIN) 
					FROM CONNECTLOG 
					WHERE AID=@AID AND LOGOUT IS NULL))


ELSE IF @OUT>@INOUT


	UPDATE CONNECTLOG 
	SET LOGOUT=GETDATE()
	WHERE [INDEX]=@OUT

ELSE

RETURN
GO
/****** Object:  StoredProcedure [dbo].[AddConnectLogWhenLogin]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROCEDURE [dbo].[AddConnectLogWhenLogin]
	@szIP    			char(18)
,	@szID			varchar(24)
,	@AID 			int
,	@bHangameUser 	bit
AS


INSERT INTO connectlog ([login], ip, id, AID,membership)  VALUES(GETDATE(), @szIP, @szID, @AID, @bHangameUser)
GO
/****** Object:  StoredProcedure [dbo].[AddConnectLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddConnectLog]
	@szIP       char(18),
	@szID varchar(24)
AS
INSERT INTO connectlog ( ip, id)  VALUES( @szIP, @szID)
GO
/****** Object:  StoredProcedure [dbo].[AddCompositionLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCompositionLog]
	@accountID     int,
	@accountName   varchar(24),
	@characterID   int,
	@characterName varchar(24),
	@mapName       varchar(25),
	@x             int,
	@y             int,
	@addedCardID   int,
	@slot1         int,
	@slot2         int,
	@slot3         int,
	@slot4         int,
	@equipItem int,
	@serial	       int
AS
INSERT INTO compositionLog ([date], accountID, accountName, characterID, characterName, mapName, x, y, addedCardID, slot1, slot2, slot3, slot4,equipItem,serial) VALUES(default, @accountID, @accountName, @characterID, @characterName, @mapName, @x, @y, @addedCardID, @slot1, @slot2, @slot3, @slot4, @equipItem, @serial)
GO
/****** Object:  StoredProcedure [dbo].[AddCLevelLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddCLevelLog]
	@accountID     int,
	@characterID	int,
	@characterName varchar(24),
	@characterLevel int,
	@characterJobLevel int

AS
SET NOCOUNT ON

INSERT INTO CLevelLog ([date], aid, gid, charName, clevel, joblevel)
VALUES (default, @accountID, @characterID, @characterName, @characterLevel, @characterJobLevel)
GO
/****** Object:  StoredProcedure [dbo].[AddCharacterLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCharacterLog]
	@action int,
	@AccountID int,
	@AccountName varchar(24),
	@CharacterID int,
	@CharacterName varchar(24),
	@IP varchar(24)
AS
INSERT INTO characterLog (logdate, [action], accountID, accountName, CharacterID, CharacterName, ip) VALUES(default, 	@action, @AccountID, @AccountName, @CharacterID, @CharacterName, @IP)
GO
/****** Object:  StoredProcedure [dbo].[usp_szvrstatistic_add_r2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_szvrstatistic_add_r2]
	@date		DATETIME,
	@zsid		INT,
	@player 		INT,
	@npc		INT,
	@memory 	INT,
	@totalmap	INT,
	@instantmap 	INT
AS
	SET NOCOUNT ON

	INSERT zsvrstatisticLog([date],zsid,player,npc,memory,totalmap,instantmap)
		VALUES(@date,@zsid,@player,@npc,@memory,@totalmap,@instantmap)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_szvrstatistic_add]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_szvrstatistic_add]
	@zsid		INT,
	@player 		INT,
	@npc		INT,
	@memory 	INT,
	@totalmap	INT,
	@instantmap 	INT
AS
	SET NOCOUNT ON

	INSERT zsvrstatisticLog(zsid,player,npc,memory,totalmap,instantmap)
		VALUES(@zsid,@player,@npc,@memory,@totalmap,@instantmap)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_reassemblypacket_log_insert]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_reassemblypacket_log_insert] 
	@Type		INT,
	@AID		INT,
	@GID		INT,
	@MapName	VARCHAR(16),
	@XPos		INT,
	@YPos		INT
AS	
	INSERT INTO ReAssemblyPacketLog(Type,AID,GID,MapName,XPos,YPos)
		VALUES(@Type,@AID,@GID,@MapName,@XPos,@YPos)
GO
/****** Object:  StoredProcedure [dbo].[usp_mdungeonlog_add]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mdungeonlog_add]
	@type 			INT,
	@mdungeon_name 	VARCHAR(61),
	@party_name 	VARCHAR(24),
	@party_id		INT,
	@create_zsid 	INT
AS
	SET NOCOUNT ON

	INSERT mdungeonLog(type,mdungeon_name,party_name,party_id,create_zsid) 
		VALUES(@type,@mdungeon_name,@party_name,@party_id,@create_zsid)

	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mapstatistic_add_r2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mapstatistic_add_r2]
	@date		DATETIME,
	@name 		VARCHAR(16),
	@zsvr		INT,
	@player 	INT

AS
	SET NOCOUNT ON

	INSERT mapstatisticLog([date],[name],zsvr,player)
		VALUES(@date,@name,@zsvr,@player)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mapstatistic_add]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mapstatistic_add]
	@name 		VARCHAR(16),
	@zsvr		INT,
	@player 	INT

AS
	SET NOCOUNT ON

	INSERT mapstatisticLog([name],zsvr,player)
		VALUES(@name,@zsvr,@player)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_levelupandjobchange_insert_2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_levelupandjobchange_insert_2]
	@aid	  INT,
	@gid	  INT,
	@type	  INT,
	@level    INT,
	@joblevel INT,
	@job	  INT,
	@exp	  INT,
	@mapname  VARCHAR(16),
	@x		  INT,
	@y		  INT,
	@unknown  BIGINT
AS
	SET NOCOUNT ON
	INSERT INTO levelupandjobchange(aid,gid,[type],[level],joblevel,job,[exp],mapname,x,y) 
		VALUES(@aid,@gid,@type,@level,@joblevel,@job,@exp,@mapname,@x,@y)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_levelupandjobchange_insert]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_levelupandjobchange_insert]
	@aid	  INT,
	@gid	  INT,
	@type	  INT,
	@level    INT,
	@joblevel INT,
	@job	  INT,
	@exp	  INT,
	@mapname  VARCHAR(16),
	@x		  INT,
	@y		  INT
AS
	SET NOCOUNT ON
	INSERT INTO levelupandjobchange(aid,gid,[type],[level],joblevel,job,[exp],mapname,x,y) 
		VALUES(@aid,@gid,@type,@level,@joblevel,@job,@exp,@mapname,@x,@y)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_irmail_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_irmail_log]	
	@TRXID			BIGINT,
	-- 기본정보
	@Action			INT,
	@MailOffice		INT,
	@MailID			INT,
	@Title			VARCHAR(40),
	-- 수신자
	@ReceiverAID	INT,
	@ReceiverGID	INT,	
	-- 송신자
	@SenderAID		INT,
	@SenderGID		INT,
	-- 제니
	@Zeny			INT,
	-- 아이템관련 정보
	@IT_ITID			SMALLINT,		-- 아이템 ID
	@IT_Count			SMALLINT,		-- 아이템 갯수	
	@IT_Kind			TINYINT,		-- 일반(0),블렉스미스제작(1),제작자명이 있는(2) 	
	@IT_Property		TINYINT,		-- 속성
	@IT_CreatorGID	    INT,			-- 아이템생성 케릭터 ID		
	@IT_bIdentify		BIT,			-- 확인여부
	@IT_bBind			BIT,			-- 귀속여부
	@IT_bDamaged		BIT,			-- 손상여부
	@IT_RefiningLevel	TINYINT,		-- 제련레벨
	@IT_Card1			SMALLINT,		-- 카드1
	@IT_Card2			SMALLINT,		-- 카드2
	@IT_Card3			SMALLINT,		-- 카드3
	@IT_Card4			SMALLINT,		-- 카드4
	@IT_SerialNum		BIGINT,			-- unique identity number
	@IT_HireExpireDate	SMALLDATETIME,	-- 임대만료시간
	@IT_BonusATK		TINYINT 		-- 블렉스미스제작템에 대한 추가 ATK값 (무지쎈(5),무지무지쎈(10),무무무쎈(40))
AS	
	SET NOCOUNT ON
	
		
	INSERT dbo.IrMailLog(
		TRXID,
		-- 기본정보
		[Action],
		MailOffice,
		MailID,
		Title,
		-- 수신자
		ReceiverAID,
		ReceiverGID,	
		-- 송신자
		SenderAID,
		SenderGID,
		-- 제니
		Zeny,
		-- 아이템관련 정보
		IT_ITID,			-- 아이템 ID
		IT_Count,			-- 아이템 갯수	
		IT_Kind,			-- 일반(0),블렉스미스제작(1),제작자명이 있는(2) 	
		IT_Property,		-- 속성
		IT_CreatorGID,		-- 아이템생성 케릭터 ID		
		IT_bIdentify,		-- 확인여부
		IT_bBind,			-- 귀속여부
		IT_bDamaged,		-- 손상여부
		IT_RefiningLevel,	-- 제련레벨
		IT_Card1,			-- 카드1
		IT_Card2,			-- 카드2
		IT_Card3,			-- 카드3
		IT_Card4,			-- 카드4
		IT_SerialNum,		-- unique identity number
		IT_HireExpireDate,	-- 임대만료시간
		IT_BonusATK			-- 블렉스미스제작템에 대한 추가 ATK값 (무지쎈(5),무지무지쎈(10),무무무쎈(40))
	)
		VALUES(
			@TRXID,
			-- 기본정보
			@Action,
			@MailOffice,
			@MailID,
			@Title,
			-- 수신자
			@ReceiverAID,
			@ReceiverGID,	
			-- 송신자
			@SenderAID,
			@SenderGID,
			-- 제니
			@Zeny,
			-- 아이템관련 정보
			@IT_ITID,			-- 아이템 ID
			@IT_Count,			-- 아이템 갯수	
			@IT_Kind,			-- 일반(0),블렉스미스제작(1),제작자명이 있는(2) 	
			@IT_Property,		-- 속성
			@IT_CreatorGID,		-- 아이템생성 케릭터 ID		
			@IT_bIdentify,		-- 확인여부
			@IT_bBind,			-- 귀속여부
			@IT_bDamaged,		-- 손상여부
			@IT_RefiningLevel,	-- 제련레벨
			@IT_Card1,			-- 카드1
			@IT_Card2,			-- 카드2
			@IT_Card3,			-- 카드3
			@IT_Card4,			-- 카드4
			@IT_SerialNum,		-- unique identity number
			@IT_HireExpireDate,	-- 임대만료시간
			@IT_BonusATK			-- 블렉스미스제작템에 대한 추가 ATK값 (무지쎈(5),무지무지쎈(10),무무무쎈(40))
		)
			
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_ins_createCharacterLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_ins_createCharacterLog]
	@nGID int,
	@nAID int,
	@szCharName varchar(24),
	@membership tinyint,
	@szIP varchar(24)
AS
SET NOCOUNT ON

INSERT INTO createCharacterLog ([date],gid,aid,characterName,membership,ip)
VALUES(GetDate(), @nGID, @nAID, @szCharName, @membership, @szIP)
GO
/****** Object:  StoredProcedure [dbo].[usp_deletecharlog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_deletecharlog]
	@GID		INT,
	@AID		INT,
	@Name		VARCHAR(24),
	@IPaddr		VARCHAR(24),
	@job		INT,
	@level		INT,
	@joblevel	INT
AS
	SET NOCOUNT ON	
	INSERT INTO deleteCharacterLog(GID,AID,characterName,IP,job,[level],joblevel)
		VALUES (@GID,@AID,@Name,@IPaddr,@job,@level,@joblevel)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_bossmobhunting_insert]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_bossmobhunting_insert]
	@sprite				INT,
	@name				VARCHAR(24),
	@mapname			VARCHAR(16),
	@x					INT,
	@y					INT,	
	@type					INT,
	@aid					INT,
	@gid					INT,
	@contribution_factor	INT,
	@finalatk				INT
AS
	SET NOCOUNT ON
	INSERT INTO bossmobhunting(sprite,name,mapname,x,y,[type],aid,gid,contribution_factor,finalatk)	
		VALUES(@sprite,@name,@mapname,@x,@y,@type,@aid,@gid,@contribution_factor,@finalatk)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_addchangemateriallog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_addchangemateriallog]
	@action			INT,	
	@zsid			INT,
	@gid			INT,
	@mapname		VARCHAR(24),
	@x				INT,
	@y				INT,
	@itid			INT,
	@itcnt			INT,
	@itslot1		INT,
	@itslot2		INT,
	@itslot3		INT,
	@itslot4		INT,
	@itrefinglevel	INT,
	@itserial		BIGINT
AS
	SET NOCOUNT ON
	INSERT INTO changematerial(action,zsid,gid,mapname,x,y,itid,itcnt,itslot1,itslot2,itslot3,itslot4,itrefinglevel,itserial) 
		VALUES(@action,@zsid,@gid,@mapname,@x,@y,@itid,@itcnt,@itslot1,@itslot2,@itslot3,@itslot4,@itrefinglevel,@itserial)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_status_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_add_status_log]

 @accountID	int,  
 @characterID	int,  
 @characterName varchar(24),  
 @mapName	varchar(25),  
 @x		int,  
 @y		int,  
 @str		int,  
 @agi		int,  
 @vit		int,  
 @int		int,  
 @dex		int,  
 @luk		int,  
 @jobPoint	int  
AS  
INSERT INTO statusLog ( accountID, [date],  characterID, characterName, mapName, x, y, str, agi, vit, int, dex, luk, jobPoint)  
 VALUES ( @accountID, default, @characterID, @characterName, @mapName, @x, @y, @str, @agi, @vit, @int, @dex, @luk, @jobPoint)
GO
/****** Object:  StoredProcedure [dbo].[usp_add_skill_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_skill_log]  
 @accountID	int,  
 @characterID	int,  
 @characterName varchar(24),  
 @mapName	varchar(25),  
@x		int,  
 @y		int,  
 @skillID		int,  
 @skillLevel	int,  
 @extraSkillPoint	int  
AS  
SET NOCOUNT ON
	INSERT INTO skillLog ([date], accountID, characterID, characterName, mapName, x, y, skillID, skillLevel, extraSkillPoint) 
	VALUES(default, @accountID, @characterID, @characterName, @mapName, @x, @y, @skillID, @skillLevel, @extraSkillPoint)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_refining_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_refining_log]
	@accountID	int,
	@characterID	int,
	@characterName varchar(24),
	@mapName	varchar(25),
        	@x		int,
	@y		int,
	@success	int,
	@itemID		int,
	@itemLevel	int,
             @Serialcode	BIGINT
AS
SET NOCOUNT ON
	INSERT INTO refiningLog ([date], accountID, characterID, characterName, mapName, x, y, success, itemID, itemLevel, Serialcode) 
	VALUES(default, @accountID, @characterID, @characterName, @mapName, @x, @y, @success, @itemID, @itemLevel, @Serialcode)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_present_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_present_log]
	@accountID     		int,
	@characterID  		 int,
	@characterName 	varchar(24),
	@mapName       	varchar(25),
        	@x             		int,
	@y             		int,
	@itemID       		 int
AS
SET NOCOUNT ON
	INSERT INTO presentLog (accountID, characterID, characterName, mapName, x, y, itemID) 
	VALUES(@accountID, @characterID, @characterName, @mapName, @x, @y,  @itemID)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_mercenary_log_2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_mercenary_log_2]
	--로그관련 정보
	@type				INT,
	--소유주 관련정보 
	@account_id			INT,
	@character_id			INT,
	@character_name  		VARCHAR(25),
	--용병관련정보
	@job				INT,
	@remain_life_second		INT,
	@approval_monster_kill_counter	INT
AS
	SET NOCOUNT ON
	INSERT INTO mercenary_log(type,
				    account_id, character_id, character_name,
				    job, remain_life_second, approval_monster_kill_counter)
		VALUES(@type,
			@account_id,@character_id,@character_name,
			@job,@remain_life_second,@approval_monster_kill_counter)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_mercenary_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_add_mercenary_log]
	--로그관련 정보
	@type				INT,
	--소유주 관련정보 
	@account_id			INT,
	@account_name			VARCHAR(25),
	@character_id			INT,
	@character_name  		VARCHAR(25),
	--용병관련정보
	@job				INT,
	@remain_life_second		INT,
	@approval_monster_kill_counter	INT
AS
	SET NOCOUNT ON
	INSERT INTO mercenary_log(type,
				    account_id,account_name,character_id,character_name,
				    job,remain_life_second,approval_monster_kill_counter)
		VALUES(@type,
			@account_id,@account_name,@character_id,@character_name,
			@job,@remain_life_second,@approval_monster_kill_counter)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_making_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_making_log]
	@accountID     		int,
	@characterID  		 int,
	@characterName 	varchar(24),
	@mapName       	varchar(25),
        	@x             		int,
	@y             		int,
	@success       		int,
	@itemID       		 int,
	@meterial1     		int,
	@meterial2     		int,
	@meterial3     		int
AS
SET NOCOUNT ON
	INSERT INTO makingLog ([date], accountID, characterID, characterName, mapName, x, y, success, itemID, meterial1, meterial2, meterial3) 
	VALUES(default, @accountID, @characterID, @characterName, @mapName, @x, @y, @success, @itemID, @meterial1, @meterial2, @meterial3)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog6_jpn]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_add_itemlog6_jpn]
	@Ver			INT,
	@SID			INT,
	@Action			INT,
	@IPaddr			VARCHAR(20),
	@MapName		VARCHAR(24),
	@Eventx			INT,
	@Eventy			INT,
	@SrcAccountID	INT,
	@SrcAccountName VARCHAR(24),
	@SrcCharID		INT,
	@SrcCharName	VARCHAR(24),
	@DesAccountID	INT,
	@DesCharID		INT,
	@DesCharName	VARCHAR(24),
	@DesAccountName	VARCHAR(24),
	@ItemID				INT,
	@ItemName			VARCHAR(24),
	@ItemBuyCash		BIT,
	@ItemSerialNum		BIGINT,
	@ItemCount			INT,
	@ItemPrice			INT,
	@ItemSlot1			INT,
	@ItemSlot2			INT,
	@ItemSlot3			INT,
	@ItemSlot4			INT,
	@ItemRefiningLevel	INT,	
	@ItemHireExpireDate	DATETIME,
	@AuctionID		INT,
	@Zeny			INT,
	@destZeny		INT,
	@bizType		INT,
	@srcJob			INT,
	@srcLevel		INT,
	@Identity		BIGINT, 
	@LogTime		INT
AS
	SET NOCOUNT ON	

	INSERT INTO itemlog( 
		[Ver], 
		[SID], 
		[Action], 
		[logtime], 
		[ip], 
		[MapName], 
		[eventx], 
		[eventy], 
		[srcAccountID], 
		[srcAccountName],
		[srcCharID], 
		[srcCharName], 
		[srcJobType], 
		[srcLevel],
		[desAccountID], 
		[desAccountName],
		[desCharID], 
		[desCharName], 
		[ItemID], 
	    [ItemName], 
	    [ItemBuyCash], 
	    [Serialcode], 
	    [ItemCount],
	    [price], 
	    [slot1], 
	    [slot2], 
	    [slot3], 
	    [slot4],
	    [refiningLevel], 
	    [ItemHireExpireDate],
		[AuctionID], 
	    [Zeny], 
	    [DestZeny], 
	    [bizType],
	    [identity] )
	VALUES(
		@Ver, 
		@SID, 
		@Action, 
		DATEADD( S, @LogTime, DATEADD( S, DATEDIFF( S, GETUTCDATE(), GETDATE() ), '19700101' ) ), 
		@IPaddr, 
		@MapName, 
		@Eventx, 
		@Eventy,
		@SrcAccountID,
		@SrcAccountName, 
		@SrcCharID, 
		@SrcCharName, 
		@srcJob, 
		@srcLevel,
		@DesAccountID, 
		@DesAccountName,
		@DesCharID, 
		@DesCharName,
		@ItemID, 
		@ItemName, 
		@ItemBuyCash, 
		@ItemSerialNum, 
		@ItemCount,
		@ItemPrice, 
		@ItemSlot1, 
		@ItemSlot2, 
		@ItemSlot3, 
		@ItemSlot4,
		@ItemRefiningLevel, 
		@ItemHireExpireDate,
		@AuctionID, 
		@Zeny, 
		@destZeny, 
		@bizType,
		@identity )

	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog5]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_add_itemlog5]
	@Ver			INT,
	@SID			INT,
	@Action			INT,
	@IPaddr			VARCHAR(20),
	@MapName		VARCHAR(24),
	@Eventx			INT,
	@Eventy			INT,
	--이벤트발생자 정보
	@SrcAccountID		INT,
	@SrcCharID		INT,
	@SrcCharName		VARCHAR(24),
	--대상자정보
	@DesAccountID		INT,
	@DesCharID		INT,
	@DesCharName		VARCHAR(24),
	--아이템관련정보
	@ItemID			INT, -- ITP 레코드 인련번호
	@ItemName		VARCHAR(24),
	@ItemBuyCash		BIT, --캐쉬로 구입한 아이템인가여부
	@ItemSerialNum		BIGINT,
	@ItemCount		INT,
	@ItemPrice		INT,
	@ItemSlot1		INT,
	@ItemSlot2		INT,
	@ItemSlot3		INT,
	@ItemSlot4		INT,
	@ItemRefiningLevel	INT,	
	@ItemHireExpireDate	DATETIME, --임대아이템의 경우 만료일자
	--옥션관련정보
	@AuctionID		INT,
	@Zeny			INT,
	@destZeny		INT = -1,
	@bizType		INT = 0,
	@srcJob			INT = 0,
	@srcLevel		INT = 0,
	-- identity
	@Identity		BIGINT = 0
AS
	SET NOCOUNT ON

	INSERT INTO itemlog(Ver,SID,[Action],ip,MapName,eventx,eventy,
			     srcAccountID,srcCharID,srcCharName, srcJobType, srcLevel,
			     desAccountID,desCharID,desCharName,
				 -- 아이템관련정보	
			     ItemID,ItemName,ItemBuyCash,Serialcode,ItemCount,
			     price,slot1,slot2,slot3,slot4,
			     refiningLevel,ItemHireExpireDate,
				 -- 옥션관련정보
			     AuctionID, Zeny, DestZeny, bizType,
			     -- identity
			     [identity])

	VALUES(@Ver, @SID, @Action,@IPaddr,@MapName,@Eventx,@Eventy,
			      @SrcAccountID,@SrcCharID,@SrcCharName, @srcJob, @srcLevel,
			      @DesAccountID,@DesCharID,@DesCharName,
				  -- 아이템관련정보
			      @ItemID,@ItemName,@ItemBuyCash,@ItemSerialNum,@ItemCount,
			      @ItemPrice,@ItemSlot1,@ItemSlot2,@ItemSlot3,@ItemSlot4,
			      @ItemRefiningLevel,@ItemHireExpireDate,
			      -- 옥션관련 작업
			      @AuctionID, @Zeny, @destZeny, @bizType,
			      -- identity
			      @identity)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog_zeny_2_sso]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_add_itemlog_zeny_2_sso]
	@Ver			INT,
	@SID			INT,
	@Action			INT,
	@IPaddr			VARCHAR(20),
	@MapName		VARCHAR(24),
	@Eventx			INT,
	@Eventy			INT,
	--이벤트발생자 정보
	@SrcAccountID		INT,
	@SrcCharID		INT,
	@SrcCharName		VARCHAR(24),
	--대상자정보
	@DesAccountID		INT,
	@DesCharID		INT,
	@DesCharName		VARCHAR(24),
	--아이템관련정보
	@ItemID			INT, -- ITP 레코드 인련번호
	@ItemName		VARCHAR(24),
	@ItemBuyCash		BIT, --캐쉬로 구입한 아이템인가여부
	@ItemSerialNum		BIGINT,
	@ItemCount		INT,
	@ItemPrice		INT,
	@ItemSlot1		INT,
	@ItemSlot2		INT,
	@ItemSlot3		INT,
	@ItemSlot4		INT,
	@ItemRefiningLevel	INT,	
	@ItemHireExpireDate	DATETIME, --임대아이템의 경우 만료일자
	--옥션관련정보
	@AuctionID		INT,
	@Zeny			INT,
	@destZeny		INT = -1,
	@bizType		INT = 0
AS
SET NOCOUNT ON
	INSERT INTO itemlog(Ver,SID,[Action],ip,MapName,eventx,eventy,
			     srcAccountID,srcCharID,srcCharName,
			     desAccountID,desCharID,desCharName,

			     ItemID,ItemName,ItemBuyCash,Serialcode,ItemCount,
			     price,slot1,slot2,slot3,slot4,
			     refiningLevel,ItemHireExpireDate,
				
			     AuctionID, Zeny, DestZeny, bizType)

	                    VALUES(@Ver, @SID, @Action,@IPaddr,@MapName,@Eventx,@Eventy,
			      @SrcAccountID,@SrcCharID,@SrcCharName,
			      @DesAccountID,@DesCharID,@DesCharName,
				
			      @ItemID,@ItemName,@ItemBuyCash,@ItemSerialNum,@ItemCount,
			      @ItemPrice,@ItemSlot1,@ItemSlot2,@ItemSlot3,@ItemSlot4,
			      @ItemRefiningLevel,@ItemHireExpireDate,
			     
			      @AuctionID, @Zeny, @destZeny, @bizType)

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog_zeny_2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_add_itemlog_zeny_2]
	@Ver			INT,
	@SID			INT,
	@Action			INT,
	@IPaddr			VARCHAR(20),
	@MapName		VARCHAR(24),
	@Eventx			INT,
	@Eventy			INT,
	--이벤트발생자 정보
	@SrcAccountID		INT,
	@SrcAccountName	VARCHAR(24),
	@SrcCharID		INT,
	@SrcCharName		VARCHAR(24),
	--대상자정보
	@DesAccountID		INT,
	@DesAccountName	VARCHAR(24),
	@DesCharID		INT,
	@DesCharName		VARCHAR(24),
	--아이템관련정보
	@ItemID			INT, -- ITP 레코드 인련번호
	@ItemName		VARCHAR(24),
	@ItemBuyCash		BIT, --캐쉬로 구입한 아이템인가여부
	@ItemSerialNum		BIGINT,
	@ItemCount		INT,
	@ItemPrice		INT,
	@ItemSlot1		INT,
	@ItemSlot2		INT,
	@ItemSlot3		INT,
	@ItemSlot4		INT,
	@ItemRefiningLevel	INT,	
	@ItemHireExpireDate	DATETIME, --임대아이템의 경우 만료일자
	--옥션관련정보
	@AuctionID		INT,
	@Zeny			INT,
	@destZeny		INT = -1,
	@bizType		INT = 0
AS

	INSERT INTO itemlog(Ver,SID,[Action],ip,MapName,eventx,eventy,
			     srcAccountID,srcAccountName,srcCharID,srcCharName,
			     desAccountID,desAccountName,desCharID,desCharName,

			     ItemID,ItemName,ItemBuyCash,Serialcode,ItemCount,
			     price,slot1,slot2,slot3,slot4,
			     refiningLevel,ItemHireExpireDate,
				
			     AuctionID, Zeny, DestZeny, bizType)

	                    VALUES(@Ver, @SID, @Action,@IPaddr,@MapName,@Eventx,@Eventy,
			      @SrcAccountID,@SrcAccountName,@SrcCharID,@SrcCharName,
			      @DesAccountID,@DesAccountName,@DesCharID,@DesCharName,
				
			      @ItemID,@ItemName,@ItemBuyCash,@ItemSerialNum,@ItemCount,
			      @ItemPrice,@ItemSlot1,@ItemSlot2,@ItemSlot3,@ItemSlot4,
			      @ItemRefiningLevel,@ItemHireExpireDate,
			     
			      @AuctionID, @Zeny, @destZeny, @bizType)
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog_zeny]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_add_itemlog_zeny]
	@Ver			INT,
	@SID			INT,
	@Action			INT,
	@IPaddr			VARCHAR(20),
	@MapName		VARCHAR(24),
	@Eventx			INT,
	@Eventy			INT,
	--이벤트발생자 정보
	@SrcAccountID		INT,
	@SrcAccountName	VARCHAR(24),
	@SrcCharID		INT,
	@SrcCharName		VARCHAR(24),
	--대상자정보
	@DesAccountID		INT,
	@DesAccountName	VARCHAR(24),
	@DesCharID		INT,
	@DesCharName		VARCHAR(24),
	--아이템관련정보
	@ItemID			INT, -- ITP 레코드 인련번호
	@ItemName		VARCHAR(24),
	@ItemBuyCash		BIT, --캐쉬로 구입한 아이템인가여부
	@ItemSerialNum		BIGINT,
	@ItemCount		INT,
	@ItemPrice		INT,
	@ItemSlot1		INT,
	@ItemSlot2		INT,
	@ItemSlot3		INT,
	@ItemSlot4		INT,
	@ItemRefiningLevel	INT,	
	@ItemHireExpireDate	DATETIME, --임대아이템의 경우 만료일자
	--옥션관련정보
	@AuctionID		INT,
	@Zeny			INT
AS

	INSERT INTO itemlog(Ver,SID,[Action],ip,MapName,eventx,eventy,
			     srcAccountID,srcAccountName,srcCharID,srcCharName,
			     desAccountID,desAccountName,desCharID,desCharName,

			     ItemID,ItemName,ItemBuyCash,Serialcode,ItemCount,
			     price,slot1,slot2,slot3,slot4,
			     refiningLevel,ItemHireExpireDate,
				
			     AuctionID, Zeny)

	                    VALUES(@Ver, @SID, @Action,@IPaddr,@MapName,@Eventx,@Eventy,
			      @SrcAccountID,@SrcAccountName,@SrcCharID,@SrcCharName,
			      @DesAccountID,@DesAccountName,@DesCharID,@DesCharName,
				
			      @ItemID,@ItemName,@ItemBuyCash,@ItemSerialNum,@ItemCount,
			      @ItemPrice,@ItemSlot1,@ItemSlot2,@ItemSlot3,@ItemSlot4,
			      @ItemRefiningLevel,@ItemHireExpireDate,
			     
			      @AuctionID, @Zeny)
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog_v3_sso]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_add_itemlog_v3_sso]
	@Ver			INT,
	@SID			INT,
	@Action			INT,
	@IPaddr			VARCHAR(20),
	@MapName		VARCHAR(24),
	@Eventx			INT,
	@Eventy			INT,
	--이벤트발생자 정보
	@SrcAccountID		INT,
	@SrcCharID		INT,
	@SrcCharName		VARCHAR(24),
	--대상자정보
	@DesAccountID		INT,
	@DesCharID		INT,
	@DesCharName		VARCHAR(24),
	--아이템관련정보
	@ItemID			INT, -- ITP 레코드 인련번호
	@ItemName		VARCHAR(24),
	@ItemBuyCash		BIT, --캐쉬로 구입한 아이템인가여부
	@ItemSerialNum		BIGINT,
	@ItemCount		INT,
	@ItemPrice		INT,
	@ItemSlot1		INT,
	@ItemSlot2		INT,
	@ItemSlot3		INT,
	@ItemSlot4		INT,
	@ItemRefiningLevel	INT,	
	@ItemHireExpireDate	DATETIME, --임대아이템의 경우 만료일자
	--옥션관련정보
	@AuctionID		INT,
	@Zeny			INT,
	@destZeny		INT = -1,
	@bizType		INT = 0,
	@srcJob			INT = 0,
	@srcLevel		INT = 0
AS
SET NOCOUNT ON

	INSERT INTO itemlog(Ver,SID,[Action],ip,MapName,eventx,eventy,
			     srcAccountID,srcCharID,srcCharName, srcJobType, srcLevel,
			     desAccountID,desCharID,desCharName,

			     ItemID,ItemName,ItemBuyCash,Serialcode,ItemCount,
			     price,slot1,slot2,slot3,slot4,
			     refiningLevel,ItemHireExpireDate,
				
			     AuctionID, Zeny, DestZeny, bizType)

	                    VALUES(@Ver, @SID, @Action,@IPaddr,@MapName,@Eventx,@Eventy,
			      @SrcAccountID,@SrcCharID,@SrcCharName, @srcJob, @srcLevel,
			      @DesAccountID,@DesCharID,@DesCharName,
				
			      @ItemID,@ItemName,@ItemBuyCash,@ItemSerialNum,@ItemCount,
			      @ItemPrice,@ItemSlot1,@ItemSlot2,@ItemSlot3,@ItemSlot4,
			      @ItemRefiningLevel,@ItemHireExpireDate,
			     
			      @AuctionID, @Zeny, @destZeny, @bizType)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog_v3]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_add_itemlog_v3]
	@Ver			INT,
	@SID			INT,
	@Action			INT,
	@IPaddr			VARCHAR(20),
	@MapName		VARCHAR(24),
	@Eventx			INT,
	@Eventy			INT,
	--이벤트발생자 정보
	@SrcAccountID		INT,
	@SrcAccountName	VARCHAR(24),
	@SrcCharID		INT,
	@SrcCharName		VARCHAR(24),
	--대상자정보
	@DesAccountID		INT,
	@DesAccountName	VARCHAR(24),
	@DesCharID		INT,
	@DesCharName		VARCHAR(24),
	--아이템관련정보
	@ItemID			INT, -- ITP 레코드 인련번호
	@ItemName		VARCHAR(24),
	@ItemBuyCash		BIT, --캐쉬로 구입한 아이템인가여부
	@ItemSerialNum		BIGINT,
	@ItemCount		INT,
	@ItemPrice		INT,
	@ItemSlot1		INT,
	@ItemSlot2		INT,
	@ItemSlot3		INT,
	@ItemSlot4		INT,
	@ItemRefiningLevel	INT,	
	@ItemHireExpireDate	DATETIME, --임대아이템의 경우 만료일자
	--옥션관련정보
	@AuctionID		INT,
	@Zeny			INT,
	@destZeny		INT = -1,
	@bizType		INT = 0,
	@srcJob			INT = 0,
	@srcLevel		INT = 0
AS

	INSERT INTO itemlog(Ver,SID,[Action],ip,MapName,eventx,eventy,
			     srcAccountID,srcAccountName,srcCharID,srcCharName, srcJobType, srcLevel,
			     desAccountID,desAccountName,desCharID,desCharName,

			     ItemID,ItemName,ItemBuyCash,Serialcode,ItemCount,
			     price,slot1,slot2,slot3,slot4,
			     refiningLevel,ItemHireExpireDate,
				
			     AuctionID, Zeny, DestZeny, bizType)

	                    VALUES(@Ver, @SID, @Action,@IPaddr,@MapName,@Eventx,@Eventy,
			      @SrcAccountID,@SrcAccountName,@SrcCharID,@SrcCharName, @srcJob, @srcLevel,
			      @DesAccountID,@DesAccountName,@DesCharID,@DesCharName,
				
			      @ItemID,@ItemName,@ItemBuyCash,@ItemSerialNum,@ItemCount,
			      @ItemPrice,@ItemSlot1,@ItemSlot2,@ItemSlot3,@ItemSlot4,
			      @ItemRefiningLevel,@ItemHireExpireDate,
			     
			      @AuctionID, @Zeny, @destZeny, @bizType)
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog_sso]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_itemlog_sso]
	@Ver			INT,
	@SID			INT,
	@Action			INT,
	@IPaddr			VARCHAR(20),
	@MapName		VARCHAR(24),
	@Eventx			INT,
	@Eventy			INT,
	--이벤트발생자 정보
	@SrcAccountID		INT,
	@SrcCharID		INT,
	@SrcCharName		VARCHAR(24),
	--대상자정보
	@DesAccountID		INT,
	@DesCharID		INT,
	@DesCharName		VARCHAR(24),
	--아이템관련정보
	@ItemID			INT, -- ITP 레코드 인련번호
	@ItemName		VARCHAR(24),
	@ItemBuyCash		BIT, --캐쉬로 구입한 아이템인가여부
	@ItemSerialNum		BIGINT,
	@ItemCount		INT,
	@ItemPrice		INT,
	@ItemSlot1		INT,
	@ItemSlot2		INT,
	@ItemSlot3		INT,
	@ItemSlot4		INT,
	@ItemRefiningLevel	INT,	
	@ItemHireExpireDate	DATETIME, --임대아이템의 경우 만료일자
	--옥션관련정보
	@AuctionID		INT
AS
SET NOCOUNT ON

	INSERT INTO itemlog(Ver,SID,[Action],ip,MapName,eventx,eventy,
			     srcAccountID,srcCharID,srcCharName,
			     desAccountID,desCharID,desCharName,

			     ItemID,ItemName,ItemBuyCash,Serialcode,ItemCount,
			     price,slot1,slot2,slot3,slot4,
			     refiningLevel,ItemHireExpireDate,
				
			     AuctionID)

	                    VALUES(@Ver, @SID, @Action,@IPaddr,@MapName,@Eventx,@Eventy,
			      @SrcAccountID,@SrcCharID,@SrcCharName,
			      @DesAccountID,@DesCharID,@DesCharName,
				
			      @ItemID,@ItemName,@ItemBuyCash,@ItemSerialNum,@ItemCount,
			      @ItemPrice,@ItemSlot1,@ItemSlot2,@ItemSlot3,@ItemSlot4,
			      @ItemRefiningLevel,@ItemHireExpireDate,
			     
			      @AuctionID)


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_add_itemlog]
	@Ver			INT,
	@SID			INT,
	@Action			INT,
	@IPaddr			VARCHAR(20),
	@MapName		VARCHAR(24),
	@Eventx			INT,
	@Eventy			INT,
	--이벤트발생자 정보
	@SrcAccountID		INT,
	@SrcAccountName	VARCHAR(24),
	@SrcCharID		INT,
	@SrcCharName		VARCHAR(24),
	--대상자정보
	@DesAccountID		INT,
	@DesAccountName	VARCHAR(24),
	@DesCharID		INT,
	@DesCharName		VARCHAR(24),
	--아이템관련정보
	@ItemID			INT, -- ITP 레코드 인련번호
	@ItemName		VARCHAR(24),
	@ItemBuyCash		BIT, --캐쉬로 구입한 아이템인가여부
	@ItemSerialNum		BIGINT,
	@ItemCount		INT,
	@ItemPrice		INT,
	@ItemSlot1		INT,
	@ItemSlot2		INT,
	@ItemSlot3		INT,
	@ItemSlot4		INT,
	@ItemRefiningLevel	INT,	
	@ItemHireExpireDate	DATETIME, --임대아이템의 경우 만료일자
	--옥션관련정보
	@AuctionID		INT
AS

	INSERT INTO itemlog(Ver,SID,[Action],ip,MapName,eventx,eventy,
			     srcAccountID,srcAccountName,srcCharID,srcCharName,
			     desAccountID,desAccountName,desCharID,desCharName,

			     ItemID,ItemName,ItemBuyCash,Serialcode,ItemCount,
			     price,slot1,slot2,slot3,slot4,
			     refiningLevel,ItemHireExpireDate,
				
			     AuctionID)

	                    VALUES(@Ver, @SID, @Action,@IPaddr,@MapName,@Eventx,@Eventy,
			      @SrcAccountID,@SrcAccountName,@SrcCharID,@SrcCharName,
			      @DesAccountID,@DesAccountName,@DesCharID,@DesCharName,
				
			      @ItemID,@ItemName,@ItemBuyCash,@ItemSerialNum,@ItemCount,
			      @ItemPrice,@ItemSlot1,@ItemSlot2,@ItemSlot3,@ItemSlot4,
			      @ItemRefiningLevel,@ItemHireExpireDate,
			     
			      @AuctionID)
GO
/****** Object:  StoredProcedure [dbo].[usp_add_homun_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_homun_log]  
 @describe varchar(16),  
 @aid  int,  
 @gid  int,  
 @name  varchar(24),  
 @fullness int,  
 @relation int,  
 @job  int,  
 @level  int,  
 @hp  int,  
 @maxHP int,  
 @sp  int,  
 @maxSP int,  
    
 @mapName varchar(16),  
 @x  int,  
 @y  int,  
   
 @str  int,  
 @agi  int,  
 @vit  int,  
 @int  int,  
 @dex  int,  
 @luk  int,  
 @SKPoint int
 
 
 --@job  smallint,  
 --@level  smallint,  
 --@hp  smallint,  
 --@maxHP smallint,  
 --@sp  smallint,  
 --@maxSP smallint,  
    
 --@mapName varchar(16),  
 --@x  smallint,  
 --@y  smallint,  
   
 --@str  smallint,  
 --@agi  smallint,  
 --@vit  smallint,  
 --@int  smallint,  
 --@dex  smallint,  
 --@luk  smallint,  
 --@SKPoint smallint  
 
AS  
SET NOCOUNT ON  
 INSERT INTO Homun (  
  [date], [Describe], AID, GID, Name, Fullness, Relation, job, clevel, hp, maxHP, sp, maxSP,  mapName, x, y, Str, Agi, Vit, [Int], Dex, Luk, SKPoint  
 )  
  VALUES (  
  default,  
  @describe ,  
  @aid  ,  
  @gid  ,  
  @name  ,  
  @fullness ,  
  @relation ,  
  @job  ,  
  @level  ,  
  @hp  ,  
  @maxHP ,  
  @sp  ,  
  @maxSP ,  
  @mapName ,  
  @x  ,  
  @y  ,  
    
  @str  ,  
  @agi  ,  
  @vit  ,  
  @int  ,  
  @dex  ,  
  @luk  ,  
  @SKPoint   
 )  
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_composition_log2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_composition_log2]
	@accountID     int,
	@characterID   int,
	@characterName varchar(24),
	@mapName       varchar(25),
	@x             int,
	@y             int,
	@addedCardID   int,
	@slot1         int,
	@slot2         int,
	@slot3         int,
	@slot4         int,
	@equipItem int,
	@serial	       int
AS
SET NOCOUNT ON
	INSERT INTO compositionLog ([date], accountID, characterID, characterName, mapName, x, y, addedCardID, slot1, slot2, slot3, slot4, equipItem, serial) 
	VALUES(default, @accountID, @characterID, @characterName, @mapName, @x, @y, @addedCardID, @slot1, @slot2, @slot3, @slot4, @equipItem, @serial)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_composition_log_2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_composition_log_2]
	@accountID     int,
	@characterID   int,
	@characterName varchar(24),
	@mapName       varchar(25),
	@x             int,
	@y             int,
	@addedCardID   int,
	@slot1         int,
	@slot2         int,
	@slot3         int,
	@slot4         int,
	@equipItem int,
	@serial	     int
AS
SET NOCOUNT ON
	INSERT INTO compositionLog ([date], accountID, characterID, characterName, mapName, x, y, addedCardID, slot1, slot2, slot3, slot4,equipItem,serial) 
	VALUES(default, @accountID, @characterID, @characterName, @mapName, @x, @y, @addedCardID, @slot1, @slot2, @slot3, @slot4, @equipItem, @serial)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_composition_log]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_composition_log]
	@accountID     int,
	@characterID   int,
	@characterName varchar(24),
	@mapName       varchar(25),
	@x             int,
	@y             int,
	@addedCardID   int,
	@slot1         int,
	@slot2         int,
	@slot3         int,
	@slot4         int
AS
SET NOCOUNT ON
	INSERT INTO compositionLog ([date], accountID, characterID, characterName, mapName, x, y, addedCardID, slot1, slot2, slot3, slot4) 
	VALUES(default, @accountID, @characterID, @characterName, @mapName, @x, @y, @addedCardID, @slot1, @slot2, @slot3, @slot4)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetCharConnectLog_LogOut]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GetCharConnectLog_LogOut]
	@AID 			int

AS

SET NOCOUNT ON

DECLARE @IDX INT

SELECT TOP 1 @IDX = [INDEX] FROM CharConnectLog WHERE AID = @AID ORDER BY [INDEX] DESC

IF @IDX IS NULL
 BEGIN 
    SET @IDX = -1
 END

UPDATE CharConnectLog
SET LOGOUT = GETDATE()
WHERE [INDEX] = @IDX
GO
/****** Object:  StoredProcedure [dbo].[GetCharConnectLog_Login]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GetCharConnectLog_Login]
	@AID int,
	@GID int,
        @Membership tinyint,
	@CharName varchar(24),
	@Job int,
	@Clevel smallint,
	@JobLevel int,
        @ip varchar(18)
AS

BEGIN

     INSERT INTO CharConnectLog( AID, GID, [Login], Membership, ip, CharName, Job, Clevel, JobLevel)
     VALUES ( @AID, @GID, default, @Membership, @ip, @CharName, @Job, @Clevel, @JobLevel)

END
GO
/****** Object:  StoredProcedure [dbo].[GetCharBlock]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCharBlock]
	@AID	int
AS

set nocount on

select GID, convert(varchar, ExpireDate, 20) 
from charblockinfo
where expiredate > GETDATE() and aid = @AID
GO
/****** Object:  StoredProcedure [dbo].[AddStatusLog_2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddStatusLog_2]
    @accountID     [INT],
    @accountName   [VARCHAR](24),
    @characterID   [INT],
    @characterName [VARCHAR](24),
    @mapName       [VARCHAR](25),
    @x             [INT],
    @y             [INT],
    @str           [INT],
    @agi           [INT],
    @vit           [INT],
    @int           [INT],
    @dex           [INT],
    @luk           [INT],
    @jobPoint      [INT], 
    @LogTime    [INT]
AS
    SET NOCOUNT ON
    
    INSERT INTO [statusLog] ( [date], [accountID], [accountName], [characterID], [characterName], [mapName], [x], [y], [str], [agi], [vit], [int], [dex], [luk], [jobPoint])
    VALUES ( DATEADD( S, @LogTime, DATEADD( S, DATEDIFF( S, GETUTCDATE(), GETDATE() ), '19700101' ) ), 
        @accountID, 
        @accountName, 
        @characterID, 
        @characterName, 
        @mapName, 
        @x, 
        @y, 
        @str, 
        @agi, 
        @vit, 
        @int, 
        @dex, 
        @luk, 
        @jobPoint )

    SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[AddStatusLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddStatusLog]
	@accountID     int,

	@accountName   varchar(24),
	@characterID   int,
	@characterName varchar(24),
	@mapName       varchar(25),
        	@x             int,
	@y             int,
	@str           int,
	@agi           int,
	@vit           int,
	@int           int,
	@dex           int,
	@luk           int,
	@jobPoint      int
AS
INSERT INTO statusLog ( accountID, [date],  accountName, characterID, characterName, mapName, x, y, str, agi, vit, int, dex, luk, jobPoint)
 VALUES ( @accountID, default, @accountName, @characterID, @characterName, @mapName, @x, @y, @str, @agi, @vit, @int, @dex, @luk, @jobPoint)
GO
/****** Object:  StoredProcedure [dbo].[AddSkillLog_2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddSkillLog_2]
    @accountID     [INT],
    @accountName   [VARCHAR](24),
    @characterID   [INT],
    @characterName [VARCHAR](24),
    @mapName       [VARCHAR](25),
       @x             [INT],
    @y             [INT],
    @skillID       [INT],
    @skillLevel    [INT],
    @extraSkillPoint [INT], 
    @LogTime        [INT]
AS
    SET NOCOUNT ON
    
    INSERT INTO [skillLog] ([date], [accountID], [accountName], [characterID], [characterName], [mapName], [x], [y], [skillID], [skillLevel], [extraSkillPoint]) 
    VALUES(DATEADD( S, @LogTime, DATEADD( S, DATEDIFF( S, GETUTCDATE(), GETDATE() ), '19700101' ) ), 
        @accountID, 
        @accountName, 
        @characterID, 
        @characterName, 
        @mapName, 
        @x, 
        @y, 
        @skillID, 
        @skillLevel, 
        @extraSkillPoint)
        
    SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[AddSkillLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddSkillLog]
	@accountID     int,
	@accountName   varchar(24),
	@characterID   int,
	@characterName varchar(24),
	@mapName       varchar(25),
        	@x             int,
	@y             int,
	@skillID       int,
	@skillLevel    int,
	@extraSkillPoint int
AS
INSERT INTO skillLog ([date], accountID, accountName, characterID, characterName, mapName, x, y, skillID, skillLevel, extraSkillPoint) VALUES(default, @accountID, @accountName, @characterID, @characterName, @mapName, @x, @y, @skillID, @skillLevel, @extraSkillPoint)
GO
/****** Object:  StoredProcedure [dbo].[AddRefiningLogV2]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddRefiningLogV2]
	@accountID     	INT,
	@accountName   VARCHAR(24),
	@characterID   	INT,
	@characterName VARCHAR(24),
	@mapName         VARCHAR(25),
        	@x             	INT,
	@y             	INT,
	@success     	INT,
	@itemID        	INT,
	@itemLevel   	INT,
             @Serialcode  	BIGINT
AS
	INSERT INTO refiningLog ([date], accountID, accountName, characterID, characterName,
                                                       mapName, x, y, success, itemID,
			             itemLevel, Serialcode) 
		VALUES(default, @accountID, @accountName, @characterID, @characterName, 
			@mapName, @x, @y, @success, @itemID,
                                          @itemLevel, @Serialcode)
GO
/****** Object:  StoredProcedure [dbo].[AddRefiningLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRefiningLog]
	@accountID     int,
	@accountName   varchar(24),
	@characterID   int,
	@characterName varchar(24),
	@mapName       varchar(25),
        	@x             int,
	@y             int,
	@success     int,
	@itemID        int,
	@itemLevel   int,
             @Serialcode  int
AS
INSERT INTO refiningLog ([date], accountID, accountName, characterID, characterName, mapName, x, y, success, itemID, itemLevel, Serialcode) VALUES(default, @accountID, @accountName, @characterID, @characterName, @mapName, @x, @y, @success, @itemID, @itemLevel, @Serialcode)
GO
/****** Object:  StoredProcedure [dbo].[AddPresentLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPresentLog]
	@accountID     		int,
	@accountName   	varchar(24),
	@characterID  		 int,
	@characterName 	varchar(24),
	@mapName       	varchar(25),
        	@x             		int,
	@y             		int,
	@itemID       		 int
AS
INSERT INTO presentLog (accountID, accountName, characterID, characterName, mapName, x, y, itemID) VALUES(@accountID, @accountName, @characterID, @characterName, @mapName, @x, @y,  @itemID)
GO
/****** Object:  StoredProcedure [dbo].[AddPetLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPetLog]
	@GID	int,
	@PetID	int,
	@PetName	varchar(24),
	@Modified	tinyint,
	@SpriteType	int,
	@Lv	int,
	@Fullness	int,
	@Relation	int,
	@Accessary	int,
	@mapName	varchar(25),
	@Action	int
AS

SET NOCOUNT ON

INSERT INTO PetLog (GID,PetID,PetName, Modified, SpriteType,Lv,Fullness,Relation,Accessary,mapName,[Action])
VALUES( @GID, @PetID, @PetName, @Modified, @SpriteType, @Lv, @Fullness, @Relation, @Accessary, @mapName, @Action)

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[AddPCInfoUpdateLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddPCInfoUpdateLog]
@aid int,
@sid int
 AS 
INSERT INTO PCInfoUpdateLog values(@aid, @sid, getdate())
GO
/****** Object:  StoredProcedure [dbo].[AddMakingLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddMakingLog]
	@accountID     		int,
	@accountName   	varchar(24),
	@characterID  		 int,
	@characterName 	varchar(24),
	@mapName       	varchar(25),
        	@x             		int,
	@y             		int,
	@success       		int,
	@itemID       		 int,
	@meterial1     		int,
	@meterial2     		int,
	@meterial3     		int
AS
INSERT INTO makingLog ([date], accountID, accountName, characterID, characterName, mapName, x, y, success, itemID, meterial1, meterial2, meterial3) VALUES(default, @accountID, @accountName, @characterID, @characterName, @mapName, @x, @y, @success, @itemID, @meterial1, @meterial2, @meterial3)
GO
/****** Object:  StoredProcedure [dbo].[AdditemLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdditemLog]
	@szVer		int,
	@szSID		int,
	@szAction	int,
	@szIP		varchar(20),
	@szEventx	int,
	@szEventy	int,
	@szSrcAccountID	int,
	@szSrcAccountName	varchar(24),
	@szSrcCharID		int,
	@szSrcCharName	varchar(24),
	@szDesAccountID	int,
	@szDesAccountName	varchar(24),
	@szdesCharID		int,
	@szDesCharName	varchar(24),
	@szSerialcode		bigint,
	@szItemName		varchar(24),
	@szItemID		int,
	@szItemCount		decimal(9),
	@szMapName		varchar(24),
	@szPrice		int,
	@szSlot1		int,
	@szSlot2		int,
	@szSlot3		int,
	@szSlot4		int,
	@szRefiningLevel	int,
	@szAuctionID		int
AS
INSERT INTO itemlog (ver,sid, [action],logtime,ip,eventx,eventy,srcAccountID,srcAccountName,srcCharID,srcCharName,desAccountID,desAccountName,desCharID,desCharName,Serialcode,ItemName,ItemID,ItemCount,MapName,price,slot1,slot2,slot3,slot4,refiningLevel, AuctionID)  VALUES(@szVer, @szSID, @szAction, default, @szIP, @szEventx, @szEventy, @szSrcAccountID, @szSrcAccountName, @szSrcCharID, @szSrcCharName, @szDesAccountID, @szDesAccountName, @szdesCharID, @szDesCharName, @szSerialcode, @szItemName, @szItemID, @szItemCount, @szMapName, @szPrice, @szSlot1, @szSlot2, @szSlot3, @szSlot4, @szRefiningLevel, @szAuctionID)
GO
/****** Object:  StoredProcedure [dbo].[AddHomunLog]    Script Date: 02/16/2018 13:53:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddHomunLog]
	@homunID	int,
	@describe	varchar(16),
	@masterName	varchar(24),
	@name		varchar(24),
	@fullness	int,
	@relation	int,
	@job		smallint,
	@level		smallint,
	@hp		smallint,
	@maxHP	smallint,
	@sp		smallint,
	@maxSP	smallint,
		
	@mapName	varchar(16),
	@x		smallint,
	@y		smallint,
	
	@str		smallint,
	@agi		smallint,
	@vit		smallint,
	@int		smallint,
	@dex		smallint,
	@luk		smallint,
	@SKPoint	smallint
AS
INSERT INTO Homun (
	homunID, [date], [Describe], MasterName, Name, Fullness, Relation, job, clevel, hp, maxHP, sp, maxSP,  mapName, x, y, Str, Agi, Vit, [Int], Dex, Luk, SKPoint
)
 VALUES (
	@homunID, default,
	@describe,
	@masterName,
	@name		,
	@fullness	,
	@relation	,
	@job		,
	@level		,
	@hp		,
	@maxHP	,
	@sp		,
	@maxSP	,
	@mapName	,
	@x		,
	@y		,
	
	@str		,
	@agi		,
	@vit		,
	@int		,
	@dex		,
	@luk		,
	@SKPoint	
)
GO
/****** Object:  Default [DF_deleteCharacterLog_date]    Script Date: 02/16/2018 13:53:29 ******/
ALTER TABLE [dbo].[deleteCharacterLog] ADD  CONSTRAINT [DF_deleteCharacterLog_date]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF__deleteCha__joble__571DF1D5]    Script Date: 02/16/2018 13:53:29 ******/
ALTER TABLE [dbo].[deleteCharacterLog] ADD  CONSTRAINT [DF__deleteCha__joble__571DF1D5]  DEFAULT ((0)) FOR [joblevel]
GO
/****** Object:  Default [DF__deleteCha__level__5812160E]    Script Date: 02/16/2018 13:53:29 ******/
ALTER TABLE [dbo].[deleteCharacterLog] ADD  CONSTRAINT [DF__deleteCha__level__5812160E]  DEFAULT ((0)) FOR [level]
GO
/****** Object:  Default [DF__deleteChara__job__59063A47]    Script Date: 02/16/2018 13:53:29 ******/
ALTER TABLE [dbo].[deleteCharacterLog] ADD  CONSTRAINT [DF__deleteChara__job__59063A47]  DEFAULT ((0)) FOR [job]
GO
/****** Object:  Default [DF_CLevelLog_date]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[CLevelLog] ADD  CONSTRAINT [DF_CLevelLog_date]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF_CharConnectLog_Login]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[CharConnectLog] ADD  CONSTRAINT [DF_CharConnectLog_Login]  DEFAULT (getdate()) FOR [Login]
GO
/****** Object:  Default [DF_characterLog_logdate]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[characterLog] ADD  CONSTRAINT [DF_characterLog_logdate]  DEFAULT (getdate()) FOR [logdate]
GO
/****** Object:  Default [DF__changemate__date__52593CB8]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[changematerial] ADD  CONSTRAINT [DF__changemate__date__52593CB8]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF__bossmobhun__date__5165187F]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[bossmobhunting] ADD  CONSTRAINT [DF__bossmobhun__date__5165187F]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF_UpdateCharLog_RegDate]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[UpdateCharLog] ADD  CONSTRAINT [DF_UpdateCharLog_RegDate]  DEFAULT (getdate()) FOR [RegDate]
GO
/****** Object:  Default [DF_statusLog_date]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[statusLog] ADD  CONSTRAINT [DF_statusLog_date]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF_skillLog_date]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[skillLog] ADD  CONSTRAINT [DF_skillLog_date]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF__ReAssembl__Inser__70DDC3D8]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[ReAssemblyPacketLog] ADD  CONSTRAINT [DF__ReAssembl__Inser__70DDC3D8]  DEFAULT (getdate()) FOR [InsertDate]
GO
/****** Object:  Default [DF__ReAssembl__MapNa__71D1E811]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[ReAssemblyPacketLog] ADD  CONSTRAINT [DF__ReAssembl__MapNa__71D1E811]  DEFAULT ('Unknown') FOR [MapName]
GO
/****** Object:  Default [DF_presentLog_date]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[presentLog] ADD  CONSTRAINT [DF_presentLog_date]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF_PetLog_Date]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[PetLog] ADD  CONSTRAINT [DF_PetLog_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF__mercenary___type__66603565]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mercenary_log] ADD  CONSTRAINT [DF__mercenary___type__66603565]  DEFAULT ((0)) FOR [type]
GO
/****** Object:  Default [DF__mercenary___date__6754599E]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mercenary_log] ADD  CONSTRAINT [DF__mercenary___date__6754599E]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF__mercenary__accou__68487DD7]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mercenary_log] ADD  CONSTRAINT [DF__mercenary__accou__68487DD7]  DEFAULT ((0)) FOR [account_id]
GO
/****** Object:  Default [DF__mercenary__accou__693CA210]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mercenary_log] ADD  CONSTRAINT [DF__mercenary__accou__693CA210]  DEFAULT ('unknown') FOR [account_name]
GO
/****** Object:  Default [DF__mercenary__chara__6A30C649]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mercenary_log] ADD  CONSTRAINT [DF__mercenary__chara__6A30C649]  DEFAULT ((0)) FOR [character_id]
GO
/****** Object:  Default [DF__mercenary__chara__6B24EA82]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mercenary_log] ADD  CONSTRAINT [DF__mercenary__chara__6B24EA82]  DEFAULT ('unknown') FOR [character_name]
GO
/****** Object:  Default [DF__mercenary_l__job__6C190EBB]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mercenary_log] ADD  CONSTRAINT [DF__mercenary_l__job__6C190EBB]  DEFAULT ((0)) FOR [job]
GO
/****** Object:  Default [DF__mercenary__remai__6D0D32F4]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mercenary_log] ADD  CONSTRAINT [DF__mercenary__remai__6D0D32F4]  DEFAULT ((0)) FOR [remain_life_second]
GO
/****** Object:  Default [DF__mercenary__appro__6E01572D]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mercenary_log] ADD  CONSTRAINT [DF__mercenary__appro__6E01572D]  DEFAULT ((0)) FOR [approval_monster_kill_counter]
GO
/****** Object:  Default [DF__mdungeonLo__date__619B8048]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mdungeonLog] ADD  CONSTRAINT [DF__mdungeonLo__date__619B8048]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF__mdungeonL__mdung__628FA481]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mdungeonLog] ADD  CONSTRAINT [DF__mdungeonL__mdung__628FA481]  DEFAULT ('unknown') FOR [mdungeon_name]
GO
/****** Object:  Default [DF__mdungeonL__party__6383C8BA]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mdungeonLog] ADD  CONSTRAINT [DF__mdungeonL__party__6383C8BA]  DEFAULT ('unknown') FOR [party_name]
GO
/****** Object:  Default [DF__mdungeonL__party__6477ECF3]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mdungeonLog] ADD  CONSTRAINT [DF__mdungeonL__party__6477ECF3]  DEFAULT ((0)) FOR [party_id]
GO
/****** Object:  Default [DF__mdungeonL__creat__656C112C]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mdungeonLog] ADD  CONSTRAINT [DF__mdungeonL__creat__656C112C]  DEFAULT ((0)) FOR [create_zsid]
GO
/****** Object:  Default [DF__mapstatist__date__5DCAEF64]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mapstatisticLog] ADD  CONSTRAINT [DF__mapstatist__date__5DCAEF64]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF__mapstatist__name__5EBF139D]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mapstatisticLog] ADD  CONSTRAINT [DF__mapstatist__name__5EBF139D]  DEFAULT ('unknown') FOR [name]
GO
/****** Object:  Default [DF__mapstatist__zsvr__5FB337D6]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mapstatisticLog] ADD  CONSTRAINT [DF__mapstatist__zsvr__5FB337D6]  DEFAULT ((0)) FOR [zsvr]
GO
/****** Object:  Default [DF__mapstatis__playe__60A75C0F]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[mapstatisticLog] ADD  CONSTRAINT [DF__mapstatis__playe__60A75C0F]  DEFAULT ((0)) FOR [player]
GO
/****** Object:  Default [DF__levelupand__date__5CD6CB2B]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[levelupandjobchange] ADD  CONSTRAINT [DF__levelupand__date__5CD6CB2B]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF_itemLog_logtime]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[itemLog] ADD  CONSTRAINT [DF_itemLog_logtime]  DEFAULT (getdate()) FOR [logtime]
GO
/****** Object:  Default [DF_itemLog_Auction]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[itemLog] ADD  CONSTRAINT [DF_itemLog_Auction]  DEFAULT ((0)) FOR [AuctionID]
GO
/****** Object:  Default [DF_itemLog_DestZeny]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[itemLog] ADD  CONSTRAINT [DF_itemLog_DestZeny]  DEFAULT ((0)) FOR [DestZeny]
GO
/****** Object:  Default [DF_itemLog_bizType]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[itemLog] ADD  CONSTRAINT [DF_itemLog_bizType]  DEFAULT ((0)) FOR [bizType]
GO
/****** Object:  Default [DF__itemLog__identit__02FC7413]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[itemLog] ADD  CONSTRAINT [DF__itemLog__identit__02FC7413]  DEFAULT ((0)) FOR [identity]
GO
/****** Object:  Default [DF__IrMailLog__LogDa__5BE2A6F2]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[IrMailLog] ADD  CONSTRAINT [DF__IrMailLog__LogDa__5BE2A6F2]  DEFAULT (getdate()) FOR [LogDate]
GO
/****** Object:  Default [DF_Homun_homunID]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[Homun] ADD  CONSTRAINT [DF_Homun_homunID]  DEFAULT ((0)) FOR [homunID]
GO
/****** Object:  Default [DF_Homun_Date]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[Homun] ADD  CONSTRAINT [DF_Homun_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF__zsvrstatis__date__76969D2E]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[zsvrstatisticLog] ADD  CONSTRAINT [DF__zsvrstatis__date__76969D2E]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF__zsvrstatis__zsid__778AC167]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[zsvrstatisticLog] ADD  CONSTRAINT [DF__zsvrstatis__zsid__778AC167]  DEFAULT ((0)) FOR [zsid]
GO
/****** Object:  Default [DF__zsvrstati__playe__787EE5A0]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[zsvrstatisticLog] ADD  CONSTRAINT [DF__zsvrstati__playe__787EE5A0]  DEFAULT ((0)) FOR [player]
GO
/****** Object:  Default [DF__zsvrstatist__npc__797309D9]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[zsvrstatisticLog] ADD  CONSTRAINT [DF__zsvrstatist__npc__797309D9]  DEFAULT ((0)) FOR [npc]
GO
/****** Object:  Default [DF__zsvrstati__memor__7A672E12]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[zsvrstatisticLog] ADD  CONSTRAINT [DF__zsvrstati__memor__7A672E12]  DEFAULT ((0)) FOR [memory]
GO
/****** Object:  Default [DF__zsvrstati__total__7B5B524B]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[zsvrstatisticLog] ADD  CONSTRAINT [DF__zsvrstati__total__7B5B524B]  DEFAULT ((0)) FOR [totalmap]
GO
/****** Object:  Default [DF__zsvrstati__insta__7C4F7684]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[zsvrstatisticLog] ADD  CONSTRAINT [DF__zsvrstati__insta__7C4F7684]  DEFAULT ((0)) FOR [instantmap]
GO
/****** Object:  Default [DF__zenychecks__date__75A278F5]    Script Date: 02/16/2018 13:53:31 ******/
ALTER TABLE [dbo].[zenychecksum_log] ADD  CONSTRAINT [DF__zenychecks__date__75A278F5]  DEFAULT (getdate()) FOR [date]
GO
