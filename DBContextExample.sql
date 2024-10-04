SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:          <Author,,Name>
-- Create date: <Create Date, ,>
-- Description:     <Description, ,>
-- =============================================
Create FUNCTION [dbo].[GetContextUser] ( )
RETURNS nvarchar(128)
AS
BEGIN
    declare @nvc nvarchar(128);
    set @nvc = convert(nvarchar(128),CONTEXT_INFO())
    set @nvc = LOWER((SELECT REPLACE(@nvc, nCHAR(0),
               '' COLLATE Latin1_General_100_BIN2)));
    RETURN @nvc
END