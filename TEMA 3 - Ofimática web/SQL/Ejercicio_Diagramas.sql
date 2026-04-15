CREATE DATABASE animales

CREATE TABLE animales.pajaros (
id	DECIMAL PRIMARY KEY,
color	CHAR NOT NULL,
tamano	NUMERIC NOT NULL,
peso	NUMERIC,
nombre	VARCHAR(15),
raza	VARCHAR(15)
);

INSERT INTO animales.pajaros VALUES (1,'R',19,5,'Putirrojo','Pancho');
INSERT INTO animales.pajaros VALUES (2,'A',9,4,'Pavirrojo','Chicano');


SELECT * FROM animales.pajaros p ;

DROP DATABASE animales

