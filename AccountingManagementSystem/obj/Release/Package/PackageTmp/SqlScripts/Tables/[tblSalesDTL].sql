USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblSalesDTL]    Script Date: 7/30/2021 12:37:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblSalesDTL](
	[SalesId] [varchar](15) NOT NULL,
	[CustId] [int] NULL,
	[ItemCode] [varchar](5) NOT NULL,
	[UnitPrice] [money] NULL,
	[Qty] [money] NULL,
	[Amount] [money] NULL,
	[MafDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[LotNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSalesDTL] PRIMARY KEY CLUSTERED 
(
	[SalesId] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


