USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_ReportManager]    Script Date: 7/30/2021 12:46:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Sp_ReportManager]
(
	@mode			int				=4,
	@ItemCode		VARCHAR (5)		=null,
	@SalesId		VARCHAR (15)	=null,
	@CostCenterId	VARCHAR (15)	=null,
	@ItemSize		VARCHAR (15)	=null,
	@FromDate		Datetime		='',
	@ToDate			Datetime		='',
	@ItemCatId		VARCHAR (5)		=null,
	@CustomerId		varchar(100)	=null,
	@SupplierId		varchar(100)	=null,
	@DiscountYN		varchar(100)	='N',
	@VatYN			varchar(100)	='N',
	@TerritoryCode	varchar(50)		=null
)
AS
	DECLARE  @V_SQLQRY   VARCHAR(MAX)
SET NOCOUNT ON

if @mode=1 -- Customer
begin
	select CustId,Name,FatherName from tblCustomers
end
if @mode=2 -- Item Name
begin
	select ItemCode,ItemAlias,ItemName from tblItems  where ItemCatId=@ItemCatId
end
if @mode=20 -- Item Name
begin
	select ItemCode,ItemAlias,ItemName from tblItems
end
--if @mode=22 -- Item all
--begin
--	select a.*, b.Name as CatName,c.Unit,d.Name as ItemSizeName, e.Name as Packing from tblItems a left join tblCategory b on a.ItemCatId=b.CatId
--	left join tblWeights c on a.ItemUnit=c.WgtId
--	left join tblItemSize d on a.ItemSize=d.Id
--	left join tblPacking e on a.Pack=e.Id 
--	--where ExpiryDate between @FromDate and @ToDate
--end
if @mode=222 -- Item individual
begin
	SET @V_SQLQRY='select a.*,b.Name as CatName,c.Unit,d.Name as ItemSizeName, e.Name as Packing from tblItems a left join tblCategory b on a.ItemCatId=b.CatId
	left join tblWeights c on a.ItemUnit=c.WgtId
	left join tblItemSize d on a.ItemSize=d.Id
	left join tblPacking e on a.Pack=e.Id where a.ItemCode<> '''' '
	IF(isnull(@ItemCode,'') <> '')
		BEGIN
			SET @V_SQLQRY=@V_SQLQRY + ' and a.ItemCode = '''+ @ItemCode +''' '
		END
	IF(isnull(@ItemSize,0) <> 0)
		BEGIN
			SET @V_SQLQRY=@V_SQLQRY + ' and a.ItemSize = '+ convert(varchar, isnull(@ItemSize,0)) +' '
		END
	IF(isnull(@ToDate,'') <> '')
		BEGIN
			SET @V_SQLQRY=@V_SQLQRY + ' and a.ExpiryDate between '''+ convert(varchar, isnull(@FromDate,''''),111) +''' and '''+ convert(varchar, isnull(@ToDate,''''),111) + ''''
		END
		print (@V_SQLQRY)
		exec (@V_SQLQRY)
	--where ItemSize=@ItemSize and ItemCode=@ItemCode and (ExpiryDate between @FromDate and @ToDate)
end
if @mode=7 -- individual Sales Report
begin
	SELECT convert(int,a.SalesId)SalesId,convert(varchar(10),a.SalesDate,105)SalesDate,a.ChallanNo,a.PONo,convert(varchar(10),a.PODate,105)PODate,
	a.CustId, a.Remarks, a.Reference,a.TaxVAT,a.VAT,a.Discount, a.LabourCost, a.OtherCost, a.NetAmount, 
	a.Paid, a.Due, a.PayMode, a.ChequeNo, a.ChequeDt, a.DepositBank, a.BankName,a.UserId, a.Lmdt,convert(varchar(10),b.MafDate,105)MafDate,
	convert(varchar(10),b.ExpiryDate,105)ExpiryDate,b.Itemcode, b.UnitPrice, b.Qty, b.Amount, c.ItemName,
	c.ItemSize,c.ItemType,c.ItemUnit,b.LotNumber,d.Name, d.Address,d.DeliveryAddress, d.FatherName, d.Mobile, d.Phone,d.Telephone, 
	e1.Name AS OccuName, f1.Name AS VName, f2.Name AS PName, f3.Name AS TName,f4.Name AS DName, e.Name AS CustReference,
	a.ShipTo,s.Name as ShipName, s.Address as ShipAddress, s.FatherName as ShipFatherName, s.Mobile as ShipMobile, s.Phone as ShipPhone,
	s.Telephone as ShipTelephone,s1.Name AS ShipVName, s2.Name AS ShipPName, s3.Name AS ShipTName,s4.Name AS ShipDName,
	g.Name as ItemSizeName,h.Name as Pack, @DiscountYN as DiscountYN,@VatYN as VatYN
	FROM dbo.tblSalesHDR AS a INNER JOIN
	dbo.tblSalesDTL AS b ON a.SalesId = b.SalesId LEFT OUTER JOIN
	dbo.tblItems AS c ON b.Itemcode = c.ItemCode LEFT OUTER JOIN
	dbo.tblCustomers AS d ON a.CustId = d.CustId LEFT OUTER JOIN
	dbo.tblCustomers AS e ON a.Reference = e.CustId LEFT OUTER JOIN

	tblCustomers as s on a.ShipTo = s.CustId LEFT OUTER JOIN
	dbo.tblVillages AS s1 ON s.ViId = s1.ViId LEFT OUTER JOIN
	dbo.tblPosts AS s2 ON s.PostId = s2.PostId LEFT OUTER JOIN
	dbo.tblThanas AS s3 ON s.ThanaId = s3.ThanaId LEFT OUTER JOIN
	dbo.tblDistricts AS s4 ON s.DistId = s4.DistId LEFT OUTER JOIN

	dbo.tblVillages AS f1 ON d.ViId = f1.ViId LEFT OUTER JOIN
	dbo.tblPosts AS f2 ON d.PostId = f2.PostId LEFT OUTER JOIN
	dbo.tblThanas AS f3 ON d.ThanaId = f3.ThanaId LEFT OUTER JOIN
	dbo.tblDistricts AS f4 ON d.DistId = f4.DistId LEFT OUTER JOIN
	dbo.tblDesignations AS e1 ON d.OccupId = e1.DesigId
	left join tblItemSize as g on c.ItemSize=g.Id
	left join tblPacking h on c.Pack=h.Id
	where a.SalesId=@SalesId
end

if @mode=8 -- all customer
begin
	select a.*,b.Name as OccupationName,c.Name as DistrictName,
	d.Name as ThanaName, e.Name as PostName, f.Name as VillageName
	from tblCustomers a 
	left join tblDesignations b on a.OccupId=b.DesigId
	left join tblDistricts c on a.DistId=c.DistId
	left join tblThanas d on a.ThanaId= d.ThanaId
	left join tblPosts e on a.PostId = e.PostId
	left join tblVillages f on a.ViId= f.ViId

end
if @mode=9 -- all supplier
begin
	select a.*,b.Name as OccupationName,c.Name as DistrictName,
	d.Name as ThanaName, e.Name as PostName, f.Name as VillageName
	from tblSuppliers a 
	left join tblDesignations b on a.OccupId=b.DesigId
	left join tblDistricts c on a.DistId=c.DistId
	left join tblThanas d on a.ThanaId= d.ThanaId
	left join tblPosts e on a.PostId = e.PostId
	left join tblVillages f on a.ViId= f.ViId
end

if @mode=10 -- Expense by date to date
begin
	SET @V_SQLQRY =''
	SET @V_SQLQRY = @V_SQLQRY +	' select a.*,b.Alias as CostCenterAlias, b.Name as CostCenterName,
	c.Alias as CostElementAlias, c.Name as CostElementName from tblExpense a 
	inner join tblCostCenters b on a.CostHead = b.Id
	inner join tblCostElements c on a.CostElement=c.Id where a.Id<>'''' '
	IF(isnull(@ToDate,'') <> '')
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and a.Date between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' '
	end
	IF ISNULL(@CostCenterId,'')<>''
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and a.CostHead='''+@CostCenterId+''' ' 
	end
	print (@V_SQLQRY)
	exec (@V_SQLQRY)
end
if @mode=101 -- Expense by date to date and individual Person
begin
		select a.*,b.Alias as CostCenterAlias, b.Name as CostCenterName,
	c.Alias as CostElementAlias, c.Name as CostElementName from tblExpense a 
	inner join tblCostCenters b on a.CostHead = b.Id
	inner join tblCostElements c on a.CostElement=c.Id
	where Date between @FromDate and @ToDate
end

if @mode=11 -- All Stock Details
begin
	select a.ItemCode,isnull(a.StockQty,0)StockQty,b.ItemName,d.Name as Pack,e.Name as ItemSize,f.LotNumber,convert(varchar(10),
	f.ExpiryDate,105)ExpiryDate,convert(varchar(10),f.MafDate,105)MafDate,g.Name as CatName
	from tblStocks a 
	inner join tblItems b on a.ItemCode=b.ItemCode 
	left join tblItemSize c on a.ItemCode=c.Id
	left join tblPacking d on b.Pack=d.Id
	left join tblItemSize e on b.ItemSize=e.Id
	left join tblPurchaseDTL f on a.ItemCode=f.ItemCode and a.LotNumber=f.LotNumber
	left join tblCategory g on b.ItemCatId=g.CatId 
	--left join tblOpeningStocks h on a.ItemCode=h.ItemCode and a.LotNumber=h.LotNumber
	where isnull(a.StockQty,0)<>0 -- lot wise item stock except Zero Qty +isnull(h.OpeningStockQty,0)
end
if @mode=111 -- Individual Stock Details
begin
	select a.*,b.ItemName,d.Name as Pack,e.Name as ItemSize,f.LotNumber,convert(varchar(10),
	f.ExpiryDate,105)ExpiryDate,convert(varchar(10),f.MafDate,105)MafDate,g.Name as CatName
	from tblStocks a 
	inner join tblItems b on a.ItemCode=b.ItemCode 
	left join tblItemSize c on a.ItemCode=c.Id
	left join tblPacking d on b.Pack=d.Id
	left join tblItemSize e on b.ItemSize=e.Id
	left join tblPurchaseDTL f on a.ItemCode=f.ItemCode
	left join tblCategory g on b.ItemCatId=g.CatId
	 where a.ItemCode=@ItemCode
end
if @mode=112 -- Stock Details with Opening Stock
begin
	SET @V_SQLQRY =''
	SET @V_SQLQRY = @V_SQLQRY +	' select ''Purchase'' Type,f.Name CategoryName, a.LotNumber,a.ItemCode,
	c.ItemName,d.Name ItemSizeName,e.Name PackName,sum(a.Qty) OpeningStock,0 StockQty,0 ClosingStock
	from tblPurchaseDTL a 
	left join tblPurchaseHDR b on a.PurId=b.PurId 
	left join tblItems c on a.ItemCode=c.ItemCode
	left join tblItemSize d on c.ItemSize=d.Id
	left join tblPacking e on c.Pack=e.Id
	left join tblCategory f on c.ItemCatId=f.CatId '
	SET @V_SQLQRY = @V_SQLQRY +	'where b.SalesDate between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' '
	SET @V_SQLQRY = @V_SQLQRY +	' group by a.ItemCode,a.LotNumber,c.ItemName,d.Name,e.Name,f.Name
	union
	select ''Sales'' Type,f.Name CategoryName,a.LotNumber,a.ItemCode,c1.ItemName,d.Name ItemSizeName,e.Name PackName,0 OpeningStock,0 StockQty,(sum(c.Qty)-sum(a.Qty)) ClosingStock
	from tblSalesDTL a 
	left join tblSalesHDR b on a.SalesId=b.SalesId 
	left join tblPurchaseDTL c on a.ItemCode=c.ItemCode and a.LotNumber=c.LotNumber
	left join tblItems c1 on a.ItemCode=c1.ItemCode
	left join tblItemSize d on c1.ItemSize=d.Id
	left join tblPacking e on c1.Pack=e.Id
	left join tblCategory f on c1.ItemCatId=f.CatId '
	SET @V_SQLQRY = @V_SQLQRY +	' where b.SalesDate between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' '
	SET @V_SQLQRY = @V_SQLQRY +	' group by a.ItemCode,a.LotNumber,c1.ItemName,d.Name,e.Name,f.Name '
	print (@V_SQLQRY)
	exec (@V_SQLQRY)
end

if @mode=3 -- All Purchase Info date to date wise
begin
	select a.*,b.*,c.Name as SupplierName,d.ItemName,e.Name as ItemSize 
	from tblPurchaseHDR a left join tblPurchaseDTL b on a.PurId=b.PurId
	left join tblSuppliers c on a.SupplierId=c.SupplierId
	left join tblItems d on b.ItemCode=d.ItemCode
	left join tblItemSize e on d.ItemSize=e.Id
	where a.PurDate between @FromDate and @ToDate
end

if @mode=4 -- Profit and Loss
begin
		--select PurId,PurDate,SupplierId,Remarks,Reference,TaxVAT,Discount,LabourCost,NetAmount,Paid,Due,PayMode,ChequeNo,ChequeDt,DepositBank,
		--BankName,ChequeDetails from tblPurchaseHDR where PurDate between @FromDate and @ToDate

		select isnull(sum(Amount),0) as NetAmountExpense,min(Date) as MinExDate,max(Date) as MaxExDate from tblExpense where Date between @FromDate and @ToDate
		--select sum(NetAmount) as NetAmountPurchase,min(PurDate) as MinPurDate,max(PurDate) as MaxPurDate from tblPurchaseHDR where PurDate between @FromDate and @ToDate
		--select sum(NetAmount) as NetAmountSales,min(SalesDate) as MinSaleDate,max(SalesDate) as MaxSaleDate from tblSalesHDR where SalesDate between @FromDate and @ToDate

		select distinct a.ItemCode,(a.UnitPrice*b.Qty) as NetAmountPurchase,b.Amount as NetAmountSales,convert(varchar(10),c.SalesDate,105)SalesDate from tblPurchaseDTL a
		inner join tblSalesDTL b on a.ItemCode=b.Itemcode
		inner join tblSalesHDR c on b.SalesId=c.SalesId
		where SalesDate between @FromDate and @ToDate

		select b.Name,isnull(sum(a.Amount),0) as TotalExpense,a.CostHead,a.CostElement,min(a.Date) as MinExDate,max(a.Date) as MaxExDate from tblExpense a
				inner join tblCostCenters b on a.CostHead=b.Id
				where a.Date between @FromDate and @ToDate
				group by b.Name,a.CostHead,a.CostElement 

		--DECLARE @StartDateTime DATETIME
		--DECLARE @EndDateTime DATETIME

		--SET @FromDate = @FromDate;
		--SET @ToDate = @ToDate;

		--WITH DateRange(DateData) AS 
		--(
		--	SELECT @FromDate as Date
		--	UNION ALL
		--	SELECT DATEADD(d,1,DateData)
		--	FROM DateRange 
		--	WHERE DateData < @ToDate
		--)
		--SELECT DateData
		--FROM DateRange
		--OPTION (MAXRECURSION 0)
end
if @mode=12	-- For Sales Report / Total Sales, Receive n Due
begin
	SET @V_SQLQRY =''
	SET @V_SQLQRY = @V_SQLQRY +	'select a.*,a1.UnitPrice,a1.Qty,a1.Amount, b.Name as CustomerName,c.ItemCode,c.ItemName,d.Name ItemSizeName 
	,b.CustomerTerritoryCode,e.Name StaffName from tblSalesHDR a '
	SET @V_SQLQRY = @V_SQLQRY +	' inner join tblCustomers b on a.CustId=b.CustId 
								inner join tblSalesDTL a1 on a.SalesId=a1.SalesId '
	SET @V_SQLQRY = @V_SQLQRY +	' left join tblItems c on a1.Itemcode=c.ItemCode
								left join tblItemSize d on c.ItemSize=d.Id
								left join tblStaff e on e.StaffId= b.Reference 
								where a.CustId<>'''' '
	IF ISNULL(@CustomerId,0)<>0
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and a.CustId='''+@CustomerId+''' ' 
	end
	IF ISNULL(@Itemcode,0)<>0
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and a1.Itemcode='''+@Itemcode+''' ' 
	end
	IF ISNULL(@ItemCatId,0)<>0
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and c.ItemCatId='''+@ItemCatId+''' ' 
	end
	IF(isnull(@TerritoryCode,'') <> '')
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and b.CustomerTerritoryCode='''+@TerritoryCode+''' ' 
	end
	IF(isnull(@FromDate,'') <> '' and isnull(@ToDate,'') <> '')
		begin
			SET @V_SQLQRY = @V_SQLQRY +	' and a.SalesDate between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' ' 
		end
	print (@V_SQLQRY)
	exec (@V_SQLQRY)
end
if @mode=122-- For Sales Report / Total Sales, Receive n Due ==========> Summary
begin
	SET @V_SQLQRY =''
	SET @V_SQLQRY = @V_SQLQRY +	' select convert(int,a.SalesId)SalesId,a.SalesDate,a.CustId,b.Name,b.CustomerTerritoryCode,c.Name StaffName,
		'''' PacketCost,a.LabourCost,a.OtherCost,a.Discount,a.VAT,a.NetAmount,sum(e.ReceiveAmount)Paid,(a.NetAmount-sum(e.ReceiveAmount))Due	
		from tblSalesHDR a 
		inner join tblCustomers b on a.CustId=b.CustId
		left join tblStaff c on b.Reference=c.StaffId
		left join tblMoneyReceived e on a.SalesId=e.SalesId
		where a.SalesId<>'''' '
	IF ISNULL(@CustomerId,0)<>0
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and a.CustId='''+@CustomerId+''' ' 
	end
	IF(isnull(@ToDate,'') <> '')
		begin
			SET @V_SQLQRY = @V_SQLQRY +	' and a.SalesDate between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' ' 
		end
	IF(isnull(@TerritoryCode,'') <> '')
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and b.CustomerTerritoryCode='''+@TerritoryCode+''' ' 
	end
	SET @V_SQLQRY = @V_SQLQRY +	' group by convert(int,a.SalesId),a.SalesDate,a.CustId,b.Name,b.CustomerTerritoryCode,c.Name,
a.LabourCost,a.OtherCost,a.Discount,a.VAT,a.NetAmount,a.Paid '
	print (@V_SQLQRY)
	exec (@V_SQLQRY)
end
if @mode=13	--  For Purchase Report / Total Purchase, Payment n Due
begin
	SET @V_SQLQRY =''
	SET @V_SQLQRY = @V_SQLQRY +	'select a.*,a1.UnitPrice,a1.Qty,a1.Amount, b.Name as SupplierName,c.ItemName from tblPurchaseHDR a '
	SET @V_SQLQRY = @V_SQLQRY +	' inner join tblSuppliers b on a.SupplierId=b.SupplierId
							  inner join tblPurchaseDTL a1 on a.PurId=a1.PurId '
	SET @V_SQLQRY = @V_SQLQRY +	' left join tblItems c on a1.ItemCode=c.ItemCode where a.SupplierId<>'''' '
	IF ISNULL(@SupplierId,0)<>0
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and a.SupplierId='''+@SupplierId+''' ' 
	end
	IF ISNULL(@ItemCatId,0)<>0
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and c.ItemCatId='''+@ItemCatId+''' ' 
	end
	IF ISNULL(@ItemCode,0)<>0
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and c.ItemCode='''+@ItemCode+''' ' 
	end
	IF(isnull(@FromDate,'') <> '' and isnull(@ToDate,'') <> '')
		begin
			SET @V_SQLQRY = @V_SQLQRY +	' and a.PurDate between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' ' 
		end
	print (@V_SQLQRY)
	exec (@V_SQLQRY)
end 
if @mode=133--  For Purchase Report / Total Purchase, Payment n Due ==========> Summary
begin
	SET @V_SQLQRY =''
	SET @V_SQLQRY = @V_SQLQRY +	' select a.PurID,a.BillNo, a.PurDate BillDate ,a.SupplierId,b.Name, '''' PacketCost,a.LabourCost,
	a.OtherCost,a.Discount,a.NetAmount,a.Paid,(a.NetAmount-a.Paid)Balance  from tblPurchaseHDR a
	inner join tblSuppliers b on a.SupplierId=b.SupplierId where a.PurID<>'''' '
	IF ISNULL(@SupplierId,0)<>0
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and a.SupplierId='''+@SupplierId+''' ' 
	end
	IF(isnull(@ToDate,'') <> '')
		begin
			SET @V_SQLQRY = @V_SQLQRY +	' and a.PurDate between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' ' 
		end

	print (@V_SQLQRY)
	exec (@V_SQLQRY)
end 
--if @mode=133--  For Purchase Report / Total Purchase, Payment n Due ==========> Summary
--begin
--	SET @V_SQLQRY =''
--	SET @V_SQLQRY = @V_SQLQRY +	' select a.PurID,a.BillNo, a.PurDate BillDate ,a.SupplierId,b.Name, '''' PacketCost,a.LabourCost,
--	a.OtherCost,a.Discount,a.NetAmount,a.Paid,(a.NetAmount-a.Paid)Balance  from tblPurchaseHDR a
--	inner join tblSuppliers b on a.SupplierId=b.SupplierId where a.PurID<>'''' '
--	IF ISNULL(@SupplierId,0)<>0
--	begin
--		SET @V_SQLQRY = @V_SQLQRY +	' and a.SupplierId='''+@SupplierId+''' ' 
--	end
--	IF (@DateOption='Custom Date')
--		begin
--			SET @V_SQLQRY = @V_SQLQRY +	' and a.PurDate between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' ' 
--		end
--	else
--		begin
--			SET @V_SQLQRY = @V_SQLQRY +	' and a.PurDate<='''+convert(varchar, isnull(@ToDate,''''),111)+''' ' 
--		end
--	print (@V_SQLQRY)
--	exec (@V_SQLQRY)
--end 
if @mode=135-- Customer Due List
begin
	SET @V_SQLQRY =''
	SET @V_SQLQRY = @V_SQLQRY +	'select a.CustId,a.Name,a.Address,c.Name Village,isnull(d.Name,''Not Set'') Thana, a.Mobile, b.SalesId,b.SalesDate,
	b.NetAmount,sum(e.ReceiveAmount)RcvAmt,(b.NetAmount-sum(e.ReceiveAmount))Due,a.CustomerTerritoryCode,f.Name StaffName from tblCustomers a
	left join tblSalesHDR b on a.CustId=b.CustId
	left join tblVillages c on a.ViId=c.ViId
	left join tblThanas d on a.ThanaId=d.ThanaId 
	left join tblMoneyReceived e on b.SalesId=e.SalesId
	left join tblStaff f on f.StaffId= a.Reference
	where a.CustId<>''''  '
	IF ISNULL(@CustomerId,0)<>0
	begin
		SET @V_SQLQRY = @V_SQLQRY +	' and a.CustId='''+@CustomerId+''' ' 
	end
	
	IF (@FromDate<>'' and @ToDate<>'')
		begin
			SET @V_SQLQRY = @V_SQLQRY +	' and b.SalesDate between '''+convert(varchar, isnull(@FromDate,''''),111)+''' and '''+convert(varchar, isnull(@ToDate,''''),111)+''' ' 
		end
	SET @V_SQLQRY = @V_SQLQRY +	' group by a.CustId,a.Name,a.Address,c.Name,d.Name, a.Mobile,b.NetAmount,b.SalesId,b.SalesDate,a.CustomerTerritoryCode,f.Name  ' 
	SET @V_SQLQRY = @V_SQLQRY +	' 	having (b.NetAmount-sum(e.ReceiveAmount))>0
	order by a.Name ' 
	print (@V_SQLQRY)
	exec (@V_SQLQRY)
end


