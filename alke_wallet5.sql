-- ctrl + /
/* comentar */

/*crear base de datos*/
-- create schema alke_wallet5;

-- Crear tabla Usuario con borrado en cascada
-- CREATE TABLE Usuario (
--     user_id INT AUTO_INCREMENT PRIMARY KEY,
--     nombre VARCHAR(255) NOT NULL,
--     correo_electrónico VARCHAR(255) NOT NULL,
--     contraseña VARCHAR(255) NOT NULL,
--     saldo DECIMAL(10, 2) NOT NULL
-- );

-- Crear tabla Moneda con borrado en cascada
-- CREATE TABLE Moneda (
--     currency_id INT AUTO_INCREMENT PRIMARY KEY,
--     currency_name VARCHAR(255) NOT NULL,
--     currency_symbol VARCHAR(5) NOT NULL
-- );

-- Crear tabla Transacción con borrado en cascada
-- CREATE TABLE Transacción (
--     transaction_id INT AUTO_INCREMENT PRIMARY KEY,
--     sender_user_id INT,
--     receiver_user_id INT,
--     importe DECIMAL(10, 2) NOT NULL,
--     transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
--     currency_id INT,
--     FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id) ON DELETE CASCADE,
--     FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id) ON DELETE CASCADE,
--     FOREIGN KEY (currency_id) REFERENCES Moneda(currency_id) ON DELETE CASCADE
-- );

-- Insertar usuarios
-- INSERT INTO Usuario (nombre, correo_electrónico, contraseña, saldo) VALUES
-- ('Usuario1', 'usuario1@example.com', 'contraseña1', 1000.00),
-- ('Usuario2', 'usuario2@example.com', 'contraseña2', 500.00),
-- ('Usuario3', 'usuario3@example.com', 'contraseña3', 750.00),
-- ('Usuario4', 'usuario4@example.com', 'contraseña4', 2000.00),
-- ('Usuario5', 'usuario5@example.com', 'contraseña5', 150.00);

-- insert into usuario (nombre, correo_electrónico, contraseña, saldo) values
-- ('Usuario1', 'usuario1@example.com', 'contraseña1', 1000.00);

-- insert into usuario (nombre, correo_electrónico, contraseña, saldo) values
-- ('Usuario2', 'usuario2@example.com', 'contraseña2', 500.00);

-- Insertar monedas
-- INSERT INTO Moneda (currency_name, currency_symbol) VALUES
-- ('Euro', '€'),
-- ('Dólar', '$'),
-- ('Peso Chileno', 'CLP');

-- Insertar transacciones
-- INSERT INTO Transacción (sender_user_id, receiver_user_id, importe, currency_id) VALUES
-- (1, 2, 100.00, 1), -- Usuario1 envía 100 unidades de Moneda1 a Usuario2
-- (2, 3, 50.00, 2),  -- Usuario2 envía 50 unidades de Moneda2 a Usuario3
-- (4, 1, 200.00, 3), -- Usuario4 envía 200 unidades de Moneda3 a Usuario1
-- (5, 4, 100.00, 1), -- Usuario5 envía 100 unidades de Moneda1 a Usuario4
-- (3, 5, 20.00, 2);  -- Usuario3 envía 20 unidades de Moneda2 a Usuario5

-- Consulta para obtener las transacciones realizadas por un usuario específico
-- SELECT *
-- FROM Transacción
-- WHERE sender_user_id = 5;

-- Consulta para obtener todos los usuarios registrados
-- SELECT *
-- FROM Usuario;

-- Consulta para obtener todas las monedas registradas
-- SELECT *
-- FROM Moneda;

-- Consulta para obtener todas las transacciones registradas
-- SELECT *
-- FROM Transacción;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico
-- SELECT *
-- FROM Transacción
-- WHERE sender_user_id = 3 OR receiver_user_id = 3;

-- Consulta para obtener todas las transacciones recibidas por un usuario específico
-- SELECT *
-- FROM Transacción
-- WHERE receiver_user_id = 4;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
-- UPDATE Usuario
-- SET correo_electrónico = 'nuevo_correo@gmail.com'
-- WHERE user_id = 5;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
-- DELETE FROM Transacción
-- WHERE transaction_id = 2;

-- truncate table usuario;

-- Sentencia para DDL modificar el nombre de la columna correo_electronico por email
-- ALTER TABLE Usuario
-- CHANGE correo_electrónico email VARCHAR(255);

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
SELECT m.currency_name, u.nombre, m.currency_symbol, t.transaction_id
FROM Usuario u
JOIN Transacción t ON u.user_id = t.sender_user_id OR u.user_id = t.receiver_user_id
JOIN Moneda m ON t.currency_id = m.currency_id
WHERE u.user_id = 1;
