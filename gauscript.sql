USE [Gauge]
GO
/****** Object:  User [IIS APPPOOL\Gauge]    Script Date: 17-02-2020 15:12:47 ******/
CREATE USER [IIS APPPOOL\Gauge] FOR LOGIN [IIS APPPOOL\Gauge] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\Gauge]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\Gauge]
GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 17-02-2020 15:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUser](
	[AppUserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Initials] [varchar](50) NULL,
	[Prefix] [varchar](20) NULL,
	[Suffix] [varchar](20) NULL,
	[LoginName] [varchar](20) NOT NULL,
	[Password] [varchar](50) NULL,
	[DisabledDate] [datetime] NULL,
	[LoginAttemptsCount] [int] NULL,
	[AgreedToLicenseDate] [datetime] NULL,
	[SpecialOption] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[CellPhone] [varchar](50) NULL,
	[Fax] [varchar](20) NULL,
	[AppUserNote] [varchar](1000) NULL,
	[SortNameFirstLast]  AS ((isnull([FirstName],'')+' ')+isnull([LastName],'')),
	[SortNameLastFirst]  AS ((isnull([LastName],'')+', ')+isnull([FirstName],'')),
	[DisplayName]  AS ((((isnull([Prefix],'')+isnull([FirstName],''))+' ')+isnull([LastName],''))+isnull([Suffix],'')),
	[CreatedByID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedByID] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AppUser] PRIMARY KEY CLUSTERED 
(
	[AppUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17-02-2020 15:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[Importance (in %) - International events] [int] NULL,
	[Importance (in %) - National events] [int] NULL,
	[Criteria] [varchar](500) NULL,
	[Indicators] [varchar](500) NULL,
	[Source] [varchar](20) NULL,
	[Weight] [int] NOT NULL,
	[Question] [varchar](500) NULL,
	[Answers] [varchar](500) NULL,
	[Score] [varchar](500) NOT NULL,
	[Selected score] [int] NULL,
	[Average score] [int] NULL,
	[Score per indicator] [int] NULL,
	[Average score per criteria] [int] NULL,
	[Final score per indicator - international events] [float] NULL,
	[Final score per indicator - national events] [float] NULL,
	[CreatedByID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedByID] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 17-02-2020 15:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Company Name] [varchar](50) NULL,
	[Company Address] [varchar](50) NULL,
	[Company P.O Box Number] [varchar](50) NULL,
	[Company Telephone Number] [varchar](20) NULL,
	[Company Fax Number] [varchar](50) NULL,
	[Company Website] [varchar](50) NULL,
	[Company Email] [varchar](50) NULL,
	[Owner Name] [varchar](50) NULL,
	[E-mail Address] [varchar](50) NULL,
	[Managing Director Name] [varchar](50) NULL,
	[E-mail Address Director] [varchar](50) NULL,
	[Trade License Number] [varchar](50) NULL,
	[Trade License Issue Date] [datetime] NULL,
	[Trade License Expiry Date] [datetime] NULL,
	[Trade License Copy] [varchar](1) NULL,
	[CreatedByID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedByID] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 17-02-2020 15:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[EntityID] [int] IDENTITY(1,1) NOT NULL,
	[Entity Name] [varchar](50) NULL,
	[Entity address] [varchar](50) NULL,
	[Entity Telephone Number] [varchar](20) NULL,
	[Entity P.O Box Number] [varchar](50) NULL,
	[Entity Fax Number] [varchar](50) NULL,
	[Entity Website] [varchar](50) NULL,
	[Entity Email] [varchar](50) NULL,
	[CEO/ President Name] [varchar](50) NULL,
	[E-mail Address] [varchar](50) NULL,
	[Managing Director Name] [varchar](50) NULL,
	[E-mail Address Director] [varchar](50) NULL,
	[CreatedByID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedByID] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 17-02-2020 15:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [varchar](50) NULL,
	[EventCriteria] [varchar](50) NULL,
	[EventStartDate] [datetime] NOT NULL,
	[EventEndDate] [datetime] NOT NULL,
	[EventDescription] [varchar](500) NULL,
	[EventVenue] [varchar](50) NULL,
	[EventSource] [varchar](20) NULL,
	[Weight] [int] NOT NULL,
	[EventBudget] [varchar](50) NULL,
	[EventCategory] [varchar](50) NULL,
	[EventType] [varchar](50) NULL,
	[EventFrequency] [varchar](50) NULL,
	[EventCordinatorName] [varchar](100) NULL,
	[EventCordinatorMobileNumber] [varchar](50) NULL,
	[EventCordinatorEmail] [varchar](100) NULL,
	[Estimated Number of Participants] [varchar](50) NULL,
	[Estimated Number of Attendees] [varchar](50) NULL,
	[CreatedByID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedByID] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 17-02-2020 15:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[SchoolID] [int] IDENTITY(1,1) NOT NULL,
	[School/University Name] [varchar](50) NULL,
	[Institution Address] [varchar](50) NULL,
	[Telephone Number] [varchar](20) NULL,
	[Institution P.O Box Number] [varchar](50) NULL,
	[Institution Fax Number] [varchar](50) NULL,
	[Institution Website] [varchar](50) NULL,
	[Principal/Dean Name] [varchar](50) NULL,
	[Principal/Dean Email] [varchar](50) NULL,
	[Principal/Dean Passport Copy] [varchar](50) NULL,
	[Event Coordinator Name] [varchar](50) NULL,
	[Event Coordinator Mobile Number] [varchar](50) NULL,
	[Event Coordinator Passport Copy] [varchar](50) NULL,
	[CreatedByID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedByID] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AppUser] ON 

