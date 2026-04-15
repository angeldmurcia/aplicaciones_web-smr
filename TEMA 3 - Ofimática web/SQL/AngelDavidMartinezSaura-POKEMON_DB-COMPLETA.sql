CREATE DATABASE pokemon_db;
USE pokemon_db;

CREATE TABLE tipo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE objeto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    bonificacion TEXT,
    penalizacion TEXT
);

CREATE TABLE movimiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_tipo INT,
    potencia INT,
    tipo_movimiento ENUM('ataque', 'estado', 'mejora') NOT NULL,
    coste_estamina INT,
    FOREIGN KEY (id_tipo) REFERENCES tipo(id) ON DELETE SET NULL
);

CREATE TABLE pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    mote VARCHAR(50),
    vitalidad INT CHECK (vitalidad BETWEEN 1 AND 10),
    ataque INT CHECK (ataque BETWEEN 1 AND 10),
    defensa INT CHECK (defensa BETWEEN 1 AND 10),
    ataque_especial INT CHECK (ataque_especial BETWEEN 1 AND 10),
    defensa_especial INT CHECK (defensa_especial BETWEEN 1 AND 10),
    velocidad INT CHECK (velocidad BETWEEN 1 AND 10),
    estamina INT CHECK (estamina BETWEEN 1 AND 10),
    nivel INT DEFAULT 1,
    fertilidad INT DEFAULT 5,
    sexo ENUM('MACHO', 'HEMBRA') NOT NULL,
    estado VARCHAR(50),
    id_objeto INT,
    FOREIGN KEY (id_objeto) REFERENCES objeto(id) ON DELETE SET NULL
);

CREATE TABLE pokemon_tipo (
    id_pokemon INT,
    id_tipo INT,
    PRIMARY KEY (id_pokemon, id_tipo),
    FOREIGN KEY (id_pokemon) REFERENCES pokemon(id) ON DELETE CASCADE,
    FOREIGN KEY (id_tipo) REFERENCES tipo(id) ON DELETE CASCADE
);

CREATE TABLE pokemon_movimiento (
    id_pokemon INT,
    id_movimiento INT,
    en_uso BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_pokemon, id_movimiento),
    FOREIGN KEY (id_pokemon) REFERENCES pokemon(id) ON DELETE CASCADE,
    FOREIGN KEY (id_movimiento) REFERENCES movimiento(id) ON DELETE CASCADE
);

CREATE TABLE entrenador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pokedollars INT CHECK (pokedollars BETWEEN 800 AND 1000)
);

CREATE TABLE equipo_principal (
    id_entrenador INT,
    id_pokemon INT,
    PRIMARY KEY (id_entrenador, id_pokemon),
    FOREIGN KEY (id_entrenador) REFERENCES entrenador(id) ON DELETE CASCADE,
    FOREIGN KEY (id_pokemon) REFERENCES pokemon(id) ON DELETE CASCADE
);

CREATE TABLE caja_pokemon (
    id_entrenador INT,
    id_pokemon INT,
    PRIMARY KEY (id_entrenador, id_pokemon),
    FOREIGN KEY (id_entrenador) REFERENCES entrenador(id) ON DELETE CASCADE,
    FOREIGN KEY (id_pokemon) REFERENCES pokemon(id) ON DELETE CASCADE
);

CREATE TABLE combate (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_entrenador1 INT,
    id_entrenador2 INT,
    ganador INT,
    numero_turnos INT,
    ko_entrenador1 INT DEFAULT 0,
    ko_entrenador2 INT DEFAULT 0,
    FOREIGN KEY (id_entrenador1) REFERENCES entrenador(id) ON DELETE CASCADE,
    FOREIGN KEY (id_entrenador2) REFERENCES entrenador(id) ON DELETE CASCADE,
    FOREIGN KEY (ganador) REFERENCES entrenador(id) ON DELETE SET NULL
);

CREATE TABLE turno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_combate INT,
    numero_turno INT,
    accion_entrenador1 TEXT,
    accion_entrenador2 TEXT,
    FOREIGN KEY (id_combate) REFERENCES combate(id) ON DELETE CASCADE
);

CREATE TABLE captura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_entrenador INT,
    id_pokemon INT,
    resultado ENUM('capturado', 'fallido') NOT NULL,
    FOREIGN KEY (id_entrenador) REFERENCES entrenador(id) ON DELETE CASCADE,
    FOREIGN KEY (id_pokemon) REFERENCES pokemon(id) ON DELETE CASCADE
);

