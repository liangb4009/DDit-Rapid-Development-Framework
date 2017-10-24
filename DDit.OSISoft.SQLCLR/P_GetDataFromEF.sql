USE MESEFORMReport
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marick
-- Create date: 2017-10-23
-- Description:	Get Data From EF
-- P_GetDateFromEF
-- =============================================
alter PROCEDURE dbo.P_GetDateFromEF 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXEC master.dbo.QueryEF @name = N'VPlantOverAllForNu',
	                        @env = N'Dev'
	
END
GO
