DECLARE @username varchar(150)
SET @username = 'ICONCR\svc_ssisp_db002'

use [db_app_support]
GO
GRANT EXECUTE ON SCHEMA::[ssis] TO [@username]
GO
use [db_app_support]
GO
GRANT EXECUTE ON SCHEMA::[dbo] TO [@username]
GO

USE [db_app_support]
GO
ALTER ROLE [db_datareader] ADD MEMBER [@username]
GO

USE [db_app_support]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [@username]
GO
