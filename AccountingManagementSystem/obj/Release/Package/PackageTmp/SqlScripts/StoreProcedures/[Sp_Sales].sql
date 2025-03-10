USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Sales]    Script Date: 7/30/2021 12:46:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_Sales] (
	@mode			int				= 4,
	@SalesId		varchar(15)		= null,
	@MonthYear		int				= null,
	@SalesDate		datetime		= null,
	@AmendmentDate	datetime		= null,
	@PONo			varchar(100)	= null,
	@PODate			datetime		= null,
	@ChallanNo		int				= null,
	@CustId			int				= null,
	@ShipTo			int				= null,
	@Remarks		varchar (200)	= null,
	@Reference		varchar (100)	= null,
	@TaxVAT			Decimal(18,4)	= 0.0000,
	@VAT			Decimal(18,4)	= 0.0000,
	@Discount		Decimal(18,4)	= 0.0000,
	@LabourCost		Decimal(18,4)	= 0.0000,
	@OtherCost		Decimal(18,4)	= 0.0000,
	@NetAmount		Decimal(18,4)	= 0.0000,
	@Paid			Decimal(18,4)	= 0.0000,
	@Due			Decimal(18,4)	= 0.0000,
	@PayMode		varchar (100)	= null,
	@ChequeNo		varchar (80)	= null,
	@ChequeDt		datetime		= null,
	@DepositBank	varchar (50)	= null,
	@BankName		varchar (150)	= null,
	@ChequeDetails	varchar (250)	= null,
	@BKash			varchar (50)	= null,
	@Rocket			varchar (50)	= null,
	@Card			varchar (50)	= null,
	@Userid			varchar (50)	= null,
	@Particulars	varchar (200)	= null,
	---------------------------------- for dtl
	@ItemCode		varchar (5)		= null,
	@Qty			int				= 0,
	@UnitPrice		money			= 0.0000,
	@Amount			money			= 0.0000,
	@LotNumber		varchar (100)	= null,
	@MafDate		datetime		= null,
	@ExpiryDate		datetime		= null,
	@ItemSize		int				= null,

	@ItemCatId		VARCHAR (5)		=null
	)
AS
declare @Message varchar(100)
if @mode=1 --insert HDR
begin
	INSERT INTO tblSalesHDR (SalesId,MonthYear, SalesDate,AmendmentDate,PONo,PODate,ChallanNo,LotNumber, CustId,ShipTo, Remarks, Reference,TaxVAT,VAT, Discount, LabourCost,OtherCost,
	NetAmount, Paid, Due, PayMode, ChequeNo, ChequeDt, DepositBank, BankName,ChequeDetails,UserId, Lmdt) 
	VALUES (@SalesId,@MonthYear, @SalesDate,@AmendmentDate,@PONo,@PODate, @ChallanNo,@LotNumber, @CustId,@ShipTo, @Remarks, @Reference,@TaxVAT,@VAT, @Discount, @LabourCost,@OtherCost,
	@NetAmount, @Paid, @Due, @PayMode, @ChequeNo, @ChequeDt, @DepositBank, @BankName,@ChequeDetails,@Userid, getdate())
end
if @mode=11 --insert DTL
begin
	--declare @ExistQty decimal (18,2)
	--SET @ExistQty = (select StockQty from tblStocks where ItemCode=@ItemCode)
	--if(@ExistQty>=@Qty)
	--begin
			INSERT INTO tblSalesDTL(SalesId,CustId,Itemcode,Qty,UnitPrice,Amount,LotNumber,MafDate,ExpiryDate)
			VALUES (@SalesId,@CustId,@ItemCode,@Qty,@UnitPrice,@Amount,@LotNumber,@MafDate,@ExpiryDate)
	--end
	--else
	--begin
	--	SET @Message='Check Stock Qty.'
	--end
end
if @mode=111 --deduct from stock when item sales
begin
	update tblStocks set StockQty=StockQty-@Qty where ItemCode=@ItemCode and LotNumber=@LotNumber --and ItemSize=@ItemSize
end
if @mode=112 --add/increase stock when edit/update
begin
	update tblStocks set StockQty=StockQty+@Qty where ItemCode=@ItemCode and LotNumber=@LotNumber --and ItemSize=@ItemSize
