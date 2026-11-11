-- Step 1: Create a view in the [dbo] schema selecting all columns
--         from the [factresellersales] table.
CREATE VIEW [dbo].[vFactResellerSales]
AS
SELECT
    [ProductKey],
    [OrderDateKey],
    [DueDateKey],
    [ShipDateKey],
    [ResellerKey],
    [EmployeeKey],
    [PromotionKey],
    [CurrencyKey],
    [SalesTerritoryKey],
    [SalesOrderNumber],
    [SalesOrderLineNumber],
    [RevisionNumber],
    [OrderQuantity],
    [UnitPrice],
    [ExtendedAmount],
    [UnitPriceDiscountPct],
    [DiscountAmount],
    [ProductStandardCost],
    [TotalProductCost],
    [SalesAmount],
    [TaxAmt],
    [Freight],
    [CarrierTrackingNumber],
    [CustomerPONumber],
    [OrderDate],
    [DueDate],
    [ShipDate]
FROM [dbo].[factresellersales];

GO