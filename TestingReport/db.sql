USE [ceping]
GO

/****** Object:  Table [dbo].[ChooseItem]    Script Date: 08/16/2015 23:08:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChooseItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NULL,
	[OptionId] [int] NULL,
	[ItemPosition] [int] NULL,
	[ItemText] [nvarchar](max) NULL,
	[ItemScore] [int] NULL,
 CONSTRAINT [PK_ChooseItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



USE [ceping]
GO

/****** Object:  Table [dbo].[Dimensions]    Script Date: 08/16/2015 23:09:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dimensions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DimensionName] [nvarchar](500) NULL,
	[DimensionDesc] [nvarchar](max) NULL,
	[TopicId] [int] NULL,
	[OptionIdList] [nvarchar](max) NULL,
 CONSTRAINT [PK_Dimensions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ceping]
GO

/****** Object:  Table [dbo].[Options]    Script Date: 08/16/2015 23:09:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Options](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NULL,
	[OptionText] [nvarchar](max) NULL,
	[OptionOrder] [int] NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ceping]
GO

/****** Object:  Table [dbo].[Topics]    Script Date: 08/16/2015 23:09:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](500) NULL,
	[introduction] [nvarchar](max) NULL,
	[introductionImage] [nvarchar](max) NULL,
	[Topictype] [int] NULL,
	[TotalOptions] [int] NULL,
	[TotalChooseItem] [int] NULL,
	[CreateDateTime] [datetime] NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



USE [ceping]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 08/16/2015 23:09:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[RegDateTime] [datetime] NULL,
	[age] [int] NULL,
	[gender] [nvarchar](50) NULL,
	[industry] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ceping]
GO

/****** Object:  Table [dbo].[Votes]    Script Date: 08/16/2015 23:10:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Votes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[TopicId] [int] NULL,
	[OptionId] [int] NULL,
	[ChooseItemPosition] [int] NULL
) ON [PRIMARY]

GO













