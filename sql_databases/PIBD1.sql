-- Tabelul Angajati
CREATE TABLE Angajati (
    id_angajat INT AUTO_INCREMENT ,
    nume VARCHAR(100) NOT NULL,
    prenume VARCHAR(100) NOT NULL,
    adresa varchar(50),
	cnp VARCHAR(13) UNIQUE NOT NULL,
    pozitie VARCHAR(50),
    departament VARCHAR(50),
	PRIMARY KEY (id_angajat)
);

-- Tabelul Review-uri
CREATE TABLE Reviewuri (
    id_review INT NOT NULL AUTO_INCREMENT,
    titlu VARCHAR(100),
    nume_reclamant VARCHAR(100) NOT NULL,
    prenume_reclamant VARCHAR(100) NOT NULL,
    detalii VARCHAR(255),
    data_review DATETIME,
    PRIMARY KEY (id_review)
);

-- Tabelul de legătură Angajati_Reviewuri (pentru relația M:N)
CREATE TABLE Centralizare (
	id INT NOT NULL AUTO_INCREMENT,
    id_angajat INT,
    id_review INT,
    PRIMARY KEY (id)
);

ALTER TABLE Centralizare
ADD CONSTRAINT fk_angajat1 FOREIGN KEY (id_angajat) REFERENCES Angajati(id_angajat) ON DELETE CASCADE;
ALTER TABLE Centralizare
ADD CONSTRAINT fk_angajat2 FOREIGN KEY (id_review) REFERENCES Reviewuri(id_review) ON DELETE CASCADE;

select * from Angajati;
select * from Reviewuri;
select * from Centralizare;

INSERT INTO Angajati ( nume, prenume,adresa,cnp, pozitie, departament) VALUES ( 'Popescu', 'Ion','Olt','6030903384599', 'director','Securitate/Paza');
insert into Centralizare (id_angajat, id_review) values (2,2);
INSERT INTO Angajati ( nume, prenume,adresa,cnp, pozitie, departament) VALUES ( 'Ionescu', 'Adrian','Constanta','6030903384899', 'administrator','Securitate/Paza');

DROP TABLE IF EXISTS Centralizare;
DROP TABLE IF EXISTS Angajati;
DROP TABLE IF EXISTS Reviewuri;