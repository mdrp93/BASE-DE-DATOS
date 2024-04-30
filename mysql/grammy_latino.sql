CREATE DATABASE grammys;
use grammys;

-- Tabla de géneros musicales
CREATE TABLE Generos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_genero VARCHAR(255) NOT NULL,
    Pais_procedencia VARCHAR(255)
);

-- Tabla de artistas
CREATE TABLE Artistas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Nacionalidad VARCHAR(255),
    Anio_de_nacimiento INT,
    Discografica VARCHAR(255),
    Genero_ID INT,
    FOREIGN KEY (Genero_ID) REFERENCES Generos(ID)
);

-- Tabla de canciones
CREATE TABLE Canciones (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_cancion VARCHAR(255) NOT NULL,
    Artista_ID INT,
    Duracion TIME,
    Anio_lanzamiento INT,
    Album VARCHAR(255),
    FOREIGN KEY (Artista_ID) REFERENCES Artistas(ID)
);

-- Tabla de reproducciones
CREATE TABLE Reproducciones (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Cancion_ID INT,
    Fecha_reproduccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Cantidad_reproducciones INT,
    FOREIGN KEY (Cancion_ID) REFERENCES Canciones(ID)
);


------------------------------------------------------------------

-- Insertar datos en la tabla de géneros musicales
INSERT INTO Generos (Nombre_genero, Pais_procedencia) VALUES
('Pop', 'Varios'),
('Rock', 'Estados Unidos'),
('Reggaeton', 'Puerto Rico'),
('Flamenco', 'España'),
('Vallenato', 'Colombia'),
('Electrónica', 'Varios'),
('Hip Hop', 'Estados Unidos'),
('Salsa', 'Cuba'),
('Merengue', 'República Dominicana'),
('Cumbia', 'Colombia'),
('Rap', 'Estados Unidos');

-- Insertar datos en la tabla de artistas
INSERT INTO Artistas (Nombre, Nacionalidad, Anio_de_nacimiento, Discografica, Genero_ID) VALUES
('Shakira', 'Colombiana', 1977, 'Sony Music', 1),
('Juanes', 'Colombiano', 1972, 'Universal Music', 2),
('Maluma', 'Colombiano', 1994, 'Sony Music', 3),
('Rosalía', 'Española', 1992, 'Sony Music', 4),
('Carlos Vives', 'Colombiano', 1961, 'Sony Music', 5),
('David Guetta', 'Francés', 1967, 'Parlophone Records', 6),
('Eminem', 'Estadounidense', 1972, 'Aftermath Entertainment', 7),
('Marc Anthony', 'Estadounidense', 1968, 'Columbia Records', NULL),
('Selena', 'Estadounidense', 1971, 'EMI Latin', NULL),
('Gloria Estefan', 'Cubana', 1957, 'Epic Records', NULL),
('Kase.O', 'Español', 1978, 'BOA', 11),
('El Arrebato', 'Español', 1970, 'EMI Music', 4);

-- Insertar datos en la tabla de canciones
INSERT INTO Canciones (Nombre_cancion, Artista_ID, Duracion, Anio_lanzamiento, Album) VALUES
('Hips Don''t Lie', 1, '00:03:38', 2006, 'Oral Fixation Vol. 2'),
('La Camisa Negra', 2, '00:03:35', 2005, 'Mi Sangre'),
('Felices los 4', 3, '00:03:49', 2017, 'F.A.M.E.'),
('Malamente', 4, '00:02:30', 2018, 'El Mal Querer'),
('La Bicicleta', 5, '00:03:47', 2016, 'La bicicleta'),
('Titanium', 6, '00:04:05', 2011, 'Nothing but the Beat'),
('Lose Yourself', 7, '00:05:26', 2002, '8 Mile'),
('Vivir Mi Vida', 8, '00:04:11', 2013, '3.0'),
('Bidi Bidi Bom Bom', 9, '00:03:31', 1994, 'Amor Prohibido'),
('Conga', 10, '00:04:15', 1985, 'Primitive Love'),
('Javier I el Grande', 11, '00:04:35', 2002, 'Javier I el Grande'),
('Poquito a poco', 12, '00:03:45', 2001, 'Poquito a poco');

