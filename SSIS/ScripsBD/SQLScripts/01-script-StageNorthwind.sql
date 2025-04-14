USE [master]
GO
/****** Object:  Database [StageNorthwind]    Script Date: 28/03/2025 02:36:03 p. m. ******/
CREATE DATABASE [StageNorthwind]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StageNorthwind', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.ADRIAN\MSSQL\DATA\StageNorthwind.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StageNorthwind_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.ADRIAN\MSSQL\DATA\StageNorthwind_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StageNorthwind] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StageNorthwind].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StageNorthwind] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StageNorthwind] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StageNorthwind] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StageNorthwind] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StageNorthwind] SET ARITHABORT OFF 
GO
ALTER DATABASE [StageNorthwind] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StageNorthwind] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StageNorthwind] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StageNorthwind] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StageNorthwind] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StageNorthwind] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StageNorthwind] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StageNorthwind] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StageNorthwind] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StageNorthwind] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StageNorthwind] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StageNorthwind] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StageNorthwind] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StageNorthwind] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StageNorthwind] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StageNorthwind] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StageNorthwind] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StageNorthwind] SET RECOVERY FULL 
GO
ALTER DATABASE [StageNorthwind] SET  MULTI_USER 
GO
ALTER DATABASE [StageNorthwind] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StageNorthwind] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StageNorthwind] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StageNorthwind] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StageNorthwind] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StageNorthwind] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StageNorthwind', N'ON'
GO
ALTER DATABASE [StageNorthwind] SET QUERY_STORE = ON
GO
ALTER DATABASE [StageNorthwind] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StageNorthwind]
GO
/****** Object:  Table [dbo].[Stage_Categoria]    Script Date: 28/03/2025 02:36:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Categoria](
	[Categoria_Codigo] [int] NOT NULL,
	[Categoria_Nombre] [varchar](15) NOT NULL,
	[ETLoad] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stage_Cliente]    Script Date: 28/03/2025 02:36:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Cliente](
	[Cliente_Codigo] [char](5) NOT NULL,
	[Cliente_Nombre] [varchar](40) NOT NULL,
	[Cliente_Compania] [varchar](40) NOT NULL,
	[Cliente_Direccion] [varchar](60) NOT NULL,
	[Cliente_Ciudad] [varchar](15) NOT NULL,
	[Cliente_Region] [varchar](15) NOT NULL,
	[Cliente_Pais] [varchar](15) NOT NULL,
	[Cliente_Postal] [varchar](10) NOT NULL,
	[ETLLoad] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stage_Producto]    Script Date: 28/03/2025 02:36:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Producto](
	[Producto_Codigo] [int] NOT NULL,
	[Producto_Nombre] [varchar](50) NOT NULL,
	[Producto_PUsuario] [decimal](15, 2) NOT NULL,
	[CategoriaProducto_Codigo] [int] NOT NULL,
	[ETLLoad] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stage_Tiempo]    Script Date: 28/03/2025 02:36:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Tiempo](
	[Tiempo_Skey] [int] IDENTITY(1,1) NOT NULL,
	[Tiempo_FechaActual] [datetime] NOT NULL,
	[Tiempo_Ano] [int] NOT NULL,
	[Tiempo_Trimestre] [int] NOT NULL,
	[Tiempo_Mes] [int] NOT NULL,
	[Tiempo_Semana] [int] NOT NULL,
	[Tiempo_DiaDeAno] [int] NOT NULL,
	[Tiempo_DiaDeMes] [int] NOT NULL,
	[TiempoDiaDeSemana] [int] NOT NULL,
 CONSTRAINT [PK_Stage_Tiempo] PRIMARY KEY CLUSTERED 
(
	[Tiempo_Skey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stage_Ventas]    Script Date: 28/03/2025 02:36:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Ventas](
	[Cliente_Codigo] [char](5) NOT NULL,
	[Empleado_Codigo] [int] NOT NULL,
	[Producto_Codigo] [int] NOT NULL,
	[Ventas_OrderDate] [datetime] NOT NULL,
	[Ventas_NOrden] [int] NOT NULL,
	[Ventas_Monto] [decimal](15, 2) NOT NULL,
	[Ventas_Unidades] [int] NOT NULL,
	[Ventas_PrecioUnitario] [decimal](15, 2) NOT NULL,
	[Ventas_Descuento] [decimal](15, 2) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO

CREATE TABLE [dbo].[Stage_Empleado](
	[EmployeeID] [int] NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[FirstName] [varchar](10) NOT NULL,
	[Title] [varchar](30) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [varchar](60) NULL,
	[City] [varchar](15) NULL,
	[Region] [varchar](15) NULL,
	[PostalCode] [varchar](10) NULL,
	[Country] [nvarchar](15) NULL
)
ALTER DATABASE [StageNorthwind] SET  READ_WRITE 
GO