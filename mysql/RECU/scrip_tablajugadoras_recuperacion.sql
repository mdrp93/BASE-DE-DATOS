CREATE DATABASE jugadoras;
USE jugadoras;

-- Tabla de Equipos

CREATE TABLE Equipos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(100),
    Pais VARCHAR(50),
    Entrenador VARCHAR(100)
);

-- Tabla de Jugadoras
CREATE TABLE Jugadoras (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Edad INT,
    Posicion VARCHAR(50),
    Nacionalidad VARCHAR(50),
    EquipoID INT,
    FOREIGN KEY (EquipoID) REFERENCES Equipos(ID)
);

-- Tabla de Partidos
CREATE TABLE Partidos (
    ID INT PRIMARY KEY,
    EquipoLocalID INT,
    EquipoVisitanteID INT,
    Fecha DATE,
    Resultado VARCHAR(10),
    GolesLocal INT,
    GolesVisitante INT,
    FOREIGN KEY (EquipoLocalID) REFERENCES Equipos(ID),
    FOREIGN KEY (EquipoVisitanteID) REFERENCES Equipos(ID)
);

-- Tabla de Participación en Torneos
CREATE TABLE ParticipacionTorneo (
    ID INT PRIMARY KEY,
    TorneoID INT,
    EquipoID INT,
    PosicionFinal VARCHAR(20),
    FOREIGN KEY (TorneoID) REFERENCES Torneos(ID),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(ID)
);

-- Tabla de Torneos
CREATE TABLE Torneos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Pais VARCHAR(50),
    Anio INT
);

-- Inserts for Equipos (Teams) table
INSERT INTO Equipos (ID, Nombre, Ciudad, Pais, Entrenador) VALUES
(1, 'FC Barcelona Femení', 'Barcelona', 'España', 'Lluís Cortés'),
(2, 'Olympique Lyonnais Féminin', 'Lyon', 'Francia', 'Jean-Luc Vasseur'), 
(3, 'Portland Thorns FC', 'Portland', 'Estados Unidos', 'Mark Parsons'),
(4, 'Chelsea FC Women', 'Londres', 'Inglaterra', 'Emma Hayes'),
(5, 'VfL Wolfsburg Frauen', 'Wolfsburg', 'Alemania', 'Stephan Lerch'),
(6, 'NC Courage', 'Carolina del Norte', 'Estados Unidos', 'Paul Riley'),
(7, 'Paris Saint-Germain Féminine', 'París', 'Francia', 'Olivier Echouafni'),
(8, 'Bayern Munich Frauen', 'Munich', 'Alemania', 'Jens Scheuer'),
(9, 'Manchester City Women FC', 'Manchester', 'Inglaterra', 'Gareth Taylor'),
(10, 'AC Milan Women', 'Milán', 'Italia', 'Maurizio Ganz');

-- Inserts for Jugadoras (Players) table
INSERT INTO Jugadoras (ID, Nombre, Edad, Posicion, Nacionalidad, EquipoID) VALUES
(1, 'Alex Morgan', 32, 'Delantera', 'Estados Unidos', 6),
(2, 'Ada Hegerberg', 26, 'Delantera', 'Noruega', 2),
(3, 'Marta Vieira da Silva', 35, 'Delantera', 'Brasil', 3),
(4, 'Sam Kerr', 28, 'Delantera', 'Australia', 4),
(5, 'Vivianne Miedema', 25, 'Delantera', 'Países Bajos', 4),
(6, 'Jennifer Hermoso', 31, 'Delantera', 'España', 1),
(7, 'Tobin Heath', 33, 'Extremo', 'Estados Unidos', 6),
(8, 'Barbara Bonansea', 30, 'Centrocampista', 'Italia', 10),
(9, 'Lena Oberdorf', 20, 'Centrocampista', 'Alemania', 5),
(10, 'Lucy Bronze', 30, 'Defensa', 'Inglaterra', 4);


