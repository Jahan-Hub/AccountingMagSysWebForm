USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_SalesReturn]    Script Date: 7/30/2021 12:46:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_SalesReturn] (
	@mode			int				= 4,
	@Date			datetime		= null,
	@CustCode		varchar (50)	= null,
	@InvoiceNo		varchar (50)	= null,
	@ItemCode		varchar (50)	= null,
	@Qty			Decimal(18,2)	= 0.00,
	@Rate			Decimal(18,2)	= 0.00,
	@Amount			Decimal(18,2)	= 0.00,
	@Remarks		varchar (250)	= null,
	@UserId			varchar (50)	= null,
	@dt				datetime		= null,
	@TrackId		int				= null,
	@FromDate		Datetime		= null,
	@ToDate			Datetime		= null
	)
AS
declare @Message varchar(100)
if @mode=1
begin
	INSERT INTO tblSalesReturn (Date, CustCode,InvoiceNo,ItemCode,Qty,Rate,Amount,Remarks,UserId,dt) 
	VALUES (@Date,@CustCode,@InvoiceNo,@ItemCode,@Qty,@Rate,@Amount,@Remarks,@Userid, getdate())
end
if @mode=111 --add in stock when item sales return
begin
	update tblStocks set StockQty=StockQty+@Qty where ItemCode=@ItemCode
end
if @mode=2
begin
	UPDATE tblSalesReturn SET Date=@Date, CustCode=@CustCode,InvoiceNo=@InvoiceNo,ItemCode=@ItemCode,
	Qty=@Qty,Rate=@Rate,Amount=@Amount,Remarks=@Remarks,UserId=@Userid,dt=getdate() where TrackId=@TrackId
end
if @mode=3
begin
	DELETE FROM tblSalesReturn WHERE TrackId=@TrackId
end
if @mode=4 -- and for  report also
begin
	SELECT * FROM tblSalesReturn
end
if @mode=5 --get net amount by voucher
begin
	select a.SalesId,a.Itemcode,b.ItemName,c.Name as ItemSize,e.Name as Category,
	d.Name as Pack,a.LotNumber,a.ExpiryDate,a.Qty,a.UnitPrice,a.Amount,f.NetAmount
	from tblSalesDTL a
	left join tblItems b on a.Itemcode=b.ItemCode
	left join tblItemSize c on b.ItemSize=c.Id
	left join tblPacking d on b.Pack=d.Id
	left join tblCategory e on b.ItemCatId=e.CatId
	left join tblSalesHDR f on a.SalesId=f.SalesId
	where a.SalesId=@InvoiceNo
end
if @mode=6 --get challan
begin
	select NetAmount from tblSalesHDR where VoucherNo =@InvoiceNo
end
if @mode=7 --get voucher
begin
	select VoucherNo from tblSalesHDR where CustId=@CustCode and VoucherNo not in (select InvoiceNo from tblSalesReturn)
end
if @mode=8 --get Customers
begin
	select distinct a.CustCode,b.Name from tblMoneyReceived a inner join tblCustomers b on a.CustCode=b.CustId
end
if @mode=9 --loading data for grid
begin
	select * from tblMoneyReceived where CustCode=@CustCode and InvoiceNo=@InvoiceNo
end
if @mode=10 --for report
begin
	if(isnull(@CustCode,'')='')
	begin
		select a.*,b.Name as CustName,c.ItemName from tblSalesReturn a
		inner join tblCustomers b on a.CustCode=b.CustId
		inner join tblItems c on a.ItemCode=c.ItemCode
		where [Date] between @FromDate and @ToDate
	end
	else
	begin
		select * from tblSalesReturn where CustCode=@CustCode and [Date] between @FromDate and @ToDate
	end
end





