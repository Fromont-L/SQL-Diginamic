-- a. Listez les articles dans l'ordre alphabétique des désignations
SELECT * FROM article ORDER BY DESIGNATION ASC;

-- b. Listez les articles dans l'ordre des prix du plus élevé au moins élevé
SELECT * FROM article ORDER BY PRIX DESC;

-- c. Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix ascendant
SELECT * FROM article WHERE DESIGNATION LIKE '%boulon%' ORDER BY PRIX ASC;

-- d. Listez tous les articles dont la désignation contient le mot « sachet ».
SELECT * FROM article WHERE DESIGNATION LIKE '%sachet%';

-- e. Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !
SELECT * FROM article WHERE LOWER(DESIGNATION) LIKE '%SaChEt%';

-- f. Listez les articles avec les informations fournisseur correspondantes. Les résultats doivent être triées dans l'ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.
SELECT *, fournisseur.NOM AS fournisseur
FROM article
LEFT JOIN fournisseur ON article.ID_FOU = fournisseur.ID
ORDER BY fournisseur.NOM ASC, article.PRIX DESC;

-- g. Listez les articles de la société « Dubois & Fils »
SELECT * 
FROM article
JOIN fournisseur ON article.ID_FOU = fournisseur.ID 
WHERE fournisseur.NOM = 'Dubois & Fils';

-- h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »
SELECT AVG(article.PRIX) AS moyenne_prix 
FROM article JOIN fournisseur 
ON article.ID_FOU = fournisseur.ID 
WHERE fournisseur.NOM = 'Dubois & Fils';

-- i. Calculez la moyenne des prix des articles de chaque fournisseur
SELECT fournisseur.NOM, AVG(article.PRIX) AS moyenne_prix 
FROM article 
JOIN fournisseur ON article.ID_FOU = fournisseur.ID 
GROUP BY fournisseur.ID;

-- j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.
SELECT * FROM bon WHERE DATE_CMDE BETWEEN '2019-03-01' AND '2019-04-05 12:00:00';

-- k. Sélectionnez les divers bons de commande qui contiennent des boulons
SELECT DISTINCT bon.numero 
FROM bon 
JOIN compo ON bon.ID = compo.ID_BON
JOIN article ON compo.ID_ART = article.ID
WHERE article.DESIGNATION LIKE '%boulon%';

-- l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.
SELECT * 
FROM bon 
JOIN compo ON bon.ID = compo.ID_BON 
JOIN article ON compo.ID_ART = article.ID
JOIN fournisseur ON bon.ID_FOU = fournisseur.ID
WHERE article.DESIGNATION LIKE '%boulon%';

-- m. Calculez le prix total de chaque bon de commande
SELECT bon.NUMERO, SUM(article.PRIX * compo.QTE) AS total
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
JOIN article ON compo.ID_ART = article.ID
GROUP BY bon.ID;

-- n. Comptez le nombre d'articles de chaque bon de commande
SELECT bon.NUMERO, SUM(compo.QTE) AS somme
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
GROUP BY bon.ID;

-- o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d'articles de chacun de ces bons de commande
SELECT bon.NUMERO, SUM(compo.QTE) AS total_articles
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
GROUP BY bon.ID
HAVING total_articles > 25;

-- p. Calculez le coût total des commandes effectuées sur le mois d'avril
SELECT SUM(article.PRIX * compo.QTE) AS total_avril
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
JOIN article ON compo.ID_ART = article.ID
WHERE MONTH(DATE_CMDE) = 4;
