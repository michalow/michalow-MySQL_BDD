Use poec_asr;

-- Selectionne les personnes dont le nom de la ville contient le caractère a
SELECT *
FROM personne
WHERE ville like '%a%';

-- Selectionne les personnes dont le nom de la ville commence par le caractère p
SELECT *
FROM personne
WHERE ville like 'p%';

-- Selectionne les personnes dont le nom de la ville finit par le caractère s
SELECT *
FROM personne
WHERE ville like '%s';

-- Selectionne les personnes dont le cinquieme caractère est un d
SELECT *
FROM personne
WHERE nom like '____d%';