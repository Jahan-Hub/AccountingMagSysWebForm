USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblSuppliers]    Script Date: 7/30/2021 12:38:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblSuppliers](
	[SupplierId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[FatherName] [nvarchar](100) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Religion] [nvarchar](50) NULL,
	[OccupId] [int] NULL,
	[Reference] [nvarchar](100) NULL,
	[DistId] [int] NULL,
	[ThanaId] [int] NULL,
	[PostId] [int] NULL,
	[ViId] [int] NULL,
	[Address] [nvarchar](250) NULL,
	[Remarks] [nvarchar](250) NULL,
	[Photo] [image] NULL,
	[IsSupplier] [nvarchar](3) NULL,
	[UserId] [nvarchar](150) NULL,
	[Lmdt] [datetime] NULL,
 CONSTRAINT [PK_tblSuppliers_1] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


