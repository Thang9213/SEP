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
select *
From Orders

select *
From [Order Details]

select *
From Orders o inner join [Order Details] od on o.OrderID = od.OrderID inner join Products p on od.ProductID = p.ProductID
group by ProductName

select *
From Orders o inner join [Order Details] od on o.OrderID = od.OrderID inner join Products p on od.ProductID = p.ProductID
group by ProductName

--15
Select top 5 ShipPostalCode
from Orders
where ShipPostalCode is not null
Group by ShipPostalCode
order by COUNT(*) DESC

--16

Select top 5 ShipPostalCode
from Orders
where ShipPostalCode is not null and 
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

--20
--21
--22
--23
--24
--25
Select e1.FirstName + ' ' + e1.LastName as Firstperson, e2.FirstName + ' ' + e2.LastName as Secoundperson, e1.Title
From Employees e1 Inner join Employees e2 on e1.Title = e2.Title
--26
Select FirstName + ' ' + LastName as FullName, ReportsTo, EmployeeID
From Employees

Select distinct e2.FirstName + ' ' + e2.LastName as FullName
From Employees e1 Inner Join Employees e2 on e1.ReportsTo = e2.EmployeeID
where 
--27