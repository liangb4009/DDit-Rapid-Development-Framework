USE DDit
GO

IF EXISTS(select * from sysobjects where name = 'sp_addextendedproperty_v2')
BEGIN
	DROP PROC sp_addextendedproperty_v2
END
go
-- =============================================
-- Author:		Marick
-- Create date: 2016-08-04
-- Description:	Create Extend Property With One Sql Statement
-- =============================================
CREATE PROCEDURE [dbo].[sp_addextendedproperty_v2] 
	@Description sql_variant			= NULL,
	@TableName	sysname			= NULL,
	@ColumnName	sysname			= NULL
AS
BEGIN
	DECLARE @database VARCHAR(20)
	SET @database = 'DDit'

	DECLARE @schema VARCHAR(20)
	SELECT @schema = sch.name
	FROM SYS.sysobjects obj
	JOIN SYS.schemas sch
	ON obj.uid = sch.schema_id
	WHERE obj.name = @TableName

	DECLARE @FullTableName VARCHAR(256)
	SELECT @FullTableName = @database + '.' + @schema + '.' + @TableName

	if exists(
	select *
	from sys.extended_properties A
	inner join sys.columns B
	on A.major_id = B.object_id
	and A.minor_id = B.column_id
	WHERE A.major_id = object_id(@FullTableName)
	AND B.name = @ColumnName
	)
	begin
		EXEC sp_updateextendedproperty 'MS_DESCRIPTION', @Description, 'schema', @schema, 'table', @TableName, 'column', @ColumnName
	end
	else
	begin
		EXEC sp_addextendedproperty 'MS_DESCRIPTION', @Description, 'schema', @schema, 'table', @TableName, 'column', @ColumnName
	end
END
GO

IF EXISTS(select * from sysobjects where name = 'sp_addextendedproperty_v3')
BEGIN
	DROP PROC sp_addextendedproperty_v3
END
go
-- =============================================
-- Author:		Wilson
-- Create date: 2016-08-04
-- Description:	Create Table Extend Property 
-- =============================================
CREATE PROCEDURE [dbo].[sp_addextendedproperty_v3] 
	@TableName	sysname			= NULL,
	@Description sql_variant			= NULL
AS
BEGIN
	DECLARE @schema VARCHAR(20)
	SELECT @schema = sch.name
	FROM SYS.sysobjects obj
	JOIN SYS.schemas sch
	ON obj.uid = sch.schema_id
	WHERE obj.name = @TableName

	if exists(
		SELECT * FROM SYS.extended_properties DS 
		INNER JOIN SYSOBJECTS TBS ON DS.major_id=TBS.ID 
		WHERE DS.minor_id=0 AND TBS.name=@TableName
	)
	begin
		EXEC sp_updateextendedproperty 'MS_DESCRIPTION', @Description, 'schema', @schema, 'table', @TableName
	end
	else
	begin
		EXEC sp_addextendedproperty 'MS_DESCRIPTION', @Description, 'schema', @schema, 'table', @TableName
	end
END

GO

declare @TableName varchar(200)
declare cur_t cursor for

select name from sysobjects where xtype='u' --AND name='MSTB_DPS_DETAIL'

open cur_t --循环表
	fetch next from cur_t into @TableName
	while @@FETCH_STATUS = 0
	begin
		print '-- Table:'+@TableName
		print '-- Add Table Desc'

		declare @sql varchar(1000)='',@TableDesc varchar(100)=''

		SELECT @TableDesc=CONVERT(VARCHAR(100),DS.VALUE) FROM SYS.extended_properties DS 
			INNER JOIN SYSOBJECTS TBS ON DS.major_id=TBS.ID 
			WHERE DS.minor_id=0 AND TBS.name=@TableName--表名
		set @sql='EXEC [dbo].[sp_addextendedproperty_v3] '''+@TableName+''','''+isnull(@TableDesc,'')+''''
		print @sql
		print '-- Add Column Desc'

			declare @ColumnName varchar(100),@ColumnDesc varchar(100)--,@TableName varchar(100)='MSTB_DPS_DETAIL'
			declare cur_t2 cursor for

			SELECT col.name as ColumnName,Convert(varchar(100),ep.[value]) AS ColumnDesc FROM     dbo.syscolumns col 
			INNER JOIN dbo.sysobjects obj ON col.id = obj.id AND obj.xtype = 'U' AND obj.status >= 0
			LEFT  JOIN sys.extended_properties ep ON col.id = ep.major_id
						AND col.colid = ep.minor_id AND ep.name = 'MS_Description'
						WHERE   obj.name = @TableName--表名

			open cur_t2  --循环列
				fetch next from cur_t2 into @ColumnName,@ColumnDesc
				while @@FETCH_STATUS = 0
				begin
		
					declare @sql2 varchar(1000)=''--,@TableDesc varchar(100)=''

					set @sql2='EXEC [dbo].[sp_addextendedproperty_v2] '''+isnull(@ColumnDesc,'')+''','''+@TableName+''','''+@ColumnName+''''
					print @sql2
					fetch next from cur_t2 into @ColumnName,@ColumnDesc
				end
			close cur_t2
			deallocate cur_t2

			print '-- End Table:'+@TableName 
	  fetch next from cur_t into @TableName
	end
close cur_t
deallocate cur_t
