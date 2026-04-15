-- DROP DATABASE tienda_db

CREATE DATABASE tienda_db;

USE tienda_db;

CREATE TABLE cliente (
	dni	VARCHAR(9) NOT NULL PRIMARY KEY,
	nombre	VARCHAR(50) NOT NULL,
	apellido1	VARCHAR(50) NOT NULL,
	apellido2	VARCHAR(50),
	direccion	VARCHAR(255) NOT NULL,
	fecha_nacimiento	DATE NOT NULL,
	fecha_registro	DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE producto (
	codigo	VARCHAR(50)  NOT NULL PRIMARY KEY,
	nombre	VARCHAR(255) UNIQUE NOT NULL,
	precio_unitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE proveedor (
	nif	VARCHAR(9) NOT NULL PRIMARY KEY,
	nombre	VARCHAR(50) NOT NULL,
	direccion	VARCHAR(255) NOT NULL
);

CREATE TABLE producto_proveedor (
	id_pedido INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	fecha	DATE NOT NULL,
	nif	VARCHAR(9) NOT NULL,
	codigo	VARCHAR(50) NOT NULL,
	CONSTRAINT fk_producto_proveedor_proveedor -- NOMBRE
	FOREIGN KEY(nif) -- DENTRO DE TU TABLA
		REFERENCES proveedor(nif)-- DONDE APUNTA
	ON DELETE CASCADE,
	CONSTRAINT fk_producto_proveedor_producto FOREIGN KEY (codigo)
		REFERENCES producto(codigo)	ON DELETE CASCADE
);

CREATE TABLE compra (
	id_compra	INT	AUTO_INCREMENT PRIMARY KEY,
	fecha	DATE NOT NULL,
	codigo	VARCHAR(50) NOT NULL,
	id_cliente VARCHAR(9) NOT NULL,
	CONSTRAINT fk_compra_producto FOREIGN KEY (codigo) 
		REFERENCES producto(codigo) ON DELETE CASCADE,
	CONSTRAINT fk_compra_cliente FOREIGN KEY (id_cliente)
		REFERENCES cliente(dni)	ON DELETE CASCADE
);

INSERT INTO cliente (dni, nombre, apellido1, apellido2, direccion, fecha_nacimiento, fecha_registro) VALUES
('12345678A', 'Carlos', 'Pérez', 'López', 'Calle Mayor 12, Madrid', '1985-03-10', '2024-01-05'),
('23456789B', 'Ana', 'Gómez', 'Fernández', 'Avenida Sol 45, Barcelona', '1990-07-15', '2024-01-10'),
('34567890C', 'Luis', 'Martínez', 'Sánchez', 'Plaza Central 9, Valencia', '1988-02-20', '2024-01-12'),
('45678901D', 'Marta', 'Rodríguez', 'García', 'Calle Luna 32, Sevilla', '1995-09-25', '2024-01-15'),
('56789012E', 'Javier', 'Fernández', 'Ruiz', 'Paseo Marítimo 78, Málaga', '1992-11-30', '2024-01-18'),
('67890123F', 'Laura', 'Sánchez', 'Díaz', 'Calle Olivo 14, Zaragoza', '1991-05-12', '2024-01-20'),
('78901234G', 'Diego', 'Moreno', 'Pérez', 'Avenida del Río 56, Bilbao', '1987-08-05', '2024-01-25'),
('89012345H', 'Beatriz', 'Gutiérrez', 'López', 'Paseo del Prado 23, Granada', '1994-12-02', '2024-01-28'),
('90123456I', 'Fernando', 'Jiménez', 'Martín', 'Calle Mayor 9, Alicante', '1989-04-18', '2024-01-30'),
('01234567J', 'Elena', 'Ortega', 'González', 'Calle Nueva 15, Murcia', '1996-06-21', '2024-02-01'),
('11223344K', 'Raúl', 'Castro', 'Sanz', 'Calle Peatonal 21, Toledo', '1986-01-27', '2024-02-05'),
('22334455L', 'Patricia', 'Ruiz', 'Domínguez', 'Calle de la Rosa 77, Santander', '1993-10-10', '2024-02-08'),
('33445566M', 'Iván', 'Hernández', 'Morales', 'Calle Verde 89, Valladolid', '1990-07-15', '2024-02-12'),
('44556677N', 'Clara', 'Delgado', 'Ortiz', 'Paseo de la Estrella 33, Salamanca', '1992-09-14', '2024-02-15'),
('55667788O', 'Rubén', 'López', 'Méndez', 'Avenida Central 66, A Coruña', '1985-11-05', '2024-02-18'),
('66778899P', 'Carmen', 'Molina', 'Navas', 'Calle Ancha 20, León', '1997-05-17', '2024-02-20'),
('77889900Q', 'Sergio', 'Gil', 'García', 'Calle Larga 32, Cádiz', '1998-08-23', '2024-02-22'),
('88990011R', 'Natalia', 'Vega', 'Serrano', 'Avenida del Parque 15, Burgos', '1995-04-30', '2024-02-25'),
('99001122S', 'Adrián', 'Sanz', 'Torres', 'Plaza de España 8, Logroño', '1989-02-10', '2024-02-27'),
('00112233T', 'Isabel', 'Pardo', 'Gómez', 'Calle Real 3, Badajoz', '1991-06-28', '2024-03-01');

INSERT INTO producto (codigo, nombre, precio_unitario) VALUES
('P001', 'Laptop Lenovo', 850.00),
('P002', 'Smartphone Samsung Galaxy', 699.99),
('P003', 'Tablet Apple iPad', 499.99),
('P004', 'Monitor LG 24"', 199.99),
('P005', 'Teclado Mecánico RGB', 89.99),
('P006', 'Ratón Inalámbrico Logitech', 49.99),
('P007', 'Silla Gaming DXRacer', 249.99),
('P008', 'Disco Duro Externo 2TB', 120.00),
('P009', 'Memoria RAM 16GB', 80.00),
('P010', 'Tarjeta Gráfica RTX 3060', 450.00),
('P011', 'Auriculares Bluetooth Sony', 79.99),
('P012', 'Smartwatch Fitbit', 150.00),
('P013', 'Impresora HP', 130.00),
('P014', 'Cámara Web HD Logitech', 69.99),
('P015', 'Altavoces JBL', 99.99),
('P016', 'Micrófono Profesional', 129.99),
('P017', 'Router WiFi 6', 180.00),
('P018', 'Disco SSD 1TB', 139.99),
('P019', 'Cargador Universal', 39.99),
('P020', 'Funda para Laptop 15.6"', 25.99);

INSERT INTO proveedor (nif, nombre, direccion) VALUES
('PROV001', 'Lenovo España', 'Calle Informática 10, Madrid'),
('PROV002', 'Samsung Distribuciones', 'Avenida Tecnología 5, Barcelona'),
('PROV003', 'Apple Store España', 'Paseo de la Manzana 15, Valencia'),
('PROV004', 'LG Electronics', 'Calle Electrónica 20, Sevilla'),
('PROV005', 'Logitech Iberia', 'Calle Ratón 8, Málaga'),
('PROV006', 'DXRacer España', 'Avenida Gaming 32, Zaragoza'),
('PROV007', 'HP España', 'Calle Impresión 4, Bilbao'),
('PROV008', 'Sony España', 'Paseo del Sonido 45, Granada'),
('PROV009', 'JBL Iberia', 'Calle Música 9, Alicante'),
('PROV010', 'Kingston Spain', 'Avenida Memoria 11, Murcia');

INSERT INTO producto_proveedor (fecha, nif, codigo) VALUES
('2024-01-10', 'PROV001', 'P001'),
('2024-01-12', 'PROV002', 'P002'),
('2024-01-15', 'PROV003', 'P003'),
('2024-01-18', 'PROV004', 'P004'),
('2024-01-20', 'PROV005', 'P005'),
('2024-01-22', 'PROV006', 'P006'),
('2024-01-25', 'PROV007', 'P007'),
('2024-01-28', 'PROV008', 'P008'),
('2024-02-01', 'PROV009', 'P009'),
('2024-02-05', 'PROV010', 'P010');

INSERT INTO compra (fecha, codigo, id_cliente) VALUES
('2024-02-01', 'P001', '12345678A'),
('2024-02-02', 'P002', '23456789B'),
('2024-02-03', 'P003', '34567890C'),
('2024-02-04', 'P004', '45678901D'),
('2024-02-05', 'P005', '56789012E'),
('2024-02-06', 'P006', '67890123F'),
('2024-02-07', 'P007', '78901234G'),
('2024-02-08', 'P008', '89012345H'),
('2024-02-09', 'P009', '90123456I'),
('2024-02-10', 'P010', '01234567J');



ALTER TABLE producto
ADD CONSTRAINT	precio_positivo CHECK	(precio_unitario > 0);

SELECT * FROM cliente;
SELECT * FROM producto;
SELECT * FROM proveedor;
SELECT * FROM producto_proveedor;
SELECT * FROM compra;