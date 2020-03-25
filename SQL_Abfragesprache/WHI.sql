-- WH von Tag 1

--SELECT *
--FROM Tabelle
--WHERE Bedingung
--ORDER BY Spalte ASC (ascending: aufsteigend)| DESC (descending: absteigend)


SELECT	  CustomerID
		, CompanyName
		, 'Hallo'
		, 123
--		, Spalte1*Spalte2 ... Berechnungen
FROM Customers


/*

	Gib die Bestellnummer, den Wunschtermin, das Lieferdatum und die Lieferverz�gerung aus.
	Ergebnisse von Bestellungen, die noch nicht geliefert wurden, sollen nicht ausgegeben werden.
	Ordne das Ergebnis absteigend von der gr��ten zur kleinsten Lieferverz�gerung.

*/


SELECT	  OrderID
		, RequiredDate
		, ShippedDate
		, DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverz�gerung
FROM Orders
WHERE ShippedDate IS NOT NULL
ORDER BY Lieferverz�gerung DESC