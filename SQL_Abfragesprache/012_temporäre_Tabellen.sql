-- tempor�re Tabellen

/*

	-- lokale tempor�re Tabellen
	-- existiert nur in der aktuellen Session
	#Tabellenname


	-- globale tempor�re Tabellen
	-- Zugriff auch aus anderen Sessions
	##Tabellenname


	-- h�lt nur solange wie die Session besteht/die Verbindung da ist

	-- kann auch gel�scht werden

*/

SELECT CustomerID, Freight
INTO #testtable
FROM Orders


SELECT *
FROM #testtable



SELECT CustomerID, CompanyName
INTO ##test2
FROM Customers

SELECT *
FROM ##test2