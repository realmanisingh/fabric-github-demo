CREATE TABLE [dbo].[dimcustomer] (
    [CustomerKey]          INT             NULL,
    [GeographyKey]         INT             NULL,
    [CustomerAlternateKey] VARCHAR (8000)  NULL,
    [Title]                VARCHAR (8000)  NULL,
    [FirstName]            VARCHAR (8000)  NULL,
    [MiddleName]           VARCHAR (8000)  NULL,
    [LastName]             VARCHAR (8000)  NULL,
    [NameStyle]            BIT             NULL,
    [BirthDate]            DATE            NULL,
    [MaritalStatus]        VARCHAR (8000)  NULL,
    [Suffix]               VARCHAR (8000)  NULL,
    [Gender]               VARCHAR (8000)  NULL,
    [EmailAddress]         VARCHAR (8000)  NULL,
    [YearlyIncome]         DECIMAL (38, 6) NULL,
    [TotalChildren]        SMALLINT        NULL,
    [NumberChildrenAtHome] SMALLINT        NULL,
    [EnglishEducation]     VARCHAR (8000)  NULL,
    [SpanishEducation]     VARCHAR (8000)  NULL,
    [FrenchEducation]      VARCHAR (8000)  NULL,
    [EnglishOccupation]    VARCHAR (8000)  NULL,
    [SpanishOccupation]    VARCHAR (8000)  NULL,
    [FrenchOccupation]     VARCHAR (8000)  NULL,
    [HouseOwnerFlag]       VARCHAR (8000)  NULL,
    [NumberCarsOwned]      SMALLINT        NULL,
    [AddressLine1]         VARCHAR (8000)  NULL,
    [AddressLine2]         VARCHAR (8000)  NULL,
    [Phone]                VARCHAR (8000)  NULL,
    [DateFirstPurchase]    DATE            NULL,
    [CommuteDistance]      VARCHAR (8000)  NULL
);


GO