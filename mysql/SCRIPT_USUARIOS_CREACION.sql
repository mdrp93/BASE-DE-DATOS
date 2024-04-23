-- Crear un nuevo usuario 'admin1' con todos los privilegios
CREATE USER 'admin1'@'localhost' IDENTIFIED BY '2024';

-- Otorgar todos los privilegios al usuario 'admin1' en todas las bases de datos
GRANT ALL PRIVILEGES ON *.* TO 'admin1'@'localhost' WITH GRANT OPTION;

-- Crear otro nuevo usuario 'admin2' con todos los privilegios
CREATE USER 'admin2'@'localhost' IDENTIFIED BY 'tu_otra_contraseña';

-- Otorgar todos los privilegios al usuario 'admin2' en todas las bases de datos
GRANT ALL PRIVILEGES ON *.* TO 'admin2'@'localhost' WITH GRANT OPTION;

-- Aplicar los cambios
FLUSH PRIVILEGES;

ALTER USER 'admin1'@'localhost' IDENTIFIED BY '2024';

DROP USER 'admin2'@'localhost';