-- Insertar datos en la tabla de reproducciones
INSERT INTO Reproducciones (Cancion_ID, Cantidad_reproducciones) VALUES
(1, 100),
(2, 150),
(3, 200),
(4, 300),
(5, 250),
(6, 400),
(7, 500),
(8, 350),
(9, 200),
(10, 150),
(11, 50);

-- 1. Crear un TRIGGER para registrar la fecha de lanzamiento de la canción como la fecha actual si no se especifica en la inserción.

DROP TRIGGER IF EXISTS Before_Insert_Canciones;

DELIMITER //
CREATE TRIGGER Before_Insert_Canciones
BEFORE INSERT ON Canciones
FOR EACH ROW
BEGIN
    IF NEW.Anio_lanzamiento IS NULL OR NEW.Anio_lanzamiento = 0 THEN
        SET NEW.Anio_lanzamiento = YEAR(CURRENT_DATE);
    END IF;
END//
DELIMITER ;

-- comprobar trigger 

INSERT INTO Canciones (Nombre_cancion, Artista_ID, Duracion, Album) VALUES
('Cancion de prueba', 1, '00:04:00', 'Álbum de prueba');

select* from canciones;

-- borrar un dato concreto
DELETE FROM Canciones WHERE ID = 13;


-- 2. Crear un TRIGGER que al insertar una canción, si no localiza al artista en la tabla de artistas, lo inserta como nuevo artista en dicha tabla con el Nombre = ‘Artista creador del tema nombre_cancion’.


-- Eliminar el trigger si existe
DROP TRIGGER IF EXISTS Before_Insert_Canciones_Artista;

-- Definir el nuevo trigger
DELIMITER //
CREATE TRIGGER Before_Insert_Canciones_Artista
BEFORE INSERT ON Canciones
FOR EACH ROW
BEGIN
    DECLARE artist_id INT;

    -- Buscar si el artista ya existe en la tabla de artistas
    SELECT ID INTO artist_id FROM Artistas WHERE Nombre = NEW.Nombre_cancion;

    -- Si el artista no existe, insertarlo como nuevo artista
    IF artist_id IS NULL THEN
        INSERT INTO Artistas (Nombre, Discografica)
        VALUES (CONCAT('Artista creador del tema ', NEW.Nombre_cancion), 'Desconocida');
        SET artist_id = LAST_INSERT_ID();
    END IF;

    -- Asignar el ID del artista a la nueva canción
    SET NEW.Artista_ID = artist_id;
END//
DELIMITER ;


INSERT INTO Canciones (Nombre_cancion, Artista_ID, Duracion, Anio_lanzamiento, Album) VALUES
('Cancion de prueba 2', '14', '00:04:00', 2024, 'Álbum de prueba');

select * from artistas;


-- 3.Crea un TRIGGER que al insertar una línea en la lista de reproducciones actualice el número de reproducciones para una misma canción


-- Eliminar el trigger si existe
DROP TRIGGER IF EXISTS After_Insert_Reproducciones;

DELIMITER //
CREATE TRIGGER After_Insert_Reproducciones
AFTER INSERT ON Reproducciones
FOR EACH ROW
BEGIN
    DECLARE total_reproducciones INT;
    
    -- Obtener el total de reproducciones para la canción
    SELECT SUM(Cantidad_reproducciones) INTO total_reproducciones
    FROM Reproducciones
    WHERE Cancion_ID = NEW.Cancion_ID;
    
    -- Actualizar el número de reproducciones en la tabla de canciones
    UPDATE Canciones
    SET Canciones.Cantidad_reproducciones = total_reproducciones
    WHERE Canciones.ID = NEW.Cancion_ID;
END//
DELIMITER ;


-- Comprobamos trigger 3

-- Insertar una nueva fila en la tabla de Reproducciones
INSERT INTO Reproducciones (Cancion_ID, Cantidad_reproducciones) VALUES (1, 50);

-- Verificar si el número de reproducciones de la canción correspondiente se actualizó correctamente
SELECT * FROM Reproducciones where Cancion_ID = 1;

select*from reproducciones;

select*from canciones;



