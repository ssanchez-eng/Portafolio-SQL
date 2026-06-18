================================================================================
                    🟢 NIVEL BÁSICO - CONSULTAS SQL
================================================================================

DEFINICIÓN DE NIVEL BÁSICO:
En esta sección encontrarás 30 consultas SQL fundamentales que demuestran mi dominio 
de los conceptos esenciales de bases de datos. Cada ejercicio fue realizado 
manualmente y con total conciencia, reflejando mi comprensión práctica de:

✅ SELECT, WHERE, ORDER BY, TOP/LIMIT - Selección y filtrado de datos
✅ INSERT, UPDATE, DELETE - Manipulación de datos
✅ CREATE TABLE, ALTER TABLE - Diseño de estructuras
✅ Funciones de agregación - COUNT, SUM, AVG, MAX, MIN
✅ GROUP BY,HAVING - Agrupación y análisis
✅ DISTINCT - Eliminación de duplicados
✅ CASE WHEN - Lógica condicional
✅ INNER JOIN - Relaciones entre tablas

Base de datos: Northwind (SQL Server)
Total de ejercicios: 3#

================================================================================

-- EJERCICIO #1: Concatenación de nombres y selección simple
-- Conceptos: SELECT, FROM, Concatenación
-- Tabla: Employees
SELECT FirstName + ' ' + LastName "Nombre completo", 
Title "Título"
FROM Employees

================================================================================

-- EJERCICIO #2: Filtro por columna de texto y ordenamiento
-- Conceptos: SELECT, FROM, ORDER BY
-- Tabla: Customers
Select CustomerID "ID",
ContactName "Nombre completo",
City "Ciudad"
from Customers
order by City asc;

================================================================================

-- EJERCICIO #3: WHERE con mayor que y ORDER BY descendente
-- Conceptos: SELECT, FROM, WHERE, ORDER BY
-- Tabla: Products
Select ProductName "Nombre del producto", 
UnitPrice "Precio unitario",
UnitsInStock "Unidades en stock"
from Products
where UnitsInStock > 10
order by 2 desc;

================================================================================

-- EJERCICIO #4: GROUP BY y COUNT - Contar por categoría
-- Conceptos: SELECT, FROM, GROUP BY, COUNT(), ORDER BY
-- Tabla: Customers
Select count(CustomerID) "Cantidad de clientes",
Country "Países"
from Customers
group by Country
order by 1 desc;

================================================================================

-- EJERCICIO #5: WHERE con fecha y ORDER BY descendente
-- Conceptos: SELECT, FROM, WHERE, ORDER BY
-- Tabla: Employees
Select FirstName+ ' '+LastName "Nombre del empleado",
HireDate "Fecha de contratacion",
City "Ciudad"
from Employees
where HireDate > '1993-01-01'
order by 2 desc;

================================================================================

-- EJERCICIO #6: DISTINCT para eliminar duplicados
-- Conceptos: SELECT, FROM, DISTINCT, ORDER BY
-- Tabla: Products
Select distinct CategoryID "Id de categoria",
ProductName "Nombre del producto"
from Products
order by CategoryID asc;

================================================================================

-- EJERCICIO #7: LIKE con comodín y WHERE
-- Conceptos: SELECT, FROM, WHERE LIKE, ORDER BY
-- Tabla: Employees
Select FirstName+ ' '+LastName "Nombre Empleado",
Title "Título"
From Employees
where Title like '%Sales%'
order by 1 asc;

================================================================================

-- EJERCICIO #8: BETWEEN para rango de valores
-- Conceptos: SELECT, FROM, WHERE BETWEEN, ORDER BY
-- Tabla: Products
Select ProductName"Nombre del producto",
UnitPrice "Precio unitario"
from Products
where UnitPrice between 10 and 50
order by 2 asc;

================================================================================

-- EJERCICIO #9: GROUP BY sin HAVING - Contar órdenes por cliente
-- Conceptos: SELECT, FROM, GROUP BY, COUNT(), ORDER BY
-- Tabla: Orders
SELECT COUNT(OrderID) "Cantidad de ordenes",
CustomerID "Id del cliente"
from Orders
group by CustomerID
Order by 1 desc;

================================================================================

-- EJERCICIO #10: INNER JOIN simple - Empleados y sus órdenes
-- Conceptos: SELECT, FROM, INNER JOIN, GROUP BY, COUNT(), ORDER BY
-- Tablas: Employees, Orders
Select E.FirstName+ ' ' +E.LastName "Nombre del empleado",
COUNT(*) "Cantidad de ordenes"
from Employees E
inner join Orders O ON E.EmployeeID = O.EmployeeID 
GROUP BY E.FirstName,E.LastName
ORDER BY 2 DESC;

================================================================================

-- EJERCICIO #11: INNER JOIN - Suma de cantidad vendida por producto
-- Conceptos: SELECT, FROM, INNER JOIN, GROUP BY, SUM(), ORDER BY
-- Tablas: Products, Order Details
Select P.ProductName "Nombre del producto",
sum(OD.Quantity) "Cantidad vendida"
from Products P
inner join [Order Details] OD on P.ProductID = OD.ProductID
group by P.ProductName
order by 2 desc;

