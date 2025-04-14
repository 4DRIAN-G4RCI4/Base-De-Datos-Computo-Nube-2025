
-- Merge join

--Usando la base de datos [AdventureWorksDW2016]

use AdventureWorksDW2016
go

-- Obtener información de EnglishProductName, EnglishProductCategoryName, EnglishProductSubcategoryName,
-- UnitPrice y SalesAmount

Select dp.EnglishProductName, dps.EnglishProductSubcategoryName, 
dpc.EnglishProductCategoryName, FRS.UnitPrice, FRS.SalesAmount
from DimProduct DP
join DimProductSubcategory dps
on dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
join DimProductCategory dpc  
on dpc.ProductCategoryKey = dps.ProductCategoryKey
join FactResellerSales FRS 
on FRS.ProductKey = dp.ProductKey



-- 1. Realizar los joins de las tablas DimProducto y DimProductSubcategory
-- Unidos por la llave ProductSubcategoryKey

SELECT ProductKey, ProductSubcategoryKey, EnglishProductName
from DimProduct

SELECT ProductSubcategoryKey, ProductCategoryKey, EnglishProductSubcategoryName
from DimProductSubcategory

--2. Del resultado Obtenido Realizar el join con la tabla dim productcategory
--unidos por la llave productcategory


select ProductCategoryKey,EnglishProductCategoryName
from DimProductCategory

--3. Del resultado Obtenido realizar la union con la tabla Factresellersales
-- unidos por la llave Product Key

SELECT ProductKey, UnitPrice, SalesAmount
FROM FactResellerSales