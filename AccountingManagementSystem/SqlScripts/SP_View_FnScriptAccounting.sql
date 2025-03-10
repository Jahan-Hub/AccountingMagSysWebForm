USE [AccountingMSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[OpenBal]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE       FUNCTION [dbo].[OpenBal](@mode int,@acc_code varchar(10),@st_dt datetime,@prj_code varchar(10))
RETURNS money
AS
BEGIN
Declare @OpenBal money
set @OpenBal=(select sum(case b.acc_group when 1 then (a.dr_amt-a.cr_amt)
when 2 then (a.cr_amt-a.dr_amt)
when 3 then (a.cr_amt-a.dr_amt)
when 4 then (a.cr_amt-a.dr_amt)
when 5 then (a.dr_amt-a.cr_amt)
when 6 then (a.dr_amt-a.cr_amt)
when 7 then (a.cr_amt-a.dr_amt)
when 8 then (a.dr_amt-a.cr_amt)
else 0 end) from ledger a,acct b where a.acc_code=b.acc_code
and a.vou_date<@st_dt and a.acc_code=@acc_code)
---and a.vou_date<@st_dt and a.acc_code in (select acc_code from acct where acc_head=@acc_code))

RETURN isnull(@OpenBal,0)
END


GO
/****** Object:  UserDefinedFunction [dbo].[OpenBal_Bl]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/****** Object:  User Defined Function dbo.tot_dr_cr    Script Date: 23/07/2002 5:08:17 PM ******/
CREATE    FUNCTION [dbo].[OpenBal_Bl](@mode int,@acc_code varchar(10),@prj_code varchar(10))
RETURNS money
AS
BEGIN
Declare @OpenBal money
set @OpenBal=(select sum(case b.acc_group when 1 then (a.dr_amt-a.cr_amt)
when 2 then (a.cr_amt-a.dr_amt)
when 3 then (a.cr_amt-a.dr_amt)
when 4 then (a.cr_amt-a.dr_amt)
when 5 then (a.dr_amt-a.cr_amt)
when 6 then (a.dr_amt-a.cr_amt)
when 7 then (a.cr_amt-a.dr_amt)
when 8 then (a.dr_amt-a.cr_amt)
when 9 then (a.cr_amt-a.dr_amt)
else 0 end) from ledger a,acct b where a.acc_code=b.acc_code
and a.vou_type='OP' and a.acc_code=@acc_code)

RETURN isnull(@OpenBal,0)
END


GO
/****** Object:  UserDefinedFunction [dbo].[OpenBal_tb]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE       FUNCTION [dbo].[OpenBal_tb](@mode int,@acc_code varchar(10),@st_dt datetime,@prj_code varchar(10))
RETURNS money
AS
BEGIN
Declare @OpenBal money
set @OpenBal=isnull((select sum(dr_amt-cr_amt) from ledger
where vou_date<@st_dt and acc_code=@acc_code),0)

RETURN isnull(@OpenBal,0)
END


GO
/****** Object:  UserDefinedFunction [dbo].[OpenBal_tbCr]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE       FUNCTION [dbo].[OpenBal_tbCr](@mode int,@acc_code varchar(10),@st_dt datetime,@prj_code varchar(10))
RETURNS money
AS
BEGIN
Declare @OpenBal_Cr money
set @OpenBal_Cr=isnull((select sum(cr_amt) from ledger
where vou_date<@st_dt and acc_code=@acc_code),0)

RETURN isnull(@OpenBal_Cr,0)
END

GO
/****** Object:  UserDefinedFunction [dbo].[OpenBal_tbdr]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE       FUNCTION [dbo].[OpenBal_tbdr](@mode int,@acc_code varchar(10),@st_dt datetime,@prj_code varchar(10))
RETURNS money
AS
BEGIN
Declare @OpenBal_Dr money
set @OpenBal_Dr=isnull((select sum(dr_amt) from ledger
where vou_date<@st_dt and acc_code=@acc_code),0)

RETURN isnull(@OpenBal_Dr,0)
END

GO
/****** Object:  UserDefinedFunction [dbo].[tb_Cr]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE       FUNCTION [dbo].[tb_Cr](@mode int,@acc_code varchar(10),@st_dt datetime,@ed_dt datetime,@prj_code varchar(10))
RETURNS money
AS
BEGIN
Declare @tb_Cr money
set @tb_Cr=isnull((select sum(cr_amt) from ledger
where vou_date between @st_dt and @ed_dt and acc_code=@acc_code),0)

RETURN isnull(@tb_Cr,0)
END


GO
/****** Object:  UserDefinedFunction [dbo].[tb_Dr]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE       FUNCTION [dbo].[tb_Dr](@mode int,@acc_code varchar(10),@st_dt datetime,@ed_dt datetime,@prj_code varchar(10))
RETURNS money
AS
BEGIN
Declare @tb_Dr money
set @tb_Dr=isnull((select sum(dr_amt) from ledger
where vou_date between @st_dt and @ed_dt and acc_code=@acc_code),0)

RETURN isnull(@tb_dr,0)
END

GO
/****** Object:  UserDefinedFunction [dbo].[tot_dr_cr]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  User Defined Function dbo.tot_dr_cr    Script Date: 23/07/2002 5:08:17 PM ******/
CREATE  FUNCTION [dbo].[tot_dr_cr](@mode int,@vou_no varchar(10),@vou_type char(2))
RETURNS money
AS
BEGIN
Declare @tot_amt money
if @mode=1 set @tot_amt=(select sum(isnull(dr_amt,0)) from vou where vou_no=@vou_no and vou_type=@vou_type group by vou_no)
if @mode=2 set @tot_amt=(select sum(isnull(cr_amt,0)) from vou where vou_no=@vou_no and vou_type=@vou_type group by vou_no)
if @mode=3 set @tot_amt=(select isnull(sum(dr_amt-cr_amt),0) from vou where vou_no=@vou_no and vou_type=@vou_type group by vou_no)
RETURN @tot_amt
END


GO
/****** Object:  View [dbo].[vew_budget]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View dbo.vew_budget    Script Date: 16/07/2004 11:42:58 PM ******/

/****** Object:  View dbo.vew_budget    Script Date: 10/07/2002 12:48:02 AM ******/
CREATE      VIEW [dbo].[vew_budget]
AS

