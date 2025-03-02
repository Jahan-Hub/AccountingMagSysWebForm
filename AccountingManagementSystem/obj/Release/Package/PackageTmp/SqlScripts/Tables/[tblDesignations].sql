USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblDesignations]    Script Date: 7/30/2021 12:33:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblDesignations](
	[DesigId] [int] NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_tblDesignations] PRIMARY KEY CLUSTERED 
(
	[DesigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


