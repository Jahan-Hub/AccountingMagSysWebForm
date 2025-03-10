
ALTER proc Sp_ItemInfo
(
	@mode varchar(2),
	@ItemCode VARCHAR (5)=null,
	@SrlCode VARCHAR (20)=null,
	@ItemCatId VARCHAR (2)=null,
	@SupId VARCHAR (20)=null,
	@ItemName VARCHAR (50)=null,
	@Brand VARCHAR (20)=null,
	@Origin VARCHAR (20)=null,
	@Color VARCHAR (20)=null,
	@ItemUnit VARCHAR (10)=null,
	@ItemType VARCHAR (20)=null,
	@ItemSize VARCHAR (50)=null,
	@PurRate MONEY=null,
	@SalesRate MONEY=null,
	@MinQty money=null,
	@MaxQty money=null,
	@Photo image=null,
	@UsedFor VARCHAR (20)=null,
	@Notes VARCHAR (300)=null,
	@UserId VARCHAR (10)=null,
	@Lmdt datetime =null
	)
AS
SET NOCOUNT ON

if @mode='I'
begin
	INSERT INTO tblItems
	        (ItemCode,SrlCode,ItemName,ItemCatId,SupId, Brand, Origin,Color, ItemSize,ItemType, ItemUnit, PurRate, SalesRate,MinQty,MaxQty,Photo,UsedFor,Notes, UserId,Lmdt)
	VALUES  (@ItemCode,@SrlCode,@ItemName,@ItemCatId,@SupId,@Brand,@Origin,@Color,@ItemSize,@ItemType,@ItemUnit,@PurRate,@SalesRate,@MinQty,@MaxQty,@Photo,@UsedFor,@Notes,@UserId,GETDATE())
end

if @mode='U'
begin
	UPDATE  tblItems SET SrlCode=@SrlCode,ItemName=@ItemName,ItemCatId=@ItemCatId,SupId=@SupId,Brand=@Brand,Origin=@Origin,Color=@Color,ItemSize = @ItemSize, ItemType=@ItemType, ItemUnit = @ItemUnit, 
			PurRate = @PurRate, SalesRate = @SalesRate,MinQty=@MinQty,MaxQty=@MaxQty,Photo=@Photo,UsedFor=@UsedFor,Notes=@Notes, UserId=@UserId,Lmdt=GETDATE()
			WHERE     (ItemCode = @ItemCode)
end
	
if @mode='D'
begin
	delete from tblItems  where (ItemCode = @ItemCode)
end
if @mode='5'
begin
	 select * from tblItems
end
if @mode='6'
begin
	 select * from tblItems where ItemCode=@ItemCode
end

