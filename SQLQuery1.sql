---1
Select ProductID, Name, Color, ListPrice
From Production.Product
--2
Select ProductID, Name, Color, ListPrice
From Production.Product
where Not ListPrice = 0
--3
Select ProductID, Name, Color, ListPrice
From Production.Product
where Color is Null
--4
Select ProductID, Name, Color, ListPrice
From Production.Product
where Color is Not Null
--5
Select ProductID, Name, Color, ListPrice
From Production.Product
where Color is Not Null and ListPrice > 0
--6
Select Name + ' / ' + Color 'Name and Color'
From Production.Product
where Color is not null
--7
Select 'NAME:' + Name + ' -- COLOR: ' + Color 'Name and Color'
From Production.Product
where Color is not null
--8
Select ProductID, Name
From Production.Product
Where ProductID between 400 and 500
--9
Select ProductID, Name, Color
From Production.Product
Where Color = 'Black' or Color = 'Blue'
--10
Select *
From Production.Product
where Name like 'S%'
--11
Select Name, ListPrice
From Production.Product
order by Name
--12
Select Name, ListPrice
From Production.Product
where Name like 'A%' or Name like 'S%'
order by Name
--13
Select Name
From Production.Product
where Name like 'SPO%' and Name not like 'SPOK%'
order by Name
--14
Select Distinct Color
From Production.Product
order by Color Desc
--15
Select Distinct ProductSubcategoryID , Color
From Production.Product
where ProductSubcategoryID is not null and Color is not null
--16
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE Color IN ('Red','Black') 
      and (ListPrice BETWEEN 1000 AND 2000 
      or ProductSubCategoryID = 1)
ORDER BY ProductID

