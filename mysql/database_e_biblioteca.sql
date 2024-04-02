CREATE DATABASE E_BIBLIOTECA;
SHOW DATABASES;
USE E_BIBLIOTECA;
CREATE TABLE Libro (
    ID INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Autor VARCHAR(100),
    ISBN VARCHAR(20),
    Categoria VARCHAR(50),
    AnioPublicacion INT
);

CREATE TABLE Autor (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Nacionalidad VARCHAR(50),
    FechaNacimiento DATE
);

CREATE TABLE Usuario (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Prestamo (
    ID INT PRIMARY KEY,
    LibroID INT,
    UsuarioID INT,
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    FOREIGN KEY (LibroID) REFERENCES Libro(ID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID)
);


-- Inserts for Libro (Book) table
INSERT INTO Libro (ID, Titulo, Autor, ISBN, Categoria, AnioPublicacion) VALUES
(1, '1984', 'George Orwell', '9780451524935', 'Ficción distópica', 1949),
(2, 'Cien años de soledad', 'Gabriel García Márquez', '9788437604947', 'Realismo mágico', 1967),
(3, 'El hobbit', 'J.R.R. Tolkien', '9780547928227', 'Fantasía', 1937),
(4, 'Orgullo y prejuicio', 'Jane Austen', '9780141439518', 'Romance', 1813),
(5, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', '9788478884457', 'Fantasía', 1997),
(6, 'Don Quijote de la Mancha', 'Miguel de Cervantes', '9788420467006', 'Novela picaresca', 1605),
(7, 'Crimen y castigo', 'Fyodor Dostoevsky', '9780140449136', 'Ficción psicológica', 1866),
(8, 'La metamorfosis', 'Franz Kafka', '9788484504846', 'Ficción absurda', 1915),
(9, 'Matar un ruiseñor', 'Harper Lee', '9780061120084', 'Ficción legal', 1960),
(10, 'Los juegos del hambre', 'Suzanne Collins', '9788427202122', 'Ficción distópica', 2008),
(11, 'El Castillo', 'Franz Kafka', '84504846978', 'Ficción', 1923),
(12, 'Cartas al padre', 'Franz Kafka', '4697871121', 'Ficción', 1919),
(13, 'Realismo Mágico', '', '8712588121', 'Ficción', 1919);


-- Inserts for Autor (Author) table
INSERT INTO Autor (ID, Nombre, Nacionalidad, FechaNacimiento) VALUES
(1, 'George Orwell', 'Británica', '1903-06-25'),
(2, 'Gabriel García Márquez', 'Colombiana', '1927-03-06'),
(3, 'J.R.R. Tolkien', 'Británica', '1892-01-03'),
(4, 'Jane Austen', 'Británica', '1775-12-16'),
(5, 'J.K. Rowling', 'Británica', '1965-07-31'),
(6, 'Miguel de Cervantes', 'Española', '1547-09-29'),
(7, 'Fyodor Dostoevsky', 'Rusa', '1821-11-11'),
(8, 'Franz Kafka', 'Austrohúngara', '1883-07-03'),
(9, 'Harper Lee', 'Estadounidense', '1926-04-28'),
(10, 'Suzanne Collins', 'Estadounidense', '1962-08-10');



-- Inserts for Usuario (User) table
INSERT INTO Usuario (ID, Nombre, Direccion, Email, Telefono) VALUES
(1, 'Juan Pérez', 'Calle 123, Ciudad X', 'juan.perez@example.com', '+1234567890'),
(2, 'María Gómez', 'Avenida Principal, Pueblo Y', 'maria.gomez@example.com', '+0987654321'),
(3, 'Carlos Martínez', 'Calle Mayor, Ciudad Z', 'carlos.martinez@example.com', '+1357924680'),
(4, 'Ana Rodríguez', 'Paseo del Bosque, Ciudad A', 'ana.rodriguez@example.com', '+2468013579'),
(5, 'Luisa Sánchez', 'Plaza Central, Pueblo B', 'luisa.sanchez@example.com', '+3698521470'),
(6, 'Pedro López', 'Callejón Secreto, Ciudad C', 'pedro.lopez@example.com', '+1472583690'),
(7, 'Laura Fernández', 'Avenida del Parque, Ciudad D', 'laura.fernandez@example.com', '+2581470369'),
(8, 'Pablo González', 'Calle de la Luna, Pueblo C', 'pablo.gonzalez@example.com', '+9876543210'),
(9, 'Elena Ramírez', 'Paseo del Río, Ciudad E', 'elena.ramirez@example.com', '+6541237890'),
(10, 'Diego Herrera', 'Callejón Oscuro, Ciudad F', 'diego.herrera@example.com', '+3216549870'),
(11, '', '', '', '');


-- Inserts for Prestamo (Loan) table
INSERT INTO Prestamo (ID, LibroID, UsuarioID, FechaPrestamo, FechaDevolucion) VALUES
(1, 1, 2, '2023-02-10', '2023-03-10'),
(2, 3, 5, '2023-04-15', '2023-05-15'),
(3, 5, 8, '2023-06-20', '2023-07-20'),
(4, 7, 1, '2023-08-25', '2023-09-25'),
(5, 9, 4, '2023-10-30', '2023-11-30'),
(6, 2, 7, '2024-01-05', '2024-02-05'),
(7, 4, 10, '2024-03-10', '2024-04-10'),
(8, 6, 3, '2024-05-15', '2024-06-15'),
(9, 8, 6, '2024-07-20', '2024-08-20'),
(10, 10, 9, '2024-09-25', '2024-10-25'),
(11, 9, 7, '2023-09-25', '2023-10-25'),
(12, 8, NULL, '2023-02-22', '2023-02-25'),
(13, NULL, 9, '2023-02-22', '2023-02-25'),
(14, 3, 10, '2023-02-22', NULL);


select libro.Titulo, autor.nombre as nombreAutor, count(prestamo.ID) as CantidadPrestamos
from libro
left join autor on libro.autor = autor.nombre
left join prestamo on libro.ID = prestamo.LibroID
group by libro.titulo, autor.nombre;



