DROP DATABASE IF EXISTS db_affaire;
CREATE DATABASE db_affaire;

USE db_affaire;

CREATE TABLE `client` (
  `NOCLI` int(11) NOT NULL,
  `NOMCLI` text,
  `RUECLI` text,
  `CPCLI` int(11) DEFAULT NULL,
  `VILLECLI` text,
  `CACLI` int(11) DEFAULT NULL,
  PRIMARY KEY (`NOCLI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `client` VALUES (1,'Dupont Jacques','8 Rue Des Cordeliers',13090,'Aix En Provence',56000),(2,'Dupuis Jean','Rue Du Bois Nouveau',13100,'Aix En Provence',56000),(3,'Serra Albert','5 Rue Leon Blum',13090,'Aix En Provence',56000),(4,'Danna Sidonie','Quartier Saint Jean',84130,'Le Pontet',56000),(5,'Sartous Robert','Rue De La Molle 1',13100,'Aix En Provence',56000),(6,'Texedene Jean','Rue De La Republique 1',13120,'Puyricard ',56000),(7,'Loiseau Gerard','Rue De La Grande Place',13240,'Meyreuil ',56000),(8,'Josserand Melodie','Avenue De L Europe',13090,'Aix En Provence',56000),(9,'Roubaud Aurore','Rue Max Weber',13700,'Lambesc ',56000),(10,'Tamburini Franck','Boulevard De La Liberte',13740,'Saint Cannat',56000),(11,'Poitrier Laurent','Chemin De Valcros',13800,'Aix Les Milles ',56000),(12,'Parlos Jose','Chemin De La Bigotte',13006,'Marseille',56000);

CREATE TABLE `materiel` (
  `NOMAT` int(11) NOT NULL,
  `LIBMAT` text,
  `QTEMAT` int(11) DEFAULT NULL,
  `PVMAT` int(11) DEFAULT NULL,
  PRIMARY KEY (`NOMAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `materiel` VALUES (1,'Perforateur A',25,3654),(2,'Electro Portatif',15,8975),(3,'Compresseur B',30,4658),(4,'Surpresseur',45,6000),(5,'Electro Pompe',60,2985),(6,'Groupe Electrogene',28,15685),(7,'Pompe Type H',14,4657),(8,'Marteau Piqueur',145,6189),(9,'Compresseur H',25,8000),(10,'Perforateur TTX',42,3589);

CREATE TABLE `affaire` (
  `NOAFF` int(11) NOT NULL,
  `NOCLI` int(11) NOT NULL,
  `NOMAT` int(11) NOT NULL,
  `DATAFF` text,
  `NBMAT` int(11) DEFAULT NULL,
  `NBLIV` int(11) DEFAULT NULL,
  PRIMARY KEY (`NOAFF`),
  KEY `fk_affaire_client_idx` (`NOCLI`),
  KEY `fk_affaire_materiel1_idx` (`NOMAT`),
  CONSTRAINT `fk_affaire_client` FOREIGN KEY (`NOCLI`) REFERENCES `client` (`NOCLI`),
  CONSTRAINT `fk_affaire_materiel1` FOREIGN KEY (`NOMAT`) REFERENCES `materiel` (`NOMAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `affaire` VALUES (1,1,8,'2020-09-03',50,3),(2,5,5,'2020-10-04',9,5),(3,8,5,'2020-11-05',50,9),(4,7,6,'2020-11-10',26,8),(5,1,4,'2020-12-11',40,4),(6,1,10,'2020-12-14',30,3),(7,2,7,'2021-03-06',10,1),(8,2,8,'2021-04-07',50,2),(9,1,8,'2021-03-13',30,3);

CREATE TABLE `livraison` (
  `NOBL` int(11) NOT NULL,
  `NOAFF` int(11) NOT NULL,
  `DATEXP` text,
  `DATLIV` text,
  `QTELIV` int(11) DEFAULT NULL,
  PRIMARY KEY (`NOBL`),
  KEY `fk_livraison_affaire1_idx` (`NOAFF`),
  CONSTRAINT `fk_livraison_affaire1` FOREIGN KEY (`NOAFF`) REFERENCES `affaire` (`NOAFF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `livraison` VALUES (1,3,'2011-11-16','2011-11-23',10),(2,3,'2011-11-23','2011-12-10',3),(3,4,'2011-11-24','2011-12-01',2),(4,5,'2011-12-19','2011-12-25',5),(5,7,'2012-01-13','2012-01-16',10);

-- exercices :

-- 1. Afficher la liste de tous les noms de clients avec l???adresse compl??te de leur
-- si??ge social Visualiser le r??sultat de la requ??te.

SELECT `NOMCLI`, `RUECLI`, `VILLECLI` FROM `client`;

-- 2. Afficher la liste des clients de Marseille et d'Aix en Provence.

SELECT `NOMCLI` FROM `client` WHERE `VILLECLI` = "Marseille" OR `VILLECLI` = "Aix En Provence";

-- 3. Afficher les mat??riels dont le prix est compris entre 4 000 et 15 000 ???.

SELECT `LIBMAT` FROM `materiel`;
SELECT LIBMAT FROM materiel WHERE PVMAT BETWEEN 4000 AND 15000; 

-- 4. Afficher les clients dont le nom commence par A

SELECT NOMCLI FROM `client` WHERE NOMCLI LIKE "a%";

-- 5. Afficher les clients dont le nom de famille est DUPONT ou DANNA



-- 4. Afficher les noms et adresses des clients dont le nom commence par un D ou
-- un P, tels que leur si??ge social est ?? Aix en Provence et leur chiffre d???affaires est
-- sup??rieur ou ??gal ?? 50.000 ??? et inf??rieur ?? 100.000 ???.

-- 5. Faites en sorte que les en-t??tes de colonnes du r??sultat de la requ??te
-- pr??c??dente soient explicites, par exemple : Nom du client au lieu de nomcli