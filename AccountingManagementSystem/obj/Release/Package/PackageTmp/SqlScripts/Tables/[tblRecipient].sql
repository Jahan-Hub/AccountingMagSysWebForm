USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblRecipient]    Script Date: 7/30/2021 12:37:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblRecipient](
	[CustId] [int] NOT NULL,
	[Email] [varchar](150) NULL,
	[Name] [varchar](150) NULL,
	[selected] [varchar](1) NULL,
 CONSTRAINT [PK_tblRecipient] PRIMARY KEY CLUSTERED 
(
	[CustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


