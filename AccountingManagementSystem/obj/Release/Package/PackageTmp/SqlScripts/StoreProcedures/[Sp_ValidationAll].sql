USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_ValidationAll]    Script Date: 7/30/2021 12:47:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_ValidationAll] (
	@mode			int				= 4,
	@SalesId		varchar(7)		= null,
	@ItemCode		varchar (5)		= null,
	@Qty			int				= 0,
	@ItemCatId		int				= 0,
	@ItemSize		int				= 0,
	@Pack			int				= 0,
	@CostHead		int				= 0,
	@CostElement	int				= 0,
	@LotNumber		varchar(50)		= null
	)
AS
Declare @vRecordFound	int
Declare @vErrorMsg		varchar(2000)
if @mode=1 -- check item qty when sales
begin
	select sum(StockQty)StockQty from tblStocks where ItemCode=@ItemCode --and LotNumber=@LotNumber
end

if @mode=2 -- check editing or deleting category
begin
	select @vRecordFound=ItemCatId from tblItems where ItemCatId=@ItemCatId
	if isnull(@vRecordFound,0)>0
	begin
		SET @vErrorMsg='Can not Proceed. Category Already Tagged in Products.'
		GOTO ERR_HANDLER1
	end
	delete from tblCategory where CatId=@ItemCatId
end

if @mode=3 -- check editing or deleting Item Size
begin
	select @vRecordFound=ItemSize from tblItems where ItemSize=@ItemSize
	if isnull(@vRecordFound,0)>0
	begin
		SET @vErrorMsg='Can not Proceed. Item Size Already Tagged in Products.'
		GOTO ERR_HANDLER1
	end
	delete from tblItemSize where Id=@ItemSize
end

if @mode=4 -- check editing or deleting Packing
begin
	select @vRecordFound=Pack from tblItems where Pack=@Pack
	if isnull(@vRecordFound,0)>0
	begin
		SET @vErrorMsg='Can not Proceed. Packing Already Tagged in Products.'
		GOTO ERR_HANDLER1
	end
	delete from tblPacking where Id=@Pack
end

if @mode=5 -- check editing or deleting Cost Center
begin
	select @vRecordFound=CostHead from tblExpense where CostHead=@CostHead
	if isnull(@vRecordFound,0)>0
	begin
		SET @vErrorMsg='Can not Proceed. Cost Center Already Tagged in Expense.'
		GOTO ERR_HANDLER1
	end
	delete from tblCostCenters where Id=@CostHead
end

if @mode=6 -- check editing or deleting Cost Eletemt
begin
	select @vRecordFound=CostElement from tblExpense where CostElement=@CostElement
	if isnull(@vRecordFound,0)>0
	begin
		SET @vErrorMsg='Can not Proceed. Cost Element Already Tagged in Expense.'
		GOTO ERR_HANDLER1
	end
	delete from tblCostElements where Id=@CostElement
end

CleanUp:
	RETURN	
	
ERR_HANDLER:
	--SELECT @v_ErrorMsg = MATRIXSYSDB.DBO.fn_GetSystemMessages(@v_ErrorNo, 
	--                                                          @v_Disp_1, 
	--                                                          @v_Disp_2, 
	--                                                          @v_Disp_3, 
	--                                                          @v_Disp_4, 
	--                                                          @v_Disp_5)
	RAISERROR (@vErrorMsg,16,1)
    GOTO CleanUp
ERR_HANDLER1:
	RAISERROR (@vErrorMsg,16,1)
    GOTO CleanUp
