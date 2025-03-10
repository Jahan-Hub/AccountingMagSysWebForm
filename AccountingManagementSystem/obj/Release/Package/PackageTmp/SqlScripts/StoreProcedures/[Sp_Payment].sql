USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Payment]    Script Date: 7/30/2021 12:45:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_Payment] --follow the same convention for sp, table etc name
(
	@mode			int				=4,
	@SupplierId		varchar(10)		=null,
	@BillNo			varchar(50)		=null,
	@PayMode		varchar(50)		=null,
	@PayDate		datetime		=null,
	@PayAmount		decimal(18,2)	=null,
	@PaidAmount		decimal(18,2)	=null,
	@DueAmount		decimal(18,2)	=null,
	@Remarks		varchar(250)	=null,
	@ChequeNo		varchar(50)		=null,
	@ChequeDate		datetime		=null,
	@IssueBank		varchar(150)	=null,
	@DepositBank	varchar(150)	=null,
	@ChequeDetails	varchar (250)	=null,
	@UserId			varchar(50)		=null,
	@TrackId		int				=0,

	@VoucherNo		varchar(50)		=null,
	@FromDate		Datetime		=null,
	@ToDate			Datetime		=null,
	@DateOption		varchar(50)		=null
)
AS
DECLARE @STRSQL VARCHAR(MAX)
if @mode=1 --insert
begin
	INSERT INTO tblPayment (SupplierId,BillNo,PayMode,PayDate,PayAmount,PaidAmount,DueAmount,Remarks,ChequeNo,ChequeDate,IssueBank,DepositBank,ChequeDetails,UserId,Lmdt) 
	VALUES (@SupplierId,@BillNo,@PayMode,@PayDate,@PayAmount,@PaidAmount,@DueAmount,@Remarks,@ChequeNo,@ChequeDate,@IssueBank,@DepositBank,@ChequeDetails,@UserId,GETDATE())
	------------------------------------update purchase table when payment
	update tblPurchaseHDR set Due=Due-@PaidAmount where SupplierId=@SupplierId and BillNo=@BillNo
end
if @mode=2 --update
begin
	update tblPayment set SupplierId=@SupplierId,PayDate=@PayDate
end
if @mode=5 --get amount by voucher
begin
	select Due from tblPurchaseHDR where BillNo=@BillNo
end
if @mode=6 --get amount by challan
begin
	select NetAmount from tblPurchaseHDR where VoucherNo =@BillNo
end
if @mode=7 --get VoucherNo & ChallanNo by Supplier
begin
	select BillNo from tblPurchaseHDR where SupplierId =@SupplierId
end

if @mode=8 --get CustCode & ChallanNo by Supplier
begin
	select distinct a.SupplierId,b.Name from tblPurchaseHDR a inner join tblSuppliers b on a.SupplierId=b.SupplierId
	--select distinct a.CustCode,b.Name from tblMoneyReceived a inner join tblCustomers b on a.CustCode=b.CustId
end

if @mode=9 -- for facing data by invoice or challan
begin
	select * from tblPayment where SupplierId=@SupplierId and BillNo=@BillNo
	--select * from tblMoneyReceived where CustCode=@CustCode and InvoiceNo=@InvoiceNo
end
if @mode=10 --for report
begin
	SET @STRSQL =''
	SET @STRSQL = @STRSQL +	'select a.*,b.Name as SupplierName from tblPayment a '+CHAR(13)
	SET @STRSQL = @STRSQL +	'left join tblSuppliers b on a.SupplierId=b.SupplierId '+CHAR(13)
	SET @STRSQL = @STRSQL +	'where a.SupplierId<>'''' '+CHAR(13)
	IF(isnull(@ToDate,'') <> '')
		begin
			SET @STRSQL = @STRSQL +	' and a.PayDate between '''+convert(varchar, isnull(@FromDate,''''),120)+''' and '''+convert(varchar, isnull(@ToDate,''''),120)+''' ' 
		end
	IF ISNULL(@SupplierId,'')<>''
	begin
		SET @STRSQL = @STRSQL +	' and a.SupplierId='''+@SupplierId+''' ' 
	end
	print (@STRSQL)
	exec (@STRSQL)
end






