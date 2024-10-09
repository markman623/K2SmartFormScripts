--  See youtube video located at
-- Nintex KB article - https://help.nintex.com/en-US/k2five/userguide/current/Content/ServiceBrokers/SQLServer/SQL-Server-Service.htm#DBContextInfo



-- Setting and Getting the ContextInfo as string
SET CONTEXT_INFO 0x1454;  
GO  
SELECT CONTEXT_INFO();  
GO

-- Settting the ContextInfo with Binary
DECLARE @username NVARCHAR(128) = 'K2:DENNALIX\Bob'
DECLARE @bin VARBINARY(128) = CAST(@username AS VARBINARY(128)); 
SET CONTEXT_INFO @bin;


-- Getting and decoding the ContextInfo
DECLARE @nvc NVARCHAR(128) = convert(NVARCHAR(128),CONTEXT_INFO())
SELECT @nvc, '"' + @nvc + '"'
SET @nvc = REPLACE(@nvc, nCHAR(0),'' COLLATE Latin1_General_100_BIN2)
SELECT @nvc, '"' + @nvc + '"'

-- Cannot use in a computed column/ use in SMO properties instead

-- An example of using the context Info

-- First create a schema for the example
CREATE Schema DBContextInfoExample
GO

-- Create a function to retrieve the ContextInfo
CREATE FUNCTION DBContextInfoExample.GetUserNameFromContextInfo()
RETURNS NVARCHAR(128)
AS
BEGIN
    DECLARE @contextUser NVARCHAR(128) = convert(NVARCHAR(128),CONTEXT_INFO())
	SET @contextUser = REPLACE(@contextUser, nCHAR(0),'' COLLATE Latin1_General_100_BIN2)
	RETURN @contextUser
END;
GO

-- Create a table
CREATE TABLE DBContextInfoExample.Products (
	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR(100),
    Price DECIMAL(10, 2),
	CreatedBy NVARCHAR(128) DEFAULT DBContextInfoExample.GetUserNameFromContextInfo() 
)
GO

-- Add a row to that table
INSERT INTO DBContextInfoExample.Products ( ProductName, Price)
VALUES ( 'Product A', 100.00);
GO

-- View the results 
SELECT * FROM DBContextInfoExample.Products

-- Change the Context
DECLARE @username NVARCHAR(128) = 'K2:DENALLIX\Mark'
DECLARE @bin VARBINARY(128) = CAST(@username AS VARBINARY(128)); 
SET CONTEXT_INFO @bin;

-- Add a row to that table
INSERT INTO DBContextInfoExample.Products ( ProductName, Price)
VALUES ( 'Product B', 500.00);
GO

-- View the results 
SELECT * FROM DBContextInfoExample.Products

GO
-- Create a SP Not using the ContextInfo
CREATE Procedure DBContextInfoExample.GetUsersProducts
	@UserName NVARCHAR(128)
AS
BEGIN
	SELECT *
	FROM DBContextInfoExample.Products
	WHERE CreatedBy = @UserName
END
GO

-- Create a SP using the contextINFO
-- Create a SP Not using the ContextInfo
CREATE Procedure DBContextInfoExample.GetUsersProductsWithContext
AS
BEGIN
	SELECT *
	FROM DBContextInfoExample.Products
	WHERE CreatedBy = DBContextInfoExample.GetUserNameFromContextInfo() 
END
GO