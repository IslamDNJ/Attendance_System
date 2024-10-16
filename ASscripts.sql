USE [master]
GO
/****** Object:  Database [Attendance]    Script Date: 12.01.2023 22:08:37 ******/
CREATE DATABASE [Attendance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Attendance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Attendance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Attendance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Attendance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Attendance] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Attendance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Attendance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Attendance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Attendance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Attendance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Attendance] SET ARITHABORT OFF 
GO
ALTER DATABASE [Attendance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Attendance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Attendance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Attendance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Attendance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Attendance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Attendance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Attendance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Attendance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Attendance] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Attendance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Attendance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Attendance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Attendance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Attendance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Attendance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Attendance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Attendance] SET RECOVERY FULL 
GO
ALTER DATABASE [Attendance] SET  MULTI_USER 
GO
ALTER DATABASE [Attendance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Attendance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Attendance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Attendance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Attendance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Attendance] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Attendance', N'ON'
GO
ALTER DATABASE [Attendance] SET QUERY_STORE = OFF
GO
USE [Attendance]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12.01.2023 22:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 12.01.2023 22:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Department] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Course] [int] NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12.01.2023 22:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[ID_Group] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 12.01.2023 22:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 12.01.2023 22:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Student] [int] NULL,
	[ID_Subject] [int] NULL,
	[Date] [date] NULL,
	[Visited] [nvarchar](50) NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([ID], [Name]) VALUES (1, N'Программирование')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (2, N'Экономическое')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (4, N'Радио-технологическое')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (5, N'Топливно-энергетическое')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (6, N'Заочное')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (7, N'Медицинское')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (8, N'Аграрное')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (2, 1, N'16 ИСП', 1)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (3, 2, N'151 ЭБ', 2)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (4, 2, N'153 ЭБ', 1)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (6, 1, N'15 ИСП', 4)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (7, 2, N'152 ЭБ', 3)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (8, 2, N'142 ЭБ', 2)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (9, 2, N'143 ЭБ', 4)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (10, 2, N'141  ЭБ', 3)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (11, 2, N'144 ЭБ', 3)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (13, 1, N'17 ИСП', 3)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (14, 1, N'18 ИСП', 3)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (17, 1, N'19 ИСП', 3)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (21, 1, N'14 ИСП', 4)
INSERT [dbo].[Groups] ([ID], [ID_Department], [Name], [Course]) VALUES (22, 1, N'20 ИСП', 3)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (1, N'Рамазан', N'Мухтаров', NULL)
INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (3, N'Марат', N'Абукаджиев', 3)
INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (4, N'Ислам', N'Сулейманов', 4)
INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (19, N'Алипат', N'Нисниминова', 2)
INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (20, N'Абдулла', N'Довлатов', 2)
INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (21, N'Григорий', N'Лепс', 2)
INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (22, N'Зайнутдин', N'Ахметханов', 2)
INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (23, N'Мирзаханов', N'Мирзахан', 2)
INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (25, N'Хаджимурад', N'Мурадов', 2)
INSERT [dbo].[Students] ([ID], [First_Name], [Last_Name], [ID_Group]) VALUES (26, N'Марат', N'Хаджимапедов', 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([ID], [Name]) VALUES (1, N'Русский язык')
INSERT [dbo].[Subjects] ([ID], [Name]) VALUES (2, N'Литература')
INSERT [dbo].[Subjects] ([ID], [Name]) VALUES (3, N'Математика')
INSERT [dbo].[Subjects] ([ID], [Name]) VALUES (4, N'Английский язык')
INSERT [dbo].[Subjects] ([ID], [Name]) VALUES (5, N'Физ-ра')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Visit] ON 

INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (2, 1, 4, CAST(N'2022-11-10' AS Date), N'Не был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (3, 1, 2, CAST(N'2022-11-20' AS Date), N'Не был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (9, NULL, 3, CAST(N'2022-11-13' AS Date), N'Не был поуважительной причине')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (10, 1, 4, CAST(N'2022-11-12' AS Date), N'Не был поуважительной причине')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (11, 1, 5, CAST(N'2022-11-06' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (13, 1, 3, CAST(N'2022-11-11' AS Date), N'Не был поуважительной причине')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (14, 1, 2, CAST(N'2022-11-11' AS Date), N'Не был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (16, NULL, 1, CAST(N'2022-11-17' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (17, 1, 2, CAST(N'2022-11-12' AS Date), N'Не был поуважительной причине')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (18, NULL, 3, CAST(N'2022-11-15' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (19, 1, 1, CAST(N'2022-11-13' AS Date), N'Не был поуважительной причине')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (20, 1, 3, CAST(N'2022-11-26' AS Date), N'Не был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (26, 1, 1, CAST(N'2023-01-19' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (27, NULL, 2, CAST(N'2023-01-11' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (28, NULL, 1, CAST(N'2023-01-01' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (29, 23, 1, CAST(N'2023-01-05' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (30, NULL, 1, CAST(N'2023-01-11' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (31, NULL, 1, CAST(N'2023-01-11' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (32, 19, 1, CAST(N'2023-01-11' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (33, NULL, 2, CAST(N'2023-01-12' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (34, NULL, 1, CAST(N'2023-01-11' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (35, 25, 3, CAST(N'2023-01-12' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (36, 19, 2, CAST(N'2023-01-11' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (37, 19, 3, CAST(N'2023-01-11' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (38, 19, 4, CAST(N'2023-01-11' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (39, 19, 5, CAST(N'2023-01-11' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (40, 19, 1, CAST(N'2023-01-10' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (41, 19, 2, CAST(N'2023-01-10' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (42, 19, 3, CAST(N'2023-01-10' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (43, 19, 4, CAST(N'2023-01-10' AS Date), N'Был')
INSERT [dbo].[Visit] ([ID], [ID_Student], [ID_Subject], [Date], [Visited]) VALUES (44, 19, 5, CAST(N'2023-01-10' AS Date), N'Не был')
SET IDENTITY_INSERT [dbo].[Visit] OFF
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Departments1] FOREIGN KEY([ID_Department])
REFERENCES [dbo].[Departments] ([ID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Departments1]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Groups1] FOREIGN KEY([ID_Group])
REFERENCES [dbo].[Groups] ([ID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Groups1]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Students] FOREIGN KEY([ID_Student])
REFERENCES [dbo].[Students] ([ID])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Students]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Subjects] FOREIGN KEY([ID_Subject])
REFERENCES [dbo].[Subjects] ([ID])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Subjects]
GO
USE [master]
GO
ALTER DATABASE [Attendance] SET  READ_WRITE 
GO