================================================================================

-- EJERCICIO #12: INNER JOIN con HAVING - Categorías con precio promedio > 20
-- Conceptos: SELECT, FROM, INNER JOIN, GROUP BY, AVG(), HAVING, ORDER BY
-- Tablas: Categories, Products
Select C.CategoryName "Nombre de categoria",
format(AVG(P.UnitPrice), 'C', 'es-CL') "Precio promedio"
from Categories C
inner join Products P on C.CategoryID = P.CategoryID 
Group by C.CategoryName
having AVG(P.UnitPrice) > 20
Order by 2 desc;

================================================================================

-- EJERCICIO #13: TOP para limitar resultados
-- Conceptos: SELECT, FROM, INNER JOIN, GROUP BY, COUNT(), ORDER BY, TOP
-- Tablas: Customers, Orders
Select Top 10 C.ContactName "Nombre del cliente",
Count(*) "Cantidad de ordenes"
from Customers C
inner join [Orders] O ON C.CustomerID = O.CustomerID 
group by C.ContactName
order by 2 desc;

================================================================================

-- EJERCICIO #14: YEAR() para filtrar por año específico
-- Conceptos: SELECT, FROM, INNER JOIN, WHERE YEAR(), ORDER BY
-- Tablas: Orders, Customers
SELECT O.OrderID "Id de la orden",
O.OrderDate "Fecha de la orden",
C.ContactName "Nombre del cliente"
from Orders O
inner join Customers C on O.CustomerID = C.CustomerID 
where year(O.OrderDate) = 1997
order by 2 desc;

================================================================================

-- EJERCICIO #15: INNER JOIN - Productos con bajo stock
-- Conceptos: SELECT, FROM, INNER JOIN, WHERE, ORDER BY
-- Tablas: Products, Suppliers
SELECT P.ProductName "Nombre del producto",
P.UnitsInStock "Unidades en stock",
S.CompanyName "Nombre del proveedor"
from Products P
INNER JOIN Suppliers S on P.SupplierID = S.SupplierID
Where P.UnitsInStock <= 5
order by P.UnitsInStock asc;

================================================================================

-- EJERCICIO #16: INNER JOIN con WHERE AND
-- Conceptos: SELECT, FROM, INNER JOIN, WHERE AND, ORDER BY
-- Tablas: Products, Categories
SELECT P.ProductName "Nombre del producto",
P.UnitPrice "Precio unitario",
P.UnitsInStock "Unidades en stock"
from Products P
inner JOIN Categories C on P.CategoryID = C.CategoryID
where P.UnitPrice > 15 and  C.CategoryName = 'Beverages'
order by 2 desc;

================================================================================

-- EJERCICIO #17: LIKE con OR - Búsqueda en múltiples condiciones
-- Conceptos: SELECT, FROM, WHERE LIKE OR, ORDER BY
-- Tabla: Products
SELECT ProductName "Nombre del producto",
UnitPrice "Precio unitario"
from Products
where ProductName like '%Queso%' or ProductName like '%Butter%'
order by 1 asc;

================================================================================

-- EJERCICIO #18: BETWEEN con CAST para fechas
-- Conceptos: SELECT, FROM, WHERE BETWEEN CAST, ORDER BY
-- Tabla: Employees
Select FirstName+ ' '+LastName "Nombre del empleado" ,
HireDate "Fecha de contratacion"
FROM Employees
where HireDate between cast ('1992-01-01' as date) and cast('1994-12-31' as date)
order by 2 asc;

================================================================================

-- EJERCICIO #19: BETWEEN para rango de precios
-- Conceptos: SELECT, FROM, WHERE BETWEEN, ORDER BY
-- Tabla: Products
SELECT ProductName "Producto",
UnitPrice "Precio por unidad"
FROM Products
where UnitPrice between 10 and 30
order by 2 asc;

================================================================================

-- EJERCICIO #20: CASE WHEN con múltiples condiciones
-- Conceptos: SELECT, FROM, CASE WHEN, ORDER BY
-- Tabla: Products
Select ProductName "Nombre del producto",
UnitsInStock "Unidades en stock",
UnitPrice "Precio por unidad",
CASE 
	when UnitsInStock > 50 then 'Alto'
	when UnitsInStock < 50 and UnitsInStock > 20 then 'Medio'
	when UnitsInStock <= 20 and UnitsInStock >= 1 then 'Bajo'
	when UnitsInStock < 1 then 'No hay'
END "Cantidad en stock"
from Products
order by 2 desc;

================================================================================

-- EJERCICIO #21: IN para múltiples valores
-- Conceptos: SELECT, FROM, WHERE IN, ORDER BY
-- Tabla: Customers
select ContactName "Nombre del cliente",
City "Ciudad",
Country "País"
from Customers
where Country in ('USA','France','Germany')
order by 3 asc , 2 asc;

================================================================================

