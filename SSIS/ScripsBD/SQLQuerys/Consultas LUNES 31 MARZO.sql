use NORTHWND
Go
--consultrar toda la informacion de la tabla customers

select * from Customers


--consultar la infrmacion de la tabla donde el customerid = 'ALFKI'

select * from Customers where CustomerID = 'ALFKI'


---Actualizar el pais de customerid ALFKI

update Customers set Country = 'France' where CustomerID = 'ALFKI'



update Customers set Country = 'Germany' where CustomerID = 'ALFKI'


--declare @customerID as nchar(5)

--select @customerId = customerId
--from Customers where
--Country = 'France'
--and ContactName = 'Maria Anders'

--print @customerId
--select * from Customers
--where ContactName like 'Maria Anders'



-- Obtener el customerID

select customerId
from Customers
where Country = 'France'
and ContactName = 'Maria Anders'


-- Actualizar pais France a Francia del CustumerID ALFKI

update Customers set Country = UPPER ('Francia')
where CustomerID = ?
