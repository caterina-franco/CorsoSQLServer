-- INNER JOIN / JOIN
/*
	SELECT 
		t1.colonna1,
		t1.colonna2,
		t2.colonna6
		...
	FROM tabella1 as t1
	INNER JOIN Tabella2 as t2
		on t1.colonnaid = t2.colonnaId
*/


-- Restituire la lista degli studenti iscritti
USE ScuolaDb;

SELECT CONCAT(s.Nome, ' ', s.Cognome) AS Studente,
    s.CodiceFiscale AS CF,
    s.Email,
    i.DataIscrizione [Data Iscrizione],
    i.Stato
FROM Studenti AS s
    INNER JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId;

-- Studenti a un corso che resttuisca + Nome Corso e Descrizione
SELECT CONCAT(s.Nome, ' ', s.Cognome) AS Studente,
    s.CodiceFiscale AS CF,
    s.Email,
    i.DataIscrizione [Data Iscrizione],
    i.Stato,
    c.NomeCorso AS [Nome del Corso],
    c.Descrizione
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId
 INNER JOIN Corsi AS c
    ON c.CorsoId = i.CorsoId
WHERE i.Stato = 'Attiva' OR i.Stato = 'Sospesa'
ORDER BY i.Stato ASC;
