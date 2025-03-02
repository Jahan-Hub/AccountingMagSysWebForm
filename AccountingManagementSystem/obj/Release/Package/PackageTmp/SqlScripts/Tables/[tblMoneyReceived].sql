USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblMoneyReceived]    Script Date: 7/30/2021 12:35:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblMoneyReceived](
	[CustCode] [varchar](10) NOT NULL,
	[SalesId] [varchar](15) NOT NULL,
	[ReceivedDate] [datetime] NOT NULL,
	[ReceiveAmount] [decimal](18, 2) NOT NULL,
	[PayMode] [nvarchar](50) NULL,
	[ChequeNo] [nvarchar](80) NULL,
	[ChequeDt] [datetime] NULL,
	[IssueBank] [nvarchar](150) NULL,
	[DepositBank] [nvarchar](150) NULL,
	[ChequeDetails] [nvarchar](250) NULL,
	[Particulars] [nvarchar](200) NULL,
	[Remarks] [nvarchar](300) NULL,
	[lmdt] [datetime] NOT NULL,
	[userid] [varchar](100) NULL,
	[track_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblMoneyReceived_1] PRIMARY KEY CLUSTERED 
(
	[CustCode] ASC,
	[SalesId] ASC,
	[ReceivedDate] ASC,
	[track_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


