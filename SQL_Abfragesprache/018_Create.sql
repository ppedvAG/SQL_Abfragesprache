-- CREATE

/*
	int - Ganzzahlen
	float - Nachkommastellen
	decimal(10,2) - 10 Stellen, davon 2 Nachkommastellen

	money - wie float, aber Nachkommastellen begrenzt

	char(50) - genau 50 Stellen
	varchar(50) - maximal 50 Stellen
	
	nchar, nvarchar - wie char und varchar, aber Unicode, daher doppelt so viel Speicherplatz
	
	datetime - auf mehrere ms genau
	datetime2 - auf mehrere nanosec genau
	date - nur Datum
	time - nur Zeit 

*/



-- CREATE 

CREATE DATABASE MyTestDB


USE MyTestDB
-- NEEEEEEIIINNNNN!!!
-- gesamte Datenbank w�re unwiederbringlich weg!!
-- DROP DATABASE MyTestDB


-- Tabellen erstellen
CREATE TABLE Produkte
(
	ProduktID int identity,
	Bezeichnung varchar(255),
	Preis money
--  ... 
--  ...
)

SELECT *
FROM Produkte

-- DROP TABLE Produkte

INSERT INTO Produkte -- VORSICHT: REIHENFOLGE!!
	VALUES('Spaghetti', 1.90)



INSERT INTO Produkte (Preis, Bezeichnung)
	VALUES (2.40, 'Carbonara Sauce')



INSERT INTO Produkte (Bezeichnung, Preis)
	VALUES ('Tiramisu', 4.99),
		   ('Tartufo', 4.89),
		   ('Penne', 1.99),
		   ('Tagliatelle', 2.10)



-- ALLES wegl�schen mit DROP - gesamte Tabelle inklusive Inhalt ist unwiederbringlich verloren
-- INHALTE wegl�schen mit DELETE
-- VORSICHT: DELETE FROM Tabellenname = Tabelle ist noch da, aber der GESAMTE Inhalt ist weg!!!
-- DELETE FROM IMMER einschr�nken mit WHERE!!

DELETE FROM Produkte
WHERE ProduktID = 15


SELECT *
FROM Produkte


-- Werte ver�ndern mit UPDATE
-- VORSICHT!! UPDATE Tabelle SET Spalte = ALLE Werte in der Spalte werden gesetzt
-- IMMER mit WHERE einschr�nken
UPDATE Produkte
SET Preis = 2.15
WHERE ProduktID = 13



-- an der Tabelle etwas ver�ndern mit ALTER
ALTER TABLE Produkte
ALTER COLUMN Bezeichnung varchar(50)




-- neue Spalte hinzuf�gen
ALTER TABLE Produkte
ADD AnzahlLagernd smallint


SELECT *
FROM Produkte


INSERT INTO Produkte (Bezeichnung, Preis)
	VALUES ('Pesto', 2.30)



INSERT INTO Produkte (Bezeichnung, AnzahlLagernd)
	VALUES ('Pesto', 20)



-- macht keinen Sinn, hoppla, Fehler passiert
ALTER TABLE Produkte
ADD Email varchar(50)

-- Spalte wieder loswerden (oder existierende Spalten l�schen, die man nicht mehr braucht)
ALTER TABLE Produkte
DROP COLUMN Email


UPDATE Produkte
SET Preis = 3.5
WHERE Bezeichnung = 'Pesto'




CREATE TABLE Kunde
(
	KundenID int identity(100, 1), -- identity mit Zahlenangabe (wir fangen bei 100 zu z�hlen an und z�hlen dann jeweils um 1 hoch)
	Vorname varchar(50),
	Nachname varchar(50)
--  .........
)


INSERT INTO Kunde (Vorname, Nachname)
	VALUES('James', 'Bond')


SELECT *
FROM Kunde

SELECT *
FROM Produkte