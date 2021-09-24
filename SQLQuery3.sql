--1
Select distinct c.City
From Customers c inner join Employees e on c.City = e.City

--2
--a
select distinct City
from Customers
where City not in
(
select City
from Employees
)

--b
Select distinct c.City
From Customers c left join Employees e on c.City = e.City
where e.City is null

--3
select p.ProductName, Round(SUM(od.Quantity),2) as [total order quantities]
from Products p inner join [Order Details] od On p.ProductID = od.ProductID
group by p.ProductName

--4
Select c.City, Count(od.ProductID) as [total product]
From Customers c inner join [Orders Qry] oq on c.CustomerID = oq.CustomerID join [Order Details] od on oq.OrderID =od.OrderID
group by c.City

--5
--a
Select city
from Customers
union


--b

--6
Select c.City, Count(od.ProductID) as [total product]
From Customers c inner join [Orders Qry] oq on c.CustomerID = oq.CustomerID join [Order Details] od on oq.OrderID =od.OrderID
group by c.City

--7
select distinct c.ContactName
from Customers c inner join [Orders Qry] oq on c.CustomerID = oq.CustomerID
where not c.City = oq.ShipCity

--8
select top 5 p.ProductName, ROUND(AVG(od.UnitPrice),2) as [average price],
(
select ShipCity, RANK() OVER(ORDER BY quantity DESC) RNK
from [Orders Qry] oq2 inner join [Order Details] od2 on oq2.OrderID = OrderID
where oq2.OrderID = oq.OrderID and RNK = 1
) as [Top Customer City]
from Products p inner join [Order Details] od on p.ProductID = od.ProductID inner join [Orders Qry] oq on od.OrderID = oq.OrderID
group by p.ProductName

select * from Employees

--9
--a

--b

--10

with EmpolyeesoldCTE
as
(
select e.City, RANK() Over(order by COUNT(*) DESC) RNK
from [Orders Qry] oq inner join Employees e on oq.EmployeeID = e.EmployeeID
group by e.City
)

with CityQuantityCTE
as
(
select o.ShipCity, RANK() Over(order by Sum(od.quantity) DESC) RNK
from Orders o inner join [Order Details] od on o.Orderid = od.OrderID
group by o.ShipCity
)

select 
from CityQuantityCTE c inner join emplo


--11
--Use the DELETE statement

--12
select *
from Employees

Create Table #Employee 
(empid integer,
mgrid integer,
deptid integer,
salary money)

Create Table #Dept
(deptid integer,
deptname varchar(20))

select *
from #Employee

select e1.empid
from #Employee e1 left join #Employee e2 on e1.empid = e2.mgrid
where e2.empid is null
--13
select d.deptname, COUNT(e.empid)
from #Dept d inner join #Employee e on d.deptid =e.deptid
group by d.deptname
having COUNT(e.empid) > 1
order by d.deptname

--14

select dt.deptname, e2.empid, e2.salary
from #Employee e2 inner join (
Select e1.empid, d.deptname ,RANK() OVER(PARTITION BY d.deptname ORDER BY Count(e1.salary) desc) RNK
from #Employee e1 inner join #Dept d on e1.deptid = d.deptid
group by e1.empid, d.deptname
) dt on e2.empid = dt.empid