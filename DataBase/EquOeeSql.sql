USE [DDit]
GO
DROP TABLE [Equ].[OeeCount]
GO
DROP TABLE [Equ].[OeeFormula]
GO
DROP TABLE [Equ].[OeeIndex]
GO
DROP TABLE [Equ].[OeeTime]
GO
DROP TABLE [Equ].[OeeVariable]
GO
DROP TABLE [Equ].[StopReason]
GO
DROP TABLE [Equ].[StopReasonCategory]
GO
DROP TABLE [Equ].[StopRecordHeader]
GO
DROP TABLE [Equ].[StopRecordDetail]
GO
CREATE TABLE [Equ].[OeeCount](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [int] NULL,
	[Unit] [varchar](50) NULL,
	[Value] [decimal](18, 2) NULL,
	[RecordStatus] [int] NULL,
	[RecordLastEditDt] [datetime] NULL,
	[RecordGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Equ.OeeCount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [Equ].[OeeFormula](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[ResultValueID] [uniqueidentifier] NULL,
	[RecordStatus] [int] NULL,
	[RecordLastEditDt] [datetime] NULL,
	[RecordGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OeeFormula] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [Equ].[OeeIndex](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [int] NULL,
	[Unit] [varchar](50) NULL,
	[Value] [decimal](18, 2) NULL,
	[RecordStatus] [int] NULL,
	[RecordLastEditDt] [datetime] NULL,
	[RecordGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OeeIndex] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [Equ].[OeeTime](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [int] NULL,
	[TimeLength] [decimal](18, 2) NULL,
	[Unit] [varchar](50) NULL,
	[ParentOeeTimeId] [uniqueidentifier] NULL,
	[ChildOeeTimeId] [uniqueidentifier] NULL,
	[StopReasonCategoryId] [uniqueidentifier] NULL,
	[RecordStatus] [int] NULL,
	[RecordLastEditDt] [datetime] NULL,
	[RecordGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OeeTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [Equ].[OeeVariable](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[Expression] [varchar](max) NULL,
	[OeeTimeId] [uniqueidentifier] NULL,
	[OeeCountId] [uniqueidentifier] NULL,
	[OeeIndexId] [uniqueidentifier] NULL,
	[Value] [decimal](18, 2) NULL,
	[OeeFormulaId] [uniqueidentifier] NULL,
	[RecordStatus] [int] NULL,
	[RecordLastEditDt] [datetime] NULL,
	[RecordGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OeeVariable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [Equ].[StopReason](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NULL,
	[Reason] [nvarchar](50) NULL,
	[ParentId] [uniqueidentifier] NULL,
	[FullCode] [varchar](50) NULL,
	[StopReasonCategoryId] [uniqueidentifier] NULL,
	[RecordStatus] [int] NULL,
	[RecordLastEditDt] [datetime] NULL,
	[RecordGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_StopReason] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [Equ].[StopReasonCategory](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [int] NULL,
	[RecordStatus] [int] NULL,
	[RecordLastEditDt] [datetime] NULL,
	[RecordGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_StopReasonCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [Equ].[StopRecordHeader](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderNumber] [varchar](50) NULL,
	[OrderDate] [datetime] NULL,
	[ShiftCode] [int] NULL,
	[IsProduction] [bit] NULL,
	[WorkCenterId] [varchar](50) NULL,
	[MachineId] [varchar](50) NULL,
	[RecordStatus] [int] NULL,
	[RecordLastEditDt] [datetime] NULL,
	[RecordGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_StopRecordHeader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [Equ].[StopRecordDetail](
	[ID] [uniqueidentifier] NOT NULL,
	[StopRecordHeaderId] [uniqueidentifier] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Duration] [int] NULL,
	[StopReasonCode] [varchar](50) NULL,
	[StopReasonCategoryId] [uniqueidentifier] NULL,
	[StopReasonDesc] [nvarchar](50) NULL,
	[Crew] [int] NULL,
	[Labor] [int] NULL,
	[RepairMan] [int] NULL,
	[RecordStatus] [int] NULL,
	[RecordLastEditDt] [datetime] NULL,
	[RecordGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_StopRecordDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



