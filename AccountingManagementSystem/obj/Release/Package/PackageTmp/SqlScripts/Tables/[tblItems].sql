USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblItems]    Script Date: 7/30/2021 12:34:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblItems](
	[ItemCode] [varchar](5) NOT NULL,
	[SrlCode] [int] NULL,
	[ItemAlias] [varchar](100) NULL,
	[ItemName] [varchar](50) NULL,
	[ItemCatId] [varchar](2) NULL,
	[SupId] [int] NULL,
	[Brand] [varchar](20) NULL,
	[Color] [varchar](20) NULL,
	[Origin] [varchar](20) NULL,
	[ItemSize] [int] NULL,
	[ItemType] [varchar](20) NULL,
	[ItemUnit] [varchar](20) NULL,
	[PurRate] [decimal](18, 0) NULL,
	[SalesRate] [decimal](18, 0) NULL,
	[MinQty] [int] NULL,
	[MaxQty] [int] NULL,
	[MenufDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[LotNumber] [nvarchar](50) NULL,
	[Pack] [int] NULL,
	[Photo] [image] NULL,
	[UsedFor] [varchar](20) NULL,
	[Notes] [varchar](250) NULL,
	[UserId] [nvarchar](100) NULL,
	[Lmdt] [datetime] NULL,
 CONSTRAINT [PK_tblItems_1] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


