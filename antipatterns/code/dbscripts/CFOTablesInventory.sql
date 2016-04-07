CREATE TABLE [dbo].[Film_Genre](
	[ID] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[Film] [uniqueidentifier] NULL,
	[Genre] [uniqueidentifier] NULL
) 

CREATE TABLE [dbo].[Films](
	[ID] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[Title] [varchar](100) NULL,
	[studio] [uniqueidentifier] NULL,
	[format] [uniqueidentifier] NULL,
	[rating] [uniqueidentifier] NULL,
	[Type] [uniqueidentifier] NULL,
)

CREATE TABLE [dbo].[Options](
	[ID] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[Field] [varchar](10) NULL,
	[Value] [varchar](100) NULL,
	[Sort_order] [int] NULL,
	[Item] [varchar](50) NULL,
)

CREATE TABLE [dbo].[Rooms](
	[ID] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[Name] [varchar](50) NULL
) 

CREATE TABLE [dbo].[Rooms_Movies_Bridge](
	[ID] [uniqueidentifier] NOT NULL Primary Key,
	[Film_ID] [uniqueidentifier] NOT NULL,
	[Room_ID] [uniqueidentifier] NOT NULL,
)
