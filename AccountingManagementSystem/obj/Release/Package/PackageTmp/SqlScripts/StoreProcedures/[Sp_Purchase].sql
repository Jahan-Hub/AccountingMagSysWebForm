USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Purchase]    Script Date: 7/30/2021 12:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_Purchase] (
	@mode			int				= 4,
	@PurID			varchar(7)		= null,
	@PurDate		datetime		= null,
	@BillNo			varchar (50)	= null,
	@VoucherNo		varchar (50)	= null,
	@SupplierId		int				= null,
	@Remarks		varchar (200)	= null,
	@Reference		varchar (100)	= null,
	@TaxVAT			Decimal(18,4)	= 0.0000,
	@VAT			Decimal(18,4)	= 0.0000,
	@Discount		Decimal(18,4)	= 0.0000,
	@OtherCost		Decimal(18,4)	= 0.0000,
	@LabourCost		Decimal(18,4)	= 0.0000,
	@NetAmount		Decimal(18,4)	= 0.0000,
	@Paid			Decimal(18,4)	= 0.0000,
	@Due			Decimal(18,4)	= 0.0000,
	@PayMode		varchar (100)	= null,
	@ChequeNo		varchar (80)	= null,
	@ChequeDt		datetime		= null,
	@DepositBank	varchar (50)	= null,
	@BankName		varchar (150)	= null,
	@ChequeDetails	varchar (250)	= null,
	@Userid			varchar (50)	= null,
	---------------------------------- for dtl
	@ItemCode		varchar (5)		= null,
	@UnitPrice		money			= 0.0000,
	@Qty			int				= 0,
	@Amount			money			= 0.0000,
	@MaxQty			money			= 0.0,
	@MinQty			money			= 0.0,
	@LotNumber		varchar (100)	= null,
	@MafDate		datetime		= null,
	@ExpiryDate		datetime		= null,
	---------------------------------- for dtl
	@PayDate		datetime		= null,
	@FromDate		Datetime		= null,
	@ToDate			Datetime		= null,
	@ItemSize		int				= null
	)
AS
	DECLARE @V_PCOUNT		INT
	DECLARE @P_EXECSTATUS	DECIMAL
	DECLARE @V_ERRORMSG		VARCHAR(2000)
	DECLARE @V_TRANEXIST	VARCHAR(30)

if @mode=1 --insert HDR
begin
	INSERT INTO tblPurchaseHDR (PurID, PurDate, BillNo,LotNumber, VoucherNo,SupplierId,Remarks,Reference,TaxVAT,VAT,OtherCost,Discount,LabourCost,NetAmount,Paid,Due,PayMode,ChequeNo,ChequeDt,DepositBank,BankName,ChequeDetails,Userid, Lmdt) 
	VALUES (@PurID, @PurDate, @BillNo,@LotNumber, @VoucherNo,@SupplierId,@Remarks,@Reference,@TaxVAT,@VAT,@OtherCost,@Discount,@LabourCost,@NetAmount,@Paid,@Due,@PayMode,@ChequeNo,@ChequeDt,@DepositBank,@BankName,@ChequeDetails,@Userid, getdate())
end
if @mode=11 --insert DTL
begin
	INSERT INTO tblPurchaseDTL (PurID,ItemCode,UnitPrice,Qty,Amount,LotNumber,MafDate,ExpiryDate,Lmdt) 
	VALUES (@PurID,@ItemCode,@UnitPrice,@Qty,@Amount,@LotNumber,@MafDate,@ExpiryDate, getdate())
end
if @mode=111 --add in stock when item purchase
begin
	set @V_PCOUNT = (select COUNT(*) from tblStocks where ItemCode=ltrim(rtrim(@ItemCode)) and ItemSize=@ItemSize and LotNumber=@LotNumber)
	if(isnull(@V_PCOUNT,0)<=0)
	begin
		INSERT INTO tblStocks(LotNumber,ItemCode,ItemSize,StockQty,MinQty,MaxQty,Lmdt) VALUES (@LotNumber,@ItemCode,@ItemSize,@Qty,@MinQty,@MaxQty, getdate())
	end
	else
	begin
		update tblStocks set StockQty=StockQty+@Qty where ItemCode=@ItemCode and ItemSize=@ItemSize and LotNumber=@LotNumber
	end
