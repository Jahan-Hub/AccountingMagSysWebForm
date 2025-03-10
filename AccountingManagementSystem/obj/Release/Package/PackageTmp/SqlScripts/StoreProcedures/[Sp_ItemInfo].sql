USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_ItemInfo]    Script Date: 7/30/2021 12:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Sp_ItemInfo]
(
	@mode		int = 4,
	@ItemCode	VARCHAR (5)		=null,
	@SrlCode	VARCHAR (20)	=null,
	@ItemCatId	VARCHAR (20)	=null,
	@SupId		VARCHAR (20)	=null,
	@ItemAlias	VARCHAR (100)	=null,
	@ItemName	VARCHAR (300)	=null,
	@Brand		VARCHAR (20)	=null,
	@Origin		VARCHAR (20)	=null,
	@Color		VARCHAR (20)	=null,
	@ItemUnit	VARCHAR (10)	=null,
	@ItemType	VARCHAR (20)	=null,
	@ItemSize	VARCHAR (50)	=null,
	@PurRate	MONEY			=null,
	@SalesRate	MONEY			=null,
	@MinQty		MONEY			=null,
	@MaxQty		MONEY			=null,
	@MenufDate	datetime		=null,
	@ExpiryDate	datetime		=null,
	@LotNumber	nvarchar(100)	=null,
	@Pack		int				=null,
	@Photo		image			=null,
	@UsedFor	VARCHAR (20)	=null,
	@Notes		VARCHAR (300)	=null,
	@UserId		VARCHAR (10)	=null,
	@Lmdt		datetime		=null
	)
AS

if @mode=1
begin
	INSERT INTO tblItems
	        (ItemCode,SrlCode,ItemAlias,ItemName,ItemCatId,SupId, Brand, Origin,Color, ItemSize,ItemType, ItemUnit, PurRate, SalesRate,MinQty,MaxQty,MenufDate,ExpiryDate,LotNumber,Pack, Photo,UsedFor,Notes, UserId,Lmdt)
	VALUES  (@ItemCode,@SrlCode,@ItemAlias,@ItemName,@ItemCatId,@SupId,@Brand,@Origin,@Color,@ItemSize,@ItemType,@ItemUnit,@PurRate,@SalesRate,@MinQty,@MaxQty,@MenufDate,@ExpiryDate,@LotNumber,@Pack,@Photo,@UsedFor,@Notes,@UserId,GETDATE())
end

if @mode=2
begin
	UPDATE  tblItems SET SrlCode=@SrlCode,ItemAlias=@ItemAlias,ItemName=@ItemName,ItemCatId=@ItemCatId,SupId=@SupId,Brand=@Brand,Origin=@Origin,Color=@Color,ItemSize = @ItemSize, ItemType=@ItemType, ItemUnit = @ItemUnit, 
			PurRate = @PurRate, SalesRate = @SalesRate,MinQty=@MinQty,MaxQty=@MaxQty,MenufDate=@MenufDate,ExpiryDate=@ExpiryDate,LotNumber=@LotNumber,Pack=@Pack,Photo=@Photo,UsedFor=@UsedFor,Notes=@Notes, UserId=@UserId,Lmdt=GETDATE()
			WHERE     (ItemCode = @ItemCode)
end
	
if @mode=3
begin
	delete from tblItems  where (ItemCode = @ItemCode)
end
if @mode=5
begin
	 select a.*,b.Name as CategoryName,c.Unit from tblItems a
	 left join tblCategory b on a.ItemCatId=b.CatId
	 left join tblWeights c on a.ItemUnit=c.WgtId
end
if @mode=6
begin
	 select a.*,b.Name as ItemSizeName from tblItems a left join tblItemSize b on a.ItemSize=b.Id
	 where ItemCode=@ItemCode
end
if @mode=7
begin
	 select a.*,b.Name as CategoryName,c.Unit from tblItems a
	 left join tblCategory b on a.ItemCatId=b.CatId
	 left join tblWeights c on a.ItemUnit=c.WgtId
	 where ItemCatId =@ItemCatId
end
if @mode=8 --insert into stock when new item purchase
begin
	insert into tblStocks(ItemCode,StockQty,MinQty,MaxQty,Lmdt)values(@ItemCode,0,@MinQty,@MaxQty,GETDATE())
end
if @mode=9 --get item size
begin
	select a.Id,a.Name from tblItemSize a inner join tblItems b on a.Id=b.ItemSize where b.ItemCode=@ItemCode
end




