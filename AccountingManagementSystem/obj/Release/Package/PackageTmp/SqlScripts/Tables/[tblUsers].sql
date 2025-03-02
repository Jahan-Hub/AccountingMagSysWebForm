USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/30/2021 12:39:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblUsers](
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Role] [varchar](20) NULL,
	[Password] [varchar](100) NULL,
	[ConPassword] [varchar](100) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