-- Inserción de tipos
INSERT INTO tipo (nombre) VALUES
('Fuego'), ('Agua'), ('Planta'), ('Eléctrico'), ('Hielo'), ('Lucha'), ('Veneno'), ('Tierra'), ('Volador'), ('Psíquico'),
('Bicho'), ('Roca'), ('Fantasma'), ('Dragón'), ('Siniestro'), ('Acero'), ('Hada'), ('Normal'), ('Cósmico'), ('Tóxico');

-- Inserción de objetos
INSERT INTO objeto (nombre, bonificacion, penalizacion) VALUES
('Poción', 'Recupera 20 PS', NULL), ('Superpoción', 'Recupera 50 PS', NULL), ('Hiperpoción', 'Recupera 120 PS', NULL),
('Revivir', 'Revive a un Pokémon', NULL), ('Antídoto', 'Cura envenenamiento', NULL), ('Baya Ziuela', 'Cura parálisis', NULL),
('Baya Aranja', 'Recupera 10 PS', NULL), ('Cinta Focus', 'Evita KO', NULL), ('Gafas de Sol', 'Aumenta ataque tipo Siniestro', NULL),
('Cinturón Negro', 'Aumenta ataque tipo Lucha', NULL), ('Piedra Fuego', 'Evoluciona a ciertos Pokémon', NULL), ('Piedra Agua', 'Evoluciona a ciertos Pokémon', NULL),
('Piedra Trueno', 'Evoluciona a ciertos Pokémon', NULL), ('Piedra Hoja', 'Evoluciona a ciertos Pokémon', NULL), ('Cinta X', 'Aumenta velocidad', NULL),
('Más PP', 'Aumenta PP de un movimiento', NULL), ('Carameloraro', 'Sube 1 nivel', NULL), ('Baya Safre', 'Recupera estamina', NULL),
('Baya Caoca', 'Reduce velocidad del rival', NULL), ('Baya Wiki', 'Recupera salud si PS <50%', NULL);

-- Inserción de movimientos
INSERT INTO movimiento (nombre, id_tipo, potencia, tipo_movimiento, coste_estamina) VALUES
('Llamarada', 1, 110, 'ataque', 5), ('Surf', 2, 90, 'ataque', 4), ('Latigazo', 3, 80, 'ataque', 3),
('Impactrueno', 4, 40, 'ataque', 2), ('Rayo Hielo', 5, 90, 'ataque', 4), ('Puño Dinámico', 6, 100, 'ataque', 5),
('Picotazo Venenoso', 7, 60, 'ataque', 3), ('Terremoto', 8, 100, 'ataque', 5), ('Golpe Aéreo', 9, 75, 'ataque', 3),
('Confusión', 10, 50, 'ataque', 2), ('Picadura', 11, 60, 'ataque', 3), ('Roca Afilada', 12, 100, 'ataque', 5),
('Bola Sombra', 13, 80, 'ataque', 3), ('Cometa Draco', 14, 130, 'ataque', 6), ('Mordisco', 15, 60, 'ataque', 3),
('Cabeza de Hierro', 16, 90, 'ataque', 4), ('Brillo Mágico', 17, 80, 'ataque', 3), ('Placaje', 18, 40, 'ataque', 2),
('Explosión Cósmica', 19, 150, 'ataque', 7), ('Veneno Cósmico', 20, 70, 'ataque', 4);

-- Inserción de Pokémon
INSERT INTO pokemon (nombre, mote, vitalidad, ataque, defensa, ataque_especial, defensa_especial, velocidad, estamina, nivel, fertilidad, sexo, estado, id_objeto) VALUES
('Charmander', 'Fuego Rápido', 8, 7, 5, 6, 5, 7, 6, 1, 5, 'MACHO', NULL, 1),
('Squirtle', 'Aqua Def', 7, 5, 8, 6, 7, 5, 6, 1, 5, 'HEMBRA', NULL, 2),
('Bulbasaur', 'Plantón', 8, 6, 6, 7, 7, 5, 6, 1, 5, 'MACHO', NULL, 3),
('Pikachu', 'Voltio', 6, 7, 5, 8, 6, 9, 7, 1, 5, 'MACHO', NULL, 4),
('Jigglypuff', 'Melodía', 9, 4, 5, 7, 8, 3, 6, 1, 5, 'HEMBRA', NULL, 5);

