USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Expense]    Script Date: 7/30/2021 12:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_Expense] 
(
	@mode			int				= 4,
	@ExId			int				= null,
	@ExHead			int				= null,
	@ExElement		int				= null,
	@ExDate			datetime		= null,
	@ExHandedTo		varchar (100)	= null,
	@Amount			Decimal(18,2)	= 0.0000,
	@Remarks		varchar (250)	= null,
	@Userid			varchar (50)	= null,
	@PayMode		varchar (100)	= null,
	@ChequeNo		varchar (80)	= null,
	@ChequeDt		datetime		= null,
	@DepositBank	varchar (50)	= null,
	@BankName		varchar (150)	= null,
	@ChequeDetails	varchar (250)	= null
)
AS
if @mode=1
begin
	INSERT INTO tblExpense(Id, CostHead,CostElement, Date, HandedTo, Amount, Remarks,PayMode, ChequeNo, ChequeDt, DepositBank, BankName,ChequeDetails, Userid, Lmdt) 
	VALUES (@ExId, @ExHead,@ExElement, @ExDate, @ExHandedTo,@Amount,@Remarks,@PayMode, @ChequeNo, @ChequeDt, @DepositBank, @BankName,@ChequeDetails,@Userid, getdate())
end
if @mode=2
begin
	update tblExpense set CostHead=@ExHead,CostElement=@ExElement, Date=@ExDate, HandedTo=@ExHandedTo, Amount=@Amount, 
	Remarks=@Remarks,Userid=@Userid,PayMode=@PayMode,ChequeNo=@ChequeNo,ChequeDt=@ChequeDt,DepositBank=@DepositBank,
	BankName=@BankName,ChequeDetails=@ChequeDetails,Lmdt=GETDATE() WHERE (Id = @ExId) 
end
if @mode=3
begin
	delete from tblExpense where (Id = @ExId) 
end
if @mode=4 
begin
	select a.*,b.Name as CostHeadName,c.Name as CostElementName 
	from tblExpense a 
	inner join tblCostCenters b on a.CostHead = b.Id
	inner join tblCostElements c on a.CostElement=c.Id order by Id desc
end
if @mode=5 -- for grid
begin
	select a.*,b.Name as CostCenterName,c.Name as CostElementName 
	from tblExpense a
	left join tblCostCenters b on a.CostHead=b.Id
	left join tblCostElements c on a.CostElement=c.Id
	where a.Id = @ExId
end
if @mode=6 -- for cost center in combo
begin
	select * from tblCostCenters
end
if @mode=7 -- for cost element in combo
begin
	select a.Id,a.Alias,a.Name,b.Name as CostCenter from tblCostElements a inner join tblCostCenters b on a.CostCenterId=b.Id where a.CostCenterId=@ExHead
end

