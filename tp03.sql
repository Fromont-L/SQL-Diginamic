-- a. Lister toutes les données concernants les articles
SELECT * FROM article;

-- b. Lister uniquement les références et désignations des articles de plus de 2€
SELECT REF AS ref, DESIGNATION AS designation FROM article WHERE PRIX < 2;

-- c.
SELECT * FROM article WHERE PRIX >= 2 AND PRIX <= 6.25;

-- d.
SELECT * FROM article WHERE PRIX BETWEEN 2 AND 6.25;

-- e.
SELECT *
FROM article
WHERE ID_FOU = 1
AND PRIX NOT BETWEEN 2 AND 6.25
ORDER BY PRIX DESC;

-- f.
SELECT *
FROM article WHERE ID_FOU IN (1,3);

-- g.
SELECT *
FROM article WHERE ID_FOU NOT IN (1,3);

-- h.
SELECT * FROM bon WHERE DATE_CMDE BETWEEN '2019-02-01' AND '2019-04-30';