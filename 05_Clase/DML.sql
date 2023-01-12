-- CLASE 5 DML

ALTER TABLE Estudiantes
ADD FechaNacimiento DATETIME;  



-- INSERT

--insert into nombre_tabla (campo1, campo2, campo3 …. campoN)
--values (valor1, valor2, valor3…. valorN);




-- UPDATE
--update nombre_tabla SET nombre_campo_a_reemplazar = valor_nuevo
--WHERE nombre_campo_condicional = valor_condicion;

UPDATE Estudiantes SET Nombre = 'Estela'
WHERE ID_Estudiante = 13;






-- DELETE
DELETE FROM Estudiantes
WHERE ID_Estudiante = 100;



DELETE FROM Estudiantes;



-- ver toda la tabla
SELECT * FROM Estudiantes;