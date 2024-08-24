USE [user]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 28/7/2024 8:28:29 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_List_SecretQuestion]    Script Date: 28/7/2024 8:28:29 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_List_SecretQuestion](
	[temp_List_SecretQuestionID] [int] IDENTITY(1,1) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
	[UpdatedDateTime] [datetime2](7) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_temp_List_SecretQuestion] PRIMARY KEY CLUSTERED 
(
	[temp_List_SecretQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_users_table]    Script Date: 28/7/2024 8:28:29 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_users_table](
	[FirstName] [nvarchar](16) NOT NULL,
	[LastName] [nvarchar](16) NOT NULL,
	[PreferredName] [nvarchar](16) NOT NULL,
	[Nric] [nvarchar](9) NOT NULL,
	[Address] [nvarchar](256) NOT NULL,
	[DOB] [datetime2](7) NOT NULL,
	[Gender] [nvarchar](16) NOT NULL,
	[SecretQuestion1ListID] [int] NOT NULL,
	[SecretAnswer1] [nvarchar](256) NULL,
	[SecretQuestion2ListID] [int] NOT NULL,
	[SecretAnswer2] [nvarchar](256) NULL,
	[ContactNo] [nvarchar](16) NULL,
	[AllowNotification] [bit] NOT NULL,
	[ProfilePicture] [nvarchar](256) NULL,
	[LastPasswordChanged] [datetime2](7) NOT NULL,
	[LoginTimeStamp] [datetime2](7) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[secretQuestion1] [nvarchar](256) NOT NULL,
	[secretQuestion2] [nvarchar](256) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'01B168FD-810B-432D-9010-233BA0B380E6', N'Caregiver', N'CAREGIVER', N'9f143e2f-0025-4eba-a70c-2e10efcac6ba')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'01B168FD-810B-432D-9010-233BA0B380E7', N'Game Therapist', N'GAME THERAPIST', N'a6905c59-f994-4617-a3ba-90fffb73641a')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'01B168FE-810B-432D-9010-233BA0B380E9', N'Supervisor', N'SUPERVISOR', N'8981e150-8878-43e2-babe-c20e613bef04')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2301D884-221A-4E7D-B509-0113DCC043E1', N'Administrator', N'ADMINISTRATOR', N'7b40a0b3-1850-482d-9faa-9521f5a38c5c')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'78A7570F-3CE5-48BA-9461-80283ED1D94D', N'Guardian', N'GUARDIAN', N'f1aed675-b733-4b26-ad9d-447905874b78')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7D9B7113-A8F8-4035-99A7-A20DD400F6A3', N'Doctor', N'DOCTOR', N'd719e58a-e5e9-4521-96ed-2f6d6c73c40b')
