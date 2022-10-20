-- Script SQL

-- Langage de definition de données

-- Creation d'un base de données
DROP DATABASE IF EXISTS poec_asr;
CREATE DATABASE poec_asr;

-- Utilisation d'une db
USE poec_asr;

-- Création de la table person, avec la declaration de la colonne id en tant que cle primaire
-- Une clé primaire identifie un ensemble de colonnes
CREATE TABLE personne(
	id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(45) NOT NULL,
    prenom varchar(45) NOT NULL,
    age int,
    salaire int,
	ville varchar(45) DEFAULT 'Nice',
    CHECK(age < 150)
);

CREATE TABLE voiture(
	immatriculation int PRIMARY KEY AUTO_INCREMENT,
    marque varchar(45),
    modele varchar(45),
    annee int,
    id_personne int,
    FOREIGN KEY (id_personne) REFERENCES personne(id)
);

-- Pour supprimer une table
-- DROP TABLE voiture;

-- DROP TABLE personne;

CREATE TABLE employe(
	cni char(6),
    prenom char(20),
    nom char(20),
    CONSTRAINT pk_employe PRIMARY KEY (prenom, nom)
);

ALTER TABLE employe 
DROP PRIMARY KEY;

ALTER TABLE employe 
ADD CONSTRAINT pk_employe PRIMARY KEY (cni);

ALTER TABLE employe 
MODIFY COLUMN nom varchar(45) NOT NULL;

-- Langage de manipulation de donnees

-- Inserer une valeur pour chaque colonne
INSERT INTO personne VALUES
(1, "Wick", "John", 30, 2000, "Nice"),
(2, "Doe", "Bob", 40, 1500, "Paris"),
(3, "Wayne", "John", 30, 2000, "Marseille"),
(4, "Benzema", "Karim", 33, 20000, "Lyon");

-- Dans cet exemple, nous precisons les colonnes -> utile pour l'auto-increment
INSERT INTO personne(nom, prenom, age, salaire, ville) VALUE ("Cooper", "John", 45, 2000, "New-York");

INSERT INTO personne(nom, prenom) VALUE ("Dupont", "Henri");

INSERT INTO personne SET nom = "Dupond", prenom = "Jean", age = 30, salaire = 2000;

-- Langage d'interrogation de données

-- Une requète SQL de lecture est composée d'au moins deux clauses :

-- SELECT : selectionner les colonnes
-- FROM : cibler la table concerné

-- WHERE : Déclarer une condition
-- ....

-- Selectionne toutes les données de la table personne
SELECT * FROM personne;

-- Selectionne les colonnes nom et prenom de la table personne
SELECT nom, prenom
FROM personne;

-- Selectionne la colonne ville de la table personne
SELECT ville
FROM personne;

-- Supprime les doublons
SELECT distinct(ville)
FROM personne;

-- Compte le nombre de ville dans la table personne
-- La fonction d'aggrégation COUNT() permet de compter les nombre 
-- d'enregistrements, ici le nombre de villes distinctes dans la table personne
SELECT COUNT(distinct(ville)) AS nombre_ville
FROM personne;

-- Selectionne toutes les personnes dont la ville est Marseille
SELECT * 
FROM personne
WHERE ville = 'Marseille';

-- Opérateurs logiques :
-- AND
-- OR
-- !

-- Ecrire une requete SQL qui permet de selectionner les personnes qui
-- habitent Marseille ou Nice.

SELECT nom, prenom, ville FROM personne WHERE ville = 'Marseille' OR ville = 'Nice';

-- Ecrire une requete SQL qui permet de selectionner les personnes dont
-- le salaire est compris entre 2000 et 3000.

SELECT nom, prenom, salaire FROM personne WHERE salaire between 2000 and 3000; -- between n'inclue pas AND salaire < 3000;

-- Ecrire une requete SQL qui permet de selectionner les personnes qui
-- habitent Marseille et dont le salaire est soit inferieur ou egal a 2000 soit
-- superieur ou egal a 2500.

SELECT nom, prenom, ville, salaire FROM personne 
WHERE (ville = 'Marseille') and (salaire <= 2000 or salaire >= 2500);
-- NOT Between 2001 and 2499 comme ça il prend 2000 et 2500
-- WHERE (ville = 'Marseille') and (salaire < 2000 or salaire = 2000 or salaire > 2500 or salaire > 2500);
