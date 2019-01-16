USE [master]
GO
/****** Object:  Database [ExcellentTasteDB]    Script Date: 15-Jan-19 14:04:17 ******/
CREATE DATABASE [ExcellentTasteDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExcellentTasteDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ExcellentTasteDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExcellentTasteDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ExcellentTasteDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ExcellentTasteDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExcellentTasteDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExcellentTasteDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExcellentTasteDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExcellentTasteDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExcellentTasteDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExcellentTasteDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ExcellentTasteDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExcellentTasteDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExcellentTasteDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExcellentTasteDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExcellentTasteDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExcellentTasteDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExcellentTasteDB] SET QUERY_STORE = OFF
GO
USE [ExcellentTasteDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ExcellentTasteDB]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bestelling]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bestelling](
	[bestellingId] [int] IDENTITY(1,1) NOT NULL,
	[reserveringId] [int] NOT NULL,
	[consumptieItemCode] [varchar](4) NOT NULL,
	[aantal] [int] NOT NULL,
	[dateTimeBereidingConsumptie] [datetime] NULL,
	[prijs] [money] NOT NULL,
 CONSTRAINT [PK_Bestelling] PRIMARY KEY CLUSTERED 
(
	[bestellingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consumptie]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumptie](
	[consumptieCode] [varchar](3) NOT NULL,
	[consumptieNaam] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Consumptie] PRIMARY KEY CLUSTERED 
(
	[consumptieCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsumptieGroep]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsumptieGroep](
	[consumptieGroepCode] [varchar](4) NOT NULL,
	[consumptieCode] [varchar](3) NOT NULL,
	[consumptieGroepNaam] [varchar](25) NOT NULL,
 CONSTRAINT [PK_SubConsumptie] PRIMARY KEY CLUSTERED 
(
	[consumptieGroepCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsumptieItem]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsumptieItem](
	[consumptieItemCode] [varchar](4) NOT NULL,
	[consumptieGroepCode] [varchar](4) NOT NULL,
	[consumptieItemNaam] [varchar](30) NOT NULL,
	[prijs] [money] NOT NULL,
 CONSTRAINT [PK_ConsumptieItem] PRIMARY KEY CLUSTERED 
(
	[consumptieItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klant]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klant](
	[klantId] [int] IDENTITY(1,1) NOT NULL,
	[klantNaam] [varchar](30) NOT NULL,
	[telefoon] [varchar](15) NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Klant] PRIMARY KEY CLUSTERED 
(
	[klantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservering]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservering](
	[reserveringId] [int] IDENTITY(1,1) NOT NULL,
	[klantId] [int] NOT NULL,
	[datum] [date] NOT NULL,
	[tijd] [time](7) NOT NULL,
	[tafel] [int] NOT NULL,
	[aantalPersonen] [int] NOT NULL,
	[status] [int] NULL,
	[datumToegevoegd] [datetime] NOT NULL,
	[bonDatum] [datetime] NULL,
	[betalingswijze] [varchar](2) NULL,
 CONSTRAINT [PK_Reservering] PRIMARY KEY CLUSTERED 
(
	[reserveringId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bestelling] ADD  CONSTRAINT [DF_Bestelling_datum]  DEFAULT (getdate()) FOR [dateTimeBereidingConsumptie]
GO
ALTER TABLE [dbo].[Reservering] ADD  CONSTRAINT [DF_Reservering_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Reservering] ADD  CONSTRAINT [DF_Reservering_datumToegevoegd]  DEFAULT (getdate()) FOR [datumToegevoegd]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Bestelling]  WITH CHECK ADD  CONSTRAINT [FK_Bestelling_ConsumptieItem] FOREIGN KEY([consumptieItemCode])
REFERENCES [dbo].[ConsumptieItem] ([consumptieItemCode])
GO
ALTER TABLE [dbo].[Bestelling] CHECK CONSTRAINT [FK_Bestelling_ConsumptieItem]
GO
ALTER TABLE [dbo].[Bestelling]  WITH CHECK ADD  CONSTRAINT [FK_Bestelling_Reservering] FOREIGN KEY([reserveringId])
REFERENCES [dbo].[Reservering] ([reserveringId])
GO
ALTER TABLE [dbo].[Bestelling] CHECK CONSTRAINT [FK_Bestelling_Reservering]
GO
ALTER TABLE [dbo].[ConsumptieGroep]  WITH CHECK ADD  CONSTRAINT [FK_SubConsumptie_Consumptie] FOREIGN KEY([consumptieCode])
REFERENCES [dbo].[Consumptie] ([consumptieCode])
GO
ALTER TABLE [dbo].[ConsumptieGroep] CHECK CONSTRAINT [FK_SubConsumptie_Consumptie]
GO
ALTER TABLE [dbo].[ConsumptieItem]  WITH CHECK ADD  CONSTRAINT [FK_ConsumptieItem_SubConsumptie] FOREIGN KEY([consumptieGroepCode])
REFERENCES [dbo].[ConsumptieGroep] ([consumptieGroepCode])
GO
ALTER TABLE [dbo].[ConsumptieItem] CHECK CONSTRAINT [FK_ConsumptieItem_SubConsumptie]
GO
ALTER TABLE [dbo].[Reservering]  WITH CHECK ADD  CONSTRAINT [FK_Reservering_Klant] FOREIGN KEY([klantId])
REFERENCES [dbo].[Klant] ([klantId])
GO
ALTER TABLE [dbo].[Reservering] CHECK CONSTRAINT [FK_Reservering_Klant]
GO
/****** Object:  StoredProcedure [dbo].[GET_TODAYS_RESERVATIONS]    Script Date: 15-Jan-19 14:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Marcel Roesink
-- Create date: 19-DEC-2018
-- Description:	Get todays reservations ordered by time
-- =============================================
CREATE PROCEDURE [dbo].[GET_TODAYS_RESERVATIONS]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT Klant.klantNaam,
		Klant.telefoon,
		Reservering.reserveringId,
		Reservering.status,
		Reservering.tijd,
		Reservering.tafel,
		Reservering.aantalPersonen,
		Reservering.datumToegevoegd
	FROM Reservering
	INNER JOIN Klant ON Reservering.klantId = Klant.klantId
	WHERE (
			Reservering.datum > GETDATE() - 1
			AND Reservering.datum < GETDATE()
			)
	ORDER BY Reservering.tijd
END
GO
USE [master]
GO
ALTER DATABASE [ExcellentTasteDB] SET  READ_WRITE 
GO

USE [ExcellentTasteDB]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'A', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'B', N'Bar')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'K', N'Kok')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'db0ecfef-6bd3-4199-968d-c99a1a9000b2', N'mroesink@rocvantwente.nl', 0, N'AEb60NF8+TRD34nTtzc3wGdxpC0+0mdnuH3y6V5Mj9E7aUYlf1IXRpbYy22rhBwcZQ==', N'ea5aff06-54d1-42f5-a7f8-92a9cb7bcd9c', NULL, 0, 0, NULL, 1, 0, N'mroesink@rocvantwente.nl')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e6121503-5c60-4a59-accb-b61e3691297c', N'karin@excellenttaste.nl', 0, N'AMKPMJaAoAZNRZKFxUu+20cDXxMlFVV84g0cE37xQtPhnmlKu5QRavoM9V79U/oMMA==', N'dcddc884-0efe-4cb9-b0ca-d5d24b454f36', NULL, 0, 0, NULL, 1, 0, N'karin@excellenttaste.nl')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f0001c5e-ea4d-4f03-a2ae-ba99ec1c63e9', N'joop@excellenttaste.nl', 0, N'ALZf3dJg4YU8VGe+FIz/b2n5E3URzHiezuTvOHlfTYMEUCw5dQQQ5CLfMyW55CXxSw==', N'9bdae087-8f2f-4643-9be7-13c5242bd514', NULL, 0, 0, NULL, 1, 0, N'joop@excellenttaste.nl')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f0d767f5-1c0c-45b2-8235-d27455d3624b', N'leo@excellenttaste.nl', 0, N'AM/hKeQ0KSY02xshARa1fIqzOiidy4MFdhp/6k+ohgrTd6TdpxKIqVe7Hv5Jsc5G9w==', N'4c704f79-0321-44b8-b26b-012f88307ccb', NULL, 0, 0, NULL, 1, 0, N'leo@excellenttaste.nl')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'db0ecfef-6bd3-4199-968d-c99a1a9000b2', N'A')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e6121503-5c60-4a59-accb-b61e3691297c', N'B')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f0001c5e-ea4d-4f03-a2ae-ba99ec1c63e9', N'K')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f0d767f5-1c0c-45b2-8235-d27455d3624b', N'A')
INSERT [dbo].[Consumptie] ([consumptieCode], [consumptieNaam]) VALUES (N'drk', N'Dranken')
INSERT [dbo].[Consumptie] ([consumptieCode], [consumptieNaam]) VALUES (N'hap', N'Hapjes')
INSERT [dbo].[Consumptie] ([consumptieCode], [consumptieNaam]) VALUES (N'hog', N'Hoofdgerechten')
INSERT [dbo].[Consumptie] ([consumptieCode], [consumptieNaam]) VALUES (N'nag', N'Nagerechten')
INSERT [dbo].[Consumptie] ([consumptieCode], [consumptieNaam]) VALUES (N'vog', N'Voorgerechten')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'bik', N'drk', N'Bier')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'fik', N'drk', N'Fris dranken')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'ijn', N'nag', N'Ijs')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'koh', N'hap', N'koude hapjes')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'kov', N'vog', N'Koude voorgerechten')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'mon', N'nag', N'Mousse')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'veh', N'hog', N'Vegetarische gerechten')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'vih', N'hog', N'Visgerechten')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'vlh', N'hog', N'Vleesgerechten')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'wah', N'hap', N'Warme hapjes')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'wav', N'vog', N'Warme voorgerechten')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'wdk', N'drk', N'Warme dranken')
INSERT [dbo].[ConsumptieGroep] ([consumptieGroepCode], [consumptieCode], [consumptieGroepNaam]) VALUES (N'wik', N'drk', N'Wijnen')
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'bi1', N'bik', N'Pilsner', 2.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'bi2', N'bik', N'Weizen', 3.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'bi3', N'bik', N'Stender', 2.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'bi4', N'bik', N'Palm', 3.6000)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'bi5', N'bik', N'Kasteel donker', 4.8500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'bi6', N'bik', N'Brugse Zot', 3.5500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'bi7', N'bik', N'Grimbergen dubbel', 3.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'fi1', N'fik', N'Tonic', 2.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'fi2', N'fik', N'Seven Up', 2.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'fi3', N'fik', N'Verse Jus', 3.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'fi4', N'fik', N'Chaudfontaine rood', 2.7500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'fi5', N'fik', N'Chaudfontaine blauw', 2.7500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'ij1', N'ijn', N'Black Lady', 4.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'ij2', N'ijn', N'Vruchtenijs', 2.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'ko1', N'koh', N'Portie kaas met mosterd', 4.0000)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'ko2', N'koh', N'Brood met kruidenboter', 5.0000)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'ko3', N'koh', N'Portie salami worst', 4.0000)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'kv1', N'kov', N'Salade met geitenkaas', 4.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'kv2', N'kov', N'Tonijnsalade', 5.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'kv3', N'kov', N'Zalmsalade', 5.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'mo1', N'mon', N'Chocolademousse', 4.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'mo2', N'mon', N'Vanillemousse', 3.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'pat2', N'vih', N'PILSJE', 12.0000)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'patt', N'bik', N'PILS', 23.0000)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N've1', N'veh', N'Bonengerecht met diverse groen', 11.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N've2', N'veh', N'Gebakken banana', 10.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'vi1', N'vih', N'Gebakken makreel', 8.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'vi2', N'vih', N'Mosselen uit pan', 9.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'vl1', N'vlh', N'Biefstuk in champignonsaus', 11.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'vl2', N'vlh', N'Wienerschnitzel', 9.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wa1', N'wah', N'Bitterballetjes met mosterd', 4.2500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wd1', N'wdk', N'Koffie', 2.5500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wd2', N'wdk', N'Thee', 2.4500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wd3', N'wdk', N'Chocolademelk', 2.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wd4', N'wdk', N'Espresso', 2.4500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wd5', N'wdk', N'Cappucino', 2.7500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wd6', N'wdk', N'Koffie verkeerd', 2.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wd7', N'wdk', N'Latte Macchiato', 3.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wi1', N'wik', N'Wijn per glas', 3.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wi2', N'wik', N'Wijn per fles', 17.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wi3', N'wik', N'Seizoenswijn', 3.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wi4', N'wik', N'Rode port', 3.6000)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wv1', N'wav', N'Tomatensoep', 4.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wv2', N'wav', N'Groentesoep', 3.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wv3', N'wav', N'Aspergesoep', 4.9500)
INSERT [dbo].[ConsumptieItem] ([consumptieItemCode], [consumptieGroepCode], [consumptieItemNaam], [prijs]) VALUES (N'wv4', N'wav', N'Uiensoep', 3.9500)
SET IDENTITY_INSERT [dbo].[Klant] ON 

INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (6, N'Mata Haari', N'0612345678', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (7, N'Yolante Snijders', N'0623456789', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (8, N'Jonny Jordaan', N'06345678912', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (9, N'Anton Geesink', N'0645678913', 0)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (10, N'Piet Mondiaan', N'0656789124', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (11, N'Jeroen Krabbe', N'0667891235', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (12, N'Jan Jansen', N'0667891234', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (13, N'Louis Couperes', N'0678912345', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (14, N'Linda de Mol', N'0689123456', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (15, N'Piet Hein', N'0691234567', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (16, N'Freddy Heineken', N'0611234567', 0)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (17, N'Willen Alexander', N'0611345678', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (18, N'Herman Brood', N'0611456789', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (19, N'Marietje Kwakman', N'0611567891', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (20, N'Truus Jansen', N'0612345432', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (21, N'Jaap', N'0654321', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (22, N'Jaap', N'054321', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (23, N'szsdfas', N'4545454', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (24, N'Bert van de Woord', N'06543212', 1)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (25, N'Marcel Roesink', N'0624567890', NULL)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (26, N'Boris Johnson', N'0041548675222', NULL)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (27, N'Boris Johnson', N'41548675633', NULL)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (28, N'Boris Johnson', N'0041548675674', NULL)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (29, N'De bruin', N'0049123456789', NULL)
INSERT [dbo].[Klant] ([klantId], [klantNaam], [telefoon], [status]) VALUES (30, N'De bruin', N'0049123456789', NULL)
SET IDENTITY_INSERT [dbo].[Klant] OFF
SET IDENTITY_INSERT [dbo].[Reservering] ON 

INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1, 6, CAST(N'2019-01-09' AS Date), CAST(N'17:00:00' AS Time), 1, 4, 0, CAST(N'2018-12-01T17:15:00.000' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (3, 7, CAST(N'2019-01-09' AS Date), CAST(N'17:15:00' AS Time), 2, 6, 0, CAST(N'2018-12-02T13:35:00.000' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (4, 8, CAST(N'2019-01-09' AS Date), CAST(N'17:20:00' AS Time), 3, 3, 0, CAST(N'2018-12-02T13:40:00.000' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (5, 9, CAST(N'2019-01-09' AS Date), CAST(N'17:30:00' AS Time), 4, 4, 0, CAST(N'2018-12-03T14:10:00.000' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (6, 10, CAST(N'2018-12-25' AS Date), CAST(N'17:35:00' AS Time), 5, 4, 0, CAST(N'2018-12-03T12:15:00.000' AS DateTime), CAST(N'2018-12-25T01:30:00.000' AS DateTime), N'cc')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (7, 11, CAST(N'2018-12-25' AS Date), CAST(N'17:40:00' AS Time), 6, 2, 0, CAST(N'2018-12-03T12:40:00.000' AS DateTime), CAST(N'2018-12-25T01:30:00.000' AS DateTime), N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (8, 12, CAST(N'2018-12-25' AS Date), CAST(N'17:45:00' AS Time), 7, 3, 1, CAST(N'2018-12-03T13:22:00.000' AS DateTime), CAST(N'2018-12-25T01:30:00.000' AS DateTime), N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (9, 13, CAST(N'2018-12-25' AS Date), CAST(N'18:00:00' AS Time), 8, 6, 1, CAST(N'2018-12-03T13:30:00.000' AS DateTime), CAST(N'2018-12-25T01:30:00.000' AS DateTime), N'cc')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (10, 14, CAST(N'2018-12-25' AS Date), CAST(N'18:15:00' AS Time), 9, 4, 1, CAST(N'2018-12-03T16:02:00.000' AS DateTime), CAST(N'2018-12-25T01:30:00.000' AS DateTime), N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (11, 15, CAST(N'2018-12-26' AS Date), CAST(N'15:00:00' AS Time), 1, 3, 1, CAST(N'2018-12-04T15:04:00.000' AS DateTime), CAST(N'2018-12-26T01:30:00.000' AS DateTime), N'kt')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (12, 16, CAST(N'2018-12-26' AS Date), CAST(N'17:00:00' AS Time), 1, 4, 1, CAST(N'2018-12-04T15:13:00.000' AS DateTime), CAST(N'2018-12-26T01:30:00.000' AS DateTime), N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (13, 17, CAST(N'2018-12-26' AS Date), CAST(N'17:00:00' AS Time), 2, 2, 1, CAST(N'2018-12-04T16:00:00.000' AS DateTime), CAST(N'2018-12-26T01:30:00.000' AS DateTime), N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (15, 18, CAST(N'2019-01-07' AS Date), CAST(N'17:15:00' AS Time), 3, 2, 0, CAST(N'2018-12-04T16:14:00.000' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (16, 19, CAST(N'2019-01-08' AS Date), CAST(N'11:20:00' AS Time), 4, 6, 0, CAST(N'2018-12-04T17:11:00.000' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (17, 9, CAST(N'2019-01-08' AS Date), CAST(N'12:15:00' AS Time), 3, 4, 0, CAST(N'2018-12-28T09:02:58.640' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (18, 10, CAST(N'2019-01-08' AS Date), CAST(N'21:00:00' AS Time), 5, 0, 0, CAST(N'2018-12-28T19:22:05.553' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (19, 16, CAST(N'2019-01-07' AS Date), CAST(N'18:00:00' AS Time), 5, 4, 0, CAST(N'2019-01-02T22:59:12.080' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (38, 6, CAST(N'2019-01-15' AS Date), CAST(N'17:00:00' AS Time), 1, 4, 0, CAST(N'2019-01-15T13:15:00.000' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1021, 18, CAST(N'2019-01-09' AS Date), CAST(N'15:00:00' AS Time), 4, 2, 0, CAST(N'2019-01-09T15:15:50.477' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1023, 6, CAST(N'2019-01-10' AS Date), CAST(N'21:00:00' AS Time), 3, 4, 0, CAST(N'2019-01-09T21:37:07.650' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1024, 16, CAST(N'2019-01-11' AS Date), CAST(N'19:00:00' AS Time), 5, 10, 1, CAST(N'2019-01-10T12:53:35.450' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1025, 12, CAST(N'2019-01-04' AS Date), CAST(N'12:00:00' AS Time), 4, 5, 1, CAST(N'2019-01-11T09:27:15.737' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1026, 23, CAST(N'2019-01-11' AS Date), CAST(N'19:00:00' AS Time), 2, 2, 0, CAST(N'2019-01-11T09:27:43.537' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1027, 15, CAST(N'2019-01-11' AS Date), CAST(N'08:00:00' AS Time), 3, 2, 1, CAST(N'2019-01-11T09:28:50.193' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1028, 14, CAST(N'2019-01-11' AS Date), CAST(N'23:00:00' AS Time), 3, 2, 0, CAST(N'2019-01-11T09:30:21.367' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1029, 23, CAST(N'2019-01-12' AS Date), CAST(N'19:00:00' AS Time), 2, 2, 0, CAST(N'2019-01-11T09:47:25.820' AS DateTime), NULL, N'pi')
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1030, 18, CAST(N'2019-01-11' AS Date), CAST(N'15:00:00' AS Time), 9, 2, 1, CAST(N'2019-01-11T16:20:17.647' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1031, 24, CAST(N'2019-01-14' AS Date), CAST(N'20:00:00' AS Time), -1, -5, -1, CAST(N'2019-01-14T18:00:35.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1032, 9, CAST(N'2019-01-14' AS Date), CAST(N'17:00:00' AS Time), 6, 5, 1, CAST(N'2019-01-14T18:07:16.073' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1034, 12, CAST(N'2019-03-31' AS Date), CAST(N'20:00:00' AS Time), -3, -8, 1, CAST(N'2019-01-15T11:48:26.297' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1036, 13, CAST(N'2019-01-16' AS Date), CAST(N'20:00:00' AS Time), -3, -5, 1, CAST(N'2019-01-15T12:02:31.853' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1037, 9, CAST(N'2011-03-31' AS Date), CAST(N'20:00:00' AS Time), 3, 11, 1, CAST(N'2019-01-15T12:22:47.763' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1038, 8, CAST(N'2019-01-15' AS Date), CAST(N'12:00:00' AS Time), 3, 4, 1, CAST(N'2019-01-15T13:27:32.010' AS DateTime), NULL, NULL)
INSERT [dbo].[Reservering] ([reserveringId], [klantId], [datum], [tijd], [tafel], [aantalPersonen], [status], [datumToegevoegd], [bonDatum], [betalingswijze]) VALUES (1039, 17, CAST(N'2019-01-15' AS Date), CAST(N'13:00:00' AS Time), 5, 3, 1, CAST(N'2019-01-15T13:28:12.567' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Reservering] OFF
SET IDENTITY_INSERT [dbo].[Bestelling] ON 

INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1038, 6, N'bi1', 2, CAST(N'2018-12-25T17:40:00.000' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1039, 6, N'bi6', 1, CAST(N'2018-12-25T17:40:00.000' AS DateTime), 3.5500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1040, 6, N'fi3', 1, CAST(N'2018-12-25T17:40:00.000' AS DateTime), 3.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1041, 6, N'vl2', 4, CAST(N'2018-12-25T18:10:00.000' AS DateTime), 9.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1042, 6, N'bi1', 2, CAST(N'2018-12-25T18:10:00.000' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1043, 6, N'fi1', 1, CAST(N'2018-12-25T18:10:00.000' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1044, 6, N'wd5', 4, CAST(N'2018-12-25T18:40:00.000' AS DateTime), 2.7500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1045, 7, N'bi1', 2, CAST(N'2018-12-25T17:45:00.000' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1046, 7, N'vl1', 2, CAST(N'2018-12-25T18:15:00.000' AS DateTime), 11.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1047, 7, N'ij2', 2, CAST(N'2018-12-25T18:55:00.000' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1048, 8, N'fi2', 3, CAST(N'2018-12-25T18:00:00.000' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1049, 8, N'kv3', 1, CAST(N'2018-12-25T18:20:00.000' AS DateTime), 5.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1050, 8, N'kv2', 2, CAST(N'2018-12-25T18:20:00.000' AS DateTime), 5.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1051, 8, N'vi1', 2, CAST(N'2018-12-25T19:02:00.000' AS DateTime), 8.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1052, 8, N'vi2', 1, CAST(N'2018-12-25T19:02:00.000' AS DateTime), 9.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1053, 8, N'ij1', 3, CAST(N'2018-12-25T19:32:00.000' AS DateTime), 4.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1054, 8, N'bi3', 1, CAST(N'2018-12-25T19:32:00.000' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1055, 8, N'wi1', 2, CAST(N'2018-12-25T19:32:00.000' AS DateTime), 3.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1056, 8, N'ij1', 3, CAST(N'2018-12-25T19:32:00.000' AS DateTime), 4.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1057, 8, N'wd1', 2, CAST(N'2018-12-25T19:32:00.000' AS DateTime), 2.5500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1058, 8, N'wd2', 2, NULL, 2.4500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1059, 19, N'bi1', 2, CAST(N'2019-01-07T20:48:24.277' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1060, 19, N'wi2', 1, CAST(N'2019-01-07T20:48:24.557' AS DateTime), 17.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1061, 16, N'wv3', 4, CAST(N'2019-01-08T20:32:29.277' AS DateTime), 4.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1062, 1021, N'vl1', 3, CAST(N'2019-01-09T15:17:10.780' AS DateTime), 11.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1063, 1021, N'wa1', 1, CAST(N'2019-01-09T15:17:12.187' AS DateTime), 4.2500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1064, 1021, N'wd6', 2, CAST(N'2019-01-09T15:25:24.557' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1065, 1021, N'wi2', 5, CAST(N'2019-01-09T15:25:20.883' AS DateTime), 17.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1066, 1021, N'bi5', 1, CAST(N'2019-01-09T15:25:23.570' AS DateTime), 4.8500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1067, 1021, N'wv3', 1, CAST(N'2019-01-09T19:52:07.547' AS DateTime), 4.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1068, 1021, N'wa1', 1, CAST(N'2019-01-09T19:52:08.397' AS DateTime), 4.2500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1069, 1021, N'wd3', 1, CAST(N'2019-01-09T19:51:59.050' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1070, 1021, N'wd3', 1, CAST(N'2019-01-09T19:52:00.083' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1071, 1021, N'bi7', 1, CAST(N'2019-01-09T19:52:00.843' AS DateTime), 3.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1072, 1021, N'wd5', 1, CAST(N'2019-01-09T19:52:01.597' AS DateTime), 2.7500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1073, 1021, N'ij1', 1, CAST(N'2019-01-09T19:52:09.113' AS DateTime), 4.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1074, 1021, N'ko2', 1, CAST(N'2019-01-09T19:52:09.863' AS DateTime), 5.0000)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1075, 1021, N'vl1', 4, CAST(N'2019-01-09T22:21:48.293' AS DateTime), 11.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1076, 1027, N'bi2', 1, CAST(N'2019-01-11T09:33:38.647' AS DateTime), 3.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1077, 1027, N'wd4', 1, CAST(N'2019-01-11T09:33:39.790' AS DateTime), 2.4500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1078, 1027, N'wd2', 2, CAST(N'2019-01-11T09:38:50.423' AS DateTime), 2.4500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1079, 1027, N'wd1', 2, NULL, 2.5500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1080, 1028, N'wv3', 4, CAST(N'2019-01-11T16:23:51.720' AS DateTime), 4.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1081, 1028, N'wd3', 1, CAST(N'2019-01-11T16:23:42.473' AS DateTime), 2.9500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1082, 1028, N'wd4', 1, CAST(N'2019-01-11T16:23:43.310' AS DateTime), 2.4500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1083, 1030, N'bi6', 10, CAST(N'2019-01-11T16:23:46.187' AS DateTime), 3.5500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1084, 1030, N'bi5', 5, CAST(N'2019-01-11T16:23:47.860' AS DateTime), 4.8500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1085, 1028, N'wd5', 1, CAST(N'2019-01-11T16:23:44.037' AS DateTime), 2.7500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1086, 1028, N'fi4', 1, CAST(N'2019-01-11T16:23:44.800' AS DateTime), 2.7500)
INSERT [dbo].[Bestelling] ([bestellingId], [reserveringId], [consumptieItemCode], [aantal], [dateTimeBereidingConsumptie], [prijs]) VALUES (1087, 1039, N've1', 11, NULL, 11.9500)
SET IDENTITY_INSERT [dbo].[Bestelling] OFF
