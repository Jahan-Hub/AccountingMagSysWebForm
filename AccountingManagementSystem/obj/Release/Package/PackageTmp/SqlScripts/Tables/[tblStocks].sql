USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblStocks]    Script Date: 7/30/2021 12:38:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblStocks](
	[LotNumber] [varchar](100) NULL,
	[ItemCode] [varchar](5) NOT NULL,
	[ItemSize] [int] NULL,
	[StockQty] [decimal](18, 0) NULL,
	[MinQty] [int] NULL,
	[MaxQty] [int] NULL,
	[Lmdt] [datetime] NULL
) ON [PRIMARY]
GO


