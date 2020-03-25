-- DISTINCT

USE Northwind


-- hier bekommen wir alle L�nder; aber alle stehen mehrfach da, weil wir mehrere Kunden pro Land haben
SELECT Country
FROM Customers

-- wie bekomme ich eine Liste von allen L�ndern, in denen wir Kunden haben?
SELECT DISTINCT Country
FROM Customers
-- 21 Zeilen Ergebnis (Anzahl L�nder) statt 91 (Anzahl Kunden)


-- bringt nix, weil jetzt bekommen wir wieder alle Kunden
SELECT DISTINCT CustomerID, Country
FROM Customers


-- so viele Treffer, wie wir St�dte haben (69)
SELECT DISTINCT Country, City
FROM Customers
ORDER BY Country


-- Liste von allen L�ndern, in denen Angestellte wohnen?
SELECT DISTINCT Country
FROM Employees
-- USA, UK

-- zur Kontrolle:
SELECT *
FROM Employees
-- ja, gibt wirklich nur zwei



