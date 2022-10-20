-- Création d"une base de données
DROP DATABASE IF EXISTS ecole;
CREATE DATABASE ecole;

-- Utilisation d"une bdd
USE ecole;

CREATE TABLE ETUDIANT (
Matricule varchar(50) PRIMARY KEY,
Nom varchar(50),
Prenom varchar(50),
DateNaissance date,
Niveau varchar(50)
);

CREATE TABLE COURS (
Code varchar(50) PRIMARY KEY,
NomCours varchar(50),
Enseignant varchar(50)
);

CREATE TABLE EXAMEN (
Matricule varchar(50),
Code varchar(50),
Note Float,
FOREIGN KEY (Matricule) REFERENCES ETUDIANT(Matricule),
FOREIGN KEY (Code) REFERENCES COURS(Code),
CONSTRAINT PK_EXAMEN PRIMARY KEY (Matricule, Code));

INSERT INTO ETUDIANT VALUES 
('e1','NOM1','PRENOM1','1998-12-12','M1'),
('e2','NOM2','PRENOM2','1998-12-12','M2'),
('e3','NOM3','PRENOM3','1998-12-12','M3'),
('e4','NOM4','PRENOM4','1998-12-12','M2'),
('e5','NOM5','PRENOM5','1998-12-12','M2');

INSERT INTO COURS VALUES 
('c1','MAT1','PROF1'),
('c2','MAT2','PROF2'),
('c3','MAT3','PROF3'),
('c4','MAT4','PROF4'),
('c5','MAT5','PROF5');

INSERT INTO EXAMEN VALUES 
('e1','c5',15.8),
('e2','c4',17),
('e3','c3',12),
('e4','c2',8),
('e1','c1',19),
('e5','c3',12),
('e4','c4',8),
('e5','c1',13);

-- 1.Afficher la liste des étudiants triés par ordre croissant de date de naissance.
SELECT *
FROM Etudiant
ORDER BY DateNaissance;

-- 2.Afficher tous les étudiants inscrits à M1 et tous les étudiants inscrits à M2.
SELECT *
FROM Etudiant
WHERE Niveau='M1' OR Niveau='M2';

-- 3.Afficher les matricules des étudiants qui ont passé l'examen du cours c2.
SELECT Matricule
FROM Examen
WHERE Code='c2';

-- 4.Afficher les matricules de tous les étudiants qui ont passé l'examen du cours c1 
-- et de tousles étudiants qui ont passé l'examen du cours c2.
SELECT Matricule
FROM Examen
WHERE Code='c1' OR Code='c2';

-- 5.Afficher le matricule, code, note /20 et note /40 de tous les examens 
-- classés par ordre croissant de matricule et de code.
SELECT Matricule, Code, Note AS "Note sur 20", ROUND(Note * 2, 1) AS "Note sur 40"
FROM Examen
ORDER BY Matricule, Code;

-- 6.Trouver la moyenne de notes de cours c2.
SELECT AVG(Note) AS "Moyenne de notes"
FROM Examen
WHERE Code='c2';

-- 7.Compter les examens passés par un étudiant (exemple avec matricule 'e1')
SELECT COUNT(*) AS "Nombre d'examens"
FROM Examen
WHERE Matricule='e1';

-- 8.Compter le nombre d'étudiants qui ont passé l'examen du cours c2
SELECT COUNT(*) AS "Nombre d'étudiants"
FROM Examen
WHERE Code='c2';

-- 9.Calculer la moyenne des notes d'un étudiant (exemple avec matricule 'e1').
SELECT AVG(Note) AS "Moyenne de notes"
FROM Examen
WHERE Matricule='e1';

-- 10.Compter les examens passés par chaque étudiant.
SELECT Matricule,COUNT(Code) AS "Nombre d'examens"
FROM Examen
GROUP BY Matricule;

-- 11.Calculer la moyenne des notes pour chaque étudiant.
SELECT Matricule,AVG(Note) AS "Moyenne de notes"
FROM Examen
GROUP BY Matricule;

-- 12.La même au dessus, mais afficher seulement les étudiants (et leurs moyennes) dont lamoyenne est >= 15.
SELECT Matricule,AVG(Note) AS "Moyenne de notes"
FROM Examen
GROUP BY Matricule
HAVING AVG(Note)>=15;

-- 13.Trouver la moyenne de notes de chaque cours.
SELECT Code, ROUND(AVG(Note), 1) AS "Moyenne de notes"
FROM Examen
GROUP BY Code;

SELECT c.NomCours, c.Enseignant, etu.Nom, etu.Prenom, ex.Note
FROM cours c
INNER JOIN examen ex ON c.Code = ex.Code 
INNER JOIN etudiant etu ON ex.Matricule = etu.Matricule;

SELECT c.NomCours, c.Enseignant, etu.Nom, etu.Prenom, ex.Note
FROM cours c, examen ex, etudiant etu
WHERE c.Code = ex.Code AND ex.Matricule = etu.Matricule;