GO
SET IDENTITY_INSERT [dbo].[temp_List_SecretQuestion] ON 
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (1, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What was your childhood nickname?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (2, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What is the name of your favorite childhood friend?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (3, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'In what city or town did your mother and father meet?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (4, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What is the middle name of your oldest child?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (5, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What is your favorite team?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (6, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What is your favorite movie?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (7, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What was your favorite sport in high school?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (8, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What was your favorite food as a child?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (9, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What is the first name of the boy or girl that you first kissed?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (10, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What was the make and model of your first car?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (11, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What was the name of the hospital where you were born?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (12, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'Who is your childhood sports hero?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (13, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What school did you attend for sixth grade?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (14, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What was the last name of your third grade teacher?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (15, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'In what town was your first job?')
GO
INSERT [dbo].[temp_List_SecretQuestion] ([temp_List_SecretQuestionID], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [Value]) VALUES (16, 0, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'What was the name of the company where you had your first job?')
GO
SET IDENTITY_INSERT [dbo].[temp_List_SecretQuestion] OFF
GO
INSERT [dbo].[temp_users_table] ([FirstName], [LastName], [PreferredName], [Nric], [Address], [DOB], [Gender], [SecretQuestion1ListID], [SecretAnswer1], [SecretQuestion2ListID], [SecretAnswer2], [ContactNo], [AllowNotification], [ProfilePicture], [LastPasswordChanged], [LoginTimeStamp], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [NormalizedName], [secretQuestion1], [secretQuestion2]) VALUES (N'Adeline', N'Tan', N'Ade', N'S9094515G', N'1002 Jalan Bukit Merah #02-01/03, 159456, Singapore', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'F', 9, N'LpiGqu2/CCveqEijwc0mCrwUKpLfPklcrvn5mjWs34M=', 10, N'2PW7rY7EMMf8RvIApqZ83gSAny7Etxi+j6s65Auf7eA=', N'62708850', 1, N'https://res.cloudinary.com/dbpearfyp/image/upload/v1683624198/User/Adeline_Tan_Sxxxx515G/ProfilePicture/tsngdi7kgh0iek8qbbnn.jpg', CAST(N'1989-02-12T00:00:00.0000000' AS DateTime2), CAST(N'1989-02-12T00:00:00.0000000' AS DateTime2), N'adeline', N'adeline@gmail.com', 1, N'AQAAAAEAACcQAAAAEO5GifShJxK1egYxQiKrN0wTUGpDGdSd6dUhHs0cKmjZLvHjQJpGh8DyYus70MDH7w==', N'bdab55cd-12af-47be-9928-4aa3c2741586', N'dd6d71af-f539-415d-8150-069a692ce2ed', 0, 0, N'CAREGIVER', N'What is the first name of the boy or girl that you first kissed?', N'What was the make and model of your first car?')
GO
INSERT [dbo].[temp_users_table] ([FirstName], [LastName], [PreferredName], [Nric], [Address], [DOB], [Gender], [SecretQuestion1ListID], [SecretAnswer1], [SecretQuestion2ListID], [SecretAnswer2], [ContactNo], [AllowNotification], [ProfilePicture], [LastPasswordChanged], [LoginTimeStamp], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [NormalizedName], [secretQuestion1], [secretQuestion2]) VALUES (N'Alan', N'Tan', N'Alan', N'S7538013E', N'Block 51 Ayer Rajah Crescent 02-15/16 Singapore 139948, Singapore', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), N'M', 9, N'fnTNKKiqfR2SwgVTWoOxy9iSrtTTf2vTOrW0gWqpTsw=', 10, N'V6q7TDeRDNZcz5QqKNP+XPg505XGHtGDMwSm38CBXog=', N'67646678', 1, N'https://res.cloudinary.com/dbpearfyp/image/upload/v1634524094/User/Alan_Tan_Sxxxx013E/ProfilePicture/mcnnbowvlbdn0mbfpfi5.jpg', CAST(N'1989-02-12T00:00:00.0000000' AS DateTime2), CAST(N'1989-02-12T00:00:00.0000000' AS DateTime2), N'alan', N'alan@gmail.com', 1, N'AQAAAAEAACcQAAAAEBKOZlkdNQMUZor/6pNzC9OeLmIRxFl8LluqNbM+mgtDSgpw0O6FLFThh98reBqudA==', N'fa2029a7-8000-4957-a1b8-a7568c0abbc7', N'c9f1a202-9190-4f3f-ba48-becc84da79ba', 0, 0, N'GAME THERAPIST', N'What is the first name of the boy or girl that you first kissed?', N'What was the make and model of your first car?')
GO
INSERT [dbo].[temp_users_table] ([FirstName], [LastName], [PreferredName], [Nric], [Address], [DOB], [Gender], [SecretQuestion1ListID], [SecretAnswer1], [SecretQuestion2ListID], [SecretAnswer2], [ContactNo], [AllowNotification], [ProfilePicture], [LastPasswordChanged], [LoginTimeStamp], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [NormalizedName], [secretQuestion1], [secretQuestion2]) VALUES (N'Jessica', N'Sim', N'jess', N'S8156781F', N'521 Woodlands Dr14 #02-343, 730521 Singapore, Singapore', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), N'F', 7, N'lV5bWDEkc0VttBheYQaKLTnQnmNn+EJ9VEtiRwIGyQg=', 8, N'M32pzBLzpeEDal1MxgiYTn7Ib3lO97IzSACxEog1vG0=', N'67646678', 1, N'https://res.cloudinary.com/dbpearfyp/image/upload/v1679139356/User/Jessica_Sim_Sxxxx781F/ProfilePicture/i5xqo3a9btrzjzziaadf.png', CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'jess', N'jess@gmail.com', 1, N'AQAAAAEAACcQAAAAEIGXIuBCMbrWFowd2P1q+hGF2eYt5Ttj5x+sFPpFpau7GvmJlmUHyRXO+U9Qv8jMwg==', N'66c825b8-879a-42f5-8276-43c46e43871e', N'ab4ad737-cd79-41c5-938e-56a69c3c9bf9', 0, 0, N'SUPERVISOR', N'What was your favorite sport in high school?', N'What was your favorite food as a child?')
GO
INSERT [dbo].[temp_users_table] ([FirstName], [LastName], [PreferredName], [Nric], [Address], [DOB], [Gender], [SecretQuestion1ListID], [SecretAnswer1], [SecretQuestion2ListID], [SecretAnswer2], [ContactNo], [AllowNotification], [ProfilePicture], [LastPasswordChanged], [LoginTimeStamp], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [NormalizedName], [secretQuestion1], [secretQuestion2]) VALUES (N'Janice', N'Yak', N'Ms Janice', N'S6908885F', N'238 Thomson Road #13-07 NOVENA SQUARE - TOWER A, 307684, Singapore', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), N'F', 1, N'v/oIZPt3nxTkj4UyD+NY8Gft4WBzg8FdjvBwFUlxHeM=', 2, N'vSyPZja8HhO+7vsI/5pnfCuCaAegX5qY+82/UPbHhhY=', N'67646678', 1, N'https://res.cloudinary.com/dbpearfyp/image/upload/v1691806496/User/Janice_Yak_Sxxxx885F/ProfilePicture/unl93ldasi87bkjrk3xf.jpg', CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'janice', N'janice@gmail.com', 1, N'AQAAAAEAACcQAAAAEDpthmJX+EUh3n6QGXS68RVABmrtI/N+3mJYP0DomN9ekWykfpln9wSvuxCxUGDSeQ==', N'e90516ff-1c43-464b-b3b4-31047e7143fa', N'e6ccb6f3-9170-455a-824a-4acaf9d7a574', 0, 0, N'ADMINISTRATOR', N'What was your childhood nickname?', N'What is the name of your favorite childhood friend?')
GO
INSERT [dbo].[temp_users_table] ([FirstName], [LastName], [PreferredName], [Nric], [Address], [DOB], [Gender], [SecretQuestion1ListID], [SecretAnswer1], [SecretQuestion2ListID], [SecretAnswer2], [ContactNo], [AllowNotification], [ProfilePicture], [LastPasswordChanged], [LoginTimeStamp], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [NormalizedName], [secretQuestion1], [secretQuestion2]) VALUES (N'Dawn', N'Ong', N'Dawn', N'S1295237F', N'235 Thomson Road #13-07 NOVENA SQUARE - TOWER A, 307684, Singapore', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), N'F', 5, N'0JebqJUaAp7JwZYMJhHO3e+RPpBsnb+qiThhm2uEyNQ=', 6, N'TNzRWwQikIHda7eKkoaREaEc/1stobYqkrklyRAYuF4=', N'98123912', 1, N'https://res.cloudinary.com/dbpearfyp/image/upload/v1694830426/User/Dawn_Ong_Sxxxx237F/ProfilePicture/ebfhpg7twp75czidl87p.jpg', CAST(N'1989-02-12T00:00:00.0000000' AS DateTime2), CAST(N'1989-02-12T00:00:00.0000000' AS DateTime2), N'Dawn', N'dawnong333@gmail.com', 1, N'AQAAAAEAACcQAAAAEEucnl0LnudKdrOiI01J37Kj0PqGmQvhH0MaCDx1IRpt0mEuprICF57+Dn1T4gOvlA==', N'4acce5d7-079f-4a9b-a466-5f68c11f4266', N'034981c0-8c85-456c-9b10-71df1ec1787d', 0, 0, N'GUARDIAN', N'What is your favorite team?', N'What is your favorite movie?')
GO
INSERT [dbo].[temp_users_table] ([FirstName], [LastName], [PreferredName], [Nric], [Address], [DOB], [Gender], [SecretQuestion1ListID], [SecretAnswer1], [SecretQuestion2ListID], [SecretAnswer2], [ContactNo], [AllowNotification], [ProfilePicture], [LastPasswordChanged], [LoginTimeStamp], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [NormalizedName], [secretQuestion1], [secretQuestion2]) VALUES (N'Daniel', N'Lee', N'Daniel', N'S8601320G', N'10 Biopolis Way #03-03/04 CHROMOS, BIOPOLIS, 138670, Singapore', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), N'M', 3, N'pt7/HCtKWWvxkEqtMlhdToIjXmgGlh8jb+w8nVNJYf4=', 4, N'NfFLYZWwnenOH9h8lG70G2y9z7Q8lB6Bt+Q8ZJvm48o=', N'95554111', 1, N'https://res.cloudinary.com/dbpearfyp/image/upload/v1634523837/User/Daniel_Lee_Sxxxx320G/ProfilePicture/hint6ceo7emfcz71wkhu.jpg', CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'daniel', N'daniel@gmail.com', 1, N'AQAAAAEAACcQAAAAEFRwEsgnjkuOxf7gQ48PtDpgH9uy7ayor2kkM51zuJ4gu26ZW4TfnnsCtq+Z8d6/oQ==', N'78eaca77-4011-4351-b8f7-b1260a7a44cc', N'b9cf2fe1-5354-4e79-a008-592800ccfec4', 0, 0, N'DOCTOR', N'In what city or town did your mother and father meet?', N'What is the middle name of your oldest child?')
GO
