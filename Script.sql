USE [master]
GO
/****** Object:  Database [Script]    Script Date: 02/16/2018 13:54:04 ******/
CREATE DATABASE [Script] ON  PRIMARY 
( NAME = N'Script_Data', FILENAME = N'C:\AEGIS\DB\Script_Data.MDF' , SIZE = 10048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Script_Log', FILENAME = N'C:\AEGIS\DB\Script_Log.LDF' , SIZE = 10048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Script] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Script].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Script] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Script] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Script] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Script] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Script] SET ARITHABORT OFF
GO
ALTER DATABASE [Script] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Script] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Script] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Script] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Script] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Script] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Script] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Script] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Script] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Script] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Script] SET  ENABLE_BROKER
GO
ALTER DATABASE [Script] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Script] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Script] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Script] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Script] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Script] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Script] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Script] SET  READ_WRITE
GO
ALTER DATABASE [Script] SET RECOVERY FULL
GO
ALTER DATABASE [Script] SET  MULTI_USER
GO
ALTER DATABASE [Script] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [Script] SET DB_CHAINING OFF
GO
USE [Script]
GO
/****** Object:  User [script]    Script Date: 02/16/2018 13:54:04 ******/
CREATE USER [script] FOR LOGIN [script] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[fsm]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fsm](
	[npcType] [nvarchar](510) NULL,
	[state] [nvarchar](510) NULL,
	[inputType] [nvarchar](510) NULL,
	[outputType] [nvarchar](510) NULL,
	[outputState] [nvarchar](510) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirstJobExpParameter3]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirstJobExpParameter3](
	[Level] [smallint] NOT NULL,
	[exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirstJobExpParameter2]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirstJobExpParameter2](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirstJobExpParameter]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirstJobExpParameter](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpParameter3]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpParameter3](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL,
 CONSTRAINT [PK_ExpParameter3] PRIMARY KEY CLUSTERED 
(
	[level] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpParameter2]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpParameter2](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpParameter]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpParameter](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[event](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
 CONSTRAINT [PK_event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[charMotionTime]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[charMotionTime](
	[jobname] [varchar](16) NULL,
	[attackMT] [int] NOT NULL,
	[attackedMT] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CashPointItem]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CashPointItem](
	[ID] [smallint] NOT NULL,
	[Name] [varchar](50) NULL,
	[PRICE] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[ChangeItemID] [smallint] NOT NULL,
	[Count] [int] NOT NULL,
	[Ect] [char](40) NULL,
 CONSTRAINT [PK_CashPointItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[card]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[card](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[compositionType] [int] NOT NULL,
	[compositionPos] [int] NOT NULL,
	[class] [int] NOT NULL,
	[property] [int] NOT NULL,
 CONSTRAINT [PK_card] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cannonball]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cannonball](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[ATK] [int] NOT NULL,
	[PROPERTY] [int] NOT NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Idx_cannonball] ON [dbo].[cannonball] 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bow]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bow](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[ATK] [int] NOT NULL,
	[AR] [int] NOT NULL,
	[SLOT] [int] NOT NULL,
	[STR] [int] NOT NULL,
	[INT] [int] NOT NULL,
	[VIT] [int] NOT NULL,
	[DEX] [int] NOT NULL,
	[AGI] [int] NOT NULL,
	[LUK] [int] NOT NULL,
	[CLASS] [smallint] NOT NULL,
	[EFFECT] [varchar](16) NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[SEX] [int] NOT NULL,
	[EQUIP] [int] NOT NULL,
	[level] [int] NULL,
	[LOCA] [int] NOT NULL,
	[property] [int] NOT NULL,
	[IsRefinable] [int] NOT NULL,
	[IsDamagable] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_bow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bothhand]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bothhand](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[ATK] [int] NOT NULL,
	[MATK] [int] NULL,
	[AR] [int] NOT NULL,
	[SLOT] [int] NOT NULL,
	[STR] [int] NOT NULL,
	[INT] [int] NOT NULL,
	[VIT] [int] NOT NULL,
	[DEX] [int] NOT NULL,
	[AGI] [int] NOT NULL,
	[LUK] [int] NOT NULL,
	[CLASS] [smallint] NOT NULL,
	[EFFECT] [varchar](16) NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[SEX] [int] NOT NULL,
	[EQUIP] [int] NOT NULL,
	[level] [int] NULL,
	[LOCA] [int] NOT NULL,
	[property] [int] NOT NULL,
	[IsRefinable] [int] NOT NULL,
	[IsDamagable] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_bothhand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[arrow]    Script Date: 02/16/2018 13:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[arrow](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[ATK] [int] NOT NULL,
	[PROPERTY] [int] NOT NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_arrow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[armorTMB]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[armorTMB](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[DEF] [int] NOT NULL,
	[SLOT] [int] NULL,
	[STR] [int] NOT NULL,
	[INT] [int] NOT NULL,
	[VIT] [int] NOT NULL,
	[DEX] [int] NOT NULL,
	[AGI] [int] NOT NULL,
	[LUK] [int] NOT NULL,
	[MHP] [int] NOT NULL,
	[MSP] [int] NOT NULL,
	[EFFECT] [varchar](16) NULL,
	[PRICE] [int] NULL,
	[WEIGHT] [int] NOT NULL,
	[SEX] [int] NOT NULL,
	[EQUIP] [int] NULL,
	[LOCA] [int] NOT NULL,
	[MDEF] [int] NOT NULL,
	[CLASS] [smallint] NULL,
	[IsRefinable] [int] NOT NULL,
	[IsDamagable] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_armorTMB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[armorTM]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[armorTM](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[DEF] [int] NOT NULL,
	[SLOT] [int] NULL,
	[STR] [int] NOT NULL,
	[INT] [int] NOT NULL,
	[VIT] [int] NOT NULL,
	[DEX] [int] NOT NULL,
	[AGI] [int] NOT NULL,
	[LUK] [int] NOT NULL,
	[MHP] [int] NOT NULL,
	[MSP] [int] NOT NULL,
	[EFFECT] [varchar](16) NULL,
	[PRICE] [int] NULL,
	[WEIGHT] [int] NOT NULL,
	[SEX] [int] NOT NULL,
	[EQUIP] [int] NULL,
	[LOCA] [int] NOT NULL,
	[MDEF] [int] NOT NULL,
	[CLASS] [smallint] NULL,
	[IsRefinable] [int] NOT NULL,
	[IsDamagable] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_armorTM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[armorTB]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[armorTB](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[DEF] [int] NOT NULL,
	[SLOT] [int] NULL,
	[STR] [int] NOT NULL,
	[INT] [int] NOT NULL,
	[VIT] [int] NOT NULL,
	[DEX] [int] NOT NULL,
	[AGI] [int] NOT NULL,
	[LUK] [int] NOT NULL,
	[MHP] [int] NOT NULL,
	[MSP] [int] NOT NULL,
	[EFFECT] [varchar](16) NULL,
	[PRICE] [int] NULL,
	[WEIGHT] [int] NOT NULL,
	[SEX] [int] NOT NULL,
	[EQUIP] [int] NULL,
	[LOCA] [int] NOT NULL,
	[MDEF] [int] NOT NULL,
	[CLASS] [smallint] NULL,
	[IsRefinable] [int] NOT NULL,
	[IsDamagable] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_armorTB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[armorMB]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[armorMB](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[DEF] [int] NOT NULL,
	[SLOT] [int] NULL,
	[STR] [int] NOT NULL,
	[INT] [int] NOT NULL,
	[VIT] [int] NOT NULL,
	[DEX] [int] NOT NULL,
	[AGI] [int] NOT NULL,
	[LUK] [int] NOT NULL,
	[MHP] [int] NOT NULL,
	[MSP] [int] NOT NULL,
	[EFFECT] [varchar](16) NULL,
	[PRICE] [int] NULL,
	[WEIGHT] [int] NOT NULL,
	[SEX] [int] NOT NULL,
	[EQUIP] [int] NULL,
	[LOCA] [int] NOT NULL,
	[MDEF] [int] NOT NULL,
	[CLASS] [smallint] NULL,
	[IsRefinable] [int] NOT NULL,
	[IsDamagable] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_armorMB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[armor]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[armor](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[DEF] [int] NOT NULL,
	[SLOT] [int] NULL,
	[STR] [int] NOT NULL,
	[INT] [int] NOT NULL,
	[VIT] [int] NOT NULL,
	[DEX] [int] NOT NULL,
	[AGI] [int] NOT NULL,
	[LUK] [int] NOT NULL,
	[MHP] [int] NOT NULL,
	[MSP] [int] NOT NULL,
	[EFFECT] [varchar](16) NULL,
	[PRICE] [int] NULL,
	[WEIGHT] [int] NOT NULL,
	[SEX] [int] NOT NULL,
	[EQUIP] [int] NULL,
	[LOCA] [int] NOT NULL,
	[MDEF] [int] NOT NULL,
	[CLASS] [smallint] NULL,
	[IsRefinable] [int] NOT NULL,
	[IsDamagable] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_armor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ammo]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ammo](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[ATK] [int] NOT NULL,
	[PROPERTY] [int] NOT NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_ammo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThrowWeapon]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThrowWeapon](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[ATK] [int] NOT NULL,
	[PROPERTY] [int] NOT NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[EQUIP] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_ThrowWeapon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThirdJobExpParameter]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThirdJobExpParameter](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL,
 CONSTRAINT [PK_ThirdJobExpParameter] PRIMARY KEY CLUSTERED 
(
	[level] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[special]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[special](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[EFFECT] [varchar](50) NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_special] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SkillTypeInfo]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillTypeInfo](
	[id] [nvarchar](255) NOT NULL,
	[explan] [ntext] NULL,
 CONSTRAINT [PK_SkillTypeInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillInfo]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SkillInfo](
	[ID] [int] NOT NULL,
	[NAME] [varchar](40) NULL,
	[explan] [varchar](20) NULL,
 CONSTRAINT [PK_SkillInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SecondJobExpParameter2]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondJobExpParameter2](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecondJobExpParameter]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondJobExpParameter](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoviceJobExpParameter2]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoviceJobExpParameter2](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoviceJobExpParameter]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoviceJobExpParameter](
	[level] [smallint] NOT NULL,
	[exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MVP]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MVP](
	[name] [varchar](24) NOT NULL,
	[expPercent] [int] NOT NULL,
	[itemName1] [varchar](24) NULL,
	[itemPercent1] [int] NOT NULL,
	[itemName2] [varchar](24) NULL,
	[itemPercent2] [int] NOT NULL,
	[itemName3] [varchar](24) NULL,
	[itemPercent3] [int] NOT NULL,
 CONSTRAINT [PK_MVP] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[monparameter_exp]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[monparameter_exp](
	[Name] [varchar](24) NULL,
	[aRan] [int] NOT NULL,
	[LV] [int] NOT NULL,
	[HP] [int] NOT NULL,
	[SP] [int] NOT NULL,
	[str] [int] NOT NULL,
	[int] [int] NOT NULL,
	[vit] [int] NOT NULL,
	[dex] [int] NOT NULL,
	[agi] [int] NOT NULL,
	[luk] [int] NOT NULL,
	[atk1] [int] NOT NULL,
	[atk2] [int] NOT NULL,
	[def] [int] NOT NULL,
	[exp] [int] NOT NULL,
	[jexp] [int] NOT NULL,
	[inc] [int] NOT NULL,
	[as] [int] NOT NULL,
	[es] [int] NOT NULL,
	[Mspeed] [int] NOT NULL,
	[rechargeTime] [int] NOT NULL,
	[attackedMT] [int] NOT NULL,
	[attackMT] [int] NOT NULL,
	[property] [int] NOT NULL,
	[scale] [int] NOT NULL,
	[class] [int] NOT NULL,
	[race] [int] NOT NULL,
	[mdef] [int] NOT NULL,
	[attr] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[monparameter]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[monparameter](
	[Name] [varchar](24) NOT NULL,
	[aRan] [int] NOT NULL,
	[LV] [int] NOT NULL,
	[HP] [int] NOT NULL,
	[SP] [int] NOT NULL,
	[str] [int] NOT NULL,
	[int] [int] NOT NULL,
	[vit] [int] NOT NULL,
	[dex] [int] NOT NULL,
	[agi] [int] NOT NULL,
	[luk] [int] NOT NULL,
	[atk1] [int] NOT NULL,
	[atk2] [int] NOT NULL,
	[def] [int] NOT NULL,
	[exp] [int] NOT NULL,
	[jexp] [int] NOT NULL,
	[inc] [int] NOT NULL,
	[as] [int] NOT NULL,
	[es] [int] NOT NULL,
	[Mspeed] [int] NOT NULL,
	[rechargeTime] [int] NOT NULL,
	[attackedMT] [int] NOT NULL,
	[attackMT] [int] NOT NULL,
	[property] [int] NOT NULL,
	[scale] [int] NOT NULL,
	[class] [int] NOT NULL,
	[race] [int] NOT NULL,
	[mdef] [int] NOT NULL,
	[attr] [int] NULL,
 CONSTRAINT [PK_monparameter] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[monmakingitem_exp]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[monmakingitem_exp](
	[Name] [varchar](24) NULL,
	[item1] [varchar](24) NULL,
	[percent1] [int] NOT NULL,
	[item2] [varchar](24) NULL,
	[percent2] [int] NOT NULL,
	[item3] [varchar](24) NULL,
	[percent3] [int] NOT NULL,
	[item4] [varchar](24) NULL,
	[percent4] [int] NOT NULL,
	[item5] [varchar](24) NULL,
	[percent5] [int] NOT NULL,
	[item6] [varchar](24) NULL,
	[percent6] [int] NOT NULL,
	[item7] [varchar](24) NULL,
	[percent7] [int] NOT NULL,
	[item8] [varchar](24) NULL,
	[percent8] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[monmakingitem]    Script Date: 02/16/2018 13:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[monmakingitem](
	[Name] [varchar](24) NOT NULL,
	[item1] [varchar](24) NULL,
	[percent1] [int] NOT NULL,
	[item2] [varchar](24) NULL,
	[percent2] [int] NOT NULL,
	[item3] [varchar](24) NULL,
	[percent3] [int] NOT NULL,
	[item4] [varchar](24) NULL,
	[percent4] [int] NOT NULL,
	[item5] [varchar](24) NULL,
	[percent5] [int] NOT NULL,
	[item6] [varchar](24) NULL,
	[percent6] [int] NOT NULL,
	[item7] [varchar](24) NULL,
	[percent7] [int] NOT NULL,
	[item8] [varchar](24) NULL,
	[percent8] [int] NOT NULL,
 CONSTRAINT [PK_monmakingitem] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_add_itemlog]    Script Date: 02/16/2018 13:54:08 ******/
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
/****** Object:  Table [dbo].[heal]    Script Date: 02/16/2018 13:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[heal](
	[ID] [smallint] NOT NULL,
	[Name] [varchar](24) NULL,
	[HPMIN] [int] NOT NULL,
	[HPMAX] [int] NOT NULL,
	[SPMIN] [int] NOT NULL,
	[SPMAX] [int] NOT NULL,
	[STATUS] [int] NOT NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[ABUSE_GAUGE] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_heal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gun]    Script Date: 02/16/2018 13:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gun](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[ATK] [int] NOT NULL,
	[AR] [int] NOT NULL,
	[SLOT] [int] NOT NULL,
	[STR] [int] NOT NULL,
	[INT] [int] NOT NULL,
	[VIT] [int] NOT NULL,
	[DEX] [int] NOT NULL,
	[AGI] [int] NOT NULL,
	[LUK] [int] NOT NULL,
	[CLASS] [smallint] NOT NULL,
	[EFFECT] [varchar](16) NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[SEX] [int] NOT NULL,
	[EQUIP] [int] NOT NULL,
	[level] [int] NULL,
	[LOCA] [int] NOT NULL,
	[property] [int] NOT NULL,
	[IsRefinable] [int] NOT NULL,
	[IsDamagable] [int] NOT NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_gun] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildExpParameter]    Script Date: 02/16/2018 13:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuildExpParameter](
	[Level] [smallint] NOT NULL,
	[Exp] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[guest]    Script Date: 02/16/2018 13:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[guest](
	[ID] [smallint] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_guest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Getschange]    Script Date: 02/16/2018 13:54:08 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getschange] 
AS	select *  from schange
GO
/****** Object:  Table [dbo].[weapon]    Script Date: 02/16/2018 13:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[weapon](
	[ID] [smallint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[ATK] [int] NOT NULL,
	[MATK] [int] NULL,
	[AR] [int] NOT NULL,
	[SLOT] [int] NOT NULL,
	[STR] [int] NOT NULL,
	[INT] [int] NOT NULL,
	[VIT] [int] NOT NULL,
	[DEX] [int] NOT NULL,
	[AGI] [int] NOT NULL,
	[LUK] [int] NOT NULL,
	[CLASS] [smallint] NOT NULL,
	[EFFECT] [varchar](16) NULL,
	[PRICE] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
	[SEX] [int] NOT NULL,
	[EQUIP] [int] NOT NULL,
	[level] [int] NULL,
	[LOCA] [int] NOT NULL,
	[property] [int] NULL,
	[IsRefinable] [int] NULL,
	[IsDamagable] [int] NULL,
	[MinLevel] [smallint] NULL,
	[MaxLevel] [smallint] NULL,
 CONSTRAINT [PK_weapon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[viewItemSlotList]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[viewItemSlotList]
as

select ID, NAME, SLOT from armor

union
select ID, NAME, SLOT from weapon

union
select ID, NAME, SLOT from bothhand

union
select ID, NAME, SLOT from armorMB

union
select ID, NAME, SLOT from armorTM

union
select ID, NAME, SLOT from armorTB

union
select ID, NAME, SLOT from armorMB

union
select ID, NAME, SLOT from armorTMB

union
select ID, NAME, SLOT from bow

union
select ID, NAME, SLOT from gun
GO
/****** Object:  View [dbo].[viewItemList]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[viewItemList]
as
select ID, NAME,'heal' AS [TABLENAME] from heal
union
select ID, NAME,'special' AS [TABLENAME] from special
union
select ID, NAME,'event' AS [TABLENAME] from event
union
select ID, NAME,'guest' AS [TABLENAME] from guest
union
select ID, NAME,'arrow' AS [TABLENAME] from arrow
union
select ID, NAME,'armor' AS [TABLENAME] from armor
union
select ID, NAME,'ammo' AS [TABLENAME] from ammo
union
select ID, NAME,'gun' AS [TABLENAME] from gun
union
select ID, NAME,'ThrowWeapon' AS [TABLENAME] from ThrowWeapon
union
select ID, NAME,'weapon' AS [TABLENAME] from weapon
union
select ID, NAME,'bothhand' AS [TABLENAME] from bothhand
union
select ID, NAME,'armorMB' AS [TABLENAME] from armorMB
union
select ID, NAME,'card' AS [TABLENAME] from card
union
select ID, NAME,'armorTM' AS [TABLENAME] from armorTM
union
select ID, NAME,'armorTB' AS [TABLENAME] from armorTB
union
select ID, NAME,'armorMB' AS [TABLENAME] from armorMB
union
select ID, NAME,'armorTMB' AS [TABLENAME] from armorTMB
union
select ID, NAME,'bow' AS [TABLENAME] from bow

union
select ID, NAME,'CashPointItem' AS [TABLENAME] from CashPointItem
GO
/****** Object:  StoredProcedure [dbo].[usp_getweapon2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getweapon2]
AS
	select 
		ID,			--1
		NAME,		--2
		ATK,		--3
		MATK,		--4
		AR,			--5
		SLOT,		--6
		[STR],		--7
		[INT],		--8
		VIT,		--9
		DEX,		--10
		AGI,		--11
		LUK,		--12
	    CLASS,		--13	    
	    EFFECT,		--14
	    PRICE,		--15
	    [WEIGHT],	--16
	    SEX,		--17
	    EQUIP,		--18
	    [level],	--19
	    LOCA,		--20	    	    
	    property,	--21
	    IsRefinable,--22
	    IsDamagable,--23
	    MinLevel,	--24
	    MaxLevel	--25
	from weapon
GO
/****** Object:  StoredProcedure [dbo].[usp_getthrow2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getthrow2]
AS
	select ID, NAME, ATK, PROPERTY, PRICE, [WEIGHT], EQUIP, MinLevel, MaxLevel
	from throwweapon
GO
/****** Object:  StoredProcedure [dbo].[usp_getspecial2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getspecial2]
AS
	select ID, NAME, EFFECT, PRICE, [WEIGHT], MinLevel, MaxLevel
	from special
GO
/****** Object:  StoredProcedure [dbo].[usp_getmonparameter]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[usp_getmonparameter]
AS	
	SELECT	[Name],	[aRan], [LV],[HP],[SP],[str],[int],[vit],[dex],[agi],
		[luk],[atk1], [atk2],[def],[exp],[jexp],[inc],[as],[es],[Mspeed],
		[rechargeTime],[attackedMT],[attackMT],[property],[scale],[class],[race],[mdef], [attr] 
	FROM monparameter
GO
/****** Object:  StoredProcedure [dbo].[usp_getheal2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getheal2]
AS
	select ID, Name, HPMIN, HPMAX, SPMIN, SPMAX, [STATUS], PRICE, [WEIGHT], ABUSE_GAUGE, MinLevel, MaxLevel
	from heal
GO
/****** Object:  StoredProcedure [dbo].[usp_getgun2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getgun2]
AS
	select 
		ID,			--1
		NAME,		--2
		ATK,		--3
		AR,			--4
		SLOT,		--5
		[STR],		--6
		[INT],		--7
		VIT,		--8
		DEX,		--9
		AGI,		--10
		LUK,		--11
	    CLASS,		--12	    
	    EFFECT,		--13
	    PRICE,		--14
	    [WEIGHT],	--15
	    SEX,		--16
	    EQUIP,		--17
	    [level],	--18
	    LOCA,		--19	    	    
	    property,	--20
	    IsRefinable,--21
	    IsDamagable,--22
	    MinLevel,	--23
	    MaxLevel	--24
	from gun
GO
/****** Object:  StoredProcedure [dbo].[usp_getguest2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------- ~dbo.event ---------------------------


-------------------- dbo.guest ---------------------------
--EXEC sp_help guest
--SELECT * from dbo.guest

-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getguest2]
AS
	select ID, NAME
	from guest
GO
/****** Object:  StoredProcedure [dbo].[usp_getevent2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------- ~dbo.card ---------------------------


-------------------- dbo.event ---------------------------
--EXEC sp_help event
--SELECT * from dbo.event

-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getevent2]
AS
	select ID, NAME, PRICE, [WEIGHT]
	from event
GO
/****** Object:  StoredProcedure [dbo].[usp_getcashpointitem2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------- ~dbo.guest ---------------------------

-------------------- dbo.cashpointitem ---------------------------
--EXEC sp_help cashpointitem
--SELECT * from dbo.cashpointitem

-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getcashpointitem2]
AS
	select ID, NAME,PRICE, [WEIGHT], ChangeItemID, [Count]
	from cashpointitem
GO
/****** Object:  StoredProcedure [dbo].[usp_getcard2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------- ~dbo.cannonball ---------------------------


-------------------- dbo.card ---------------------------
--EXEC sp_help card
--SELECT * from dbo.card

-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getcard2]
AS
	select ID, NAME, PRICE, [WEIGHT], compositionType, compositionPos, class, property
	from card
GO
/****** Object:  StoredProcedure [dbo].[usp_getcannonball2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getcannonball2]
AS
	select ID, NAME, ATK, PROPERTY, PRICE, [WEIGHT], MinLevel, MaxLevel
	from cannonball
GO
/****** Object:  StoredProcedure [dbo].[usp_getbow2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getbow2]
AS
	select 
		ID,			--1
		NAME,		--2
		ATK,		--3
		AR,			--4
		SLOT,		--5
		[STR],		--6
		[INT],		--7
		VIT,		--8
		DEX,		--9
		AGI,		--10
		LUK,		--11
	    CLASS,		--12	    
	    EFFECT,		--13
	    PRICE,		--14
	    [WEIGHT],	--15
	    SEX,		--16
	    EQUIP,		--17
	    [level],	--18
	    LOCA,		--19	    	    
	    property,	--20
	    IsRefinable,--21
	    IsDamagable,--22
	    MinLevel,	--23
	    MaxLevel	--24
	from bow
GO
/****** Object:  StoredProcedure [dbo].[usp_getbothhand2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getbothhand2]
AS
	select 
		ID,			--1
		NAME,		--2
		ATK,		--3
		MATK,		--4
		AR,			--5
		SLOT,		--6
		[STR],		--7
		[INT],		--8
		VIT,		--9
		DEX,		--10
		AGI,		--11
		LUK,		--12
	    CLASS,		--13	    
	    EFFECT,		--14
	    PRICE,		--15
	    [WEIGHT],	--16
	    SEX,		--17
	    EQUIP,		--18
	    [level],	--19
	    LOCA,		--20	    	    
	    property,	--21
	    IsRefinable,--22
	    IsDamagable,--23
	    MinLevel,	--24
	    MaxLevel	--25
	from bothhand
GO
/****** Object:  StoredProcedure [dbo].[usp_getarrow2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getarrow2]
AS
	select ID, NAME, ATK, PROPERTY, PRICE, [WEIGHT], MinLevel, MaxLevel
	from arrow
GO
/****** Object:  StoredProcedure [dbo].[usp_getarmorTMB2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getarmorTMB2]
AS
	select 
		ID,			--1
		NAME,		--2
		DEF,		--3
		SLOT,		--4
		[STR],		--5
		[INT],		--6
		VIT,		--7
		DEX,		--8
		AGI,		--9
		LUK,		--10
	    MHP,		--11
	    MSP,		--12
	    EFFECT,		--13
	    PRICE,		--14
	    [WEIGHT],	--15
	    SEX,		--16
	    EQUIP,		--17
	    LOCA,		--18	    
	    MDEF,		--19
	    CLASS,		--20
	    IsRefinable,--21
	    IsDamagable,--22
	    MinLevel,	--23
	    MaxLevel	--24
	from armorTMB
GO
/****** Object:  StoredProcedure [dbo].[usp_getarmorTM2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getarmorTM2]
AS
	select 
		ID,			--1
		NAME,		--2
		DEF,		--3
		SLOT,		--4
		[STR],		--5
		[INT],		--6
		VIT,		--7
		DEX,		--8
		AGI,		--9
		LUK,		--10
	    MHP,		--11
	    MSP,		--12
	    EFFECT,		--13
	    PRICE,		--14
	    [WEIGHT],	--15
	    SEX,		--16
	    EQUIP,		--17
	    LOCA,		--18	    
	    MDEF,		--19
	    CLASS,		--20
	    IsRefinable,--21
	    IsDamagable,--22
	    MinLevel,	--23
	    MaxLevel	--24
	from armorTM
GO
/****** Object:  StoredProcedure [dbo].[usp_getarmorTB2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getarmorTB2]
AS
	select 
		ID,			--1
		NAME,		--2
		DEF,		--3
		SLOT,		--4
		[STR],		--5
		[INT],		--6
		VIT,		--7
		DEX,		--8
		AGI,		--9
		LUK,		--10
	    MHP,		--11
	    MSP,		--12
	    EFFECT,		--13
	    PRICE,		--14
	    [WEIGHT],	--15
	    SEX,		--16
	    EQUIP,		--17
	    LOCA,		--18	    
	    MDEF,		--19
	    CLASS,		--20
	    IsRefinable,--21
	    IsDamagable,--22
	    MinLevel,	--23
	    MaxLevel	--24
	from armorTB
GO
/****** Object:  StoredProcedure [dbo].[usp_getarmorMB2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getarmorMB2]
AS
	select 
		ID,			--1
		NAME,		--2
		DEF,		--3
		SLOT,		--4
		[STR],		--5
		[INT],		--6
		VIT,		--7
		DEX,		--8
		AGI,		--9
		LUK,		--10
	    MHP,		--11
	    MSP,		--12
	    EFFECT,		--13
	    PRICE,		--14
	    [WEIGHT],	--15
	    SEX,		--16
	    EQUIP,		--17
	    LOCA,		--18	    
	    MDEF,		--19
	    CLASS,		--20
	    IsRefinable,--21
	    IsDamagable,--22
	    MinLevel,	--23
	    MaxLevel	--24
	from armorMB
GO
/****** Object:  StoredProcedure [dbo].[usp_getarmor2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getarmor2]
AS
	select 
		ID,			--1
		NAME,		--2
		DEF,		--3
		SLOT,		--4
		[STR],		--5
		[INT],		--6
		VIT,		--7
		DEX,		--8
		AGI,		--9
		LUK,		--10
	    MHP,		--11
	    MSP,		--12
	    EFFECT,		--13
	    PRICE,		--14
	    [WEIGHT],	--15
	    SEX,		--16
	    EQUIP,		--17
	    LOCA,		--18	    
	    MDEF,		--19
	    CLASS,		--20
	    IsRefinable,--21
	    IsDamagable,--22
	    MinLevel,	--23
	    MaxLevel	--24
	from armor
GO
/****** Object:  StoredProcedure [dbo].[usp_getammo2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 새로운 프로시저
CREATE PROCEDURE [dbo].[usp_getammo2]
AS
	select ID, NAME, ATK, PROPERTY, PRICE, [WEIGHT], MinLevel, MaxLevel
	from ammo
GO
/****** Object:  StoredProcedure [dbo].[usp_get_jobexp]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_jobexp]
 /*   @id int*/
AS
select * from FirstJobExpParameter where exp = 123
GO
/****** Object:  StoredProcedure [dbo].[GetNoviceJobExp2]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetNoviceJobExp2]
AS
	select * from NoviceJobExpParameter2
GO
/****** Object:  StoredProcedure [dbo].[GetNoviceJobExp]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNoviceJobExp]
AS
	select * from NoviceJobExpParameter
GO
/****** Object:  StoredProcedure [dbo].[Getmonparameter]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getmonparameter] 
AS	select *  from monparameter
GO
/****** Object:  StoredProcedure [dbo].[Getmonmakingitem]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getmonmakingitem] 
AS	select *  from monmakingitem
GO
/****** Object:  StoredProcedure [dbo].[Getheal]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getheal] 
AS	select *  from heal
GO
/****** Object:  StoredProcedure [dbo].[GetGun]    Script Date: 02/16/2018 13:54:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.GetGun    스크립트 날짜: 2005-11-25 오후 6:42:16 ******/
CREATE PROCEDURE [dbo].[GetGun] 
AS	select *  from gun
GO
/****** Object:  StoredProcedure [dbo].[GetGuildexp]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGuildexp] 
AS	select *  from GuildExpParameter
GO
/****** Object:  StoredProcedure [dbo].[Getguest]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getguest] 
AS	select *  from guest
GO
/****** Object:  StoredProcedure [dbo].[Getfsm]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getfsm] 
AS	select *  from fsm
GO
/****** Object:  StoredProcedure [dbo].[GetFirstJobExp3]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFirstJobExp3]

AS

	Select * From FirstJobExpParameter3
GO
/****** Object:  StoredProcedure [dbo].[GetFirstJobExp2]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFirstJobExp2]
AS
	select * from FirstJobExpParameter2
GO
/****** Object:  StoredProcedure [dbo].[GetFirstJobExp]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFirstJobExp]
AS
	select * from FirstJobExpParameter
GO
/****** Object:  StoredProcedure [dbo].[GetExp3]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetExp3]
AS 
SET NOCOUNT ON
select [level], [exp] from ExpParameter3
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Getexp2]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Getexp2] 
AS	select *  from ExpParameter2
GO
/****** Object:  StoredProcedure [dbo].[Getexp]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getexp] 
AS	select *  from ExpParameter
GO
/****** Object:  StoredProcedure [dbo].[Getevent]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getevent] 
AS	select *  from event
GO
/****** Object:  StoredProcedure [dbo].[GetCashPointItem]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCashPointItem] 
AS
select *  from CashPointItem
GO
/****** Object:  StoredProcedure [dbo].[Getcard]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Getcard] 
AS	select *  from card
GO
/****** Object:  StoredProcedure [dbo].[Getbow]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Getbow] 
AS	select *  from bow
GO
/****** Object:  StoredProcedure [dbo].[Getbothhand]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Getbothhand] 
AS	select *  from bothhand
GO
/****** Object:  StoredProcedure [dbo].[Getarrow]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getarrow] 
AS	select *  from arrow
GO
/****** Object:  StoredProcedure [dbo].[GetarmorTMB]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetarmorTMB] 
AS	select *  from armorTMB
GO
/****** Object:  StoredProcedure [dbo].[GetarmorTM]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetarmorTM] 
AS	select *  from armorTM
GO
/****** Object:  StoredProcedure [dbo].[GetarmorTB]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetarmorTB] 
AS	select *  from armorTB
GO
/****** Object:  StoredProcedure [dbo].[GetarmorMB]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetarmorMB] 
AS	select *  from armorMB
GO
/****** Object:  StoredProcedure [dbo].[Getarmor]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getarmor] 
AS	select *  from armor
GO
/****** Object:  StoredProcedure [dbo].[GetAmmo]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.GetAmmo    스크립트 날짜: 2005-11-25 오후 6:41:51 ******/

CREATE PROCEDURE [dbo].[GetAmmo] 
AS	select *  from ammo
GO
/****** Object:  View [dbo].[gm_ViewWeaponItem]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[gm_ViewWeaponItem]
AS

Select ID, NAME
From armor
UNION ALL
Select ID, NAME
From armorMB
UNION ALL
Select ID, NAME
From armorTB
UNION ALL
Select ID, NAME
From armorTM
UNION ALL
Select ID, NAME
From armorTMB
UNION ALL
Select ID, NAME
From bothhand
UNION ALL
Select ID, NAME
From bow
UNION ALL
Select ID, NAME
From gun
UNION ALL
Select ID, NAME
From weapon
GO
/****** Object:  View [dbo].[gm_ViewGeneralItem]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[gm_ViewGeneralItem]
As

Select ID, NAME
From card
UNION ALL
Select ID, NAME
From event
UNION ALL
Select ID, NAME
From heal
UNION ALL
Select ID, NAME
From special
UNION ALL
Select ID, NAME
From ThrowWeapon
GO
/****** Object:  View [dbo].[gm_ViewArrowItem]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[gm_ViewArrowItem]
AS

Select ID, NAME, Property, ATK
From arrow
GO
/****** Object:  StoredProcedure [dbo].[GM_GetArrow]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GM_GetArrow]
@ID AS INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT * FROM dbo.arrow WHERE [ID] = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[Getweapon]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getweapon] 
AS	select *  from weapon
GO
/****** Object:  StoredProcedure [dbo].[GetThirdJobExp]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetThirdJobExp]
AS 
SET NOCOUNT ON
select [level], [exp] from ThirdJobExpParameter
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Getspecial]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getspecial] 
AS	select *  from special
GO
/****** Object:  StoredProcedure [dbo].[GetSecondJobExp2]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetSecondJobExp2]
AS
	select * from SecondJobExpParameter2
GO
/****** Object:  StoredProcedure [dbo].[GetSecondJobExp]    Script Date: 02/16/2018 13:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSecondJobExp]
AS
	select * from SecondJobExpParameter
GO
/****** Object:  Default [DF__cannonbal__MinLe__74AE54BC]    Script Date: 02/16/2018 13:54:06 ******/
ALTER TABLE [dbo].[cannonball] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__cannonbal__MaxLe__75A278F5]    Script Date: 02/16/2018 13:54:06 ******/
ALTER TABLE [dbo].[cannonball] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__bow__MinLevel__76969D2E]    Script Date: 02/16/2018 13:54:06 ******/
ALTER TABLE [dbo].[bow] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__bow__MaxLevel__778AC167]    Script Date: 02/16/2018 13:54:06 ******/
ALTER TABLE [dbo].[bow] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__bothhand__MinLev__787EE5A0]    Script Date: 02/16/2018 13:54:06 ******/
ALTER TABLE [dbo].[bothhand] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__bothhand__MaxLev__797309D9]    Script Date: 02/16/2018 13:54:06 ******/
ALTER TABLE [dbo].[bothhand] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__arrow__MinLevel__7A672E12]    Script Date: 02/16/2018 13:54:06 ******/
ALTER TABLE [dbo].[arrow] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__arrow__MaxLevel__7B5B524B]    Script Date: 02/16/2018 13:54:06 ******/
ALTER TABLE [dbo].[arrow] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__armorTMB__MinLev__7C4F7684]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armorTMB] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__armorTMB__MaxLev__7D439ABD]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armorTMB] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__armorTM__MinLeve__7E37BEF6]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armorTM] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__armorTM__MaxLeve__7F2BE32F]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armorTM] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__armorTB__MinLeve__00200768]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armorTB] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__armorTB__MaxLeve__01142BA1]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armorTB] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__armorMB__MinLeve__02084FDA]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armorMB] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__armorMB__MaxLeve__02FC7413]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armorMB] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__armor__MinLevel__03F0984C]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armor] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__armor__MaxLevel__04E4BC85]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[armor] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__ammo__MinLevel__05D8E0BE]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[ammo] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__ammo__MaxLevel__06CD04F7]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[ammo] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__ThrowWeap__EQUIP__07C12930]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[ThrowWeapon] ADD  DEFAULT ((0)) FOR [EQUIP]
GO
/****** Object:  Default [DF__ThrowWeap__MinLe__08B54D69]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[ThrowWeapon] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__ThrowWeap__MaxLe__09A971A2]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[ThrowWeapon] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__special__MinLeve__0A9D95DB]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[special] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__special__MaxLeve__0B91BA14]    Script Date: 02/16/2018 13:54:07 ******/
ALTER TABLE [dbo].[special] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__heal__MinLevel__0C85DE4D]    Script Date: 02/16/2018 13:54:08 ******/
ALTER TABLE [dbo].[heal] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__heal__MaxLevel__0D7A0286]    Script Date: 02/16/2018 13:54:08 ******/
ALTER TABLE [dbo].[heal] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__gun__MinLevel__0E6E26BF]    Script Date: 02/16/2018 13:54:08 ******/
ALTER TABLE [dbo].[gun] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__gun__MaxLevel__0F624AF8]    Script Date: 02/16/2018 13:54:08 ******/
ALTER TABLE [dbo].[gun] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
/****** Object:  Default [DF__weapon__MinLevel__10566F31]    Script Date: 02/16/2018 13:54:08 ******/
ALTER TABLE [dbo].[weapon] ADD  DEFAULT ((0)) FOR [MinLevel]
GO
/****** Object:  Default [DF__weapon__MaxLevel__114A936A]    Script Date: 02/16/2018 13:54:08 ******/
ALTER TABLE [dbo].[weapon] ADD  DEFAULT ((150)) FOR [MaxLevel]
GO
