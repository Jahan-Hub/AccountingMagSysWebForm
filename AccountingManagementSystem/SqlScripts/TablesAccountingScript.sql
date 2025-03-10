USE [AccountingMSDB]
GO
/****** Object:  Table [dbo].[Acct]    Script Date: 3/4/2025 4:12:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acct](
	[Acc_Code] [varchar](10) NULL,
	[Acc_Name] [varchar](100) NULL,
	[Acc_Budg] [money] NULL,
	[Acc_Group] [int] NULL,
	[Acc_Lbl] [int] NULL,
	[Acc_Head] [varchar](8) NULL,
	[Acc_Status] [char](1) NULL,
	[Dep_Acc] [varchar](10) NULL,
	[Uid] [varchar](50) NULL,
	[Dt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ledger]    Script Date: 3/4/2025 4:12:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ledger](
	[vou_no] [varchar](10) NOT NULL,
	[vou_date] [datetime] NOT NULL,
	[vou_narr] [varchar](200) NULL,
	[acc_code] [varchar](10) NOT NULL,
	[particular] [varchar](100) NULL,
	[dr_amt] [money] NOT NULL,
	[cr_amt] [money] NOT NULL,
	[vou_type] [varchar](2) NOT NULL,
	[uid] [varchar](50) NOT NULL,
	[dt] [datetime] NULL,
	[track_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccGroup]    Script Date: 3/4/2025 4:12:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccGroup](
	[MainGroup] [int] NOT NULL,
	[MainGroupText] [varchar](100) NULL,
	[SubGroup] [int] NULL,
	[SubGroupText] [varchar](100) NULL,
	[AccLevel1] [int] NULL,
	[AccLevel2] [int] NULL,
	[AccLevel3] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompany]    Script Date: 3/4/2025 4:12:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompany](
	[ComId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Contact1] [nvarchar](100) NULL,
	[Contact2] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Website] [nvarchar](100) NULL,
	[CompanyMoto] [nvarchar](100) NULL,
	[CompanyLogo] [image] NULL,
	[st_dt] [datetime] NULL,
	[ed_dt] [datetime] NULL,
 CONSTRAINT [PK_tblCompany] PRIMARY KEY CLUSTERED 
(
	[ComId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Vou]    Script Date: 3/4/2025 4:12:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vou](
	[vou_no] [varchar](10) NOT NULL,
	[vou_date] [datetime] NOT NULL,
	[vou_narr] [varchar](200) NULL,
	[particular] [varchar](100) NULL,
	[acc_code] [varchar](10) NULL,
	[dr_amt] [money] NULL,
	[cr_amt] [money] NULL,
	[vou_type] [char](2) NULL,
	[vou_chq] [varchar](15) NULL,
	[post_state] [int] NULL,
	[uid] [varchar](50) NULL,
	[dt] [datetime] NULL,
	[track_id] [int] IDENTITY(1,1) NOT NULL,
	[CustCode] [varchar](10) NULL
) ON [PRIMARY]
GO
