DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS fournisseur;
DROP TABLE IF EXISTS bon;
DROP TABLE IF EXISTS compo;

CREATE TABLE article (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	REF VARCHAR(13),
	DESIGNATION VARCHAR(255),
	PRIX DECIMAL(7,2),
	ID_FOU INT(11)
);

CREATE TABLE fournisseur (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	NOM VARCHAR(25)
);

CREATE TABLE bon (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	NUMERO INT(11),
	DATE_CMDE DATETIME,
	DELAI INT(11),
	ID_FOU INT(11)
);

CREATE TABLE compo (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	ID_ART INT(11),
	ID_BON INT(11),
	QTE INT(11)
);

ALTER TABLE article ADD CONSTRAINT FOREIGN KEY(ID_FOU) REFERENCES fournisseur(ID);
ALTER TABLE bon ADD CONSTRAINT FOREIGN KEY(ID_FOU) REFERENCES fournisseur(ID);
ALTER TABLE compo ADD CONSTRAINT FOREIGN KEY(ID_ART) REFERENCES article(ID);
ALTER TABLE compo ADD CONSTRAINT FOREIGN KEY(ID_BON) REFERENCES bon(ID);




INSERT INTO fournisseur(NOM)
VALUES('Française d\'imports'),
('FDM SA'),
('Dubois & Fils');



INSERT INTO article(REF, DESIGNATION, PRIX, ID_FOU)
VALUES('A01', 'Perceuse P1', 74.99, 1),
('F01', 'Boulon laiton 4x40 mm (sachet de 10)', 2.25, 2),
('F02', 'Boulon laiton 5x40 mm (sachet de 10)', 4.45, 2),
('D01', 'Boulon laiton 5x40 mm (sachet de 10)', 4.40, 3),
('A02', 'Meuleuse 125mm', 37.85, 1),
('D03', 'Boulon acier zingué 4x40 (sachet de 10)', 1.8, 3),
('A03', 'Perceuse à colonne', 185.25, 1),
('D04', 'Coffret mêches à bois', 12.25, 3),
('F03', 'Coffret mêches plates', 6.25, 2),
('F04', 'Fraises d\'encastrement', 8.14, 2);


INSERT INTO bon(NUMERO, DATE_CMDE, DELAI, ID_FOU) VALUES (1001, NOW(), 3, 1);


INSERT INTO compo(ID_ART, ID_BON, QTE)
VALUES(1, 1, 3),
(5, 1, 4),
(7, 1, 1);

INSERT INTO bon (NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (1, 3, 1, '2019-02-08 09:30:00');
INSERT INTO compo (ID_ART, ID_BON, QTE) VALUES
(1, 1, 3),
(5, 1, 4),
(7, 1, 1);

INSERT INTO bon (NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (2, 5, 2, '2019-03-02 09:30:00');
INSERT INTO compo (ID_ART, ID_BON, QTE) values (2, 2, 25),
(3, 2, 15),
(9, 2, 8),
(10, 2, 11);

INSERT INTO bon (NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (3, 2, 3, '2019-04-03 17:30:00');
INSERT INTO compo (ID_ART, ID_BON, QTE) values (4, 3, 25),
(6, 3, 40),
(8, 3, 15);

INSERT INTO bon (NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (4, 2, 3, '2019-04-05 11:40:00');
INSERT INTO compo (ID_ART, ID_BON, QTE) values (4, 4, 10),
(6, 4, 15),
(8, 4, 8);

INSERT INTO bon (NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (5, 7, 2, '2019-05-15 14:45:00');
INSERT INTO compo (ID_ART, ID_BON, QTE) values (2, 5, 17),
(3, 5, 13),
(10, 5, 9);

INSERT INTO bon (NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (6, 0, 1, '2019-06-24 18:55:00');
