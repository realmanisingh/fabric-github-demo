[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "dimcustomer_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "CustomerKey", DestinationColumnName = "CustomerKey"], [SourceColumnName = "GeographyKey", DestinationColumnName = "GeographyKey"], [SourceColumnName = "CustomerAlternateKey", DestinationColumnName = "CustomerAlternateKey"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "FirstName", DestinationColumnName = "FirstName"], [SourceColumnName = "MiddleName", DestinationColumnName = "MiddleName"], [SourceColumnName = "LastName", DestinationColumnName = "LastName"], [SourceColumnName = "NameStyle", DestinationColumnName = "NameStyle"], [SourceColumnName = "BirthDate", DestinationColumnName = "BirthDate"], [SourceColumnName = "MaritalStatus", DestinationColumnName = "MaritalStatus"], [SourceColumnName = "Suffix", DestinationColumnName = "Suffix"], [SourceColumnName = "Gender", DestinationColumnName = "Gender"], [SourceColumnName = "EmailAddress", DestinationColumnName = "EmailAddress"], [SourceColumnName = "YearlyIncome", DestinationColumnName = "YearlyIncome"], [SourceColumnName = "TotalChildren", DestinationColumnName = "TotalChildren"], [SourceColumnName = "NumberChildrenAtHome", DestinationColumnName = "NumberChildrenAtHome"], [SourceColumnName = "EnglishEducation", DestinationColumnName = "EnglishEducation"], [SourceColumnName = "SpanishEducation", DestinationColumnName = "SpanishEducation"], [SourceColumnName = "FrenchEducation", DestinationColumnName = "FrenchEducation"], [SourceColumnName = "EnglishOccupation", DestinationColumnName = "EnglishOccupation"], [SourceColumnName = "SpanishOccupation", DestinationColumnName = "SpanishOccupation"], [SourceColumnName = "FrenchOccupation", DestinationColumnName = "FrenchOccupation"], [SourceColumnName = "HouseOwnerFlag", DestinationColumnName = "HouseOwnerFlag"], [SourceColumnName = "NumberCarsOwned", DestinationColumnName = "NumberCarsOwned"], [SourceColumnName = "AddressLine1", DestinationColumnName = "AddressLine1"], [SourceColumnName = "AddressLine2", DestinationColumnName = "AddressLine2"], [SourceColumnName = "Phone", DestinationColumnName = "Phone"], [SourceColumnName = "DateFirstPurchase", DestinationColumnName = "DateFirstPurchase"], [SourceColumnName = "CommuteDistance", DestinationColumnName = "CommuteDistance"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared dimcustomer = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = WorkspaceId]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = LakehouseId]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "dimcustomer", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "dimgeography_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "GeographyKey", DestinationColumnName = "GeographyKey"], [SourceColumnName = "City", DestinationColumnName = "City"], [SourceColumnName = "StateProvinceCode", DestinationColumnName = "StateProvinceCode"], [SourceColumnName = "StateProvinceName", DestinationColumnName = "StateProvinceName"], [SourceColumnName = "CountryRegionCode", DestinationColumnName = "CountryRegionCode"], [SourceColumnName = "EnglishCountryRegionName", DestinationColumnName = "EnglishCountryRegionName"], [SourceColumnName = "SpanishCountryRegionName", DestinationColumnName = "SpanishCountryRegionName"], [SourceColumnName = "FrenchCountryRegionName", DestinationColumnName = "FrenchCountryRegionName"], [SourceColumnName = "PostalCode", DestinationColumnName = "PostalCode"], [SourceColumnName = "SalesTerritoryKey", DestinationColumnName = "SalesTerritoryKey"], [SourceColumnName = "IpAddressLocator", DestinationColumnName = "IpAddressLocator"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared dimgeography = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = WorkspaceId]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = LakehouseId]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "dimgeography", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "factresellersales_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "ProductKey", DestinationColumnName = "ProductKey"], [SourceColumnName = "OrderDateKey", DestinationColumnName = "OrderDateKey"], [SourceColumnName = "DueDateKey", DestinationColumnName = "DueDateKey"], [SourceColumnName = "ShipDateKey", DestinationColumnName = "ShipDateKey"], [SourceColumnName = "ResellerKey", DestinationColumnName = "ResellerKey"], [SourceColumnName = "EmployeeKey", DestinationColumnName = "EmployeeKey"], [SourceColumnName = "PromotionKey", DestinationColumnName = "PromotionKey"], [SourceColumnName = "CurrencyKey", DestinationColumnName = "CurrencyKey"], [SourceColumnName = "SalesTerritoryKey", DestinationColumnName = "SalesTerritoryKey"], [SourceColumnName = "SalesOrderNumber", DestinationColumnName = "SalesOrderNumber"], [SourceColumnName = "SalesOrderLineNumber", DestinationColumnName = "SalesOrderLineNumber"], [SourceColumnName = "RevisionNumber", DestinationColumnName = "RevisionNumber"], [SourceColumnName = "OrderQuantity", DestinationColumnName = "OrderQuantity"], [SourceColumnName = "UnitPrice", DestinationColumnName = "UnitPrice"], [SourceColumnName = "ExtendedAmount", DestinationColumnName = "ExtendedAmount"], [SourceColumnName = "UnitPriceDiscountPct", DestinationColumnName = "UnitPriceDiscountPct"], [SourceColumnName = "DiscountAmount", DestinationColumnName = "DiscountAmount"], [SourceColumnName = "ProductStandardCost", DestinationColumnName = "ProductStandardCost"], [SourceColumnName = "TotalProductCost", DestinationColumnName = "TotalProductCost"], [SourceColumnName = "SalesAmount", DestinationColumnName = "SalesAmount"], [SourceColumnName = "TaxAmt", DestinationColumnName = "TaxAmt"], [SourceColumnName = "Freight", DestinationColumnName = "Freight"], [SourceColumnName = "CarrierTrackingNumber", DestinationColumnName = "CarrierTrackingNumber"], [SourceColumnName = "CustomerPONumber", DestinationColumnName = "CustomerPONumber"], [SourceColumnName = "OrderDate", DestinationColumnName = "OrderDate"], [SourceColumnName = "DueDate", DestinationColumnName = "DueDate"], [SourceColumnName = "ShipDate", DestinationColumnName = "ShipDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared factresellersales = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = WorkspaceId]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = LakehouseId]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "factresellersales", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
shared dimgeography_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false, HierarchicalNavigation = true]),
  Navigation_1 = Pattern{[workspaceId = WorkspaceId]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = WarehouseId]}[Data],
  Navigation_3 = Navigation_2{[Schema = "dbo"]}[Data],
  TableNavigation = Navigation_3{[Name = "dimgeography"]}?[Data]?
