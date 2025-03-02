USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblPurchaseHDR]    Script Date: 7/30/2021 12:37:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPurchaseHDR](
	[PurId] [int] NOT NULL,
	[PurDate] [datetime] NULL,
	[BillNo] [varchar](50) NULL,
	[LotNumber] [varchar](100) NULL,
	[VoucherNo] [varchar](50) NULL,
	[SupplierId] [int] NULL,
	[Remarks] [varchar](200) NULL,
	[Reference] [varchar](100) NULL,
	[TaxVAT] [decimal](18, 2) NULL,
	[VAT] [decimal](18, 2) NULL,
	[OtherCost] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[LabourCost] [decimal](18, 2) NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[Paid] [decimal](18, 2) NULL,
	[Due] [decimal](18, 2) NULL,
	[PayMode] [varchar](50) NULL,
	[ChequeNo] [varchar](80) NULL,
	[ChequeDt] [datetime] NULL,
	[DepositBank] [varchar](50) NULL,
	[BankName] [varchar](150) NULL,
	[ChequeDetails] [varchar](250) NULL,
	[UserId] [nvarchar](150) NULL,
	[Lmdt] [datetime] NULL,
 CONSTRAINT [PK_tblPurchaseHDR] PRIMARY KEY CLUSTERED 
(
	[PurId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


