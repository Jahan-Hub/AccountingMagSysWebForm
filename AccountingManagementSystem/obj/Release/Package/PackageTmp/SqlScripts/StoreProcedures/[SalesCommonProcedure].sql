USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[SalesCommonProcedure]    Script Date: 7/30/2021 12:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SalesCommonProcedure]
(
	@p_OpMode	 INT= 4
)
AS
BEGIN
IF @p_OpMode=1 -- for facing data of Login
	begin
		select * from tblLogIn 
	end
END

