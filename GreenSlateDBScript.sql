USE [master]
GO
/****** Object:  Database [CodingChallengeDb]    Script Date: 3/6/2020 7:32:50 PM ******/
CREATE DATABASE [CodingChallengeDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CodingChallengeDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CodingChallengeDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CodingChallengeDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CodingChallengeDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CodingChallengeDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CodingChallengeDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CodingChallengeDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CodingChallengeDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CodingChallengeDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CodingChallengeDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CodingChallengeDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET RECOVERY FULL 
GO
ALTER DATABASE [CodingChallengeDb] SET  MULTI_USER 
GO
ALTER DATABASE [CodingChallengeDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CodingChallengeDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CodingChallengeDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CodingChallengeDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CodingChallengeDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CodingChallengeDb', N'ON'
GO
ALTER DATABASE [CodingChallengeDb] SET QUERY_STORE = OFF
GO
USE [CodingChallengeDb]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 3/6/2020 7:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Credits] [int] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/6/2020 7:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProject]    Script Date: 3/6/2020 7:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProject](
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserProject] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (1, CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-07-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (2, CAST(N'2019-12-15T00:00:00.000' AS DateTime), CAST(N'2020-02-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (3, CAST(N'2019-08-05T00:00:00.000' AS DateTime), CAST(N'2019-09-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (4, CAST(N'2019-02-14T00:00:00.000' AS DateTime), CAST(N'2019-04-12T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (5, CAST(N'2018-11-02T00:00:00.000' AS DateTime), CAST(N'2019-01-11T00:00:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (1, N'Alfredo', N'Valverde')
INSERT [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (2, N'Myles', N'Kennedy')
INSERT [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (3, N'Thomas', N'Anderson')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 1, 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 2, 0, CAST(N'2019-12-17T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 3, 0, CAST(N'2019-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 4, 0, CAST(N'2019-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 5, 0, CAST(N'2018-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 1, 1, CAST(N'2020-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 2, 0, CAST(N'2019-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 3, 0, CAST(N'2019-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 4, 0, CAST(N'2019-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 5, 0, CAST(N'2018-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 1, 0, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 2, 1, CAST(N'2020-12-14T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 3, 0, CAST(N'2019-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 4, 0, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 5, 0, CAST(N'2018-12-02T00:00:00.000' AS DateTime))
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_UserProject_Project_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_UserProject_Project_ProjectId]
GO
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_UserProject_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_UserProject_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [CodingChallengeDb] SET  READ_WRITE 
GO