end
if @mode=3 --delete
begin
	delete from tblPurchaseDTL where (PurID = @PurID) 
	delete from tblPurchaseHDR  where (PurID = @PurID) 
	delete from tblPayment where (PurID = @PurID) 
end
if @mode=33 -- deduct again item qty in stock when item delete
begin
	update tblStocks set StockQty=StockQty-@Qty where ItemCode=@ItemCode and ItemSize=@ItemSize and LotNumber=@LotNumber
end
if @mode=4 --find
begin
	select a.*,b.Name as SupplierName from tblPurchaseHDR a
	left join tblSuppliers b on a.SupplierId=b.SupplierId
end
if @mode=5 -- for Main grid
begin
	select a.PurId,a.PurDate,a.BillNo,a.VoucherNo,b.Name as CustomerName,a.LabourCost, a.NetAmount 
	from tblPurchaseHDR a 
	inner join tblCustomers b on a.SupplierId=b.CustId 
	order by a.PurId
end
if @mode=6 -- for Data fill
begin
	select a.PurId,a.PurDate,a.SupplierId as CustId,a.BillNo,a.LotNumber,a.VoucherNo,a.Remarks,a.Reference,a.TaxVAT,a.VAT,a.OtherCost,a.Discount,a.LabourCost,a.NetAmount,
	a.Paid,a.Due,a.PayMode,a.ChequeNo,a.ChequeDt,a.DepositBank,a.BankName,a.ChequeDetails,a.UserId,a.Lmdt,b.Name as SupplierName
	from tblPurchaseHDR a
	inner join tblSuppliers b on a.SupplierId=b.SupplierId
	where PurID=@PurID

	select b.ItemCode,b.ItemName,b.ItemSize,a.Qty,a.UnitPrice,a.Amount,isnull(a.LotNumber,'') as LotNumber,isnull(a.MafDate,'') as MafDate,isnull(a.ExpiryDate,'') as ExpiryDate 
	from tblPurchaseDTL a 
	left join tblItems b on a.Itemcode=b.ItemCode 
	where PurID=@PurID
end
if @mode=7 -- insert first time in tblMoney received 
begin
	INSERT INTO tblPayment(PurID,SupplierId,BillNo,PayMode,PayDate,PaidAmount,Remarks,ChequeNo,ChequeDate,IssueBank,DepositBank,ChequeDetails, UserId, Lmdt) 
				VALUES (@PurID,@SupplierId,@BillNo,@PayMode,@PayDate, @Paid,@Remarks,@ChequeNo,@ChequeDt,@DepositBank,@BankName,@ChequeDetails, @Userid, getdate())
end
if @mode=8 -- for Report
begin
	if(isnull(@BillNo,'')<>'')
	begin
		select a.*,b.ItemCode,b.UnitPrice,b.Qty,b.Amount,b.LotNumber,b.MafDate,b.ExpiryDate from tblPurchaseHDR a 
		inner join tblPurchaseDTL b on a.PurId=b.PurId  where BillNo=@BillNo and PurDate between @FromDate and @ToDate
	end
	else
	begin
		select a.*,b.ItemCode,b.UnitPrice,b.Qty,b.Amount,b.LotNumber,b.MafDate,b.ExpiryDate from tblPurchaseHDR a 
		inner join tblPurchaseDTL b on a.PurId=b.PurId and PurDate between @FromDate and @ToDate
	end
end
if @mode=9 -- for load combo data of supplier
begin
	select SupplierId,Name from tblSuppliers
end
SET @P_EXECSTATUS =1
CLEANUP:
	RETURN	
	
ERR_HANDLER:
	--SELECT @V_ERRORMSG = MATRIXSYSDB.DBO.FN_GETSYSTEMMESSAGES(@V_ERRORNO, @V_DISP_1, @V_DISP_2,  @V_DISP_3, @V_DISP_4, @V_DISP_5)
	RAISERROR (@V_ERRORMSG,16,1)
    GOTO CLEANUP
ERR_TRANEXIST:
	RAISERROR (@V_TRANEXIST, 16, 1)
	GOTO CLEANUP 






