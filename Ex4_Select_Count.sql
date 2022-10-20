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

SELECT * FROM etudiant ORDER BY DateNaissance;

-- 2.Afficher tous les étudiants inscrits à M1 et tous les étudiants inscrits à M2.

SELECT * FROM etudiant WHERE Niveau = "M1" OR Niveau = "M2";

-- 3.Afficher les matricules des étudiants qui ont passé l'examen du cours c2.

SELECT matricule FROM examen WHERE code = "c2";

-- 4.Afficher les matricules de tous les étudiants qui ont passé l'examen du cours c1 et de tous les étudiants qui ont passé l'examen du cours c2.

SELECT matricule FROM examen WHERE code = "c1" OR code = "c2";

-- 5.Afficher le matricule, code, note /20 et note /40 de tous les examens classés par ordre croissant de matricule et de code.

SELECT matricule, code, note, concat(note, "/20") as note_sur_20, concat(note, "/40") as note_sur_40 
FROM examen ORDER BY matricule AND code; 

-- 6.Trouver la moyenne de notes de cours c2.

SELECT code, AVG(note) FROM examen WHERE code = "c1";

-- 7.Compter les examens passés par un étudiant (exemple avec matricule 'e1')

SELECT matricule, COUNT(matricule) as nb_examens FROM examen where matricule = "e2";

-- 8.Compter le nombre d'étudiants qui ont passé l'examen du cours c2

SELECT *, COUNT(matricule) as nb_etudiants FROM examen WHERE code = "c3";

-- 9.Calculer la moyenne des notes d'un étudiant (exemple avec matricule 'e1').

SELECT matricule, ROUND(AVG(note)) AS Note_moyenne FROM examen WHERE matricule = 'e1';

-- 10.Compter les examens passés par chaque étudiant.

SELECT *, COUNT(matricule) as nb_examen FROM examen GROUP BY matricule;

-- 11.Calculer la moyenne des notes pour chaque étudiant.

SELECT *, ROUND(AVG(note)) as note_moyenne FROM examen GROUP BY matricule;

-- 12.La même au dessus, mais afficher seulement les étudiants (et leurs moyennes) dont lamoyenne est >= 15.

SELECT *, ROUND(AVG(note)) as note_moyenne FROM examen GROUP BY matricule HAVING note >= 15;

-- 13.Trouver la moyenne de notes de chaque cours.

SELECT code, AVG(note) as note_moyenne FROM examen GROUP BY code;