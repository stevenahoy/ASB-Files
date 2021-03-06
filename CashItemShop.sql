USE [master]
GO
/****** Object:  Database [CashItemShop]    Script Date: 01/27/2018 19:28:09 ******/
CREATE DATABASE [CashItemShop] ON  PRIMARY 
( NAME = N'CashItemShop_Data', FILENAME = N'C:\AEGIS\DB\CashItemShop_Data.MDF' , SIZE = 10048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'CashItemShop_Log', FILENAME = N'C:\AEGIS\DB\CashItemShop_Log.LDF' , SIZE = 10048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CashItemShop] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CashItemShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CashItemShop] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CashItemShop] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CashItemShop] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CashItemShop] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CashItemShop] SET ARITHABORT OFF
GO
ALTER DATABASE [CashItemShop] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CashItemShop] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CashItemShop] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CashItemShop] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CashItemShop] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CashItemShop] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CashItemShop] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CashItemShop] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CashItemShop] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CashItemShop] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CashItemShop] SET  ENABLE_BROKER
GO
ALTER DATABASE [CashItemShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CashItemShop] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CashItemShop] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CashItemShop] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CashItemShop] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CashItemShop] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CashItemShop] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CashItemShop] SET  READ_WRITE
GO
ALTER DATABASE [CashItemShop] SET RECOVERY FULL
GO
ALTER DATABASE [CashItemShop] SET  MULTI_USER
GO
ALTER DATABASE [CashItemShop] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [CashItemShop] SET DB_CHAINING OFF
GO
USE [CashItemShop]
GO
/****** Object:  User [cashshop]    Script Date: 01/27/2018 19:28:09 ******/
CREATE USER [cashshop] FOR LOGIN [cashshop] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[CashItemShopLog]    Script Date: 01/27/2018 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CashItemShopLog](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Action] [int] NULL,
	[ServerID] [int] NULL,
	[MapName] [varchar](24) NULL,
	[AccountID] [int] NULL,
	[AccountName] [varchar](24) NULL,
	[CharacterID] [int] NULL,
	[CharacterName] [varchar](24) NULL,
	[CharacterIPaddr] [varchar](20) NULL,
	[PosX] [int] NULL,
	[PosY] [int] NULL,
	[NpcName] [varchar](51) NULL,
	[ItemID] [int] NULL,
	[ItemName] [varchar](24) NULL,
	[ItemCount] [int] NULL,
	[ItemSerial] [bigint] NULL,
	[ItemSlot1] [int] NULL,
	[ItemSlot2] [int] NULL,
	[ItemSlot3] [int] NULL,
	[ItemSlot4] [int] NULL,
	[ItemRefiningLevel] [int] NULL,
	[Cash_Price] [int] NULL,
	[Cash_View] [int] NULL,
	[Cash_Before] [int] NULL,
	[Cash_After] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cash_Reload_Log]    Script Date: 01/27/2018 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cash_Reload_Log](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[game_id] [varchar](20) NOT NULL,
	[aid] [int] NOT NULL,
	[card_id] [varchar](20) NOT NULL,
	[card_point] [int] NOT NULL,
	[cash_after] [int] NOT NULL,
	[log_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Cash_Reload_Log2] PRIMARY KEY CLUSTERED 
(
	[card_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cash]    Script Date: 01/27/2018 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cash](
	[AID] [int] NOT NULL,
	[Cash] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_insertCashReloadLog]    Script Date: 01/27/2018 19:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_insertCashReloadLog]

	@game_id 	varchar(20),
	@aid		int,
	@card_id	varchar(20),
	@card_point	int,
	@cash		int
	
