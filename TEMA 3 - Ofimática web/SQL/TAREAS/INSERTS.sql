USE pokemon_db;

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
INSERT INTO Turno (id_combate, numero_turno, accion_entrenador1, accion_entrenador2) VALUES
(1, 1, 'Charmander usó Llamarada', 'Squirtle usó Surf'),
(2, 1, 'Pikachu usó Impactrueno', 'Bulbasaur usó Latigazo'),
(3, 1, 'Jigglypuff usó Brillo Mágico', 'Charmander usó Placaje');