CREATE DATABASE ejercicios_bdd;
USE ejercicios_bdd;

-- Parte 1 crear tabla estudiante
-- Parte2, establecer llave primaria
CREATE TABLE estudiantes(
id_estudiante int PRIMARY KEY,
nombres varchar(50),
apellidos varchar(50),
edad int,
curso varchar(50),
fecha_registro varchar(50)
);

-- Parte 3 insert 15 registros
INSERT INTO estudiantes (id_estudiante, nombres, apellidos, edad, curso, fecha_registro) VALUES
(1,'Arturo', 'Cueva', 45, 'Base de Datos', '2026-01-02'),
(2,'Juan', 'Pérez', 20, 'Programacion', '2026-01-10'),
(3, 'María', 'Torres', 16, 'Redes', '2026-02-05'),
(4,'Cesar', 'Ramírez', 27, 'Base de Datos', '2026-02-20'),
(5, 'Sofía', 'López', 29, 'Programacion', '2026-03-01'),
(6, 'Jorge', 'Mendoza', 23, 'Sistemas', '2025-03-10'),
(7, 'Valentina','Herrera', 16, 'Base de Datos', '2026-03-15'),
(8, 'Diego', 'Castro', 48, 'Redes', '2026-03-20'),
(9, 'Camila', 'Flores', 56, 'Programacion', '2022-04-01'),
(10, 'Sebastian', 'Ortega', 20, 'Sistemas', '2026-04-10'),
(11, 'Lucía', 'Morales', 34, 'Base de Datos', '2026-04-15'),
(12, 'Mateo', 'Jiménez', 27, 'Redes', '2026-04-20'),
(13, 'Isabella', 'Vargas', 52, 'Programacion', '2025-05-01'),
(14, 'Sebastián','Rojas', 17, 'Sistemas', '2026-05-10'),
(15, 'Valeria',  'Núñez', 21, 'Base de Datos', '2026-05-15');

-- Parte4 Consultas SELECT
SELECT * FROM estudiantes;

SELECT nombres, curso FROM estudiantes;
SELECT nombres, apellidos, edad from estudiantes
WHERE edad BETWEEN 18 AND 25;
SELECT nombres, apellidos FROM estudiantes
WHERE curso ='Base de datos';
SELECT nombres, apellidos, fecha_registro FROM estudiantes
WHERE fecha_registro >'2026-03-01';
SELECT nombres, apellidos, fecha_registro from estudiantes
where fecha_registro between '2026-01-01' and '2026-04-30';

-- Parte5 Update
-- cambia de curso
UPDATE estudiantes
SET curso ='Sistemas'
WHERE id_estudiante =1;
-- cambiar edad
UPDATE estudiantes
SET edad =23
WHERE id_estudiante =2;
-- cambiar fecha
UPDATE estudiantes
SET fecha_registro ='2027-01-31'
WHERE id_estudiante =3;
-- cambiar varios campos a la vez
UPDATE estudiantes
SET apellidos='Castro', edad =33
WHERE id_estudiante =4;
-- cambiar de curso a todos los alumnos de Redes
UPDATE estudiantes
SET curso = 'TELECOM'
WHERE id_estudiante =5;

-- Parte6 DELETE
-- eliminar por ID
DELETE from estudiantes
WHERE id_estudiante=15;
-- eliminar por curso
DELETE from estudiantes
WHERE curso='TELECOM';
-- eliminar por edad
DELETE from estudiantes
WHERE edad= 33;
-- eliminar por fecha
DELETE from estudiantes
WHERE fecha_registro='2027-01-31';
-- eliminar por nombre y apellido
DELETE from estudiantes
WHERE nombres='Juan' AND apellidos='Perez';

-- Parte 7 Agregar columna correo
ALTER TABLE estudiantes
ADD COLUMN correo varchar(100);

-- Parte8 Actualizacion de Scripts
-- todos los INSERT
INSERT INTO estudiantes (id_estudiante,nombres, apellidos, edad, curso, fecha_registro, correo) VALUES
(16,'Ana', 'García', 20, 'Base de Datos', '2026-01-10', 'ana.garcia@mail.com'),
(17,'Luis', 'Pérez', 22, 'Programacion',  '2026-01-15', 'luis.perez@mail.com'),
(18,'Carlos', 'Ramírez', 25, 'Base de Datos', '2026-02-20', 'carlos.ramirez@mail.com');

-- algunos UPDATE
UPDATE estudiantes 
SET correo = 'lucia.morales@mail.com'     WHERE nombres = 'Lucía';
UPDATE estudiantes 
SET correo = 'jorge.mendoza@mail.com'   WHERE nombres = 'Jorge';

-- algunos SELECT
SELECT nombres, apellidos, correo FROM estudiantes 
WHERE correo IS NOT NULL;

-- Parte9 Consultas con fechas
-- 1. Mostrar estudiantes registrados después de 2026-02-01.
SELECT * FROM estudiantes
WHERE fecha_registro > '2026-02-01';

-- 2. Mostrar estudiantes registrados antes de 2026-05-01.
SELECT * FROM estudiantes
WHERE fecha_registro < '2026-05-01';
-- 3. Mostrar estudiantes registrados entre dos fechas.
SELECT * FROM estudiantes
WHERE fecha_registro between  '2026-01-01' AND '2026-06-01';

-- 4. Mostrar estudiantes registrados exactamente en 2026-03-15.
SELECT * FROM estudiantes
WHERE fecha_registro = '2026-03-15';

-- 5. Mostrar estudiantes del curso “Programacion” registrados después de 2026-01-01.
SELECT * FROM estudiantes
WHERE curso = 'Programacion' AND fecha_registro > '2026-01-01'


