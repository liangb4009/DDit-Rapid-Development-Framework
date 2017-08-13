EXEC sp_configure 'clr enabled' , '1'; 
RECONFIGURE;
GO

USE master  --这个数据库一定是master
if exists(select * from sys.syslogins where name = 'DDitSQLCLRLogin')
DROP LOGIN DDitSQLCLRLogin
GO
if exists(select * from sys.asymmetric_keys where name = 'DDitSQLCLRKey')
DROP ASYMMETRIC KEY DDitSQLCLRKey
GO
--创建非对称密钥
CREATE ASYMMETRIC KEY DDitSQLCLRKey FROM EXECUTABLE FILE = 'D:\DDitSQLCLR\DDit.OSISoft.SQLCLR.dll'   
--创建登录名
CREATE LOGIN DDitSQLCLRLogin FROM ASYMMETRIC KEY DDitSQLCLRKey 
--把权限授予给该登录名  
GRANT EXTERNAL ACCESS ASSEMBLY TO DDitSQLCLRLogin;
GO


if exists(select * from sysobjects where name = 'GetEF') drop function GetEF
GO
if exists(select * from sys.assemblies where name = 'DDitSQLCLR') drop assembly DDitSQLCLR
go
create assembly DDitSQLCLR from 'D:\DDitSQLCLR\DDit.OSISoft.SQLCLR.dll' WITH PERMISSION_SET = EXTERNAL_ACCESS;
go

Create Function dbo.GetEF
(
    @sql nvarchar(max),
	@env nvarchar(max)
)
returns nvarchar(max)
as EXTERNAL NAME DDitSQLCLR.[DDit.OSISoft.SQLCLR.EF].GetEF
GO
print dbo.GetEF('delete from A_EF where Name = ''wobatch''','')
go
print dbo.GetEF('insert into A_EF(ID,Name,Params,UnitCode,SystemCode,ChineseName,EmployeeNumber,HostAddress,ParentId,HandleStatus,LastEditBy,LastEditDt) values(newid(),''wobatch'',''{"OrderNumber":"53753"}'',''000175'',''PIM'',''Marick'',''CN093128'',''127.0.0.1'',null, 0,''system'',getdate())','')
go

 --00000000-0000-0000-0000-000000000000