CREATE DATABASE concesionario_db;

USE concesionario_db;

CREATE TABLE revision (
    codigo_revision INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cambio_filtro BOOLEAN NOT NULL DEFAULT FALSE,
    cambio_aceite BOOLEAN NOT NULL DEFAULT FALSE,
    cambio_frenos BOOLEAN NOT NULL DEFAULT FALSE,
    fecha DATE NOT NULL DEFAULT (CURRENT_DATE),
    observaciones VARCHAR(255),
    coche INT NOT NULL,
    CONSTRAINT fk_coche_revision FOREIGN KEY (coche)
        REFERENCES coche(id_coche) ON DELETE SET NULL
);

CREATE TABLE coche (
    id_coche INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    revision INT DEFAULT NULL,
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    direccion VARCHAR(255) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE)
);

CREATE TABLE venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_coche INT NOT NULL,
    fecha_venta DATE NOT NULL DEFAULT (CURRENT_DATE),
    precio_final DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    CONSTRAINT fk_venta_coche FOREIGN KEY (id_coche)
        REFERENCES coche(id_coche) ON DELETE CASCADE
);

INSERT INTO revision (cambio_filtro, cambio_aceite, cambio_frenos, fecha, observaciones) VALUES
(TRUE, TRUE, FALSE, '2024-01-10', 'Cambio de aceite y filtro'),
(FALSE, FALSE, TRUE, '2024-01-15', 'Revisión de frenos'),
(TRUE, FALSE, FALSE, '2024-01-20', 'Cambio de filtro de aire'),
(TRUE, TRUE, TRUE, '2024-01-25', 'Mantenimiento completo'),
(FALSE, TRUE, FALSE, '2024-02-01', 'Cambio de aceite'),
(TRUE, FALSE, TRUE, '2024-02-05', 'Filtro y frenos revisados'),
(FALSE, FALSE, FALSE, '2024-02-10', 'Inspección sin cambios'),
(TRUE, TRUE, FALSE, '2024-02-15', 'Cambio de aceite y filtro'),
(FALSE, TRUE, TRUE, '2024-02-20', 'Cambio de aceite y frenos'),
(TRUE, FALSE, FALSE, '2024-02-25', 'Filtro de aire cambiado');

INSERT INTO coche (matricula, marca, modelo, color, precio_venta, revision) VALUES
('1234ABC', 'Toyota', 'Corolla', 'Rojo', 18000.00, 1),
('5678DEF', 'Honda', 'Civic', 'Azul', 19000.00, 2),
('9101GHI', 'Ford', 'Focus', 'Negro', 17000.00, 3),
('1213JKL', 'BMW', 'Serie 3', 'Blanco', 25000.00, NULL),
('1415MNO', 'Audi', 'A4', 'Gris', 27000.00, 4),
('1617PQR', 'Mercedes', 'Clase C', 'Negro', 30000.00, NULL),
('1819STU', 'Volkswagen', 'Golf', 'Verde', 20000.00, 5),
('2021VWX', 'Nissan', 'Qashqai', 'Azul', 22000.00, 6),
('2223YZA', 'Hyundai', 'Tucson', 'Blanco', 24000.00, 7),
('2425BCD', 'Kia', 'Sportage', 'Rojo', 23000.00, NULL),
('2627EFG', 'Mazda', 'CX-5', 'Azul', 26000.00, 8),
('2829HIJ', 'Peugeot', '308', 'Negro', 21000.00, 9),
('3031KLM', 'Renault', 'Megane', 'Gris', 20000.00, NULL),
('3233NOP', 'Seat', 'León', 'Rojo', 22000.00, 10),
('3435QRS', 'Citroën', 'C4', 'Azul', 19000.00, 1),
('3637TUV', 'Opel', 'Astra', 'Verde', 18000.00, 2),
('3839WXY', 'Skoda', 'Octavia', 'Blanco', 25000.00, 3),
('4041ZAB', 'Volvo', 'XC60', 'Negro', 35000.00, NULL),
('4243CDE', 'Tesla', 'Model 3', 'Gris', 45000.00, 4),
('4445FGH', 'Fiat', '500', 'Rojo', 16000.00, NULL);

INSERT INTO cliente (nif, nombre, apellido1, apellido2, direccion, ciudad, telefono, fecha_registro) VALUES
('12345678A', 'Carlos', 'Pérez', 'Gómez', 'Calle Mayor 1', 'Madrid', '612345678', '2023-12-10'),
('23456789B', 'María', 'López', 'Fernández', 'Avenida Central 5', 'Barcelona', '623456789', '2023-12-15'),
('34567890C', 'Juan', 'Martínez', 'Ruiz', 'Calle del Sol 8', 'Valencia', '634567890', '2023-12-20'),
('45678901D', 'Ana', 'García', 'Sánchez', 'Plaza Nueva 3', 'Sevilla', '645678901', '2023-12-25'),
('56789012E', 'Pedro', 'Hernández', 'Díaz', 'Paseo del Prado 12', 'Bilbao', '656789012', '2024-01-05'),
('67890123F', 'Lucía', 'Torres', 'Moreno', 'Gran Vía 7', 'Zaragoza', '667890123', '2024-01-10'),
('78901234G', 'David', 'Jiménez', 'Álvarez', 'Calle Libertad 14', 'Málaga', '678901234', '2024-01-15'),
('89012345H', 'Elena', 'Molina', 'Ortiz', 'Avenida del Mar 6', 'Murcia', '689012345', '2024-01-20'),
('90123456I', 'Sergio', 'Ramírez', 'Castro', 'Calle San Juan 9', 'Granada', '690123456', '2024-01-25'),
('01234567J', 'Paula', 'Navarro', 'Romero', 'Ronda Norte 4', 'Valladolid', '601234567', '2024-02-01'),
('11223344K', 'Raúl', 'Pardo', 'Serrano', 'Avenida de España 11', 'Salamanca', '611223344', '2024-02-05'),
('22334455L', 'Clara', 'Domínguez', 'Medina', 'Calle Alhambra 2', 'Toledo', '622334455', '2024-02-10'),
('33445566M', 'Jorge', 'Santos', 'Giménez', 'Plaza Mayor 10', 'León', '633445566', '2024-02-15'),
('44556677N', 'Beatriz', 'Crespo', 'Iglesias', 'Calle del Río 15', 'Santander', '644556677', '2024-02-20'),
('55667788O', 'Fernando', 'Vega', 'Reyes', 'Avenida Andalucía 20', 'Cádiz', '655667788', '2024-02-25');

INSERT INTO venta (id_cliente, id_coche, fecha_venta, precio_final) VALUES
(1, 1, '2024-02-01', 17500.00),
(1, 2, '2024-02-02', 18500.00),
(1, 3, '2024-02-03', 19500.00),
(2, 4, '2024-02-05', 26500.00),
(2, 5, '2024-02-06', 27500.00),
(3, 6, '2024-02-08', 30000.00),
(4, 7, '2024-02-10', 19000.00),
(5, 8, '2024-02-12', 21500.00),
(6, 9, '2024-02-15', 23500.00),
(7, 10, '2024-02-18', 24500.00);

-- DROP DATABASE concesionario_db;