end
--if @mode=2 --update HDR
--begin
--	update tblPurchaseHDR set PurDate=@PurDate, SupplierId=@SupplierId, ChallanNo=@ChallanNo, VoucherNo=@VoucherNo, 
--	SalesRef=@SalesRef,Remarks=@Remarks,TotalAmount=@TotalAmount,LabourCost=@LabourCost,Userid=@Userid,Lmdt=GETDATE() WHERE (PurID = @PurID) 
--end
--if @mode=22 --update DTL
--begin
--	update tblPurchaseDTL set ItemCode=@ItemCode,UnitPrice=@UnitPrice,Qty=@Qty,Amount=@Amount,Lmdt=GETDATE() WHERE (PurID = @PurID) 
--end
if @mode=3 --delete
begin
	-----------------------------------log table------------------------------------
	INSERT INTO tblSalesDTL_Log	SELECT * FROM tblSalesDTL where (SalesId = @SalesId) 
	INSERT INTO tblSalesHDR_Log	SELECT * FROM tblSalesHDR where (SalesId = @SalesId)
	INSERT INTO tblMoneyReceived_Log SELECT * FROM tblMoneyReceived where (SalesId = @SalesId)

	update tblSalesHDR_Log set Remarks=@Remarks,DeleteOn=GETDATE() where (SalesId = @SalesId)

	delete from tblSalesDTL where (SalesId = @SalesId and CustId=@CustId) 
	delete from tblSalesHDR  where (SalesId = @SalesId and CustId=@CustId) 
	delete from tblMoneyReceived where (SalesId = @SalesId and CustCode=@CustId) 
end
if @mode=33 ----add again item qty in stock when item delete
begin
	update tblStocks set StockQty=StockQty+@Qty where ItemCode=@ItemCode and LotNumber=@LotNumber -- and ItemSize=@ItemSize
end
if @mode=4 --find
begin
	select a.*,b.Name as CustomerName from tblSalesHDR a
	left join tblCustomers b on a.CustId=b.CustId
	order by a.SalesId desc
end
if @mode=5 -- for Main grid
begin
	select a.SalesId,a.SalesDate,a.PONo,a.PODate, a.ChallanNo,b.Name as CustomerName,a.TaxVAT,a.LabourCost,a.OtherCost, a.NetAmount 
	from tblSalesHDR a 
	inner join tblCustomers b on a.CustId=b.CustId 
	order by a.SalesId
end
if @mode=6 -- for Data fill
begin
	select a.SalesId,a.SalesDate,a.PONo,a.PODate, a.CustId,a.ShipTo,a.ChallanNo,a.LotNumber,a.Remarks,a.Reference,a.TaxVAT,a.VAT,a.Discount,
	a.LabourCost,a.OtherCost,a.NetAmount,a.Paid,a.Due,a.PayMode,a.ChequeNo,a.ChequeDt,a.DepositBank,a.BankName,a.ChequeDetails,a.UserId,
	a.Lmdt,b.Name as CustName,c.Name as ShipToName,d.Name as RefName
	from tblSalesHDR a
	inner join tblCustomers b on a.CustId=b.CustId
	left join tblCustomers c on a.ShipTo=c.CustId
	left join tblCustomers d on a.Reference=d.CustId
	where SalesId=@SalesId

	select a.Itemcode,b.ItemName,c.Name ItemSize, b.ItemAlias,a.Qty,a.UnitPrice,a.amount,isnull(a.LotNumber,'') as LotNumber,
	isnull(a.MafDate,'') as MafDate,isnull(a.ExpiryDate,'') as ExpiryDate from tblSalesDTL a
	left join tblItems b on a.Itemcode=b.ItemCode
	left join tblItemSize c on b.ItemSize=c.Id
	where SalesId=@SalesId
end

if @mode=7 -- insert first time in tblMoney received 
begin
	INSERT INTO tblMoneyReceived(SalesId,CustCode,ReceivedDate,ReceiveAmount,PayMode,ChequeNo,ChequeDt,IssueBank,DepositBank,ChequeDetails,Particulars, UserId, Lmdt) 
						VALUES (@SalesId,@CustId,@SalesDate,@Paid, @PayMode,@ChequeNo,@ChequeDt,@DepositBank,@BankName,@ChequeDetails,@Particulars, @Userid, getdate())
end
if @mode=8 -- Load data for combo
begin
	select CustId,Name from tblCustomers
end
if @mode=9 -- get lot number 
begin
	select isnull(LotNumber,'')LotNumber,StockQty,format(Lmdt,'dd-MM-yyyy')EntryDate from tblStocks where ItemCode=@ItemCode and StockQty>0 order by Lmdt
end
if @mode=10 -- get Maf. and Exp date by lot number 
begin
	select isnull(MafDate,'') as MafDate,isnull(ExpiryDate,'') as ExpiryDate from tblPurchaseDTL where LotNumber=@LotNumber and ItemCode=@ItemCode
end
if @mode=12 -- get Item Name aginst item category and lot number
begin
	select distinct a.ItemCode,a.ItemAlias,a.ItemName from tblItems a 
	left join tblPurchaseDTL b on a.ItemCode=b.ItemCode
	where a.ItemCatId=@ItemCatId 
	--and b.LotNumber=@LotNumber
end



