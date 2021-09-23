--1
select COUNT(*)
From Production.Product
--2
select COUNT(*)
From Production.Product
where ProductSubcategoryID is not null
--3
select ProductSubcategoryID, COUNT(*) CountedProducts
From Production.Product
where ProductSubcategoryID is not null
Group by ProductSubcategoryID
--4
select COUNT(*)
From Production.Product
where ProductSubcategoryID is null
--5
select Round(SUM(Quantity),2)
From Production.ProductInventory
--6
select ProductID , Round(SUM(Quantity),2) as TheSUM
From Production.ProductInventory
where LocationID = 40
Group by ProductID
having Round(SUM(Quantity),2) < 100
--7
select Shelf, ProductID , Round(SUM(Quantity),2) as TheSUM
From Production.ProductInventory
where LocationID = 40
Group by Shelf, ProductID
having Round(SUM(Quantity),2) < 100
--8
select Round(AVG(Quantity),2)
From Production.ProductInventory
where LocationID = 10
--9
select ProductID, Shelf , Round(AVG(Quantity),2) as TheAVG
From Production.ProductInventory
where LocationID = 40
Group by Shelf, ProductID
--10
select ProductID, Shelf , Round(AVG(Quantity),2) as TheAVG
From Production.ProductInventory
where LocationID = 40
Group by Shelf, ProductID
having not Shelf = 'N/A'
--11
Select Color, Class, COUNT(*) as TheCount, Round(AVG(ListPrice),2) as AVGPrice
From Production.Product
group by Color, Class
having Color is not null and Class is not null
--12
Select cr.Name as Country, sp.Name as Province
From Person.CountryRegion cr join Person.StateProvince sp on cr.CountryRegionCode = sp.CountryRegionCode
--13
Select cr.Name as Country, sp.Name as Province
From Person.CountryRegion cr join Person.StateProvince sp on cr.CountryRegionCode = sp.CountryRegionCode
where cr.Name in ('Germany','Canada');
--14

select distinct ProductName
From Orders o inner join [Order Details] od on o.OrderID = od.OrderID inner join Products p on od.ProductID = p.ProductID
where OrderDate > '1996-09-23'

--15
Select top 5 ShipPostalCode
from Orders
where ShipPostalCode is not null
Group by ShipPostalCode
order by COUNT(*) DESC

--16

Select top 5 ShipPostalCode
from Orders
where ShipPostalCode is not null and OrderDate > '1996-09-23'
Group by ShipPostalCode
order by COUNT(*) DESC

--17

Select City, C as NumberOfCustomer
From (
Select City, COUNT(*) as C
from Customers
group by City
) cc

--18

Select City, C as NumberOfCustomer
From (
Select City, COUNT(*) as C
from Customers
group by City
) cc
where cc.C >= 2
--19
Select distinct c.ContactName 
from Orders o inner join Customers c on o.CustomerID = c.CustomerID
where o.OrderDate >= '1998-01-01'
--20

select distinct co.ContactName
From (
Select top 100 c.ContactName 
from Orders o inner join Customers c on o.CustomerID = c.CustomerID
order by o.OrderDate Desc
) co

--21

Select c.ContactName , ROUND(SUM(od.Quantity),2) as [Number of Products]
from Orders o inner join Customers c on o.CustomerID = c.CustomerID inner join [Order Details] od on o.OrderID = od.OrderID
Group by c.ContactName

--22

Select c.CustomerID , ROUND(SUM(od.Quantity),2) as [Number of Products]
from Orders o inner join Customers c on o.CustomerID = c.CustomerID inner join [Order Details] od on o.OrderID = od.OrderID
group by c.CustomerID
having ROUND(SUM(od.Quantity),2) > 100

--23

select distinct sp.CompanyName as 'Supplier Company Name', sh.CompanyName as 'Shipping Company Name'
From Orders o inner join [Order Details] od on o.OrderID = od.OrderID inner join Products p on od.ProductID = p.ProductID 
inner join Suppliers sp on sp.SupplierID = p.SupplierID inner join Shippers sh on o.ShipVia = sh.ShipperID

--24

select distinct o.OrderDate, p.ProductName
From Orders o inner join [Order Details] od on o.OrderID = od.OrderID inner join Products p on od.ProductID = p.ProductID
order by o.OrderDate

--25
Select e1.FirstName + ' ' + e1.LastName as Firstperson, e2.FirstName + ' ' + e2.LastName as Secoundperson, e1.Title
From Employees e1 Inner join Employees e2 on e1.Title = e2.Title
where not e1.FirstName + ' ' + e1.LastName = e2.FirstName + ' ' + e2.LastName
--26

Select e2.FirstName + ' ' + e2.LastName as FullName
From Employees e1 Inner Join Employees e2 on e1.ReportsTo = e2.EmployeeID
group by e2.FirstName + ' ' + e2.LastName
having count(*) > 2

--27

select City, CompanyName ,ContactName, 'Customer' as 'Type'
from Customers
union
select City, CompanyName, ContactName, 'Supplier'
from Suppliers
