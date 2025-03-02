USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblExpense]    Script Date: 7/30/2021 12:33:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblExpense](
	[Id] [int] NOT NULL,
	[CostHead] [int] NULL,
	[CostElement] [int] NULL,
	[Date] [datetime] NULL,
	[HandedTo] [varchar](150) NULL,
	[Amount] [decimal](18, 0) NULL,
	[Remarks] [varchar](250) NULL,
	[PayMode] [varchar](50) NULL,
	[ChequeNo] [varchar](80) NULL,
	[ChequeDt] [datetime] NULL,
	[DepositBank] [varchar](50) NULL,
	[BankName] [varchar](150) NULL,
	[ChequeDetails] [varchar](250) NULL,
	[UserId] [nvarchar](100) NULL,
	[Lmdt] [datetime] NULL,
 CONSTRAINT [PK_tblExpense_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