AS

	SET NOCOUNT ON

	INSERT INTO Cash_Reload_Log (
				game_id, aid, card_id, card_point, cash_after, log_date)
			VALUES(
				@game_id, @aid, @card_id, @card_point, @cash, GetDate()
				)

		SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_insertcashitemshoplog]    Script Date: 01/27/2018 19:28:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_insertcashitemshoplog]
	--Log情報
	@Action		INT, -- 行動(1:購買物品)	
	@ServerID		INT,-- Zone Server的 ID
	@MapName	VARCHAR(24), -- 玩家所在地圖上的名稱
	@AccountID	INT,         -- 玩家的帳號ID
	@AccountName	VARCHAR(24), -- 玩家的帳號名
	@CharacterID	INT,		 -- 角色ID
	@CharacterName	VARCHAR(24), -- 角色名字
	@CharacterIPaddr	VARCHAR(20), -- 角色連線 IP address
	@PosX		INT,         -- 角色現在的位置 X座標
	@PosY		INT,         -- 角色現在的位置 Y座標
	-- 有關商店情報	
	@NpcName	VARCHAR(51),		 -- 相關的NPC名字
		
	@ItemID		INT,         -- 相關物品的ID
	@ItemName	VARCHAR(24), -- 相關物品的名稱
	@ItemCount	INT,	     -- 相關物品的數量
	@ItemSerial	BIGINT,         -- 相關物品的序號
	@ItemSlot1	INT,         -- 相關物品的 Slot情報 1
	@ItemSlot2	INT,		 -- 相關物品的 Slot情報 1
	@ItemSlot3	INT,		 -- 相關物品的 Slot情報 1
	@ItemSlot4	INT,	     -- 相關物品的 Slot情報 1
	@ItemRefiningLevel	INT,         -- 相關物品的精鍊等級
	-- cash情報
	@Cash_Price	INT,    -- 相關物品的價格(Cash)
	@Cash_View	INT,    -- 玩家在client端上 所看到的cash?
	@Cash_Before	INT,    -- 行動前(購買) 在DB裡所紀錄的cash?
	@Cash_After	INT     -- 行動後(購買) 在DB裡所紀錄的cash?
AS

	SET NOCOUNT ON

	INSERT INTO CashItemShopLog (
				--Log情報
				[Action],					
				ServerID,MapName,AccountID,AccountName,CharacterID,CharacterName,CharacterIPaddr,PosX,PosY,
				-- 有關商店情報
				NpcName,
				-- 物品情報
				ItemID,ItemName,ItemCount,ItemSerial,
				ItemSlot1,ItemSlot2,ItemSlot3,ItemSlot4,
				ItemRefiningLevel,
				-- cash情報
				Cash_Price,Cash_View,Cash_Before,Cash_After)	
			VALUES(
				--Log情報
				@Action,
				
				@ServerID,@MapName,@AccountID,@AccountName,@CharacterID,@CharacterName,@CharacterIPaddr,@PosX,@PosY,
				-- 有關商店情報
				@NpcName,
				-- 物品情報
				@ItemID,@ItemName,@ItemCount,@ItemSerial,
				@ItemSlot1,@ItemSlot2,@ItemSlot3,@ItemSlot4,
				@ItemRefiningLevel,
				-- cash情報
				@Cash_Price,@Cash_View,@Cash_Before,@Cash_After)

		SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_cash_plus_v2]    Script Date: 01/27/2018 19:28:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_cash_plus_v2]
	@AID INT,
	--@AccountName VARCHAR(24),
	@plus_value INT,
	@item_id INT,
	@item_count INT
AS
	
	SET NOCOUNT ON

	DECLARE @error_code  INT
	DECLARE @cash_before INT
	DECLARE @cash_after  INT
	SET @error_code  = 5 --5 : 不明的錯誤
	SET @cash_before = 0
	SET @cash_after  = 0


	IF @plus_value >= 0 AND @plus_value < 1000000000 
	BEGIN	
		BEGIN TRAN -- 這裡的 trasaction是 不是?了 rollback使用 而是?了lock使用
	
		SELECT @cash_before=Cash FROM Cash WHERE AID = @AID     
		IF @@rowcount = 1
		BEGIN
			IF @cash_before <= 1000000000
			BEGIN
				SET @cash_after = @cash_before + @plus_value
				UPDATE Cash SET Cash=@cash_after WHERE AID = @AID
				IF @@rowcount = 1 SET @error_code = 0 -- 沒有錯誤.
				ELSE SET @error_code = 4 -- 計算後的cash?UPDATE失敗
			END
			ELSE SET @error_code = 3 --所擁有的cash太多 不能add.
		END
		ELSE SET @error_code = 2 -- 沒有讀取到cash?.

		COMMIT TRAN
	END
	ELSE SET @error_code = 1 -- 輸入的?錯誤
	
	SELECT @error_code,@cash_before,@cash_after
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_cash_plus]    Script Date: 01/27/2018 19:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_cash_plus]
	@AID INT,	
	@plus_value INT,
	@item_id INT,
	@item_count INT
