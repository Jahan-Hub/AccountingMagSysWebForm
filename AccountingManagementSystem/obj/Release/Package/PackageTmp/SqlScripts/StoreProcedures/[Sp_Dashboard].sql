USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Dashboard]    Script Date: 7/30/2021 12:45:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_Dashboard]
(
	@mode			int				= 4
)
AS
if @mode=1 -- get all summary
begin
	SELECT
	(SELECT COUNT(*) FROM tblCustomers) as TotalCustomer,
	(SELECT COUNT(*) FROM tblSuppliers) as TotalSupplier,
	(SELECT COUNT(*) FROM tblItems) as TotalItems,
	(SELECT COUNT(*) FROM tblCostCenters) as TotalCostCenter,
	(SELECT COUNT(*) FROM tblCostElements) as TotalCostElement

	select count(MonthYear)Invoice,MonthYear from tblSalesHDR
	group by MonthYear order by MonthYear

end





