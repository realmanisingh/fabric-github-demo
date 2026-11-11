CREATE TABLE [dbo].[factresellersales] (
    [ProductKey]            INT             NULL,
    [OrderDateKey]          INT             NULL,
    [DueDateKey]            INT             NULL,
    [ShipDateKey]           INT             NULL,
    [ResellerKey]           INT             NULL,
    [EmployeeKey]           INT             NULL,
    [PromotionKey]          INT             NULL,
    [CurrencyKey]           INT             NULL,
    [SalesTerritoryKey]     INT             NULL,
    [SalesOrderNumber]      VARCHAR (8000)  NULL,
    [SalesOrderLineNumber]  SMALLINT        NULL,
    [RevisionNumber]        SMALLINT        NULL,
    [OrderQuantity]         SMALLINT        NULL,
    [UnitPrice]             DECIMAL (38, 6) NULL,
    [ExtendedAmount]        DECIMAL (38, 6) NULL,
    [UnitPriceDiscountPct]  FLOAT (53)      NULL,
    [DiscountAmount]        FLOAT (53)      NULL,
    [ProductStandardCost]   DECIMAL (38, 6) NULL,
    [TotalProductCost]      DECIMAL (38, 6) NULL,
    [SalesAmount]           DECIMAL (38, 6) NULL,
    [TaxAmt]                DECIMAL (38, 6) NULL,
    [Freight]               DECIMAL (38, 6) NULL,
    [CarrierTrackingNumber] VARCHAR (8000)  NULL,
    [CustomerPONumber]      VARCHAR (8000)  NULL,
    [OrderDate]             DATETIME2 (6)   NULL,
    [DueDate]               DATETIME2 (6)   NULL,
    [ShipDate]              DATETIME2 (6)   NULL
);


GO