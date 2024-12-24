USE [K2Applications]
GO

/****** Object:  StoredProcedure [HRRequests].[HTMLConversation]    Script Date: 12/24/2024 5:55:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [HRRequests].[HTMLConversation] 
	-- Add the parameters for the stored procedure here
	@RequestID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @HTML NVARCHAR(Max) = '';
    DECLARE @innerHTML NVARCHAR(Max) = '';


	SELECT @innerHTML = (
	SELECT 
	CASE
		WHEN FromHR =1 
			THEN '<div class="message from-hr">' + ResponseDetails + '</div>'
			ELSE '<div class="from-user-container"><div class="message from-user">' + ResponseDetails + '</div></div>'
			END
	FROM [HRRequests].[Responses]
	WHERE RequestID = @RequestID
	ORDER BY ResponseDate
	FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)');

	SET @HTML = '<div class="conversation">' + @innerHTML + '</div>';

	SELECT @HTML as HtmlConversation
END
GO


