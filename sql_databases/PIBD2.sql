INSERT INTO Reviewuri (titlu, nume_reclamant, prenume_reclamant, detalii, data_review) 
VALUES ('Feedback Pozitiv', 'Ilie', 'Daniela', 'Serviciul a fost excelent.', '2025-01-23 16:20:00');

INSERT INTO Angajati (nume, prenume, adresa, cnp, pozitie, departament) 
VALUES ('Popescu', 'Ion', 'Olt', '6030903384599', 'Director', 'Securitate/Paza');

INSERT INTO Angajati (nume, prenume, adresa, cnp, pozitie, departament) 
VALUES ('Ionescu', 'Adrian', 'Constanța', '6030903384889', 'Administrator', 'Securitate/Paza');

INSERT INTO Angajati (nume, prenume, adresa, cnp, pozitie, departament) 
VALUES ('Georgescu', 'Maria', 'București', '6030903384788', 'Manager', 'IT');

INSERT INTO Angajati (nume, prenume, adresa, cnp, pozitie, departament) 
VALUES ('Dumitrescu', 'Ana', 'Cluj-Napoca', '6030903384677', 'Contabil', 'Financiar');

INSERT INTO Angajati (nume, prenume, adresa, cnp, pozitie, departament) 
VALUES ('Vasilescu', 'Cristian', 'Iași', '6030903384566', 'Inginer', 'Tehnic');

INSERT INTO Reviewuri (titlu, nume_reclamant, prenume_reclamant, detalii, data_review) 
VALUES ('Calitate Servicii', 'Marin', 'Andrei', 'Am fost impresionat de promptitudine.', '2025-01-25 10:00:00');

INSERT INTO Reviewuri (titlu, nume_reclamant, prenume_reclamant, detalii, data_review) 
VALUES ('Întârziere', 'Popa', 'Ioana', 'Livrarea a întârziat cu o zi.', '2025-01-24 09:15:00');

INSERT INTO Reviewuri (titlu, nume_reclamant, prenume_reclamant, detalii, data_review) 
VALUES ('Profesionalism', 'Radu', 'Cristian', 'Personalul a fost foarte amabil.', '2025-01-20 14:30:00');

INSERT INTO Reviewuri (titlu, nume_reclamant, prenume_reclamant, detalii, data_review) 
VALUES ('Probleme Tehnice', 'Dima', 'Mihai', 'Aplicația a avut erori repetate.', '2025-01-22 11:45:00');

select * from centralizari;
select * from angajati;
DROP TABLE IF EXISTS centralizare;