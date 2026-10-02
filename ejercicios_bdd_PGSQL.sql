-- Crear y conectar base de datos
CREATE DATABASE ejercicios_bdd;

-- Luego conectarse: \c ejercicios_bdd  (en psql)
-- O seleccionar la BD en pgAdmin

-- Parte 1 y 2: Crear tabla con llave primaria
DROP TABLE IF EXISTS estudiantes;

CREATE TABLE estudiantes(
    id_estudiante INT PRIMARY KEY,
    nombres       VARCHAR(50),
    apellidos     VARCHAR(50),
    edad          INT,
    curso         VARCHAR(50),
    fecha_registro VARCHAR(50)
);

-- Parte 3: INSERT 15 registros
INSERT INTO estudiantes (id_estudiante, nombres, apellidos, edad, curso, fecha_registro) VALUES
(1,  'Arturo',    'Cueva',    45, 'Base de Datos', '2026-01-02'),
(2,  'Juan',      'Pérez',    20, 'Programacion',  '2026-01-10'),
(3,  'María',     'Torres',   16, 'Redes',          '2026-02-05'),
(4,  'Cesar',     'Ramírez',  27, 'Base de Datos', '2026-02-20'),
(5,  'Sofía',     'López',    29, 'Programacion',  '2026-03-01'),
(6,  'Jorge',     'Mendoza',  23, 'Sistemas',      '2025-03-10'),
(7,  'Valentina', 'Herrera',  16, 'Base de Datos', '2026-03-15'),
(8,  'Diego',     'Castro',   48, 'Redes',          '2026-03-20'),
(9,  'Camila',    'Flores',   56, 'Programacion',  '2022-04-01'),
(10, 'Sebastian', 'Ortega',   20, 'Sistemas',      '2026-04-10'),
(11, 'Lucía',     'Morales',  34, 'Base de Datos', '2026-04-15'),
(12, 'Mateo',     'Jiménez',  27, 'Redes',          '2026-04-20'),
(13, 'Isabella',  'Vargas',   52, 'Programacion',  '2025-05-01'),
(14, 'Sebastián', 'Rojas',    17, 'Sistemas',      '2026-05-10'),
(15, 'Valeria',   'Núñez',    21, 'Base de Datos', '2026-05-15');

-- Parte 4: Consultas SELECT
SELECT * 
FROM estudiantes;

SELECT nombres, curso FROM estudiantes;

SELECT nombres, apellidos, edad FROM estudiantes
WHERE edad BETWEEN 18 AND 25;

-- DIFERENCIA: PostgreSQL es case-sensitive en strings
-- 'Base de datos' ≠ 'Base de Datos' en PostgreSQL
SELECT nombres, apellidos FROM estudiantes
WHERE curso = 'Base de Datos';

SELECT nombres, apellidos, fecha_registro FROM estudiantes
WHERE fecha_registro > '2026-03-01';

SELECT nombres, apellidos, fecha_registro FROM estudiantes
WHERE fecha_registro BETWEEN '2026-01-01' AND '2026-04-30';

-- Parte 5: UPDATE
-- En PostgreSQL NO existe SQL_SAFE_UPDATES, los UPDATE funcionan directamente

-- Cambiar de curso
UPDATE estudiantes
SET curso = 'Sistemas'
WHERE id_estudiante = 1;

-- Cambiar edad
UPDATE estudiantes
SET edad = 23
WHERE id_estudiante = 2;

-- Cambiar fecha
UPDATE estudiantes
SET fecha_registro = '2027-01-31'
WHERE id_estudiante = 3;

-- Cambiar varios campos a la vez
UPDATE estudiantes
SET apellidos = 'Castro', edad = 33
WHERE id_estudiante = 4;

-- Cambiar curso
UPDATE estudiantes
SET curso = 'TELECOM'
WHERE id_estudiante = 5;

-- Parte 6: DELETE
-- En PostgreSQL tampoco existe safe update mode

-- Eliminar por ID
DELETE FROM estudiantes
WHERE id_estudiante = 15;

-- Eliminar por curso
DELETE FROM estudiantes
WHERE curso = 'TELECOM';

-- Eliminar por edad
DELETE FROM estudiantes
WHERE edad = 33;

-- Eliminar por fecha
DELETE FROM estudiantes
WHERE fecha_registro = '2027-01-31';

-- Eliminar por nombre y apellido
-- DIFERENCIA: PostgreSQL es case-sensitive, 'Perez' ≠ 'Pérez'
DELETE FROM estudiantes
WHERE nombres = 'Juan' AND apellidos = 'Pérez';

-- Parte 7: Agregar columna correo
-- DIFERENCIA: En PostgreSQL no se usa COLUMN en ALTER TABLE ADD (opcional)
ALTER TABLE estudiantes
ADD COLUMN correo VARCHAR(100);
-- También válido sin la palabra COLUMN:
-- ALTER TABLE estudiantes ADD correo VARCHAR(100);

-- Parte 8: Actualización de scripts

-- Nuevos INSERT con correo
INSERT INTO estudiantes (id_estudiante, nombres, apellidos, edad, curso, fecha_registro, correo) VALUES
(16, 'Ana',    'García',  20, 'Base de Datos', '2026-01-10', 'ana.garcia@mail.com'),
(17, 'Luis',   'Pérez',   22, 'Programacion',  '2026-01-15', 'luis.perez@mail.com'),
(18, 'Carlos', 'Ramírez', 25, 'Base de Datos', '2026-02-20', 'carlos.ramirez@mail.com');

-- Algunos UPDATE con correo
UPDATE estudiantes
SET correo = 'lucia.morales@mail.com'
WHERE nombres = 'Lucía';

UPDATE estudiantes
SET correo = 'jorge.mendoza@mail.com'
WHERE nombres = 'Jorge';

-- Algunos SELECT con correo
SELECT nombres, apellidos, correo FROM estudiantes
WHERE correo IS NOT NULL;

-- Parte 9: Consultas con fechas
-- 1. Registrados después de 2026-02-01
SELECT * FROM estudiantes
WHERE fecha_registro > '2026-02-01';

-- 2. Registrados antes de 2026-05-01
SELECT * FROM estudiantes
WHERE fecha_registro < '2026-05-01';

-- 3. Entre dos fechas
SELECT * FROM estudiantes
WHERE fecha_registro BETWEEN '2026-01-01' AND '2026-06-01';

-- 4. Exactamente el 2026-03-15
SELECT * FROM estudiantes
WHERE fecha_registro = '2026-03-15';

-- 5. Curso "Programacion" después de 2026-01-01
SELECT * FROM estudiantes
WHERE curso = 'Programacion' AND fecha_registro > '2026-01-01';