-- 🌷 OPERATORI ARITMETICI: +, -, *, /, %

-- 🌷 OPERATORI DI CONFRONTO: =, <>, != <>, >, <, >=, <=

SELECT * FROM Voti WHERE Voto>=6.00;

-- ORDER BY: Permette di ordinare le colonne senza duplicati
SELECT * FROM Voti WHERE Voto>=6.00
ORDER BY Voto ASC;

-- 🌷 OPERATORI LOGICI: AND, OR, NOT

SELECT * FROM Pagamenti WHERE Importo >= 200 AND Importo <= 300;

SELECT * FROM Pagamenti
WHERE Importo >= 200 OR Importo <= 300;

SELECT * FROM Classi 
WHERE Descrizione IS NULL OR NOT Descrizione = 'Classe formativa numero 22';

SELECT * FROM Classi 
WHERE Descrizione IS NULL OR Descrizione = 'Classe formativa numero 22';

-- 🌷 OPERATORI DI ASSEGNAZIONE: =, +=, -=, *=, /=, %=
DECLARE @iMPORTO DECIMAL(10,2);
SET @IMPORTO = 100.00;

-- 🌷 OPERATORI SPECIALI SQL: IS NULL, IS NOT NULL, BETWEEN, IN(), LIKE, EXISTS

SELECT * FROM Pagamenti
WHERE Importo BETWEEN 200 AND 300;

SELECT * FROM Classi
WHERE Descrizione IS NOT NULL AND Descrizione <> 'Classe formativa numero 16';

-- Cercare pagamenti effettuati in un periodo specifico, con la Carta e In attesa di conferma
SELECT * FROM Pagamenti
WHERE DataPagamento BETWEEN '2026-01-01 00:00:00' 
    AND '2026-12-31 00:00:00' 
    AND MetodoPagamento='Carta' 
    AND Stato = 'In attesa';

-- ❗IN () permette di verificare se un valore appartiene a un elenco di valori specificati, evitando molte condizioni 'OR'
SELECT * FROM Docenti
WHERE DocenteId = 1 OR DocenteId = 5 OR DocenteId = 15 OR DocenteId = 17; 

SELECT * FROM Docenti
WHERE DocenteId IN(1, 5, 15, 17); 

-- Restituire la lista dei voti escludendo i voti con gli ID 14, 5, 16, 30
SELECT * FROM Voti
WHERE VotoId NOT IN (14, 5, 16, 30);

-- ❗LIKE permette di cercare un determinato modello di testo all'interno di una colonna. È utile quando non conosciamo un valore completo.
/* La sintassi:
        'a%' restituisce tutti valori che cominciano con la lettera 'a'
        '%i' restituisce tutti valori che finiscono con la lettera 'a'
        '%i%' restituisce tutti valori che hanno una lettera 'a' all'interno */

SELECT * FROM Studenti
WHERE Nome LIKE 'M%' AND Cognome LIKE '%i';

SELECT * FROM Studenti
WHERE Nome LIKE 'M_r%';

SELECT * FROM Iscrizioni
WHERE DataIscrizione LIKE '%3';

-- ❗EXISTS verifica se una sottoquery restituisce almeno una riga (esistenza di un record)

-- Restituire gli studenti che hanno almeno un'iscrizione
SELECT CONCAT(s.Nome, ' ', s.Cognome) AS [Studente],
        s.CodiceFiscale AS CF
FROM Studenti AS s
WHERE EXISTS (
    SELECT 1 FROM Iscrizioni AS i
    WHERE s.StudenteId = i.StudenteId
);

-- Individuare i corsi che hanno almeno uno studente iscritto
SELECT c.CorsoId,
        c.NomeCorso
FROM Corsi AS c
WHERE EXISTS (
    SELECT 1 FROM Iscrizioni AS i
    WHERE c.CorsoId = i.CorsoId
);
