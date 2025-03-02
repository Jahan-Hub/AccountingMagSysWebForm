USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblPurchaseDTL]    Script Date: 7/30/2021 12:36:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPurchaseDTL](
	[PurId] [varchar](7) NOT NULL,
	[ItemCode] [varchar](5) NOT NULL,
	[UnitPrice] [money] NULL,
	[Qty] [int] NULL,
	[Amount] [money] NULL,
	[Lmdt] [datetime] NULL,
	[MafDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[LotNumber] [varchar](50) NULL,
 CONSTRAINT [PK_tblPurchaseDTL] PRIMARY KEY CLUSTERED 
(
	[PurId] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


