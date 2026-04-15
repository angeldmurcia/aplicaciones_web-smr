-- Crear la base de datos
CREATE DATABASE videojuegos_db;
USE videojuegos_db;

-- Tabla de Usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    edad INT NOT NULL CHECK (edad >= 13),
    pais VARCHAR(50) NOT NULL
);

-- Tabla de Videojuegos
CREATE TABLE videojuegos (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    precio DECIMAL(10, 2) NOT NULL CHECK (precio >= 0)
);

-- SET FOREIGN_KEY_CHECKS = 0
-- SET FOREIGN_KEY_CHECKS = 1;

-- DROP TABLE videojuegos;
-- DROP TABLE resenas;
-- DROP TABLE usuarios;

-- Tabla de Reseñas
CREATE TABLE resenas (
    id_resena INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_videojuego INT NOT NULL,
    calificacion INT NOT NULL CHECK (calificacion BETWEEN 1 AND 10),
    comentario TEXT,
    fecha_resena DATE DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_resena_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_resena_videojuego FOREIGN KEY (id_videojuego) REFERENCES videojuegos(id_videojuego) ON DELETE CASCADE
);


-- Insertar datos en la tabla Usuarios
INSERT INTO usuarios (nombre, correo, edad, pais)
VALUES 
('Juan Pérez', 'juan.perez@example.com', 25, 'México'),
('Ana Gómez', 'ana.gomez@example.com', 19, 'España'),
('Luis Martínez', 'luis.martinez@example.com', 30, 'Argentina'),
('María López', 'maria.lopez@example.com', 22, 'Chile'),
('Carlos Hernández', 'carlos.hernandez@example.com', 17, 'Colombia');

-- Insertar datos en la tabla Videojuegos
INSERT INTO videojuegos (titulo, genero, plataforma, fecha_lanzamiento, precio)
VALUES 
('The Legend of Zelda: Breath of the Wild', 'Aventura', 'Nintendo Switch', '2017-03-03', 59.99),
('God of War', 'Acción', 'PlayStation 4', '2018-04-20', 49.99),
('Minecraft', 'Sandbox', 'PC', '2011-11-18', 29.99),
('Fortnite', 'Battle Royale', 'Multiplataforma', '2017-07-21', 0.00),
('Hollow Knight', 'Metroidvania', 'PC', '2017-02-24', 14.99);

-- Insertar datos en la tabla Reseñas
INSERT INTO resenas (id_usuario, id_videojuego, calificacion, comentario)
VALUES 
(1, 1, 10, 'Increíble juego, un mundo abierto fascinante.'),
(2, 2, 9, 'Gran narrativa y combate impresionante.'),
(3, 3, 8, 'Muy creativo y con muchas posibilidades.'),
(4, 4, 7, 'Divertido, pero puede volverse repetitivo.'),
(5, 5, 9, 'Estilo artístico hermoso y gran dificultad.');

-- Consultas para verificar los datos insertados
SELECT * FROM usuarios;
SELECT * FROM videojuegos;
SELECT * FROM resenas;

SHOW TABLES;
