-- DROP DATABASE IF EXISTS instituto_db;

CREATE DATABASE instituto_db;

USE instituto_db;

CREATE TABLE grupo (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    delegado INT UNIQUE,
    CONSTRAINT fk_grupo_delegado FOREIGN KEY (delegado)
        REFERENCES alumno(n_expediente) ON DELETE SET NULL
);

CREATE TABLE alumno (
    n_expediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    f_nacimiento DATE NOT NULL,
    grupo INT DEFAULT NULL,
    fecha_registro DATE DEFAULT (CURRENT_DATE) NOT NULL,
    CONSTRAINT fk_alumno_grupo FOREIGN KEY (grupo)
        REFERENCES grupo(id_grupo) ON DELETE SET NULL
);

CREATE TABLE profesor (
    dni VARCHAR(9) NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(9),
    fecha_registro DATE DEFAULT (CURRENT_DATE) NOT NULL
);

CREATE TABLE modulo (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    dni_profesor VARCHAR(9) NOT NULL,
    CONSTRAINT fk_profesor_modulo FOREIGN KEY (dni_profesor)
        REFERENCES profesor(dni) ON DELETE CASCADE
);

CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    n_expediente INT NOT NULL,
    codigo_modulo INT NOT NULL,
    CONSTRAINT fk_alumno_matricula FOREIGN KEY (n_expediente)
        REFERENCES alumno(n_expediente) ON DELETE CASCADE,
    CONSTRAINT fk_modulo_matricula FOREIGN KEY (codigo_modulo)
        REFERENCES modulo(codigo) ON DELETE CASCADE
);

-- ===========================
--  INSERCIÓN DE GRUPOS
-- ===========================
INSERT INTO grupo (id_grupo) VALUES
(1), (2), (3), (4), (5);

-- ===========================
--  INSERCIÓN DE ALUMNOS
-- ===========================
INSERT INTO alumno (n_expediente, nombre, apellido1, apellido2, f_nacimiento, grupo, fecha_registro) VALUES
(1001, 'Carlos', 'García', 'López', '2005-03-12', 1, '2024-02-06'),
(1002, 'Laura', 'Fernández', NULL, '2004-11-22', 1, '2024-02-06'),
(1003, 'Miguel', 'Pérez', 'Ruiz', '2006-07-08', 2, '2024-02-06'),
(1004, 'Sara', 'Martínez', 'Sánchez', '2005-05-17', 2, '2024-02-06'),
(1005, 'David', 'Gómez', NULL, '2006-01-30', 3, '2024-02-06'),
(1006, 'Ana', 'Santos', 'Romero', '2005-06-14', 3, '2024-02-06'),
(1007, 'Jorge', 'López', 'Fernández', '2004-08-29', 4, '2024-02-06'),
(1008, 'Elena', 'Ruiz', 'Navarro', '2006-12-01', 4, '2024-02-06'),
(1009, 'Iván', 'Hernández', NULL, '2005-10-05', 5, '2024-02-06'),
(1010, 'Paula', 'Méndez', 'Torres', '2006-09-15', 5, '2024-02-06'),
(1011, 'Luis', 'Ortiz', 'Delgado', '2005-07-20', 1, '2024-02-06'),
(1012, 'Silvia', 'Díaz', NULL, '2006-04-18', 2, '2024-02-06'),
(1013, 'Marcos', 'Jiménez', 'Soler', '2005-11-25', 3, '2024-02-06'),
(1014, 'Clara', 'Morales', 'Gil', '2006-02-28', 4, '2024-02-06'),
(1015, 'Adrián', 'Reyes', NULL, '2004-06-09', 5, '2024-02-06'),
(1016, 'Beatriz', 'Castro', 'Vega', '2005-09-14', 1, '2024-02-06'),
(1017, 'Raúl', 'Serrano', 'Cruz', '2006-03-05', 2, '2024-02-06'),
(1018, 'Isabel', 'Román', NULL, '2005-08-07', 3, '2024-02-06'),
(1019, 'Fernando', 'Ramos', 'Nieto', '2006-01-12', 4, '2024-02-06'),
(1020, 'Sofía', 'Aguilar', 'Luna', '2005-12-22', 5, '2024-02-06');

-- Asignamos a un alumno como delegado en cada grupo
UPDATE grupo SET delegado = 1001 WHERE id_grupo = 1;
UPDATE grupo SET delegado = 1003 WHERE id_grupo = 2;
UPDATE grupo SET delegado = 1005 WHERE id_grupo = 3;
UPDATE grupo SET delegado = 1007 WHERE id_grupo = 4;
UPDATE grupo SET delegado = 1009 WHERE id_grupo = 5;

-- ===========================
--  INSERCIÓN DE PROFESORES
-- ===========================
INSERT INTO profesor (dni, nombre, apellido1, apellido2, direccion, telefono, fecha_registro) VALUES
('12345678A', 'Ana', 'López', 'Fernández', 'Calle Mayor 10, Madrid', '600123456', '2024-02-06'),
('87654321B', 'Javier', 'Ruiz', 'Martínez', 'Avenida Central 45, Barcelona', '601987654', '2024-02-06'),
('11223344C', 'María', 'Sánchez', 'Gómez', 'Plaza del Sol 3, Valencia', '602654321', '2024-02-06'),
('33445566D', 'Pedro', 'Torres', 'Muñoz', 'Calle Luna 14, Sevilla', '603112233', '2024-02-06'),
('55667788E', 'Lucía', 'Gómez', 'Ortega', 'Avenida del Parque 5, Málaga', '604223344', '2024-02-06');

-- ===========================
--  INSERCIÓN DE MÓDULOS
-- ===========================
INSERT INTO modulo (codigo, nombre, dni_profesor) VALUES
(1, 'Bases de Datos', '12345678A'),
(2, 'Programación', '87654321B'),
(3, 'Redes y Seguridad', '11223344C'),
(4, 'Sistemas Operativos', '33445566D'),
(5, 'Administración de Sistemas', '55667788E'),
(6, 'Desarrollo Web', '12345678A'),
(7, 'Ciberseguridad', '11223344C'),
(8, 'Arquitectura de Computadores', '33445566D'),
(9, 'Big Data', '55667788E'),
(10, 'Machine Learning', '87654321B');

-- ===========================
--  INSERCIÓN DE MATRÍCULAS
-- ===========================
INSERT INTO matricula (id_matricula, n_expediente, codigo_modulo) VALUES
(1, 1001, 1),
(2, 1001, 2),
(3, 1002, 1),
(4, 1003, 3),
(5, 1004, 2),
(6, 1005, 3),
(7, 1006, 4),
(8, 1007, 5),
(9, 1008, 6),
(10, 1009, 7),
(11, 1010, 8),
(12, 1011, 9),
(13, 1012, 10),
(14, 1013, 1),
(15, 1014, 2),
(16, 1015, 3),
(17, 1016, 4),
(18, 1017, 5),
(19, 1018, 6),
(20, 1019, 7);
