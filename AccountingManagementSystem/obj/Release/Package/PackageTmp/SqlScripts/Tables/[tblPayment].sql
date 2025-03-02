USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblPayment]    Script Date: 7/30/2021 12:36:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPayment](
	[TrackId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [varchar](10) NOT NULL,
	[BillNo] [varchar](50) NOT NULL,
	[PayMode] [varchar](50) NULL,
	[PayDate] [datetime] NOT NULL,
	[PayAmount] [decimal](18, 2) NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[DueAmount] [decimal](18, 2) NULL,
	[ChequeNo] [varchar](50) NULL,
	[ChequeDate] [datetime] NULL,
	[IssueBank] [varchar](150) NULL,
	[DepositBank] [varchar](50) NULL,
	[BankName] [varchar](150) NULL,
	[ChequeDetails] [varchar](250) NULL,
	[Remarks] [varchar](250) NULL,
	[UserId] [nvarchar](100) NULL,
	[Lmdt] [datetime] NULL,
	[PurID] [varchar](50) NULL,
 CONSTRAINT [PK_tblPayment_1] PRIMARY KEY CLUSTERED 
(
	[TrackId] ASC,
	[SupplierId] ASC,
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


