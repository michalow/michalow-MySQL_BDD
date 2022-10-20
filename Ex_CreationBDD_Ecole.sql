DROP DATABASE IF EXISTS Ecole;
CREATE DATABASE Ecole;
USE Ecole;
CREATE TABLE Cours(
	id_Code varchar(50),
    NomCours varchar(50),
    Enseignant varchar(50),
    CONSTRAINT PK_Code primary key (id_Code)
);

CREATE TABLE Etudiant(
	Matricule varchar(50),
    Nom varchar(50),
    Prenom varchar(50),
    Datenaissance date,
    Niveau varchar(50),
    CONSTRAINT FK_Matricule primary key (Matricule)
    -- CONSTRAINT FK_Code foreign key (CodeCours) REFERENCES Cours(id_Code)
);

CREATE TABLE Examen(
	Matricule varchar(50),
    CodeCours varchar(50),
    Note float,
    CONSTRAINT FK_Matricule foreign key (Matricule) REFERENCES Etudiant(Matricule),
    CONSTRAINT FK_Code foreign key (CodeCours) REFERENCES Cours(id_Code),
    CONSTRAINT PK_Examen primary key (Matricule, CodeCours)
);

INSERT INTO Cours VALUES
	("1B3N", "Math", "Dupont"),
    ("2A3P", "Histoire", "Durant"),
    ("4B3P", "Biologie", "Hugot");
    
INSERT INTO Etudiant VALUES
	("11111", "Marie", "S", "1991-12-1", "Avancé"),
    ("11112", "Gaelle", "Phillipe", "1996-10-6", "Intermédiate"),
    ("11113", "George", "", "1996-10-6", "Avancé"),
    ("11114", "Claude", "P", "1996-10-6", "Intermédiate"),
    ("11115", "Stephan", "Hugot", "1996-05-20", "Débutant");

INSERT INTO Examen values
	("11111", "2A3P", 6.5),
    ("11112", "2A3P", 5),
    ("11113", "4B3P", 3.5),
    ("11114", "1B3N", 4);