-- EJERCICIO #22: GROUP BY con HAVING - Títulos con más de 1 empleado
-- Conceptos: SELECT, FROM, GROUP BY, COUNT(), HAVING, ORDER BY
-- Tabla: Employees
Select Title "Título",
count(*) "Cantidad de empleados"
from Employees
group by Title
having count(*) > 1
order by 2 desc;

================================================================================

-- EJERCICIO #23: INNER JOIN - Cantidad de productos por proveedor
-- Conceptos: SELECT, FROM, INNER JOIN, GROUP BY, COUNT(), ORDER BY
-- Tablas: Suppliers, Products
select S.CompanyName "Nombre de la compañia",
count(P.ProductID) "Cantidad de productos"
from Suppliers S
inner join Products P on S.SupplierID = P.SupplierID
group by S.CompanyName
order by 2 DESC ;

================================================================================

-- EJERCICIO #24: INNER JOIN con MAX - Última orden por cliente
-- Conceptos: SELECT, FROM, INNER JOIN, GROUP BY, COUNT(), MAX(), ORDER BY
-- Tablas: Customers, Orders
Select C.ContactName "Nombre de cliente",
count(*) "Cantidad de ordenes",
Max(O.OrderDate) "Fecha"
from Customers C
INNER JOIN [Orders] O on C.CustomerID = O.CustomerID
group by C.ContactName
order by 3 desc;

================================================================================

-- EJERCICIO #25: Productos caros - Mayor o igual que 50
-- Conceptos: SELECT, FROM, INNER JOIN, WHERE, ORDER BY
-- Tablas: Products, Categories
Select P.ProductName "Nombre del producto",
P.UnitPrice "Precio por unidad",
C.CategoryName "Categoria"
from Products P
inner join Categories C on P.CategoryID = C.CategoryID 
where P.UnitPrice >= 50
order by 2 desc;

================================================================================

-- EJERCICIO #26: INNER JOIN múltiple - Líneas por orden
-- Conceptos: SELECT, FROM, INNER JOIN (3 tablas), GROUP BY, COUNT(), ORDER BY
-- Tablas: Orders, Customers, Order Details
SELECT O.OrderID "ID de la orden",
O.OrderDate "Fecha de la orden",
C.ContactName "Nombre del cliente",
count(*) "Cantidad de lineas"
from ORDERS O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID 
inner join [Order Details] OC on O.OrderID = OC.OrderID
group by O.OrderDate,O.OrderID,C.ContactName
order by 4 desc;

================================================================================

-- EJERCICIO #27: INNER JOIN múltiple - Total gastado por orden
-- Conceptos: SELECT, FROM, INNER JOIN (3 tablas), GROUP BY, SUM(), ORDER BY
-- Tablas: Orders, Customers, Order Details
Select O.OrderID "ID de la orden",
C.ContactName "Nombre del cliente",
sum(od.UnitPrice * od.Quantity)"Cantidad gastada"

from ORDERS O
inner join Customers C on O.CustomerID = C.CustomerID
INNER JOIN [ORDER DETAILS] OD on O.OrderID = OD.OrderID
group by C.ContactName,O.OrderID
order by 3 desc;

================================================================================

-- EJERCICIO #28: TOP 1 - Categoría con precio promedio más alto
-- Conceptos: SELECT, FROM, INNER JOIN, GROUP BY, AVG(), ORDER BY, TOP
-- Tablas: Categories, Products
SELECT TOP 1 C.CategoryID "Id de la categoria",
C.CategoryName "Nombre de la categoria",
AVG(P.UnitPrice) "Precio promedio"
from Categories C
inner join products P on C.CategoryID = P.CategoryID
GROUP BY C.CategoryID,C.CategoryName
order by 3 desc;

================================================================================

-- EJERCICIO #29: INNER JOIN múltiple - Órdenes de un cliente específico
-- Conceptos: SELECT, FROM, INNER JOIN (4 tablas), WHERE, ORDER BY
-- Tablas: Customers, Orders, Order Details, Products
Select o.OrderID "ID de la orden",
p.ProductName "Nombre del producto",
o.OrderDate "Fecha",
p.QuantityPerUnit "Cantidad por unidad",
p.UnitsOnOrder "Unidades por order"

from Customers C
inner join Orders O on C.CustomerID = O.CustomerID
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID 
inner join products P on od.ProductID  = P.ProductID
where c.ContactName = 'Martín Sommer'
order by 3 desc;

================================================================================

-- EJERCICIO #30: Productos sin stock
-- Conceptos: SELECT, FROM, INNER JOIN (2 tablas), WHERE, ORDER BY
-- Tablas: Products, Categories, Suppliers
Select P.ProductID "ID",
P.ProductName "Nombre del producto",
P.UnitsInStock "Stock",
C.CategoryName "Categoria",
S.CompanyName "Proveedor"

FROM Products P
inner join Categories C on P.CategoryID = C.CategoryID
inner join Suppliers S on P.SupplierID  = S.SupplierID
where P.UnitsInStock = 0

================================================================================
                    FIN DE NIVEL BÁSICO - 30 EJERCICIOS
================================================================================
