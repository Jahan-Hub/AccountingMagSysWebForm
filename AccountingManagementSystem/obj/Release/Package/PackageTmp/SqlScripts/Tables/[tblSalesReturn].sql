USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblSalesReturn]    Script Date: 7/30/2021 12:37:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblSalesReturn](
	[Date] [datetime] NULL,
	[CustCode] [varchar](50) NULL,
	[InvoiceNo] [varchar](50) NULL,
	[ItemCode] [varchar](50) NULL,
	[Qty] [decimal](18, 2) NULL,
	[Rate] [decimal](18, 2) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Remarks] [varchar](250) NULL,
	[UserId] [varchar](50) NULL,
	[dt] [datetime] NULL,
	[TrackId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblSalesReturn] PRIMARY KEY CLUSTERED 
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


