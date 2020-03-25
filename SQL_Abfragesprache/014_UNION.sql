-- UNION



-- Liste von allen Kontaktpersonen
-- Customers und Suppliers
-- CustomerID, CompanyName, ContactName, Phone
-- SupplierID, CompanyName, ContactName, Phone


-- NEIN!!! -- keine Liste, sondern entsprechend mehr Spalten
-- so wird das nix:
SELECT	  c.CustomerID
		, c.CompanyName
		, c.ContactName
		, c.Phone
		, s.SupplierID
		, s.CompanyName
		, s.ContactName
		, s.Phone
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
				 INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY CustomerID


-- UNION

SELECT 'Testtext1' AS Testtext
UNION
SELECT 'Testtext2'


-- UNION MACHT AUCH DISTINCT!!
SELECT 'Testtext'
UNION
SELECT 'Testtext'

-- wenn man KEIN DISTINCT m�chte: UNION ALL
SELECT 'Testtext'
UNION ALL
SELECT 'Testtext'

-- VORSICHT:
SELECT 123
UNION
SELECT 'Testtext'


-- CAST geht
SELECT CAST(123 AS varchar)
UNION
SELECT 'Testtext'

-- muss gleiche Datentypen haben!!


-- geht nicht:
SELECT 123, 'Testtext'
UNION
SELECT 456
-- wir m�ssen die gleiche Anzahl an Spalten verwenden!

-- geht:
SELECT 123, 'Testtext'
UNION
SELECT 456, 'Testtext'

-- geht:
SELECT 123, 'Testtext'
UNION
SELECT 456, 'blabla' -- SINN? Wie sinnvoll ist es, irgendeinen Text zu Spalten hinzuzuf�gen?

-- geht:
SELECT 123, 'Testtext'
UNION
SELECT 456, NULL -- SINN? Wieviel Sinn macht es in der jeweiligen Situation?


-- Liste von Kontaktdaten

SELECT	  CompanyName
		, ContactName
		, Phone
		, 'C' AS Category
FROM Customers
UNION
SELECT	  CompanyName
		, ContactName
		, Phone
		, 'S' AS Category
FROM Suppliers




-- ORDER BY:
SELECT	  CompanyName
		, ContactName
		, Phone
		, 'C' AS Category
FROM Customers
UNION
SELECT	  CompanyName
		, ContactName
		, Phone
		, 'S' AS Category
FROM Suppliers
ORDER BY ContactName -- geht, bezieht sich aber auf BEIDE Tabellen!



SELECT Phone, Companyname
FROM Customers
UNION
SELECT HomePhone, 'blabla' -- SINN? Situationsabh�ngig
FROM Employees


--Gib alle Regionen der Kunden und der Angestellten aus.
--F�ge eine Kategorie �C� f�r Customer und �E� f�r Employee hinzu.

SELECT Region, 'C' AS Category
FROM Customers
UNION
SELECT Region, 'E' AS Category
FROM Employees


-- Vorsicht mit Datentypen und Spaltenanzahl!
SELECT CustomerID, CompanyName
FROM Customers
UNION
SELECT SupplierID, CompanyName, Phone
FROM Suppliers
-- hier unterschiedliche Datentypen UND unterschiedliche Spaltenanzahl!!



-- Liste mit niedrigsten und h�chsten Frachtkosten (untereinander)
-- OrderID, Freight, 'niedrigste Frachtkosten'
-- OrderID, Freight, 'h�chste Frachtkosten'

-- Ideen?
SELECT TOP 1 OrderID, Freight, 'niedrigste Frachtkosten' AS Frachtkosten
FROM Orders
ORDER BY Freight
UNION -- geht nicht, weil ORDER BY gilt f�r beide
SELECT TOP 1 OrderID, Freight, 'h�chste Frachtkosten' AS Frachtkosten
FROM Orders
ORDER BY Freight DESC


-- mit tempor�rer Tabelle gehts:
SELECT TOP 1 OrderID, Freight, 'niedrigste Frachtkosten' AS Frachtkosten
INTO #niedrigsterWert
FROM Orders
ORDER BY Freight

SELECT TOP 1 OrderID, Freight, 'h�chste Frachtkosten' AS Frachtkosten
INTO #hoechsterWert
FROM Orders
ORDER BY Freight DESC


SELECT *
FROM #niedrigsterWert
UNION
SELECT *
FROM #hoechsterWert


-- mit Min/Max (bei mehreren Spalten problematisch)
SELECT MIN(Freight), 'niedrigster Wert'
FROM Orders
UNION
SELECT MAX(Freight), 'h�chster Wert'
FROM Orders


-- mit Subquery gehts auch:
SELECT *
FROM (SELECT TOP 1 OrderID, Freight, 'niedrigster Wert' AS Wert FROM Orders ORDER BY Freight) n
UNION
SELECT *
FROM (SELECT TOP 1 OrderID, Freight, 'h�chster Wert' AS Wert FROM Orders ORDER BY Freight DESC) h
