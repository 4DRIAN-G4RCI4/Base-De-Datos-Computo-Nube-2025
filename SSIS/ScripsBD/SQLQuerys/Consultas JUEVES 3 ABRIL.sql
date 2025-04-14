use AdventureWorksDW2016

select * from  DimProduct
select * from  DimProductSubcategory
select * from  DimProductCategory
select * from  FactResellerSales


---mostrar todos los productos ,categoria , subcategoria precio unitario y cantidad de ventas

select  dp.EnglishProductName, dpc.EnglishProductCategoryName,
dps.EnglishProductSubcategoryName, frs.UnitPrice,
frs.SalesAmount
 from 
 DimProduct as dp
inner join 
DimProductSubcategory as dps
on dp.ProductSubcategoryKey = dps.ProductCategoryKey
inner join DimProductCategory as dpc
on dpc.ProductCategoryKey = dps.ProductCategoryKey
inner join FactResellerSales as frs
on frs.ProductKey = dp.ProductKey
go

--Maximo del precio unitario 


select  MAX(UnitPrice) as PrecioMaximo
 from 
 DimProduct as dp
inner join 
DimProductSubcategory as dps
on dp.ProductSubcategoryKey = dps.ProductCategoryKey
inner join DimProductCategory as dpc
on dpc.ProductCategoryKey = dps.ProductCategoryKey
inner join FactResellerSales as frs
on frs.ProductKey = dp.ProductKey

--minimo del precio Unitario

select  Min(frs.UnitPrice) as PrecioMinimo
 from
 DimProduct as dp
inner join 
DimProductSubcategory as dps
on dp.ProductSubcategoryKey = dps.ProductCategoryKey
inner join DimProductCategory as dpc
on dpc.ProductCategoryKey = dps.ProductCategoryKey
inner join FactResellerSales as frs
on frs.ProductKey = dp.ProductKey

--precio Suma


select  Sum(frs.UnitPrice) as PrecioSum
 from 
 DimProduct as dp
inner join 
DimProductSubcategory as dps
on dp.ProductSubcategoryKey = dps.ProductCategoryKey
inner join DimProductCategory as dpc
on dpc.ProductCategoryKey = dps.ProductCategoryKey
inner join FactResellerSales as frs
on frs.ProductKey = dp.ProductKey


--precio promedio
select  avg(frs.UnitPrice) as PrecioPromedio
 from 
 DimProduct as dp
inner join 
DimProductSubcategory as dps
on dp.ProductSubcategoryKey = dps.ProductCategoryKey
inner join DimProductCategory as dpc
on dpc.ProductCategoryKey = dps.ProductCategoryKey
inner join FactResellerSales as frs
on frs.ProductKey = dp.ProductKey


--cantidad total de los productos

select  count(frs.UnitPrice) as  CantidadProductos
 from 
 DimProduct as dp
inner join 
DimProductSubcategory as dps
on dp.ProductSubcategoryKey = dps.ProductCategoryKey
inner join DimProductCategory as dpc
on dpc.ProductCategoryKey = dps.ProductCategoryKey
inner join FactResellerSales as frs
on frs.ProductKey = dp.ProductKey




--valores distintos

select  Count( distinct dp.EnglishProductName) as CantidadRegistro
 from 
 DimProduct as dp
inner join 
DimProductSubcategory as dps
on dp.ProductSubcategoryKey = dps.ProductCategoryKey
inner join DimProductCategory as dpc
on dpc.ProductCategoryKey = dps.ProductCategoryKey
inner join FactResellerSales as frs
on frs.ProductKey = dp.ProductKey

--realizar la suma del precio unitario por nombre de el producto


select dp.EnglishProductName, sum( UnitPrice) as PrecioTotal
 from 
 DimProduct as dp
inner join 
DimProductSubcategory as dps
on dp.ProductSubcategoryKey = dps.ProductCategoryKey
inner join DimProductCategory as dpc
on dpc.ProductCategoryKey = dps.ProductCategoryKey
inner join FactResellerSales as frs
on frs.ProductKey = dp.ProductKey
group by dp.EnglishProductName