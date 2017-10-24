USE MESEFORMReport
GO

/****** Object:  Table [dbo].[A_EF]    Script Date: 2017/8/13 17:35:31 ******/
IF EXISTS(Select * from sys.objects where name = 'A_EF' and Type = 'U')
DROP TABLE [dbo].[A_EF]
GO

/****** Object:  Table [dbo].[A_EF]    Script Date: 2017/8/13 17:35:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[A_EF](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[Params] [nvarchar](max) NULL,
	[UnitCode] [varchar](20) NULL,
	[SystemCode] [varchar](36) NULL,
	[ChineseName] [nvarchar](10) NULL,
	[EmployeeNumber] [varchar](10) NULL,
	[HostAddress] [varchar](20) NULL,
	[ParentId] [uniqueidentifier] NULL,
	[HandleStatus] [int] NULL CONSTRAINT [DF_A_EF_HandleStatus]  DEFAULT ((0)),
	[LastEditBy] [varchar](50) NULL,
	[LastEditDt] [datetime] NULL,
 CONSTRAINT [PK_A_EF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

--增加Results，存放属性数据
ALTER TABLE [dbo].[A_EF] ADD [Results] [NVARCHAR](MAX) NULL
GO

SET ANSI_PADDING OFF
GO


