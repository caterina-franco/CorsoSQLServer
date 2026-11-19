/*
	Lezione 1 – Il comando SELECT
	
	1. Cos'è SELECT?
	SELECT è il comando SQL utilizzato per interrogare una 
	o più tabelle e recuperare i dati che ci interessano.
	
	2. A cosa serve?
	Permette di:
		- visualizzare tutte le colonne di una tabella;
		- selezionare soltanto alcune colonne;
		- creare colonne calcolate;
		- assegnare nomi personalizzati alle colonne del risultato;
		- individuare valori distinti.
	
	3. Perché è importante per un Data Analyst?
	Un Data Analyst raramente ha bisogno di visualizzare un'intera tabella.
	Generalmente deve estrarre soltanto le informazioni utili per rispondere
	a una domanda aziendale.

	Per esempio:
		- Quanti studenti sono iscritti?
		- Quali corsi sono disponibili?
		- Quali studenti hanno un indirizzo email?
		- Quali sono i voti degli studenti?
		- Quanto costa ciascun corso?

	SELECT è quindi uno dei comandi fondamentali per costruire report e analisi.

	4. Sintassi di base
	SELECT Colonna1, Colonna2, Colonna3
	FROM NomeTabella;


	- SELECT: indica quali colonne vogliamo visualizzare.
	- FROM: indica da quale tabella recuperare i dati.
	- ;: termina l'istruzione SQL.



	Obiettivi del modulo
		- Estrarre dati da una o più tabelle.
		- Selezionare soltanto le colonne necessarie.
		- Filtrare i dati in base a condizioni.
		- Ordinare e limitare i risultati.
		- Individuare valori mancanti e duplicati.
		- Preparare dataset per report e dashboard.
*/

USE ScuolaDb;

-- ESERCIZIO 1: Estrarre dati da una o più tabelle.
SELECT * FROM AnniScolastici;

-- ESERCIZIO 2: Selezionare soltanto le colonne necessarie: Nome, Cognome, Email, CodiceFiscale, Sesso
SELECT 
    Nome,
    Cognome,
    Email,
    CodiceFiscale,
    Sesso
FROM Studenti;


-- ❗ Il comando WHERE filtra i dati della tabella a seconda della condizioni
-- ESERCIZIO 3: Filtrare i dati in base a condizioni.
SELECT *
FROM Aule
WHERE AulaId = 6;


-- ❗ CONCATENAZIONE: permette di unire più stringhe usando il "+"
-- ESERCIZIO 3.1: Restituire il nome completo dello studente con il codice fiscale

SELECT Nome + ' ' + Cognome, 
	CodiceFiscale
FROM Studenti;

-- ❗ Alias(AS) permette di definire un nome ad una colonna 
SELECT Nome + ' ' + Cognome as NomeCompleto, 
	CodiceFiscale
FROM Studenti;

SELECT Nome + ' ' + Cognome as 'Nome Completo', 
	CodiceFiscale
FROM Studenti;

SELECT Nome + ' ' + Cognome as [Nome Completo], 
	CodiceFiscale as [Codice Fiscale]
FROM Studenti;

-- MODIFICA COLONNA
Alter Table Aule
ALTER COLUMN Capacita INT NULL;

Alter Table Aule
ALTER COLUMN TipoAula NVARCHAR(50) NULL;

-- Inserimento dati con valori NULL
INSERT INTO Aule 
	(NomeAula, TipoAula, Capacita, Piano, Attiva)
VALUES
	('Aula 31', null, 100, null, 0);

-- IS NULL e IS NOT NULL
SELECT * FROM Aule
WHERE Piano IS NULL;

-- Inserimento della classe con valore null in descrizione
SELECT * FROM Classi;

INSERT INTO Classi 
	(NomeClasse, AnnoScolasticoId, TutorDocenteId)
VALUES
	('2I - Sezione 35', 12, 30);

SELECT * FROM Classi
WHERE NomeClasse = '2I - Sezione 35';

SELECT * FROM Classi
WHERE ClasseID = '8';

/*
DELETE FROM Classi WHERE ClasseId > 30;

DBCC CHECKIDENT ('Classi', RESEED, 30);

INSERT INTO Classi 
    (NomeClasse, AnnoScolasticoId, TutorDocenteId)
VALUES
    ('2I - Sezione 35', 12, 30);

SELECT * FROM Classi WHERE ClasseId >= 30;
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF; */

-- ❗ TOP serve a prendere i primi valori
-- Limitare il risultato della SELECT a 5 righe

SELECT TOP 5 *
FROM Studenti;

SELECT TOP 5 *
FROM Studenti
WHERE Sesso = 'F';

SELECT TOP 3 *
FROM Studenti
WHERE Sesso = 'M';

