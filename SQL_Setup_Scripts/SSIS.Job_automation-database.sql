USE [master]
GO
/****** Object:  Database [db_app_support]    Script Date: 6/19/2024 4:06:15 PM ******/
CREATE DATABASE [db_app_support]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_app_support', FILENAME = N'G:\Data\db_app_support.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_app_support_log', FILENAME = N'H:\Log\db_app_support_log.ldf' , SIZE = 20480KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_app_support] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_app_support].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_app_support] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_app_support] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_app_support] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_app_support] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_app_support] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_app_support] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_app_support] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_app_support] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_app_support] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_app_support] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_app_support] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_app_support] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_app_support] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_app_support] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_app_support] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_app_support] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_app_support] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_app_support] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_app_support] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_app_support] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_app_support] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_app_support] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_app_support] SET RECOVERY FULL 
GO
ALTER DATABASE [db_app_support] SET  MULTI_USER 
GO
ALTER DATABASE [db_app_support] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_app_support] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_app_support] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_app_support] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [db_app_support] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_app_support] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_app_support', N'ON'
GO
ALTER DATABASE [db_app_support] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_app_support] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_app_support]
GO
/****** Object:  User [ICON-EU\IVRS_ADMIN_INDIA]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICON-EU\IVRS_ADMIN_INDIA] FOR LOGIN [ICON-EU\IVRS_ADMIN_INDIA]
GO
/****** Object:  User [ICONCR\svc_ssist_db004]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICONCR\svc_ssist_db004] FOR LOGIN [ICONCR\svc_ssist_db004] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ICONCR\sec_ssisp_APS]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICONCR\sec_ssisp_APS] FOR LOGIN [ICONCR\sec_ssisp_APS]
GO
/****** Object:  User [ICONCR\sec_flexadt_IRT-Validation-SQL-Access]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICONCR\sec_flexadt_IRT-Validation-SQL-Access] FOR LOGIN [ICONCR\sec_flexadt_IRT-Validation-SQL-Access]
GO
/****** Object:  User [ICONCR\narasimharaop_admin]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICONCR\narasimharaop_admin] FOR LOGIN [ICONCR\narasimharaop_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ICONCR\BenedictD1_admin]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICONCR\BenedictD1_admin] FOR LOGIN [ICONCR\BenedictD1_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ICONCR\BenedictD]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICONCR\BenedictD] FOR LOGIN [ICONCR\BenedictD] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ICON_US\LeDouxClayD]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICON_US\LeDouxClayD] FOR LOGIN [ICON_US\LeDouxClayD] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ICON_US\LassiterR]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICON_US\LassiterR] FOR LOGIN [ICON_US\LassiterR] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ICON_US\IVRS_ADMINS]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICON_US\IVRS_ADMINS] FOR LOGIN [ICON_US\IVRS_Admins]
GO
/****** Object:  User [ICON_US\DiazA]    Script Date: 6/19/2024 4:06:16 PM ******/
CREATE USER [ICON_US\DiazA] FOR LOGIN [ICON_US\DiazA] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ICON-EU\IVRS_ADMIN_INDIA]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ICONCR\svc_ssist_db004]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ICONCR\svc_ssist_db004]
GO
ALTER ROLE [db_owner] ADD MEMBER [ICONCR\sec_ssisp_APS]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ICONCR\sec_flexadt_IRT-Validation-SQL-Access]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ICONCR\sec_flexadt_IRT-Validation-SQL-Access]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ICONCR\narasimharaop_admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ICONCR\BenedictD1_admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ICONCR\BenedictD1_admin]
GO
ALTER ROLE [db_owner] ADD MEMBER [ICONCR\BenedictD]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ICON_US\LeDouxClayD]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ICON_US\LeDouxClayD]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ICON_US\LassiterR]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ICON_US\LassiterR]
GO
ALTER ROLE [db_owner] ADD MEMBER [ICON_US\IVRS_ADMINS]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [ICON_US\IVRS_ADMINS]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [ICON_US\IVRS_ADMINS]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ICON_US\IVRS_ADMINS]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ICON_US\IVRS_ADMINS]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ICON_US\IVRS_ADMINS]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ICON_US\DiazA]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ICON_US\DiazA]
GO
/****** Object:  Schema [automation]    Script Date: 6/19/2024 4:06:17 PM ******/
CREATE SCHEMA [automation]
GO
/****** Object:  Schema [ssis]    Script Date: 6/19/2024 4:06:17 PM ******/
CREATE SCHEMA [ssis]
GO
/****** Object:  Table [automation].[NLog]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [automation].[NLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MachineName] [nvarchar](200) NULL,
	[Logged] [datetime] NOT NULL,
	[Level] [varchar](5) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Logger] [nvarchar](300) NULL,
	[Properties] [nvarchar](max) NULL,
	[Callsite] [nvarchar](300) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [automation].[tbl_ssis_retry_log]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [automation].[tbl_ssis_retry_log](
	[uid] [int] IDENTITY(-2147483648,1) NOT NULL,
	[job_name] [nvarchar](128) NOT NULL,
	[instance_id] [int] NOT NULL,
 CONSTRAINT [PK_automation.tbl_ssis_retry_log] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NLog]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MachineName] [nvarchar](200) NULL,
	[Logged] [datetime] NOT NULL,
	[Level] [varchar](5) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Logger] [nvarchar](300) NULL,
	[Properties] [nvarchar](max) NULL,
	[Callsite] [nvarchar](300) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_manual_sql_jobs]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_manual_sql_jobs](
	[id] [int] IDENTITY(-2147483647,1) NOT NULL,
	[network_user] [nvarchar](150) NOT NULL,
	[sql_job] [nvarchar](250) NOT NULL,
	[execution_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_manual_sql_jobs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ssis].[failed_job_log]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ssis].[failed_job_log](
	[id] [int] IDENTITY(-2147483647,1) NOT NULL,
	[job_name] [varchar](200) NOT NULL,
	[run_date] [datetime] NOT NULL,
	[job_id] [varchar](100) NOT NULL,
	[step_id] [int] NULL,
	[instance_id] [int] NOT NULL,
	[completed] [bit] NOT NULL,
	[ticket] [varchar](50) NULL,
	[error_message] [varchar](max) NULL,
 CONSTRAINT [PK_failed_job_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ssis].[NLog]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ssis].[NLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MachineName] [nvarchar](200) NULL,
	[Logged] [datetime] NOT NULL,
	[Level] [varchar](5) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Logger] [nvarchar](300) NULL,
	[Properties] [nvarchar](max) NULL,
	[Callsite] [nvarchar](300) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ssis].[tbl_sql_job_retry]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ssis].[tbl_sql_job_retry](
	[id] [int] IDENTITY(-2147483647,1) NOT NULL,
	[sql_job] [nvarchar](250) NOT NULL,
	[execution_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_manual_sql_jobs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_manual_sql_jobs] ADD  CONSTRAINT [DF_tbl_manual_sql_jobs_execution_date]  DEFAULT (getdate()) FOR [execution_date]
GO
ALTER TABLE [ssis].[failed_job_log] ADD  CONSTRAINT [DF_ssis.failed_job_log_run_date]  DEFAULT (getdate()) FOR [run_date]
GO
ALTER TABLE [ssis].[tbl_sql_job_retry] ADD  CONSTRAINT [DF_tbl_sql_job_retry_execution_date]  DEFAULT (getdate()) FOR [execution_date]
GO
/****** Object:  StoredProcedure [dbo].[NLog_AddEntry_p]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NLog_AddEntry_p] (
  @machineName nvarchar(200),
  @logged datetime,
  @level varchar(5),
  @message nvarchar(max),
  @logger nvarchar(300),
  @properties nvarchar(max),
  @callsite nvarchar(300),
  @exception nvarchar(max)
) AS
BEGIN
  INSERT INTO [dbo].[NLog] (
    [MachineName],
    [Logged],
    [Level],
    [Message],
    [Logger],
    [Properties],
    [Callsite],
    [Exception]
  ) VALUES (
    @machineName,
    @logged,
    @level,
    @message,
    @logger,
    @properties,
    @callsite,
    @exception
  );
END

GO
/****** Object:  StoredProcedure [dbo].[usp_start_ssis_job]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Benedict
-- Create date: 21/AUG/2019
-- Description:	This sproc will record the user who kicked off the job manually and then start the job
-- =============================================
CREATE PROCEDURE [dbo].[usp_start_ssis_job] 
	-- Add the parameters for the stored procedure here
	(@NetworkUser varchar(250), 
	@jobname varchar(250))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Set @NetworkUser = ISNULL(@NetworkUser, '[null]')

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_manual_sql_jobs]
           ([network_user]
           ,[sql_job])
     VALUES
           (@NetworkUser,
           @jobname)


	execute msdb.dbo.sp_start_job @job_name=@jobname


END


GO
/****** Object:  StoredProcedure [dbo].[usp_WS_get_job_list]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Benedict
-- Create date: 2020 JAN 13
-- Description:	This sproc will get a list of jobs which can be manually executed
-- =============================================
CREATE PROCEDURE [dbo].[usp_WS_get_job_list] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sj.name AS job_name--, sj.enabled, 
--sjs.job_id, 
--LEFT (CAST(sjs.last_run_date AS VARCHAR), 4) + '-' + SUBSTRING(CAST(sjs.last_run_date AS VARCHAR), 5, 2) + '-' + SUBSTRING(CAST(sjs.last_run_date AS VARCHAR), 7, 2) AS converted_last_run_date, 
--CASE WHEN LEN(CAST(sjs.last_run_time AS VARCHAR)) = 6 THEN SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 1 , 2) + ':' + SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 3 , 2) + ':' + SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 5 , 2) WHEN LEN(CAST(sjs.last_run_time AS VARCHAR)) = 5 THEN '0' + SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 1 , 1) + ':' + SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 2 , 2) + ':' + SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 4 , 2) WHEN LEN(CAST(sjs.last_run_time AS VARCHAR)) = 4 THEN '00:' + SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 1 , 2) + ':' + SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 3 , 2) WHEN LEN(CAST(sjs.last_run_time AS VARCHAR)) = 3 THEN '00:' + '0' + SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 1 , 1) + ':' + SUBSTRING(CAST(sjs.last_run_time AS VARCHAR) , 2 , 2) WHEN LEN(CAST(sjs.last_run_time AS VARCHAR)) = 2 THEN '00:00:' + CAST(sjs.last_run_time AS VARCHAR) WHEN LEN(CAST(sjs.last_run_time AS VARCHAR)) = 1 THEN '00:00:' + '0' + CAST(sjs.last_run_time AS VARCHAR) END AS converted_last_run_time,
--[next_job_run] = (SELECT TOP 1 sja.next_scheduled_run_date FROM msdb.dbo.sysjobactivity sja WHERE sja.job_id= sj.job_id ORDER by sja.next_scheduled_run_date DESC)
FROM msdb.dbo.sysjobsteps AS sjs 
INNER JOIN msdb.dbo.sysjobs AS sj ON sj.job_id = sjs.job_id 
--INNER JOIN msdb.dbo.sysjobactivity sja ON sja.job_id = sj.job_id
WHERE (sjs.step_id = 1) AND (sj.category_id = (SELECT category_id FROM msdb.dbo.syscategories WHERE (name = 'ETL'))) AND sj.enabled = '1' 
ORDER BY job_name, sjs.step_id

END

GO
/****** Object:  StoredProcedure [ssis].[NLog_AddEntry_p]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ssis].[NLog_AddEntry_p] (
  @machineName nvarchar(200),
  @logged datetime,
  @level varchar(5),
  @message nvarchar(max),
  @logger nvarchar(300),
  @properties nvarchar(max),
  @callsite nvarchar(300),
  @exception nvarchar(max)
) AS
BEGIN
  INSERT INTO [ssis].[NLog] (
    [MachineName],
    [Logged],
    [Level],
    [Message],
    [Logger],
    [Properties],
    [Callsite],
    [Exception]
  ) VALUES (
    @machineName,
    @logged,
    @level,
    @message,
    @logger,
    @properties,
    @callsite,
    @exception
  );
END
GO
/****** Object:  StoredProcedure [ssis].[usp_get_multi_failed_jobs]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David Benedict
-- Create date: 19/APR/2021
-- Description:	This sproc will retrieve jobs that have failed a single time today
-- =============================================
CREATE PROCEDURE [ssis].[usp_get_multi_failed_jobs] 
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT [job_name]
      ,[job_id]
      --,[completed]
	  FROM [db_app_support].[ssis].[failed_job_log]
	  WHERE run_date > DATEADD(HOUR, -24,getdate())
	  AND [job_name] in (
	SELECT [job_name]
	  FROM [db_app_support].[ssis].[failed_job_log]
	  where [completed]=0)
	  group by job_name, job_id
	  HAVING COUNT(*) > 1
END

GO
/****** Object:  StoredProcedure [ssis].[usp_get_single_failed_jobs]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Benedict
-- Create date: 16/APR/2021
-- Description:	This sproc will retrieve jobs that have failed a single time today
-- =============================================
CREATE PROCEDURE [ssis].[usp_get_single_failed_jobs] 
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT [job_name]
      ,[job_id]
      ,[completed]
	  FROM [db_app_support].[ssis].[failed_job_log]
	  where [completed]=0
	  group by job_name, job_id, completed
	  HAVING COUNT(*) = 1
END

GO
/****** Object:  StoredProcedure [ssis].[usp_get_stuck_jobs]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David Benedict
-- Create date: 04/MAY/2021
-- Description:	This sproc will retrieve jobs that are stuck
-- =============================================
CREATE PROCEDURE [ssis].[usp_get_stuck_jobs] 
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ja.job_id,
		j.name AS job_name,
		ja.start_execution_date,      
		ISNULL(last_executed_step_id,0)+1 AS current_executed_step_id,
		Js.step_name
	FROM msdb.dbo.sysjobactivity ja 
	LEFT JOIN msdb.dbo.sysjobhistory jh 
		ON ja.job_history_id = jh.instance_id
	JOIN msdb.dbo.sysjobs j 
		ON ja.job_id = j.job_id
	JOIN msdb.dbo.sysjobsteps js
		ON ja.job_id = js.job_id
		AND ISNULL(ja.last_executed_step_id,0)+1 = js.step_id
	WHERE ja.session_id = (SELECT TOP 1 session_id FROM msdb.dbo.syssessions ORDER BY session_id DESC)
	AND start_execution_date is not null
	AND stop_execution_date is null
	AND getdate() > DATEADD(HOUR,6, start_execution_date )
END

GO
/****** Object:  StoredProcedure [ssis].[usp_insert_all_failed_jobs]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David Benedict
-- Create date: 19/APR/2021
-- Description:	This sproc will retrieve jobs that have failed a single time today
-- =============================================
CREATE PROCEDURE [ssis].[usp_insert_all_failed_jobs] 
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [db_app_support].[ssis].[failed_job_log]
           ([job_name]
           ,[run_date]
           ,[job_id]
		   ,[step_id]
           ,[instance_id]
		   ,[completed]
		   ,[error_message])
	--SELECT name, MSDB.dbo.agent_datetime(h.run_date, h.run_time) [run_date], j.job_id, instance_id, 0 [completed], h.message-- , *                     
	--FROM      msdb.dbo.sysJobHistory h, msdb.dbo.sysJobs j                      
	--WHERE     h.run_Status=0 and j.job_id = h.job_id 
	--AND MSDB.dbo.agent_datetime(h.run_date, h.run_time) > (GETDATE()-1)
	--AND STEP_ID = 0
	--AND instance_id not in (select instance_id from [db_app_support].[ssis].[failed_job_log])
	 SELECT A.* FROM (
	 SELECT j.name as job_name
    ,MSDB.dbo.agent_datetime(jh.run_date,jh.run_time) as [run_date]
	,j.job_id
	,js.step_id as job_step
	,jh.instance_id
	,0 [completed]
	,jh.message as error_message
    FROM msdb.dbo.sysjobs AS j
    INNER JOIN msdb.dbo.sysjobsteps AS js ON js.job_id = j.job_id
    INNER JOIN msdb.dbo.sysjobhistory AS jh ON jh.job_id = j.job_id AND jh.step_id = js.step_id
    WHERE jh.run_status = 0 AND MSDB.dbo.agent_datetime(jh.run_date,jh.run_time) >= GETDATE()-1
	--AND jh.instance_id not in (select instance_id from [db_app_support].[ssis].[failed_job_log])
    ) A LEFT JOIN [db_app_support].[ssis].[failed_job_log] fjl on fjl.job_name=a.job_name AND fjl.instance_id=A.instance_id
	WHERE fjl.job_name is null


END

GO
/****** Object:  StoredProcedure [ssis].[usp_mark_failed_jobs_complete]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David Benedict
-- Create date: 20/APR/2021
-- Description:	This sproc will retrieve jobs that have failed a single time today
-- =============================================
CREATE PROCEDURE [ssis].[usp_mark_failed_jobs_complete] 
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [db_app_support].[ssis].failed_job_log
	SET [completed]= 1
	WHERE [completed]=0
END

GO
/****** Object:  StoredProcedure [ssis].[usp_set_failed_jobs_complete]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David Benedict
-- Create date: 19/APR/2021
-- Description:	This sproc will retrieve jobs that have failed a single time today
-- =============================================
CREATE PROCEDURE [ssis].[usp_set_failed_jobs_complete] 
	-- Add the parameters for the stored procedure here
	@jobname varchar(300),
	@SNTicket varchar(50)
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [db_app_support].[ssis].[failed_job_log]
	SET [completed]=1, [ticket]=@SNTicket
	where [completed]= 0 AND job_name=@jobname

END

GO
/****** Object:  StoredProcedure [ssis].[usp_start_ssis_job]    Script Date: 6/19/2024 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David Benedict
-- Create date: 20/APR/2021
-- Description:	This sproc will record the the job and the start date
-- =============================================
CREATE PROCEDURE [ssis].[usp_start_ssis_job] 
	-- Add the parameters for the stored procedure here
	(@jobname varchar(250))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- Insert statements for procedure here
	INSERT INTO [ssis].[tbl_sql_job_retry]
           ([sql_job])
     VALUES
           (@jobname)


	execute msdb.dbo.sp_start_job @job_name=@jobname


END


GO
USE [master]
GO
ALTER DATABASE [db_app_support] SET  READ_WRITE 
GO