-- Inserts for Torneos (Tournaments) table
INSERT INTO Torneos (ID, Nombre, Pais, Anio) VALUES
(1, 'UEFA Women''s Champions League', 'Europa', 2023),
(2, 'National Women''s Soccer League', 'Estados Unidos', 2023),
(3, 'FA Women''s Super League', 'Inglaterra', 2023),
(4, 'Division 1 Féminine', 'Francia', 2023),
(5, 'DFB-Pokal Frauen', 'Alemania', 2023),
(6, 'Copa Italia Femminile', 'Italia', 2023),
(7, 'Primera División Femenina', 'España', 2023),
(8, 'Damallsvenskan', 'Suecia', 2023),
(9, 'W-League', 'Australia', 2023),
(10, 'Campeonato Brasileiro Feminino', 'Brasil', 2023);

-- la tabla partidos me daba un fallo "Data too long for column ' resultado' at row 1"

ALTER TABLE partidos
drop column resultado; 

ALTER TABLE partidos 
ADD resultado VARCHAR(20);

-- Inserts for Partidos (Matches) table
INSERT INTO Partidos (ID, EquipoLocalID, EquipoVisitanteID, Fecha, Resultado, GolesLocal, GolesVisitante) VALUES
(1, 1, 2, '2023-01-15', 'Victoria local', 2, 0),
(2, 3, 4, '2023-02-20', 'Empate', 1, 1),
(3, 5, 6, '2023-03-25', 'Victoria visitante', 0, 2),
(4, 7, 8, '2023-04-30', 'Victoria local', 3, 1),
(5, 9, 10, '2023-05-05', 'Empate', 2, 2),
(6, 2, 1, '2023-06-10', 'Victoria visitante', 0, 1),
(7, 4, 3, '2023-07-15', 'Victoria local', 2, 0),
(8, 6, 5, '2023-08-20', 'Empate', 1, 1),
(9, 8, 7, '2023-09-25', 'Victoria visitante', 0, 2),
(10, 10, 9, '2023-10-30', 'Victoria local', 3, 1);

INSERT INTO ParticipacionTorneo (ID, TorneoID, EquipoID, PosicionFinal) VALUES
(1, 1, 1, 'Semifinalista'),
(2, 1, 2, 'Finalista'),
(3, 1, 3, 'Cuartos de final'),
(4, 1, 4, 'Cuartos de final'),
(5, 1, 5, 'Octavos de final'),
(6, 2, 6, 'Campeón'),
(7, 2, 7, 'Subcampeón'),
(8, 2, 8, 'Tercer lugar'),
(9, 2, 9, 'Cuarto lugar'),
(10, 2, 10, 'Quinto lugar');

ALTER TABLE jugadoras
RENAME jugadores;

-- 1. Obtener el nombre y la edad de las jugadoras que pertenecen a equipos cuyo entrenador sea "Stephan Lerch"

SELECT jugadores.nombre, jugadores.edad, equipos.entrenador
FROM jugadores
JOIN equipos ON  equipos.ID = jugadores.equipoID
WHERE entrenador = "Stephan Lerch";

-- 2. Obtener el nombre y la posición de las jugadoras que juegan en equipos de la ciudad de "Madrid"

SELECT jugadores.nombre, jugadores.edad, equipos.ciudad
FROM jugadores
JOIN equipos ON  equipos.ID = jugadores.equipoID
WHERE ciudad = "Madrid";

-- 3. Obtener el nombre y la posición de las jugadoras menores de 25 años

SELECT jugadores.nombre, jugadores.posicion, jugadores.edad
FROM jugadores
WHERE edad < 25;

-- 4. Obtener el nombre de los equipos que han jugado partidos en el torneo con ID 1

SELECT equipos.nombre, torneos.nombre, torneos.ID
FROM equipos
JOIN participaciontorneo ON  Equipos.ID = participaciontorneo.EquipoID
JOIN torneos ON participaciontorneo.TorneoID = Torneos.ID
WHERE  TorneoID = 1;


-- 5. Obtener el nombre de los equipos que han ganado al menos un torneo

SELECT equipos.nombre
FROM equipos
JOIN participaciontorneo ON Equipos.ID =  participaciontorneo.ID
WHERE participaciontorneo.PosicionFinal = "campeón";

