DROP DATABASE IF EXISTS Cinema;
CREATE DATABASE Cinema;
USE Cinema;

CREATE TABLE Ville(
	CodePostal int PRIMARY KEY NOT NULL,
    NomVille varchar(30) NOT NULL,
    CHECK (CodePostal like "_____") -- 5 caractères
);

CREATE TABLE Cinema(
	id_NumCinema int PRIMARY KEY,
    NomCinema varchar(100),
    RueCinema varchar(80),
    CodePostal int,
    CONSTRAINT fk_codepostal FOREIGN KEY (CodePostal) REFERENCES Ville(CodePostal) 
);

CREATE TABLE Salle(
	id_NumSalle int PRIMARY KEY,
    Capacite int,
    NumCinema int,
    CONSTRAINT fk_NumCinema FOREIGN KEY (NumCinema) REFERENCES Cinema(id_NumCinema),
CHECK(Capacite BETWEEN 30 and 100)
);

CREATE TABLE Film(
	id_NumFilm int PRIMARY KEY,
    Titre varchar(255),
    Duree int,
    Producteur varchar(80)
);

CREATE TABLE Projection(
	DateP date PRIMARY KEY,
    NbreEntree int,
    NumFilm int,
    NumSalle int,
    CONSTRAINT fk_numFilm FOREIGN KEY (NumFilm) REFERENCES Film(id_NumFilm),
    CONSTRAINT fk_numSalle FOREIGN KEY (NumSalle) REFERENCES Salle(id_NumSalle)
);

INSERT INTO Ville VALUES
(06000, "Nice"),
(75006, "Paris"),
(31000, "Toulouse");

INSERT INTO Cinema VALUES
(1, "Massena", "31 avenue Jean Médecin", 06000),
(2, "Cinématheque de Toulouse", "69 rue du Taur", 31000),
(4, "MK2 Odéon", "7 rue Hautefeuille", 75006);

INSERT INTO Salle VAlUES
(1, 55, 2),
(2, 66, 4),
(3, 34, 1),
(4, 48, 1),
(5, 70, 4),
(6, 32, 2);

INSERT INTO Film VALUES
(1,"FILM1",90,"PROD1"),
(2,"FILM2",90,"PROD2"),
(3,"FILM3",80,"PROD3"),
(4,"FILM4",70,"PROD4");

INSERT INTO Projection VALUES
(1,2,"2011-10-21",30),
(2,1,"2011-10-24",80),
(3,1,"2011-10-25",50),
(4,4,"2011-10-16",70),
(1,3,"2011-10-25",60),
(2,2,"2011-10-23",20),
(1,4,"2011-08-25",50),
(1,4,"2011-08-27",50),
(1,4,"2014-10-24",50),
(2,1,"2015-10-24",50);



	
