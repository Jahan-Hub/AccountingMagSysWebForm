USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblCostElements]    Script Date: 7/30/2021 12:32:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCostElements](
	[Id] [int] NOT NULL,
	[Alias] [decimal](18, 0) NULL,
	[Name] [varchar](150) NULL,
	[CostCenterId] [int] NULL,
 CONSTRAINT [PK_tblCostElements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