-- Consulta de todos los quipos con el torneo en el que participaron y la posición que quedaron:
-- SELECT Equipos.Nombre AS NombreEquipo, Torneos.Nombre AS NombreTorneo, ParticipacionTorneo.PosicionFinal
-- FROM Equipos
-- LEFT JOIN ParticipacionTorneo ON Equipos.ID = ParticipacionTorneo.EquipoID
-- LEFT JOIN Torneos ON ParticipacionTorneo.TorneoID = Torneos.ID;


-- 6. Obtener el nombre del torneo en el que ha participado el equipo con ID 3

SELECT Equipos.ID AS ID_Equipo, Equipos.Nombre AS NombreEquipo, Torneos.ID AS ID_Torneo, Torneos.Nombre AS NombreTorneo
FROM Equipos
JOIN ParticipacionTorneo ON Equipos.ID = ParticipacionTorneo.EquipoID
JOIN Torneos ON ParticipacionTorneo.TorneoID = Torneos.ID
WHERE Equipos.ID = 3;

-- 7. Obtener el nombre y la posición de las jugadoras que pertenecen a equipos de países diferentes al de sus equipos // (¿de su nacionalidad?)

SELECT jugadores.nombre AS nombre_jugadora, jugadores.posicion AS posicion_jugadora, jugadores.nacionalidad AS pais_jugadora, 
equipos.nombre AS nombre_equipo, equipos.pais AS pais_equipo
FROM jugadores
JOIN equipos ON jugadores.EquipoID = Equipos.ID
WHERE jugadores.nacionalidad != Equipos.pais;


-- 8. Obtener el nombre de los equipos que han jugado un partido en la fecha 2023-05-15

SELECT equipos.nombre AS nombre_equipo,  partidos.fecha AS fecha_partido 
FROM equipos
JOIN partidos ON equipos.ID = partidos.equipolocalID OR equipos.ID = partidos.equipoVisitanteID
WHERE partidos.fecha = "2023-05-15";

-- consulta de la tabla partidos en esa fecha exacta: solucion ninguno. 
-- SELECT*FROM PARTIDOS
-- WHERE partidos.fecha = "2023-05-15";


-- 9. Obtener el nombre y la posición de las jugadoras que pertenecen a equipos cuyo entrenador sea Jean-Luc Vasseur

SELECT jugadores.nombre AS nombre_jugadora, jugadores.posicion AS posicion_jugadora, equipos.nombre AS equipo, equipos.entrenador AS entrenador
FROM jugadores
JOIN equipos ON equipos.ID = jugadores.equipoID 
WHERE equipos.entrenador = "Jean-Luc Vasseur";

-- FALLO:

-- 10. Obtener el nombre de los equipos que han jugado al menos un partido en un torneo que tenga lugar en España 

	-- (!no funciona porqueno hay un torneoID en la tabla partidos, ni manera de unir los partidos con los torneos¡ )
	-- he incluido para que funciones la columna torneoID en la tabla partidos, para esto me daba errores del modo de actualizacion segura:

		SET SQL_SAFE_UPDATES = 0; -- desactivar el modo de actualización segura ejecutando el siguiente comando:
		UPDATE Partidos
		SET TorneoID = (
		   CASE 
				WHEN ID BETWEEN 1 AND 3 THEN 1 -- Asignar UEFA Women's Champions League a los partidos 1 a 3
				WHEN ID BETWEEN 4 AND 6 THEN 2 -- Asignar National Women's Soccer League a los partidos 4 a 6
				WHEN ID BETWEEN 7 AND 9 THEN 3 -- Asignar FA Women's Super League a los partidos 7 a 9
				ELSE 4 -- Asignar Division 1 Féminine a los partidos restantes
			END);
		SET SQL_SAFE_UPDATES = 1; -- activar el modo de actualización segura:
		SELECT * FROM Partidos;
	-- despues de conseguir poner la columna torneosID en la tabla partidos para que se pueda realizar la consulta, y asignar los datos a la columna, ya puedo realizar la consulta 10.

ALTER TABLE Partidos DROP FOREIGN KEY partidos_ibfk_3;

ALTER TABLE Partidos DROP COLUMN TorneoID;


-- 10. Obtener el nombre de los equipos que han jugado al menos un partido en un torneo que tenga lugar en España 














