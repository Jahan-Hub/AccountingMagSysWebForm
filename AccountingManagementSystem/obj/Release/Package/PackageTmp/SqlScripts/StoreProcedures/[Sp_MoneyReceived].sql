USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_MoneyReceived]    Script Date: 7/30/2021 12:45:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_MoneyReceived] --ignore tbl convention from porcedure
(
	@mode			int			=4,
	@CustCode		varchar(10)	=null,
	@ReceivedMode	varchar(100)=null,
	@ReceivedDate	datetime	=null,
	@ReceiveAmount	decimal(18,4)=0.0000,
	@PayMode		varchar(50)	=null,
	@CheqNo			varchar(50)	=null,
	@CheqDate		datetime	=null,
	@IssueBank		varchar(150)=null,
	@DepositBank	varchar(150)=null,
	@ChequeDetails	varchar(250)=null,
	@AcctCode		varchar(10)	=null,
	@Particulars	varchar(200)=null,
	@Remarks		varchar(300)=null,
	@Userid			varchar (50)=null,
	@track_id		int			=null,

	@ChallanNo		varchar(20)	=null,
	@CustId			int			=null,
	@FromDate		Datetime	=null,
	@ToDate			Datetime	=null,
	@SalesId		varchar(15) =null,
	@DateOption		varchar(50)		=null
)
AS
	DECLARE  @V_SQLQRY   VARCHAR(MAX)

if @mode=1 --insert --will hit on stock and purchase table for amount deduct
begin
	INSERT INTO tblMoneyReceived (SalesId,custcode,receiveddate,receiveamount,PayMode,ChequeNo,ChequeDt,IssueBank,DepositBank,ChequeDetails, particulars,Remarks,userid,lmdt) 
	VALUES (@SalesId,@custcode,@receiveddate,@receiveamount,@PayMode,@cheqno,@cheqdate,@IssueBank,@DepositBank,@ChequeDetails,@particulars,@Remarks,@userid, getdate())
	------------------------------------update purchase table when payment
	update tblSalesHDR set Due=Due-@receiveamount where CustId=@CustCode and SalesId=@SalesId
	--select * from tblSalesHDR
end
if @mode=2 --update
begin
	update tblMoneyReceived set custcode=@custcode,receiveddate=@receiveddate,
	receiveamount=@receiveamount, PayMode=@PayMode,ChequeNo=@CheqNo,IssueBank=@IssueBank,DepositBank=@DepositBank,ChequeDetails=@ChequeDetails, --ChequeDt=@CheqDate,
	Particulars=@Particulars,Remarks=@Remarks, userid=@userid,lmdt=getdate()
	where SalesId=@SalesId and CustCode=@CustCode and track_id=@track_id
end
if @mode=5 --get net amount by voucher
begin
	--select Due from tblSalesHDR where SalesId=@SalesId

	select (a.NetAmount-sum(b.ReceiveAmount))Due from tblSalesHDR a
	left join  tblMoneyReceived b on a.SalesId=b.SalesId
	where a.SalesId=@SalesId
	group by a.NetAmount
end
if @mode=6 --get challan
begin
	select NetAmount from tblSalesHDR where ChallanNo =@ChallanNo
end
if @mode=7 --get voucher
begin
	select SalesId from tblSalesHDR where CustId=@CustId
end
if @mode=8 --get Customers
begin
	select distinct a.CustCode,b.Name from tblMoneyReceived a inner join tblCustomers b on a.CustCode=b.CustId
end
if @mode=9 --loading data for grid
begin
	select * from tblMoneyReceived where CustCode=@CustCode and SalesId=@SalesId
end
if @mode=10 --for report all data
begin
	select * from tblMoneyReceived a left join tblCustomers b on a.CustCode=b.CustId
end
--if @mode=11 --for report
--begin
--	if(isnull(@CustCode,'')='')
--	begin
--		select * from tblMoneyReceived where ReceivedDate between @FromDate and @ToDate
--	end
--	else
--	begin
--		select * from tblMoneyReceived where CustCode=@CustCode and ReceivedDate between @FromDate and @ToDate
--	end
--end

if @mode=11 -- Item individual
begin
	SET @V_SQLQRY='select a.*,b.Name  from tblMoneyReceived a 
	inner join tblCustomers b on a.CustCode=b.CustId
	where a.CustCode<> '''' and a.ReceiveAmount>0 '
	IF(isnull(@CustCode,'') <> '')
		BEGIN
			SET @V_SQLQRY=@V_SQLQRY + ' and a.CustCode = '''+ @CustCode +''' '
		END
	IF(isnull(@ToDate,'') <> '')
		begin
			SET @V_SQLQRY = @V_SQLQRY +	' and a.ReceivedDate between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' ' 
		end

		print (@V_SQLQRY)
		exec (@V_SQLQRY)
	--where ItemSize=@ItemSize and ItemCode=@ItemCode and (ExpiryDate between @FromDate and @ToDate)
end
if @mode=12 --
begin
	select * from tblMoneyReceived a where track_id=@track_id
end




