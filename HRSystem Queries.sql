Create Schema HRRequests

CREATE TABLE HRRequests.HRRequests (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeUserName NVARCHAR(256),
    EmployeeDisplayName NVARCHAR(256),
    RequestDate DATETIME,
    RequestSubject NVARCHAR(500),
    Status NVARCHAR(50)
);

CREATE TABLE HRRequests.Responses (
    ResponseID INT PRIMARY KEY IDENTITY(1,1),
    RequestID INT,
    ResponseDate DATETIME,
    ResponseDetails NVARCHAR(MAX),
    CreatedByUserName NVARCHAR(256),
    CreatedByDisplayName NVARCHAR(256),
    FromHR BIT,
);