select a.acc_code,a.acc_group,tot_budget=isnull(sum(a.acc_budg),0),
tot_bal=isnull((select sum(b.cr_amt-b.dr_amt) from ledger b where a.acc_code=b.acc_code),0)
from acct a where a.acc_group in(4,7,9)  and a.acc_lbl=1 group by a.acc_group,a.acc_code

union all

select a.acc_code,a.acc_group,tot_budget=isnull(sum(a.acc_budg),0),
tot_bal=isnull((select sum(b.dr_amt-b.cr_amt) from ledger b where a.acc_code=b.acc_code),0)
from acct a where a.acc_group in(5,6,8) and a.acc_lbl=1 group by a.acc_group,a.acc_code



GO
/****** Object:  View [dbo].[vew_vou]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  VIEW [dbo].[vew_vou]
AS

SELECT vou_no,vou_date,vou_narr,acc_code,
dr_amt,cr_amt,vou_type,vou_chq,OfficeName,uid,dt,track_id FROM vou
where vou_type<>'JV' and acc_code not in
(select acc_code from acct where (acc_code='1101') or (acc_head='1102'))
GO
/****** Object:  StoredProcedure [dbo].[ComboLoadDataForAll]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComboLoadDataForAll]
(
	@Mode INT= 4,
	@SearchText VARCHAR(MAX) = NULL,
	@SearchFld VarChar(Max) = NULL,
	@OrderByFld Varchar(Max) = NULL,
	@StartNo INT = 0,
	@EndNo INT = 0,
	@SecCode Varchar(50) = NULL
)
AS
	DECLARE @v_ErrorNo DECIMAL
	DECLARE @v_ErrorMsg VARCHAR(2000)
	DECLARE @v_Disp_1 VARCHAR(30)
	DECLARE @v_Disp_2 VARCHAR(30)
	DECLARE @v_Disp_3 VARCHAR(30)
	DECLARE @v_Disp_4 VARCHAR(30)
	DECLARE @v_Disp_5 VARCHAR(30)
	DECLARE @SQLQRY VARCHAR(MAX)
BEGIN

--IF @Mode=5 -- for Bank Name from Accounts for A/C Name
--BEGIN
--	SET @SQLQRY = 'SELECT ROW_NUMBER() OVER(ORDER BY BankName) AS RNUM, A.*
--	INTO #ItemTmp
--	FROM (

--	select Acc_Code as BankCode,Acc_Name as BankName from acct where Acc_Head<>1103
--	) A
--	WHERE BankName Like ''%' + @SearchText + '%''
--	SELECT @@rowcount
--	SELECT BankName,BankCode FROM #ItemTmp
--	WHERE RNUM <= ' + Convert(VarChar,@EndNo) + ' AND RNUM >= ' + Convert(VarChar,@StartNo)
--	SET @SQLQRY = @SQLQRY+ ' order by BankName'
--	EXEC (@SQLQRY)
--	--print (@SQLQRY)
--END


--IF @Mode=11-- for Bank Name from Acct only (Deposit Bank)
--BEGIN
--	SET @SQLQRY = 'SELECT ROW_NUMBER() OVER(ORDER BY BankName) AS RNUM, A.*
--	INTO #ItemTmp
--	FROM (

--	select Acc_Code as BankCode,Acc_Name as BankName from acct where Acc_Head=1102
--	) A
--	WHERE BankName Like ''%' + @SearchText + '%''
--	SELECT @@rowcount
--	SELECT BankName,BankCode FROM #ItemTmp
--	WHERE RNUM <= ' + Convert(VarChar,@EndNo) + ' AND RNUM >= ' + Convert(VarChar,@StartNo)
--	SET @SQLQRY = @SQLQRY+ ' order by BankName'
--	EXEC (@SQLQRY)
--	--print (@SQLQRY)
--END

IF @Mode=12-- for Debtors / Creditors in Accounts Module
BEGIN
	SET @SQLQRY = 'SELECT ROW_NUMBER() OVER(ORDER BY acc_name) AS RNUM, A.*
	INTO #ItemTmp
	FROM (

	select * from acct where acc_status=''T'' and acc_head like ''11%''
	) A
	WHERE acc_name Like ''%' + @SearchText + '%''
	SELECT @@rowcount
	SELECT acc_name,acc_code FROM #ItemTmp
	WHERE RNUM <= ' + Convert(VarChar,@EndNo) + ' AND RNUM >= ' + Convert(VarChar,@StartNo)
	SET @SQLQRY = @SQLQRY+ ' order by acc_name'
	EXEC (@SQLQRY)
	--print (@SQLQRY)
END

IF @Mode=13-- for All in Accounts Module
BEGIN
	SET @SQLQRY = 'SELECT ROW_NUMBER() OVER(ORDER BY acc_name) AS RNUM, A.*
	INTO #ItemTmp
	FROM (

	select * from acct where acc_status=''T'' ---and acc_head like ''11%''
	) A
	WHERE acc_name Like ''%' + @SearchText + '%''
	SELECT @@rowcount
	SELECT acc_name,acc_code FROM #ItemTmp
	WHERE RNUM <= ' + Convert(VarChar,@EndNo) + ' AND RNUM >= ' + Convert(VarChar,@StartNo)
	SET @SQLQRY = @SQLQRY+ ' order by acc_name'
	EXEC (@SQLQRY)
	--print (@SQLQRY)
END

--IF @Mode=14-- for All Expense in Accounts Module
--BEGIN
--	SET @SQLQRY = 'SELECT ROW_NUMBER() OVER(ORDER BY acc_name) AS RNUM, A.*
--	INTO #ItemTmp
--	FROM (

--	select * from acct where acc_status=''T'' ---and acc_head like ''81%''
--	) A
--	WHERE acc_name Like ''%' + @SearchText + '%''
--	SELECT @@rowcount
--	SELECT acc_name,acc_code FROM #ItemTmp
--	WHERE RNUM <= ' + Convert(VarChar,@EndNo) + ' AND RNUM >= ' + Convert(VarChar,@StartNo)
--	SET @SQLQRY = @SQLQRY+ ' order by acc_name'
--	EXEC (@SQLQRY)
--	--print (@SQLQRY)
--END

--IF @Mode=15-- for All Expense in Accounts Module
--BEGIN
--	SET @SQLQRY = 'SELECT ROW_NUMBER() OVER(ORDER BY acc_name) AS RNUM, A.*
--	INTO #ItemTmp
--	FROM (

--	select * from acct where acc_status=''T'' and acc_head like ''3103%''
--	) A
--	WHERE acc_name Like ''%' + @SearchText + '%''
--	SELECT @@rowcount
--	SELECT acc_name,acc_code FROM #ItemTmp
--	WHERE RNUM <= ' + Convert(VarChar,@EndNo) + ' AND RNUM >= ' + Convert(VarChar,@StartNo)
--	SET @SQLQRY = @SQLQRY+ ' order by acc_name'
--	EXEC (@SQLQRY)
--	--print (@SQLQRY)
--END

--IF @Mode=16-- for All in Accounts Module
--BEGIN
--	SET @SQLQRY = 'SELECT ROW_NUMBER() OVER(ORDER BY acc_name) AS RNUM, A.*
--	INTO #ItemTmp
--	FROM (

--	select * from acct where acc_status=''T'' and acc_head like ''3103%''
--	) A
--	WHERE acc_name Like ''%' + @SearchText + '%''
--	SELECT @@rowcount
--	SELECT acc_name Name,acc_code code FROM #ItemTmp
--	WHERE RNUM <= ' + Convert(VarChar,@EndNo) + ' AND RNUM >= ' + Convert(VarChar,@StartNo)
--	SET @SQLQRY = @SQLQRY+ ' order by acc_name'
--	EXEC (@SQLQRY)
--	--print (@SQLQRY)
--END

--IF @Mode=17-- for All in Customer Accounts Module
--BEGIN
--	SET @SQLQRY = 'SELECT ROW_NUMBER() OVER(ORDER BY acc_name) AS RNUM, A.*
--	INTO #ItemTmp
--	FROM (

--	select * from acct where acc_status=''T'' and acc_head like ''1103%''
--	) A
--	WHERE acc_name Like ''%' + @SearchText + '%''
--	SELECT @@rowcount
--	SELECT acc_name Name,acc_code code FROM #ItemTmp
--	WHERE RNUM <= ' + Convert(VarChar,@EndNo) + ' AND RNUM >= ' + Convert(VarChar,@StartNo)
--	SET @SQLQRY = @SQLQRY+ ' order by acc_name'
--	EXEC (@SQLQRY)
--	--print (@SQLQRY)
--END

END
--CleanUp:
-- RETURN
--ERR_HANDLER:
-- SELECT @v_ErrorMsg = MATRIXSYSDB.DBO.fn_GetSystemMessages(@v_ErrorNo, @v_Disp_1, @v_Disp_2, @v_Disp_3, @v_Disp_4, @v_Disp_5)
-- RAISERROR (@v_ErrorMsg,16,1)
--    GOTO CleanUp
--GO


GO
/****** Object:  StoredProcedure [dbo].[DeleteVou]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE   PROC [dbo].[DeleteVou]
	@mode int,
	@vou_no varchar(10),
	@vou_type char(2),
	@track_id varchar (15)
AS

set nocount on

--delete against track_id
if @mode=1
begin
	delete from vou where track_id=@track_id

	select msg='Delete Successfully',tot_dr=isnull(dbo.tot_dr_cr(1,@vou_no,@vou_type),0),
	tot_cr=isnull(dbo.tot_dr_cr(2,@vou_no,@vou_type),0),tot_diff=isnull(dbo.tot_dr_cr(3,@vou_no,@vou_type),0)
end

--delete against voucher no
if @mode=2
begin
	delete from vou where vou_no=@vou_no and vou_type=@vou_type
	delete from Ledger where vou_no=@vou_no and vou_type=@vou_type

	select msg='Delete Successfully',tot_dr=isnull(dbo.tot_dr_cr(1,@vou_no,@vou_type),0),
	tot_cr=isnull(dbo.tot_dr_cr(2,@vou_no,@vou_type),0),tot_diff=isnull(dbo.tot_dr_cr(3,@vou_no,@vou_type),0)
end

set nocount off

GO
/****** Object:  StoredProcedure [dbo].[flush_vou]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[flush_vou]
	@var1 varchar(10),
	@var2 varchar(2)
AS
	Declare @title varchar(200)

	set @title=(select case @var2
	when 'JV' then 'JOURNAL VOUCHER'
	when 'CP' then 'CASH PAYMENT VOUCHER'
	when 'CR' then 'CASH RECEIPT VOUCHER'
	when 'BP' then 'BANK PAYMENT VOUCHER'
	when 'BR' then 'BANK RECEIPT VOUCHER'
	end)

	select vou_no,vou_date,vou_type,track_id,post_state,
	acc_nam=(select acc_name from acct where acct.acc_code=vou.acc_code),
	vou_narr,acc_code,dr_amt=isnull(dr_amt,0),cr_amt=isnull(cr_amt,0),vou_chq,
	title=@title ,grp=1
	from vou where vou_no=@var1 and vou_type=@var2 and cr_amt=0
union
	select vou_no,vou_date,vou_type,track_id,post_state,
	acc_nam=(select acc_name from acct where acct.acc_code=vou.acc_code),
	vou_narr,acc_code,dr_amt=isnull(dr_amt,0),cr_amt=isnull(cr_amt,0),vou_chq,
	title=@title,grp=2
	from vou where vou_no=@var1 and vou_type=@var2  and dr_amt=0
	order by grp
GO
/****** Object:  StoredProcedure [dbo].[post_open_bal]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE      PROCEDURE [dbo].[post_open_bal]
@status char(1),
@acc_code varchar(10),
@vou_date datetime,
@dr_amt money,
@cr_amt money,
@vou_Narr varchar(50),
@Particular varchar(10),
@uid varchar(50)
AS
set nocount on

if exists(select * from acct where acc_head=@acc_code) goto err_para

declare @@vou_no as varchar(10)
declare @@state as integer
declare @@acc_head as varchar(10)

set @@vou_no=@acc_code

if @status=1
begin

--- SELECT * FROM ledger
delete from ledger where vou_no=@acc_code and vou_type='OP'

insert into ledger (vou_no,vou_date,vou_Narr, acc_code,Particular, dr_amt,cr_amt,vou_type,uid,dt)
		values(@@vou_no,@vou_date,@vou_Narr, @acc_code,@Particular, @dr_amt,@cr_amt,'OP',@uid,Getdate())

select @@acc_head=acc_head,@@state=acc_lbl from acct where acc_code=@acc_code

	if @@state>1
	begin
	label1:
		insert into ledger (vou_no,vou_date,vou_Narr, acc_code,Particular, dr_amt,cr_amt,vou_type,uid,dt)
		values(@@vou_no,@vou_date,@vou_Narr, @@acc_head,@Particular, @dr_amt,@cr_amt,'OP',@uid,Getdate())

		set @acc_code=@@acc_head
     
		select @@acc_head=acc_head,@@state=acc_lbl from acct where acc_code=@acc_code
		if @@state>1 goto label1
	end
end

if @status=2
	begin
	delete from ledger where vou_no=@acc_code and vou_type='OP'
	end

if @status=3
	begin
	select a.*, b.Acc_Name from ledger a left join Acct b on a.acc_code=b.Acc_Code
	where a.acc_code=a.particular and  vou_type='OP'
	---- select * from ledger where @@vou_no=@acc_code and vou_type='OP'
	end

select msg='Operation successfull'

err_para:
select msg='Not an active account'

set nocount off

GO
/****** Object:  StoredProcedure [dbo].[PostingInLedger_AC]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[PostingInLedger_AC]
	@vou_no varchar(10),
	@vou_type char(2)
AS

	Set nocount on
	declare @diff money
	declare @acc_code as varchar(10)
	declare @state as varchar(10)
	declare @acc_head as varchar(10)
	declare @track_id int

BEGIN Tran

DECLARE vou_data CURSOR FOR
	SELECT track_id FROM vou WHERE vou_no=@vou_no and vou_type=@vou_type and post_state=0

OPEN vou_data

FETCH NEXT FROM vou_data INTO @track_id

WHILE @@FETCH_STATUS = 0
BEGIN

set @diff=(select sum(dr_amt-cr_amt) from vou where
vou_no=(select vou_no from vou where track_id=@track_id) and
vou_type=(select vou_type from vou where track_id=@track_id))


if @diff=0
BEGIN
insert into ledger (vou_no,vou_date,vou_narr,acc_code,particular,dr_amt,cr_amt,vou_type,uid,dt,track_id)
select  vou_no,vou_date,vou_narr,acc_code,particular,dr_amt,cr_amt,vou_type,uid,GETDATE(),track_id from vou
where track_id=@track_id

select @acc_head=acc_head,@state=acc_lbl from acct where acc_code=(select acc_code from vou
where track_id=@track_id)


if @state>1
BEGIN
label1:
     insert into ledger (vou_no,vou_date,vou_narr,acc_code,particular,dr_amt,cr_amt,vou_type,uid,dt,track_id)
     select  vou_no,vou_date,vou_narr,@acc_head,particular,dr_amt,cr_amt,vou_type,uid,GETDATE(),track_id from vou
                  where track_id=@track_id

     set @acc_code=@acc_head
     
     select @acc_head=acc_head,@state=acc_lbl from acct where acc_code=@acc_code
     if @state>1 goto label1

END

update vou set post_state=1 where track_id=@track_id
--********************************************
FETCH NEXT FROM vou_data INTO @track_id
select msg='Posted Successfully'
END
else
FETCH NEXT FROM vou_data INTO @track_id
select msg='Posting Cancel'
END

CLOSE vou_data
DEALLOCATE vou_data
set nocount off

commit tran
goto stop

err:
rollback tran

stop:

GO
/****** Object:  StoredProcedure [dbo].[Acct_AC]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[Acct_AC]
	@mode varchar(2)= null,
	@acc_code varchar (10)= null,
	@acc_name varchar (50)= null,
	@acc_budg money= 0,
	@acc_head varchar(8)= null,
	@exptype varchar(20)= null,
	@acc_status char(1)= null,
	@pl_rate float= 0,
	@trd_rate float= 0,
	@uid varchar (50)= null
AS
set nocount on
if @mode='1'
BEGIN
	declare @dep_acc varchar(10),@acc_group int,@acc_lbl int,@len int
	declare @dep_head varchar(10),@dep_len int

	set @acc_group=(select acc_group from acct where acc_code=@acc_head)
	set @acc_lbl=isnull((select acc_lbl from acct where acc_code=@acc_head),0)
	set @acc_lbl=(@acc_lbl+1)

	if @acc_code like '2101%'
	BEGIN
		set @len=len(@acc_code)
		set @dep_acc=substring(@acc_code,5,(@len-4))
		set @dep_acc='2102'+@dep_acc

		set @dep_len=len(@acc_head)
		set @dep_head=substring(@dep_acc,1,@dep_len)
	END

if exists(select * from acct where acc_code=@acc_code)
BEGIN
	if @acc_code like '2101%'
	BEGIN
		UPDATE acct
		SET acc_code=@dep_acc,acc_name='Acc.Dep. on '+@acc_name,acc_budg=@acc_budg,
		acc_group=@acc_group,acc_lbl=@acc_lbl,acc_head=@dep_head,
		uid=@uid
		WHERE acc_code=@dep_acc
	END

	UPDATE acct
		SET acc_code=@acc_code,acc_name=@acc_name,acc_budg=@acc_budg,
		acc_group=@acc_group,acc_lbl=@acc_lbl,acc_head=@acc_head,
		dep_acc=@dep_acc,uid=@uid
		WHERE acc_code=@acc_code

		select msg='Update successfully'
	END
ELSE
	BEGIN
		INSERT INTO acct(acc_code,acc_name,acc_budg,acc_group,acc_lbl,acc_head,acc_status,dep_acc,uid,Dt)
		VALUES(@acc_code,@acc_name,@acc_budg,@acc_group,@acc_lbl,@acc_head,@acc_status, @dep_acc,@uid,getdate())
		select msg='Insert successfully'
	END
END

if @mode='5'
BEGIN
	select * from acct where acc_head=@acc_head ORDER BY Acc_Head,Acc_Lbl,Acc_Group,Acc_Code
END

if @mode='6'
BEGIN
	select  Acc_Code, Acc_Name,Acc_Status, Acc_Budg from acct where Acc_Code=@acc_code
END

set nocount off

GO
/****** Object:  StoredProcedure [dbo].[Save_TempVou_Acc]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[Save_TempVou_Acc]
	@vou_no varchar (10)=null,
	@vou_date datetime=null,
	@vou_narr varchar (200)=null,
	@particular varchar (10)=null,
	@acct_code varchar (10)=null, ---for auto cash or bank or any entry
	@acc_code varchar (10)=null,
	@dr_amt money = "0",
	@cr_amt money="0",
	@vou_type char (2)=null,
	@vou_chq varchar (15)=null,
	@track_id int=null,
	@uid varchar (10)=null,
	@CustCode varchar(10)=null
AS
	declare @autodr_amt money
	declare @autocr_amt money
	set nocount on

if exists(select * from acct where acc_head=@acc_code) goto err_para2

if exists(select * from vou where track_id=@track_id)
BEGIN
	UPDATE vou
	SET vou_no=@vou_no,vou_date=@vou_date,vou_narr=@vou_narr,particular=@acct_code,
	acc_code=@acc_code,dr_amt=@dr_amt,cr_amt=@cr_amt,
	vou_type=@vou_type,vou_chq=@vou_chq,uid=@uid, CustCode=@CustCode
	WHERE track_id=@track_id

	--***************
	delete from ledger where vou_no=@vou_no and vou_type=@vou_type
	update vou set post_state=0 where vou_no=@vou_no and vou_type=@vou_type

	--****************
	---for auto update of cash/bank or any
	delete from vou where vou_no=@vou_no and vou_type=@vou_type and acc_code=@acct_code
	set @autodr_amt=(select sum(cr_amt) from vou where vou_no=@vou_no and vou_type=@vou_type)
	set @autocr_amt=(select sum(dr_amt) from vou where vou_no=@vou_no and vou_type=@vou_type)

	INSERT INTO vou(vou_no,vou_date,vou_narr,particular,acc_code, dr_amt,cr_amt,vou_type,vou_chq, uid,dt,post_state,CustCode)
	VALUES(@vou_no,@vou_date,@vou_narr,@acct_code,@acct_code,@autodr_amt, @autocr_amt,@vou_type,@vou_chq,@uid,GETDATE(),0,@CustCode)
	---*************************
	select msg='Data accepted',tot_dr=dbo.tot_dr_cr(1,@vou_no,@vou_type),
	tot_cr=dbo.tot_dr_cr(2,@vou_no,@vou_type),tot_diff=dbo.tot_dr_cr(3,@vou_no,@vou_type)
END
ELSE
BEGIN
	INSERT INTO vou(vou_no,vou_date,vou_narr,particular,acc_code,dr_amt,cr_amt,vou_type,vou_chq,uid,dt,post_state,CustCode)
	VALUES(@vou_no,@vou_date,@vou_narr,@acct_code,@acc_code,@dr_amt,@cr_amt,@vou_type,@vou_chq,@uid,GETDATE(),0,@CustCode)


	---for auto entry of cash/bank or any
	delete from vou where vou_no=@vou_no and vou_type=@vou_type and acc_code=@acct_code
	set @autodr_amt=(select sum(cr_amt) from vou where vou_no=@vou_no and vou_type=@vou_type)
	set @autocr_amt=(select sum(dr_amt) from vou where vou_no=@vou_no and vou_type=@vou_type)

	INSERT INTO vou(vou_no,vou_date,vou_narr,particular,acc_code,dr_amt,cr_amt,vou_type,vou_chq,uid,dt,post_state,CustCode)
	VALUES(@vou_no,@vou_date,@vou_narr,@acct_code,@acct_code,@autodr_amt,@autocr_amt,@vou_type,@vou_chq,@uid,GETDATE(),0,@CustCode)
	---*************************

	select msg='Data accepted',tot_dr=dbo.tot_dr_cr(1,@vou_no,@vou_type),
	tot_cr=dbo.tot_dr_cr(2,@vou_no,@vou_type),tot_diff=dbo.tot_dr_cr(3,@vou_no,@vou_type)
END

err_para1:
select msg='Only non-cash transaction allowed',tot_dr=isnull(dbo.tot_dr_cr(1,@vou_no,@vou_type),0),
tot_cr=isnull(dbo.tot_dr_cr(2,@vou_no,@vou_type),0),tot_diff=isnull(dbo.tot_dr_cr(3,@vou_no,@vou_type),0)

err_para2:
select msg='Not an active code',tot_dr=isnull(dbo.tot_dr_cr(1,@vou_no,@vou_type),0),
tot_cr=isnull(dbo.tot_dr_cr(2,@vou_no,@vou_type),0),tot_diff=isnull(dbo.tot_dr_cr(3,@vou_no,@vou_type),0)

set nocount off

GO
/****** Object:  StoredProcedure [dbo].[ReportManager_AC]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReportManager_AC] 
	@mode			varchar(2)		=null,
	@StartDate		datetime		=null,
	@ENDDate		datetime		=null,
	@acc_group		varchar(50)		=null,
	@vou_no			varchar(50)		=null,
	@vou_type		varchar(2)		=null,
	@AccType		varchar(50)		=null,
	@SubType		varchar(50)		=null,
	@AccountHead	varchar(50)		=null,
	@Acc_Code		varchar(50)		=null
AS
	DECLARE @STRSQL AS Varchar(8000)
	declare @FinYearStartDate as datetime
	declare @FinYearENDDate as datetime

	declare @comp_name varchar(100)
	declare @comp_addr varchar(300)
	declare @ed_dt datetime
	declare @title varchar(200)
	Declare @Tot_pl money
	Declare @Opn_pl money

	SET @ed_dt=isnull((select ed_dt from tblCompany),getdate())
	SET @FinYearStartDate=(select top 1 st_dt from tblCompany)
	SET @FinYearENDDate=(select top 1 ed_dt from tblCompany)

	--SET @CustCode='1103'+@CustCode

	declare @opening1 money
	declare @opening2 money

--if @mode='3' -- chart of accounts report
--BEGIN
--	select * from acct order by Acc_Code,Acc_Head
--END

--if @mode='4' -- chart of accounts report for individual
--BEGIN
--	select * from acct  where acc_group=@acc_group
--END

if @mode='5' -- individual voucher print (Debit)
BEGIN
	SET @STRSQL = ''
	SET @STRSQL = @STRSQL +' select a.*,b.acc_name acc_name_Credit,c.acc_name acc_name_Debit,k.*
	from vou a 
	left join acct b on a.particular=b.acc_code  
	left join acct c on a.acc_code=c.acc_code,
	tblCompany k
	where dr_amt<>0 '
	SET @STRSQL = @STRSQL + ' and a.vou_type = '''+ @vou_type+''' ' + CHAR(13)
	if(isnull(@vou_no,'')<>'')			
	BEGIN
		SET @STRSQL = @STRSQL + ' and a.vou_no = '''+ @vou_no+''' ' + CHAR(13)
	END	
	if(isnull(@StartDate,'')<>'')			
	BEGIN
		SET @STRSQL = @STRSQL + ' and a.vou_date = '''+ convert(varchar, isnull(@StartDate,''''),111) +''' ' + CHAR(13)
	END	
	EXEC (@STRSQL)
	print (@STRSQL)
END

if @mode='6' -- individual voucher print (Credit)
BEGIN
	select a.*,b.acc_name acc_name_Debit,c.acc_name acc_name_Credit,k.*
	from vou a
	left join acct b on a.particular=b.acc_code  
	left join acct c on a.acc_code=c.acc_code,
	tblCompany k
	 where vou_no=@vou_no and vou_type=@vou_type and cr_amt<>0
END

if @mode='7' -- individual voucher print (Journal)
BEGIN
	select a.*,b.acc_name acc_name_Debit,c.acc_name acc_name_Credit,k.* 	
	from vou a
	left join acct b on a.particular=b.acc_code  
	left join acct c on a.acc_code=c.acc_code,
	tblCompany k
	 where vou_no=@vou_no and vou_type=@vou_type ------ and cr_amt<>0
END

--if @mode='8' -- individual Requisition print 
--BEGIN
--	SET @STRSQL = ''
--	SET @STRSQL = @STRSQL +' select a.*,b.acc_name acc_name_Credit,c.acc_name acc_name_Debit,k.*
--	from Temp_Vou a 
--	left join acct b on a.particular=b.acc_code  
--	left join acct c on a.acc_code=c.acc_code,
--	tblCompany k
--	where dr_amt<>0 '
--	SET @STRSQL = @STRSQL + ' and a.vou_type = '''+ @vou_type+''' ' + CHAR(13)
--	if(isnull(@vou_no,'')<>'')			
--	BEGIN
--		SET @STRSQL = @STRSQL + ' and a.vou_no = '''+ @vou_no+''' ' + CHAR(13)
--	END	
--	if(isnull(@StartDate,'')<>'')			
--	BEGIN
--		SET @STRSQL = @STRSQL + ' and a.vou_date = '''+ convert(varchar, isnull(@StartDate,''''),111) +''' ' + CHAR(13)
--	END	
--	EXEC (@STRSQL)
--	print (@STRSQL)
--END

if @mode='21' -- Chart of Accounts
BEGIN
	SET @STRSQL = ''
	SET @STRSQL = @STRSQL +' select a.*,z.*  from acct a, tblCompany z
	where Acc_Code<>'''' '
	if(isnull(@AccountHead,'')<>'')			
	BEGIN
		SET @STRSQL = @STRSQL + ' and a.acc_Head like '''+ @AccountHead+'%'' ' + CHAR(13)
	END	
	--if(isnull(@AccountHead,'')<>'')			
	--BEGIN
	--	SET @STRSQL = @STRSQL + ' and a.acc_Head='''+ @AccountHead+''' ' + CHAR(13)
	--END	
	 SET @STRSQL = @STRSQL + ' order by Acc_Code '
	EXEC (@STRSQL)
	print (@STRSQL)
END

if @mode='22' -- Voucher Register
BEGIN
	SET @STRSQL = ''
	SET @STRSQL = @STRSQL +' 
	select a.vou_type+''-''+a.vou_no vou_no,a.vou_date,a.vou_narr,a.particular,a.acc_code,a.dr_amt,a.cr_amt,a.vou_type, a.vou_chq,a.post_state,a.uid,a.dt,a.CustCode ,
	acc_name=(select top 1 acc_name from acct where acct.acc_code=a.acc_code)
	,z.*
	from vou a
	,tblCompany z
	where a.vou_type<>'''' and a.vou_date between '''+ convert(varchar, isnull(@StartDate,''''),111) +''' AND '''+ convert(varchar, isnull(@ENDDate,''''),111)+''' '
	if(isnull(@vou_type,'')<>'')			
	BEGIN
		SET @STRSQL = @STRSQL + ' and a.vou_type= '''+ @vou_type+'''' + CHAR(13)
	END	
	
	if(isnull(@vou_type,'')<>'')			
	BEGIN
		SET @STRSQL = @STRSQL + ' and a.vou_type='''+ @vou_type+''' ' + CHAR(13)
	END		
	if(isnull(@AccountHead,'')<>'')			
	BEGIN
		SET @STRSQL = @STRSQL + ' and a.acc_code='''+ @AccountHead+''' ' + CHAR(13)
	END	
	if(isnull(@Acc_Code,'')<>'')			
	BEGIN
		SET @STRSQL = @STRSQL + ' and a.acc_code='''+ @Acc_Code+''' ' + CHAR(13)
	END	

	if(isnull(@vou_no,'')<>'')			
	BEGIN
		SET @STRSQL = @STRSQL + ' and a.vou_no= '''+ @vou_no+'''' + CHAR(13)
	END	

	SET @STRSQL = @STRSQL + ' Order by a.vou_date' + CHAR(13)
	------SET @STRSQL = @STRSQL + ' Order by a.vou_date, a.vou_no,a.track_id' + CHAR(13)

	EXEC (@STRSQL)
	print (@STRSQL)
END

if @mode='28' -- Income Statement
BEGIN
	SET @STRSQL = ''
	SET @STRSQL = @STRSQL + 'create table #TempPL (
	[acc_code] [varchar](10) NOT NULL,
	[acc_name] [varchar](50) NOT NULL,
	[acc_head] [varchar](10) NOT NULL,
	[opn_bal] [money] DEFAULT (0.00),
	[tot_bal] [money] DEFAULT (0.00),
	[main_grp] [int]) '
	SET @STRSQL = @STRSQL + ' insert into #TempPL
select a.acc_code,
acc_name=(select acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),tot_bal=isnull(sum(a.cr_amt-a.dr_amt),0),
main_grp=1 from ledger a,acct b where a.acc_code=b.acc_code and
b.acc_group=4 and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code ' + CHAR(13)
	SET @STRSQL = @STRSQL + ' insert into #TempPL
select a.acc_code,
acc_name=(select acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),tot_bal=isnull(sum(a.dr_amt-a.cr_amt),0),
main_grp=2 from ledger a,acct b where a.acc_code=b.acc_code and
b.acc_group=5 and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code' + CHAR(13)
	
SET @STRSQL = @STRSQL + ' insert into #TempPL
select acc_code=''X-1104003'',
acc_name=(''Closing Stock ''+isnull((select acc_name from acct where acc_code=''1104003''),'''')),
acc_head=''01'',
opn_bal=0,
tot_bal=0,main_grp=2 ' + CHAR(13)

	SET @STRSQL = @STRSQL + ' insert into #TempPL
select acc_code=''001'',acc_name=''Gross Profit/(Loss) AC'',acc_head=''01'',
opn_bal=sum(case main_grp when 1 then opn_bal
	                  when 2 then -opn_bal
			  else 0 END),
tot_bal=sum(case main_grp when 1 then tot_bal
			  when 2 then -tot_bal
			  else 0 END),main_grp=3 from #TempPL ' + CHAR(13)
	SET @STRSQL = @STRSQL + ' insert into #TempPL
select a.acc_code,
acc_name=(select acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),tot_bal=isnull(sum(a.dr_amt-a.cr_amt),0),
main_grp=4 from ledger a,acct b where a.acc_code=b.acc_code and
b.acc_group=6 and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code' + CHAR(13)
	SET @STRSQL = @STRSQL + ' insert into #TempPL
select acc_code=''002'',acc_name=''Operating Profit/(Loss) AC'',acc_head=''02'',
opn_bal=sum(case main_grp when 3 then opn_bal
	                  when 4 then -opn_bal
			  else 0 END),
tot_bal=sum(case main_grp when 3 then tot_bal
			  when 4 then -tot_bal
			  else 0 END),main_grp=5
from #TempPL where main_grp in(3,4)' + CHAR(13)
	SET @STRSQL = @STRSQL + ' insert into #TempPL
select a.acc_code,
acc_name=(select acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),tot_bal=isnull(sum(a.cr_amt-a.dr_amt),0),
main_grp=6 from ledger a,acct b where a.acc_code=b.acc_code and
b.acc_group=7 and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code' + CHAR(13)
	SET @STRSQL = @STRSQL + ' insert into #TempPL
select acc_code=''003'',acc_name=''Profit/(Loss) AC Before Tax'',acc_head=''03'',
opn_bal=sum(case main_grp when 5 then opn_bal
	                  when 6 then opn_bal
			  else 0 END),
tot_bal=sum(case main_grp when 5 then tot_bal
			  when 6 then tot_bal
			  else 0 END),main_grp=7
from #TempPL where main_grp in(5,6)' + CHAR(13)
	SET @STRSQL = @STRSQL + ' insert into #TempPL
select a.acc_code,
acc_name=(select acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),tot_bal=isnull(sum(a.dr_amt-a.cr_amt),0),
main_grp=8 from ledger a,acct b where a.acc_code=b.acc_code and
b.acc_group=8 and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code' + CHAR(13)
	SET @STRSQL = @STRSQL + ' insert into #TempPL
select acc_code=''004'',acc_name=''Profit/(Loss) AC After Tax'',acc_head=''04'',
opn_bal=sum(case main_grp when 7 then opn_bal
	                  when 8 then -opn_bal
			  else 0 END),
tot_bal=sum(case main_grp when 7 then tot_bal
			  when 8 then -tot_bal
			  else 0 END),main_grp=9
from #TempPL where main_grp in(7,8) ' + CHAR(13)

	SET @STRSQL = @STRSQL + ' select * from #TempPL
order by main_grp,acc_code ' + CHAR(13)

	EXEC (@STRSQL)
	print (@STRSQL)
END

if @mode='30' -- General Ledger
BEGIN
---		declare @prj_code varchar(45)
	--SET @prj_code=(select prj_code from project where prj_name=@prj_name )
---	SET @prj_code='000'

	create table #TempLedger (
		[vou_date] [Datetime] DEFAULT getdate(),
		[vou_no] [varchar](20) NULL,
		[vou_narr] [varchar](500) NULL,
		[particular] [varchar](500) NULL,
		[acc_code][varchar](20) NOT NULL,
		[acc_name] [varchar](100) NULL,
		[dr_amt] [money] DEFAULT (0.00),
		[cr_amt] [money] DEFAULT (0.00),
		[tot_bal] [money] DEFAULT (0.00),
		[main_grp] [int])

			--opening
	insert into #TempLedger
	select vou_date=@StartDate,vou_no='OP',vou_narr='opening',particular='Opening',acc_code,
	acc_name=(select acc_name from acct where acc_code=@acc_code),
	dr_amt=0,cr_amt=isnull(sum(dr_amt-cr_amt),0),tot_bal=isnull(sum(dr_amt-cr_amt),0),main_grp=1 
	from ledger where vou_date<@StartDate and acc_code=@acc_code 
	group by acc_code 

	--current 
	insert into #TempLedger
	select vou_date,vou_no=(vou_type+'-'+vou_no),vou_narr,particular=(select top 1 acc_name from acct where ledger.particular=acct.acc_code),acc_code,
	acc_name=(select acc_name from acct where acc_code=@acc_code),
	dr_amt,cr_amt,tot_bal=(dr_amt-cr_amt),main_grp=2 from ledger where
	vou_date between @StartDate and @ENDDate and acc_code=@acc_code 
	order by main_grp,vou_date,vou_no

	select * from #TempLedger order by main_grp,vou_date,vou_no
END

if @mode='32' -- Trial Balance
BEGIN
	SET @STRSQL=''
	SET @STRSQL=@STRSQL+'select a.acc_code,
	acc_name=(select top 1 acc_name from acct where acct.acc_code=a.acc_code),	
	opn_bal=dbo.OpenBal_tb(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''' ,''''),
	opn_balDr=dbo.OpenBal_tbDr(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),
	opn_balCr=dbo.OpenBal_tbCr(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),
	Dr_amt=dbo.tb_Dr(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''','''+ convert(varchar, isnull(@ENDDate,''''),111) +''',''''),
	Cr_amt=dbo.tb_Cr(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''','''+ convert(varchar, isnull(@ENDDate,''''),111) +''',''''),
	tot_bal=isnull(sum(a.dr_amt-a.cr_amt),0),
	acc_lbl=(select top 1 acc_lbl from acct where acct.acc_code=a.acc_code)
	from ledger a,acct b where a.acc_code=b.acc_code '
	SET @STRSQL=@STRSQL+' group by a.acc_code'

	EXEC (@STRSQL)
	print (@STRSQL)
END

if @mode='33' -- Balance Sheet
BEGIN
	SET @STRSQL = ''
	SET @STRSQL = @STRSQL + 'create table #TempBL (
	[acc_code] [varchar](10) NOT NULL,
	[acc_name] [varchar](50) NOT NULL,
	[acc_head] [varchar](10) NOT NULL,
	[tot_bal] [money] DEFAULT (0.00),
	[opn_bal] [money] DEFAULT (0.00),
	[main_grp] [int]) '+ CHAR(13)
	
	-----non current assets
	SET @STRSQL = @STRSQL + ' insert into #TempBL
select a.acc_code,
acc_name=(select top 1 acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
tot_bal=isnull(sum(a.dr_amt-a.cr_amt),0),
opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),
main_grp=1 from ledger a,acct b where a.acc_code=b.acc_code and
a.acc_code like ''21%'' and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code' + CHAR(13)

--current assets
SET @STRSQL = @STRSQL + 'insert into #TempBL
select a.acc_code,
acc_name=(select acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
tot_bal=isnull(sum(a.dr_amt-a.cr_amt),0),
opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),
main_grp=2 from ledger a,acct b where a.acc_code=b.acc_code and
a.acc_code like ''11%'' and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code' + CHAR(13)


--current liabilities
SET @STRSQL = @STRSQL + 'insert into #TempBL
select a.acc_code,
acc_name=(select acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
tot_bal=isnull(sum(a.cr_amt-a.dr_amt),0),opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),
main_grp=3 from ledger a,acct b where a.acc_code=b.acc_code and
a.acc_code like ''31%'' and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code' + CHAR(13)

--net current assets
SET @STRSQL = @STRSQL + 'insert into #TempBL
select acc_code=''001'',acc_name=''Net Current Assets'',
acc_head=''01'',tot_bal=sum(case main_grp when 2 then tot_bal
			                when 3 then -tot_bal
					else 0 END),
opn_bal=sum(case main_grp when 2 then opn_bal
			  when 3 then -opn_bal
			  else 0 END),main_grp=4
from #TempBL where main_grp in(2,3)' + CHAR(13)

--total assets
SET @STRSQL = @STRSQL + 'insert into #TempBL
select acc_code=''002'',acc_name=''Total Assets'',
acc_head=''02'',tot_bal=sum(case main_grp when 1 then tot_bal
			                when 4 then tot_bal					
					else 0 END),
opn_bal=sum(case main_grp when 1 then opn_bal
 	                  when 4 then opn_bal			  
			  else 0 END),main_grp=5
from #TempBL where main_grp in(1,4)' + CHAR(13)

--equity
SET @STRSQL = @STRSQL + 'insert into #TempBL
select a.acc_code,
acc_name=(select acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
tot_bal=isnull(sum(a.cr_amt-a.dr_amt),0),opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),
main_grp=6 from ledger a,acct b where a.acc_code=b.acc_code and
a.acc_code like ''51%'' and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code' + CHAR(13)


--Current year profit/(loss) ac
SET @STRSQL = @STRSQL + '
insert into #TempBL
select acc_code=''X-5102'',acc_name=''Current Year Profit/(Loss) AC'',
acc_head=''51'',tot_bal=0,opn_bal=0,main_grp=6' + CHAR(13)


--non current liabilities
SET @STRSQL = @STRSQL + 'insert into #TempBL
select a.acc_code,
acc_name=(select acc_name from acct where acc_code=a.acc_code),
acc_head=(select acc_head from acct where acc_code=a.acc_code),
tot_bal=isnull(sum(a.cr_amt-a.dr_amt),0),opn_bal=dbo.OpenBal(0,a.acc_code,'''+ convert(varchar, isnull(@StartDate,''''),111) +''',''''),
main_grp=7 from ledger a,acct b where a.acc_code=b.acc_code and
a.acc_code like ''41%'' and b.acc_lbl=1 and a.vou_date<='''+ convert(varchar, isnull(@ENDDate,''''),111) +'''
group by a.acc_code' + CHAR(13)

--total liabilities
SET @STRSQL = @STRSQL + 'insert into #TempBL
select acc_code=''003'',acc_name=''Total Liabilities'',
acc_head=''03'',tot_bal=sum(tot_bal),opn_bal=sum(opn_bal),
main_grp=8 from #TempBL  where main_grp in(6,7)' + CHAR(13)

SET @STRSQL = @STRSQL + 'select * from #TempBL order by main_grp,acc_code' + CHAR(13)

	
	EXEC (@STRSQL)
	print (@STRSQL)
END

GO
/****** Object:  StoredProcedure [dbo].[CompanyInfo]    Script Date: 3/4/2025 4:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CompanyInfo]
(
	@mode int = 4,
	@ComId int=null,
	@Name nvarchar (250)=null,
	@Address nvarchar(250)=null,
	@Contact1 varchar(100)=null,
	@Contact2 varchar(100)=null,
	@Fax varchar(100)=null,
	@Email varchar(100)=null,
	@Website varchar(100)=null,
	@Moto varchar(100)=null,
	@Logo image=''
)
as
if @mode=1
begin
	select * from tblCompany
end

if @mode=2
begin
	update tblCompany set Name=@Name,Address=@Address,Contact1=@Contact1,Contact2=@Contact2,Fax=@Fax,Email=@Email,Website=@Website,CompanyMoto=@Moto,CompanyLogo=@Logo where ComId=@ComId
end
GO