-- Inserción de entrenadores
INSERT INTO entrenador (nombre, pokedollars) VALUES
('Ash', 1000), ('Misty', 950), ('Brock', 900), ('Gary', 850), ('Dawn', 1000),
('Serena', 970), ('May', 920), ('Clemont', 980), ('Iris', 880), ('James', 890),
('Jessie', 850), ('Giovanni', 990), ('Lance', 1000), ('Cynthia', 1000), ('Red', 1000),
('Blue', 950), ('Leaf', 970), ('Silver', 910), ('Gold', 980), ('Kris', 940);

-- Inserción de combates
INSERT INTO combate (id_entrenador1, id_entrenador2, ganador, numero_turnos, ko_entrenador1, ko_entrenador2) VALUES
(1, 2, 1, 10, 2, 1), (3, 4, 3, 12, 3, 2), (5, 6, 5, 8, 1, 3),
(7, 8, 7, 15, 2, 4), (9, 10, 10, 9, 3, 2);

-- Inserción de turnos de combate
INSERT INTO turno (id_combate, numero_turno, accion_entrenador1, accion_entrenador2) VALUES
(1, 1, 'Charmander usó Llamarada', 'Squirtle usó Surf'),
(2, 1, 'Pikachu usó Impactrueno', 'Bulbasaur usó Latigazo'),
(3, 1, 'Jigglypuff usó Brillo Mágico', 'Charmander usó Placaje');

-- PARTE 1 INSERTS
----------------------------------------------------------------------------------------------------------------

-- Relacionar cada Pokémon con uno o dos tipos
INSERT INTO pokemon_tipo (id_pokemon, id_tipo) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 17);

-- Asignar movimientos a los Pokémon y marcar al menos uno como "en uso"
INSERT INTO pokemon_movimiento (id_pokemon, id_movimiento, en_uso) VALUES
(1, 1, TRUE), (1, 18, FALSE),
(2, 2, TRUE), (2, 8, FALSE),
(3, 3, TRUE), (3, 7, FALSE),
(4, 4, TRUE), (4, 14, FALSE),
(5, 17, TRUE), (5, 5, FALSE);

-- Asignar al menos 3 Pokémon al equipo principal de cada entrenador
INSERT INTO equipo_principal (id_entrenador, id_pokemon) VALUES
(1, 1), (1, 2), (1, 3),
(2, 2), (2, 3), (2, 4),
(3, 3), (3, 4), (3, 5),
(4, 1), (4, 4), (4, 5),
(5, 1), (5, 2), (5, 5);

-- Colocar al menos 2 Pokémon adicionales en la caja de cada entrenador
INSERT INTO caja_pokemon (id_entrenador, id_pokemon) VALUES
(1, 4), (1, 5),
(2, 1), (2, 5),
(3, 1), (3, 2),
(4, 2), (4, 3),
(5, 3), (5, 4);

-- Completar al menos 3 turnos para cada combate
INSERT INTO turno (id_combate, numero_turno, accion_entrenador1, accion_entrenador2) VALUES
(1, 2, 'Charmander usó Placaje', 'Squirtle usó Burbuja'),
(1, 3, 'Charmander usó Llamarada', 'Squirtle falló el ataque'),
(2, 2, 'Pikachu usó Rayo', 'Bulbasaur usó Drenadoras'),
(2, 3, 'Pikachu usó Impactrueno', 'Bulbasaur usó Latigazo'),
(3, 2, 'Jigglypuff usó Canto', 'Charmander usó Ascuas'),
(3, 3, 'Jigglypuff usó Doble Bofetón', 'Charmander falló el ataque');

-- Registrar al menos 3 capturas exitosas y 2 fallidas por diferentes entrenadores
INSERT INTO captura (id_entrenador, id_pokemon, resultado) VALUES
(1, 1, 'capturado'), (1, 3, 'capturado'),
(2, 2, 'capturado'), (3, 4, 'fallido'),
(4, 5, 'fallido');

-- PARTE 2 - CONSULTAS
--------------------------------------------------------------------------------------------------------------

USE pokemon_db;

-- Listar todos los Pokémon con su tipo principal
SELECT p.nombre AS nombre_pokemon, t.nombre AS tipo
FROM pokemon p
JOIN pokemon_tipo pt ON p.id = pt.id_pokemon
JOIN tipo t ON t.id = pt.id_tipo;

-- Listar los Pokémon en el equipo principal de cada entrenador
#id_entrenador (equipo principal)
#id_pokemon (equipo principal)
#id (entrenador) [nombre]
#id (pokemon) [nombre]

