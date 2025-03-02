USE [EcoSalesMS]
GO

/****** Object:  Table [dbo].[tblEmail]    Script Date: 7/30/2021 12:33:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblEmail](
	[MODULEID] [int] NOT NULL,
	[UIID] [int] NOT NULL,
	[RPTCATEGORY] [nvarchar](40) NOT NULL,
	[USERNAME] [nvarchar](60) NOT NULL,
	[FROMEMAILID] [nvarchar](60) NOT NULL,
	[SUBJECT] [nvarchar](100) NULL,
	[BODY] [nvarchar](500) NULL,
	[LMBY] [nvarchar](21) NULL,
	[LMDT] [datetime] NULL,
	[IPADDRESS] [varchar](15) NULL,
	[MACHINEID] [nvarchar](255) NULL,
	[FILEPATH] [varchar](100) NULL,
	[EMAILPWD] [varchar](15) NULL,
	[SMTPHOST] [varchar](50) NULL,
	[PORT] [int] NULL,
	[SSLSTATUS] [bit] NULL,
 CONSTRAINT [PK_EMAILSETUP] PRIMARY KEY CLUSTERED 
(
	[RPTCATEGORY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblEmail] ADD  DEFAULT ((0)) FOR [MODULEID]
GO

ALTER TABLE [dbo].[tblEmail] ADD  DEFAULT ((0)) FOR [UIID]
GO


