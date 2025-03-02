USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblUserWiseMenuPermision]    Script Date: 7/30/2021 12:39:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblUserWiseMenuPermision](
	[SlNo] [int] NULL,
	[UserName] [varchar](50) NULL,
	[Settings] [bit] NULL,
	[Staff Info] [bit] NULL,
	[Products] [bit] NULL,
	[Suppliers] [bit] NULL,
	[Customers] [bit] NULL,
	[Purchases] [bit] NULL,
	[Sales] [bit] NULL,
	[Payments] [bit] NULL,
	[Money Received] [bit] NULL,
	[Sales Returns] [bit] NULL,
	[Expenses Entry] [bit] NULL,
	[Price Offer] [bit] NULL,
	[Opening Stock] [bit] NULL,
	[Stock Adjustments] [bit] NULL,
	[Users] [bit] NULL,
	[Emailing] [bit] NULL,
	[Log In Info] [bit] NULL,
	[Reports] [bit] NULL
) ON [PRIMARY]
GO