INSERT [dbo].[AppUser] ([AppUserID], [FirstName], [MiddleName], [LastName], [Initials], [Prefix], [Suffix], [LoginName], [Password], [DisabledDate], [LoginAttemptsCount], [AgreedToLicenseDate], [SpecialOption], [IsActive], [Email], [Phone], [CellPhone], [Fax], [AppUserNote], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (1, N'Danish', N'Ahmad', N'Ahmad', N'mr', N'pr', N'rr', N'danish', N'1234', NULL, 1, CAST(N'2001-01-01T15:00:00.000' AS DateTime), N'4', 1, N'danish.tech@gmail.com', N'878989898', N'8889989889', N'98888998', N'jhhjhj', 2, CAST(N'2001-01-01T15:00:00.000' AS DateTime), 2, CAST(N'2001-01-01T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[AppUser] ([AppUserID], [FirstName], [MiddleName], [LastName], [Initials], [Prefix], [Suffix], [LoginName], [Password], [DisabledDate], [LoginAttemptsCount], [AgreedToLicenseDate], [SpecialOption], [IsActive], [Email], [Phone], [CellPhone], [Fax], [AppUserNote], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (2, N'sample string 2', N'sample string 3', N'sample string 4', N'sample string 5', N'sample string 6', N'sample string 7', N'sample string 8', N'sample string 9', CAST(N'2020-02-17T09:08:38.310' AS DateTime), 1, CAST(N'2020-02-17T09:08:38.310' AS DateTime), N'sample string 10', 1, N'sample string 12', N'sample string 13', N'sample string 14', N'sample string 15', N'sample string 16', 20, CAST(N'2020-02-17T09:08:38.310' AS DateTime), 22, CAST(N'2020-02-17T09:08:38.3092505' AS DateTime2))
INSERT [dbo].[AppUser] ([AppUserID], [FirstName], [MiddleName], [LastName], [Initials], [Prefix], [Suffix], [LoginName], [Password], [DisabledDate], [LoginAttemptsCount], [AgreedToLicenseDate], [SpecialOption], [IsActive], [Email], [Phone], [CellPhone], [Fax], [AppUserNote], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (3, N'sample string 2', N'sample string 3', N'sample string 4', N'sample string 5', N'sample string 6', N'sample string 7', N'sample string 8', N'sample string 9', CAST(N'2020-02-17T09:08:38.310' AS DateTime), 1, CAST(N'2020-02-17T09:08:38.310' AS DateTime), N'sample string 10', 1, N'sample string 12', N'sample string 13', N'sample string 14', N'sample string 15', N'sample string 16', 20, CAST(N'2020-02-17T09:08:38.310' AS DateTime), 22, CAST(N'2020-02-17T09:08:38.3092505' AS DateTime2))
SET IDENTITY_INSERT [dbo].[AppUser] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (1, N'Event Development', 3, 10, N'Event Management', N'Event organisers committed to professionalism standards of DSC', N'DSC', 100, N'a) To what degree did the event organiser understand how the event was aligned with DSC/Dubai Government strategies?', N'Not at all,Slightly,Moderately,Very,Extremely', N'2,4,6,8,10', 10, 10, 10, 10, 0.3, 1, 23, CAST(N'2020-02-17T13:32:17.760' AS DateTime), 23, CAST(N'2020-02-17T13:32:17.7600000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (2, N'Event Development', 2, 5, N'Finance', N'The event was  strongly supported by the private sector', N'DSC', 60, N'a) Was the event financially supported by DSC?', N'Yes,No', N'10,5', 10, 10, 10, 10, 0.2, 0.5, 23, CAST(N'2020-02-17T13:59:18.727' AS DateTime), 23, CAST(N'2020-02-17T13:59:18.7266667' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (3, N'Event Development', 2, 5, N'Finance', N'The event was  strongly supported by the private sector', N'DSC', 60, N'b) If yes, to what degree did DSC financially support the event?', N'Less than 20% of the total budget,Between 20% and 40% of the total budget,Between 40% and 60% of the total budget,Betweenn 60% and 80% of the total budget,More than 80% of the total budget', N'10,8,6,4,2', 10, 10, 10, 10, 0.2, 0.5, 23, CAST(N'2020-02-17T14:04:25.630' AS DateTime), 23, CAST(N'2020-02-17T14:04:25.6300000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (4, N'Event Development', 2, 5, N'Finance', N'The event was  strongly supported by the private sector', N'Event Organiser', 40, N'a) To what degree was the event supported by the private sector (revenues from sponsorship, broadcast, etc…)?', N'Less than 20% of the total budget,Between 20% and 40% of the total budget,Between 40% and 60% of the total budget,Betweenn 60% and 80% of the total budget,More than 80% of the total budget', N'2,4,6,8,10', 10, 10, 10, 10, 0.2, 0.5, 23, CAST(N'2020-02-17T14:11:10.050' AS DateTime), 23, CAST(N'2020-02-17T14:11:10.0500000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (5, N'Event Development', 2, 5, N'Finance', N'The event generated high ticket sales revenues', N'Event Organiser', 100, N'a) Did speactators have to buy tickets to attend the event?', N'Yes,No', N'10,5', 10, 10, 10, 10, 0.2, 0.5, 23, CAST(N'2020-02-17T14:21:35.480' AS DateTime), 23, CAST(N'2020-02-17T14:21:35.4800000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (6, N'Event Development', 2, 5, N'Finance', N'The event generated high ticket sales revenues', N'Event Organiser', 100, N'b) If yes, what is the share of revenues generated by ticket sales?', N'Less than 20% of the total budget,Between 20% and 40% of the total budget,Between 40% and 60% of the total budget,Betweenn 60% and 80% of the total budget,More than 80% of the total budget', N'2,4,6,8,10', 10, 10, 10, 10, 0.2, 0.5, 23, CAST(N'2020-02-17T14:24:11.040' AS DateTime), 23, CAST(N'2020-02-17T14:24:11.0400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (7, N'Event Development', 2, 5, N'Finance', N'The event generated high on-site consumption of food, beverage and merchandise revenues', N'Event Organiser', 100, N'a) Did participants and spectators have the possibility to purchase either food/beverage and/or merchandise on-site?', N'Yes,No', N'10,5', 10, 10, 10, 10, 0.2, 0.5, 23, CAST(N'2020-02-17T14:26:37.730' AS DateTime), 23, CAST(N'2020-02-17T14:26:37.7300000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (8, N'Event Development', 2, 5, N'Finance', N'The event generated high on-site consumption of food, beverage and merchandise revenues', N'Event Organiser', 100, N'b) If yes, what is the share of revenues generated by the sales of food/bevarage and/or merchandise on-site?', N'Less than 20% of the total budget,Between 20% and 40% of the total budget,Between 40% and 60% of the total budget,Betweenn 60% and 80% of the total budget,More than 80% of the total budget', N'2,4,6,8,10', 10, 10, 10, 10, 0.2, 0.5, 23, CAST(N'2020-02-17T14:30:13.930' AS DateTime), 23, CAST(N'2020-02-17T14:30:13.9300000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (9, N'Event Development', 2, 2, N'Logistics', N'Venues respected the sport organisations standards and technical requirements', N'DSC', 50, N'In general, the event is well-organised', N'Not at all,Slightly,Moderately,Very,Extremely', N'2,4,6,8,10', 10, 10, 10, 10, 0.2, 0.2, 23, CAST(N'2020-02-17T14:36:58.537' AS DateTime), 23, CAST(N'2020-02-17T14:36:58.5366667' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (10, N'Event Development', 2, 2, N'Logistics', N'Venues respected the sport organisations standards and technical requirements', N'Event Organiser', 30, N'a) Was someone designated to be in charge of operations and logistics management within the Event O. team?', N'Yes,No', N'10,5', 10, 10, 10, 10, 0.2, 0.2, 23, CAST(N'2020-02-17T14:38:21.367' AS DateTime), 23, CAST(N'2020-02-17T14:38:21.3666667' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (11, N'Event Development', 2, 2, N'Logistics', N'Venues respected the sport organisations standards and technical requirements', N'Event Organiser', 30, N'b) In the planning of the event, which Dubai Government Authority did you meet or contact?', N'Dubai Police,Civil Defence,Roads & Transport Authority,Dubai Municipality,Dubai Ambulance,None of the above,Other', N'2,2,2,2,2,0,.', 10, 10, 10, 10, 0.2, 0.2, 23, CAST(N'2020-02-17T14:45:24.690' AS DateTime), 23, CAST(N'2020-02-17T14:45:24.6900000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (18, N'Event Development', 2, 2, N'Logistics', N'Venues were easy to access for persons with special needs', N'DSC', 50, N'In general, the event is well-organised', N'Not at all,Slightly,Moderately,Very,Extremely', N'2,4,6,8,10', 10, 10, 10, 10, 0.2, 0.2, 23, CAST(N'2020-02-17T14:53:28.483' AS DateTime), 23, CAST(N'2020-02-17T14:53:28.4833333' AS DateTime2))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Importance (in %) - International events], [Importance (in %) - National events], [Criteria], [Indicators], [Source], [Weight], [Question], [Answers], [Score], [Selected score], [Average score], [Score per indicator], [Average score per criteria], [Final score per indicator - international events], [Final score per indicator - national events], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (19, N'Event Development', 2, 2, N'Logistics', N'Venues were easy to access for persons with special needs', N'Event Organiser', 30, N'a) In the planning of the event, what was the level of priority given to ensure that the venue(s) was (were) easy to access for persons with special needs?', N'Not a priority,Low priority,Medium priority,High priority,Essential', N'2,4,6,8,10', 10, 10, 10, 10, 0.2, 0.2, 23, CAST(N'2020-02-17T14:55:27.177' AS DateTime), 23, CAST(N'2020-02-17T14:55:27.1766667' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyID], [Company Name], [Company Address], [Company P.O Box Number], [Company Telephone Number], [Company Fax Number], [Company Website], [Company Email], [Owner Name], [E-mail Address], [Managing Director Name], [E-mail Address Director], [Trade License Number], [Trade License Issue Date], [Trade License Expiry Date], [Trade License Copy], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (5, N'Wipro', N'Noida Sector 12', N'1223', N'7273998473', N'1674', N'www.wipro.com', N'info@wipro.com', N'Ajeej Prem Ji', N'ajeem@wipro.com', N'test', N'test@gmail.com', N'H67746Z8', CAST(N'2020-02-17T15:05:46.547' AS DateTime), CAST(N'2020-02-17T15:05:46.547' AS DateTime), N'Y', 23, CAST(N'2020-02-17T15:05:46.547' AS DateTime), 23, CAST(N'2020-02-17T15:05:46.5466667' AS DateTime2))
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Company Address], [Company P.O Box Number], [Company Telephone Number], [Company Fax Number], [Company Website], [Company Email], [Owner Name], [E-mail Address], [Managing Director Name], [E-mail Address Director], [Trade License Number], [Trade License Issue Date], [Trade License Expiry Date], [Trade License Copy], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (6, N'TCS', N'Noida Sector 52', N'1883', N'8976763561', N'1898', N'www.tcs.com', N'info@tcs.com', N'Najeej Prem Ji', N'najeem@wipro.com', N'test2', N'test2@gmail.com', N'H69986Z8', CAST(N'2020-02-17T15:06:56.513' AS DateTime), CAST(N'2020-02-17T15:06:56.513' AS DateTime), N'Y', 23, CAST(N'2020-02-17T15:06:56.513' AS DateTime), 23, CAST(N'2020-02-17T15:06:56.5133333' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Entity] ON 

INSERT [dbo].[Entity] ([EntityID], [Entity Name], [Entity address], [Entity Telephone Number], [Entity P.O Box Number], [Entity Fax Number], [Entity Website], [Entity Email], [CEO/ President Name], [E-mail Address], [Managing Director Name], [E-mail Address Director], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (2, N'test', N'test', N'676767', N'677', N'777', N'ghhg', N'gggh', N'hgghh', N'hggh', N'hg', N'hggh', 3, CAST(N'2001-01-01T15:00:00.000' AS DateTime), 2, CAST(N'2001-01-01T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[Entity] ([EntityID], [Entity Name], [Entity address], [Entity Telephone Number], [Entity P.O Box Number], [Entity Fax Number], [Entity Website], [Entity Email], [CEO/ President Name], [E-mail Address], [Managing Director Name], [E-mail Address Director], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (3, N'test1111', N'test2222', N'676767323', N'677233232', N'77723323232', N'www.check.com', N'check@gmail.com', N'anil', N'anil@check.com', N'Ron', N'Ron@check.com', 3, CAST(N'2001-01-01T15:00:00.000' AS DateTime), 2, CAST(N'2001-01-01T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[Entity] ([EntityID], [Entity Name], [Entity address], [Entity Telephone Number], [Entity P.O Box Number], [Entity Fax Number], [Entity Website], [Entity Email], [CEO/ President Name], [E-mail Address], [Managing Director Name], [E-mail Address Director], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (4, N'test11232332', N'test2222323232', N'346767323', N'347233232', N'8723323232', N'www.check.com', N'check@gmail.com', N'anil', N'anil@check.com', N'Ron', N'Ron@check.com', 3, CAST(N'2001-01-01T15:00:00.000' AS DateTime), 2, CAST(N'2001-01-01T15:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Entity] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventID], [EventName], [EventCriteria], [EventStartDate], [EventEndDate], [EventDescription], [EventVenue], [EventSource], [Weight], [EventBudget], [EventCategory], [EventType], [EventFrequency], [EventCordinatorName], [EventCordinatorMobileNumber], [EventCordinatorEmail], [Estimated Number of Participants], [Estimated Number of Attendees], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (1, N'Dubai sports event', N'test', CAST(N'2020-02-17T13:29:00.997' AS DateTime), CAST(N'2020-02-17T13:29:00.997' AS DateTime), N'Test event description', N'Dubai', N'test', 10, N'1000', N'Gold', N'Test', N'Monthly', N'Test', N'788567887', N'test@gmail.com', N'50000', N'30000', 23, CAST(N'2020-02-17T13:29:00.997' AS DateTime), 23, CAST(N'2020-02-17T13:29:00.9966667' AS DateTime2))
INSERT [dbo].[Event] ([EventID], [EventName], [EventCriteria], [EventStartDate], [EventEndDate], [EventDescription], [EventVenue], [EventSource], [Weight], [EventBudget], [EventCategory], [EventType], [EventFrequency], [EventCordinatorName], [EventCordinatorMobileNumber], [EventCordinatorEmail], [Estimated Number of Participants], [Estimated Number of Attendees], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (2, N'India sports event', N'test 34434', CAST(N'2020-02-17T13:30:20.837' AS DateTime), CAST(N'2020-02-17T13:30:20.837' AS DateTime), N'Test event description 24242', N'Delhi', N'test2332', 30, N'100', N'silver', N'Testee', N'Yearly', N'Test', N'544323232', N'test11@gmail.com', N'20000', N'3000', 23, CAST(N'2020-02-17T13:30:20.837' AS DateTime), 23, CAST(N'2020-02-17T13:30:20.8366667' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[School] ON 

INSERT [dbo].[School] ([SchoolID], [School/University Name], [Institution Address], [Telephone Number], [Institution P.O Box Number], [Institution Fax Number], [Institution Website], [Principal/Dean Name], [Principal/Dean Email], [Principal/Dean Passport Copy], [Event Coordinator Name], [Event Coordinator Mobile Number], [Event Coordinator Passport Copy], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (1, N'test', N'test', N'4434', N'344343', N'343443', N'343', N'sdsdds', N'sdds', N'sdsd', N'sds', N'sdsd', N'3434', 4, CAST(N'2001-01-01T15:00:00.000' AS DateTime), 3, CAST(N'2001-01-01T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[School] ([SchoolID], [School/University Name], [Institution Address], [Telephone Number], [Institution P.O Box Number], [Institution Fax Number], [Institution Website], [Principal/Dean Name], [Principal/Dean Email], [Principal/Dean Passport Copy], [Event Coordinator Name], [Event Coordinator Mobile Number], [Event Coordinator Passport Copy], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (2, N'UPTU', N'ALLAHABAD', N'3244412', N'12212112', N'344322', N'www.ecimt.com', N'massy', N'massy@gmail.com', N'H8293036', N'test', N'787878787878', N'H8332233', 4, CAST(N'2001-01-01T15:00:00.000' AS DateTime), 3, CAST(N'2001-01-01T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[School] ([SchoolID], [School/University Name], [Institution Address], [Telephone Number], [Institution P.O Box Number], [Institution Fax Number], [Institution Website], [Principal/Dean Name], [Principal/Dean Email], [Principal/Dean Passport Copy], [Event Coordinator Name], [Event Coordinator Mobile Number], [Event Coordinator Passport Copy], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (3, N'APTU', N'ALLAHABAD', N'3244412', N'234423', N'12323212', N'www.ecimt.com', N'arvin', N'arvin@gmail.com', N'H8293036', N'test', N'34344334', N'H8332233', 4, CAST(N'2001-01-01T15:00:00.000' AS DateTime), 3, CAST(N'2001-01-01T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[School] ([SchoolID], [School/University Name], [Institution Address], [Telephone Number], [Institution P.O Box Number], [Institution Fax Number], [Institution Website], [Principal/Dean Name], [Principal/Dean Email], [Principal/Dean Passport Copy], [Event Coordinator Name], [Event Coordinator Mobile Number], [Event Coordinator Passport Copy], [CreatedByID], [CreatedDate], [ModifiedByID], [ModifiedDate]) VALUES (4, N'APTU', N'ALLAHABAD', N'3244412', N'234423', N'12323212', N'www.ecimt.com', N'arvin', N'arvin@gmail.com', N'H8293036', N'test', N'34344334', N'H8332233', 4, CAST(N'2001-01-01T15:00:00.000' AS DateTime), 3, CAST(N'2001-01-01T15:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[School] OFF
