USE [master]
GO
/****** Object:  Database [CountryCityManagementSystemDB]    Script Date: 27-10-16 04.13.07 ******/
CREATE DATABASE [CountryCityManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryCityManagementSystemDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CountryCityManagementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryCityManagementSystemDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CountryCityManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryCityManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryCityManagementSystemDB]
GO
/****** Object:  Table [dbo].[City]    Script Date: 27-10-16 04.13.08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[cityName] [varchar](20) NOT NULL,
	[about] [text] NULL,
	[noOfDwellers] [int] NULL,
	[location] [varchar](20) NULL,
	[weather] [text] NULL,
	[countryId] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 27-10-16 04.13.08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[countryId] [int] IDENTITY(1,1) NOT NULL,
	[countryName] [varchar](10) NOT NULL,
	[about] [text] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewAllCityWithCountry]    Script Date: 27-10-16 04.13.08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAllCityWithCountry]
AS
SELECT p.cityId,p.cityName,p.about as cityAbout,p.noOfDwellers,p.location
,p.weather,p.countryId as countryId,c.countryName,c.about as countryAbout
From city p INNER JOIN Country c ON
p.countryId=c.countryId


GO
/****** Object:  View [dbo].[ViewAllCountryInformation]    Script Date: 27-10-16 04.13.08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ViewAllCountryInformation]

as select Country.countryId, countryName, Country.about, isnull(totalCities,0) "Total City", isnull(totalDwelers,0) "Total Dwellers"
from Country
full outer join

(select b.countryId,COUNT(b.cityId) as totalCities,SUM(b.noOfDwellers) as totalDwelers
from City b,Country a
where b.countryId=a.countryId
group by b.countryId) c
on Country.countryId=c.countryId

GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([cityId], [cityName], [about], [noOfDwellers], [location], [weather], [countryId]) VALUES (1, N'Dhaka', N'<p>nice</p>', 20000, N'dhaka', N'normal', 1)
INSERT [dbo].[City] ([cityId], [cityName], [about], [noOfDwellers], [location], [weather], [countryId]) VALUES (2, N'Pabna', N'<p>nice too</p>', 40000, N'pabna', N'normal', 1)
INSERT [dbo].[City] ([cityId], [cityName], [about], [noOfDwellers], [location], [weather], [countryId]) VALUES (11, N'London', N'<p>good</p>', 4000, N'en', N'cool', 2)
INSERT [dbo].[City] ([cityId], [cityName], [about], [noOfDwellers], [location], [weather], [countryId]) VALUES (13, N'jj', N'<p>jj</p>', 5555, N'jj', N'jj', 2)
INSERT [dbo].[City] ([cityId], [cityName], [about], [noOfDwellers], [location], [weather], [countryId]) VALUES (14, N'htht', N'<p>jj</p>', 5555, N'jj', N'jj', 32)
INSERT [dbo].[City] ([cityId], [cityName], [about], [noOfDwellers], [location], [weather], [countryId]) VALUES (15, N'CityOfArgentina', N'<p>nice</p>', 2000, N'ss', N'Normal', 33)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (1, N'Bangladesh', N'<p>Beautiful Country</p>')
INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (2, N'India', N'<p>Large Country</p>')
INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (3, N'China', N'<p>Large&nbsp;Population</p>')
INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (4, N'Japan', N'<p>Advance country</p>')
INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (5, N'USA', N'<p><strong>america</strong></p>')
INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (6, N'Australia', N'<p>good</p>')
INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (7, N'Nepal', N'<p>Cold</p>')
INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (8, N'Brazil', N'<p>football</p>')
INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (32, N'England', N'<p>Advance</p>')
INSERT [dbo].[Country] ([countryId], [countryName], [about]) VALUES (33, N'Argentina', N'<p><strong>football</strong></p>')
SET IDENTITY_INSERT [dbo].[Country] OFF
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([countryId])
REFERENCES [dbo].[Country] ([countryId])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
USE [master]
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET  READ_WRITE 
GO
