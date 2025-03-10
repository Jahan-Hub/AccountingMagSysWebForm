USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblWeights]    Script Date: 7/30/2021 12:39:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblWeights](
	[WgtId] [int] NOT NULL,
	[Unit] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_tblWeights] PRIMARY KEY CLUSTERED 
(
	[WgtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