SELECT e.nombre AS nombre_entrenador, p.nombre AS nombre_pokemon
FROM pokemon p
JOIN equipo_principal ep ON p.id = ep.id_pokemon
JOIN entrenador e ON ep.id_entrenador = e.id
ORDER BY e.nombre, p.nombre;

-- Listar los Pokémon y los objetos que tienen equipados (si tienen alguno)

SELECT p.nombre AS nombre_pokemon, o.nombre AS objeto
FROM pokemon p
LEFT JOIN objeto o ON p.id_objeto = o.id; -- LEFT JOIN para que incluya el pokemon "concha" con NULL que hemos agregado a continuación

INSERT INTO pokemon (nombre, mote, vitalidad, ataque, defensa, 
ataque_especial, defensa_especial, velocidad, estamina, nivel, fertilidad, sexo, estado, id_objeto) 
VALUES ('Concha', 'Chorrazo Venenoso', 8, 7, 5, 6, 5, 7, 6, 1, 5, 'HEMBRA', NULL, NULL);

-- Listar los combates con el nombre de ambos entrenadores y el ganador

SELECT c.id, e1.nombre AS entrenador1, e2.nombre AS entrenador2, e3.nombre AS ganador
FROM combate c
JOIN entrenador e1 ON c.id_entrenador1 = e1.id 
JOIN entrenador e2 ON c.id_entrenador2 = e2.id
JOIN entrenador e3 ON c.ganador = e3.id;

-- Listar los Pokémon capturados por cada entrenador

#pokemon capturados (id_pokemon - id_entrenador)

SELECT e.nombre AS nombre_entrenador, p.nombre AS nombre_pokemon
FROM captura c
JOIN pokemon p ON c.id_pokemon = p.id
JOIN entrenador e ON e.id = c.id_entrenador
WHERE c.resultado = "capturado";


-- Listar los Pokémon que tienen un movimiento en uso

SELECT p.nombre AS pokemon, m.nombre AS movimiento
FROM pokemon_movimiento pm
JOIN movimiento m ON m.id = pm.id_movimiento
JOIN pokemon p ON p.id = pm.id_pokemon
WHERE en_uso = TRUE;

-- Listar los entrenadores que tienen más de 950 pokédollars

SELECT e.nombre AS nombre_entrenador, e.pokedollars
FROM entrenador e
WHERE e.pokedollars > 950
ORDER BY e.nombre;

-- Listar los Pokémon de tipo Fuego
#pokemon.id - pokemon_tipo.id_pokemon
#1pokemon_tipo.id_tipo - tipo.id

SELECT p.nombre AS pokemon, t.nombre AS tipo
FROM pokemon p
JOIN pokemon_tipo pt ON p.id = pt.id_pokemon
JOIN tipo t ON pt.id_tipo = t.id
WHERE t.nombre = "Fuego";


-- Listar los Pokémon de entrenadores que han ganado al menos un combate

#combate.ganador (entrenador.id)
#equipo_principal.id_entrenador - entrenador.nombre
#equipo_principal.id_pokemon - pokemon.id

SELECT e.nombre, p.nombre
FROM combate c
JOIN entrenador e ON c.ganador = e.id
JOIN equipo_principal ep ON e.id = ep.id_entrenador
JOIN pokemon p ON ep.id_pokemon = p.id;

SELECT e.nombre, p.nombre FROM entrenador e
JOIN equipo_principal ep ON e.id = ep.id_entrenador
JOIN pokemon p ON ep.id_pokemon = p.id
WHERE e.id IN (SELECT ganador FROM combate);

SELECT ganador FROM combate;


-- Listar todos los movimientos y su tipo

#pokemon.nombre, movimiento.nombre
#Esta consulta muestra "ataque" en tipo porque es lo que pone en los inserts que diste.

SELECT p.nombre AS pokemon, m.nombre AS nombre_movimiento, m.tipo_movimiento AS tipo
FROM pokemon p
JOIN pokemon_movimiento pm ON p.id = pm.id_pokemon
JOIN movimiento m ON pm.id_movimiento = m.id;


-- Listar todos los combates donde hubo más de 10 turnos

SELECT e.nombre AS nombre_entrenador, c.*
FROM combate c
JOIN entrenador e ON c.ganador = e.id 
WHERE c.numero_turnos > 10; 


-- Listar los turnos de un combate específico con las acciones realizadas

#turno.id_combate
#turno.numero_turno

SELECT t.* 
FROM combate c
JOIN turno t ON c.id = t.id_combate
WHERE c.id = 2;