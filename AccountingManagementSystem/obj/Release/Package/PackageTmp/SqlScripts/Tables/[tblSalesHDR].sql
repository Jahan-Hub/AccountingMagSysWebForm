USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblSalesHDR]    Script Date: 7/30/2021 12:37:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblSalesHDR](
	[SalesId] [varchar](15) NOT NULL,
	[MonthYear] [int] NULL,
	[SalesDate] [datetime] NULL,
	[ChallanNo] [int] NULL,
	[AmendmentDate] [datetime] NULL,
	[BillNo] [int] NULL,
	[PONo] [varchar](100) NULL,
	[PODate] [datetime] NULL,
	[LotNumber] [varchar](100) NULL,
	[VoucherNo] [int] NULL,
	[CustId] [int] NULL,
	[ShipTo] [int] NULL,
	[Remarks] [varchar](200) NULL,
	[Reference] [varchar](100) NULL,
	[TaxVAT] [decimal](18, 2) NULL,
	[VAT] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[LabourCost] [decimal](18, 2) NULL,
	[OtherCost] [decimal](18, 2) NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[Paid] [decimal](18, 2) NULL,
	[Due] [decimal](18, 2) NULL,
	[PayMode] [varchar](50) NULL,
	[ChequeNo] [varchar](80) NULL,
	[ChequeDt] [datetime] NULL,
	[DepositBank] [varchar](50) NULL,
	[BankName] [varchar](150) NULL,
	[ChequeDetails] [varchar](250) NULL,
	[DeleteOn] [datetime] NULL,
	[UserId] [nvarchar](150) NULL,
	[Lmdt] [datetime] NULL,
 CONSTRAINT [PK_tblSales] PRIMARY KEY CLUSTERED 
(
	[SalesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


