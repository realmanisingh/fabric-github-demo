CREATE TABLE [dbo].[dimgeography] (
    [GeographyKey]             INT            NULL,
    [City]                     VARCHAR (8000) NULL,
    [StateProvinceCode]        VARCHAR (8000) NULL,
    [StateProvinceName]        VARCHAR (8000) NULL,
    [CountryRegionCode]        VARCHAR (8000) NULL,
    [EnglishCountryRegionName] VARCHAR (8000) NULL,
    [SpanishCountryRegionName] VARCHAR (8000) NULL,
    [FrenchCountryRegionName]  VARCHAR (8000) NULL,
    [PostalCode]               VARCHAR (8000) NULL,
    [SalesTerritoryKey]        INT            NULL,
    [IpAddressLocator]         VARCHAR (8000) NULL
);


GO