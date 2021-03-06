USE [master]
GO
/****** Object:  Database [Character]    Script Date: 02/16/2018 13:52:06 ******/
CREATE DATABASE [Character] ON  PRIMARY 
( NAME = N'Character_Data', FILENAME = N'C:\AEGIS\DB\Character_Data.MDF' , SIZE = 10048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Character_Log', FILENAME = N'C:\AEGIS\DB\Character_Log.LDF' , SIZE = 10048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Character] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Character].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Character] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Character] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Character] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Character] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Character] SET ARITHABORT OFF
GO
ALTER DATABASE [Character] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Character] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Character] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Character] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Character] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Character] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Character] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Character] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Character] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Character] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Character] SET  ENABLE_BROKER
GO
ALTER DATABASE [Character] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Character] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Character] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Character] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Character] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Character] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Character] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Character] SET  READ_WRITE
GO
ALTER DATABASE [Character] SET RECOVERY FULL
GO
ALTER DATABASE [Character] SET  MULTI_USER
GO
ALTER DATABASE [Character] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [Character] SET DB_CHAINING OFF
GO
USE [Character]
GO
/****** Object:  User [character]    Script Date: 02/16/2018 13:52:06 ******/
CREATE USER [character] FOR LOGIN [character] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[warpInfo]    Script Date: 02/16/2018 13:52:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[warpInfo](
	[GID] [int] NOT NULL,
	[mapName1] [varchar](24) NULL,
	[xPos1] [smallint] NULL,
	[yPos1] [smallint] NULL,
	[mapName2] [varchar](24) NULL,
	[xPos2] [smallint] NULL,
	[yPos2] [smallint] NULL,
	[mapName3] [varchar](24) NULL,
	[xPos3] [smallint] NULL,
	[yPos3] [smallint] NULL,
 CONSTRAINT [PK_warpInfo] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UpdateCharLog]    Script Date: 02/16/2018 13:52:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UpdateCharLog](
	[gid] [int] NULL,
	[CharName_Old] [varchar](24) NULL,
	[CharName_New] [varchar](24) NULL,
	[gdid] [int] NULL,
	[position] [int] NULL,
	[regdate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CoupleInfo2]    Script Date: 02/16/2018 13:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoupleInfo2](
	[maleGID] [int] NOT NULL,
	[femaleGID] [int] NOT NULL,
	[weddingTime] [varbinary](8) NOT NULL,
	[weddingTime2] [datetime] NOT NULL,
 CONSTRAINT [PK_CoupleInfo2] PRIMARY KEY NONCLUSTERED 
(
	[maleGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_CoupleInfo2] UNIQUE NONCLUSTERED 
(
	[femaleGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[InsertCouple]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCouple] 
	@maleGID		int,
             @femaleGID		int,
	@weddingTime		varbinary(8)                
AS	
insert CoupleInfo values(@maleGID, @femaleGID, @weddingTime, default)
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration](
	[Identity] [int] IDENTITY(1,1) NOT NULL,
	[ZSvrBootSquenceNum] [int] NULL,
	[ObserverItemSerialSeed] [int] NOT NULL,
	[ObserverItemSerialSequenceNum] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Identity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClanMemberInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanMemberInfo](
	[CID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[GID] [int] NOT NULL,
	[UpdateTM] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[charinfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[charinfo](
	[GID] [int] IDENTITY(100001,1) NOT NULL,
	[CharName] [varchar](24) NOT NULL,
	[job] [smallint] NOT NULL,
	[clevel] [smallint] NOT NULL,
	[sppoint] [smallint] NOT NULL,
	[exp] [int] NOT NULL,
	[jobpoint] [smallint] NOT NULL,
	[STR] [tinyint] NOT NULL,
	[AGI] [tinyint] NOT NULL,
	[VIT] [tinyint] NOT NULL,
	[INT] [tinyint] NOT NULL,
	[DEX] [tinyint] NOT NULL,
	[LUK] [tinyint] NOT NULL,
	[hp] [int] NOT NULL,
	[maxhp] [smallint] NOT NULL,
	[sp] [smallint] NOT NULL,
	[maxsp] [smallint] NOT NULL,
	[AID] [int] NOT NULL,
	[mapname] [varchar](24) NOT NULL,
	[xPos] [smallint] NOT NULL,
	[yPos] [smallint] NOT NULL,
	[GuildID] [int] NOT NULL,
	[CharNum] [tinyint] NOT NULL,
	[speed] [smallint] NOT NULL,
	[money] [int] NOT NULL,
	[jobexp] [int] NOT NULL,
	[virtue] [int] NOT NULL,
	[honor] [int] NOT NULL,
	[haircolor] [tinyint] NULL,
	[joblevel] [int] NOT NULL,
	[bodystate] [int] NOT NULL,
	[healthstate] [int] NOT NULL,
	[sxPos] [smallint] NOT NULL,
	[syPos] [smallint] NOT NULL,
	[restartMapName] [varchar](24) NOT NULL,
	[effectstate] [int] NOT NULL,
	[head] [smallint] NOT NULL,
	[weapon] [smallint] NOT NULL,
	[accessory] [smallint] NOT NULL,
	[headPalette] [smallint] NOT NULL,
	[bodyPalette] [smallint] NOT NULL,
	[accessory2] [smallint] NOT NULL,
	[accessory3] [smallint] NOT NULL,
	[delrevdate] [datetime] NOT NULL,
	[Shield] [smallint] NOT NULL,
	[party_config] [smallint] NOT NULL,
	[equipwinopen] [smallint] NOT NULL,
	[font] [smallint] NOT NULL,
	[bisChangedCharName] [tinyint] NOT NULL,
	[checksum] [varbinary](4) NULL,
	[robepalette] [smallint] NULL,
	[chr_slot_change] [int] NULL,
	[chr_name_changeCNT] [int] NULL,
 CONSTRAINT [PK_charinfo] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_charinfo_2] UNIQUE NONCLUSTERED 
(
	[CharName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cartItem]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cartItem](
	[GID] [int] NOT NULL,
	[cartitem] [varbinary](4000) NULL,
 CONSTRAINT [PK_cartItem] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BattleFieldInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BattleFieldInfo](
	[GID] [int] NOT NULL,
	[Camp] [char](2) NULL,
	[x] [smallint] NULL,
	[y] [smallint] NULL,
 CONSTRAINT [PK_BattleFieldInfo] PRIMARY KEY NONCLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bargainsale_item]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bargainsale_item](
	[itid] [smallint] NULL,
	[price] [smallint] NULL,
	[amount] [int] NULL,
	[startTime] [int] NULL,
	[endTime] [int] NULL,
	[opt] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banking]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banking](
	[AID] [int] NOT NULL,
	[Money] [bigint] NOT NULL,
	[LastDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Banking] PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auction](
	[AuctionID] [int] IDENTITY(1,1) NOT NULL,
	[ZoneServerID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[GID] [int] NOT NULL,
	[SellerName] [varchar](24) NULL,
	[BuyerAID] [int] NULL,
	[BuyerGID] [int] NULL,
	[BuyerName] [varchar](24) NULL,
	[NowPrice] [int] NULL,
	[MaxPrice] [int] NULL,
	[ItemType] [int] NULL,
	[ItemInfo] [binary](40) NULL,
	[ItemLen] [int] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_Auction] PRIMARY KEY CLUSTERED 
(
	[AuctionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Agit]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agit](
	[mapName] [varchar](16) NOT NULL,
	[agitName] [varchar](24) NOT NULL,
	[GDID] [int] NOT NULL,
	[economy] [int] NOT NULL,
	[defense] [int] NOT NULL,
	[triggerE] [int] NOT NULL,
	[triggerD] [int] NOT NULL,
	[nextTime] [int] NOT NULL,
	[payTime] [int] NOT NULL,
	[createTime] [int] NOT NULL,
	[visibleC] [tinyint] NOT NULL,
	[visibleG0] [tinyint] NOT NULL,
	[visibleG1] [tinyint] NOT NULL,
	[visibleG2] [tinyint] NOT NULL,
	[visibleG3] [tinyint] NOT NULL,
	[visibleG4] [tinyint] NOT NULL,
	[visibleG5] [tinyint] NOT NULL,
	[visibleG6] [tinyint] NOT NULL,
	[visibleG7] [tinyint] NOT NULL,
 CONSTRAINT [PK_Agit] PRIMARY KEY CLUSTERED 
(
	[mapName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Friends](
	[GID] [int] NOT NULL,
	[data] [varbinary](1600) NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Family]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Family](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[fatherGID] [int] NOT NULL,
	[motherGID] [int] NOT NULL,
	[babyGID] [int] NOT NULL,
	[Time] [varbinary](8) NOT NULL,
	[Time2] [datetime] NOT NULL,
 CONSTRAINT [PK_Family] PRIMARY KEY CLUSTERED 
(
	[Index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_Family] UNIQUE NONCLUSTERED 
(
	[fatherGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_Family1] UNIQUE NONCLUSTERED 
(
	[motherGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_Family2] UNIQUE NONCLUSTERED 
(
	[babyGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[elemental_effect]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[elemental_effect](
	[GID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[TimeMS] [int] NULL,
	[Data1] [int] NULL,
	[Data2] [int] NULL,
	[Data3] [int] NULL,
 CONSTRAINT [PK_elemental_effect] PRIMARY KEY CLUSTERED 
(
	[GID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[elemental]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[elemental](
	[GID] [int] NOT NULL,
	[kind] [int] NULL,
	[scale] [int] NULL,
	[hp] [int] NULL,
	[maxhp] [int] NULL,
	[sp] [int] NULL,
	[maxsp] [int] NULL,
	[atk] [int] NULL,
	[matk] [int] NULL,
	[attackMT] [int] NULL,
	[def] [int] NULL,
	[mdef] [int] NULL,
	[flee] [int] NULL,
	[hit] [int] NULL,
 CONSTRAINT [PK_GID] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EffectiveInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EffectiveInfo](
	[GID] [int] NOT NULL,
	[info] [varbinary](512) NULL,
 CONSTRAINT [PK_EffectiveInfo] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[effect_Rebuild]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[effect_Rebuild](
	[GID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[TimeMS] [int] NULL,
	[Data1] [int] NULL,
	[Data2] [int] NULL,
	[Data3] [int] NULL,
 CONSTRAINT [PK_effect_Rebuild] PRIMARY KEY CLUSTERED 
(
	[GID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteReserve]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteReserve]
	@GID		int
AS	
delete charinfo_ext 
where gid = @GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteCharBlock]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteCharBlock] 
	@AID int
AS

set nocount on

delete from charblockinfo where AID= @AID and ExpireDate <= getdate()
GO
/****** Object:  StoredProcedure [dbo].[DeleteCouple]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCouple] 
           	@maleName         varchar(24)
AS
delete CoupleInfo where maleName=@maleName
GO
/****** Object:  StoredProcedure [dbo].[DeleteCoupleByFemale]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteCoupleByFemale] 
           	@femaleName         varchar(24)
AS
delete CoupleInfo where femaleName=@femaleName
GO
/****** Object:  StoredProcedure [dbo].[GetCharBlock]    Script Date: 02/16/2018 13:52:10 ******/
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
/****** Object:  Table [dbo].[HuntingList]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HuntingList](
	[GID] [int] NOT NULL,
	[list] [varbinary](512) NULL,
 CONSTRAINT [PK_HuntingList] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HomunInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HomunInfo](
	[HomunID] [int] IDENTITY(1,1) NOT NULL,
	[GID] [int] NOT NULL,
	[Name] [varchar](24) NOT NULL,
	[Modified] [int] NOT NULL,
	[Level] [smallint] NOT NULL,
	[job] [smallint] NOT NULL,
	[exp] [int] NOT NULL,
	[SKPoint] [smallint] NOT NULL,
	[hp] [smallint] NOT NULL,
	[maxhp] [smallint] NOT NULL,
	[sp] [smallint] NOT NULL,
	[maxsp] [smallint] NOT NULL,
	[accessory] [smallint] NOT NULL,
	[Str] [tinyint] NOT NULL,
	[Agi] [tinyint] NOT NULL,
	[Vit] [tinyint] NOT NULL,
	[Int] [tinyint] NOT NULL,
	[Dex] [tinyint] NOT NULL,
	[Luk] [tinyint] NOT NULL,
	[bodyState] [int] NOT NULL,
	[healthState] [int] NOT NULL,
	[effectState] [int] NOT NULL,
	[property] [int] NOT NULL,
	[Fullness] [int] NOT NULL,
	[Relation] [int] NOT NULL,
 CONSTRAINT [PK_HomunInfo] PRIMARY KEY CLUSTERED 
(
	[HomunID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[homun_effect]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[homun_effect](
	[GID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[TimeMS] [int] NULL,
	[Data1] [int] NULL,
	[Data2] [int] NULL,
	[Data3] [int] NULL,
 CONSTRAINT [PK_homun_effect] PRIMARY KEY CLUSTERED 
(
	[GID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Homun]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Homun](
	[index] [int] IDENTITY(1,1) NOT NULL,
	[homunID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Describe] [varchar](16) NOT NULL,
	[MasterName] [varchar](24) NOT NULL,
	[Name] [varchar](24) NOT NULL,
	[Fullness] [int] NOT NULL,
	[Relation] [int] NOT NULL,
	[job] [smallint] NOT NULL,
	[clevel] [smallint] NOT NULL,
	[hp] [smallint] NOT NULL,
	[maxHP] [smallint] NOT NULL,
	[sp] [smallint] NOT NULL,
	[maxSP] [smallint] NOT NULL,
	[mapName] [varchar](16) NOT NULL,
	[x] [smallint] NOT NULL,
	[y] [smallint] NOT NULL,
	[Str] [smallint] NOT NULL,
	[Agi] [smallint] NOT NULL,
	[Vit] [smallint] NOT NULL,
	[Int] [smallint] NOT NULL,
	[Dex] [smallint] NOT NULL,
	[Luk] [smallint] NOT NULL,
	[SKPoint] [smallint] NOT NULL,
 CONSTRAINT [PK_HomunLog] PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildStoreLog]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildStoreLog](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NOT NULL,
	[name] [varchar](24) NOT NULL,
	[gdid] [int] NOT NULL,
	[itid] [smallint] NOT NULL,
	[amount] [int] NOT NULL,
	[direction] [bit] NOT NULL,
	[refine] [smallint] NOT NULL,
	[serial] [bigint] NOT NULL,
	[identified] [bit] NOT NULL,
	[type] [smallint] NOT NULL,
	[card1] [smallint] NOT NULL,
	[card2] [smallint] NOT NULL,
	[card3] [smallint] NOT NULL,
	[card4] [smallint] NOT NULL,
	[time] [int] NOT NULL,
 CONSTRAINT [PK_GuildStoreLog] PRIMARY KEY CLUSTERED 
(
	[idx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildStore]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildStore](
	[GDID] [int] NOT NULL,
	[StoreItem] [varbinary](max) NULL,
	[PermGID] [int] NOT NULL,
	[ZSID] [int] NULL,
 CONSTRAINT [PK_GuildStore] PRIMARY KEY CLUSTERED 
(
	[GDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildStorageLog]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildStorageLog](
	[Idx] [bigint] IDENTITY(1,1) NOT NULL,
	[GID] [int] NOT NULL,
	[Name] [varchar](24) NOT NULL,
	[GDID] [int] NOT NULL,
	[ItemID] [smallint] NOT NULL,
	[Count] [int] NOT NULL,
	[Action] [bit] NOT NULL,
	[RefiningLevel] [int] NOT NULL,
	[SerialNum] [bigint] NOT NULL,
	[IsIdentified] [bit] NOT NULL,
	[ItemType] [smallint] NOT NULL,
	[Slot1] [smallint] NOT NULL,
	[Slot2] [smallint] NOT NULL,
	[Slot3] [smallint] NOT NULL,
	[Slot4] [smallint] NOT NULL,
	[RegDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GuildStorageLog] PRIMARY KEY CLUSTERED 
(
	[Idx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildSkill]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildSkill](
	[GDID] [int] NOT NULL,
	[Skill] [varbinary](256) NULL,
	[Point] [int] NOT NULL,
 CONSTRAINT [PK_GuildSkill] PRIMARY KEY CLUSTERED 
(
	[GDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildNotice]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildNotice](
	[GDID] [int] NOT NULL,
	[Subject] [varchar](60) NULL,
	[Notice] [varchar](120) NULL,
 CONSTRAINT [PK_GuildNotice] PRIMARY KEY CLUSTERED 
(
	[GDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildMPosition]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildMPosition](
	[GDID] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[PosName] [varchar](24) NOT NULL,
	[JoinRight] [int] NOT NULL,
	[PenaltyRight] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[Service] [int] NOT NULL,
 CONSTRAINT [PK_GuildMPosition] PRIMARY KEY CLUSTERED 
(
	[GDID] ASC,
	[Grade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildMInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildMInfo](
	[GID] [int] NOT NULL,
	[CharName] [varchar](24) NOT NULL,
	[AccountName] [varchar](24) NOT NULL,
	[Level] [int] NOT NULL,
	[Class] [int] NOT NULL,
	[Memo] [varchar](50) NOT NULL,
	[Service] [int] NOT NULL,
	[MemberExp] [int] NOT NULL,
	[GDID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
 CONSTRAINT [PK_GuildMInfo] PRIMARY KEY CLUSTERED 
(
	[GDID] ASC,
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildInfoDB]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildInfoDB](
	[GDID] [int] IDENTITY(1,1) NOT NULL,
	[Level] [int] NULL,
	[Name] [varchar](24) NOT NULL,
	[MName] [varchar](24) NOT NULL,
	[MaxUserNum] [int] NULL,
	[Honor] [int] NULL,
	[Virtue] [int] NULL,
	[Type] [int] NULL,
	[Class] [int] NULL,
	[Money] [int] NULL,
	[ArenaWin] [int] NULL,
	[ArenaLose] [int] NULL,
	[ArenaDrawn] [int] NULL,
	[ManageLand] [varchar](24) NULL,
	[Exp] [int] NULL,
	[EmblemVersion] [int] NULL,
	[Point] [int] NULL,
	[Desc] [varchar](80) NULL,
	[oldname] [varchar](24) NULL,
	[mid] [int] NULL,
	[oldguildname] [varchar](24) NULL,
 CONSTRAINT [PK_GuildInfoDB] PRIMARY KEY CLUSTERED 
(
	[GDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildBanishInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildBanishInfo](
	[GDID] [int] NOT NULL,
	[MemberName] [varchar](24) NOT NULL,
	[MemberAccount] [varchar](24) NOT NULL,
	[Reason] [varchar](50) NOT NULL,
	[GID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_GuildBanishInfo] PRIMARY KEY CLUSTERED 
(
	[GDID] ASC,
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildAllyInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildAllyInfo](
	[GDID] [int] NOT NULL,
	[OpponentGDID] [int] NOT NULL,
	[GuildName] [varchar](24) NOT NULL,
	[Relation] [int] NOT NULL,
 CONSTRAINT [PK_GuildAllyInfo] PRIMARY KEY CLUSTERED 
(
	[GDID] ASC,
	[OpponentGDID] ASC,
	[Relation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupMInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupMInfo](
	[GID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[CharName] [varchar](24) NOT NULL,
	[GRID] [int] NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_GroupMInfo] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupInfo](
	[GRID] [int] IDENTITY(1,1) NOT NULL,
	[groupName] [varchar](24) NOT NULL,
	[GroupOption] [int] NOT NULL,
 CONSTRAINT [PK_GroupInfo] PRIMARY KEY CLUSTERED 
(
	[GRID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_GroupInfo_1] UNIQUE NONCLUSTERED 
(
	[groupName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetCoupleInfoByFemale]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCoupleInfoByFemale]
	@femaleNAme	varchar(24)
AS	
select * from CoupleInfo  where femaleName=@femaleName
GO
/****** Object:  StoredProcedure [dbo].[GetCoupleInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCoupleInfo]
	@Index		int
AS	
select * from CoupleInfo  where [Index]=@Index
GO
/****** Object:  StoredProcedure [dbo].[GM_Agit_Exist]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_Agit_Exist]
AS
BEGIN
	IF EXISTS (SELECT table_name FROM information_schema.tables WHERE table_type = 'BASE TABLE' AND table_name = 'Agit')
	BEGIN
		SELECT 1 AS Exist_chk
	END
	ELSE
	BEGIN
		SELECT 0 AS Exist_chk
	END
END
GO
/****** Object:  Table [dbo].[GlobalVar]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GlobalVar](
	[VarName] [varchar](24) NOT NULL,
	[VarValue] [int] NOT NULL,
 CONSTRAINT [PK_GlobalVar] PRIMARY KEY CLUSTERED 
(
	[VarName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GlobalStr]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GlobalStr](
	[StrName] [varchar](24) NOT NULL,
	[StrValue] [varchar](24) NOT NULL,
 CONSTRAINT [PK_GlobalStr] PRIMARY KEY CLUSTERED 
(
	[StrName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GM_CoupleInfo2_Exist]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_CoupleInfo2_Exist]
AS
BEGIN
	SET NOCOUNT ON

	IF EXISTS (
			SELECT
				table_name
			FROM
				information_schema.tables
			WHERE
				table_type = 'BASE TABLE'
				AND table_name = 'CoupleInfo2'
	)
	BEGIN
		SELECT 1 AS Exist_chk
	END
	ELSE
	BEGIN
		SELECT 0 AS Exist_chk
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GM_Family_View]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_Family_View]
@job_num AS INT,
@sex AS TINYINT,
@GID AS INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @sqlString AS VARCHAR(500)

	SET @sqlString = 'SELECT * FROM dbo.Family '

	IF @job_num > 4021 AND @job_num < 4046
	BEGIN
		SET @sqlString = @sqlString + ' WHERE babyGID = '+STR(@GID)
	END
	ELSE
	BEGIN
		IF @sex <> 1
		BEGIN
			SET @sqlString = @sqlString + ' WHERE motherGID = '+STR(@GID)
		END
		ELSE
		BEGIN
			SET @sqlString = @sqlString + ' WHERE fatherGID = '+STR(@GID)
		END
	END

	EXEC(@sqlString)
END
GO
/****** Object:  StoredProcedure [dbo].[GM_Family_Exist]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_Family_Exist]
AS
BEGIN
	SET NOCOUNT ON

	IF EXISTS(
			SELECT
				table_name
			FROM
				information_schema.tables
			WHERE
				table_type = 'BASE TABLE'
				AND table_name = 'Family'
	)
	BEGIN
		SELECT 1 AS Exist_chk
	END
	ELSE
	BEGIN
		SELECT 0 AS Exist_chk
	END
END
GO
/****** Object:  Table [dbo].[Mail]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mail](
	[MailID] [int] IDENTITY(1,1) NOT NULL,
	[AID] [int] NOT NULL,
	[GID] [int] NOT NULL,
	[Header] [varchar](40) NULL,
	[Reading] [smallint] NULL,
	[ItemInfo] [binary](40) NULL,
	[ItemLen] [int] NULL,
	[Money] [int] NULL,
	[FROMName] [varchar](24) NULL,
	[Text] [varchar](200) NULL,
	[DELETETime] [datetime] NULL,
 CONSTRAINT [PK_Mail] PRIMARY KEY NONCLUSTERED 
(
	[MailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[InsertItemCountResult]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp 생성
        CREATE PROCEDURE [dbo].[InsertItemCountResult] 
        @ItemID		int
                , 	@ItemName		varchar(36)
                , @ItemNum int
                , @ItemNumInSlot int
                AS
                SET NOCOUNT ON

                INSERT ItemCount
                VALUES(@ItemID, @ItemName, @ItemNum, @ItemNumInSlot )
GO
/****** Object:  StoredProcedure [dbo].[GetItemInBody4]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetItemInBody4] 
	@GID 	int
AS
SET NOCOUNT ON
	SELECT equipItem 
	FROM item4 
	WHERE GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetItemInBody3]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetItemInBody3] 
	@GID 	int
AS
SET NOCOUNT ON
	SELECT equipItem 
	FROM item3 
	WHERE GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetItemInBody2]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetItemInBody2] 
	@GID 	int
AS
SET NOCOUNT ON
	SELECT equipItem 
	FROM item2 
	WHERE GID = @GID
GO
/****** Object:  Table [dbo].[item]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[item](
	[GID] [int] NOT NULL,
	[equipItem] [varbinary](4000) NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mercenary_owner]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mercenary_owner](
	[GID] [int] NOT NULL,
	[call] [int] NULL,
	[arch_total_call_num] [int] NULL,
	[arch_faith] [int] NULL,
	[spear_total_call_num] [int] NULL,
	[spear_faith] [int] NULL,
	[sword_total_call_num] [int] NULL,
	[sword_faith] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mercenary_info]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mercenary_info](
	[GID] [int] NOT NULL,
	[remain_life_sec] [int] NOT NULL,
	[job] [int] NOT NULL,
	[bodystate] [int] NULL,
	[healthstate] [int] NULL,
	[effectstate] [int] NULL,
	[property] [int] NULL,
	[appmob_kill_cnt] [int] NULL,
	[hp] [int] NULL,
	[sp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mercenary_effect]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mercenary_effect](
	[GID] [int] NOT NULL,
	[data] [varbinary](512) NULL,
	[state] [varbinary](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[InsertMerceInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMerceInfo]
	@GID			int,

	@Faith			smallint,
	@JOB			smallint,
	@HP			smallint,
	@SP			smallint,
	@LifeTime		smallint,
	@EXP			int,
	@bodyState		int,
	@healthState		int,
	@effectState		int,
	@property		int,
	@ArcherCount		int,
	@LancerCount		int,
	@SwordCount		int
	
AS
Insert into MerceInfo
 (
	GID,
	Faith,
	JOB,
	HP,
	SP,
	LifeTime,
	EXP,
	bodyState,
	healthState,
	effectState,
	property,
	ArcherCount,
	LancerCount,
	SwordCount
 ) 
values
 ( 
	@GID,
	@Faith,
	@JOB,
	@HP,
	@SP,
	@LifeTime,
	@EXP,
	@bodyState,
	@healthState,
	@effectState,
	@property,
	@ArcherCount,
	@LancerCount,
	@SwordCount
 )

RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[GetMerceInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMerceInfo]
	@GID	int
AS

select *  from MerceInfo where GID = @GID
GO
/****** Object:  Table [dbo].[MannerPoint]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MannerPoint](
	[AID] [int] NOT NULL,
	[otherGID] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_MannerPoint] PRIMARY KEY CLUSTERED 
(
	[AID] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MakerRank]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MakerRank](
	[GID] [int] NOT NULL,
	[CharName] [varchar](24) NOT NULL,
	[Type] [int] NOT NULL,
	[point] [int] NULL,
 CONSTRAINT [PK_MakerRank] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateFamilyIndex]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateFamilyIndex]
	@GID		int
,	@Index		int
AS
update RelationIndex with (rowlock) set FamilyIndex = @Index where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateCoupleIndex]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateCoupleIndex]
	@GID		int
,	@Index		int
AS
update RelationIndex with (rowlock) set CoupleIndex = @Index where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[InsertRelationIndex]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertRelationIndex] 
	@GID	int
AS	
insert into  RelationIndex (GID, CoupleIndex, FamilyIndex, Temp1, Temp2) values(@GID, default, default, default, default)
GO
/****** Object:  StoredProcedure [dbo].[GetRelationIndex]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRelationIndex]
	@GID	int
AS	
select * from RelationIndex  where GID = @GID
GO
/****** Object:  Table [dbo].[QuestInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestInfo](
	[GID] [int] NOT NULL,
	[QID] [int] NOT NULL,
	[complete] [bit] NOT NULL,
	[activ] [bit] NOT NULL,
	[hunt_1_mob_id] [int] NULL,
	[hunt_1_count] [smallint] NULL,
	[hunt_2_mob_id] [int] NULL,
	[hunt_2_count] [smallint] NULL,
	[hunt_3_mob_id] [int] NULL,
	[hunt_3_count] [smallint] NULL,
	[mission_time] [datetime] NULL,
	[ReceiveTime] [datetime] NOT NULL,
	[CompleteTime] [datetime] NULL,
 CONSTRAINT [PK_QuestInfo] PRIMARY KEY CLUSTERED 
(
	[GID] ASC,
	[QID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestEvent]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestEvent](
	[GID] [int] NOT NULL,
	[QuestEvent] [varbinary](8000) NULL,
	[CompleteQuest] [varbinary](2000) NULL,
	[Hunt_Mission] [varbinary](8000) NULL,
	[Time_Mission] [varbinary](4000) NULL,
 CONSTRAINT [PK_QuestEvent] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PvPScore]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PvPScore](
	[GID] [int] NOT NULL,
	[AID] [int] NOT NULL,
	[WinTime] [int] NOT NULL,
	[MapName] [varchar](16) NOT NULL,
 CONSTRAINT [PK_PvPScore] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdatePVPEvent]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePVPEvent]
             @GID  varchar(24),
	@Name varchar(36)

 AS

if exists(select *from PVPEvent where GID = @GID)
	update PVPEvent with (rowlock) set PVPName=@Name where GID=@GID
else
	BEGIN
		insert into  PVPEvent values(@GID, @Name)
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPVPEvent]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPVPEvent]
	@GID		varchar(24)
AS	
select PVPName  from PVPEvent where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[UpdatePKInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePKInfo]
	@gid		int,
	@win		int,
	@lose		int,
	@killName	varchar(24),
	@killedName	varchar(24),
	@expiretime	binary(8),
	@noPointTime	binary(8)
 AS
update PKInfo 
set win = @win, lose = @lose, killName = @killName, killedName = @killedName, expiretime = @expiretime, noPointTime=@noPointTime
where GID = @gid
GO
/****** Object:  StoredProcedure [dbo].[GetPKInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPKInfo]
	@gid		int
 AS
if exists(select * from PKInfo where GID = @gid)
  select * from PKInfo where GID = @gid
else
  insert into PKInfo(GID, win, lose, killName, killedName, expiretime, noPointTime) values(@gid, 0, 0, NULL, NULL, 0, 0)
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet](
	[PETID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](24) NULL,
	[Modified] [int] NOT NULL,
	[SpriteType] [int] NOT NULL,
	[Lv] [int] NOT NULL,
	[Fullness] [int] NOT NULL,
	[Relation] [int] NOT NULL,
	[Accessary] [int] NOT NULL,
	[GID] [int] NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[PETID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PartyBooking]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartyBooking](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[GID] [int] NOT NULL,
	[MapID] [smallint] NULL,
	[Level] [smallint] NULL,
	[Job1] [smallint] NULL,
	[Job2] [smallint] NULL,
	[Job3] [smallint] NULL,
	[Job4] [smallint] NULL,
	[Job5] [smallint] NULL,
	[Job6] [smallint] NULL,
	[ExpireTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PartyBooking] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetData]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetData] 
	@num		int
AS
select * from mytbl where num = @num
GO
/****** Object:  StoredProcedure [dbo].[GetAllData]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllData] 
AS
select * from mytbl
GO
/****** Object:  Table [dbo].[TimeList]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeList](
	[GID] [int] NOT NULL,
	[list] [varbinary](512) NULL,
 CONSTRAINT [PK_TimeList] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_HomunFailLog]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_HomunFailLog](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[regDate] [datetime] NULL,
	[GID] [int] NULL,
	[Name] [varchar](20) NULL,
	[Job] [int] NULL,
	[ProcName] [varchar](20) NULL,
	[spid] [int] NULL,
	[Login_Time] [datetime] NULL,
	[HostName] [varchar](50) NULL,
	[program_name] [varchar](100) NULL,
	[hostprocess] [int] NULL,
	[Loginame] [varchar](30) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[storeitem]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[storeitem](
	[AID] [int] NOT NULL,
	[storedItem] [varbinary](8000) NULL,
	[money] [int] NULL,
 CONSTRAINT [PK_storeitem] PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StateInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StateInfo](
	[GID] [int] NOT NULL,
	[info] [varbinary](512) NULL,
 CONSTRAINT [PK_StateInfo] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Skill_Rebuild]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill_Rebuild](
	[GID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Level] [int] NULL,
	[RemainMS] [int] NULL,
	[Attr] [int] NULL,
	[Data] [int] NULL,
 CONSTRAINT [PK_Skill_Rebuild] PRIMARY KEY CLUSTERED 
(
	[GID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill_HomunRebuild]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill_HomunRebuild](
	[GID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Level] [int] NULL,
	[RemainMS] [int] NULL,
	[Attr] [int] NULL,
	[Data] [int] NULL,
 CONSTRAINT [PK_Skill_HomunRebuild] PRIMARY KEY CLUSTERED 
(
	[GID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill_Homun]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Skill_Homun](
	[GID] [int] NOT NULL,
	[SKData] [varbinary](256) NULL,
 CONSTRAINT [PK_Skill_Homun] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[skill]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[skill](
	[GID] [int] NOT NULL,
	[skillInfo] [varbinary](256) NULL,
 CONSTRAINT [PK_skill] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShortCutKeyDB]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShortCutKeyDB](
	[GID] [int] NOT NULL,
	[Ver] [int] NULL,
	[ShortCutKey] [binary](300) NULL,
 CONSTRAINT [PK_ShortCutKeyDB] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateMerceInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateMerceInfo]
	@GID			int,

	@Faith			smallint,
	@JOB			smallint,
	@HP			smallint,
	@SP			smallint,
	@LifeTime		smallint,
	@EXP			int,
	@bodyState		int,
	@healthState		int,
	@effectState		int,
	@property		int,
	@ArcherCount		int,
	@LancerCount		int,
	@SwordCount		int
AS

update MerceInfo   with (rowlock) set

	Faith		= @Faith,
	JOB		= @JOB,
	HP		= @HP,
	SP		= @SP,
	LifeTime	= @LifeTime,
	EXP		= @EXP,
	bodyState 	= @bodyState,
	healthState	= @healthState,
	effectState	= @effectState,
	property		= @property,
	ArcherCount	= @ArcherCount,
	LancerCount	= @LancerCount,
	SwordCount	= @SwordCount

where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateMapName]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMapName]
@GID int
--@MapName varchar(24)
AS
update charinfo with (rowlock)  set mapname =restartMapName where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateMapInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateMapInfo]
	@GID 		INT,
	@MapName 	VARCHAR(24),
	@xPos 		INT,
	@yPos 		INT
AS

	UPDATE charinfo SET MapName = @MapName, xPos=@xPos, yPos=@yPos WHERE GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateMakerRank]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateMakerRank] 
	@gid		int,
	@charname       varchar(24),
	@type		int,
	@point		int
AS
if exists (select * from MakerRank where GID = @gid and Type = @type)
update MakerRank set point = @point where GID = @gid and Type = @type
else 
insert into MakerRank(GID, CharName, Type, Point) values(@gid, @charname, @type, @point)
GO
/****** Object:  StoredProcedure [dbo].[UpdateMailRead]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateMailRead]
	@MailID		int
AS
update Mail with (rowlock) set Reading = 1 where MailID = @MailID
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemStore]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItemStore]
	@storedItem	varbinary(8000)
,	@AID		int
AS
update storeitem with (rowlock) set storedItem = @storedItem where AID = @AID
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemCart]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItemCart]
	@cartItem	varbinary(8000)
,	@GID		int
AS
update cartitem with (rowlock) set cartItem = @cartItem where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemBody]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItemBody]
	@equipItem	varbinary(8000)
,	@GID		int
AS
update item with (rowlock)  set equipItem = @equipItem where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateHuntingList]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateHuntingList]
	@list		varbinary(512),	
	@GID		int
AS
update HuntingList with (rowlock) set list = @list where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateHomunInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateHomunInfo]
	@homunID	int,
	@GID		int,
	@name		varchar(24),
	@modified	int,
	@level		smallint,
	@job		smallint,
	@exp		int,
	@SKPoint	smallint,
	@hp		smallint,
	@maxHP	smallint,
	@sp		smallint,
	@maxSP	smallint,
	@accessory	smallint,

	@Str		tinyint,
	@Agi		tinyint,
	@Vit		tinyint,
	@Int		tinyint,
	@Dex		tinyint,
	@Luk		tinyint,

	@bodystate	int,
	@healthstate	int,
	@effectstate	int,
	@property	smallint,
	
	@fullness	int,
	@relation	int
AS

update HomunInfo   with (rowlock) set
	Name 		= @name,
	Modified	= @modified,
	level		= @level,
	job		= @job,
	exp		= @exp,
	SKPoint 	= @SKPoint,
	hp		= @hp,
	maxHP		= @maxHP,
	sp		= @sp,
	maxSP		= @maxSP,
	accessory	= @accessory,

	Str		= @Str,
	Agi		= @Agi,
	Vit		= @Vit,
	Int		= @Int,
	Dex		= @Dex,
	Luk		= @Luk,

	bodyState	= @bodystate,
	healthState	= @healthstate,
	effectState	= @effectstate,
	property		= @property,
	
	fullness		= @fullness,
	relation		= @relation
 where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildVirtue]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildVirtue]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set Virtue=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildType]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildType]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set Type=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildSkill]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildSkill]
	@GDID		int
,	@skillInfo	varbinary(256)
,	@Point		int	
AS
update GuildSkill with (rowlock) set Skill=@skillInfo, Point=@Point where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildRelation]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildRelation]
	@GDID		int
,	@Value		int
AS
update GuildAllyInfo with (rowlock)  set Relation=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildPoint]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildPoint]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set Point=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildOpponentGDID]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildOpponentGDID]
	@GDID		int
,	@Value		int
AS
update GuildAllyInfo with (rowlock)  set OpponentGDID=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildNotice]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildNotice]
	@GDID		int
,	@Subject	varchar(60)
,	@Value		varchar(120)
AS
update GuildNotice with (rowlock)  set Subject=@Subject, Notice=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildName]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildName]
	@GDID		int
,	@Value		varchar(24)
AS
update GuildInfoDB with (rowlock)  set Name=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMPPositionID]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMPPositionID]
	@GDID		int
,	@Value		int
AS
update GuildMPosition with (rowlock)  set PositionID=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMPPenaltyRight]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMPPenaltyRight]
	@GDID		int
,	@Value		int
AS
update GuildMPosition with (rowlock)  set PenaltyRight=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMPos]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildMPos]
	@GDID		int
,	@PosID	int
,	@Service	int
,	@Name		varchar(30)
,	@JRight	int
,	@PRight	int
AS
update GuildMPosition with (rowlock)  set JoinRight=@JRight, PenaltyRight=@PRight, Service=@Service, PosName=@Name where GDID = @GDID and PositionID=@PosID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMPJoinRight]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMPJoinRight]
	@GDID		int
,	@Value		int
AS
update GuildMPosition with (rowlock)  set JoinRight=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMPGrade]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMPGrade]
	@GDID		int
,	@Value		int
AS
update GuildMPosition with (rowlock)  set Grade=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMoney]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildMoney]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set Money=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMName]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildMName]
	@GDID		int
,	@Value		varchar(24)
AS
update GuildInfoDB with (rowlock)  set MName=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMInfoPos]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildMInfoPos]
	@GDID		int
,	@GID		int
,	@PosID	int
AS
update GuildMInfo with (rowlock)  set PositionID=@PosID where GDID = @GDID and GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildMInfo]
	@GID		int
,	@Name		varchar(24)
,	@Memo	varchar(50)
,	@Level		int
,	@Class		int
,	@Service	int
,	@MemberExp	int
,	@GDID		int
,	@AID		int
,	@PositionID	int
AS
update GuildMInfo with (rowlock) set  CharName=@Name, Memo=@Memo, [Level]=@Level, Class=@Class,  Service=@Service, MemberExp=@MemberExp, GDID=@GDID, AID=@AID, PositionID=@PositionID  where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMemberService]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMemberService]
	@GDID		int
,	@Value		int
AS
update GuildMInfo with (rowlock)  set Service=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMemberPositionID]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMemberPositionID]
	@GDID		int
,	@Value		int
AS
update GuildMInfo with (rowlock)  set PositionID=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMemberMemo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMemberMemo]
	@GDID		int
,	@Value		varchar(50)
AS
update GuildMInfo with (rowlock)  set Memo=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMemberGDID]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMemberGDID]
	@GDID		int
,	@Value		int
AS
update GuildMInfo with (rowlock)  set GDID=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMemberExp]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMemberExp]
	@GDID		int
,	@Value		int
AS
update GuildMInfo with (rowlock)  set MemberExp=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMemberCharname]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMemberCharname]
	@GDID		int
,	@Value		varchar(24)
AS
update GuildMInfo with (rowlock)  set CharName=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMemberAID]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMemberAID]
	@GDID		int
,	@Value		int
AS
update GuildMInfo with (rowlock)  set AID=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMember]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildMember]
	@GDID		int
,	@GID		int
,	@Service	int
,	@Exp		int
,	@Level		int
,	@Class		int
AS
update GuildMInfo with (rowlock)  set Service=@Service, MemberExp=@Exp, [Level]=@Level, Class=@Class where GDID = @GDID and GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildMaxUserNum]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildMaxUserNum]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set MaxUserNum=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildManageLand]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildManageLand]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set ManageLand=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildLevel]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildLevel]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set [Level]=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildInfo]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildInfo]
	@GDID		int
,	@Level		int
,	@Name		varchar(24)
,	@MName	varchar(24)
,	@MaxUserNum	int
,	@Honor	int
,	@Virtue		int
,	@Type		int
,	@Class		int
,	@Money	int
,	@ArenaWin	int
,	@ArenaLose	int
,	@ArenaDrawn	int
,	@ManageLand	varchar(24)
,	@Exp		int
,	@Emblem	int
,	@Point		int
,	@Desc		varchar(80)
AS
update GuildInfoDB with (rowlock) set [Level]=@Level, Name=@Name, MName=@MName, MaxUserNum=@MaxUserNum, Honor=@Honor, Virtue=@Virtue, Type=@Type, Class=@Class, Money=@Money, ArenaWin=@ArenaWin, ArenaLose=@ArenaLose, ArenaDrawn=@ArenaDrawn, ManageLand=@ManageLand, Exp=@Exp,  EmblemVersion=@Emblem, Point=@Point, [Desc]=@Desc  where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildHonor]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildHonor]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set Honor=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildExp]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildExp]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set Exp=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildEmblem]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildEmblem]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set EmblemVersion=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildDesc]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildDesc]
	@GDID		int
,	@Value		varchar(80)
AS
update GuildInfoDB with (rowlock)  set [Desc]=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildClass]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildClass]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set Class=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildBReason]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildBReason]
	@GDID		int
,	@Value		varchar(50)
AS
update GuildBanishInfo with (rowlock)  set Reason=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildBMemberName]    Script Date: 02/16/2018 13:52:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildBMemberName]
	@GDID		int
,	@Value		varchar(24)
AS
update GuildBanishInfo with (rowlock)  set MemberName=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildBMemberAccount]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildBMemberAccount]
	@GDID		int
,	@Value		varchar(24)
AS
update GuildBanishInfo with (rowlock)  set MemberAccount=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildBGID]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildBGID]
	@GDID		int
,	@Value		int
AS
update GuildBanishInfo with (rowlock)  set GID=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildBAID]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGuildBAID]
	@GDID		int
,	@Value		int
AS
update GuildBanishInfo with (rowlock)  set AID=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildArenaWin]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildArenaWin]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set ArenaWin=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildArenaLose]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildArenaLose]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set ArenaLose=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGuildArenaDrawn]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGuildArenaDrawn]
	@GDID		int
,	@Value		int
AS
update GuildInfoDB with (rowlock)  set ArenaDrawn=@Value where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGlobalVar]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGlobalVar]
	@VarName varchar(24),
	@VarValue int
 AS

	UPDATE  GlobalVar  SET VarValue = @VarValue  WHERE VarName = @VarName
	IF @@ROWCOUNT = 1
		RETURN 1
	ELSE 
		RETURN 0

/*
	IF NOT EXISTS(SELECT * FROM GlobalVar WHERE VarName = @VarName)
		RETURN  0
	ELSE
		UPDATE  GlobalVar  SET VarValue = @VarValue  WHERE VarName = @VarName
	 RETURN 1
*/
GO
/****** Object:  StoredProcedure [dbo].[UpdateGlobalStr]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateGlobalStr]
@StrName	VARCHAR(24),
@StrValue	VARCHAR(24)
 AS

UPDATE  GlobalStr  SET StrValue = @StrValue  WHERE StrName = @StrName
GO
/****** Object:  StoredProcedure [dbo].[UpdateFriends]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFriends]
	@GID		int,
	@data		varbinary(1600)
AS
update Friends  set data = @data where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[SelectTimeList]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectTimeList] 
	@GID 	int
AS	select list from TimeList where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[SelectPet]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPet] 
	@PETID 	    int
AS	
select * from PET where PETID = @PETID
GO
/****** Object:  StoredProcedure [dbo].[SelectHuntingList]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectHuntingList] 
	@GID 	int
AS	select list from HuntingList where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[Money]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Money]
	@GDID		int
AS	
select Money  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[MakeCharInfoNotStats]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MakeCharInfoNotStats]
    @CharName        varchar(24),
    @AID            int,
    @mapName        varchar(24),
    @xPos            smallint,
    @yPos            smallint,
    @CharNum        tinyint,
    @sxPos            smallint,
    @syPos            smallint,
    @restartMapName    varchar(24),
    @head            smallint,
    @headpalette        smallint
AS
SET NOCOUNT ON

IF EXISTS(SELECT GID FROM charinfo WHERE AID=@AID AND CharNum=@CharNum)
    BEGIN
        RETURN(-1) --실패
    END
ELSE
    BEGIN TRAN
        INSERT charinfo(CharName, jobpoint, STR, AGI, VIT, INT, DEX, LUK, AID, mapname, xPos, yPos, CharNum, sxPos, syPos, restartMapName, head, headpalette, bIsChangedCharName)
        VALUES(@CharName, 48, 1, 1, 1, 1, 1, 1, @AID, @mapName, @xPos, @yPos, @CharNum, @sxPos, @syPos, @restartMapName, @head, @headpalette, 1)

        DECLARE @GID INT
        SELECT @GID=GID FROM charinfo WHERE AID=@AID AND CharNum=@CharNum

        IF @@rowcount <> 1
            BEGIN
                ROLLBACK TRAN
                RETURN(-2) --실패
            END
        ELSE
            BEGIN
                --SKID_NV_BASIC(1)
                --Attr 1:노비스스킬
                DELETE Skill_Rebuild WHERE GID=@GID
                INSERT Skill_Rebuild(GID, ID, Level, RemainMS, Attr, Data)
                VALUES(@GID, 1, 0, 0, 1, 0)
            END
    COMMIT TRAN
    RETURN(1) -- 성공
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[MakeCharInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[MakeCharInfo]
	@CharName		VARCHAR(24),
	@STR			TINYINT,
	@AGI			TINYINT,
	@VIT			TINYINT,
	@INT			TINYINT,
	@DEX			TINYINT,
	@LUK			TINYINT,
	@AID			INT,
	@mapName		VARCHAR(24),
	@xPos			INT,
	@yPos			INT,
	@CharNum		TINYINT,
	@sxPos			INT,
	@syPos			INT,
	@restartMapName	VARCHAR(24),
	@head			TINYINT,
	@headpalette		TINYINT
AS	
	
	
	IF EXISTS (SELECT GID FROM charinfo WHERE AID = @AID AND CharNum = @CharNum)
		BEGIN
			RETURN(-1)--실패
		END
		
	ELSE

		

	BEGIN TRAN
		INSERT charinfo(CharName,STR,AGI,VIT,INT, DEX,LUK,AID,mapname,xPos,yPos,CharNum,sxPos,syPos,restartMapName,head,headpalette,bIsChangedCharName)
		VALUES(@CharName,@STR,@AGI,@VIT,@INT,@DEX,@LUK,@AID,@mapName,@xPos,@yPos,@CharNum,@sxPos,@syPos,@restartMapName,@head,@headpalette,1)
	
		DECLARE @GID INT
		SELECT @GID=GID FROM charinfo WHERE AID = @AID AND CharNum = @CharNum
		IF @@rowcount <> 1
			BEGIN
				ROLLBACK TRAN
				RETURN(-1)
			END
		
		ELSE
			BEGIN
				--SKID_NV_BASIC(1)
				--Attr 1:노비스스킬
				DELETE Skill_Rebuild WHERE GID=@GID
				INSERT Skill_Rebuild (GID,ID,Level,RemainMS,Attr,Data) VALUES(@GID,1,0,0,1,0)
			END
	COMMIT TRAN
	RETURN(1) -- 성공
GO
/****** Object:  StoredProcedure [dbo].[IsValidCharName]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IsValidCharName] 
    @CharName	varchar(24)
AS
SET NOCOUNT ON
	
	SELECT COUNT(CharName)
	FROM CharInfo
	WHERE CharName=@CharName
GO
/****** Object:  StoredProcedure [dbo].[InsertWarpInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertWarpInfo] 
	@GID		int
AS	
insert warpInfo values(@GID, NULL, NULL,NULL, NULL, NULL,NULL, NULL, NULL,NULL)
GO
/****** Object:  StoredProcedure [dbo].[InsertTimeList]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTimeList] 
	@GID	int
AS	
insert TimeList values(@GID, NULL)
GO
/****** Object:  StoredProcedure [dbo].[InsertStoreItem]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertStoreItem] 
	@AID		int
AS	
insert storeitem values(@AID, NULL,NULL)
GO
/****** Object:  StoredProcedure [dbo].[InsertStateInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStateInfo] 
	@GID	int
AS	
insert StateInfo values(@GID, NULL)
GO
/****** Object:  StoredProcedure [dbo].[InsertSkill_Homun]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSkill_Homun]
	@GID		int
AS	
insert Skill_Homun values (@GID, NULL)
GO
/****** Object:  StoredProcedure [dbo].[InsertSkill]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSkill] 
	@GID		int
AS	
insert skill values(@GID, NULL)
GO
/****** Object:  StoredProcedure [dbo].[InsertQuestEvent]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertQuestEvent]
	@AID 		int
AS
BEGIN
SET NOCOUNT ON
	Insert QuestEvent values(@AID, NULL, NULL, NULL, NULL)
SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPvPScore]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPvPScore] 
	@GID		int,
	@AID		int,
	@WinTime	int,
              @MapName         varchar(16)
AS	
insert PvPScore values(@GID, @AID, @WinTime, @MapName)
GO
/****** Object:  StoredProcedure [dbo].[InsertPet]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertPet]
	@Name		varchar(24),
	@Modified	int,
	@SpriteType	int,
	@Lv		int,
	@Fullness	int,
	@Relation	int,
	@Accessary	int
AS
Insert pet (Name, Modified, SpriteType, Lv, Fullness, Relation, Accessary) 
values(@Name, @Modified, @SpriteType, @Lv, @Fullness, @Relation, @Accessary)
RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[InsertPartyBooking]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/* 
	3. 파티부킹 데이터 입력
*/
CREATE PROCEDURE [dbo].[InsertPartyBooking]
	@GID		INT,
	@MapID		SMALLINT,
	@Level		SMALLINT,
	@Job1		SMALLINT,
	@Job2		SMALLINT,
	@Job3		SMALLINT,
	@Job4		SMALLINT,
	@Job5		SMALLINT,
	@Job6		SMALLINT
AS
SET NOCOUNT ON
	DELETE PartyBooking Where GID = @GID	

	INSERT INTO PartyBooking (GID, MapID, [Level], Job1, Job2, Job3, Job4, Job5, Job6, ExpireTime) 
	VALUES(@GID, @MapID, @Level, @Job1, @Job2, @Job3, @Job4, @Job5, @Job6, GETDATE())

	SELECT [Index], ExpireTime FROM PartyBooking WITH(NOLOCK) Where GID = @GID	
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[InsertMember]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMember] 
	@GID		int
,	@AID		int
,	@CharName	varchar(24)
,	@GRID		int
,	@Role		int
AS	
insert groupMInfo values(@GID, @AID, @CharName, @GRID, @Role)
GO
/****** Object:  StoredProcedure [dbo].[InsertMannerPoint]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertMannerPoint] 
	@AID		int
,	@OtherGID	int
,	@type		int
AS	
insert into  MannerPoint (aid,otherGID,[time],type) values(@AID, @OtherGID,default,@type)
GO
/****** Object:  StoredProcedure [dbo].[InsertMail]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMail]
	@AID		int,
	@GID		int,
	@Header	 Varchar(24),
	@Reading	int,
	@ItemInfo	Varbinary(24),
	@ItemLen	int,
	@Money	int,
	@FromName	Varchar(24),
	@Text		Varchar(200),
	@DeleteTime	datetime
AS
Insert into Mail (AID, GID, Header, Reading, ItemInfo, ItemLen, Money, FromName, Text, DeleteTime)
values (@AID, @GID, @Header, @Reading, @ItemInfo, @itemLen, @Money, @FromName, @Text, @DeleteTime)

RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[GM_CoupleInfo2_View]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_CoupleInfo2_View]
@GID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT * FROM dbo.CoupleInfo2 WHERE maleGID = @GID OR femaleGID = @GID
END
GO
/****** Object:  StoredProcedure [dbo].[GetQuestEvent]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetQuestEvent]
	@GID 	int
AS
BEGIN
SET NOCOUNT ON
	SELECT QuestEvent, CompleteQuest, Hunt_Mission, Time_Mission   from dbo.QuestEvent where GID = @GID
SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[GetPvPScore]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPvPScore] 
	@GID 	int
AS	
select WinTime, MapName from PvPScore  where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetPoint]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPoint]
	@GDID		int
AS	
select Point  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetMoney]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMoney]
	@GDID		int
AS	
select Money  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[InsertItem]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertItem] 
	@GID		int
AS	
insert item values(@GID, NULL )
GO
/****** Object:  StoredProcedure [dbo].[InsertInventory]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInventory]
	@equipItem 	varbinary(8000),
	@GID		int
AS
SET NOCOUNT ON

	INSERT item 
	       VALUES(@GID, @equipItem)
GO
/****** Object:  StoredProcedure [dbo].[InsertHuntingList]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertHuntingList] 
	@GID	int
AS	
insert HuntingList values(@GID, NULL)
GO
/****** Object:  StoredProcedure [dbo].[InsertHomunInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertHomunInfo]
	@GID		int,
	@name		varchar(24),
	@modified	int,
	@level		smallint,
	@job		smallint,
	@exp		int,
	@SKPoint	smallint,
	@hp		smallint,
	@maxHP	smallint,
	@sp		smallint,
	@maxSP	smallint,
	@accessory	smallint,

	@Str		tinyint,
	@Agi		tinyint,
	@Vit		tinyint,
	@Int		tinyint,
	@Dex		tinyint,
	@Luk		tinyint,

	@bodystate	int,
	@healthstate	int,
	@effectstate	int,
	@property	smallint,
	
	@fullness	int,
	@relation	int
AS
Insert into HomunInfo ( GID, Name, Modified, level, job, exp, SKPoint, hp, maxHP, sp, maxSP, accessory, Str, Agi, Vit, Int, Dex, Luk,
 	bodyState, healthState, effectState, property, fullness, Relation
 ) 
values ( @GID, @name, 	@level,  @modified, @job, @exp, @SKPoint, @hp, @maxHP, @sp, @maxSP, @accessory, @Str, @Agi,  @Vit, @Int,  @Dex,  @Luk,
	 @bodystate, @healthstate, @effectstate, @property, @fullness, @relation
 )

RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[InsertGuildSkill]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGuildSkill] 
	@GDID		int
,	@Point		int
AS	
insert into  GuildSkill (GDID, Point) values(@GDID, @Point)
GO
/****** Object:  StoredProcedure [dbo].[InsertGuildNotice]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGuildNotice] 
	@GDID		int
AS	
insert into  GuildNotice (GDID) values(@GDID)
GO
/****** Object:  StoredProcedure [dbo].[InsertGuildMPosition]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGuildMPosition]
	@GDID		int
,	@Ranking	int
,	@Pos		varchar(30)
,	@Join		int
,	@Penalty	int
,	@PositionID	int
,	@Service	int
AS
insert GuildMPosition values(@GDID, @Ranking, @Pos, @Join, @Penalty, @PositionID, @Service)
GO
/****** Object:  StoredProcedure [dbo].[InsertGuildMInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGuildMInfo]
	@GID		int
,	@Name		varchar(24)
,	@AName	varchar(24)
,	@Level		int
,	@Class		int
,	@Memo	varchar(50)
,	@Service	int
,	@MemberExp	int
,	@GDID		int
,	@AID		int
,	@PositionID	int
AS
insert GuildMInfo values(@GID, @Name, @AName, @Level, @Class, @Memo, @Service, @MemberExp,@GDID, @AID, @PositionID)
GO
/****** Object:  StoredProcedure [dbo].[InsertGuildBanishInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGuildBanishInfo]
	@GDID		int
,	@Name		varchar(24)
,	@Account	varchar(24)
,	@Reason	varchar(50)
,	@GID		int
,	@AID		int
AS
insert GuildBanishInfo(GDID, MemberName, MemberAccount, Reason, GID, AID)
values(@GDID, @Name, @Account, @Reason, @GID, @AID)
GO
/****** Object:  StoredProcedure [dbo].[InsertGuildAllyInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGuildAllyInfo]
	@GDID		int
,	@OGDID	int
,	@Name		varchar(24)
,	@Relation	int
AS
insert GuildAllyInfo values(@GDID, @OGDID, @Name, @Relation)
GO
/****** Object:  StoredProcedure [dbo].[InsertGuild]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertGuild] 
	@name		varchar(24)
,	@mname	varchar(24)
AS	
insert into  GuildInfoDB (Name, MName) values(@name, @mname)
GO
/****** Object:  StoredProcedure [dbo].[InsertGroup]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGroup] 
	@name		varchar(24),
             @GroupOption                Int
AS	
insert GroupInfo values(@name, @GroupOption)
GO
/****** Object:  StoredProcedure [dbo].[InsertGlobalVar]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGlobalVar]
	@VarName varchar(24),
             @VarValue  int

 AS

DECLARE @ROW SMALLINT
SET @ROW = 0

SELECT @ROW = COUNT(*)  FROM GlobalVar WHERE VarName = @VarName
IF @ROW = 0
BEGIN
	INSERT INTO GlobalVar VALUES(@VarName,@VarValue)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertGlobalStr]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertGlobalStr]
@StrName	VARCHAR(24),
@StrValue	VARCHAR(24)
AS

DECLARE @ROW SMALLINT
SET @ROW = 0

SELECT @ROW = COUNT(*)  FROM GlobalStr WHERE StrName = @StrName
IF @ROW = 0
BEGIN
	INSERT INTO GlobalStr VALUES(@StrName,@StrValue)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFriends]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertFriends]
	@GID		int,
	@data		varbinary(1600)
AS
insert Friends values (@GID, @data)
GO
/****** Object:  StoredProcedure [dbo].[InsertFamily]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFamily] 
	@father		int
,	@mother	int
,	@baby		int
,            @Time  		varbinary(8)

AS	

Insert  Family (fatherGID,  motherGID, babyGID, [Time], Time2) 
values(@father, @mother, @baby, @Time, default)
RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[InsertEffectiveInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertEffectiveInfo] 
	@GID	int
AS	
insert EffectiveInfo values(@GID, NULL)
GO
/****** Object:  StoredProcedure [dbo].[InsertCouple2]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCouple2] 
	@maleGID	int
,	@femaleGID	int
,            @weddingTime  varbinary(8)

AS	

insert into  CoupleInfo2 (maleGID,  femaleGID, weddingTime, weddingTime2) values(@maleGID, @femaleGID, @weddingTime, default)
GO
/****** Object:  StoredProcedure [dbo].[GM_CoupleInfo2_Divorce]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_CoupleInfo2_Divorce]
@sex AS TINYINT,
@GID AS INT,
@WedGID AS INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	IF @sex <> 1
	BEGIN
		DELETE FROM dbo.CoupleInfo2 WHERE femaleGID = @GID OR maleGID = @WedGID
	END
	ELSE
	BEGIN
		DELETE FROM dbo.CoupleInfo2 WHERE maleGID = @GID OR femaleGID = @WedGID
	END

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_View]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_View]
@GID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT * FROM dbo.charinfo WHERE GID = @GID
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_UpdateZeny]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_UpdateZeny]
@GID AS INT,
@money AS INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	UPDATE dbo.charinfo SET
		[money] = @money
	WHERE
		GID = @GID

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_UpdateState]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_UpdateState]
@GID AS INT,
@STR AS TINYINT,
@AGI AS TINYINT,
@VIT AS TINYINT,
@INT AS TINYINT,
@DEX AS TINYINT,
@LUK AS TINYINT,
@maxsp AS SMALLINT,
@maxhp AS SMALLINT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	UPDATE dbo.charinfo SET
		[STR] = @STR,
		AGI = @AGI,
		VIT = @VIT,
		[INT] = @INT,
		DEX = @DEX,
		LUK = @LUK,
		maxsp = @maxsp,
		maxhp = @maxhp
	WHERE
		GID = @GID

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_UpdateSP]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_UpdateSP]
@GID AS INT,
@sppoint AS SMALLINT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	UPDATE dbo.charinfo SET sppoint = @sppoint WHERE GID = @GID

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 1 AS ErrNo RETURN END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_UpdatePos]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_UpdatePos]
@GID AS INT,
@mapname AS VARCHAR(24),
@xPos AS SMALLINT,
@yPos AS SMALLINT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	UPDATE dbo.charinfo SET
		mapname = @mapname,
		xPos = @xPos,
		yPos = @yPos
	WHERE
		GID = @GID

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_UpdateLVSK]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GM_charinfo_UpdateLVSK]
@GID AS INT,
@job AS SMALLINT,
@clevel AS SMALLINT,
@joblevel AS INT,
@sppoint AS SMALLINT,
@jobpoint AS SMALLINT,
@maxhp AS SMALLINT,
@maxsp AS SMALLINT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	IF @clevel <> ''
	BEGIN 

		UPDATE dbo.charinfo SET
			job = @job,
			clevel = @clevel,
			joblevel = @joblevel,
			sppoint = @sppoint,
			jobpoint = @jobpoint,
			[STR] = 1,
			AGI = 1,
			VIT = 1,
			[INT] = 1,
			DEX = 1,
			LUK = 1,
			maxHP = @maxHP,
			maxSP = @maxSP
		WHERE
			GID = @GID

		IF (@job > 6 AND @job < 21) OR (@job > 4007 AND @job < 4022) OR (@job > 4029 AND @job < 4050)
		BEGIN 
			IF NOT EXISTS(SELECT * from skill_rebuild WHERE GID = @GID AND [ID] = '10100')
				INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10100','0','0','0','50')
		END 
		ELSE IF (@JOB > 4053 AND @JOB < 4060) OR (@JOB > 4065 AND @JOB < 4073) OR (@JOB > 4095 AND @JOB < 4109)
		BEGIN 
			IF NOT EXISTS(SELECT * from skill_rebuild WHERE GID = @GID AND [ID] = '10100')
				INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10100','0','0','0','50')
			IF NOT EXISTS(SELECT * from skill_rebuild WHERE GID = @GID AND [ID] = '10101')
				INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10101','0','0','0','50')
		END 
		ELSE IF (@JOB > 4059 AND @JOB < 4066) OR (@JOB > 4072 AND @JOB < 4080)
		BEGIN 
			IF NOT EXISTS(SELECT * from skill_rebuild WHERE GID = @GID AND [ID] = '10100')
				INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10100','0','0','0','50')
			IF NOT EXISTS(SELECT * from skill_rebuild WHERE GID = @GID AND [ID] = '10101')
				INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10101','0','0','0','70')
		END 
	END 

	IF @joblevel <> ''
	BEGIN 
		UPDATE dbo.charinfo SET 
			joblevel = @joblevel 
		WHERE 
			GID = @GID
	END

	IF @sppoint <> ''
	BEGIN 
		UPDATE dbo.charinfo SET 
			sppoint = @sppoint 
		WHERE 
			GID = @GID
	END


	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_UpdateHair]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_UpdateHair]
@GID AS INT,
@head AS SMALLINT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	UPDATE dbo.charinfo SET
		head = @head
	WHERE
		GID = @GID

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_UpdateCharName]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GM_charinfo_UpdateCharName]
@GID AS INT,
@GuildGrCK AS VARCHAR(15),
@CharName AS VARCHAR(24)
AS
BEGIN
	SET NOCOUNT ON

	IF EXISTS(SELECT GID FROM dbo.charinfo WHERE CharName = @CharName)
	BEGIN
		SELECT 1 AS ErrNo
		RETURN
	END

	BEGIN TRANSACTION

	UPDATE dbo.charinfo SET CharName = @CharName WHERE GID = @GID

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	IF @GuildGrCK <> 'noguildgr'
	BEGIN
		IF @GuildGrCK = 'guildgr' OR @GuildGrCK = 'guild'
		BEGIN
			DECLARE @GDID AS INT
			DECLARE @PositionID AS INT
		
			SELECT
				@GDID = GuildInfoDB.GDID,
				@PositionID = GuildMInfo.PositionID
			FROM
				dbo.GuildInfoDB AS GuildInfoDB
				INNER JOIN dbo.GuildMInfo AS GuildMInfo
				ON GuildInfoDB.GDID = GuildMInfo.GDID
				AND GuildMInfo.GID = @GID

			IF @PositionID = 0
			BEGIN
				UPDATE dbo.GuildInfoDB SET MName = @CharName WHERE GDID = @GDID
				IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END
			END
		END

		UPDATE dbo.GuildMInfo SET CharName = @CharName WHERE GID = @GID
		IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END
	END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_SimilarList]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_SimilarList]
@CharName AS VARCHAR(24)
AS
BEGIN
	SET NOCOUNT ON

	SELECT TOP 500 * FROM dbo.charinfo WHERE CharName LIKE @CharName+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_Search]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_Search]
@GID AS INT=NULL,
@CharName AS VARCHAR(24)=NULL
AS
BEGIN
	SET NOCOUNT ON

	IF @GID <> ''
	BEGIN
		SELECT * FROM dbo.charinfo WHERE GID = @GID
	END
	ELSE
	BEGIN
		SELECT * FROM dbo.charinfo WHERE CharName = @CharName
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_Rank]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_Rank]
@RankType AS VARCHAR(20),
@RankContent AS VARCHAR(50)=NULL
AS
BEGIN
	SET NOCOUNT ON

	IF @RankType = 'RichChar'
	BEGIN
		SELECT TOP 500 * FROM dbo.charinfo ORDER BY [money] DESC
	END

	IF @RankType = 'LvChar'
	BEGIN
		SELECT TOP 500 * FROM dbo.charinfo ORDER BY clevel DESC
	END

	IF @RankType = 'LvJob'
	BEGIN
		SELECT TOP 500 * FROM dbo.charinfo ORDER BY joblevel DESC
	END

	IF @RankType = 'CharitsLv'
	BEGIN
		SELECT TOP 500 * FROM dbo.charinfo WHERE clevel = @RankContent ORDER BY [money] DESC
	END

	IF @RankType = 'JoblvEachJob'
	BEGIN
		SELECT TOP 500 * FROM dbo.charinfo WHERE job = @RankContent ORDER BY joblevel DESC
	END

	IF @RankType = 'skillpoint'
	BEGIN
		SELECT TOP 500 * FROM dbo.charinfo ORDER BY sppoint DESC
	END

	IF @RankType = 'statpoint'
	BEGIN
		IF @RankContent = 'STR'
		BEGIN
			SELECT TOP 500 * FROM dbo.charinfo ORDER BY [STR] DESC
		END

		IF @RankContent = 'AGI'
		BEGIN
			SELECT TOP 500 * FROM dbo.charinfo ORDER BY AGI DESC
		END

		IF @RankContent = 'VIT'
		BEGIN
			SELECT TOP 500 * FROM dbo.charinfo ORDER BY VIT DESC
		END

		IF @RankContent = 'INT'
		BEGIN
			SELECT TOP 500 * FROM dbo.charinfo ORDER BY [INT] DESC
		END

		IF @RankContent = 'DEX'
		BEGIN
			SELECT TOP 500 * FROM dbo.charinfo ORDER BY DEX DESC
		END

		IF @RankContent = 'LUK'
		BEGIN
			SELECT TOP 500 * FROM dbo.charinfo ORDER BY LUK DESC
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_List]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_List]
@AID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT * FROM dbo.charinfo WHERE AID = @AID
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_GuildView]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_GuildView]
@GID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		GuildInfoDB.[Name],
		GuildInfoDB.GDID
	FROM
		dbo.GuildInfoDB AS GuildInfoDB
		INNER JOIN dbo.GuildMInfo AS GuildMInfo
		ON GuildInfoDB.GDID = GuildMInfo.GDID
		AND GuildMInfo.GID = @GID
END
GO
/****** Object:  StoredProcedure [dbo].[GM_charinfo_CoupleView]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_charinfo_CoupleView]
@GID AS INT,
@sex AS VARCHAR(6)
AS
BEGIN
	SET NOCOUNT ON

	IF @sex = 'male'
	BEGIN
		SELECT
			ch.GID,
			ch.CharName
		FROM
			dbo.charinfo AS ch
			INNER JOIN dbo.CoupleInfo2 AS Co
			ON ch.GID = Co.maleGID
			AND Co.femaleGID = @GID
	END

	IF @sex = 'female'
	BEGIN
		SELECT
			ch.GID,
			ch.CharName
		FROM
			dbo.charinfo AS ch
			INNER JOIN dbo.CoupleInfo2 AS Co
			ON ch.GID = Co.femaleGID
			AND Co.maleGID = @GID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GM_Agit_List]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_Agit_List]
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		agit.mapName,
		agit.agitName,
		agit.GDID,
		ISNULL(guild.[Name], '') AS [Name],
		ISNULL(guild.MName, '') AS MName,
		agit.economy,
		agit.defense,
		agit.triggerE,
		agit.triggerD,
		agit.nextTime,
		agit.payTime,
		agit.createTime,
		agit.visibleC,
		agit.visibleG0,
		agit.visibleG1,
		agit.visibleG2,
		agit.visibleG3,
		agit.visibleG4,
		agit.visibleG5,
		agit.visibleG6,
		agit.visibleG7
	FROM
		dbo.Agit AS agit
		LEFT JOIN dbo.GuildInfoDB AS guild
		ON guild.GDID = agit.GDID
		
		
END
GO
/****** Object:  StoredProcedure [dbo].[GetVirtue]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetVirtue]
	@GDID		int
AS	
select Virtue  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetWarpInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWarpInfo] 
	@GID 	int
AS	select *  from warpInfo  where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetType]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetType]
	@GDID		int
AS	
select Type  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetTopMakerRank]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopMakerRank] 
	@type		int
AS	
select top 10 * from MakerRank where type = @type order by point desc
GO
/****** Object:  StoredProcedure [dbo].[GetStateInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStateInfo] 
	@GID 	int
AS	select info from StateInfo where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetSkill_Homun]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSkill_Homun] 
	@GID 	int
AS	select SKData from Skill_Homun where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetSkill]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSkill] 
	@GID 	int
AS	select skillInfo from skill where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetShortCutKey]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetShortCutKey]
	@GID		int
AS	
select ShortCutKey from ShortCutKeyDB where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[GetSellerAuctionID]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetSellerAuctionID]
	@ZoneServerID	int,
	@SellerAID	int,
	@SellerGID	int

AS	
select AuctionID from Auction  where AID = @SellerAID and GID = @SellerGID and ZoneServerID = @ZoneServerID
GO
/****** Object:  StoredProcedure [dbo].[GetMember]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMember]
	@GID		int
AS	
select GRID from GroupMInfo where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[GetMaxUserNum]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMaxUserNum]
	@GDID		int
AS	
select MaxUserNum  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetMapName]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMapName] 
	@GID		int
AS	
SET NOCOUNT ON

SELECT     MapName
FROM         charinfo
WHERE GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[GetMannerPoint_1]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMannerPoint_1] 
	@AID	int
AS	
select  top 1 otherGID, type, day([time])  from MannerPoint where AID=@AID
order by [time] desc
GO
/****** Object:  StoredProcedure [dbo].[GetMannerPoint]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMannerPoint] 
	@AID	int
AS	
select  otherGID, type, day([time])  from MannerPoint where AID=@AID
order by [time]
GO
/****** Object:  StoredProcedure [dbo].[GetManageLand]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetManageLand]
	@GDID		int
AS	
select ManageLand  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetMakerRank]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMakerRank] 
	@gid	int,
	@type	int
AS
select Point from MakerRank where GID = @gid and  Type = @type
GO
/****** Object:  StoredProcedure [dbo].[GetMail]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMail] 
	@GID		int
AS	
select * from Mail where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[GetLevel]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetLevel]
	@GDID		int
AS	
select [Level]  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetItemStore]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetItemStore] 
	@AID 	int
AS	select storedItem  from storeitem where AID = @AID
GO
/****** Object:  StoredProcedure [dbo].[GetCoupleByFemale]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCoupleByFemale]
	@femaleGID	int
AS	
select * from CoupleInfo2  where femaleGID = @femaleGID
GO
/****** Object:  StoredProcedure [dbo].[GetCouple]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCouple]
	@maleGID	int
AS	
select * from CoupleInfo2  where maleGID = @maleGID
GO
/****** Object:  StoredProcedure [dbo].[GetCountSellItem]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCountSellItem]
	@ZoneServerID	int,
	@SellerAID	int,
	@SellerGID	int

AS	
select COUNT(*) from Auction  where AID = @SellerAID and GID = @SellerGID and ZoneServerID = @ZoneServerID
GO
/****** Object:  StoredProcedure [dbo].[GetCountBuyItem]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCountBuyItem]
	@ZoneServerID	int,
	@BuyerAID	int,
	@BuyerGID	int

AS	
select COUNT(*) from Auction  where BuyerAID = @BuyerAID and BuyerGID = @BuyerGID and ZoneServerID = @ZoneServerID
GO
/****** Object:  StoredProcedure [dbo].[GetClass]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetClass]
	@GDID		int
AS	
select Class from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetCharName]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCharName]
	@GID int
AS
	select charname from charinfo where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetCharInfoByGID]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCharInfoByGID] 
	@GID 	int
AS	select *  from charinfo where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetCharInfoByCharNum]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCharInfoByCharNum] 
	@GID 	int,
	@charnum	smallint
AS	select *  from charinfo where GID = @GID and charnum = @charnum
GO
/****** Object:  StoredProcedure [dbo].[GetCharInfo2]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCharInfo2]
	@AID	int
AS
	SET NOCOUNT ON
	SELECT 
		GID, 
		CharName, 
		job, 
		clevel, 
		sppoint, 
		exp, 
		jobpoint, 
		STR, 
		AGI, 
		VIT, 
		INT, 
		DEX, 
		LUK, 
		hp, 
		maxhp, 
		sp, 
		maxsp, 
		AID, 
		mapname, 
		xPos, 
		yPos, 
		GuildID, 
		CharNum, 
		speed, 
		money, 
		jobexp, 
		virtue, 
		honor, 
		haircolor, 
		joblevel, 
		bodystate, 
		healthstate, 
		sxPos, 
		syPos, 
		restartMapName, 
		effectstate, 
		head, 
		weapon, 
		accessory, 
		headpalette, 
		bodypalette, 
		accessory2, 
		accessory3, 
		shield, 
		isnull(robepalette, 0) as robepalette
	FROM charinfo WHERE  AID =  @AID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetCharInfo_renew]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCharInfo_renew]
	@AID	int
AS
	SET NOCOUNT ON
	SELECT 
		GID, --1
		CharName, --2
		job, --3
		clevel, --4
		sppoint, --5
		exp, --6
		jobpoint,  --7
		STR, --8
		AGI, --9
		VIT,  --10
		INT, --11
		DEX, --12
		LUK, --13
		hp, --14
		maxhp, --15
		sp, --16
		maxsp, --17
		AID, --18
		mapname, --19
		xPos, --20
		yPos, --21
		GuildID, --22
		CharNum, --23
		speed, --24
		money, --25
		jobexp, --26
		virtue, --27
		honor, --28
		haircolor, --29
		joblevel, --30
		bodystate, --31
		healthstate, --32
		sxPos, --33
		syPos, --34
		restartMapName, --35
		effectstate, --36
		head, --37
		weapon, --38
		accessory, --39
		headpalette, --40
		bodypalette, --41
		accessory2, --42
		accessory3, --45
		shield, --44
		bisChangedCharName, --45
		isnull(robepalette, 0) as robepalette --46
	FROM charinfo WHERE  AID =  @AID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetCharInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCharInfo] 
	@AID 	int
AS	select *  from charinfo where AID = @AID
GO
/****** Object:  StoredProcedure [dbo].[GetItemInBody]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetItemInBody] 
	@GID 	int
AS	select equipItem from item where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetItemCart]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetItemCart] 
	@GID 	int
AS	select cartItem  from cartitem where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetHonor]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetHonor]
	@GDID		int
AS	
select Honor  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetHomunInfo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 호문관련 프로시져 수정

CREATE PROC [dbo].[GetHomunInfo]
	@GID	INT
AS

	SET NOCOUNT ON

	SELECT	HomunID,--1
			GID,--2
			[Name],--3
			Modified,--4
			[Level],--5
			job,--6
			[exp],--7
			SKPoint,--8
			hp,--9
			maxhp,--10
			sp,--11
			maxsp,--12
			accessory,--13
			[Str],--14
			Agi,--15
			Vit,--16
			[Int],--17
			Dex,--18
			Luk,--19
			bodyState,--20
			healthState,--21
			effectState,--22
			[property],--23
			Fullness,--24
			Relation--25
			FROM HomunInfo WHERE GID = @GID

	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetGuildSkill]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildSkill] 
	@GDID 	int
AS	select Skill, Point from GuildSkill where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildRelation]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildRelation]
	@GDID		int
AS	
select Relation from GuildAllyInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildOpponentID]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildOpponentID]
	@GDID		int
AS	
select OpponentGDID from GuildAllyInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildNoticeDB]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildNoticeDB]
	@GDID		int
AS	
select * from GuildNotice where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildNotice]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildNotice]
	@GDID		int
AS	
select Notice from GuildNotice where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildName]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildName]
	@GDID		int
AS	
select Name  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMPositionDB]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGuildMPositionDB]
	@GDID		int
AS	
select * from GuildMPosition where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMName]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMName]
	@GDID		int
AS	
select MName  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMInfoDB]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMInfoDB]
	@GDID		int
AS	
select * from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMemberService]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMemberService]
	@GDID		int
AS	
select Service from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMemberPositionID]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMemberPositionID]
	@GDID		int
AS	
select PositionID from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMemberMemo]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMemberMemo]
	@GDID		int
AS	
select Memo from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMemberLevel]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMemberLevel]
	@GDID		int
AS	
select [Level] from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMemberGID]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMemberGID]
	@GDID		int
AS	
select GID from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMemberExp]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMemberExp]
	@GDID		int
AS	
select MemberExp from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMemberClass]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMemberClass]
	@GDID		int
AS	
select Class from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMemberCharName]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMemberCharName]
	@GDID		int
AS	
select CharName from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildMemberAID]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildMemberAID]
	@GDID		int
AS	
select AID from GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildList]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildList] 
AS	
select Name, MName, [Level]  from GuildInfoDB
GO
/****** Object:  StoredProcedure [dbo].[GetGuildInfoDB]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildInfoDB]
	@GDID		int
AS	
select * from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildIDByGID]    Script Date: 02/16/2018 13:52:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildIDByGID] 
	@GID		int
AS	
select GDID from GuildMInfo where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildID] 
	@name		varchar(24)
AS	
select GDID from GuildInfoDB where Name=@name
GO
/****** Object:  StoredProcedure [dbo].[GetGuildEmblem]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGuildEmblem]
	@GDID		int
AS	
select EmblemVersion  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildDesc]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildDesc]
	@GDID		int
AS	
select [Desc]  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildBReason]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildBReason]
	@GDID		int
AS	
select Reason from GuildBanishInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildBMemberName]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildBMemberName]
	@GDID		int
AS	
select MemberName from GuildBanishInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildBMemberAccount]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildBMemberAccount]
	@GDID		int
AS	
select MemberAccount from GuildBanishInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildBGID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildBGID]
	@GDID		int
AS	
select GID from GuildBanishInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildBanishInfoDB]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildBanishInfoDB]
	@GDID		int
AS	
select * from GuildBanishInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildBAID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildBAID]
	@GDID		int
AS	
select AID from GuildBanishInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildAllyInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildAllyInfo]
	@GDID		int
AS	
select * from GuildAllyInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetGuildAgitDB]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGuildAgitDB]
AS	
select GDID from Agit
GO
/****** Object:  StoredProcedure [dbo].[GetGroupSize]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGroupSize] 
	@GRID 	int
AS	select  count(*)  from GroupMInfo where GRID = @GRID
GO
/****** Object:  StoredProcedure [dbo].[GetGroupName]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupName] 
	@GRID		int
AS	
select groupName from GroupInfo where GRID=@GRID
GO
/****** Object:  StoredProcedure [dbo].[GetGroupMembers]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupMembers] 
	@GRID		int
AS	
select GID, AID, CharName, GRID, Role  from GroupMInfo where GRID=@GRID
GO
/****** Object:  StoredProcedure [dbo].[GetGroupInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGroupInfo] 
	@GRID		int
AS	
select groupName, GroupOption from GroupInfo where GRID=@GRID
GO
/****** Object:  StoredProcedure [dbo].[GetGroupID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGroupID] 
	@name		varchar(24)
AS	
select GRID from GroupInfo where groupName=@name
GO
/****** Object:  StoredProcedure [dbo].[GetGlobalVar]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGlobalVar]
	@VarName varchar(24),
	@VarValue int OUTPUT
 AS
	SELECT @VarValue = VarValue   FROM GlobalVar WHERE VarName = @VarName  
	IF @@ROWCOUNT = 1
		RETURN 1
	ELSE
		RETURN 0

/*
	IF NOT EXISTS (SELECT * FROM GlobalVar WHERE VarName = @VarName)
		RETURN 0
	ELSE
		SELECT @VarValue = VarValue   FROM GlobalVar WHERE VarName = @VarName  
	RETURN  1
*/
GO
/****** Object:  StoredProcedure [dbo].[GetGlobalStr]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGlobalStr] 
@StrName	VARCHAR(24)
AS

SELECT StrValue FROM GlobalStr WHERE StrName = @StrName
GO
/****** Object:  StoredProcedure [dbo].[GetGDIDByGID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGDIDByGID]
	@GID		int
AS	
select GDID  from GuildMInfo where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[GetGDID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGDID] 
	@name		varchar(24)
AS	
select GDID from GuildInfoDB where Name=@name
GO
/****** Object:  StoredProcedure [dbo].[GetFriends]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFriends]
@GID	INT

AS

SELECT [data]  FROM Friends WHERE GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GetFamilyByMother]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFamilyByMother]
	@motherGID	int
AS
SET NOCOUNT ON
	
	SELECT * 
	FROM Family  
	WHERE motherGID = @motherGID
GO
/****** Object:  StoredProcedure [dbo].[GetFamilyByFather]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFamilyByFather]
	@fatherGID	int
AS
SET NOCOUNT ON
	
	SELECT * 
	FROM Family  
	WHERE fatherGID = @fatherGID
GO
/****** Object:  StoredProcedure [dbo].[GetFamilyByBaby]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFamilyByBaby]
	@babyGID	int
AS
SET NOCOUNT ON
	
	SELECT * 
	FROM Family  
	WHERE babyGID = @babyGID
GO
/****** Object:  StoredProcedure [dbo].[GetFamily]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFamily]
	@Index		int
AS	
select * from Family  where [Index] = @Index
GO
/****** Object:  StoredProcedure [dbo].[GetExp]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetExp]
	@GDID		int
AS	
select Exp  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetEffectiveInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetEffectiveInfo] 
	@GID 	int
AS	select info from EffectiveInfo where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[GM_skill_View]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[GM_skill_View]
@GID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT A.ID, A.Level, B.NAME 
	FROM Character.dbo.Skill_Rebuild A INNER JOIN
	script.dbo.SkillInfo B ON A.ID = B.ID
	WHERE A.GID = @GID AND A.[ID] NOT IN (10100,10101)
END
GO
/****** Object:  StoredProcedure [dbo].[GM_skill_Update]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_skill_Update]
@GID AS INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION

	UPDATE dbo.skill SET skillinfo = NULL WHERE GID = @GID

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION RETURN END

	COMMIT TRANSACTION
END
GO
/****** Object:  StoredProcedure [dbo].[GM_skill_Rebuild_Update]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GM_skill_Rebuild_Update]
@GID AS INT,
@IT_ID AS INT,
@IT_SkillLevel AS INT,
@sppoint AS INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRAN

	UPDATE dbo.skill_rebuild SET [Level] = @IT_SkillLevel WHERE GID = @GID AND [ID] = @IT_ID

	UPDATE dbo.charinfo SET sppoint = @sppoint WHERE GID = @GID

	IF @@ERROR > 0 BEGIN ROLLBACK TRAN SELECT 1 AS ErrNo RETURN END

	COMMIT TRAN
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_skill_Rebuild_Init]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GM_skill_Rebuild_Init]
@JOB AS INT,
@GID AS INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION 

	DELETE FROM skill_rebuild WHERE GID = @GID

	IF (@JOB > 6 AND @JOB < 21) OR (@JOB > 4007 AND @JOB < 4022) OR (@JOB > 4029 AND @JOB < 4050)
	BEGIN 
		INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10100','0','0','0','50')
	END 
	ELSE IF (@JOB > 4053 AND @JOB < 4060) OR (@JOB > 4065 AND @JOB < 4073) OR (@JOB > 4095 AND @JOB < 4109)
	BEGIN 
		INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10100','0','0','0','50')
		INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10101','0','0','0','50')
	END 
	ELSE IF (@JOB > 4059 AND @JOB < 4066) OR (@JOB > 4072 AND @JOB < 4080)
	BEGIN 
		INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10100','0','0','0','50')
		INSERT INTO skill_rebuild (GID, [ID], [Level], RemainMS, Attr, Data) VALUES (@GID,'10101','0','0','0','70')
	END 

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION RETURN END

	COMMIT TRANSACTION
END
GO
/****** Object:  StoredProcedure [dbo].[GM_Pet_View]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_Pet_View]
@PETID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT * FROM dbo.Pet WHERE PETID = @PETID
END
GO
/****** Object:  StoredProcedure [dbo].[GM_GuildMinfo_View]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GuildMinfo_View]
@GID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT * FROM dbo.GuildMinfo WHERE GID = @GID
END
GO
/****** Object:  StoredProcedure [dbo].[GM_GuildMInfo_List]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GuildMInfo_List]
@GDID AS INT
AS
BEGIN
	SELECT
		member.GID,
		member.CharName,
		member.AccountName,
		member.[Level],
		member.Class,
		member.Memo,
		member.Service,
		member.MemberExp,
		member.GDID,
		member.AID,
		member.PositionID,
		guild.[Name] AS GuildName,
		(SELECT
			PosName
		FROM
			dbo.GuildMPosition AS pos
		WHERE
			pos.GDID = member.GDID AND pos.Grade = member.PositionID
		) AS PosName
	FROM
		dbo.GuildMInfo AS member
		LEFT JOIN dbo.GuildInfoDB AS guild ON guild.GDID = member.GDID
	WHERE
		member.GDID = @GDID
	ORDER BY
		PositionID
END
GO
/****** Object:  StoredProcedure [dbo].[GM_GuildMInfo_Delete]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GuildMInfo_Delete]
@GID AS VARCHAR(1000)
AS
BEGIN
	BEGIN TRANSACTION

	DELETE FROM dbo.GuildMInfo WHERE GID IN (@GID)

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_GuildInfoDB_View]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GuildInfoDB_View]
@GDID AS INT
AS
BEGIN
	SELECT * FROM dbo.GuildInfoDB WHERE GDID = @GDID
END
GO
/****** Object:  StoredProcedure [dbo].[GM_GuildInfoDB_Update]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GuildInfoDB_Update]
@txtGuildID AS INT,
@txtOldMaster AS INT,
@txtGuildMaster AS INT,
@txtGuildLevel AS INT,
@txtGuildName AS VARCHAR(24),
@txtMaxUserNum AS INT,
@txtGuildExp AS INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @OldMasterSwappedPos AS INT
	DECLARE @NewMasterName AS VARCHAR(50)

	SET @OldMasterSwappedPos = (
		SELECT
			PositionID
		FROM
			dbo.GuildMInfo
		WHERE
			GDID = @txtGuildID
			AND GID = @txtGuildMaster
	)

	SET @NewMasterName = (
		SELECT
			CharName
		FROM
			dbo.GuildMInfo
		WHERE
			GDID = @txtGuildID
			AND GID = @txtGuildMaster
	)

	BEGIN TRANSACTION

	UPDATE dbo.GuildInfoDB SET
		[Level] = @txtGuildLevel,
		[Name] = @txtGuildName,
		MName = @NewMasterName,
		MaxUserNum = @txtMaxUserNum,
		[EXP] = @txtGuildExp
	WHERE
		GDID = @txtGuildID

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 1 AS ErrNo RETURN END

	UPDATE dbo.GuildMInfo SET PositionID = 0 WHERE GID = @txtGuildMaster

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 1 AS ErrNo RETURN END

	UPDATE dbo.GuildMInfo SET PositionID = @OldMasterSwappedPos WHERE GID = @txtOldMaster

	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 1 AS ErrNo RETURN END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo

END
GO
/****** Object:  StoredProcedure [dbo].[GM_GuildInfoDB_Search]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GuildInfoDB_Search]
@txtGuildName AS VARCHAR(24)
AS
BEGIN
	SELECT * FROM dbo.GuildInfoDB WHERE [Name] LIKE '%'+@txtGuildName+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[GM_GuildInfoDB_MemberCount]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GuildInfoDB_MemberCount]
@MemberCount AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		*
	FROM
		dbo.GuildInfoDB
	WHERE
		GDID IN (
			SELECT
				GDID
			FROM
				dbo.GuildMInfo
			GROUP BY
				GDID
			HAVING
				COUNT(*) = @MemberCount
		)
END
GO
/****** Object:  StoredProcedure [dbo].[GM_GuildInfoDB_GuildLevel]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GuildInfoDB_GuildLevel]
@Guild_Level AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT * FROM dbo.GuildInfoDB WHERE [Level] = @Guild_Level
END
GO
/****** Object:  StoredProcedure [dbo].[GM_GuildAllyInfo_View]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GuildAllyInfo_View]
@GDID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT * FROM dbo.GuildAllyInfo WHERE GDID = @GDID
END
GO
/****** Object:  StoredProcedure [dbo].[GM_Guild_Search]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_Guild_Search]
@txtGuildName AS VARCHAR(24)=NULL,
@txtCharName AS VARCHAR(24)=NULL,
@GDID AS INT=NULL
AS
BEGIN
	SET NOCOUNT ON

	IF @txtGuildName <> '' AND @txtCharName <> ''
	BEGIN
		SELECT guild.GDID FROM dbo.GuildInfoDB AS guild LEFT JOIN dbo.GuildMInfo AS guildm
		ON guildm.GDID = guild.GDID WHERE guildm.CharName = @txtCharName AND guild.[Name] = @txtGuildName
	END

	IF @txtGuildName <> '' AND @txtCharName = ''
	BEGIN
		SELECT GDID FROM dbo.GuildInfoDB WHERE [Name] = @txtGuildName
	END

	IF @txtGuildName = '' AND @txtCharName <> ''
	BEGIN
		SELECT GDID FROM dbo.GuildMInfo WHERE CharName = @txtCharName
	END

	IF @txtGuildName = '' AND @txtCharName = '' AND @GDID <> ''
	BEGIN
		SELECT GDID FROM dbo.GuildInfoDB WHERE GDID = @GDID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GM_Guild_MemberList]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GM_Guild_MemberList]
@GDID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		member.GID,
		member.CharName,
		member.AccountName,
		member.[Level],
		member.Class,
		member.Memo,
		member.Service,
		member.MemberExp,
		member.GDID,
		member.AID,
		member.PositionID,
		guild.[Name] AS GuildName,
		ISNULL((
			SELECT
				PosName
			FROM
				dbo.GuildMPosition AS pos
			WHERE
				pos.GDID = member.GDID
				AND pos.grade = member.PositionID), '') AS PosName
	FROM
		dbo.GuildMInfo AS member
		LEFT JOIN dbo.GuildInfoDB AS guild ON guild.GDID = member.GDID
	WHERE
		member.GDID = @GDID
	ORDER BY
		PositionID
END
GO
/****** Object:  StoredProcedure [dbo].[GM_Guild_Delete]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_Guild_Delete]
@GDID AS INT
AS
BEGIN
	BEGIN TRANSACTION

	DELETE FROM dbo.GuildInfoDB WHERE GDID = @GDID
	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	DELETE FROM dbo.GuildAllyInfo WHERE GDID = @GDID OR OpponentGDID = @GDID
	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	DELETE FROM dbo.GuildBanishInfo WHERE GDID = @GDID
	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	DELETE FROM dbo.GuildMInfo WHERE GDID = @GDID
	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	DELETE FROM dbo.GuildMPosition WHERE GDID = @GDID
	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	DELETE FROM dbo.GuildNotice WHERE GDID = @GDID
	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	DELETE FROM dbo.GuildSkill WHERE GDID = @GDID
	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	UPDATE dbo.Agit SET GDID = NULL WHERE GDID = @GDID
	IF @@ERROR > 0 BEGIN ROLLBACK TRANSACTION SELECT 2 AS ErrNo RETURN END

	COMMIT TRANSACTION
	SELECT 0 AS ErrNo
END
GO
/****** Object:  StoredProcedure [dbo].[GM_GroupMInfo_View]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GroupMInfo_View]
@GID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT * FROM dbo.GroupMinfo WHERE GID = @GID
END
GO
/****** Object:  StoredProcedure [dbo].[GetCharacterID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCharacterID] 
	@Name 	char(24)
AS	select AID, GID  from charinfo where CharName = @Name
GO
/****** Object:  StoredProcedure [dbo].[GetBuyerAuctionID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetBuyerAuctionID]
	@ZoneServerID	int,
	@BuyerAID	int,
	@BuyerGID	int

AS	
select AuctionID from Auction  where BuyerAID = @BuyerAID and BuyerGID = @BuyerGID and ZoneServerID = @ZoneServerID
GO
/****** Object:  StoredProcedure [dbo].[GetBattleFieldInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBattleFieldInfo] 
 @gid int
AS
 select Camp, x, y from BattleFieldInfo Where GID = @gid
GO
/****** Object:  StoredProcedure [dbo].[GetAuction]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAuction] 
	@ZoneServerID	int,
	@ItemType	int
AS	
select * from Auction where ZoneServerID=@ZoneServerID and ItemType = @ItemType
GO
/****** Object:  StoredProcedure [dbo].[GetArenaWin]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArenaWin]
	@GDID		int
AS	
select ArenaWin  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetArenaLose]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArenaLose]
	@GDID		int
AS	
select ArenaLose  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetArenaDrawn]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArenaDrawn]
	@GDID		int
AS	
select ArenaDrawn  from GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[GetAllPartyBooking]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
	2. 파티부킹 리스트 불러오기
		- 존서버의 부팅시 실행 서비스 온라인 실행 없음
		- Charinfo와의 Inner조인은 Nested Loop join발생함으로 S-Lock방지를 위한 NOLOCK설정
*/
CREATE PROCEDURE [dbo].[GetAllPartyBooking] 	
AS
SET NOCOUNT ON
	DELETE PartyBooking WHERE ExpireTime < DATEADD(HOUR, -3, GETDATE())

	SELECT [Index], PartyBooking.GID, CharName, MapID, [Level], Job1, Job2, Job3, Job4, Job5, Job6, ExpireTime
	FROM PartyBooking WITH(NOLOCK) INNER JOIN CharInfo ON CharInfo.GID = PartyBooking.GID	 
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetAllGIDs]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--GetAllGIDs
CREATE PROCEDURE [dbo].[GetAllGIDs] 
	@AID 	int
AS	select GID  from charinfo where AID = @AID
GO
/****** Object:  StoredProcedure [dbo].[GetAgit2]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAgit2] 
AS	
select mapName, agitName, GDID, economy, defense, triggerE, triggerD, nextTime, payTime, createTime,
       visibleC, 
       visibleG0,visibleG1, visibleG2, visibleG3, visibleG4, visibleG5, visibleG6, visibleG7
from Agit
GO
/****** Object:  StoredProcedure [dbo].[GetAgit]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAgit] 
    @mapName	varchar(16)
AS	
select agitName, GDID, economy, defense, triggerE, triggerD, nextTime, payTime, createTime,
       visibleC, 
       visibleG0,visibleG1, visibleG2, visibleG3, visibleG4, visibleG5, visibleG6, visibleG7
from Agit  
where mapName=@mapName
GO
/****** Object:  StoredProcedure [dbo].[DeleteCouple2ByFemale]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteCouple2ByFemale] 
	@femaleGID	     int
AS
delete CoupleInfo2 where femaleGID = @femaleGID
GO
/****** Object:  StoredProcedure [dbo].[DeleteCouple2]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteCouple2] 
	@maleGID	int
AS
delete CoupleInfo2 where maleGID = @maleGID
GO
/****** Object:  StoredProcedure [dbo].[DeleteCharInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCharInfo]
	@GID INT
AS
	SET XACT_ABORT ON
	BEGIN TRAN
		DELETE charinfo where gid = @GID
		DELETE item where gid = @GID
		DELETE skill where gid = @GID
		DELETE cartitem where gid = @GID
		DELETE warpinfo where gid = @GID
		DELETE PvPScore where gid = @GID
		DELETE EffectiveInfo where gid = @gid
		DELETE Friends where gid = @gid
		DELETE QuestEvent where gid = @gid
		DELETE ShortCutKeyDB where gid = @gid
		DELETE StateInfo where gid = @gid
		DELETE Skill_Rebuild WHERE gid=@GID -- 스킬정보 삭제
		DELETE effect_Rebuild WHERE gid=@GID -- 효과정보 삭제
	COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[DeleteCart]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteCart] 
	@GID		int
AS	
delete cartitem where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteAuction]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAuction] 
	@AuctionID		int
AS
delete Auction where AuctionID=@AuctionID
GO
/****** Object:  StoredProcedure [dbo].[DeletePet]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePet]
	@PETID		int
AS
delete Pet Where PETID=@PETID
GO
/****** Object:  StoredProcedure [dbo].[DeletePartyBooking]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*	
	4. 파티부킹 데이터 삭제
*/
CREATE PROCEDURE [dbo].[DeletePartyBooking]
	@GID		INT
AS
SET NOCOUNT ON
	DELETE PartyBooking WHERE GID = @GID
SET NOCOUNT ON
GO
/****** Object:  StoredProcedure [dbo].[DeleteMemberByName]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMemberByName] 
	@name		varchar(24)
AS	
delete GroupMInfo where CharName=@name
GO
/****** Object:  StoredProcedure [dbo].[DeleteMember]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMember] 
	@GID		int
AS	
delete GroupMInfo where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteMannerPoint]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteMannerPoint] 
	@AID		int
,	@OtherGID	int
AS
delete MannerPoint where AID=@AID and otherGID=@OtherGID
GO
/****** Object:  StoredProcedure [dbo].[DeleteMailItem]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteMailItem]
	@MailID		int
AS
update Mail with (rowlock) set Money = 0, ItemLen = 0 where MailID = @MailID
GO
/****** Object:  StoredProcedure [dbo].[DeleteMail]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMail] 
           	@MailID         int
AS
delete Mail where MailID = @MailID
GO
/****** Object:  StoredProcedure [dbo].[DeleteItem]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteItem] 
	@GID		int
AS	
delete item where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteHomunInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteHomunInfo]
	@GID		int
AS
delete HomunInfo Where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildSkill]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteGuildSkill] 
	@GDID		int
AS	
delete GuildSkill where GDID = @GDID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildNotice]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGuildNotice] 
	@GDID		int
AS
delete GuildNotice where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildMPosition]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGuildMPosition] 
	@GDID		int
AS
delete GuildMPosition where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildMInfoByName]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGuildMInfoByName] 
	@name		varchar(24)
AS
delete GuildMInfo where CharName=@name
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildMInfoByGDID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGuildMInfoByGDID] 
	@GDID		int
AS
delete GuildMInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildMInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGuildMInfo] 
	@GID		int
AS
delete GuildMInfo where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildByName]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGuildByName] 
	@name		varchar(24)
AS
delete GuildInfoDB where Name=@name
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildBanishInfoByName]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGuildBanishInfoByName] 
	@name		varchar(24)
AS
delete GuildBanishInfo where MemberName=@name
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildBanishInfoByGID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteGuildBanishInfoByGID] 
	@GDID		int
,	@GID		int
AS
delete GuildBanishInfo where GDID=@GDID and GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildBanishInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGuildBanishInfo] 
	@GDID		int
AS
delete GuildBanishInfo where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildAllyInfo2]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGuildAllyInfo2] 
	@GDID		int
,	@OpponentGDID int
,	@Relation	int
AS
delete GuildAllyInfo where OpponentGDID=@OpponentGDID and GDID=@GDID and Relation=@Relation
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuildAllyInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteGuildAllyInfo] 
	@GDID		int
AS
delete GuildAllyInfo where OpponentGDID=@GDID or GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuild]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteGuild] 
	@GDID		int
AS
delete GuildInfoDB where GDID=@GDID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGroupByName]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGroupByName] 
	@name		varchar(24)
AS
delete GroupInfo where GroupName=@name
GO
/****** Object:  StoredProcedure [dbo].[DeleteGroup]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGroup] 
	@GRID		int
AS
delete GroupInfo where GRID=@GRID
GO
/****** Object:  StoredProcedure [dbo].[DeleteFriends]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteFriends] 
	@GID		int
AS	
delete Friends where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteFamily]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteFamily]
	@fatherGID	int
AS
SET NOCOUNT ON

	delete Family  
	WHERE fatherGID = @fatherGID
GO
/****** Object:  StoredProcedure [dbo].[DeleteWarpInfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteWarpInfo] 
	@GID		int
AS	
delete warpInfo where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteSkill_HO]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteSkill_HO] 
	@GID		int
AS	
delete Skill_Homun where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[DeleteSkill]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSkill] 
	@GID		int
AS	
delete Skill where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[AddSkill]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AddSkill]
	@GID		int
,	@nADD	int
AS
update charinfo with (rowlock) set sppoint = sppoint + @nADD where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[AddHomunLog]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_update_PetGID]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[usp_update_PetGID]
	@PETID		int,
	@GID		int
AS

SET NOCOUNT ON

UPDATE Pet
SET GID = @GID
WHERE PETID = @PETID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_update_pet]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_update_pet]
	@PETID		int,
	@Name		varchar(24),
	@Modified	int,
	@SpriteType	int,
	@Lv		int,
	@Fullness	int,
	@Relation	int,
	@Accessary	int,
	@GID		int
AS

SET NOCOUNT ON

UPDATE Pet
SET [Name] = @Name,
	Modified = @Modified,
	SpriteType = @SpriteType,
	Lv = @Lv,
	Fullness = @Fullness,
	Relation = @Relation,
	Accessary = @Accessary,
	GID = @GID
WHERE PetID = @PETID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_update_charinfo8]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_update_charinfo8]
	@job			SMALLINT,--1
	@clevel			SMALLINT,--2
	@sppoint		SMALLINT,--3
	@exp			INT,--4
	@jobpoint		SMALLINT,--5
	@STR			TINYINT,--6
	@AGI			TINYINT,--7
	@VIT			TINYINT,--8
	@INT			TINYINT,--9
	@DEX			TINYINT,--10
	@LUK			TINYINT,--11
	@hp				INT,--12
	@maxhp			SMALLINT,--13
	@sp				SMALLINT,--14
	@maxsp			SMALLINT,--15
	@mapname		VARCHAR(16),--16
	@xPos			SMALLINT,--17
	@yPos			SMALLINT,--18
	@speed			SMALLINT,--19
	@money			INT,--20
	@jobexp			INT,--21
	@virtue			SMALLINT,--22
	@honor			SMALLINT,--23
	@haircolor		TINYINT,--24
	@joblevel		INT,--25
	@bodystate		INT,--26
	@healthstate	INT,--27
	@GID			INT,--28
	@sxPos			SMALLINT,--29
	@syPos			SMALLINT,--30
	@restartMapName	VARCHAR(16),--31
	@effectstate	INT,--32
	@head			SMALLINT,--33
	@weapon			SMALLINT,--34
	@accessory		SMALLINT,--35
	@headpalette	SMALLINT,--36
	@bodypalette	SMALLINT,--37
	@accessory2		SMALLINT,--38
	@accessory3		SMALLINT,--39
	@shield			SMALLINT,--40
 	@charname       VARCHAR(24),--41
	@party_config	TINYINT,--42
	@equipwinopen   TINYINT,--43
	@font			SMALLINT,--44
	@checksum	varbinary(4),--45
	@robepalette    SMALLINT, --46
	@chr_slot_change	SMALLINT, --47
	@chr_name_changeCNT	SMALLINT --48
AS

	SET NOCOUNT ON


	UPDATE charinfo SET 
				job = @job, 
			    clevel = @clevel, 
			    sppoint = @sppoint, 
			    [exp] = @exp, 
			    jobpoint = @jobpoint, 
			    STR = @STR, 
			    AGI = @AGI, 
			    VIT = @VIT, 
			    [INT] = @INT, 
			    DEX = @DEX, 
	 		    LUK = @LUK, 
			    hp = @hp, 
			    maxhp = @maxhp, 
			    sp = @sp, 
			    maxsp = @maxsp, 
			    mapname = @mapname, 
			    xPos = @xPos, 
			    yPos = @yPos, 
			    speed = @speed, 
			    money = @money,  
			    jobexp = @jobexp, 
			    virtue = @virtue, 
			    honor = @honor, 
			    haircolor = @haircolor, 
			    joblevel = @joblevel, 
			    bodystate = @bodystate,
			    healthstate = @healthstate,  
			    sxPos = @sxPos, 
			    syPos = @syPos, 
			    restartMapName = @restartMapName, 
			    effectstate = @effectstate, 
			    head = @head, 
				weapon = @weapon, 
			    accessory = @accessory, 
			    headPalette = @headpalette, 
			    bodyPalette = @bodypalette,
			    accessory2 = @accessory2, 
			    accessory3 = @accessory3, 
			    Shield = @shield,
			    party_config = @party_config,
			    equipwinopen = @equipwinopen,
			    font = @font,
			   checksum = @checksum,
			   robepalette = @robepalette,
			   chr_slot_change = @chr_slot_change,
			   chr_name_changeCNT = @chr_name_changeCNT
			   
			WHERE GID = @GID AND CharName = @charname
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_update_charinfo6]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_update_charinfo6]
	@job			SMALLINT,--1
	@clevel			SMALLINT,--2
	@sppoint		SMALLINT,--3
	@exp			INT,--4
	@jobpoint		SMALLINT,--5
	@STR			TINYINT,--6
	@AGI			TINYINT,--7
	@VIT			TINYINT,--8
	@INT			TINYINT,--9
	@DEX			TINYINT,--10
	@LUK			TINYINT,--11
	@hp				INT,--12
	@maxhp			SMALLINT,--13
	@sp				SMALLINT,--14
	@maxsp			SMALLINT,--15
	@mapname		VARCHAR(16),--16
	@xPos			SMALLINT,--17
	@yPos			SMALLINT,--18
	@speed			SMALLINT,--19
	@money			INT,--20
	@jobexp			INT,--21
	@virtue			SMALLINT,--22
	@honor			SMALLINT,--23
	@haircolor		TINYINT,--24
	@joblevel		INT,--25
	@bodystate		INT,--26
	@healthstate	INT,--27
	@GID			INT,--28
	@sxPos			SMALLINT,--29
	@syPos			SMALLINT,--30
	@restartMapName	VARCHAR(16),--31
	@effectstate	INT,--32
	@head			SMALLINT,--33
	@weapon			SMALLINT,--34
	@accessory		SMALLINT,--35
	@headpalette	SMALLINT,--36
	@bodypalette	SMALLINT,--37
	@accessory2		SMALLINT,--38
	@accessory3		SMALLINT,--39
	@shield			SMALLINT,--40
 	@charname       VARCHAR(24),--41
	@party_config	TINYINT,--42
	@equipwinopen   TINYINT,--43
	@font			SMALLINT,--44
	@checksum	varbinary(4),--45
	@robepalette    SMALLINT --46
AS

	SET NOCOUNT ON


	UPDATE charinfo SET 
				job = @job, 
			    clevel = @clevel, 
			    sppoint = @sppoint, 
			    [exp] = @exp, 
			    jobpoint = @jobpoint, 
			    STR = @STR, 
			    AGI = @AGI, 
			    VIT = @VIT, 
			    [INT] = @INT, 
			    DEX = @DEX, 
	 		    LUK = @LUK, 
			    hp = @hp, 
			    maxhp = @maxhp, 
			    sp = @sp, 
			    maxsp = @maxsp, 
			    mapname = @mapname, 
			    xPos = @xPos, 
			    yPos = @yPos, 
			    speed = @speed, 
			    money = @money,  
			    jobexp = @jobexp, 
			    virtue = @virtue, 
			    honor = @honor, 
			    haircolor = @haircolor, 
			    joblevel = @joblevel, 
			    bodystate = @bodystate,
			    healthstate = @healthstate,  
			    sxPos = @sxPos, 
			    syPos = @syPos, 
			    restartMapName = @restartMapName, 
			    effectstate = @effectstate, 
			    head = @head, 
				weapon = @weapon, 
			    accessory = @accessory, 
			    headPalette = @headpalette, 
			    bodyPalette = @bodypalette,
			    accessory2 = @accessory2, 
			    accessory3 = @accessory3, 
			    Shield = @shield,
			    party_config = @party_config,
			    equipwinopen = @equipwinopen,
			    font = @font,
			   checksum = @checksum,
			   robepalette = @robepalette
			   
			WHERE GID = @GID AND CharName = @charname
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_update_charinfo5]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_update_charinfo5]
	@job			SMALLINT,--1
	@clevel			SMALLINT,--2
	@sppoint		SMALLINT,--3
	@exp			INT,--4
	@jobpoint		SMALLINT,--5
	@STR			TINYINT,--6
	@AGI			TINYINT,--7
	@VIT			TINYINT,--8
	@INT			TINYINT,--9
	@DEX			TINYINT,--10
	@LUK			TINYINT,--11
	@hp				INT,--12,	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! usp_update_charinfo4에서 변경된 부분 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@maxhp			SMALLINT,--13
	@sp				SMALLINT,--14
	@maxsp			SMALLINT,--15
	@mapname		VARCHAR(16),--16
	@xPos			SMALLINT,--17
	@yPos			SMALLINT,--18
	@speed			SMALLINT,--19
	@money			INT,--20
	@jobexp			INT,--21
	@virtue			SMALLINT,--22
	@honor			SMALLINT,--23
	@haircolor		TINYINT,--24
	@joblevel		INT,--25
	@bodystate		INT,--26
	@healthstate	INT,--27
	@GID			INT,--28
	@sxPos			SMALLINT,--29
	@syPos			SMALLINT,--30
	@restartMapName	VARCHAR(16),--31
	@effectstate	INT,--32
	@head			SMALLINT,--33
	@weapon			SMALLINT,--34
	@accessory		SMALLINT,--35
	@headpalette	SMALLINT,--36
	@bodypalette	SMALLINT,--37
	@accessory2		SMALLINT,--38
	@accessory3		SMALLINT,--39
	@shield			SMALLINT,--40
 	@charname       VARCHAR(24),--41
	@party_config	TINYINT,--42
	@equipwinopen   TINYINT,--43
	@font			SMALLINT,--44
	@checksum		varbinary(4)--45
AS

	SET NOCOUNT ON


	UPDATE charinfo SET 
					job = @job, 
			    clevel = @clevel, 
			    sppoint = @sppoint, 
			    [exp] = @exp, 
			    jobpoint = @jobpoint, 
			    STR = @STR, 
			    AGI = @AGI, 
			    VIT = @VIT, 
			    [INT] = @INT, 
			    DEX = @DEX, 
	 		    LUK = @LUK, 
			    hp = @hp, 
			    maxhp = @maxhp, 
			    sp = @sp, 
			    maxsp = @maxsp, 
			    mapname = @mapname, 
			    xPos = @xPos, 
			    yPos = @yPos, 
			    speed = @speed, 
			    money = @money,  
			    jobexp = @jobexp, 
			    virtue = @virtue, 
			    honor = @honor, 
			    haircolor = @haircolor, 
			    joblevel = @joblevel, 
			    bodystate = @bodystate,
			    healthstate = @healthstate,  
			    sxPos = @sxPos, 
			    syPos = @syPos, 
			    restartMapName = @restartMapName, 
			    effectstate = @effectstate, 
			    head = @head, 
					weapon = @weapon, 
			    accessory = @accessory, 
			    headPalette = @headpalette, 
			    bodyPalette = @bodypalette,
			    accessory2 = @accessory2, 
			    accessory3 = @accessory3, 
			    Shield = @shield,
					party_config = @party_config,
					equipwinopen = @equipwinopen,
					font = @font,
					checksum=@checksum
			WHERE GID = @GID AND CharName = @charname
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_update_charinfo4]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_update_charinfo4]
	@job			SMALLINT,--1
	@clevel			SMALLINT,--2
	@sppoint		SMALLINT,--3
	@exp			INT,--4
	@jobpoint		SMALLINT,--5
	@STR			TINYINT,--6
	@AGI			TINYINT,--7
	@VIT			TINYINT,--8
	@INT			TINYINT,--9
	@DEX			TINYINT,--10
	@LUK			TINYINT,--11
	@hp				SMALLINT,--12
	@maxhp			SMALLINT,--13
	@sp				SMALLINT,--14
	@maxsp			SMALLINT,--15
	@mapname		VARCHAR(16),--16
	@xPos			SMALLINT,--17
	@yPos			SMALLINT,--18
	@speed			SMALLINT,--19
	@money			INT,--20
	@jobexp			INT,--21
	@virtue			SMALLINT,--22
	@honor			SMALLINT,--23
	@haircolor		TINYINT,--24
	@joblevel		INT,--25
	@bodystate		INT,--26
	@healthstate	INT,--27
	@GID			INT,--28
	@sxPos			SMALLINT,--29
	@syPos			SMALLINT,--30
	@restartMapName	VARCHAR(16),--31
	@effectstate	INT,--32
	@head			SMALLINT,--33
	@weapon			SMALLINT,--34
	@accessory		SMALLINT,--35
	@headpalette	SMALLINT,--36
	@bodypalette	SMALLINT,--37
	@accessory2		SMALLINT,--38
	@accessory3		SMALLINT,--39
	@shield			SMALLINT,--40
 	@charname       VARCHAR(24),--41
	@party_config	TINYINT,--42
	@equipwinopen   TINYINT,--43
	@font			SMALLINT,--44
	@checksum	varbinary(4)--45
AS

	SET NOCOUNT ON


	UPDATE charinfo SET 
				job = @job, 
			    clevel = @clevel, 
			    sppoint = @sppoint, 
			    [exp] = @exp, 
			    jobpoint = @jobpoint, 
			    STR = @STR, 
			    AGI = @AGI, 
			    VIT = @VIT, 
			    [INT] = @INT, 
			    DEX = @DEX, 
	 		    LUK = @LUK, 
			    hp = @hp, 
			    maxhp = @maxhp, 
			    sp = @sp, 
			    maxsp = @maxsp, 
			    mapname = @mapname, 
			    xPos = @xPos, 
			    yPos = @yPos, 
			    speed = @speed, 
			    money = @money,  
			    jobexp = @jobexp, 
			    virtue = @virtue, 
			    honor = @honor, 
			    haircolor = @haircolor, 
			    joblevel = @joblevel, 
			    bodystate = @bodystate,
			    healthstate = @healthstate,  
			    sxPos = @sxPos, 
			    syPos = @syPos, 
			    restartMapName = @restartMapName, 
			    effectstate = @effectstate, 
			    head = @head, 
				weapon = @weapon, 
			    accessory = @accessory, 
			    headPalette = @headpalette, 
			    bodyPalette = @bodypalette,
			    accessory2 = @accessory2, 
			    accessory3 = @accessory3, 
			    Shield = @shield,
			    party_config = @party_config,
			    equipwinopen = @equipwinopen,
			    font = @font,
			   checksum = @checksum
			WHERE GID = @GID AND CharName = @charname
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_update_charinfo3]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_update_charinfo3]
	@job			SMALLINT,--1
	@clevel			SMALLINT,--2
	@sppoint		SMALLINT,--3
	@exp			INT,--4
	@jobpoint		SMALLINT,--5
	@STR			TINYINT,--6
	@AGI			TINYINT,--7
	@VIT			TINYINT,--8
	@INT			TINYINT,--9
	@DEX			TINYINT,--10
	@LUK			TINYINT,--11
	@hp				SMALLINT,--12
	@maxhp			SMALLINT,--13
	@sp				SMALLINT,--14
	@maxsp			SMALLINT,--15
	@mapname		VARCHAR(16),--16
	@xPos			SMALLINT,--17
	@yPos			SMALLINT,--18
	@speed			SMALLINT,--19
	@money			INT,--20
	@jobexp			INT,--21
	@virtue			SMALLINT,--22
	@honor			SMALLINT,--23
	@haircolor		TINYINT,--24
	@joblevel		INT,--25
	@bodystate		INT,--26
	@healthstate	INT,--27
	@GID			INT,--28
	@sxPos			SMALLINT,--29
	@syPos			SMALLINT,--30
	@restartMapName	VARCHAR(16),--31
	@effectstate	INT,--32
	@head			SMALLINT,--33
	@weapon			SMALLINT,--34
	@accessory		SMALLINT,--35
	@headpalette	SMALLINT,--36
	@bodypalette	SMALLINT,--37
	@accessory2		SMALLINT,--38
	@accessory3		SMALLINT,--39
	@shield			SMALLINT,--40
 	@charname       VARCHAR(24),--41
	@party_config	TINYINT,--42
	@equipwinopen   TINYINT,--43
	@font			SMALLINT--44
AS

	SET NOCOUNT ON


	UPDATE charinfo SET 
				job = @job, 
			    clevel = @clevel, 
			    sppoint = @sppoint, 
			    [exp] = @exp, 
			    jobpoint = @jobpoint, 
			    STR = @STR, 
			    AGI = @AGI, 
			    VIT = @VIT, 
			    [INT] = @INT, 
			    DEX = @DEX, 
	 		    LUK = @LUK, 
			    hp = @hp, 
			    maxhp = @maxhp, 
			    sp = @sp, 
			    maxsp = @maxsp, 
			    mapname = @mapname, 
			    xPos = @xPos, 
			    yPos = @yPos, 
			    speed = @speed, 
			    money = @money,  
			    jobexp = @jobexp, 
			    virtue = @virtue, 
			    honor = @honor, 
			    haircolor = @haircolor, 
			    joblevel = @joblevel, 
			    bodystate = @bodystate,
			    healthstate = @healthstate,  
			    sxPos = @sxPos, 
			    syPos = @syPos, 
			    restartMapName = @restartMapName, 
			    effectstate = @effectstate, 
			    head = @head, 
				weapon = @weapon, 
			    accessory = @accessory, 
			    headPalette = @headpalette, 
			    bodyPalette = @bodypalette,
			    accessory2 = @accessory2, 
			    accessory3 = @accessory3, 
			    Shield = @shield,
				party_config = @party_config,
				equipwinopen = @equipwinopen,
				font = @font
			WHERE GID = @GID AND CharName = @charname
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_update_charinfo2]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_update_charinfo2]
	@job			SMALLINT,--1
	@clevel			SMALLINT,--2
	@sppoint		SMALLINT,--3
	@exp			INT,--4
	@jobpoint		SMALLINT,--5
	@STR			TINYINT,--6
	@AGI			TINYINT,--7
	@VIT			TINYINT,--8
	@INT			TINYINT,--9
	@DEX			TINYINT,--10
	@LUK			TINYINT,--11
	@hp				SMALLINT,--12
	@maxhp			SMALLINT,--13
	@sp				SMALLINT,--14
	@maxsp			SMALLINT,--15
	@mapname		VARCHAR(16),--16
	@xPos			SMALLINT,--17
	@yPos			SMALLINT,--18
	@speed			SMALLINT,--19
	@money			INT,--20
	@jobexp			INT,--21
	@virtue			SMALLINT,--22
	@honor			SMALLINT,--23
	@haircolor		TINYINT,--24
	@joblevel		INT,--25
	@bodystate		INT,--26
	@healthstate	INT,--27
	@GID			INT,--28
	@sxPos			SMALLINT,--29
	@syPos			SMALLINT,--30
	@restartMapName	VARCHAR(16),--31
	@effectstate	INT,--32
	@head			SMALLINT,--33
	@weapon			SMALLINT,--34
	@accessory		SMALLINT,--35
	@headpalette	SMALLINT,--36
	@bodypalette	SMALLINT,--37
	@accessory2		SMALLINT,--38
	@accessory3		SMALLINT,--39
	@shield			SMALLINT,--40
 	@charname       VARCHAR(24),--41
	@party_config	TINYINT,--42
	@equipwinopen   TINYINT --43
AS

	SET NOCOUNT ON


	UPDATE charinfo SET 
				job = @job, 
			    clevel = @clevel, 
			    sppoint = @sppoint, 
			    [exp] = @exp, 
			    jobpoint = @jobpoint, 
			    STR = @STR, 
			    AGI = @AGI, 
			    VIT = @VIT, 
			    [INT] = @INT, 
			    DEX = @DEX, 
	 		    LUK = @LUK, 
			    hp = @hp, 
			    maxhp = @maxhp, 
			    sp = @sp, 
			    maxsp = @maxsp, 
			    mapname = @mapname, 
			    xPos = @xPos, 
			    yPos = @yPos, 
			    speed = @speed, 
			    money = @money,  
			    jobexp = @jobexp, 
			    virtue = @virtue, 
			    honor = @honor, 
			    haircolor = @haircolor, 
			    joblevel = @joblevel, 
			    bodystate = @bodystate,
			    healthstate = @healthstate,  
			    sxPos = @sxPos, 
			    syPos = @syPos, 
			    restartMapName = @restartMapName, 
			    effectstate = @effectstate, 
			    head = @head, 
				weapon = @weapon, 
			    accessory = @accessory, 
			    headPalette = @headpalette, 
			    bodyPalette = @bodypalette,
			    accessory2 = @accessory2, 
			    accessory3 = @accessory3, 
			    Shield = @shield,
				party_config = @party_config,
				equipwinopen = @equipwinopen 
			WHERE GID = @GID AND CharName = @charname
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_update_charinfo]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_update_charinfo]
	@job			SMALLINT,--1
	@clevel			SMALLINT,--2
	@sppoint		SMALLINT,--3
	@exp			INT,--4
	@jobpoint		SMALLINT,--5
	@STR			TINYINT,--6
	@AGI			TINYINT,--7
	@VIT			TINYINT,--8
	@INT			TINYINT,--9
	@DEX			TINYINT,--10
	@LUK			TINYINT,--11
	@hp				SMALLINT,--12
	@maxhp			SMALLINT,--13
	@sp				SMALLINT,--14
	@maxsp			SMALLINT,--15
	@mapname		VARCHAR(16),--16
	@xPos			SMALLINT,--17
	@yPos			SMALLINT,--18
	@speed			SMALLINT,--19
	@money			INT,--20
	@jobexp			INT,--21
	@virtue			SMALLINT,--22
	@honor			SMALLINT,--23
	@haircolor		TINYINT,--24
	@joblevel		INT,--25
	@bodystate		INT,--26
	@healthstate	INT,--27
	@GID			INT,--28
	@sxPos			SMALLINT,--29
	@syPos			SMALLINT,--30
	@restartMapName	VARCHAR(16),--31
	@effectstate	INT,--32
	@head			SMALLINT,--33
	@weapon			SMALLINT,--34
	@accessory		SMALLINT,--35
	@headpalette	SMALLINT,--36
	@bodypalette	SMALLINT,--37
	@accessory2		SMALLINT,--38
	@accessory3		SMALLINT,--39
	@shield			SMALLINT,--40
 	@charname       VARCHAR(24),--41
	@party_config	TINYINT--42
AS

	SET NOCOUNT ON


	UPDATE charinfo SET 
				job = @job, 
			    clevel = @clevel, 
			    sppoint = @sppoint, 
			    [exp] = @exp, 
			    jobpoint = @jobpoint, 
			    STR = @STR, 
			    AGI = @AGI, 
			    VIT = @VIT, 
			    [INT] = @INT, 
			    DEX = @DEX, 
	 		    LUK = @LUK, 
			    hp = @hp, 
			    maxhp = @maxhp, 
			    sp = @sp, 
			    maxsp = @maxsp, 
			    mapname = @mapname, 
			    xPos = @xPos, 
			    yPos = @yPos, 
			    speed = @speed, 
			    money = @money,  
			    jobexp = @jobexp, 
			    virtue = @virtue, 
			    honor = @honor, 
			    haircolor = @haircolor, 
			    joblevel = @joblevel, 
			    bodystate = @bodystate,
			    healthstate = @healthstate,  
			    sxPos = @sxPos, 
			    syPos = @syPos, 
			    restartMapName = @restartMapName, 
			    effectstate = @effectstate, 
			    head = @head, 
				weapon = @weapon, 
			    accessory = @accessory, 
			    headPalette = @headpalette, 
			    bodyPalette = @bodypalette,
			    accessory2 = @accessory2, 
			    accessory3 = @accessory3, 
			    Shield = @shield,
				party_config = @party_config  
			WHERE GID = @GID AND CharName = @charname
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Skill_Rebuild_update]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_Skill_Rebuild_update]
	@GID	  INT,
	@ID		  INT,
	@Level	  INT,
	@RemainMS INT,
	@Attr	  INT,
	@Data	  INT
AS
	SET NOCOUNT ON
	UPDATE Skill_Rebuild SET Level=@Level,RemainMS = @RemainMS,Attr=@Attr,Data=@Data WHERE GID=@GID AND ID = @ID
	IF @@rowcount = 0
		INSERT INTO Skill_Rebuild(GID,ID,Level,RemainMS,Attr,Data) VALUES(@GID,@ID,@Level,@RemainMS,@Attr,@Data)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Skill_Rebuild_reset]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_Skill_Rebuild_reset]
	@GID	INT
AS
	SET NOCOUNT ON
	--SKID_NV_BASIC(1) 스킬은 제외시켜야한다.
	UPDATE Skill_Rebuild SET Level = 0 WHERE GID = @GID AND Attr = 0

	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Skill_Rebuild_get]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_Skill_Rebuild_get]
	@GID	INT
AS
	SET NOCOUNT ON
	SELECT ID,Level,RemainMS,Data FROM Skill_Rebuild WHERE GID=@GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Skill_Rebuild_delete]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_Skill_Rebuild_delete]
	@GID	INT,
	@ID		INT	
AS
	SET NOCOUNT ON
	DELETE Skill_Rebuild WHERE GID=@GID AND ID = @ID	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_selectQuest]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_selectQuest]
	@gid			int
AS
BEGIN
SET NOCOUNT ON
SELECT qid, complete, activ, hunt_1_mob_id, hunt_1_count, hunt_2_mob_id, hunt_2_count, hunt_3_mob_id, hunt_3_count, mission_time FROM QuestInfo WHERE gid=@gid
SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_party_role_change]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_party_role_change]
	@GRID		INT,
	@firstGID	INT,
	@firstRole	INT,
	@secondGID	INT,
	@secondRole	INT
AS
	SET NOCOUNT ON
	
	BEGIN TRAN	
	UPDATE groupMInfo SET [Role]=@firstRole WHERE GID=@firstGID
	IF @@rowcount = 1
		BEGIN
			UPDATE groupMInfo SET [Role]=@secondRole WHERE GID=@secondGID
			IF @@rowcount <> 1 -- 두번째 멤버의 Role수정을 실패한경우
			BEGIN
				ROLLBACK TRAN
				return
			END
		END
	ELSE-- 첫번째 멤버의 Role수정실패한경우
		BEGIN
			ROLLBACK TRAN
			return			
		END
	
	
	COMMIT TRAN	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_party_member_load]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_party_member_load]
	@PartyID INT
AS	
	SET NOCOUNT ON
	SELECT GID, AID, CharName, GRID, Role  FROM GroupMInfo WHERE GRID = @PartyID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_party_load]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_party_load]
	@PartyID INT
AS

	SELECT groupName, GroupOption FROM GroupInfo WHERE GRID = @PartyID
GO
/****** Object:  StoredProcedure [dbo].[usp_party_getid]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_party_getid]
	@Character_id INT
 AS
	DECLARE @party_id INT	
	SELECT @party_id = GRID FROM GroupMInfo WHERE GID = @Character_id
	IF @@rowcount = 1 RETURN @party_id
	ELSE RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_state_save]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_state_save]
	@GID INT,
	@data VARBINARY(512)
AS
	SET NOCOUNT ON
	UPDATE mercenary_effect SET state = @data WHERE GID = @GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_state_load]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_state_load]
	@GID INT
AS
	SET NOCOUNT ON
	SELECT state FROM mercenary_effect WHERE GID = @GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_owner_saveV2]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_owner_saveV2]
	@GID			INT,
	@arch_total_call_num 	INT, -- Arch타입의 용병 총 소환횟수
	@arch_faith		INT, -- Arch타입의 용병 신뢰도
	@spear_total_call_num 	INT, -- Spear타입 용병 총 소환횟수
	@spear_faith		INT, -- Spear타입 용병 신뢰도
	@sword_total_call_num 	INT, -- Sword타입 용병 총 소환횟수
	@sword_faith		INT  -- Sword타입 용병 신뢰도
AS
	SET NOCOUNT ON

	UPDATE mercenary_owner 
		SET arch_total_call_num 	= @arch_total_call_num,
		       arch_faith 		= @arch_faith,
		       spear_total_call_num 	= @spear_total_call_num,
		       spear_faith		= @spear_faith,
		       sword_total_call_num = @sword_total_call_num,
		       sword_faith                 = @sword_faith
			WHERE GID = @GID

	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_owner_load]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_owner_load]
	@GID	INT
AS

	SET NOCOUNT ON

	IF (SELECT  count(GID) FROM mercenary_owner WHERE GID=@GID) = 0
		INSERT INTO mercenary_owner(GID) VALUES(@GID)
	
	SELECT 	call,
		arch_total_call_num,
	             	arch_faith,
		spear_total_call_num,
		spear_faith,
		sword_total_call_num,
		sword_faith 
                                  FROM mercenary_owner WHERE GID = @GID


	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_owner_create]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_owner_create]
	@GID	INT
AS
	SET NOCOUNT ON
	INSERT INTO mercenary_owner(GID) VALUES(@GID)
	SELECT @@rowcount
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_info_saveV2]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_info_saveV2]
	@GID		INT,
	@remain_life_sec	INT,--	남은 생존기간(단위는 초)
	--job 이값은 바뀔수없다.	
	@bodystate 	INT,
	@healthstate	INT,
	@effectstate 	INT,
	@property	INT,
	@appmob_kill_cnt INT,
	@hp		INT,
	@sp		INT
AS
	SET NOCOUNT ON
	DECLARE @ret_code INT
	SET @ret_code = 0  --0 : 오류발생

	UPDATE mercenary_info SET
		remain_life_sec 	= @remain_life_sec,
		bodystate 	= @bodystate,
		healthstate 	= @healthstate,
		effectstate 	= @effectstate,
		property 	= @property, 
		appmob_kill_cnt   = @appmob_kill_cnt,
		hp		= @hp,
		sp		= @sp
		WHERE GID = @GID

	IF @@rowcount = 1 SET @ret_code = 1 -- 1 : 성공
	ELSE SET @ret_code = 0 -- 0 : 오류발생
	SELECT @ret_code
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_info_loadV2]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_info_loadV2]
	@GID INT
AS
	SET NOCOUNT ON
	SELECT	remain_life_sec,
		job,
		bodystate,
		healthstate,
		effectstate,
		property,
		appmob_kill_cnt,
		hp,
		sp
		FROM mercenary_info WHERE GID = @GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_effect_saveV2]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_effect_saveV2]
	@GID	INT,
	@length INT,
	@data	VARBINARY(512)
AS
	SET NOCOUNT ON

	IF @length = 0 	UPDATE mercenary_effect SET data = NULL  WHERE GID = @GID
	ELSE		UPDATE mercenary_effect SET data = @data WHERE GID = @GID

	IF @@rowcount = 1 SELECT 1
	ELSE SELECT 0
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_effect_save]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_effect_save]
	@GID	INT,
	@data	VARBINARY(512)
AS
	SET NOCOUNT ON
	UPDATE mercenary_effect SET data = @data WHERE GID = @GID
	IF @@rowcount = 1 SELECT 1
	ELSE SELECT 0
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_effect_load]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_effect_load]
	@GID INT
AS
	SET NOCOUNT ON
	SELECT data FROM mercenary_effect WHERE GID = @GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_delete]    Script Date: 02/16/2018 13:52:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_delete]
	@GID	INT
AS
	SET NOCOUNT ON
	DECLARE @ret_code INT
	SET @ret_code = 0 -- 0 : 오류

	BEGIN TRAN
	DELETE mercenary_info WHERE GID = @GID
	IF @@rowcount = 1  
	BEGIN		
		DELETE mercenary_effect WHERE GID=@GID
		IF @@rowcount = 1
		BEGIN
			UPDATE mercenary_owner SET call=0 WHERE GID = @GID
			IF @@rowcount = 1 SET @ret_code = 1 -- 1 : 성공
		END
	END
	
	IF @ret_code = 1   COMMIT TRAN
	ELSE		ROLLBACK TRAN
	
	SELECT @ret_code
	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mercenary_createV2]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_mercenary_createV2]
	@GID		INT,
	@remain_life_sec	INT, --	남은 생존기간(단위는 초)
	@job		INT

AS
	SET NOCOUNT ON
	DECLARE @ret_code INT
	SET @ret_code = 0 -- 0:실패

	BEGIN TRAN
	INSERT INTO mercenary_info(GID,remain_life_sec,job) 
                        VALUES(@GID,@remain_life_sec,@job)
	IF @@rowcount = 1
	BEGIN		
		INSERT INTO mercenary_effect(GID) VALUES(@GID)
		IF @@rowcount = 1 
		BEGIN		
			--owner테이블에 해당 레코드기 있는지 미리 확인할 필요성은 없다.
			--이곳에서 update가 않될것이므로 에러가 발생할것이다.
			UPDATE mercenary_owner SET call=1 WHERE GID = @GID
			IF @@rowcount = 1 SET @ret_code = 1 -- 1:성공				
		END
	END
	

	IF @ret_code = 1   COMMIT TRAN
	ELSE		ROLLBACK TRAN
	
	SELECT @ret_code
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_mail_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_mail_load]
	@CharacterID INT
AS	
	SET NOCOUNT ON

	SELECT MailID,AID,GID,Header,Reading,ItemInfo,ItemLen,[Money],FromName,[Text],DeleteTime FROM Mail WHERE GID = @CharacterID
	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_job_transcendent]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_job_transcendent]
	@GID	INT
AS
	DELETE Skill_Rebuild WHERE GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[usp_insertNewQuest]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_insertNewQuest]
	@gid 		INT,
	@qid 		INT,
	@complete 	INT,
	@activ		INT,
	@hm_1_id	INT,
	@hm_1_count	INT,
	@hm_2_id	INT,
	@hm_2_count	INT,
	@hm_3_id	INT,
	@hm_3_count	INT,
	@mission_time 	DATETIME
	
as
set nocount on
	insert into Questinfo(GID, QID, complete, activ, 
			hunt_1_mob_id, hunt_1_count, 
			hunt_2_mob_id, hunt_2_count, 
			hunt_3_mob_id, hunt_3_count,
			 mission_time, 
			ReceiveTime, CompleteTime
	)
	
	values(	@gid,	@qid,	@complete,	@activ,
		@hm_1_id,	@hm_1_count,
		@hm_2_id,	@hm_2_count,
		@hm_3_id,	@hm_3_count,
		@mission_time, GetDate(), GetDate()
	)

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[usp_insertGuildStorageLog]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_insertGuildStorageLog]
	@GID				int,
	@Name				varchar(24),
	@GDID				int,
	@ItemID				smallint,
	@Count				int,
	@Action				bit,
	@RefiningLevel		int,
	@SerialNum			bigint,
	@IsIdentified		bit,
	@ItemType			smallint,
	@Slot1				smallint,
	@Slot2				smallint,
	@Slot3				smallint,
	@Slot4				smallint,
	@LogTM				int
AS
SET NOCOUNT ON
DELETE FROM [GuildStorageLog] WHERE RegDate < CONVERT(varchar(30), GETDATE() -93, 112)
INSERT INTO [GuildStorageLog]
VALUES
(
	@GID,
	@Name,
	@GDID,
	@ItemID,
	@Count,
	@Action,
	@RefiningLevel,
	@SerialNum,
	@IsIdentified,
	@ItemType,
	@Slot1,
	@Slot2,
	@Slot3,
	@Slot4,
	DATEADD(S, @LogTM, DATEADD(S, DATEDIFF(S, GETUTCDATE(), GETDATE()), '19700101'))
)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertGuild]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertGuild]
	@Name				varchar(24),
	@MName				varchar(24)
AS
SET NOCOUNT ON
IF EXISTS(SELECT [GDID] FROM [GuildInfoDB] WITH(NOLOCK) WHERE [Name] = @Name)
	BEGIN
		SELECT -1
		RETURN
	END
	
DECLARE @GDID INT = 0

INSERT INTO [GuildInfoDB]
(
	[Name],
	[MName]
)
VALUES
(
	@Name,
	@MName
)
SELECT @GDID = @@IDENTITY

IF 0 < @GDID
	BEGIN
		DELETE FROM [GuildMInfo] WHERE [GDID] = @GDID
		DELETE FROM [GuildMPosition] WHERE [GDID] = @GDID
		DELETE FROM [GuildAllyInfo] WHERE [GDID] = @GDID
		DELETE FROM [GuildBanishInfo] WHERE [GDID] = @GDID
		DELETE FROM [GuildNotice] WHERE [GDID] = @GDID
		DELETE FROM [GuildSkill] WHERE [GDID] = @GDID
		DELETE FROM [GuildStorageLog] WHERE [GDID] = @GDID
		DELETE FROM [GuildStore] WHERE [GDID] = @GDID
	END

SELECT @GDID
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_insert_quest]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_insert_quest]
	@gid			int,
	@qid			int,  
	@activ			int,  
	@complete		int,  
	@hm_1_id		int,  
	@hm_1_count		int,  
	@hm_2_id		int,  
	@hm_2_count		int,  
	@hm_3_id		int,  
	@hm_3_count		int,  
	@mission_time		datetime
AS
BEGIN
SET NOCOUNT ON
INSERT INTO QuestInfo(GID, QID, complete, activ, hunt_1_mob_id, hunt_1_count, hunt_2_mob_id, hunt_2_count, hunt_3_mob_id, hunt_3_count, mission_time, ReceiveTime)
VALUES(@gid, @qid, @complete, @activ, @hm_1_id, @hm_1_count, @hm_2_id, @hm_2_count, @hm_3_id, @hm_3_count, @mission_time, getdate())
SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insert_Pet]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
----------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_insert_Pet]
	@Name		varchar(24),
	@Modified	int,
	@SpriteType	int,
	@Lv		int,
	@Fullness	int,
	@Relation	int,
	@Accessary	int,
	@GID		int
AS

SET NOCOUNT ON

Insert pet ([Name], Modified, SpriteType, Lv, Fullness, Relation, Accessary,GID) 
values(@Name, @Modified, @SpriteType, @Lv, @Fullness, @Relation, @Accessary, @GID)
RETURN SCOPE_IDENTITY()

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_init_bargainsale_item]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_init_bargainsale_item]
as
begin
    select itid, price, amount, startTime, endTime, opt from bargainsale_item
end
GO
/****** Object:  StoredProcedure [dbo].[usp_homun_update_skill]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 저장
-- drop procedure usp_homun_update_skill
create procedure [dbo].[usp_homun_update_skill]
	@GID	  INT,
	@ID		  INT,
	@Level	  INT,
	@RemainMS INT
AS
	SET NOCOUNT ON
	
	UPDATE Skill_HomunRebuild SET Level=@Level,RemainMS=@RemainMS WHERE GID=@GID AND ID=@ID
	IF @@rowcount = 0
		INSERT INTO Skill_HomunRebuild(GID,ID,Level,RemainMS) VALUES(@GID,@ID,@Level,@RemainMS)	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_homun_update_info]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- UpdateHomunInfo 프로시저를 다음으로 교체한다
-- drop procedure usp_homun_update_info
create PROCEDURE [dbo].[usp_homun_update_info]	
	@GID		int,
	@name		varchar(24),
	@modified	int,
	@level		smallint,
	@job		smallint,
	@exp		int,
	@SKPoint	smallint,
	@hp		smallint,
	@maxHP	smallint,
	@sp		smallint,
	@maxSP	smallint,
	@accessory	smallint,

	@Str		tinyint,
	@Agi		tinyint,
	@Vit		tinyint,
	@Int		tinyint,
	@Dex		tinyint,
	@Luk		tinyint,

	@bodystate	int,
	@healthstate	int,
	@effectstate	int,
	@property	smallint,
	
	@fullness	int,
	@relation	int
AS
	SET NOCOUNT ON

	update HomunInfo SET  
		Name 		= @name,
		Modified	= @modified,
		level		= @level,
		job		= @job,
		exp		= @exp,
		SKPoint 	= @SKPoint,
		hp		= @hp,
		maxHP		= @maxHP,
		sp		= @sp,
		maxSP		= @maxSP,
		accessory	= @accessory,

		Str		= @Str,
		Agi		= @Agi,
		Vit		= @Vit,
		Int		= @Int,
		Dex		= @Dex,
		Luk		= @Luk,

		bodyState	= @bodystate,
		healthState	= @healthstate,
		effectState	= @effectstate,
		property		= @property,
		
		fullness		= @fullness,
		relation		= @relation
	 where GID = @GID

	IF @job > 6016 OR @job < 6001
		BEGIN
			INSERT INTO TB_HomunFailLog(regDate, GID, [Name], Job, ProcName, spid, Login_Time, HostName, program_name, hostprocess, Loginame)
			SELECT getdate(), @GID, @name, @job, 'UpdateHomunInfo',spid, Login_Time, HostName, program_name,hostprocess,Loginame
			FROM master..sysprocesses
			WHERE spid = @@SPID
		END
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_homun_update_effect]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 호문 effect 정보 변경	
-- DROP PROCEDURE 	usp_homun_update_effect
create PROCEDURE [dbo].[usp_homun_update_effect]
	@GID	  INT,
	@ID		  INT,
	@TimeMS	  INT,
	@Data1	  INT,
	@Data2	  INT,
	@Data3	  INT
AS
	SET NOCOUNT ON
	
	-- 서버에서 usp_homun_delete_effect (delete all) 삭제 후 새로운 effect 정보를 추가
	INSERT INTO homun_effect(GID,ID,TimeMS,Data1,Data2,Data3) VALUES(@GID,@ID,@TimeMS,@Data1,@Data2,@Data3)
	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_homun_load_skill]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 가져오기
--drop procedure usp_homun_load_skill
create procedure [dbo].[usp_homun_load_skill]
	@GID	INT
AS
	SET NOCOUNT ON
	SELECT ID,[Level],RemainMS FROM Skill_HomunRebuild WHERE GID=@GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_homun_load_effect]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 호문 effect 가져오기
-- drop procedure usp_homun_load_effect
create procedure [dbo].[usp_homun_load_effect]
	@GID		INT	
AS
	SET NOCOUNT ON
	SELECT ID,TimeMS,Data1,Data2,Data3 FROM homun_effect WITH (READUNCOMMITTED) WHERE GID=@GID 	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_homun_insert_info]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- InsertHomun 프로시저를 다음으로 교체한다. 테이블의 HomunID는 사용하지 않음. 컬럼삭제가능
-- drop procedure usp_homun_insert_info
create procedure [dbo].[usp_homun_insert_info]
	@GID		int,
	@name		varchar(24),
	@modified	int,
	@level		smallint,
	@job		smallint,
	@exp		int,
	@SKPoint	smallint,
	@hp		smallint,
	@maxHP	smallint,
	@sp		smallint,
	@maxSP	smallint,
	@accessory	smallint,

	@Str		tinyint,
	@Agi		tinyint,
	@Vit		tinyint,
	@Int		tinyint,
	@Dex		tinyint,
	@Luk		tinyint,

	@bodystate	int,
	@healthstate	int,
	@effectstate	int,
	@property	smallint,
	
	@fullness	int,
	@relation	int
AS

	SET NOCOUNT ON
	Insert into HomunInfo ( GID, Name, Modified, level, job, exp, SKPoint, hp, maxHP, sp, maxSP, accessory, Str, Agi, Vit, Int, Dex, Luk,
 		bodyState, healthState, effectState, property, fullness, Relation
	 ) 
	values ( @GID, @name, 	@level,  @modified, @job, @exp, @SKPoint, @hp, @maxHP, @sp, @maxSP, @accessory, @Str, @Agi,  @Vit, @Int,  @Dex,  @Luk,
		 @bodystate, @healthstate, @effectstate, @property, @fullness, @relation
	 )

	IF @job > 6016 OR @job < 6001
		BEGIN
			INSERT INTO TB_HomunFailLog(regDate, GID, [Name], Job, ProcName, spid, Login_Time, HostName, program_name, hostprocess, Loginame)
			SELECT getdate(), @GID, @name, @job, 'InsertHomunInfo',spid, Login_Time, HostName, program_name,hostprocess,Loginame
			FROM master..sysprocesses
			WHERE spid = @@SPID
		END	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_homun_get_info]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- GetHomunInfo 프로시저를 다음으로 교체한다.
-- drop procedure usp_homun_get_info
create procedure [dbo].[usp_homun_get_info]
	@GID		INT
AS
	SET NOCOUNT ON
		SELECT	
			GID,--1
			[Name],--2
			Modified,--3
			[Level],--4
			job,--5
			[exp],--6
			SKPoint,--7
			hp,--8
			maxhp,--9
			sp,--10
			maxsp,--11
			accessory,--12
			[Str],--13
			Agi,--14
			Vit,--15
			[Int],--16
			Dex,--17
			Luk,--18
			bodyState,--19
			healthState,--20
			effectState,--21
			[property],--22
			Fullness,--23
			Relation--24
			FROM HomunInfo WHERE GID = @GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_homun_delete_info]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 호문 삭제시 homun_effect, Skill_HomunRebuild 에서도 삭제되어야함.
-- drop procedure usp_homun_delete_info
create PROCEDURE [dbo].[usp_homun_delete_info]
	@GID		int
AS
	delete HomunInfo Where GID=@GID
	delete homun_effect Where GID=@GID
	delete Skill_HomunRebuild Where GID=@GID
	delete Skill_Homun Where GID=@GID -- Skill_HomunRebuild 테이블이 있을 경우 테이블 삭제 가능
GO
/****** Object:  StoredProcedure [dbo].[usp_homun_delete_effect]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 호문 effect 삭제하기 (effect 전체 삭제 후 새 effect 정보를 넣어줄것임)
-- drop procedure usp_homun_delete_effect
create procedure [dbo].[usp_homun_delete_effect]
	@GID	INT
AS
	delete homun_effect WHERE GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_update]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_update]
	@GuildID		INT,
	@Level		INT,
	@Name		VARCHAR(24),
	@MName	VARCHAR(24),
	@MaxUserNum	INT,
	@Honor		INT,
	@Virtue		INT,
	@Type		INT,
	@Class		INT,
	@Money		INT,
	@ArenaWin	INT,
	@ArenaLose	INT,
	@ArenaDrawn	INT,
	@ManageLand	VARCHAR(24),
	@Exp		INT,
	@Emblem	INT,
	@Point		INT,
	@Desc		VARCHAR(80)
AS

	UPDATE GuildInfoDB SET [Level]=@Level, [Name]=@Name, MName=@MName, MaxUserNum=@MaxUserNum, Honor=@Honor, Virtue=@Virtue, Type=@Type, Class=@Class, Money=@Money, ArenaWin=@ArenaWin, ArenaLose=@ArenaLose, ArenaDrawn=@ArenaDrawn, ManageLand=@ManageLand, Exp=@Exp,  EmblemVersion=@Emblem, Point=@Point, [Desc]=@Desc  
		WHERE GDID = @GuildID
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_skill_update]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_skill_update]
	@GuildID		INT,
	@Skill		VARBINARY(256),
	@Point		INT	
AS
	UPDATE GuildSkill SET Skill = @Skill, Point=@Point WHERE GDID = @GuildID
	--IF @@rowcount != 1 INSERT INTO GuildSkill (GDID,Skill,Point) VALUES(@GuildID, @Skill,@Point)
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_skill_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_skill_load]
	@GuildID INT
AS	

	SELECT Skill, Point FROM GuildSkill WHERE GDID = @GuildID
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_position_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_position_load]
	@GuildID INT
AS	
	SET NOCOUNT ON
	SELECT GDID,Grade,PosName,JoinRight,PenaltyRight,PositionID,Service 
		FROM GuildMPosition WHERE GDID = @GuildID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_notice_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_notice_load]
	@GuildID INT
AS	

SELECT GDID,Subject,Notice FROM GuildNotice WHERE GDID=@GuildID
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_member_update]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_member_update]
	@GuildID 	INT,
	@CharacterID 	INT,
	@Service	INT,
	@Exp		INT,
	@Level		INT,
	@Class		INT
AS

	UPDATE GuildMInfo SET Service=@Service, MemberExp=@Exp, [Level]=@Level, Class=@Class 
 		WHERE GDID = @GuildID AND GID = @CharacterID
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_member_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_member_load]
	@GuildID INT
AS	
	SET NOCOUNT ON

	SELECT GID,CharName,AccountName,[Level],Class,
                           Memo,Service,MemberExp,GDID,AID,
                           PositionID
		FROM GuildMInfo WHERE GDID=@GuildID

	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_member_insert]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_member_insert]
	@CharacterID       INT,
	@CharacterName	 VARCHAR(24),
	@AccountName	 VARCHAR(24),
	@Level		 INT,
	@Class		 INT,
	@Memo		 VARCHAR(50),
	@Service	 INT,
	@MemberExp	 INT,
	@GuildID		 INT,
	@AccountID	 INT,
	@PositionID	 INT
AS
	INSERT GuildMInfo(GID,CharName,AccountName,[Level],Class,Memo,Service,MemberExp,GDID,AID,PositionID)
		VALUES(@CharacterID, @CharacterName, @AccountName, @Level, @Class, @Memo, @Service, @MemberExp,@GuildID, @AccountID, @PositionID)
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_member_delete]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_member_delete]
	@CharacterID INT
AS
	DELETE GuildMInfo WHERE GID = @CharacterID
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_load]  --[GetGuildInfoDB]
	@GuildID INT
AS

	SELECT GDID,[Level],[Name],MName,MaxUserNum,
                            Honor,Virtue,Type,Class,[Money],
                            ArenaWin,ArenaLose,ArenaDrawn,ManageLand,[Exp],
                            EmblemVersion,Point,[Desc]
		FROM GuildInfoDB WHERE GDID = @GuildID
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_getid]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_getid]
	@Character_id INT	
 AS
	DECLARE @guild_id INT	
	SELECT @guild_id = GDID FROM GuildMInfo WHERE GID = @Character_id
	IF @@rowcount = 1 RETURN @guild_id
	ELSE RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_banish_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_banish_load]
	@GuildID INT
AS	

	SET NOCOUNT ON
	SELECT GDID,MemberName,MemberAccount,Reason,GID,AID FROM GuildBanishInfo WHERE GDID = @GuildID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_banish_delete]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_banish_delete]
	@GuildID INT,
	@CharacterID INT
AS
	DELETE GuildBanishInfo WHERE GDID=@GuildID AND GID=@CharacterID
GO
/****** Object:  StoredProcedure [dbo].[usp_guild_ally_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_guild_ally_load]
	@GuildID INT
AS	
	SET NOCOUNT ON
	SELECT GDID,OpponentGDID,GuildName,Relation FROM GuildAllyInfo WHERE GDID = @GuildID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_GetWarpInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetWarpInfo]    
 @GID INT    
AS    
 SET NOCOUNT ON    
 SELECT mapName1, xPos1, yPos1, mapName2, xPos2, yPos2, mapName3, xPos3, yPos3 FROM warpInfo WHERE GID = @GID    
 SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_GetGuildStorePermGID]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetGuildStorePermGID]
	@GDID				int
AS
SET NOCOUNT ON
SELECT [PermGID] FROM [GuildStore] WHERE [GDID] = @GDID
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_getguildstore]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getguildstore]
	@GDID				int
AS
SET NOCOUNT ON
SELECT [StoreItem] FROM [GuildStore] WHERE [GDID] = @GDID
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_getGuildStorageLog2]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getGuildStorageLog2]
	@GDID				int,
	@RecentIdx			int
AS
SET NOCOUNT ON
IF 0 = @RecentIdx
	BEGIN
		SELECT TOP 100 [Idx], [Name], [ItemID], [Count], [Action], [RefiningLevel], [IsIdentified], [ItemType], [Slot1], [Slot2], [Slot3], [Slot4], CONVERT(VARCHAR(24), [RegDate], 20), [GID]
		FROM [GuildStorageLog] WITH(NOLOCK) WHERE [GDID] = @GDID ORDER BY [Idx] DESC
	END
ELSE
	BEGIN
		SELECT TOP 100 [Idx], [Name], [ItemID], [Count], [Action], [RefiningLevel], [IsIdentified], [ItemType], [Slot1], [Slot2], [Slot3], [Slot4], CONVERT(VARCHAR(24), [RegDate], 20), [GID]
		FROM
		(
			SELECT TOP 10 [Idx], [Name], [ItemID], [Count], [Action], [RefiningLevel], [IsIdentified], [ItemType], [Slot1], [Slot2], [Slot3], [Slot4], [RegDate], [GID]
			FROM [GuildStorageLog] WITH(NOLOCK) WHERE [GDID] = @GDID AND [Idx] > @RecentIdx ORDER BY [Idx] ASC
		)V ORDER BY [Idx] DESC
	END
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetFamilyInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_GetFamilyInfo]      
	@GID INT
AS      
	SET NOCOUNT ON      
	SELECT * FROM family WHERE fatherGID = @GID OR motherGID = @GID OR babyGID = @GID 
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetCouple]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_GetCouple]    
	@GID INT
AS     
	SET NOCOUNT ON
	SELECT maleGID, femaleGID, weddingTime, weddingTime2 FROM CoupleInfo2  WHERE maleGID = @GID or femaleGID = @GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_ranking]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_ranking]
    @gid int
AS
BEGIN
    select type, point from MakerRank where gid = @gid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_get_Pet]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_get_Pet] 
	@PETID 	    int
AS

SET NOCOUNT ON

SELECT PETID, [Name], Modified, SpriteType, Lv, Fullness, Relation, Accessary, GID
FROM  Pet 
WHERE  PETID = @PETID 

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_new_svr_boot_squence_num]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_get_new_svr_boot_squence_num]
AS	
	SET NOCOUNT ON

	DECLARE @svr_boot_sequence_num INT
	DECLARE @error INT
	SET @svr_boot_sequence_num = 0
	SET @error = 2 -- 2  알수없는에러발생 

	
	BEGIN TRAN
	SELECT @svr_boot_sequence_num = ZSvrBootSquenceNum FROM Configuration WHERE [Identity]=1
	IF @@rowcount = 1
	BEGIN
		IF @svr_boot_sequence_num >= 2000000000 SET @error =1 --오버플로
		ELSE
			BEGIN
				SET @svr_boot_sequence_num = @svr_boot_sequence_num + 1
				UPDATE Configuration SET ZSvrBootSquenceNum = @svr_boot_sequence_num WHERE [Identity]=1
				IF @@rowcount = 1 SET @error = 0 --에러 없음
				ELSE SET @error = 2 -- 2  알수없는에러발생
			END
	END
	ELSE SET @error = 3 --           3  데이타를 찾을수 없음
	COMMIT TRAN


	SELECT @error,@svr_boot_sequence_num
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_ClanMemberInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_ClanMemberInfo]      
AS      
    SET NOCOUNT ON      
    SELECT CID, AID, GID FROM ClanMemberInfo WHERE 15 > DATEDIFF( dd, UpdateTM  ,GETDATE() )   
    SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_charinfo7]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_charinfo7]
    @GID         INT,
    @charnum    SMALLINT
AS    
    SET NOCOUNT ON
    SELECT    GID,--1
            CharName,--2
            job,--3
            clevel,--4
            sppoint,--5
             [exp],--6
            jobpoint,--7
            [STR],--8
            AGI,--9
            VIT,--10
            [INT],--11
            DEX,--12
            LUK,--13
            hp,--14
            maxhp,--15
            sp,--16
            maxsp,--17
            AID,--18
            mapname,--19
            xPos,--20
            yPos,--21
            GuildID,--22
            CharNum,--23
            speed,--24
            [money],--25
            jobexp,--26
            virtue,--27
            honor,--28
            haircolor,--29
            joblevel,--30
            bodystate,--31
            healthstate,--32
            sxPos,--33
            syPos,--34
            restartMapName,--35
            effectstate,--36
            head,--37
            weapon,--38
            accessory,--39
            headpalette,--40
            bodypalette,--41
            accessory2,--42
            accessory3,--43
            shield,--44
            party_config, --45
            equipwinopen, -- 46
            font, -- 47
            [checksum], -- 48
            robepalette, -- 49
            chr_slot_change, -- 50
            chr_name_changeCNT -- 51
            FROM charinfo WHERE GID = @GID AND CharNum = @charnum
    SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_charinfo5]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_get_charinfo5]
	@GID 		INT,
	@charnum	SMALLINT
AS	
	SET NOCOUNT ON
	SELECT	GID,--1
			CharName,--2
			job,--3
			clevel,--4
			sppoint,--5
 			[exp],--6
			jobpoint,--7
			[STR],--8
			AGI,--9
			VIT,--10
			[INT],--11
			DEX,--12
			LUK,--13
			hp,--14
			maxhp,--15
			sp,--16
			maxsp,--17
			AID,--18
			mapname,--19
			xPos,--20
			yPos,--21
			GuildID,--22
			CharNum,--23
			speed,--24
			[money],--25
			jobexp,--26
			virtue,--27
			honor,--28
			haircolor,--29
			joblevel,--30
			bodystate,--31
			healthstate,--32
			sxPos,--33
			syPos,--34
			restartMapName,--35
			effectstate,--36
			head,--37
			weapon,--38
			accessory,--39
			headpalette,--40
			bodypalette,--41
			accessory2,--42
			accessory3,--43
			shield,--44
			party_config, --45
			equipwinopen, -- 46
			font, -- 47
			checksum, -- 48
			isnull(robepalette, 0) as robepalette -- 49
			
			FROM charinfo WHERE GID = @GID AND CharNum = @charnum
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_charinfo4]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[usp_get_charinfo4]
	@GID 		INT,
	@charnum	SMALLINT
AS	
	SET NOCOUNT ON
	SELECT	GID,--1
			CharName,--2
			job,--3
			clevel,--4
			sppoint,--5
 			[exp],--6
			jobpoint,--7
			[STR],--8
			AGI,--9
			VIT,--10
			[INT],--11
			DEX,--12
			LUK,--13
			hp,--14
			maxhp,--15
			sp,--16
			maxsp,--17
			AID,--18
			mapname,--19
			xPos,--20
			yPos,--21
			GuildID,--22
			CharNum,--23
			speed,--24
			[money],--25
			jobexp,--26
			virtue,--27
			honor,--28
			haircolor,--29
			joblevel,--30
			bodystate,--31
			healthstate,--32
			sxPos,--33
			syPos,--34
			restartMapName,--35
			effectstate,--36
			head,--37
			weapon,--38
			accessory,--39
			headpalette,--40
			bodypalette,--41
			accessory2,--42
			accessory3,--43
			shield,--44
			party_config, --45
			equipwinopen, -- 46
			font, -- 47
			[checksum]
			FROM charinfo WHERE GID = @GID AND CharNum = @charnum
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_charinfo3]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_get_charinfo3]
	@GID 		INT,
	@charnum	SMALLINT
AS	
	SET NOCOUNT ON
	SELECT	GID,--1
			CharName,--2
			job,--3
			clevel,--4
			sppoint,--5
 			[exp],--6
			jobpoint,--7
			[STR],--8
			AGI,--9
			VIT,--10
			[INT],--11
			DEX,--12
			LUK,--13
			hp,--14
			maxhp,--15
			sp,--16
			maxsp,--17
			AID,--18
			mapname,--19
			xPos,--20
			yPos,--21
			GuildID,--22
			CharNum,--23
			speed,--24
			[money],--25
			jobexp,--26
			virtue,--27
			honor,--28
			haircolor,--29
			joblevel,--30
			bodystate,--31
			healthstate,--32
			sxPos,--33
			syPos,--34
			restartMapName,--35
			effectstate,--36
			head,--37
			weapon,--38
			accessory,--39
			headpalette,--40
			bodypalette,--41
			accessory2,--42
			accessory3,--43
			shield,--44
			party_config, --45
			equipwinopen, -- 46
			font -- 47
			FROM charinfo WHERE GID = @GID AND CharNum = @charnum
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_charinfo2]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_get_charinfo2]
	@GID 		INT,
	@charnum	SMALLINT
AS	
	SET NOCOUNT ON
	SELECT	GID,--1
			CharName,--2
			job,--3
			clevel,--4
			sppoint,--5
 			[exp],--6
			jobpoint,--7
			[STR],--8
			AGI,--9
			VIT,--10
			[INT],--11
			DEX,--12
			LUK,--13
			hp,--14
			maxhp,--15
			sp,--16
			maxsp,--17
			AID,--18
			mapname,--19
			xPos,--20
			yPos,--21
			GuildID,--22
			CharNum,--23
			speed,--24
			[money],--25
			jobexp,--26
			virtue,--27
			honor,--28
			haircolor,--29
			joblevel,--30
			bodystate,--31
			healthstate,--32
			sxPos,--33
			syPos,--34
			restartMapName,--35
			effectstate,--36
			head,--37
			weapon,--38
			accessory,--39
			headpalette,--40
			bodypalette,--41
			accessory2,--42
			accessory3,--43
			shield,--44
			party_config, --45
			equipwinopen -- 46
			FROM charinfo WHERE GID = @GID AND CharNum = @charnum
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_get_charinfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_get_charinfo]
	@GID 		INT,
	@charnum	SMALLINT
AS	
	SET NOCOUNT ON
	SELECT	GID,--1
			CharName,--2
			job,--3
			clevel,--4
			sppoint,--5
 			[exp],--6
			jobpoint,--7
			[STR],--8
			AGI,--9
			VIT,--10
			[INT],--11
			DEX,--12
			LUK,--13
			hp,--14
			maxhp,--15
			sp,--16
			maxsp,--17
			AID,--18
			mapname,--19
			xPos,--20
			yPos,--21
			GuildID,--22
			CharNum,--23
			speed,--24
			[money],--25
			jobexp,--26
			virtue,--27
			honor,--28
			haircolor,--29
			joblevel,--30
			bodystate,--31
			healthstate,--32
			sxPos,--33
			syPos,--34
			restartMapName,--35
			effectstate,--36
			head,--37
			weapon,--38
			accessory,--39
			headpalette,--40
			bodypalette,--41
			accessory2,--42
			accessory3,--43
			shield,--44
			party_config --45
			FROM charinfo WHERE GID = @GID AND CharNum = @charnum
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_friend_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_friend_load]
	@CharacterID INT
AS

	SELECT [data]  FROM Friends WHERE GID = @CharacterID
GO
/****** Object:  StoredProcedure [dbo].[usp_erase_quest]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_erase_quest]
	@gid			int,
	@qid			int
AS
BEGIN
SET NOCOUNT ON
DELETE FROM QuestInfo WHERE gid=@gid AND qid=@qid
SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_elemental_update_effect]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_elemental_update_effect]
	@GID	  INT,
	@ID		  INT,
	@TimeMS	  INT,
	@Data1	  INT,
	@Data2	  INT,
	@Data3	  INT
AS
	SET NOCOUNT ON
	
	INSERT INTO elemental_effect(GID,ID,TimeMS,Data1,Data2,Data3) VALUES(@GID,@ID,@TimeMS,@Data1,@Data2,@Data3)
	IF @@rowcount = 0
		UPDATE elemental_effect SET TimeMS=@TimeMS,Data1 = @Data1,Data2=@Data2,Data3=@Data3 WHERE GID=@GID AND ID = @ID	

	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_elemental_update]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_elemental_update]
	@GID		INT,
	@hp			INT,
	@sp			INT
AS
	SET NOCOUNT ON
	DECLARE @myerror INT

	BEGIN TRAN	
	UPDATE elemental SET hp=@hp,sp=@sp WHERE GID=@GID	
	SET @myerror = @@rowcount
	DELETE elemental_effect WHERE GID = @GID --해당 정령(elemental)의 효과 정보를 모두 삭제한다.	
	IF (@@ERROR <> 0) OR (@myerror <> 1) 
		BEGIN
			ROLLBACK TRAN
			SET NOCOUNT OFF
			RETURN
		END
		
	COMMIT TRAN
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_elemental_load_effect]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_elemental_load_effect]
	@GID		INT	
AS
	SET NOCOUNT ON
	SELECT ID,TimeMS,Data1,Data2,Data3 FROM elemental_effect WITH (READUNCOMMITTED) WHERE GID=@GID 
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_elemental_load]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_elemental_load]
	@GID		INT	
AS
	SET NOCOUNT ON
	SELECT kind,scale,hp,maxhp,sp,maxsp,atk,matk,attackMT,def,mdef,flee,hit FROM elemental 
		WITH (READUNCOMMITTED)
		WHERE GID=@GID 
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_elemental_delete]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_elemental_delete]
	@GID		INT	
AS
	SET NOCOUNT ON
	DELETE elemental WHERE GID = @GID
	DELETE elemental_effect WHERE GID = @GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_elemental_create]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_elemental_create]
	@GID		INT,
	@kind		INT,
	@scale		INT,
	@hp			INT,
	@maxhp		INT,
	@sp			INT,
	@maxsp		INT,
	@atk		INT,
	@matk		INT,
	@attackMT	INT,
	@def		INT,
	@mdef		INT,
	@flee		INT,
	@hit		INT
AS
	SET NOCOUNT ON
	
	DECLARE @ret INT	
	INSERT INTO elemental(GID,kind,scale,hp,maxhp,sp,maxsp,atk,matk,attackMT,def,mdef,flee,hit) 
	     VALUES(@GID,@kind,@scale,@hp,@maxhp,@sp,@maxsp,@atk,@matk,@attackMT,@def,@mdef,@flee,@hit)	     
	SET @ret = @@rowcount	    
	--실패시 오류 수정을 위해 해당 케릭터가 소유하고 있는 정령을 삭제해준다.
	IF @ret <> 1  DELETE elemental WHERE GID = @GID	     
	RETURN @ret
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_effectiveinfo_delete]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_effectiveinfo_delete]
	@GID	INT
AS
	SET NOCOUNT ON
	DELETE EffectiveInfo WHERE GID=@GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_effect_Rebuild_update]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_effect_Rebuild_update]
	@GID	  INT,
	@ID		  INT,
	@TimeMS	  INT,
	@Data1	  INT,
	@Data2	  INT,
	@Data3	  INT
AS
	SET NOCOUNT ON
	UPDATE effect_Rebuild SET TimeMS=@TimeMS,Data1 = @Data1,Data2=@Data2,Data3=@Data3 WHERE GID=@GID AND ID = @ID
	IF @@rowcount = 0
		INSERT INTO effect_Rebuild(GID,ID,TimeMS,Data1,Data2,Data3) VALUES(@GID,@ID,@TimeMS,@Data1,@Data2,@Data3)
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_effect_Rebuild_get]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_effect_Rebuild_get]
	@GID	INT
AS
	SET NOCOUNT ON
	SELECT ID,TimeMS,Data1,Data2,Data3 FROM effect_Rebuild WHERE GID=@GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_effect_Rebuild_delete]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_effect_Rebuild_delete]
	@GID	INT,
	@ID		INT	
AS
	SET NOCOUNT ON
	DELETE effect_Rebuild WHERE GID=@GID AND ID = @ID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteGuildStorage]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteGuildStorage]
	@GDID				int
AS
SET NOCOUNT ON
DELETE FROM [GuildStore] WHERE [GDID] = @GDID
DELETE FROM [GuildStorageLog] WHERE [GDID] = @GDID
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteFamily]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteFamily]    
	@BabyGID INT
AS    
	SET NOCOUNT ON
	DELETE Family WHERE babyGID = @BabyGID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteCouple]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_DeleteCouple]     
	@GID INT    
AS
	SET NOCOUNT ON    
	DELETE CoupleInfo2 WHERE maleGID = @GID OR femaleGId = @GID
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_chr_update_delrevdate_kor]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_chr_update_delrevdate_kor]
    @AID        INT,
    @GID        INT,
    @RevDate    DATETIME
AS    
    SET NOCOUNT ON
    
    IF EXISTS( SELECT GDID FROM GuildMInfo WHERE GID = @GID )
        BEGIN
            RETURN 1;
        END    
    ELSE 
        IF EXISTS( SELECT GRID FROM GroupMInfo WHERE GID = @GID AND AID = @AID )
            BEGIN
                RETURN 2;
            END
    
        UPDATE charinfo SET delrevdate = @RevDate WHERE GID = @GID;
        RETURN 0;
    
    SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_chr_get_charinfo5]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_chr_get_charinfo5]
    @AID        INT
AS

    SET NOCOUNT ON
    SELECT    GID,--1
            CharName,--2
            job,--3
            clevel,--4
            sppoint,--5
             [exp],--6
            jobpoint,--7
            [STR],--8
            AGI,--9
            VIT,--10
            [INT],--11
            DEX,--12
            LUK,--13
            hp,--14
            maxhp,--15
            sp,--16
            maxsp,--17
            AID,--18
            mapname,--19
            xPos,--20
            yPos,--21
            GuildID,--22
            CharNum,--23
            speed,--24
            [money],--25
            jobexp,--26
            virtue,--27
            honor,--28
            haircolor,--29
            joblevel,--30
            bodystate,--31
            healthstate,--32
            sxPos,--33
            syPos,--34
            restartMapName,--35
            effectstate,--36
            head,--37
            weapon,--38
            accessory,--39
            headpalette,--40
            bodypalette,--41
            accessory2,--42
            accessory3,--43
            shield,--44
            delrevdate, -- 45
            robepalette, -- 46
            chr_slot_change, -- 47
            chr_name_changeCNT --48
                FROM charinfo WHERE AID = @AID 
                order by CharNum asc
    SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateWarpInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateWarpInfo]
	@GID		int
,	@mapName1	varchar(16)
,	@xPos1	smallint
,	@yPos1	smallint
,	@mapName2	varchar(16)
,	@xPos2	smallint
,	@yPos2	smallint
,	@mapName3	varchar(16)
,	@xPos3	smallint
,	@yPos3	smallint
AS
update warpinfo with (rowlock) set  mapName1 =@mapName1, xPos1 = @xPos1, yPos1 = @yPos1, mapName2 = @mapName2, xPos2 = @xPos2, 
yPos2 = @yPos2, mapName3 = @mapName3	, xPos3 = @xPos3, yPos3 = @yPos3 where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateTimeList]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTimeList]
	@list		varbinary(512),	
	@GID		int
AS
update TimeList with (rowlock) set list = @list where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateStoreItemMoney]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateStoreItemMoney]
	@money	int
,	@AID		int
AS
	Update storeitem set money = @money Where AID = @AID
GO
/****** Object:  StoredProcedure [dbo].[UpdateStateInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStateInfo]
	@info		varbinary(512),	
	@GID		int
AS
update StateInfo with (rowlock) set info = @info where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateSkill_HO]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateSkill_HO]
	@SKData	varbinary(256)
,	@GID		int
AS
update Skill_Homun with (rowlock) set SKData = @SKData where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateSkill]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSkill]
	@skillInfo	varbinary(256)
,	@GID		int
AS
update skill with (rowlock) set skillInfo = @skillInfo where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateShortCutKey]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE  [dbo].[UpdateShortCutKey]
	@GID		int,
	@data		varbinary(300)
AS
if exists (select * from ShortCutKeyDB where GID = @GID)
update ShortCutKeyDB  set ShortCutKey = @data where GID = @GID
else 
insert ShortCutKeyDB  values(@GID, default, @data)
GO
/****** Object:  StoredProcedure [dbo].[UpdateRestartMapInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateRestartMapInfo]
	@AID int,
	@restartMapName varchar(16),
	@xPos int,
	@yPos int
 AS

update charinfo
with (rowlock)
set restartMapName = @restartMapName, sxPos=@xPos, syPos=@yPos
where aid = @AID
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuestEvent_test]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateQuestEvent_test]
	@GID 			int ,
	@QuestEventData	 	varbinary(4000),
	@HuntData 		varbinary(4000),
	@TimeData	 	varbinary(4000),
	@CompleteQuestData	varbinary(2000)
AS

	SET NOCOUNT ON

	UPDATE QuestEvent SET QuestEvent = @QuestEventData, Hunt_Mission = @HuntData, Time_Mission  = @TimeData, CompleteQuest = @CompleteQuestData 
	WHERE GID = @GID

	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuestEvent]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateQuestEvent]
	@GID 			int ,
	@QuestEventData	 	varbinary(4000),
	@HuntData 		varbinary(4000),
	@TimeData	 	varbinary(4000),
	@CompleteQuestData	varbinary(2000)
AS

	SET NOCOUNT ON

	UPDATE QuestEvent SET QuestEvent = @QuestEventData, Hunt_Mission = @HuntData, Time_Mission  = @TimeData, CompleteQuest = @CompleteQuestData 
	WHERE GID = @GID

	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdatePvPScore]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePvPScore]
	@GID		int,
	@WinTime	int,
	@MapName	varchar(16)
AS
update PvPScore with (rowlock) set WinTime=@WinTime, MapName=@MapName where GID=@GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateEffectiveInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateEffectiveInfo]
	@info		varbinary(512),	
	@GID		int
AS
update EffectiveInfo with (rowlock) set info = @info where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[InsertCartItem]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCartItem] 
	@GID		int
AS	
insert cartitem values(@GID, NULL )
GO
/****** Object:  StoredProcedure [dbo].[InsertAuction]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAuction]
	@ZoneServerID int,
	@AID		int,
	@GID		int,
	@SellerName	char(24),
	@ItemInfo     	binary(24),
	@ItemLen	int,
	@ItemType	int,
	@NowPrice	int,
	@MaxPrice	int,
	@EndTime	datetime
AS
Insert into Auction (ZoneServerID, AID, GID, SellerName,  NowPrice, MaxPrice, ItemType, ItemInfo, ItemLen, EndTime)
values (@ZoneServerID, @AID, @GID, @SellerName, @NowPrice,@MaxPrice, @ItemType, @ItemInfo, @ItemLen, @EndTime)

RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[UpdateCharStartMap]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCharStartMap]
	@GID		int
AS
SET NOCOUNT ON

UPDATE charinfo SET mapName = restartMapName
			,xPos = sxPos
			,yPos = syPos
WHERE GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateCharNum]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--UpdateCharNum
CREATE PROCEDURE [dbo].[UpdateCharNum]
	@GID		int
,	@CharNum	int
AS
SET NOCOUNT ON

	UPDATE charinfo SET CharNum=@CharNum
                        WHERE GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateCharName2]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      PROCEDURE [dbo].[UpdateCharName2]
	@OLDCharName	AS VARCHAR(24),
	@CharName	AS VARCHAR(24)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @Error		AS INT
	DECLARE @RETURN	AS INT
	DECLARE @Count		AS INT
	

	
	SET @Error	= 0
	SET @RETURN	= 1
	SET @Count	= 0
	

	SELECT @Count = COUNT([CharName]) FROM [DBO].[CharInfo] WHERE [CharName] = @CharName
	IF @Count > 0
	BEGIN 
		SET @RETURN = 2
		SELECT @RETURN
	END
	ELSE
	BEGIN
		/*
			CharInfo		--
			GuildMInfo	--
			GuildInfoDB	-- 길드마스터만 있다
			MakerRank	--
			Guildbanishinfo	-- 길마마스터만 있다
			
		*/
	BEGIN TRAN

			DECLARE @GDID AS INT
			DECLARE @CharName_Old	AS VARCHAR(24)
			DECLARE @Position AS INT
			DECLARE @GID	AS INT

			SET @GDID = 0
			SET @CharName_Old = ''
			SET @Position = 0
			SET @GID = 0

			SELECT @GID = [GID] FROM CharInfo WHERE [CharName] = @OLDCharName	
			
			SELECT @CharName_Old = [CharName] FROM CharInfo WHERE [GID] = @GID				

			UPDATE [DBO].[CharInfo] SET [bisChangedCharName]=1, [CharName]= @CharName
			WHERE [GID] = @GID
			SELECT @Error = @@ERROR
			
			UPDATE [dbo].[MakerRank] SET CharName = @CharName WHERE [GID] = @GID
			SELECT @Error = @@ERROR

			SELECT @GDID = [GDID],@Position=[PositionID] FROM GuildMInfo WHERE [GID] = @GID AND [PositionID] = 0
			IF @GDID > 0
			BEGIN
				UPDATE GuildMInfo	SET CharName = @CharName	WHERE [GID] = @GID
				SELECT @Error = @@ERROR
				UPDATE GuildInfoDB	SET MName = @CharName	WHERE [GDID] = @GDID
				SELECT @Error = @@ERROR
				UPDATE Guildbanishinfo	SET MemberName = @CharName	WHERE [GDID] = @GDID
				SELECT @Error = @@ERROR

				Insert UpdateCharLog (GID,CharName_Old,  CharName_New, GDID, Position, RegDate)
				Select @GID,@CharName_Old,@CharName,@GDID,@Position,getdate()
				SELECT @Error = @@ERROR
				
			END
			ELSE
			BEGIN
				UPDATE GuildMInfo	SET CharName = @CharName	WHERE [GID] = @GID
				SELECT @Error = @@ERROR

				Insert UpdateCharLog (GID,CharName_Old,  CharName_New, GDID, Position, RegDate)
				Select @GID,@CharName_Old,@CharName,@GDID,@Position,getdate()
				SELECT @Error = @@ERROR
			END

				
		IF @Error = 0
		BEGIN
			COMMIT TRAN
			--RETURN 1
			SET @RETURN = 1
			SELECT @RETURN
		END
		ELSE
		BEGIN
			ROLLBACK TRAN
			--RETURN 3
			SET @RETURN = 3
			SELECT @RETURN
		END		
	END

	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCharName]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--///////MODIFY SP

CREATE      PROCEDURE [dbo].[UpdateCharName]
	@GID	AS INT,
	@CharName	AS VARCHAR(24)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @Error		AS INT
	DECLARE @RETURN	AS INT
	DECLARE @Count		AS INT
	
	SET @Error	= 0
	SET @RETURN	= 1
	SET @Count	= 0

	SELECT @Count = COUNT([CharName]) FROM [DBO].[CharInfo] WHERE [CharName] = @CharName
	IF @Count > 0
	BEGIN 
		SET @RETURN = 2
		SELECT @RETURN
	END
	ELSE
	BEGIN
		/*
			CharInfo		--
			GuildMInfo	--
			GuildInfoDB	-- 길드마스터만 있다
			MakerRank	--
			Guildbanishinfo	-- 길마마스터만 있다
			
		*/
	BEGIN TRAN

			DECLARE @GDID AS INT
			DECLARE @CharName_Old	AS VARCHAR(24)
			DECLARE @Position AS INT

			SET @GDID = 0
			SET @CharName_Old = ''
			SET @Position = 0

			SELECT @CharName_Old = [CharName] FROM CharInfo WHERE [GID] = @GID			

			UPDATE [DBO].[CharInfo] SET [bisChangedCharName]=1, [CharName]= @CharName
			WHERE [GID] = @GID
			SELECT @Error = @@ERROR
			
			UPDATE [dbo].[MakerRank] SET CharName = @CharName WHERE [GID] = @GID
			SELECT @Error = @@ERROR

			SELECT @GDID = [GDID],@Position=[PositionID] FROM GuildMInfo WHERE [GID] = @GID AND [PositionID] = 0
			IF @GDID > 0
			BEGIN
				UPDATE GuildMInfo	SET CharName = @CharName	WHERE [GID] = @GID
				SELECT @Error = @@ERROR
				UPDATE GuildInfoDB	SET MName = @CharName	WHERE [GDID] = @GDID
				SELECT @Error = @@ERROR
				UPDATE Guildbanishinfo	SET MemberName = @CharName	WHERE [GDID] = @GDID
				SELECT @Error = @@ERROR

				Insert UpdateCharLog (GID,CharName_Old,  CharName_New, GDID, Position, RegDate)
				Select @GID,@CharName_Old,@CharName,@GDID,@Position,getdate()
				SELECT @Error = @@ERROR
				
			END
			ELSE
			BEGIN
				UPDATE GuildMInfo	SET CharName = @CharName	WHERE [GID] = @GID
				SELECT @Error = @@ERROR

				Insert UpdateCharLog (GID,CharName_Old,  CharName_New, GDID, Position, RegDate)
				Select @GID,@CharName_Old,@CharName,@GDID,@Position,getdate()
				SELECT @Error = @@ERROR
			END

				
		IF @Error = 0
		BEGIN
			COMMIT TRAN
			--RETURN 1
			SET @RETURN = 1
			SELECT @RETURN
		END
		ELSE
		BEGIN
			ROLLBACK TRAN
			--RETURN 3
			SET @RETURN = 3
			SELECT @RETURN
		END		
	END

	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCharInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCharInfo]
	@job		smallint
,	@clevel		smallint
,	@sppoint	smallint
,	@exp		int
,	@jobpoint	smallint
,	@STR		tinyint
,	@AGI		tinyint
,	@VIT		tinyint
,	@INT		tinyint
,	@DEX		tinyint
,	@LUK		tinyint
,	@hp		smallint
,	@maxhp	smallint
,	@sp		smallint
,	@maxsp	smallint
,	@mapname	varchar(16)
,	@xPos		smallint
,	@yPos		smallint
,	@speed	smallint
,	@money	int
,	@jobexp	int
,	@virtue		smallint
,	@honor		int
,	@haircolor	tinyint
,	@joblevel	int
,	@bodystate	int
,	@healthstate	int
,	@GID		int
,	@sxPos		smallint
,	@syPos		smallint
,	@restartMapName	varchar(16)
,	@effectstate	int
,	@head		smallint
,	@weapon	smallint
,	@accessory	smallint
,	@headpalette	smallint
,	@bodypalette	smallint
,	@accessory2	smallint
,	@accessory3	smallint
,	@shield		smallint
, 	@charname       varchar(24)
AS
update charinfo with (rowlock) set job = @job, clevel = @clevel, sppoint = @sppoint, exp = @exp, jobpoint = @jobpoint, STR = @STR, AGI = @AGI, VIT = @VIT, INT = @INT, DEX = @DEX, LUK = @LUK, hp = @hp, maxhp = @maxhp, sp = @sp, 
maxsp = @maxsp, mapname = @mapname, xPos = @xPos, yPos = @yPos, speed = @speed, money=@money,  jobexp = @jobexp, virtue =@virtue, honor =@honor, haircolor=@haircolor, joblevel=@joblevel, bodystate =@bodystate,
healthstate=@healthstate,  sxPos = @sxPos, syPos=@syPos, restartMapName=@restartMapName, effectstate=@effectstate, head=@head, weapon=@weapon, accessory=@accessory, headpalette=@headpalette, bodypalette=@bodypalette,
accessory2=@accessory2, accessory3=@accessory3, shield=@shield  where GID = @GID and  charname = @charname
GO
/****** Object:  StoredProcedure [dbo].[UpdateCharGDID]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCharGDID]
	@GID		int
,	@GDID		int
AS
update charinfo with (rowlock)  set GuildID=@GDID where GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateChangedCharName]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--UpdateChangedCharName
CREATE PROCEDURE [dbo].[UpdateChangedCharName]
	@GID		int
,	@bChanged		tinyint
AS
SET NOCOUNT ON

	UPDATE charinfo SET bisChangedCharName=@bChanged
                        WHERE GID = @GID
GO
/****** Object:  StoredProcedure [dbo].[UpdateBuyerAuction]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBuyerAuction] 
	@AuctionID		int,
	@BuyerAID		int,
	@BuyerGID		int,
	@BuyerName		char(24),
	@NowPrice		int
AS
update Auction with (rowlock) set BuyerAID = @BuyerAID, BuyerGID = @BuyerGID, BuyerName = @BuyerName, NowPrice = @NowPrice where AuctionID=@AuctionID
GO
/****** Object:  StoredProcedure [dbo].[UpdateBattleFieldInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateBattleFieldInfo]
 @gid int,
 @camp char(2),
 @x smallint,
 @y smallint
AS
 if exists (select * from BattleFieldInfo Where GID = @gid)
  Update BattleFieldInfo set Camp = @camp, x = @x, y = @y Where GID = @gid
 else
  Insert BattleFieldInfo Values (@gid, @camp, @x, @y)
GO
/****** Object:  StoredProcedure [dbo].[UpdateAuction]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpdateAuction]
	@AuctionID	int,
	@BuyerAID	int,
	@BuyerGID	int,
	@BuyerName	char(24),
	@NowPrice	int
AS
update Auction with (rowlock) set BuyerAID = @BuyerAID,  BuyerGID = @BuyerGID, BuyerName  = @BuyerName, NowPrice  = @NowPrice where AuctionID = @AuctionID
GO
/****** Object:  StoredProcedure [dbo].[UpdateAgit]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAgit]
	@mapName	varchar(16),
    @guildID    int,   
    @economy    int,   
    @defense    int,   
    @triggerE   int,  
    @triggerD   int,  
    @nextTime   int,  
    @payTime    int,   
    @createTime int,
    @visibleC   tinyint,  
    @visibleG0   tinyint,  
    @visibleG1   tinyint,  
    @visibleG2   tinyint,  
    @visibleG3   tinyint,  
    @visibleG4   tinyint,  
    @visibleG5   tinyint,  
    @visibleG6   tinyint,  
    @visibleG7   tinyint  
AS
update Agit with (rowlock) set GDID=@guildID, economy=@economy, defense=@defense, triggerE=@triggerE, 
                               triggerD=@triggerD, nextTime=@nextTime, payTime=@payTime, createTime=@createTime,
                               visibleC=@visibleC,
                               visibleG0=@visibleG0, visibleG1=@visibleG1, visibleG2=@visibleG2, visibleG3=@visibleG3,
                               visibleG4=@visibleG4, visibleG5=@visibleG5, visibleG6=@visibleG6, visibleG7=@visibleG7              
        where mapName=@mapName
GO
/****** Object:  StoredProcedure [dbo].[UpadteMapInfo]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[UpadteMapInfo] 
	@AID int,
	@MapName varchar(16),
	@xPos int,
	@yPos int,
	@restartMapName varchar(16),
	@sxPos int,
	@syPos int
AS

update charinfo 
with (rowlock) 
set mapname=@MapName, xPos=@xPos, yPos=@yPos, restartMapName=@restartMapName, sxPos=@sxPos, syPos=@syPos
where aid=@AID
GO
/****** Object:  StoredProcedure [dbo].[virtue_5Percent_cnt]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- charinfo 테이블의 virtue 필드에서 
-- virtue < 0 인 값 중, 하위 5%의 최대값 구하기
-- 수행 : exec virtue_5Percent
CREATE PROC [dbo].[virtue_5Percent_cnt]
AS
BEGIN
	declare @v_cnt int
	declare @v_pcnt	int
	set @v_cnt = (select count(*) from charinfo where virtue < 0 )
	set @v_pcnt = cast(round((@v_cnt * 0.05),-1) as bigint)
	
	set ROWCOUNT @v_pcnt
	
	select aid, virtue
	into #temp_virtue
	from charinfo where virtue < 0 
	order by virtue
	set ROWCOUNT 1
	select virtue from #temp_virtue
	order by virtue desc, aid
	drop table #temp_virtue
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePetName]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePetName]
	@PETID		int,
    @Name       varchar(24)
AS
update Pet with (rowlock) set Name=@Name, Modified = 1 where PETID=@PETID
GO
/****** Object:  StoredProcedure [dbo].[UpdatePetFR]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePetFR]
	@PETID		int,
	@Fullness	int,
	@Relation	int
AS
update Pet with (rowlock) set Fullness=@Fullness, Relation=@Relation where PETID=@PETID
GO
/****** Object:  StoredProcedure [dbo].[UpdatePetAcc]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePetAcc]
	@PETID		int,
    @Accessary  int
AS
update Pet with (rowlock) set Accessary=@Accessary where PETID=@PETID
GO
/****** Object:  StoredProcedure [dbo].[UpdatePartyBooking]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
	5. 파티부킹 데이터 변경
*/
CREATE PROCEDURE [dbo].[UpdatePartyBooking]
	@GID		INT,
	@Job1		SMALLINT,
	@Job2		SMALLINT,
	@Job3		SMALLINT,
	@Job4		SMALLINT,
	@Job5		SMALLINT,
	@Job6		SMALLINT
AS
SET NOCOUNT ON
	UPDATE PartyBooking SET Job1 = @Job1, Job2 = @Job2, Job3 = @Job3, Job4 = @Job4, Job5 = @Job5, Job6 = @Job6
	WHERE GID = @GID
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_zsvr_boot]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_zsvr_boot]  
 @ZSID INT  
AS  
 SET NOCOUNT ON  
   
   
 -- 길드창고가 적용되었을 때만 이 쿼리를 실행해야 한다.  
 UPDATE [GuildStore] SET [PermGID] = 0, [ZSID] = 0 WHERE [ZSID] = @ZSID;  
   
 SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateGuildStorePermGID2]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateGuildStorePermGID2]
	@GDID				int,
	@GID				int = 0,
	@ZSID				int = 0
AS
SET NOCOUNT ON
IF EXISTS(SELECT [StoreItem] FROM [GuildStore] WHERE [GDID] = @GDID)
	BEGIN
		UPDATE [GuildStore] SET [PermGID] = @GID, [ZSID] = @ZSID WHERE [GDID] = @GDID
	END
ELSE
	BEGIN
		INSERT INTO [GuildStore]
		(
			[GDID],
			[StoreItem],
			[PermGID],
			[ZSID]
		)
		VALUES
		(
			@GDID,
			NULL,
			@GID,
			@ZSID
		)
	END
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_updateguildstore]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_updateguildstore]
	@GDID				int,
	@Data				varbinary(MAX) = NULL
AS
SET NOCOUNT ON
IF EXISTS(SELECT [StoreItem] FROM [GuildStore] WHERE [GDID] = @GDID)
	BEGIN
		UPDATE [GuildStore] SET [StoreItem] = @Data WHERE [GDID] = @GDID
	END
ELSE
	BEGIN
		INSERT INTO [GuildStore]
		(
			[GDID],
			[StoreItem]
		)
		VALUES
		(
			@GDID,
			@Data
		)
	END
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_update_quest]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_update_quest]
	@gid			int,
	@qid			int,
	@complete		bit,
	@activ			bit,
	@hm_1_id		int,
	@hm_1_count		int,
	@hm_2_id		int,
	@hm_2_count		int,
	@hm_3_id		int,
	@hm_3_count		int,
	@mission_time		datetime
AS
BEGIN
SET NOCOUNT ON
DECLARE @count int
SET @count = 0
SELECT @count = count(*) FROM QuestInfo WHERE gid=@gid AND qid=@qid
IF (@count < 1)
	BEGIN
		EXEC usp_insert_quest @gid, @qid, @complete, @activ, @hm_1_id, @hm_1_count, @hm_2_id, @hm_2_count, @hm_3_id, @hm_3_count, @mission_time
	END
ELSE
	BEGIN
		IF @complete = 0
			BEGIN
				UPDATE QuestInfo SET complete=0, activ=@activ, hunt_1_mob_id=@hm_1_id, hunt_1_count=@hm_1_count, hunt_2_mob_id=@hm_2_id, hunt_2_count=@hm_2_count, hunt_3_mob_id=@hm_3_id, hunt_3_count=@hm_3_count, mission_time=@mission_time
				WHERE gid=@gid and qid=@qid
			END
		ELSE
			BEGIN
				UPDATE QuestInfo SET complete=1, activ=@activ, hunt_1_mob_id=@hm_1_id, hunt_1_count=@hm_1_count, hunt_2_mob_id=@hm_2_id, hunt_2_count=@hm_2_count, hunt_3_mob_id=@hm_3_id, hunt_3_count=@hm_3_count, mission_time=@mission_time, CompleteTime=getdate()
				WHERE gid=@gid AND qid=@qid
			END
		END
SET NOCOUNT OFF
END

GRANT EXEC ON usp_selectQuest TO Character
GO
/****** Object:  StoredProcedure [dbo].[usp_get_item_serial_num]    Script Date: 02/16/2018 13:52:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_get_item_serial_num]
AS

	SET NOCOUNT ON

	BEGIN TRAN 

	DECLARE @serial_num BIGINT
	DECLARE @error INT
	SET @serial_num = 0
	SET @error = 0
	

	DECLARE @ObserverItemSerialSeed BIGINT
	DECLARE @ObserverItemSerialSequenceNum BIGINT
	SELECT  @ObserverItemSerialSeed = CONVERT(BIGINT,ObserverItemSerialSeed),
		@ObserverItemSerialSequenceNum = CONVERT(BIGINT,ObserverItemSerialSequenceNum)
		 FROM Configuration WHERE [Identity]=1
	IF @@rowcount = 1 
	BEGIN
		IF @ObserverItemSerialSeed = 0 OR @ObserverItemSerialSequenceNum >= 0x7FFFFFFF
		BEGIN	
			DECLARE @svr_boot_sequence_error INT
			DECLARE @svr_boot_sequence_num INT
			
			CREATE TABLE #tempTbl(svr_boot_sequence_error INT,svr_boot_sequence_num INT) --임시테이블을 작성한다.
			INSERT #tempTbl EXEC usp_get_new_svr_boot_squence_num
			IF @@rowcount = 1
			BEGIN
				SELECT TOP 1 @svr_boot_sequence_error = svr_boot_sequence_error,@svr_boot_sequence_num = svr_boot_sequence_num FROM #tempTbl
				IF @@rowcount = 1
				BEGIN
					IF @svr_boot_sequence_error = 0  -- 정상처리
					BEGIN
						UPDATE Configuration SET ObserverItemSerialSeed=@svr_boot_sequence_num,ObserverItemSerialSequenceNum=0 WHERE [Identity]=1
						IF @@rowcount != 1 SET @error = 1
					END
					ELSE SET @error = 1	
				END
				ELSE SET @error=1
			END
			ELSE SET @error =1
			DROP TABLE #tempTbl -- 받드시 임시테이블을 삭제하여야 한다.
		END
		--ELSE시에도 오류가 아니다. 주의하라. 새로운 부트 시퀀스값을 설정할 필요가 없을뿐이다.

		IF @error = 0 
		BEGIN
			UPDATE Configuration SET ObserverItemSerialSequenceNum = ObserverItemSerialSequenceNum+1 WHERE [Identity]=1
			IF @@rowcount = 1
			BEGIN
				SELECT  @ObserverItemSerialSeed                = CONVERT(BIGINT,ObserverItemSerialSeed),
					@ObserverItemSerialSequenceNum = CONVERT(BIGINT,ObserverItemSerialSequenceNum)
				 	FROM Configuration WHERE [Identity]=1
				IF @@rowcount = 1  SET @serial_num = @ObserverItemSerialSeed * POWER(CONVERT(BIGINT,2),32) + @ObserverItemSerialSequenceNum
				ELSE                       SET @error =1
			END
			ELSE SET @error =1
		END

	END
	ELSE SET @error =1


	IF @error = 0  COMMIT TRAN
	ELSE
	BEGIN
		SET @serial_num = 0
	             ROLLBACK TRAN	
	END

	SELECT @serial_num
	SET NOCOUNT OFF
GO
/****** Object:  Default [DF_CoupleInfo2_weddingTime2]    Script Date: 02/16/2018 13:52:08 ******/
ALTER TABLE [dbo].[CoupleInfo2] ADD  CONSTRAINT [DF_CoupleInfo2_weddingTime2]  DEFAULT (getdate()) FOR [weddingTime2]
GO
/****** Object:  Default [DF__Configura__Obser__62E4AA3C]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [ObserverItemSerialSeed]
GO
/****** Object:  Default [DF__Configura__Obser__63D8CE75]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [ObserverItemSerialSequenceNum]
GO
/****** Object:  Default [DF_charinfo_job]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_job]  DEFAULT ((0)) FOR [job]
GO
/****** Object:  Default [DF_charinfo_clevel]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_clevel]  DEFAULT ((1)) FOR [clevel]
GO
/****** Object:  Default [DF_charinfo_sppoint]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_sppoint]  DEFAULT ((0)) FOR [sppoint]
GO
/****** Object:  Default [DF_charinfo_exp]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_exp]  DEFAULT ((0)) FOR [exp]
GO
/****** Object:  Default [DF_charinfo_jobpoint]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_jobpoint]  DEFAULT ((0)) FOR [jobpoint]
GO
/****** Object:  Default [DF_charinfo_STR]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_STR]  DEFAULT ((0)) FOR [STR]
GO
/****** Object:  Default [DF_charinfo_hp]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_hp]  DEFAULT ((40)) FOR [hp]
GO
/****** Object:  Default [DF_charinfo_maxhp]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_maxhp]  DEFAULT ((40)) FOR [maxhp]
GO
/****** Object:  Default [DF_charinfo_sp]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_sp]  DEFAULT ((10)) FOR [sp]
GO
/****** Object:  Default [DF_charinfo_maxsp]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_maxsp]  DEFAULT ((10)) FOR [maxsp]
GO
/****** Object:  Default [DF_charinfo_GuildID]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_GuildID]  DEFAULT ((0)) FOR [GuildID]
GO
/****** Object:  Default [DF_charinfo_CharNum]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_CharNum]  DEFAULT ((0)) FOR [CharNum]
GO
/****** Object:  Default [DF_charinfo_speed]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_speed]  DEFAULT ((150)) FOR [speed]
GO
/****** Object:  Default [DF_charinfo_money]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_money]  DEFAULT ((0)) FOR [money]
GO
/****** Object:  Default [DF_charinfo_jobexp]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_jobexp]  DEFAULT ((0)) FOR [jobexp]
GO
/****** Object:  Default [DF_charinfo_virtue]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_virtue]  DEFAULT ((0)) FOR [virtue]
GO
/****** Object:  Default [DF_charinfo_honor]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_honor]  DEFAULT ((0)) FOR [honor]
GO
/****** Object:  Default [DF_charinfo_haircolor]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_haircolor]  DEFAULT ((0)) FOR [haircolor]
GO
/****** Object:  Default [DF_charinfo_joblevel]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_joblevel]  DEFAULT ((1)) FOR [joblevel]
GO
/****** Object:  Default [DF_charinfo_bodystate]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_bodystate]  DEFAULT ((0)) FOR [bodystate]
GO
/****** Object:  Default [DF_charinfo_healthstate]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_healthstate]  DEFAULT ((0)) FOR [healthstate]
GO
/****** Object:  Default [DF_charinfo_effectstate]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_effectstate]  DEFAULT ((0)) FOR [effectstate]
GO
/****** Object:  Default [DF_charinfo_head]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_head]  DEFAULT ((0)) FOR [head]
GO
/****** Object:  Default [DF_charinfo_weapon]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_weapon]  DEFAULT ((0)) FOR [weapon]
GO
/****** Object:  Default [DF_charinfo_accessory]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_accessory]  DEFAULT ((0)) FOR [accessory]
GO
/****** Object:  Default [DF_charinfo_headPalette]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_headPalette]  DEFAULT ((0)) FOR [headPalette]
GO
/****** Object:  Default [DF_charinfo_bodyPalette]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_bodyPalette]  DEFAULT ((0)) FOR [bodyPalette]
GO
/****** Object:  Default [DF_charinfo_accessory2]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_accessory2]  DEFAULT ((0)) FOR [accessory2]
GO
/****** Object:  Default [DF_charinfo_accessory3]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_accessory3]  DEFAULT ((0)) FOR [accessory3]
GO
/****** Object:  Default [DF_charinfo_delrevdate]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_delrevdate]  DEFAULT ('1970-01-01 01:00:00.000') FOR [delrevdate]
GO
/****** Object:  Default [DF_charinfo_Shield]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF_charinfo_Shield]  DEFAULT ((0)) FOR [Shield]
GO
/****** Object:  Default [DF__charinfo__party___093F5D4E]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF__charinfo__party___093F5D4E]  DEFAULT ((0)) FOR [party_config]
GO
/****** Object:  Default [DF__charinfo__equipw__15A53433]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF__charinfo__equipw__15A53433]  DEFAULT ((0)) FOR [equipwinopen]
GO
/****** Object:  Default [DF__charinfo__font__1C5231C2]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF__charinfo__font__1C5231C2]  DEFAULT ((0)) FOR [font]
GO
/****** Object:  Default [DF__charinfo__bisCha__1D4655FB]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF__charinfo__bisCha__1D4655FB]  DEFAULT ((1)) FOR [bisChangedCharName]
GO
/****** Object:  Default [DF__charinfo__robepa__2630A1B7]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[charinfo] ADD  CONSTRAINT [DF__charinfo__robepa__2630A1B7]  DEFAULT ((0)) FOR [robepalette]
GO
/****** Object:  Default [DF_Banking_LastDate]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Banking] ADD  CONSTRAINT [DF_Banking_LastDate]  DEFAULT (getdate()) FOR [LastDate]
GO
/****** Object:  Default [DF_Agit_GDID]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_GDID]  DEFAULT ((0)) FOR [GDID]
GO
/****** Object:  Default [DF_Agit_economy]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_economy]  DEFAULT ((1)) FOR [economy]
GO
/****** Object:  Default [DF_Agit_defense]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_defense]  DEFAULT ((1)) FOR [defense]
GO
/****** Object:  Default [DF_Agit_triggerE]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_triggerE]  DEFAULT ((0)) FOR [triggerE]
GO
/****** Object:  Default [DF_Agit_triggerD]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_triggerD]  DEFAULT ((0)) FOR [triggerD]
GO
/****** Object:  Default [DF_Agit_nextTime]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_nextTime]  DEFAULT ((0)) FOR [nextTime]
GO
/****** Object:  Default [DF_Agit_payTime]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_payTime]  DEFAULT ((0)) FOR [payTime]
GO
/****** Object:  Default [DF_Agit_createTime]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_createTime]  DEFAULT ((0)) FOR [createTime]
GO
/****** Object:  Default [DF_Agit_visibleC]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_visibleC]  DEFAULT ((0)) FOR [visibleC]
GO
/****** Object:  Default [DF_Agit_visibleG0]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_visibleG0]  DEFAULT ((1)) FOR [visibleG0]
GO
/****** Object:  Default [DF_Agit_visibleG1]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_visibleG1]  DEFAULT ((1)) FOR [visibleG1]
GO
/****** Object:  Default [DF_Agit_visibleG2]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_visibleG2]  DEFAULT ((1)) FOR [visibleG2]
GO
/****** Object:  Default [DF_Agit_visibleG3]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_visibleG3]  DEFAULT ((1)) FOR [visibleG3]
GO
/****** Object:  Default [DF_Agit_visibleG4]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_visibleG4]  DEFAULT ((1)) FOR [visibleG4]
GO
/****** Object:  Default [DF_Agit_visibleG5]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_visibleG5]  DEFAULT ((1)) FOR [visibleG5]
GO
/****** Object:  Default [DF_Agit_visibleG6]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_visibleG6]  DEFAULT ((1)) FOR [visibleG6]
GO
/****** Object:  Default [DF_Agit_visibleG7]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Agit] ADD  CONSTRAINT [DF_Agit_visibleG7]  DEFAULT ((1)) FOR [visibleG7]
GO
/****** Object:  Default [DF_Family_Time2]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Family] ADD  CONSTRAINT [DF_Family_Time2]  DEFAULT (getdate()) FOR [Time2]
GO
/****** Object:  Default [DF_HomunLog_Date]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Homun] ADD  CONSTRAINT [DF_HomunLog_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF__guildinfodb__mid__2A01329B]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[GuildInfoDB] ADD  CONSTRAINT [DF__guildinfodb__mid__2A01329B]  DEFAULT ((0)) FOR [mid]
GO
/****** Object:  Default [DF_GuildBanishInfo_date]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[GuildBanishInfo] ADD  CONSTRAINT [DF_GuildBanishInfo_date]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF_GroupInfo_GroupOption]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[GroupInfo] ADD  CONSTRAINT [DF_GroupInfo_GroupOption]  DEFAULT ((1)) FOR [GroupOption]
GO
/****** Object:  Default [DF_GlobalVar_value]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[GlobalVar] ADD  CONSTRAINT [DF_GlobalVar_value]  DEFAULT ((0)) FOR [VarValue]
GO
/****** Object:  Default [DF__mercenary___call__53E25DCE]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_owner] ADD  CONSTRAINT [DF__mercenary___call__53E25DCE]  DEFAULT ((0)) FOR [call]
GO
/****** Object:  Default [DF__mercenary__arch___54D68207]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_owner] ADD  CONSTRAINT [DF__mercenary__arch___54D68207]  DEFAULT ((0)) FOR [arch_total_call_num]
GO
/****** Object:  Default [DF__mercenary__arch___55CAA640]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_owner] ADD  CONSTRAINT [DF__mercenary__arch___55CAA640]  DEFAULT ((0)) FOR [arch_faith]
GO
/****** Object:  Default [DF__mercenary__spear__56BECA79]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_owner] ADD  CONSTRAINT [DF__mercenary__spear__56BECA79]  DEFAULT ((0)) FOR [spear_total_call_num]
GO
/****** Object:  Default [DF__mercenary__spear__57B2EEB2]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_owner] ADD  CONSTRAINT [DF__mercenary__spear__57B2EEB2]  DEFAULT ((0)) FOR [spear_faith]
GO
/****** Object:  Default [DF__mercenary__sword__58A712EB]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_owner] ADD  CONSTRAINT [DF__mercenary__sword__58A712EB]  DEFAULT ((0)) FOR [sword_total_call_num]
GO
/****** Object:  Default [DF__mercenary__sword__599B3724]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_owner] ADD  CONSTRAINT [DF__mercenary__sword__599B3724]  DEFAULT ((0)) FOR [sword_faith]
GO
/****** Object:  Default [DF__mercenary__bodys__5F54107A]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_info] ADD  CONSTRAINT [DF__mercenary__bodys__5F54107A]  DEFAULT ((0)) FOR [bodystate]
GO
/****** Object:  Default [DF__mercenary__healt__604834B3]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_info] ADD  CONSTRAINT [DF__mercenary__healt__604834B3]  DEFAULT ((0)) FOR [healthstate]
GO
/****** Object:  Default [DF__mercenary__effec__613C58EC]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_info] ADD  CONSTRAINT [DF__mercenary__effec__613C58EC]  DEFAULT ((0)) FOR [effectstate]
GO
/****** Object:  Default [DF__mercenary__prope__62307D25]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_info] ADD  CONSTRAINT [DF__mercenary__prope__62307D25]  DEFAULT ((0)) FOR [property]
GO
/****** Object:  Default [DF__mercenary__appmo__6324A15E]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_info] ADD  CONSTRAINT [DF__mercenary__appmo__6324A15E]  DEFAULT ((0)) FOR [appmob_kill_cnt]
GO
/****** Object:  Default [DF__mercenary_in__hp__6418C597]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_info] ADD  CONSTRAINT [DF__mercenary_in__hp__6418C597]  DEFAULT ((1)) FOR [hp]
GO
/****** Object:  Default [DF__mercenary_in__sp__650CE9D0]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_info] ADD  CONSTRAINT [DF__mercenary_in__sp__650CE9D0]  DEFAULT ((0)) FOR [sp]
GO
/****** Object:  Default [DF__mercenary__state__297722B6]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[mercenary_effect] ADD  DEFAULT (NULL) FOR [state]
GO
/****** Object:  Default [DF_MannerPoint_time]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[MannerPoint] ADD  CONSTRAINT [DF_MannerPoint_time]  DEFAULT (getdate()) FOR [time]
GO
/****** Object:  Default [DF_QuestInfo_complete]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_complete]  DEFAULT ((0)) FOR [complete]
GO
/****** Object:  Default [DF_QuestInfo_activ]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_activ]  DEFAULT ((1)) FOR [activ]
GO
/****** Object:  Default [DF_QuestInfo_hunt_1_mob_id]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_hunt_1_mob_id]  DEFAULT ((0)) FOR [hunt_1_mob_id]
GO
/****** Object:  Default [DF_QuestInfo_hunt_1_count]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_hunt_1_count]  DEFAULT ((0)) FOR [hunt_1_count]
GO
/****** Object:  Default [DF_QuestInfo_hunt_2_mob_id]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_hunt_2_mob_id]  DEFAULT ((0)) FOR [hunt_2_mob_id]
GO
/****** Object:  Default [DF_QuestInfo_hunt_2_count]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_hunt_2_count]  DEFAULT ((0)) FOR [hunt_2_count]
GO
/****** Object:  Default [DF_QuestInfo_hunt_3_mob_id]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_hunt_3_mob_id]  DEFAULT ((0)) FOR [hunt_3_mob_id]
GO
/****** Object:  Default [DF_QuestInfo_hunt_3_count]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_hunt_3_count]  DEFAULT ((0)) FOR [hunt_3_count]
GO
/****** Object:  Default [DF_QuestInfo_mission_time]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_mission_time]  DEFAULT ((0)) FOR [mission_time]
GO
/****** Object:  Default [DF_QuestInfo_ReceiveTime]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestInfo] ADD  CONSTRAINT [DF_QuestInfo_ReceiveTime]  DEFAULT (getdate()) FOR [ReceiveTime]
GO
/****** Object:  Default [DF_QuestEvent_CompleteQuest]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[QuestEvent] ADD  CONSTRAINT [DF_QuestEvent_CompleteQuest]  DEFAULT (NULL) FOR [CompleteQuest]
GO
/****** Object:  Default [DF_PvPScore_WinTime]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[PvPScore] ADD  CONSTRAINT [DF_PvPScore_WinTime]  DEFAULT ((0)) FOR [WinTime]
GO
/****** Object:  Default [DF__PartyBook__MapID__249D5F00]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[PartyBooking] ADD  CONSTRAINT [DF__PartyBook__MapID__249D5F00]  DEFAULT ((0)) FOR [MapID]
GO
/****** Object:  Default [DF__PartyBook__Level__25918339]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[PartyBooking] ADD  CONSTRAINT [DF__PartyBook__Level__25918339]  DEFAULT ((0)) FOR [Level]
GO
/****** Object:  Default [DF__PartyBooki__Job1__2685A772]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[PartyBooking] ADD  CONSTRAINT [DF__PartyBooki__Job1__2685A772]  DEFAULT ((-1)) FOR [Job1]
GO
/****** Object:  Default [DF__PartyBooki__Job2__2779CBAB]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[PartyBooking] ADD  CONSTRAINT [DF__PartyBooki__Job2__2779CBAB]  DEFAULT ((-1)) FOR [Job2]
GO
/****** Object:  Default [DF__PartyBooki__Job3__286DEFE4]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[PartyBooking] ADD  CONSTRAINT [DF__PartyBooki__Job3__286DEFE4]  DEFAULT ((-1)) FOR [Job3]
GO
/****** Object:  Default [DF__PartyBooki__Job4__2962141D]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[PartyBooking] ADD  CONSTRAINT [DF__PartyBooki__Job4__2962141D]  DEFAULT ((-1)) FOR [Job4]
GO
/****** Object:  Default [DF__PartyBooki__Job5__2A563856]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[PartyBooking] ADD  CONSTRAINT [DF__PartyBooki__Job5__2A563856]  DEFAULT ((-1)) FOR [Job5]
GO
/****** Object:  Default [DF__PartyBooki__Job6__2B4A5C8F]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[PartyBooking] ADD  CONSTRAINT [DF__PartyBooki__Job6__2B4A5C8F]  DEFAULT ((-1)) FOR [Job6]
GO
/****** Object:  Default [DF__Skill_Rebu__Attr__34E8D562]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Skill_Rebuild] ADD  DEFAULT ((0)) FOR [Attr]
GO
/****** Object:  Default [DF__Skill_Rebu__Data__35DCF99B]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Skill_Rebuild] ADD  DEFAULT ((0)) FOR [Data]
GO
/****** Object:  Default [DF__Skill_Hom__Remai__36D11DD4]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Skill_HomunRebuild] ADD  DEFAULT ((0)) FOR [RemainMS]
GO
/****** Object:  Default [DF__Skill_Homu__Attr__37C5420D]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Skill_HomunRebuild] ADD  DEFAULT ((0)) FOR [Attr]
GO
/****** Object:  Default [DF__Skill_Homu__Data__38B96646]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[Skill_HomunRebuild] ADD  DEFAULT ((0)) FOR [Data]
GO
/****** Object:  Default [DF_ShortCutKeyDB_Ver]    Script Date: 02/16/2018 13:52:10 ******/
ALTER TABLE [dbo].[ShortCutKeyDB] ADD  CONSTRAINT [DF_ShortCutKeyDB_Ver]  DEFAULT ((1)) FOR [Ver]
GO
