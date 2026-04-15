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

CREATE TABLE Turno (
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

SHOW TABLES;
