-- COMENTARIOS

-- SINTAXIS
-- ACCION TIPO_OBJETO OBJETO ESPECÍFICO;


-- CREAR OBJETOS
CREATE DATABASE database_prueba;

-- Elegir database
USE database_prueba;

-- Crear una Tabla
CREATE TABLE Estudiantes(
--nombrecolumna tipo_de_dato,
Nombre CHAR(20),
Apellido CHAR(50) NOT NULL,	-- Necesito que ese dato este si o si
ID_Estudiante VARCHAR(10) NOT NULL PRIMARY KEY,
DNI INT
);

-- VISTA (es una version de tabla resumida o tabla virtual)
CREATE VIEW vistaUno
AS -- Definir la estructura de este objeto
SELECT ID_Estudiante, DNI
FROM Estudiantes;

-- ESQUEMA = Dar permisos
CREATE SCHEMA uno;	-- Anteriormente en la tabla se debe definir como uno.Estudiantes


-- STORED PROCEDURE

CREATE PROCEDURE procUno
AS
SELECT * FROM vistaUno;

--ejecuto
EXEC procUno


-- ALTER (alterar la tabla - modificar la tabla)

--agregar columna
ALTER TABLE	Estudiantes
ADD Birthday datetime;

--cambiar nombre columna
EXEC sp_rename 'Estudiantes.Birthday', 'Fecha_Nacimiento';

/*
--eliminar columna
ALTER TABLE nombretabla
DROP COLUMN nombrecolumna

--modificar el tipo de dato de una columnna en una tabla
ALTER TABLE nombretabla
DROP COLUMN nombrecolumna
*/

/*	ELIMINAR OBJETOS

DROP TABLE nombretabla;
DROP DATABAse nombrebasededatos;

*/


