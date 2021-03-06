USE [master]
GO
/****** Object:  Database [videojuegos]    Script Date: 12/8/2021 11:43:37 PM ******/
CREATE DATABASE [videojuegos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Videojuegos', FILENAME = N'C:\SQLserver2017\database\videojuegos.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Videojuegos_log', FILENAME = N'C:\SQLserver2017\log\videojuegos_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [videojuegos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [videojuegos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [videojuegos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [videojuegos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [videojuegos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [videojuegos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [videojuegos] SET ARITHABORT OFF 
GO
ALTER DATABASE [videojuegos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [videojuegos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [videojuegos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [videojuegos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [videojuegos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [videojuegos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [videojuegos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [videojuegos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [videojuegos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [videojuegos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [videojuegos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [videojuegos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [videojuegos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [videojuegos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [videojuegos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [videojuegos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [videojuegos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [videojuegos] SET RECOVERY FULL 
GO
ALTER DATABASE [videojuegos] SET  MULTI_USER 
GO
ALTER DATABASE [videojuegos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [videojuegos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [videojuegos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [videojuegos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [videojuegos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'videojuegos', N'ON'
GO
ALTER DATABASE [videojuegos] SET QUERY_STORE = OFF
GO
USE [videojuegos]
GO
/****** Object:  User [uservideojuego]    Script Date: 12/8/2021 11:43:37 PM ******/
CREATE USER [uservideojuego] FOR LOGIN [uservideojuego] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [uservideojuego]
GO
ALTER ROLE [db_datareader] ADD MEMBER [uservideojuego]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [uservideojuego]
GO
/****** Object:  Table [dbo].[Desarrollador]    Script Date: 12/8/2021 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desarrollador](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Ciudad] [nvarchar](100) NOT NULL,
	[País] [nvarchar](100) NOT NULL,
	[AnioFundacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[metacritic_games]    Script Date: 12/8/2021 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metacritic_games](
	[game] [nvarchar](max) NOT NULL,
	[platform] [nvarchar](max) NOT NULL,
	[developer] [nvarchar](max) NULL,
	[genre] [nvarchar](max) NULL,
	[number_players] [nvarchar](max) NULL,
	[rating] [nvarchar](max) NULL,
	[release_date] [nvarchar](max) NOT NULL,
	[positive_critics] [nvarchar](max) NOT NULL,
	[neutral_critics] [nvarchar](max) NOT NULL,
	[negative_critics] [nvarchar](max) NOT NULL,
	[positive_users] [nvarchar](max) NOT NULL,
	[neutral_users] [nvarchar](max) NOT NULL,
	[negative_users] [nvarchar](max) NOT NULL,
	[metascore] [int] NOT NULL,
	[user_score] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plataforma]    Script Date: 12/8/2021 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plataforma](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Compania] [nvarchar](100) NULL,
	[FechaSalida] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PuntajeMetacritic]    Script Date: 12/8/2021 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntajeMetacritic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CriticasPositivas] [int] NULL,
	[CriticasNegativas] [int] NULL,
	[CriticasNeutrales] [int] NULL,
	[UsuariosPositivas] [int] NULL,
	[UsuariosNegativas] [int] NULL,
	[UsuariosNeutrales] [int] NULL,
	[PuntajeUsuarios] [int] NULL,
	[PuntajeMetacritic] [int] NULL,
	[Nombre] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 12/8/2021 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VentasJapon] [float] NULL,
	[VentasUnionEuropea] [float] NULL,
	[VentasNorteAmerica] [float] NULL,
	[OtrasVentas] [float] NULL,
	[VentasGlobales] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vgsales]    Script Date: 12/8/2021 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vgsales](
	[Rank] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Platform] [nvarchar](max) NOT NULL,
	[Year] [nvarchar](max) NULL,
	[Genre] [nvarchar](max) NOT NULL,
	[Publisher] [nvarchar](max) NOT NULL,
	[NA_Sales] [float] NOT NULL,
	[EU_Sales] [float] NOT NULL,
	[JP_Sales] [float] NOT NULL,
	[Other_Sales] [float] NOT NULL,
	[Global_Sales] [float] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[videogames]    Script Date: 12/8/2021 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videogames](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[platform] [nvarchar](max) NOT NULL,
	[year_of_release] [int] NOT NULL,
	[genre] [nvarchar](max) NOT NULL,
	[publisher] [nvarchar](max) NOT NULL,
	[critic_score] [int] NULL,
	[critic_count] [int] NULL,
	[user_score] [nvarchar](max) NULL,
	[developer] [nvarchar](max) NULL,
	[rating] [nvarchar](max) NULL,
 CONSTRAINT [PK_videogames] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videojuego]    Script Date: 12/8/2021 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videojuego](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Genero] [nvarchar](100) NULL,
	[Clasificacion] [nvarchar](10) NULL,
	[AnioSalida] [int] NULL,
	[IDDesarrollador] [int] NULL,
	[IDVentas] [int] NULL,
	[IDPuntaje] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideojuegoPlataforma]    Script Date: 12/8/2021 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideojuegoPlataforma](
	[IDVideojuego] [int] NULL,
	[IDPlataforma] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PuntajeMetacritic] ADD  DEFAULT ((0)) FOR [CriticasPositivas]
GO
ALTER TABLE [dbo].[PuntajeMetacritic] ADD  DEFAULT ((0)) FOR [CriticasNegativas]
GO
ALTER TABLE [dbo].[PuntajeMetacritic] ADD  DEFAULT ((0)) FOR [CriticasNeutrales]
GO
ALTER TABLE [dbo].[PuntajeMetacritic] ADD  DEFAULT ((0)) FOR [UsuariosPositivas]
GO
ALTER TABLE [dbo].[PuntajeMetacritic] ADD  DEFAULT ((0)) FOR [UsuariosNegativas]
GO
ALTER TABLE [dbo].[PuntajeMetacritic] ADD  DEFAULT ((0)) FOR [UsuariosNeutrales]
GO
ALTER TABLE [dbo].[PuntajeMetacritic] ADD  DEFAULT ((0)) FOR [PuntajeUsuarios]
GO
ALTER TABLE [dbo].[PuntajeMetacritic] ADD  DEFAULT ((0)) FOR [PuntajeMetacritic]
GO
ALTER TABLE [dbo].[Ventas] ADD  DEFAULT ((0.0)) FOR [VentasJapon]
GO
ALTER TABLE [dbo].[Ventas] ADD  DEFAULT ((0.0)) FOR [VentasUnionEuropea]
GO
ALTER TABLE [dbo].[Ventas] ADD  DEFAULT ((0.0)) FOR [VentasNorteAmerica]
GO
ALTER TABLE [dbo].[Ventas] ADD  DEFAULT ((0.0)) FOR [OtrasVentas]
GO
ALTER TABLE [dbo].[Ventas] ADD  DEFAULT ((0.0)) FOR [VentasGlobales]
GO
ALTER TABLE [dbo].[Videojuego]  WITH CHECK ADD FOREIGN KEY([IDDesarrollador])
REFERENCES [dbo].[Desarrollador] ([ID])
GO
ALTER TABLE [dbo].[Videojuego]  WITH CHECK ADD FOREIGN KEY([IDPuntaje])
REFERENCES [dbo].[PuntajeMetacritic] ([ID])
GO
ALTER TABLE [dbo].[Videojuego]  WITH CHECK ADD FOREIGN KEY([IDVentas])
REFERENCES [dbo].[Ventas] ([ID])
GO
ALTER TABLE [dbo].[VideojuegoPlataforma]  WITH CHECK ADD FOREIGN KEY([IDPlataforma])
REFERENCES [dbo].[Plataforma] ([ID])
GO
ALTER TABLE [dbo].[VideojuegoPlataforma]  WITH CHECK ADD FOREIGN KEY([IDVideojuego])
REFERENCES [dbo].[Videojuego] ([ID])
GO
USE [master]
GO
ALTER DATABASE [videojuegos] SET  READ_WRITE 
GO