in
  TableNavigation;
shared factresellersales_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false, HierarchicalNavigation = true]),
  Navigation_1 = Pattern{[workspaceId = WorkspaceId]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = WarehouseId]}[Data],
  Navigation_3 = Navigation_2{[Schema = "dbo"]}[Data],
  TableNavigation = Navigation_3{[Name = "factresellersales"]}?[Data]?
in
  TableNavigation;
shared dimcustomer_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false, HierarchicalNavigation = true]),
  Navigation_1 = Pattern{[workspaceId = WorkspaceId]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = WarehouseId]}[Data],
  Navigation_3 = Navigation_2{[Schema = "dbo"]}[Data],
  TableNavigation = Navigation_3{[Name = "dimcustomer"]}[Data]
in
  TableNavigation;
shared WorkspaceId = let
  Source = Variable.ValueOrDefault("$(/**/env_variables/git_workspace_id)", "13f10688-7797-4c03-88ed-477906154e1d")
in
  Source;
shared LakehouseId = let
  Source = Variable.ValueOrDefault("$(/**/env_variables/git_lh_id)", "7e1f9d6b-d7f4-4e03-bb8e-8a208147661a")
in
  Source;
shared WarehouseId = let
  Source = Variable.ValueOrDefault("$(/**/env_variables/git_wh_id)", "59f0bc68-f051-40e4-a811-b73297ca8b17")
in
  Source;
