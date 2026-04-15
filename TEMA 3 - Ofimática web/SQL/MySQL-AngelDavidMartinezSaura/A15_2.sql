-- DROP DATABASE transporte_db;

CREATE DATABASE transporte_db;

USE transporte_db;

CREATE TABLE provincia (
	provincia VARCHAR(50) NOT NULL PRIMARY KEY,
	nombre	VARCHAR(50)	NOT NULL
);

CREATE TABLE paquete (
	codigo_paquete	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	descripcion	VARCHAR(255) NOT NULL,
	destinatario VARCHAR(255) NOT NULL,
	direccion	VARCHAR(255) NOT NULL
);

CREATE TABLE camion (
	matricula	VARCHAR(10) NOT NULL PRIMARY KEY,
	modelo	VARCHAR(50) NOT NULL,
	tipo	VARCHAR(50) NOT NULL,
	potencia	VARCHAR(10) NOT NULL	
);

CREATE TABLE camionero (
	dni	VARCHAR(9) NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50),
	telefono	VARCHAR(9) NOT NULL,
	direccion	VARCHAR(255) NOT NULL,
	poblacion	VARCHAR(50) NOT NULL,
	salario	DECIMAL(10, 2) NOT NULL,
	fecha_registro	DATE DEFAULT (CURRENT_DATE) NOT NULL
);

CREATE TABLE asignacion (
	n_asignacion	INT	AUTO_INCREMENT PRIMARY KEY NOT NULL,
	camionero	VARCHAR(9) NOT NULL,
	matricula	VARCHAR(10) NOT NULL,
	CONSTRAINT fk_camionero_asignacion	FOREIGN KEY (camionero)
		REFERENCES camionero(dni) ON DELETE CASCADE,
	CONSTRAINT fk_camion_asignacion	FOREIGN KEY (matricula)
		REFERENCES camion(matricula) ON DELETE CASCADE
);


CREATE TABLE envio (
	numero_envio	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	asignacion	INT NOT NULL,
	paquete	INT NOT NULL,
	codigo_provincia	VARCHAR(50) NOT NULL,
	CONSTRAINT fk_provincia_envio	FOREIGN KEY (codigo_provincia)
		REFERENCES	provincia(provincia) ON DELETE CASCADE,
	CONSTRAINT fk_paquete_envio	FOREIGN KEY (paquete)
		REFERENCES	paquete(codigo_paquete)	ON DELETE CASCADE
	CONSTRAINT fk_asignacion_envio	FOREIGN KEY (asignacion)
		REFERENCES	asignacion(n_asignacion)	ON DELETE CASCADE
);

INSERT INTO provincia (provincia, nombre) VALUES
('M', 'Madrid'),
('B', 'Barcelona'),
('SE', 'Sevilla'),
('VA', 'Valencia'),
('BI', 'Bilbao');

INSERT INTO paquete (descripcion, destinatario, direccion) VALUES
('Electrónicos frágiles', 'Juan Pérez', 'Calle Mayor 12, Madrid'),
('Ropa y accesorios', 'María Gómez', 'Avenida Diagonal 45, Barcelona'),
('Libros y papelería', 'Pedro Sánchez', 'Calle Feria 23, Sevilla'),
('Repuestos automotrices', 'Lucía Fernández', 'Plaza Ayuntamiento 7, Valencia'),
('Juguetes infantiles', 'Carlos Ruiz', 'Calle Gran Vía 55, Bilbao');

INSERT INTO camion (matricula, modelo, tipo, potencia) VALUES
('1234ABC', 'Volvo FH16', 'Trailer', '550 CV'),
('5678DEF', 'Scania R450', 'Camión rígido', '450 CV'),
('9101GHI', 'Mercedes Actros', 'Trailer', '510 CV'),
('1121JKL', 'DAF XF', 'Camión rígido', '480 CV'),
('3141MNO', 'Iveco S-Way', 'Trailer', '530 CV');

INSERT INTO camionero (dni, nombre, apellido1, apellido2, telefono, direccion, poblacion, salario, fecha_registro) VALUES
('12345678A', 'Antonio', 'López', 'Martínez', '600123456', 'Calle A, 10', 'Madrid', 2500.00, CURRENT_DATE),
('23456789B', 'Javier', 'García', 'Fernández', '601234567', 'Calle B, 20', 'Barcelona', 2600.00, CURRENT_DATE),
('34567890C', 'Luis', 'Pérez', 'Gómez', '602345678', 'Calle C, 30', 'Sevilla', 2550.00, CURRENT_DATE),
('45678901D', 'Manuel', 'Ruiz', 'Sánchez', '603456789', 'Calle D, 40', 'Valencia', 2700.00, CURRENT_DATE),
('56789012E', 'Raúl', 'Fernández', 'López', '604567890', 'Calle E, 50', 'Bilbao', 2650.00, CURRENT_DATE);

INSERT INTO asignacion (camionero, matricula) VALUES
('12345678A', '1234ABC'),
('23456789B', '5678DEF'),
('34567890C', '9101GHI'),
('45678901D', '1121JKL'),
('56789012E', '3141MNO');

INSERT INTO envio (asignacion, paquete, codigo_provincia) VALUES
(1, 1, 'M'),
(2, 2, 'B'),
(3, 3, 'SE'),
(4, 4, 'VA'),
(5, 5, 'BI');



-- DROP TABLE camionero;
-- DROP TABLE camion;
-- DROP TABLE asignacion;
-- DESCRIBE asignacion;