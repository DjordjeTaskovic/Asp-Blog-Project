USE [master]
GO
/****** Object:  Database [Blog2]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE DATABASE [Blog2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blog2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Blog2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Blog2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Blog2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blog2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blog2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blog2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blog2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blog2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blog2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blog2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blog2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blog2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blog2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blog2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blog2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blog2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blog2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blog2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blog2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Blog2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blog2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blog2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blog2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blog2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blog2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blog2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blog2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Blog2] SET  MULTI_USER 
GO
ALTER DATABASE [Blog2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blog2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blog2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blog2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [Blog2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NULL,
	[UserId] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[Rejting] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image_url] [nvarchar](max) NULL,
	[Image_alt] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Categories]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Categories](
	[PostId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Post_Categories] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Tags]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Tags](
	[PostId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_Post_Tags] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[PostDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Phone] [nvarchar](30) NULL,
	[Email] [nvarchar](450) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUserCases]    Script Date: 8.6.2022. 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUserCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUserCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220531133751_tables', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220531143833_changed-user-config', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220531144523_maxphone-config', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220531154638_post-date', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220531170301_tags-added', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220604092600_post_tag_table', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220604184156_mid-tables-now-with-ids', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220604193437_back-to-combined-ids', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220605075545_usecase-table-add-fall-roles', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220605175748_usecaselogs', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220606162315_likes', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220607164641_allowuserswithsamefirstname', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'SCSI', CAST(N'2022-05-31T20:20:51.8855103' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Generic', CAST(N'2022-05-31T20:20:51.8866092' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Awesome', CAST(N'2022-05-31T20:20:51.8866172' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'auxiliary', CAST(N'2022-05-31T20:20:51.8866188' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Clothing & Industrial', CAST(N'2022-05-31T20:20:51.8866224' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Utah', CAST(N'2022-05-31T20:20:51.8866252' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'e-tailers', CAST(N'2022-05-31T20:20:51.8866282' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'mobile', CAST(N'2022-05-31T20:20:51.8866301' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'Virtual devices', CAST(N'2022-05-31T20:20:51.8866321' AS DateTime2), CAST(N'2022-06-05T14:55:05.6737518' AS DateTime2), 1, CAST(N'2022-06-05T14:55:05.5812918' AS DateTime2), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'optical', CAST(N'2022-05-31T20:20:51.8866337' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'space helmets', CAST(N'2022-06-05T14:35:19.4182793' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'stars', CAST(N'2022-06-07T20:28:00.1490118' AS DateTime2), CAST(N'2022-06-07T20:33:41.2075327' AS DateTime2), 1, CAST(N'2022-06-07T20:33:41.2071117' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, 6, 25, N'Porro est rerum aut expedita id.
Distinctio voluptas qui consequatur corrupti deserunt aut aut.
Est adipisci nulla.
Qui amet voluptatum similique neque quidem.', 3, CAST(N'2022-05-31T17:33:39.5225493' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, 17, 26, N'Et ea accusantium maxime. Doloribus soluta consequatur error. Enim aut voluptas blanditiis. Aut molestiae expedita doloremque vero unde et. Est recusandae voluptatibus officiis. Repellat in et error.', 3, CAST(N'2022-05-31T17:33:39.5238607' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, 15, 30, N'new three', 5, CAST(N'2022-05-31T17:33:39.5238592' AS DateTime2), CAST(N'2022-06-07T22:02:11.6352070' AS DateTime2), 1, CAST(N'2022-06-07T22:02:11.6340253' AS DateTime2), 0)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, 13, 18, N'Quis maiores quam quod laborum dolores nulla.', 5, CAST(N'2022-05-31T17:33:39.5238575' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, 7, 29, N'rem', 2, CAST(N'2022-05-31T17:33:39.5238562' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, 2, 22, N'Neque illo doloribus libero perspiciatis qui architecto.', 4, CAST(N'2022-05-31T17:33:39.5238549' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, 16, 22, N'Iste minima harum. Ex laudantium ea libero reprehenderit optio quis non. Quam error eum. Quod aliquid debitis quibusdam rerum.', 4, CAST(N'2022-05-31T17:33:39.5238536' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, 13, 33, N'Quas est architecto ullam quo.
Repudiandae dolorem aut in perferendis temporibus.
Sunt sint atque neque dolor.', 3, CAST(N'2022-05-31T17:33:39.5238523' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, 6, 29, N'Doloremque aspernatur magnam. Consequatur commodi qui fuga aut culpa. Quas magnam sed similique consequatur. Ipsam quam et nostrum modi. Labore animi ab temporibus numquam eos quisquam ea. Quis similique nesciunt ad consequatur minus eaque repellendus nesciunt.', 5, CAST(N'2022-05-31T17:33:39.5238509' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, 17, 31, N'Veritatis consequuntur ea voluptatem necessitatibus.
Rerum sint repudiandae quo id dolorum aliquam.', 5, CAST(N'2022-05-31T17:33:39.5238491' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, 5, 26, N'enim', 3, CAST(N'2022-05-31T17:33:39.5238477' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, 12, 34, N'Non adipisci omnis aut debitis et et. Saepe porro ea impedit accusantium est velit est consectetur eos. Est recusandae nemo. Officiis quam quisquam similique quibusdam pariatur et dolorum voluptatem ipsam.', 4, CAST(N'2022-05-31T17:33:39.5238463' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, 17, 31, N'Nam repellendus voluptatem et consequuntur.
Facilis vitae sunt laudantium fugiat molestiae et sunt.', 2, CAST(N'2022-05-31T17:33:39.5238450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, 1, 28, N'Ut modi fugit et iusto excepturi similique.
Sit culpa iure doloremque.
Aliquam ratione corrupti rerum inventore.', 4, CAST(N'2022-05-31T17:33:39.5238434' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, 2, 17, N'Sed et sed ipsam modi aspernatur voluptatem voluptatem.', 5, CAST(N'2022-05-31T17:33:39.5238371' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, 7, 28, N'Modi nostrum ipsam expedita necessitatibus.
Culpa blanditiis ab eius nam tempore atque ut sit et.', 1, CAST(N'2022-05-31T17:33:39.5238357' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, 18, 34, N'Suscipit sed commodi autem quod voluptate cumque dolorem. Laboriosam est harum optio qui rerum. Assumenda facere voluptatem sunt accusantium numquam omnis. Veritatis sint nemo iusto.', 4, CAST(N'2022-05-31T17:33:39.5238342' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, 9, 23, N'Iste reprehenderit nemo sit cumque qui.', 1, CAST(N'2022-05-31T17:33:39.5238328' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, 20, 23, N'Libero deleniti a natus dolores soluta aperiam.', 4, CAST(N'2022-05-31T17:33:39.5238312' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, 2, 25, N'Impedit aut quidem consequatur optio.', 1, CAST(N'2022-05-31T17:33:39.5238296' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, 9, 31, N'eius', 5, CAST(N'2022-05-31T17:33:39.5238282' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, 8, 29, N'Ducimus ipsam laborum ea reiciendis unde esse. Sed alias eius ea itaque et labore quis sint. Consequatur soluta omnis et nihil labore explicabo. Odio dolor quam quo doloribus. Velit est dicta sunt consequatur sapiente quae enim repellat maxime. Esse a vel est aut reprehenderit.', 1, CAST(N'2022-05-31T17:33:39.5238261' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, 8, 18, N'Aut esse quia eius impedit molestias harum.', 3, CAST(N'2022-05-31T17:33:39.5238246' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, 18, 18, N'Id hic saepe quia quo quia neque magni impedit. Harum libero explicabo nemo ipsa. Velit enim reiciendis. Velit illum velit necessitatibus et enim amet provident necessitatibus quam.', 2, CAST(N'2022-05-31T17:33:39.5238223' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, 6, 30, N'Occaecati corporis architecto voluptatem voluptas dignissimos. Voluptatibus ex dolore. Et enim exercitationem non. Libero omnis odit at provident et asperiores rerum corrupti.', 3, CAST(N'2022-05-31T17:33:39.5238192' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, 20, 32, N'Provident non ipsam. Sit velit sit praesentium voluptatem ea et voluptatem. Dignissimos delectus et impedit et.', 5, CAST(N'2022-05-31T17:33:39.5238177' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, 9, 27, N'Itaque hic aperiam at eius quaerat non.
Rerum suscipit sit blanditiis.', 5, CAST(N'2022-05-31T17:33:39.5238146' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, 11, 27, N'eaque', 4, CAST(N'2022-05-31T17:33:39.5238064' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, 18, 34, N'Vero et veritatis est similique rerum tempore. In placeat et blanditiis quos dignissimos officiis. Est optio voluptatem. Consequatur ratione fugit omnis consequatur. Qui nihil sed alias.', 4, CAST(N'2022-05-31T17:33:39.5238622' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, 4, 29, N'Animi quibusdam itaque aliquid quas illo laboriosam voluptate consequuntur.', 1, CAST(N'2022-05-31T17:33:39.5238644' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (31, NULL, 22, N'Updated text', 5, CAST(N'2022-06-05T11:11:47.6068330' AS DateTime2), CAST(N'2022-06-05T13:28:41.9428278' AS DateTime2), 1, CAST(N'2022-06-05T11:28:31.6869430' AS DateTime2), 0)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (32, 26, 30, N'Text comented', 3, CAST(N'2022-06-05T11:15:58.2242911' AS DateTime2), CAST(N'2022-06-07T18:59:53.4676395' AS DateTime2), 1, CAST(N'2022-06-07T18:59:53.4086490' AS DateTime2), 0)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (33, 1, 17, N'swager test', 4, CAST(N'2022-06-07T21:03:28.8622466' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [Content], [Rejting], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (34, 1, 17, N'new comment', 5, CAST(N'2022-06-07T21:39:29.4922747' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (1, N'Image.67', N'https://loremflickr.com/320/240?lock=1467027261', CAST(N'2022-05-31T20:40:25.3169792' AS DateTime2), NULL, 0, NULL, 1, 9)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (2, N'Image.3', N'https://loremflickr.com/320/240?lock=2032333110', CAST(N'2022-05-31T20:40:25.3186728' AS DateTime2), NULL, 0, NULL, 1, 12)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (3, N'Image.87', N'https://loremflickr.com/320/240?lock=1222480729', CAST(N'2022-05-31T20:40:25.3186713' AS DateTime2), NULL, 0, NULL, 1, 1)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (4, N'Image.45', N'https://loremflickr.com/320/240?lock=29910790', CAST(N'2022-05-31T20:40:25.3186694' AS DateTime2), NULL, 0, NULL, 1, 11)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (5, N'Image.50', N'https://loremflickr.com/320/240?lock=73180365', CAST(N'2022-05-31T20:40:25.3186560' AS DateTime2), NULL, 0, NULL, 1, 5)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (6, N'Image.38', N'https://loremflickr.com/320/240?lock=519291322', CAST(N'2022-05-31T20:40:25.3186511' AS DateTime2), NULL, 0, NULL, 1, 3)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (7, N'Image.10', N'https://loremflickr.com/320/240?lock=1063735987', CAST(N'2022-05-31T20:40:25.3186497' AS DateTime2), NULL, 0, NULL, 1, 11)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (8, N'Image.23', N'https://loremflickr.com/320/240?lock=1315208698', CAST(N'2022-05-31T20:40:25.3186470' AS DateTime2), NULL, 0, NULL, 1, 15)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (9, N'Image.71', N'https://loremflickr.com/320/240?lock=1094349070', CAST(N'2022-05-31T20:40:25.3186395' AS DateTime2), NULL, 0, NULL, 1, 8)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (10, N'Image.72', N'https://loremflickr.com/320/240?lock=1896293147', CAST(N'2022-05-31T20:40:25.3186336' AS DateTime2), NULL, 0, NULL, 1, 19)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (11, N'Image.17', N'https://loremflickr.com/320/240?lock=307412517', CAST(N'2022-05-31T20:40:25.3186321' AS DateTime2), NULL, 0, NULL, 1, 20)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (12, N'Image.36', N'https://loremflickr.com/320/240?lock=101957675', CAST(N'2022-05-31T20:40:25.3186305' AS DateTime2), NULL, 0, NULL, 1, 13)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (13, N'Image.74', N'https://loremflickr.com/320/240?lock=2057375049', CAST(N'2022-05-31T20:40:25.3186287' AS DateTime2), NULL, 0, NULL, 1, 11)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (14, N'Image.70', N'https://loremflickr.com/320/240?lock=2052369533', CAST(N'2022-05-31T20:40:25.3186153' AS DateTime2), NULL, 0, NULL, 1, 18)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (15, N'Image.43', N'https://loremflickr.com/320/240?lock=2039332604', CAST(N'2022-05-31T20:40:25.3185951' AS DateTime2), NULL, 0, NULL, 1, 3)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (16, N'Image.86', N'https://loremflickr.com/320/240?lock=797749191', CAST(N'2022-05-31T20:40:25.3185913' AS DateTime2), NULL, 0, NULL, 1, 19)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (17, N'Image.30', N'https://loremflickr.com/320/240?lock=902181121', CAST(N'2022-05-31T20:40:25.3185870' AS DateTime2), NULL, 0, NULL, 1, 14)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (18, N'Image.63', N'https://loremflickr.com/320/240?lock=1177737956', CAST(N'2022-05-31T20:40:25.3185598' AS DateTime2), NULL, 0, NULL, 1, 15)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (19, N'Image.70', N'https://loremflickr.com/320/240?lock=343212446', CAST(N'2022-05-31T20:40:25.3186742' AS DateTime2), NULL, 0, NULL, 1, 18)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (20, N'Image.100', N'https://loremflickr.com/320/240?lock=876208532', CAST(N'2022-05-31T20:40:25.3186757' AS DateTime2), NULL, 0, NULL, 1, 18)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (21, N'slika.jpg', N'slika.4.6.2022. 13:29:41', CAST(N'2022-06-04T13:30:52.0187645' AS DateTime2), CAST(N'2022-06-04T22:21:45.1330972' AS DateTime2), 1, CAST(N'2022-06-04T22:21:10.1870587' AS DateTime2), 1, 25)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (22, N'slika2.jpg', N'slika.4.6.2022. 18:00:08', CAST(N'2022-06-04T18:00:08.2913255' AS DateTime2), CAST(N'2022-06-07T18:59:53.4676333' AS DateTime2), 1, CAST(N'2022-06-07T18:59:53.4086440' AS DateTime2), 0, 26)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (24, N'slika3.jpg', N'slika.7.6.2022. 22:49:19', CAST(N'2022-06-07T22:49:19.2355801' AS DateTime2), NULL, 0, NULL, 1, 29)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (25, N'slika1.jpg', N'slika.7.6.2022. 23:37:28', CAST(N'2022-06-07T23:37:28.5834785' AS DateTime2), NULL, 0, NULL, 1, 31)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (26, N'slika5.jpg', N'slika.8.6.2022. 08:51:42', CAST(N'2022-06-08T08:51:42.8571736' AS DateTime2), CAST(N'2022-06-08T08:57:59.7309502' AS DateTime2), 1, CAST(N'2022-06-08T08:57:59.6927040' AS DateTime2), 0, 32)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (27, N'454129.jpg', N'slika.8.6.2022. 11:23:09', CAST(N'2022-06-08T11:25:06.3038033' AS DateTime2), NULL, 0, NULL, 1, 33)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (28, N'454129.jpg', N'slika.8.6.2022. 11:28:49', CAST(N'2022-06-08T11:29:51.2324029' AS DateTime2), CAST(N'2022-06-08T11:34:40.2288075' AS DateTime2), 1, CAST(N'2022-06-08T11:34:40.1915676' AS DateTime2), 0, 34)
INSERT [dbo].[Images] ([Id], [Image_url], [Image_alt], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostId]) VALUES (29, N'peakpx (1).jpg', N'slika.8.6.2022. 11:29:40', CAST(N'2022-06-08T11:29:51.2324192' AS DateTime2), CAST(N'2022-06-08T11:34:40.2288129' AS DateTime2), 1, CAST(N'2022-06-08T11:34:40.1915841' AS DateTime2), 0, 34)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
INSERT [dbo].[Likes] ([UserId], [PostId]) VALUES (17, 1)
INSERT [dbo].[Likes] ([UserId], [PostId]) VALUES (17, 2)
INSERT [dbo].[Likes] ([UserId], [PostId]) VALUES (18, 1)
INSERT [dbo].[Likes] ([UserId], [PostId]) VALUES (18, 3)
INSERT [dbo].[Likes] ([UserId], [PostId]) VALUES (20, 3)
GO
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (33, 1)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (29, 2)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (31, 2)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (34, 2)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (10, 3)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (14, 3)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (19, 4)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (32, 4)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (16, 6)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (2, 8)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (18, 9)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (19, 9)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (20, 9)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (24, 9)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (26, 9)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (4, 10)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (14, 10)
INSERT [dbo].[Post_Categories] ([PostId], [CategoryId]) VALUES (25, 10)
GO
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (29, 1)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (33, 1)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (34, 1)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (34, 2)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (31, 3)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (34, 3)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (11, 4)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (32, 5)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (15, 8)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (26, 8)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (2, 11)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (4, 11)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (10, 13)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (20, 13)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (24, 13)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (26, 13)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (23, 14)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (7, 15)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (20, 15)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (24, 15)
INSERT [dbo].[Post_Tags] ([PostId], [TagId]) VALUES (25, 15)
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (1, 17, N'Regional Optimization Orchestrator', N'numquam', CAST(N'2022-05-31T17:15:32.2402306' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1922-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (2, 33, N'Direct Creative Architect', N'Consequuntur quidem sunt pariatur animi neque qui.', CAST(N'2022-05-31T17:15:32.2415518' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1975-02-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (3, 35, N'Customer Accounts Coordinator', N'consectetur', CAST(N'2022-05-31T17:15:32.2415498' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2062-08-14T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (4, 32, N'Legacy Response Assistant', N'Qui in dolores sed voluptatem dolor occaecati voluptas.', CAST(N'2022-05-31T17:15:32.2415478' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1945-06-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (5, 31, N'Customer Branding Liaison', N'Eaque tempore voluptas recusandae dolorum.', CAST(N'2022-05-31T17:15:32.2415416' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1940-01-09T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (6, 24, N'Central Integration Consultant', N'reprehenderit', CAST(N'2022-05-31T17:15:32.2415396' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2079-05-19T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (7, 35, N'Future Factors Director', N'Nihil quibusdam rerum.', CAST(N'2022-05-31T17:15:32.2415377' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1966-02-09T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (8, 35, N'Regional Integration Analyst', N'Eius numquam omnis hic ut veniam vitae ex.', CAST(N'2022-05-31T17:15:32.2415359' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2047-03-18T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (9, 25, N'Investor Web Architect', N'Quis debitis reiciendis illo repellendus. Delectus sed recusandae voluptatem consequatur beatae. Saepe dolor sequi.', CAST(N'2022-05-31T17:15:32.2415341' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2035-09-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (10, 36, N'Principal Functionality Consultant', N'Numquam dolorem similique sint neque consequatur ut.
Neque laborum autem modi est voluptatibus.
Ipsum dolor tempore nam saepe.
At nihil nisi iusto facere cumque.
Sed in nam natus.', CAST(N'2022-05-31T17:15:32.2415323' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1982-08-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (11, 24, N'Regional Response Officer', N'repudiandae', CAST(N'2022-05-31T17:15:32.2415301' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2012-02-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (12, 22, N'Corporate Configuration Engineer', N'Molestias et modi qui.', CAST(N'2022-05-31T17:15:32.2415282' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1951-07-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (13, 30, N'Investor Usability Facilitator', N'Facilis consectetur ut qui voluptatibus. Mollitia vel et voluptates fugiat nulla eum deserunt harum. Sit ipsam fugit quibusdam quasi. Fuga fuga reiciendis et voluptatum dolor et qui sed.', CAST(N'2022-05-31T17:15:32.2415262' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1967-06-13T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (14, 30, N'Senior Metrics Supervisor', N'Voluptatem et maxime itaque.', CAST(N'2022-05-31T17:15:32.2415220' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1956-10-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (15, 30, N'Direct Response Assistant', N'Velit temporibus magnam quam asperiores.
Sint dolores voluptates expedita nihil est.', CAST(N'2022-05-31T17:15:32.2415190' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1944-12-24T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (16, 33, N'Internal Identity Technician', N'Necessitatibus fugiat reiciendis veniam vel explicabo tenetur sunt.
Molestiae impedit odio eveniet facilis.
Dolorem tenetur ratione iure non consequatur sit amet nisi.
Iure veritatis corrupti ut.
Ea sapiente et quis.
Eum tenetur neque.', CAST(N'2022-05-31T17:15:32.2415170' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1930-12-14T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (17, 22, N'Internal Division Officer', N'Laudantium possimus in voluptatem qui ipsum voluptates. Expedita esse sunt. A impedit quisquam. Voluptatem atque nisi hic itaque nam non. Quia adipisci labore et eveniet rem. At est saepe.', CAST(N'2022-05-31T17:15:32.2415146' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1989-09-13T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (18, 34, N'Internal Brand Orchestrator', N'Quisquam et iusto qui ullam laboriosam consequatur qui. Sint voluptates sequi quia illum. Magnam ut porro quod et voluptatem harum ut. Nobis in facere voluptatibus aut aut. Ut quos reprehenderit quis praesentium illo nam.', CAST(N'2022-05-31T17:15:32.2415003' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2012-03-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (19, 32, N'National Branding Analyst', N'Assumenda consectetur aut vero ipsum assumenda ratione qui porro. Ad enim facere maxime est perspiciatis rerum at. Soluta iste illum corrupti quis itaque. Iure voluptas in architecto et a facere tempora quam nihil. Delectus ut fuga nihil.', CAST(N'2022-05-31T17:15:32.2415536' AS DateTime2), NULL, 0, NULL, 1, CAST(N'1917-04-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (20, 36, N'Test Post update cats3', N'Text update', CAST(N'2022-05-31T17:15:32.2415555' AS DateTime2), CAST(N'2022-06-04T20:46:29.3139328' AS DateTime2), 0, NULL, 1, CAST(N'2022-06-04T20:46:29.2270375' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (23, 17, N'Test Post update', N'Text update', CAST(N'2022-05-31T22:50:08.0443111' AS DateTime2), CAST(N'2022-06-03T19:52:26.4156429' AS DateTime2), 0, NULL, 1, CAST(N'2022-06-03T19:52:26.3095050' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (24, 22, N'Update test 3', N'Text update', CAST(N'2022-06-01T19:04:49.5396794' AS DateTime2), CAST(N'2022-06-04T22:07:27.2399223' AS DateTime2), 0, NULL, 1, CAST(N'2022-06-04T22:07:27.1405005' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (25, 22, N'Test Post with images', N'Text', CAST(N'2022-06-04T13:28:51.3579254' AS DateTime2), CAST(N'2022-06-04T22:21:45.1329050' AS DateTime2), 1, CAST(N'2022-06-04T22:21:10.1867403' AS DateTime2), 1, CAST(N'2022-06-04T13:28:29.6030404' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (26, 22, N'Test Post with more tags', N'Text', CAST(N'2022-06-04T18:00:07.7708602' AS DateTime2), CAST(N'2022-06-07T18:59:53.4674359' AS DateTime2), 1, CAST(N'2022-06-07T18:59:53.4083176' AS DateTime2), 0, CAST(N'2022-06-04T18:00:07.3869774' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (28, 17, N'Regional Response Officer2', N'text3', CAST(N'2022-06-07T22:48:25.5721748' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2022-06-07T22:48:25.5712422' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (29, 17, N'Regional Response Officer3', N'text3', CAST(N'2022-06-07T22:49:19.2252602' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2022-06-07T22:49:19.2245108' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (31, 17, N'this is a title', N'text', CAST(N'2022-06-07T23:37:28.3528513' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2022-06-07T23:37:28.1780369' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (32, 17, N'string', N'string', CAST(N'2022-06-08T08:51:42.6873396' AS DateTime2), CAST(N'2022-06-08T08:57:59.7306957' AS DateTime2), 1, CAST(N'2022-06-08T08:57:59.6921618' AS DateTime2), 0, CAST(N'2022-06-08T08:54:26.5610529' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (33, 17, N'title', N'test', CAST(N'2022-06-08T11:23:09.3888604' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2022-06-08T11:23:09.2490383' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [UserId], [Title], [Content], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [PostDate]) VALUES (34, 17, N'one more', N'test', CAST(N'2022-06-08T11:28:49.2081635' AS DateTime2), CAST(N'2022-06-08T11:34:40.2286226' AS DateTime2), 1, CAST(N'2022-06-08T11:34:40.1905050' AS DateTime2), 0, CAST(N'2022-06-08T11:28:49.0410112' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'quia', CAST(N'2022-05-31T20:44:33.9408688' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'voluptatem', CAST(N'2022-05-31T20:44:33.9417687' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'blanditiis', CAST(N'2022-05-31T20:44:33.9417763' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'quaerat', CAST(N'2022-05-31T20:44:33.9417776' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'atque', CAST(N'2022-05-31T20:44:33.9417798' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'modi', CAST(N'2022-05-31T20:44:33.9417821' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'quam', CAST(N'2022-05-31T20:44:33.9417841' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'perspiciatis', CAST(N'2022-05-31T20:44:33.9417853' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'quas', CAST(N'2022-05-31T20:44:33.9417870' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'ad', CAST(N'2022-05-31T20:44:33.9417881' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'unde', CAST(N'2022-05-31T20:44:33.9417893' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'ipsa', CAST(N'2022-05-31T20:44:33.9417904' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'rerum', CAST(N'2022-05-31T20:44:33.9417916' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'ipsam', CAST(N'2022-05-31T20:44:33.9417927' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'ut', CAST(N'2022-05-31T20:44:33.9417937' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'mega-shop', CAST(N'2022-06-05T15:41:57.5237249' AS DateTime2), CAST(N'2022-06-05T15:44:11.4014931' AS DateTime2), 1, CAST(N'2022-06-05T15:44:11.4012990' AS DateTime2), 0)
INSERT [dbo].[Tags] ([Id], [Title], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'painting', CAST(N'2022-06-08T09:01:05.0061234' AS DateTime2), CAST(N'2022-06-08T09:05:22.4334980' AS DateTime2), 1, CAST(N'2022-06-08T09:05:22.4330336' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2022-06-05T18:30:06.6189352' AS DateTime2), N'User Registration', N'{"FirstName":"Nikola","LastName":"Petrovic","Password":"sifra1","Phone":"066644442222","Email":"nikola@gmail.com"}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2022-06-05T18:49:16.5830177' AS DateTime2), N'User Registration', N'{"FirstName":"Nikola","LastName":"Petrovic","Password":"sifra1","Phone":"066644442222","Email":"djordje.taskovic.188.18@ict.edu.rs"}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2022-06-05T18:51:16.1812580' AS DateTime2), N'User Registration', N'{"FirstName":"Nikola2","LastName":"Petrovic2","Password":"sifra1","Phone":"0666444422","Email":"djordje.taskovic.188.18@ict.edu.rs"}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2022-06-06T15:11:51.0741231' AS DateTime2), N'Search User Use Cases', N'{}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2022-06-06T15:22:55.3163018' AS DateTime2), N'Search User Use Cases', N'{}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2022-06-06T15:25:50.7066898' AS DateTime2), N'Update User Use Cases', N'{"UserId":17,"Identity":null,"AllowedUseCases":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2022-06-06T15:28:08.7049831' AS DateTime2), N'Read AuditLogs', N'{"Date":"0001-01-01T00:00:00"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2022-06-06T15:36:23.9697893' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2022-06-06T15:36:59.0311159' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2022-06-06T15:38:39.5786421' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2022-06-06T15:43:44.0417229' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2022-06-06T15:44:27.1588675' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2022-06-06T15:44:53.7502142' AS DateTime2), N'Post-Get-Search', N'{"Title":"reg","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2022-06-06T15:45:43.9087291' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":"user registration"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2022-06-06T15:58:51.8002697' AS DateTime2), N'Search User Use Cases', N'{"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2022-06-06T16:04:49.0175782' AS DateTime2), N'Geting Tags', N'{"Name":null}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2022-06-06T16:05:00.4784108' AS DateTime2), N'Geting Tags', N'{"Name":"vol"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2022-06-06T16:05:06.4385940' AS DateTime2), N'Geting Tags', N'{"Name":"new"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2022-06-06T16:05:11.7174473' AS DateTime2), N'Geting Tags', N'{"Name":"e"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2022-06-06T16:05:40.7784264' AS DateTime2), N'Geting Categories', N'{"Name":null}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2022-06-06T16:05:50.1305219' AS DateTime2), N'Geting Categories', N'{"Name":"gen"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2022-06-06T17:09:55.6915883' AS DateTime2), N'Post UpVote', N'{"UserId":17,"PostId":22}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2022-06-06T17:12:56.1398421' AS DateTime2), N'Post UpVote', N'{"UserId":17,"PostId":30}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2022-06-06T17:13:29.2632968' AS DateTime2), N'Post UpVote', N'{"UserId":50,"PostId":26}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2022-06-06T17:13:55.7586027' AS DateTime2), N'Post UpVote', N'{"UserId":18,"PostId":26}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2022-06-06T17:15:15.5138714' AS DateTime2), N'Post DownVote', N'18', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2022-06-06T17:17:10.5553392' AS DateTime2), N'Post DownVote', N'18', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2022-06-06T17:19:26.8045158' AS DateTime2), N'Post DownVote', N'18', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2022-06-06T17:22:16.1584448' AS DateTime2), N'Post DownVote', N'18', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2022-06-06T17:23:41.7277992' AS DateTime2), N'Post DownVote', N'18', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2022-06-06T18:19:24.1472254' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2022-06-06T18:20:33.6769834' AS DateTime2), N'Post-Get-Search', N'{"Title":"reg","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2022-06-06T18:29:42.3874735' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2022-06-06T18:30:44.4287255' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2022-06-06T18:58:54.8516087' AS DateTime2), N'Like Operation', N'{"PostId":30,"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2022-06-06T19:00:08.4311813' AS DateTime2), N'Like Operation', N'{"PostId":2,"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2022-06-06T19:01:52.5855899' AS DateTime2), N'Like Operation', N'{"PostId":2,"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2022-06-06T19:04:20.3206085' AS DateTime2), N'Like Operation', N'{"PostId":2,"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2022-06-06T19:04:58.9379824' AS DateTime2), N'Like Operation', N'{"PostId":3,"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2022-06-06T19:05:25.6191517' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2022-06-06T19:19:19.8162976' AS DateTime2), N'Update User Use Cases', N'{"UserId":18,"Identity":null,"AllowedUseCases":[1,2,3,4,5,6,7,8,9,13,19,21]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2022-06-06T19:19:40.6306084' AS DateTime2), N'Update User Use Cases', N'{"UserId":19,"Identity":null,"AllowedUseCases":[1,2,3,4,5,6,7,8,9,13,19,21]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2022-06-06T19:25:22.5632708' AS DateTime2), N'Create tag', N'{"TagId":0,"Tagname":"shop"}', N'Hunter.Littel@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2022-06-06T19:26:24.3850905' AS DateTime2), N'Geting Tags', N'{"Name":"e"}', N'Hunter.Littel@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2022-06-06T19:28:05.3380721' AS DateTime2), N'Create tag', N'{"TagId":0,"Tagname":"shop2"}', N'Berry.Schamberger@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2022-06-06T19:28:26.0118397' AS DateTime2), N'Geting Tags', N'{"Name":"e"}', N'Berry.Schamberger@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2022-06-07T10:59:24.9892416' AS DateTime2), N'Geting Categories', N'{"Name":null}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1045, CAST(N'2022-06-07T11:09:38.8710840' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null}', N'Stephon53@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1046, CAST(N'2022-06-07T11:10:09.9734549' AS DateTime2), N'Geting Categories', N'{"Name":null}', N'Stephon53@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1047, CAST(N'2022-06-07T11:10:21.2350634' AS DateTime2), N'Geting Categories', N'{"Name":"new"}', N'Stephon53@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1048, CAST(N'2022-06-07T11:10:29.1218564' AS DateTime2), N'Geting Categories', N'{"Name":"shop"}', N'Stephon53@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1049, CAST(N'2022-06-07T11:10:32.3879661' AS DateTime2), N'Geting Categories', N'{"Name":"s"}', N'Stephon53@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1050, CAST(N'2022-06-07T11:10:41.2034949' AS DateTime2), N'Geting Categories', N'{"Name":"awesome"}', N'Stephon53@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1051, CAST(N'2022-06-07T12:42:08.9283629' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1052, CAST(N'2022-06-07T12:42:35.9982887' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'Berry.Schamberger@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1053, CAST(N'2022-06-07T12:43:49.6343341' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1054, CAST(N'2022-06-07T12:44:16.0819167' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1055, CAST(N'2022-06-07T12:44:52.7205434' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1056, CAST(N'2022-06-07T12:49:48.7619155' AS DateTime2), N'Geting Categories', N'{"Name":"gen","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1057, CAST(N'2022-06-07T12:50:08.8116069' AS DateTime2), N'Geting Categories', N'{"Name":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1058, CAST(N'2022-06-07T12:54:06.1223016' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1059, CAST(N'2022-06-07T12:57:30.8714011' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1060, CAST(N'2022-06-07T12:59:49.8756771' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1061, CAST(N'2022-06-07T13:07:20.1009079' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1062, CAST(N'2022-06-07T13:14:00.9920401' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1063, CAST(N'2022-06-07T13:14:25.1626641' AS DateTime2), N'Post-Get-Search', N'{"Title":"regional","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1064, CAST(N'2022-06-07T13:19:11.2554391' AS DateTime2), N'Get Single Post', N'{"Id":22,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1065, CAST(N'2022-06-07T13:21:42.4986966' AS DateTime2), N'Get Single Post', N'{"Id":22,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1066, CAST(N'2022-06-07T13:24:55.4201337' AS DateTime2), N'Get Single Post', N'{"Id":22}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1067, CAST(N'2022-06-07T13:25:17.9174736' AS DateTime2), N'Get Single Post', N'{"Id":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1068, CAST(N'2022-06-07T13:25:31.4170831' AS DateTime2), N'Get Single Post', N'{"Id":30}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1069, CAST(N'2022-06-07T13:25:36.9601990' AS DateTime2), N'Get Single Post', N'{"Id":2}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1070, CAST(N'2022-06-07T13:25:40.3342223' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1071, CAST(N'2022-06-07T13:40:13.7135222' AS DateTime2), N'Get Single Post', N'{"PostId":22,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1072, CAST(N'2022-06-07T13:40:47.4732358' AS DateTime2), N'Get Single Post', N'{"PostId":2,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1073, CAST(N'2022-06-07T13:44:16.2136267' AS DateTime2), N'Get Single Post', N'{"PostId":2,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1074, CAST(N'2022-06-07T13:47:32.6718603' AS DateTime2), N'Get Single Post', N'{"PostId":2}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1075, CAST(N'2022-06-07T13:47:43.9224408' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1076, CAST(N'2022-06-07T14:25:25.6255549' AS DateTime2), N'Search User Use Cases', N'{"UserId":0}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1077, CAST(N'2022-06-07T14:25:44.2425159' AS DateTime2), N'Geting Tags', N'{"Name":null,"PerPage":10,"Page":1}', N'Berry.Schamberger@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1078, CAST(N'2022-06-07T14:30:57.1351277' AS DateTime2), N'Search User Use Cases', N'{"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1079, CAST(N'2022-06-07T14:31:15.6621661' AS DateTime2), N'Search User Use Cases', N'{"UserId":50}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1080, CAST(N'2022-06-07T14:36:03.6179280' AS DateTime2), N'Search User Use Cases', N'{"UserId":50}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1081, CAST(N'2022-06-07T14:36:45.2792512' AS DateTime2), N'Search User Use Cases', N'{"UserId":18}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1082, CAST(N'2022-06-07T15:05:25.7234918' AS DateTime2), N'Show Users', N'{"FirstName":null,"LastName":null,"PerPage":10,"Page":1}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1083, CAST(N'2022-06-07T15:06:30.0384751' AS DateTime2), N'Show Users', N'{"FirstName":null,"LastName":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1084, CAST(N'2022-06-07T16:37:38.9921178' AS DateTime2), N'User Update', N'{"Id":6,"FirstName":"nikola","LastName":"Petrovic","Phone":"066654444","Email":"Stephon53@hotmail.com","Password":"sifra1"}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1085, CAST(N'2022-06-07T16:41:04.7813113' AS DateTime2), N'User Update', N'{"Id":6,"FirstName":"nikola","LastName":"Petrovic","Phone":"066654444","Email":"Stephon53@hotmail.com","Password":"sifra1"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1086, CAST(N'2022-06-07T16:41:37.6414845' AS DateTime2), N'User Update', N'{"Id":6,"FirstName":"nikola","LastName":"Petrovic","Phone":"066654444","Email":"Nikola53@hotmail.com","Password":"sifra1"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1087, CAST(N'2022-06-07T16:42:49.3411452' AS DateTime2), N'User Update', N'{"Id":22,"FirstName":"nikola","LastName":"Petrovic","Phone":"066654444","Email":"Nikola53@hotmail.com","Password":"sifra1"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1088, CAST(N'2022-06-07T16:48:22.9958418' AS DateTime2), N'User Update', N'{"Id":22,"FirstName":"nikola","LastName":"Nikolic","Phone":"066654444","Email":"Nikola53@hotmail.com","Password":"sifra1"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1089, CAST(N'2022-06-07T16:55:06.2841870' AS DateTime2), N'Remove user', N'39', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1090, CAST(N'2022-06-07T16:59:48.7547283' AS DateTime2), N'Deleting Post', N'26', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1091, CAST(N'2022-06-07T17:03:27.0569017' AS DateTime2), N'Geting Categories', N'{"Name":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1092, CAST(N'2022-06-07T17:04:15.8554866' AS DateTime2), N'Geting Categories', N'{"Name":"vir","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1093, CAST(N'2022-06-07T17:04:31.5360802' AS DateTime2), N'Geting Categories', N'{"Name":"gen","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1094, CAST(N'2022-06-07T17:06:13.6381207' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1095, CAST(N'2022-06-07T17:06:58.7944855' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":30,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1096, CAST(N'2022-06-07T17:10:36.5619763' AS DateTime2), N'Get Single Post', N'{"PostId":26}', N'Phoebe16@hotmail.com')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1097, CAST(N'2022-06-07T17:11:02.6556935' AS DateTime2), N'Get Single Post', N'{"PostId":25}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1098, CAST(N'2022-06-07T17:15:02.0076923' AS DateTime2), N'Geting Tags', N'{"Name":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1099, CAST(N'2022-06-07T17:15:55.5082912' AS DateTime2), N'Geting Tags', N'{"Name":null,"PerPage":20,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1100, CAST(N'2022-06-07T17:16:15.8623378' AS DateTime2), N'Geting Tags', N'{"Name":"mega","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1101, CAST(N'2022-06-07T17:16:35.7058793' AS DateTime2), N'Geting Tags', N'{"Name":"shop","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1102, CAST(N'2022-06-07T17:16:41.1794111' AS DateTime2), N'Geting Tags', N'{"Name":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1103, CAST(N'2022-06-07T17:16:47.7468564' AS DateTime2), N'Geting Tags', N'{"Name":"quia","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1104, CAST(N'2022-06-07T17:17:10.8219509' AS DateTime2), N'Show Users', N'{"FirstName":null,"LastName":null,"PerPage":20,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1105, CAST(N'2022-06-07T17:17:43.5848146' AS DateTime2), N'Show Users', N'{"FirstName":"nikola2","LastName":null,"PerPage":20,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1106, CAST(N'2022-06-07T17:19:47.2814015' AS DateTime2), N'Show Users', N'{"FirstName":"nikola2","LastName":"Petrovic","PerPage":20,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1107, CAST(N'2022-06-07T17:22:13.5135400' AS DateTime2), N'Show Users', N'{"FirstName":"nikola2","LastName":"Petrovic","PerPage":20,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1108, CAST(N'2022-06-07T17:23:51.1115110' AS DateTime2), N'Show Users', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1109, CAST(N'2022-06-07T17:24:18.2641025' AS DateTime2), N'Show Users', N'{"FirstName":"nikola2","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1110, CAST(N'2022-06-07T17:24:43.6434575' AS DateTime2), N'Show Users', N'{"FirstName":"nikola","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1111, CAST(N'2022-06-07T17:25:03.4052703' AS DateTime2), N'Show Users', N'{"FirstName":"nikola","PerPage":20,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1112, CAST(N'2022-06-07T17:59:23.3700444' AS DateTime2), N'Update User Use Cases', N'{"UserId":17,"Identity":null,"AllowedUseCases":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1113, CAST(N'2022-06-07T18:02:01.1072422' AS DateTime2), N'Update User Use Cases', N'{"UserId":18,"Identity":null,"AllowedUseCases":[1,2,3,4,5,6,7,8,9,13,19,21,23]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1114, CAST(N'2022-06-07T18:02:15.2639551' AS DateTime2), N'Update User Use Cases', N'{"UserId":19,"Identity":null,"AllowedUseCases":[1,2,3,4,5,6,7,8,9,13,19,21,23]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1115, CAST(N'2022-06-07T18:02:22.1209437' AS DateTime2), N'Update User Use Cases', N'{"UserId":20,"Identity":null,"AllowedUseCases":[1,2,3,4,5,6,7,8,9,13,19,21,23]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1116, CAST(N'2022-06-07T18:04:26.2428337' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1117, CAST(N'2022-06-07T18:13:21.7553821' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1118, CAST(N'2022-06-07T18:13:33.1541323' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":"reg","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1119, CAST(N'2022-06-07T18:13:48.4294354' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":"audit","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1120, CAST(N'2022-06-07T18:14:17.2229391' AS DateTime2), N'Geting Categories', N'{"Name":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1121, CAST(N'2022-06-07T18:14:46.9015950' AS DateTime2), N'Geting Categories', N'{"Name":"val","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1122, CAST(N'2022-06-07T18:14:51.6885299' AS DateTime2), N'Geting Categories', N'{"Name":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1123, CAST(N'2022-06-07T18:14:59.0259727' AS DateTime2), N'Geting Categories', N'{"Name":"aw","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1124, CAST(N'2022-06-07T18:27:59.5047827' AS DateTime2), N'Create Category', N'{"Name":"lightsaber"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1125, CAST(N'2022-06-07T18:28:21.8049252' AS DateTime2), N'Geting Categories', N'{"Name":"light","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1126, CAST(N'2022-06-07T18:29:00.9399651' AS DateTime2), N'Update category', N'{"Id":12,"Name":"nikola"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1127, CAST(N'2022-06-07T18:32:25.6443992' AS DateTime2), N'Update category', N'{"Id":12,"Name":"stars"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1128, CAST(N'2022-06-07T18:32:25.3956700' AS DateTime2), N'Update category', N'{"Id":12,"Name":"stars"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1129, CAST(N'2022-06-07T18:32:41.6980433' AS DateTime2), N'Geting Categories', N'{"Name":"stars","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1130, CAST(N'2022-06-07T18:33:41.1921040' AS DateTime2), N'Delete category', N'12', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1131, CAST(N'2022-06-07T18:33:52.6577580' AS DateTime2), N'Geting Categories', N'{"Name":"stars","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1132, CAST(N'2022-06-07T18:34:01.4747476' AS DateTime2), N'Geting Categories', N'{"Name":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1133, CAST(N'2022-06-07T18:35:28.3737737' AS DateTime2), N'Create Comment', N'{"Id":0,"PostId":0,"UserId":0,"Content":"string","Rejting":0}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1134, CAST(N'2022-06-07T19:03:28.1804434' AS DateTime2), N'Create Comment', N'{"PostId":1,"UserId":17,"Content":"swager test","Rejting":4}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1135, CAST(N'2022-06-07T19:19:58.1012565' AS DateTime2), N'Get comments', N'{"Rejting":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1136, CAST(N'2022-06-07T19:20:53.6540984' AS DateTime2), N'Get comments', N'{"Rejting":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1137, CAST(N'2022-06-07T19:21:30.0201075' AS DateTime2), N'Get comments', N'{"Rejting":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1138, CAST(N'2022-06-07T19:23:52.5456825' AS DateTime2), N'Get comments', N'{"Rejting":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1139, CAST(N'2022-06-07T19:30:10.3000579' AS DateTime2), N'Get comments', N'{"Rejting":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1140, CAST(N'2022-06-07T19:31:13.7714935' AS DateTime2), N'Get comments', N'{"Rejting":3,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1141, CAST(N'2022-06-07T19:36:48.8646675' AS DateTime2), N'Get comments', N'{"Rejting":null,"PerPage":10,"Page":1}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1142, CAST(N'2022-06-07T19:37:58.6984215' AS DateTime2), N'Geting Categories', N'{"Name":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1143, CAST(N'2022-06-07T19:38:06.0257888' AS DateTime2), N'Get comments', N'{"Rejting":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1144, CAST(N'2022-06-07T19:38:13.4928902' AS DateTime2), N'Get comments', N'{"Rejting":3,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1145, CAST(N'2022-06-07T19:38:21.4989538' AS DateTime2), N'Get comments', N'{"Rejting":2,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1146, CAST(N'2022-06-07T19:39:29.3874771' AS DateTime2), N'Create Comment', N'{"PostId":1,"UserId":17,"Content":"new comment","Rejting":5}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1147, CAST(N'2022-06-07T19:39:50.2166536' AS DateTime2), N'Get comments', N'{"Rejting":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1148, CAST(N'2022-06-07T19:39:53.7746221' AS DateTime2), N'Get comments', N'{"Rejting":5,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1149, CAST(N'2022-06-07T19:40:28.9446117' AS DateTime2), N'Get comments', N'{"Rejting":5,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1150, CAST(N'2022-06-07T19:42:29.8706157' AS DateTime2), N'Get comments', N'{"Rejting":5,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1151, CAST(N'2022-06-07T19:47:57.1464619' AS DateTime2), N'Get comments', N'{"Rejting":0,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1152, CAST(N'2022-06-07T19:48:54.5657795' AS DateTime2), N'Get comments', N'{"Rejting":0,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1153, CAST(N'2022-06-07T19:50:28.1826455' AS DateTime2), N'Get comments', N'{"Rejting":0,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1154, CAST(N'2022-06-07T19:50:43.2010659' AS DateTime2), N'Get comments', N'{"Rejting":3,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1155, CAST(N'2022-06-07T19:50:51.1918733' AS DateTime2), N'Get comments', N'{"Rejting":5,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1156, CAST(N'2022-06-07T19:54:57.3655596' AS DateTime2), N'Get comments', N'{"Rejting":0,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1157, CAST(N'2022-06-07T19:55:08.0442199' AS DateTime2), N'Get comments', N'{"Rejting":3,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1158, CAST(N'2022-06-07T19:55:14.4199313' AS DateTime2), N'Get comments', N'{"Rejting":5,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1159, CAST(N'2022-06-07T19:56:47.3763869' AS DateTime2), N'Get comments', N'{"Rejting":2,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1160, CAST(N'2022-06-07T19:57:20.6844662' AS DateTime2), N'Get comments', N'{"Rejting":3,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1161, CAST(N'2022-06-07T20:00:32.4182174' AS DateTime2), N'Get comments', N'{"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1162, CAST(N'2022-06-07T20:01:34.2936680' AS DateTime2), N'Update Comment', N'{"Id":3,"PostId":1,"UserId":17,"Content":"new three","Rejting":5}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1163, CAST(N'2022-06-07T20:01:41.3967157' AS DateTime2), N'Get comments', N'{"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1164, CAST(N'2022-06-07T20:02:11.6239639' AS DateTime2), N'Delete Comment', N'3', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1165, CAST(N'2022-06-07T20:02:20.1985752' AS DateTime2), N'Get comments', N'{"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1166, CAST(N'2022-06-07T20:12:28.8262815' AS DateTime2), N'Like Operation', N'{"PostId":40,"UserId":40}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1167, CAST(N'2022-06-07T20:13:01.1027996' AS DateTime2), N'Like Operation', N'{"PostId":1,"UserId":17}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1168, CAST(N'2022-06-07T20:13:35.4630614' AS DateTime2), N'Like Operation', N'{"PostId":1,"UserId":17}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1169, CAST(N'2022-06-07T20:13:54.1547167' AS DateTime2), N'Like Operation', N'{"PostId":1,"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1170, CAST(N'2022-06-07T20:14:04.5287622' AS DateTime2), N'Like Operation', N'{"PostId":1,"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1171, CAST(N'2022-06-07T20:14:16.6432225' AS DateTime2), N'Like Operation', N'{"PostId":2,"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1172, CAST(N'2022-06-07T20:14:22.8490894' AS DateTime2), N'Like Operation', N'{"PostId":3,"UserId":20}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1173, CAST(N'2022-06-07T20:37:36.4032869' AS DateTime2), N'Like Operation', N'{"PostId":1,"UserId":17}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1174, CAST(N'2022-06-07T20:38:29.6364075' AS DateTime2), N'Like Operation', N'{"PostId":1,"UserId":17}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1175, CAST(N'2022-06-07T20:40:00.2507454' AS DateTime2), N'Like Operation', N'{"PostId":1,"UserId":17}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1176, CAST(N'2022-06-07T20:40:24.4580570' AS DateTime2), N'Like Operation', N'{"PostId":2,"UserId":17}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1177, CAST(N'2022-06-07T20:40:40.6600019' AS DateTime2), N'Like Operation', N'{"PostId":3,"UserId":17}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1178, CAST(N'2022-06-07T20:41:11.1724410' AS DateTime2), N'Like Operation', N'{"PostId":3,"UserId":17}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1179, CAST(N'2022-06-07T20:43:18.4294489' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1180, CAST(N'2022-06-07T20:43:33.0014112' AS DateTime2), N'Post-Get-Search', N'{"Title":"region","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1181, CAST(N'2022-06-07T20:43:50.3679679' AS DateTime2), N'Post-Get-Search', N'{"Title":"off","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1182, CAST(N'2022-06-07T20:45:38.5399495' AS DateTime2), N'Creating New Post', N'{"Id":0,"UserId":50,"Title":"Regional Response Officer","Content":"text3","PostDate":"2022-06-07T20:44:09.516Z","PostImages":[{"PostId":0,"Image_url":"slika3.jpg"}],"CategoryId":0,"Tagids":[{"TagId":0,"Tagname":"slika2.jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1183, CAST(N'2022-06-07T20:46:43.9359406' AS DateTime2), N'Creating New Post', N'{"Id":0,"UserId":50,"Title":"Regional Response Officer","Content":"text3","PostDate":"2022-06-07T20:44:09.516Z","PostImages":[{"PostId":0,"Image_url":"slika3.jpg"}],"CategoryId":2,"Tagids":[{"TagId":0,"Tagname":"slika2.jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1184, CAST(N'2022-06-07T20:46:56.0200750' AS DateTime2), N'Creating New Post', N'{"Id":0,"UserId":50,"Title":"Regional Response Officer2","Content":"text3","PostDate":"2022-06-07T20:44:09.516Z","PostImages":[{"PostId":0,"Image_url":"slika3.jpg"}],"CategoryId":2,"Tagids":[{"TagId":0,"Tagname":"slika2.jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1185, CAST(N'2022-06-07T20:48:25.5520507' AS DateTime2), N'Creating New Post', N'{"Id":0,"UserId":17,"Title":"Regional Response Officer2","Content":"text3","PostDate":"2022-06-07T20:44:09.516Z","PostImages":[{"PostId":0,"Image_url":"slika3.jpg"}],"CategoryId":2,"Tagids":[{"TagId":0,"Tagname":"slika2.jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1186, CAST(N'2022-06-07T20:49:01.0358628' AS DateTime2), N'Creating New Post', N'{"Id":0,"UserId":17,"Title":"Regional Response Officer2","Content":"text3","PostDate":"2022-06-07T20:44:09.516Z","PostImages":[{"PostId":0,"Image_url":"slika3.jpg"}],"CategoryId":2,"Tagids":[{"TagId":1,"Tagname":"slika2.jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1187, CAST(N'2022-06-07T20:49:19.2064604' AS DateTime2), N'Creating New Post', N'{"Id":0,"UserId":17,"Title":"Regional Response Officer3","Content":"text3","PostDate":"2022-06-07T20:44:09.516Z","PostImages":[{"PostId":0,"Image_url":"slika3.jpg"}],"CategoryId":2,"Tagids":[{"TagId":1,"Tagname":"slika2.jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1188, CAST(N'2022-06-07T21:23:07.1934444' AS DateTime2), N'Creating New Post', N'{"UserId":50,"Title":"","Content":"","PostImages":[{"Image_url":""}],"CategoryId":0,"PostTags":[{"Tagid":0}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1189, CAST(N'2022-06-07T21:23:52.8399476' AS DateTime2), N'Creating New Post', N'{"UserId":50,"Title":"Post title","Content":"text","PostImages":[{"Image_url":""}],"CategoryId":0,"PostTags":[{"Tagid":0}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1190, CAST(N'2022-06-07T21:31:51.7051680' AS DateTime2), N'Creating New Post', N'{"UserId":50,"Title":"","Content":"text","PostImages":[{"Image_url":""}],"CategoryId":0,"PostTags":[{"Tagid":0}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1191, CAST(N'2022-06-07T21:32:42.8680836' AS DateTime2), N'Creating New Post', N'{"UserId":50,"Title":"","Content":"text","PostImages":[{"Image_url":""}],"CategoryId":0,"PostTags":[{"Tagid":0}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1192, CAST(N'2022-06-07T21:36:53.1333874' AS DateTime2), N'Creating New Post', N'{"UserId":17,"Title":"this is a title","Content":"text","PostImages":[{"Image_url":""}],"CategoryId":0,"PostTags":[{"Tagid":0}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1193, CAST(N'2022-06-07T21:37:28.1164153' AS DateTime2), N'Creating New Post', N'{"UserId":17,"Title":"this is a title","Content":"text","PostImages":[{"Image_url":"slika1.jpg"}],"CategoryId":2,"PostTags":[{"Tagid":3}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1194, CAST(N'2022-06-07T21:38:18.6827050' AS DateTime2), N'Post-Get-Search', N'{"Title":"this","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1195, CAST(N'2022-06-07T21:38:53.9545822' AS DateTime2), N'Get Single Post', N'{"PostId":31}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1196, CAST(N'2022-06-07T21:39:03.5619677' AS DateTime2), N'Get Single Post', N'{"PostId":31}', N'Phoebe16@hotmail.com')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1197, CAST(N'2022-06-07T21:44:49.8102003' AS DateTime2), N'Get Single Post', N'{"PostId":31}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1198, CAST(N'2022-06-07T21:45:00.9182282' AS DateTime2), N'Get Single Post', N'{"PostId":31}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1199, CAST(N'2022-06-07T21:45:09.5501737' AS DateTime2), N'Get Single Post', N'{"PostId":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1200, CAST(N'2022-06-08T06:49:35.0267783' AS DateTime2), N'Post-Get-Search', N'{"Title":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1201, CAST(N'2022-06-08T06:51:06.3131411' AS DateTime2), N'Creating New Post', N'{"UserId":17,"Title":"postWith tags","Content":"text","PostImages":[{"Image_url":"slika5.jpg"}],"CategoryId":1,"PostTags":[{"TagId":0}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1202, CAST(N'2022-06-08T06:51:42.5699485' AS DateTime2), N'Creating New Post', N'{"UserId":17,"Title":"postWith tags","Content":"text","PostImages":[{"Image_url":"slika5.jpg"}],"CategoryId":1,"PostTags":[{"TagId":3}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1203, CAST(N'2022-06-08T06:51:59.7883434' AS DateTime2), N'Post-Get-Search', N'{"Title":"postwith","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1204, CAST(N'2022-06-08T06:54:00.4975738' AS DateTime2), N'Update Post Command', N'{"Id":32,"UserId":17,"Title":"string","Content":"string","CategoryId":4,"PostTags":[{"TagId":5}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1205, CAST(N'2022-06-08T06:54:54.0275141' AS DateTime2), N'Post-Get-Search', N'{"Title":"postwith","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1206, CAST(N'2022-06-08T06:56:39.5583432' AS DateTime2), N'Post-Get-Search', N'{"Title":"string","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1207, CAST(N'2022-06-08T06:57:44.4057064' AS DateTime2), N'Get Single Post', N'{"PostId":32}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1208, CAST(N'2022-06-08T06:57:59.5837726' AS DateTime2), N'Deleting Post', N'32', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1209, CAST(N'2022-06-08T06:58:06.0232400' AS DateTime2), N'Get Single Post', N'{"PostId":32}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1210, CAST(N'2022-06-08T06:58:30.0996892' AS DateTime2), N'Post-Get-Search', N'{"Title":"string","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1211, CAST(N'2022-06-08T06:59:41.9905715' AS DateTime2), N'Geting Tags', N'{"Name":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1212, CAST(N'2022-06-08T07:00:04.6923523' AS DateTime2), N'Geting Tags', N'{"Name":"atq","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1213, CAST(N'2022-06-08T07:00:44.3565651' AS DateTime2), N'Create tag', N'{"Name":"atque"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1214, CAST(N'2022-06-08T07:01:04.9746736' AS DateTime2), N'Create tag', N'{"Name":"newTag"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1215, CAST(N'2022-06-08T07:01:19.7562375' AS DateTime2), N'Geting Tags', N'{"Name":"new","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1216, CAST(N'2022-06-08T07:04:49.7387459' AS DateTime2), N'Update tag', N'{"TagId":17,"Name":"painting"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1217, CAST(N'2022-06-08T07:05:07.7519475' AS DateTime2), N'Geting Tags', N'{"Name":"painting","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1218, CAST(N'2022-06-08T07:05:22.4181724' AS DateTime2), N'Delete tag', N'17', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1219, CAST(N'2022-06-08T07:05:29.5221086' AS DateTime2), N'Geting Tags', N'{"Name":"painting","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1220, CAST(N'2022-06-08T07:10:12.6391107' AS DateTime2), N'User Registration', N'{"FirstName":"","LastName":"","Password":"","Phone":"","Email":""}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1221, CAST(N'2022-06-08T07:11:58.4314807' AS DateTime2), N'User Registration', N'{"FirstName":"Flash","LastName":"Trasneded","Password":"sifra2","Phone":"333344445","Email":"flash@gmail.com"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1222, CAST(N'2022-06-08T07:34:50.2465893' AS DateTime2), N'User Registration', N'{"FirstName":"MonoGram","LastName":"Poly","Password":"sifra3","Phone":"3333444453","Email":"flash@gmail.com"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1223, CAST(N'2022-06-08T07:35:16.5929688' AS DateTime2), N'User Registration', N'{"FirstName":"MonoGram","LastName":"Poly","Password":"sifra3","Phone":"3333444453","Email":"mono@gmail.com"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1224, CAST(N'2022-06-08T07:37:48.7527250' AS DateTime2), N'Search User Use Cases', N'{}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1225, CAST(N'2022-06-08T07:38:34.8882514' AS DateTime2), N'Search User Use Cases', N'{}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1226, CAST(N'2022-06-08T07:38:47.7736275' AS DateTime2), N'Search User Use Cases', N'{}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1227, CAST(N'2022-06-08T07:43:18.8148502' AS DateTime2), N'User Registration', N'{"FirstName":"MogaCol","LastName":"Waer","Password":"sifra4","Phone":"3333444453","Email":"monocol@gmail.com"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1228, CAST(N'2022-06-08T08:28:03.5443097' AS DateTime2), N'Show Users', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1229, CAST(N'2022-06-08T08:28:18.7207580' AS DateTime2), N'Show Users', N'{"FirstName":"string","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1230, CAST(N'2022-06-08T08:28:27.3389792' AS DateTime2), N'Show Users', N'{"FirstName":"mono","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1231, CAST(N'2022-06-08T08:29:45.8889873' AS DateTime2), N'Show Users', N'{"FirstName":"mono","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1232, CAST(N'2022-06-08T08:31:08.4868475' AS DateTime2), N'User Update', N'{"Id":41,"FirstName":"Mono the second","LastName":"Poly","Phone":"33323423423","Email":"mono2@gmail.com","Password":"sifra3"}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1233, CAST(N'2022-06-08T08:31:22.7908759' AS DateTime2), N'Show Users', N'{"FirstName":"mono","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1234, CAST(N'2022-06-08T08:31:44.0546571' AS DateTime2), N'Remove user', N'41', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1235, CAST(N'2022-06-08T08:31:52.5598633' AS DateTime2), N'Show Users', N'{"FirstName":"mono","PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1236, CAST(N'2022-06-08T09:08:00.2452692' AS DateTime2), N'Creating New Post', N'{"UserId":20,"Title":"Upload Image","Content":"test","CategoryId":2,"PostTags":[],"ImageFiles":[{"ContentDisposition":"form-data; name=\"ImageFiles\"; filename=\"454129.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ImageFiles\"; filename=\"454129.jpg\""],"Content-Type":["image/jpeg"]},"Length":1406558,"Name":"ImageFiles","FileName":"454129.jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1237, CAST(N'2022-06-08T09:08:32.1200893' AS DateTime2), N'Creating New Post', N'{"UserId":20,"Title":"Upload Image","Content":"test","CategoryId":2,"PostTags":[],"ImageFiles":[{"ContentDisposition":"form-data; name=\"ImageFiles\"; filename=\"454129.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ImageFiles\"; filename=\"454129.jpg\""],"Content-Type":["image/jpeg"]},"Length":1406558,"Name":"ImageFiles","FileName":"454129.jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1238, CAST(N'2022-06-08T09:23:05.0881209' AS DateTime2), N'Creating New Post', N'{"UserId":17,"Title":"title","Content":"test","CategoryId":1,"PostTags":[1],"ImageFiles":[{"ContentDisposition":"form-data; name=\"ImageFiles\"; filename=\"454129.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ImageFiles\"; filename=\"454129.jpg\""],"Content-Type":["image/jpeg"]},"Length":1406558,"Name":"ImageFiles","FileName":"454129.jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1239, CAST(N'2022-06-08T09:28:44.5910409' AS DateTime2), N'Creating New Post', N'{"UserId":17,"Title":"one more","Content":"test","CategoryId":2,"PostTags":[1,2,3],"ImageFiles":[{"ContentDisposition":"form-data; name=\"ImageFiles\"; filename=\"454129.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ImageFiles\"; filename=\"454129.jpg\""],"Content-Type":["image/jpeg"]},"Length":1406558,"Name":"ImageFiles","FileName":"454129.jpg"},{"ContentDisposition":"form-data; name=\"ImageFiles\"; filename=\"peakpx (1).jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ImageFiles\"; filename=\"peakpx (1).jpg\""],"Content-Type":["image/jpeg"]},"Length":235736,"Name":"ImageFiles","FileName":"peakpx (1).jpg"}]}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1240, CAST(N'2022-06-08T09:34:11.9111901' AS DateTime2), N'Get Single Post', N'{"PostId":34}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1241, CAST(N'2022-06-08T09:34:40.0692289' AS DateTime2), N'Deleting Post', N'34', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1242, CAST(N'2022-06-08T09:34:44.9102962' AS DateTime2), N'Get Single Post', N'{"PostId":34}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1243, CAST(N'2022-06-08T09:36:11.1664201' AS DateTime2), N'Show Users', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1244, CAST(N'2022-06-08T09:36:21.9879555' AS DateTime2), N'Show Users', N'{"FirstName":null,"PerPage":60,"Page":1}', N'Phoebe16@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1245, CAST(N'2022-06-08T09:38:57.7096521' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'Berry.Schamberger@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1246, CAST(N'2022-06-08T09:39:18.9186568' AS DateTime2), N'Geting Tags', N'{"Name":null,"PerPage":10,"Page":1}', N'Berry.Schamberger@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1247, CAST(N'2022-06-08T09:39:53.6343637' AS DateTime2), N'Delete tag', N'1', N'Berry.Schamberger@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1248, CAST(N'2022-06-08T09:54:47.5297454' AS DateTime2), N'User Registration', N'{"FirstName":"string","LastName":"string","Password":"string","Phone":"string","Email":"string"}', N'UnAuthorized Actor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1249, CAST(N'2022-06-08T09:56:50.4448691' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'Berry.Schamberger@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1250, CAST(N'2022-06-08T09:57:17.4820365' AS DateTime2), N'User Registration', N'{"FirstName":"string","LastName":"string","Password":"string","Phone":"string","Email":"string"}', N'Berry.Schamberger@hotmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1251, CAST(N'2022-06-08T10:00:37.6675830' AS DateTime2), N'Read AuditLogs', N'{"UseCaseName":null,"PerPage":10,"Page":1}', N'UnAuthorized Actor')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'Phoebe', N'Erdman', N'682-550-4269 x118', N'Phoebe16@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8290680' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'Berry', N'Schamberger', N'(994) 847-3918 x7321', N'Berry.Schamberger@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8303044' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'Stephon', N'Corkery', N'844-228-8313 x447', N'Stephon53@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8303031' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'Hunter', N'Littel', N'1-984-514-9108', N'Hunter.Littel@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8303013' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, N'Madalyn', N'Von', N'536-797-5096 x2513', N'Madalyn.Von@yahoo.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302969' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, N'nikola', N'Nikolic', N'066654444', N'Nikola53@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302957' AS DateTime2), CAST(N'2022-06-07T18:48:39.5199215' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, N'Yasmeen', N'Schmidt', N'1-928-981-0822 x3711', N'Yasmeen.Schmidt@yahoo.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302944' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, N'Flo', N'Schneider', N'1-717-695-7233 x376', N'Flo_Schneider@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302916' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, N'Fatima', N'Lowe', N'721.637.7265', N'Fatima_Lowe@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302903' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, N'Bertha', N'Koch', N'(635) 988-9549', N'Bertha76@gmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302890' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, N'Brian', N'Stiedemann', N'(705) 412-8867 x1295', N'Brian.Stiedemann@gmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302875' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, N'Mollie', N'Schowalter', N'(525) 540-8860', N'Mollie.Schowalter62@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302855' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, N'Johnny', N'Bergnaum', N'(575) 494-2163', N'Johnny22@yahoo.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302827' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, N'Ebba', N'Pouros', N'483-349-9782', N'Ebba_Pouros@yahoo.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302804' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (31, N'Augusta', N'Pouros', N'732.375.8806 x103', N'Augusta_Pouros38@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302780' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (32, N'Ayden', N'Roob', N'1-851-682-3784 x971', N'Ayden35@yahoo.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302766' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (33, N'Percy', N'Schimmel', N'651-599-7934', N'Percy_Schimmel@hotmail.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302753' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (34, N'Raoul', N'Marks', N'771.444.7645', N'Raoul_Marks@yahoo.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8302668' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (35, N'Zoila', N'Conroy', N'(252) 679-5445 x23421', N'Zoila_Conroy95@yahoo.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8303057' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (36, N'Lucas', N'Von', N'(840) 623-8015 x99543', N'Lucas_Von25@yahoo.com', N'sifra1', CAST(N'2022-05-31T16:46:35.8303069' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (37, N'Nikola', N'Petrovic', N'066644442222', N'nikola@gmail.com', N'sifra1', CAST(N'2022-06-05T20:30:11.7619016' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (39, N'Nikola2', N'Petrovic2', N'0666444422', N'djordje.taskovic.188.18@ict.edu.rs', N'sifra1', CAST(N'2022-06-05T20:51:16.2128913' AS DateTime2), CAST(N'2022-06-07T18:55:21.4165501' AS DateTime2), 1, CAST(N'2022-06-07T18:55:21.2994859' AS DateTime2), 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (40, N'Flash', N'Trasneded', N'333344445', N'flash@gmail.com', N'sifra2', CAST(N'2022-06-08T09:11:58.5748333' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (41, N'Mono the second', N'Poly', N'33323423423', N'mono2@gmail.com', N'sifra3', CAST(N'2022-06-08T09:35:16.7076286' AS DateTime2), CAST(N'2022-06-08T10:31:44.0696571' AS DateTime2), 1, CAST(N'2022-06-08T10:31:44.0691646' AS DateTime2), 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (42, N'MogaCol', N'Waer', N'3333444453', N'monocol@gmail.com', N'sifra4', CAST(N'2022-06-08T09:43:23.5495636' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUserCases] ON 

INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (61, 17, 24)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (62, 17, 22)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (63, 17, 2)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (64, 17, 3)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (65, 17, 4)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (66, 17, 5)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (67, 17, 6)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (68, 17, 7)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (69, 17, 8)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (70, 17, 9)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (71, 17, 10)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (72, 17, 23)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (73, 17, 11)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (74, 17, 13)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (75, 17, 14)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (76, 17, 15)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (77, 17, 16)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (78, 17, 17)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (79, 17, 18)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (80, 17, 19)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (81, 17, 20)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (82, 17, 21)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (83, 17, 12)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (84, 17, 1)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (85, 18, 23)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (87, 18, 13)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (88, 18, 9)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (89, 18, 8)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (90, 18, 7)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (91, 18, 6)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (92, 18, 5)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (93, 18, 4)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (94, 18, 3)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (95, 18, 2)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (96, 18, 21)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (97, 18, 1)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (98, 19, 23)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (100, 19, 13)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (101, 19, 9)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (102, 19, 8)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (103, 19, 7)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (104, 19, 6)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (105, 19, 5)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (106, 19, 4)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (107, 19, 3)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (108, 19, 2)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (109, 19, 21)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (110, 19, 1)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (111, 20, 1)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (112, 20, 2)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (113, 20, 3)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (114, 20, 4)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (115, 20, 5)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (116, 20, 6)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (117, 20, 7)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (118, 20, 8)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (119, 20, 9)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (120, 20, 13)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (122, 20, 21)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (123, 20, 23)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (124, 17, 25)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (125, 41, 1)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (126, 41, 2)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (127, 41, 3)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (128, 41, 4)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (129, 41, 5)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (130, 41, 6)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (131, 41, 7)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (132, 41, 8)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (133, 41, 9)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (134, 41, 13)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (136, 41, 21)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (137, 41, 23)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (138, 41, 25)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (139, 42, 1)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (140, 42, 2)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (141, 42, 3)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (142, 42, 4)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (143, 42, 5)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (144, 42, 6)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (145, 42, 7)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (146, 42, 8)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (147, 42, 9)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (148, 42, 13)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (150, 42, 21)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (151, 42, 23)
INSERT [dbo].[UserUserCases] ([Id], [UserId], [UseCaseId]) VALUES (152, 42, 25)
SET IDENTITY_INSERT [dbo].[UserUserCases] OFF
GO
/****** Object:  Index [IX_Comments_PostId]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Images_PostId]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE NONCLUSTERED INDEX [IX_Images_PostId] ON [dbo].[Images]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Likes_UserId]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE NONCLUSTERED INDEX [IX_Likes_UserId] ON [dbo].[Likes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Post_Categories_CategoryId]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE NONCLUSTERED INDEX [IX_Post_Categories_CategoryId] ON [dbo].[Post_Categories]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Post_Tags_TagId]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE NONCLUSTERED INDEX [IX_Post_Tags_TagId] ON [dbo].[Post_Tags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUserCases_UserId]    Script Date: 8.6.2022. 12:06:14 ******/
CREATE NONCLUSTERED INDEX [IX_UserUserCases_UserId] ON [dbo].[UserUserCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT ((0)) FOR [PostId]
GO
ALTER TABLE [dbo].[Post_Categories] ADD  DEFAULT ((0)) FOR [PostId]
GO
ALTER TABLE [dbo].[Post_Categories] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Post_Tags] ADD  DEFAULT ((0)) FOR [PostId]
GO
ALTER TABLE [dbo].[Post_Tags] ADD  DEFAULT ((0)) FOR [TagId]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [PostDate]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Posts_PostId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Posts_PostId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Users_UserId]
GO
ALTER TABLE [dbo].[Post_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Post_Categories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Post_Categories] CHECK CONSTRAINT [FK_Post_Categories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Post_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Post_Categories_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Post_Categories] CHECK CONSTRAINT [FK_Post_Categories_Posts_PostId]
GO
ALTER TABLE [dbo].[Post_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tags_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Post_Tags] CHECK CONSTRAINT [FK_Post_Tags_Posts_PostId]
GO
ALTER TABLE [dbo].[Post_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post_Tags] CHECK CONSTRAINT [FK_Post_Tags_Tags_TagId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[UserUserCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUserCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUserCases] CHECK CONSTRAINT [FK_UserUserCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [Blog2] SET  READ_WRITE 
GO
