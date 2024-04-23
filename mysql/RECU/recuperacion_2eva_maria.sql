CREATE DATABASE jugadoras;
USE jugadoras;

--  Tabla de Equipos
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
    Resultado VARCHAR(20),
    GolesLocal INT,
    GolesVisitante INT,
    FOREIGN KEY (EquipoLocalID) REFERENCES Equipos(ID),
    FOREIGN KEY (EquipoVisitanteID) REFERENCES Equipos(ID)
);

-- Tabla de Torneos
CREATE TABLE Torneos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Pais VARCHAR(50),
    Anio INT
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
(10, 2, 3, '2023-06-11', 'Victoria local', 2, 1),
(11, 1, 5, '2023-07-13', 'Victoria local', 5, 1),
(12, 10, 9, '2023-10-30', 'Victoria local', 3, 1);

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

-- 10. Obtener el nombre de los equipos que han jugado al menos un partido en un torneo que tenga lugar en España 

SELECT equipos.nombre AS nombre_equipo
FROM Equipos 
JOIN ParticipacionTorneo ON Equipos.ID = ParticipacionTorneo.EquipoID 
JOIN Torneos ON ParticipacionTorneo.TorneoID = Torneos.ID 
JOIN partidos ON Equipos.ID = partidos.EquipolocalID OR  Equipos.ID = partidos.EquipovisitanteID
WHERE Torneos.Pais = "España";



SELECT * FROM Torneos WHERE Pais = "España";
SELECT * FROM participacionTorneo;
SELECT * FROM ParticipacionTorneo WHERE TorneoID IN (SELECT ID FROM Torneos WHERE Pais = 'España');


-- no hay participacion en torneos de españa, aunque hay un registro de un torneo en españa, en la tabla participaciontorneo no hay ningun registro de ese torneo, por lo tanto la consulta me da 0 rows returned
-- para que funcionara deberia haber en la tabla PARTICIPACIONTORNEOS algun dato ingrasado sobre el TORNEO con ID 7 que es (7, 'Primera División Femenina', 'España', 2023), 


-- 11. Obtener el nombre y la edad de las jugadoras que pertenecen a equipos con más de 2 jugadoras menores de 25 años

SELECT jugadores.nombre, jugadores.edad, equipos.nombre AS nombre_equipo
FROM jugadores
JOIN equipos ON jugadores.EquipoID = equipos.ID
WHERE equipos.ID IN (
    SELECT EquipoID
    FROM jugadores
    WHERE edad < 25
    GROUP BY EquipoID
    HAVING COUNT(*) > 2
);
	-- el resultado no devuelve ningun dato ya que no hay ningun equipo que tenga mas de 2 jugadoras menores de 25 años. En concreto solo hay una jugadora menor de 25 años en todos los registros. 
    
-- 12. Obtener el nombre de los equipos que han jugado partidos en todos los torneos en los que han participado

SELECT equipos.nombre AS nombre_equipo, equipos.ID AS equipo_ID, torneos.nombre AS torneo, partidos.fecha,
torneos.ID AS ID_torneo, partidos.equipolocalID AS como_local, partidos.equipovisitanteID AS como_visitante
FROM equipos
JOIN participaciontorneo ON  Equipos.ID = participaciontorneo.EquipoID
JOIN torneos ON participaciontorneo.TorneoID = Torneos.ID
JOIN partidos ON equipos.ID = partidos.equipolocalID OR equipos.ID = partidos.equipoVisitanteID;


-- no hay equipos que participen en torneos que no sean los torneos con id 1 y 2; y todos los equipos han jugado algun partido como local o visitante: se entiende entonces que juegan los partidos en ese torneo.
-- si no, no ohay manera de relacionar los partidos jugados, con los torneos, con los equipos, y con participaciontorneos.


-- 13. Obtener el nombre de los equipos que han jugado partidos como equipo local y visitante en la misma fecha

SELECT equipos.nombre AS nombre_equipo, partidos1.fecha AS fecha
FROM equipos
JOIN partidos AS partidos1 ON equipos.ID = partidos1.EquipoLocalID
JOIN partidos AS partidos2 ON equipos.ID = partidos2.EquipoVisitanteID
WHERE partidos1.fecha = partidos2.fecha;

-- no se repiten las fechas para ningún partido 


select*from partidos;

-- 14. Obtener el nombre de los equipos que han ganado al menos un partido en un torneo en el que han participado:

SELECT DISTINCT equipos.Nombre AS Nombre_equipo
FROM equipos
JOIN partidos AS partidosLocal ON equipos.ID = partidosLocal.EquipoLocalID
JOIN partidos AS partidosVisitante ON equipos.ID = partidosVisitante.EquipoVisitanteID
JOIN participaciontorneo  ON equipos.ID = participaciontorneo.EquipoID
WHERE partidosVisitante.Resultado = 'Victoria visitante' OR partidosLocal.Resultado= "Victoria local";
 
 
-- 15. Obtener el nombre de los equipos que han jugado un partido en una fecha posterior a la del último partido del equipo con ID 1

SELECT equipos.nombre AS nombre_equipo, partidos1.fecha AS fecha
FROM equipos
JOIN partidos AS partidos1 ON equipos.ID = partidos1.EquipoLocalID OR equipos.ID = partidos1.EquipoVisitanteID
WHERE partidos1.Fecha > (
    SELECT MAX(Fecha)
    FROM partidos
    WHERE EquipoLocalID = 1 OR EquipoVisitanteID = 1
);

-- 16. Obtener el nombre de los equipos cuyas jugadoras tengan una edad menor que la edad promedio de todas las jugadoras

SELECT DISTINCT equipos.Nombre AS Nombre_equipo, jugadores.edad AS edad
FROM equipos
JOIN jugadores ON equipos.ID = jugadores.EquipoID
WHERE jugadores.Edad < (
    SELECT AVG(Edad)
    FROM jugadores
);

-- DISTINCT para asegurarnos de que solo se devuelvan nombres de equipos únicos.
-- AVG() para obtener el promedio de las edades en la tabla de jugadores.

SELECT AVG(Edad) AS Promedio_de_edad
FROM jugadores;


-- 17. Obtener el nombre del equipo que ha jugado el mayor número de partidos como equipo visitante

SELECT equipos.Nombre AS Nombre_equipo
FROM equipos
JOIN (
    SELECT EquipoVisitanteID, COUNT(*) AS total_partidos_visitante
    FROM partidos
    GROUP BY EquipoVisitanteID
) AS partidos_visitante ON equipos.ID = partidos_visitante.EquipoVisitanteID
ORDER BY total_partidos_visitante DESC
LIMIT 1;


--  LIMIT 1 para obtener solo el primer resultado, que será el equipo que ha jugado el mayor número de partidos como equipo visitante.

-- 18. Obtener el nombre de los equipos cuya posición final en al menos un torneo fue "Subcampeón"

SELECT DISTINCT equipos.Nombre AS Nombre_equipo
FROM equipos
JOIN ParticipacionTorneo participacion ON equipos.ID = participacion.EquipoID
WHERE participacion.PosicionFinal = 'Subcampeón';