AS
	
	SET NOCOUNT ON

	DECLARE @error_code  INT
	DECLARE @cash_before INT
	DECLARE @cash_after  INT
	SET @error_code  = 5 --5 : 不明的錯誤
	SET @cash_before = 0
	SET @cash_after  = 0


	IF @plus_value >= 0 AND @plus_value < 1000000000 
	BEGIN	
		BEGIN TRAN -- 這裡的 trasaction是 不是?了 rollback使用 而是?了lock使用
			
			IF @cash_before <= 1000000000
			BEGIN
				SET @cash_after = @cash_before + @plus_value
				INSERT into Cash(AID, Cash)
				values (@AID, @cash_after)		
				SET @error_code = 0		
			END
			ELSE SET @error_code = 3 --所擁有的cash太多 不能add.
				
		COMMIT TRAN
		
	END
	ELSE SET @error_code = 1 -- 輸入的?錯誤
	
	SELECT @error_code,@cash_before,@cash_after
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_cash_minus_v2]    Script Date: 01/27/2018 19:28:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_cash_minus_v2]
	@AID INT,
	@AccountName VARCHAR(24),
	@minus_value INT,
	@item_id INT,
	@item_count INT
AS

	SET NOCOUNT ON

	DECLARE @error_code  INT
	DECLARE @cash_before INT
	DECLARE @cash_after  INT
	SET @error_code  = 5 -- 不明的錯誤
	SET @cash_before = 0
	SET @cash_after  = 0

	IF @minus_value <= 0 AND @minus_value >= -1000000000
	BEGIN	
		BEGIN TRAN -- 這裡的 trasaction是 不是?了 rollback使用 而是?了lock使用
		
	
		SELECT @cash_before=Cash FROM Cash WHERE AID = @AID     
		IF @@rowcount = 1
		BEGIN
			IF @cash_before >= abs(@minus_value)
			BEGIN
				SET @cash_after = @cash_before + @minus_value
				UPDATE Cash SET Cash=@cash_after WHERE AID = @AID
				IF @@rowcount = 1 SET @error_code = 0 -- 沒有錯誤.
				ELSE SET @error_code=4 -- 計算後的cash?UPDATE失敗
			END
			ELSE SET @error_code=3 -- 所擁有的cash量不足
		END
		ELSE SET @error_code=2 -- 沒有讀取到cash?

		COMMIT TRAN
	END
	ELSE SET @error_code=1 -- 輸入的?不恰當.
	
	SELECT @error_code,@cash_before,@cash_after
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_cash_get]    Script Date: 01/27/2018 19:28:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[usp_cash_get]
	@AID INT,
	@AccountName VARCHAR(24)
AS	
	SET NOCOUNT ON
		
	DECLARE @error INT
	DECLARE @cash  INT	
	SET @error = 2 -- 2 : 發生不明的錯誤	
	SET @cash  = 0 
	
	SELECT @cash=Cash FROM Cash WHERE AID = @AID	
	IF @@rowcount = 1 SET @error = 1 -- 1 : 沒有錯誤.
	ELSE IF @@rowcount = 0 SET @error=0  -- 0 : ?不到該帳號.

	SELECT @cash,@error
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetAID]    Script Date: 01/27/2018 19:28:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAID]
	@ID	varchar(16)
	
AS	
	select top 1 AID from Cash_Reload_Log where game_id=@ID
GO
/****** Object:  Default [DF__CashItemSh__Date__0DAF0CB0]    Script Date: 01/27/2018 19:28:10 ******/
ALTER TABLE [dbo].[CashItemShopLog] ADD  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF__Cash__Cash__0EA330E9]    Script Date: 01/27/2018 19:28:10 ******/
ALTER TABLE [dbo].[Cash] ADD  DEFAULT ((0)) FOR [Cash]
GO
