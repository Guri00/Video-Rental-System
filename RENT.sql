USE [master]
GO
/****** Object:  Database [RENT]    Script Date: 10/12/2019 11:30:40 PM ******/
CREATE DATABASE [RENT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RENT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RENT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RENT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RENT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RENT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [RENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RENT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RENT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RENT] SET  MULTI_USER 
GO
ALTER DATABASE [RENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RENT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RENT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RENT] SET QUERY_STORE = OFF
GO
USE [RENT]
GO
/****** Object:  Table [dbo].[Coustmer]    Script Date: 10/12/2019 11:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coustmer](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](10) NULL,
	[LastName] [nchar](10) NULL,
	[Address] [nchar](20) NULL,
	[Phone] [nchar](12) NULL,
 CONSTRAINT [PK_Coustmer] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 10/12/2019 11:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [nchar](3) NULL,
	[Title] [nchar](20) NULL,
	[Year] [nchar](5) NULL,
	[Rental_Cost] [money] NULL,
	[Plot] [ntext] NULL,
	[Genre] [nchar](10) NULL,
	[copies] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentedMovies]    Script Date: 10/12/2019 11:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentedMovies](
	[RMID] [int] IDENTITY(1,1) NOT NULL,
	[MovieIDFK] [int] NULL,
	[CustIDFK] [int] NULL,
	[DateRented] [datetime] NULL,
	[DateReturned] [datetime] NULL,
	[Rented] [int] NOT NULL,
 CONSTRAINT [PK_RentedMovies] PRIMARY KEY CLUSTERED 
(
	[RMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Coustmer] ON 

INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (2007, N'Johon     ', N'morris    ', N'10 kent road        ', N'9882783827  ')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (2015, N'Jon       ', N'Sinq      ', N'harr papa           ', N'7412589631  ')
SET IDENTITY_INSERT [dbo].[Coustmer] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (9, N'5  ', N'Inception           ', N'2012 ', 2.0000, N'Space', N'Scfic     ', 10)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (11, N'4  ', N'Spider Man 1        ', N'2010 ', 2.0000, N'Web', N'Hero      ', 5)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (12, N'5  ', N'drang me to hell    ', N'2017 ', 5.0000, N'demon', N'horror    ', 16)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (13, N'5  ', N'drak night          ', N'2012 ', 2.0000, N'batman', N'2         ', 10)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (14, N'5  ', N'suicide squad       ', N'2017 ', 5.0000, N'hero', N'scfic     ', 15)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (15, N'5  ', N'godfather           ', N'2015 ', 5.0000, N'horor', N'sc-fic    ', 15)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (16, N'5  ', N'wrong turn          ', N'2013 ', 5.0000, N'horor', N'horor     ', 17)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (17, N'5  ', N'fast and furios     ', N'2012 ', 2.0000, N'cars', N'racing    ', 7)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (18, N'3  ', N'Project X           ', N'2012 ', 2.0000, N'party', N'real      ', 15)
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[RentedMovies] ON 

INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (23, 13, 2007, CAST(N'2019-12-10T23:25:19.440' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[RentedMovies] OFF
ALTER TABLE [dbo].[RentedMovies] ADD  CONSTRAINT [DF_RentedMovies_isout]  DEFAULT ((0)) FOR [Rented]
GO
USE [master]
GO
ALTER DATABASE [RENT] SET  READ_WRITE 
GO
