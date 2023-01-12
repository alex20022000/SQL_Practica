	/*#############		ALexander Hector Dalle Rive Prieto		10/01/2023		#############*/

/*	1.-Indicar cuántos cursos y carreras  tiene el área de Data. Renombrar la nueva columna como cant_asignaturas. 
	Keywords: Tipo, Área, Asignaturas.*/

	USE CoderHouse;

	SELECT * FROM Area;

	SELECT * FROM Asignaturas;

	SELECT COUNT(Tipo) AS Cantidad_Asignaturas							-- Cuento los tipos y asigno un alias
	FROM Asignaturas
	WHERE Area = (SELECT AreaID FROM Area WHERE Nombre ='Data');		-- Relaciono a traves del ID con la tabla de Area


/*	2.-Se requiere saber cual es el nombre, el documento de identidad y el teléfono de los estudiantes que son profesionales 
	en agronomía y que nacieron entre el año 1970 y el año 2000. 
	Keywords: Estudiantes, Profesión, Fecha de Nacimiento.*/

	USE CoderHouse;

	SELECT * FROM Estudiantes;

	/* El campo Fecha De Nacimiento esta mal, lo renombramos como "Fecha_De_Nacimiento"*/
	EXEC sp_rename 'Estudiantes.Fecha De Nacimiento', 'Fecha_De_Nacimiento', 'COLUMN';

	SELECT * FROM Profesiones;	-- Agronomia corresponde al ID numero 6

	SELECT Nombre, Documento, Telefono, YEAR(Fecha_De_Nacimiento) AS Fecha_Nac
	FROM Estudiantes
	WHERE (Profesion = (SELECT ProfesionesID FROM Profesiones WHERE ProfesionesID = 6)) AND (YEAR(Fecha_De_Nacimiento) BETWEEN 1970 AND 2000);

/*	3.-Se requiere un listado de los docentes que ingresaron en el año 2021 y concatenar los campos nombre y apellido. 
	El resultado debe utilizar un separador: guión (-). 
	Ejemplo: Elba-Jimenez. Renombrar la nueva columna como Nombres_Apellidos. Los resultados de la nueva columna deben estar en mayúsculas. 
	Keywords: Staff, Fecha Ingreso, Nombre, Apellido. */

	SELECT * FROM Staff;

	/* El campo Fecha Ingreso esta mal, lo renombramos como "Fecha_Ingreso"*/
	EXEC sp_rename 'Staff.Fecha Ingreso', 'Fecha_Ingreso', 'COLUMN';

	SELECT Nombre, Apellido, UPPER(CONCAT(Nombre,' - ', Apellido)) AS Nombres_Apellidos
	FROM Staff
	WHERE YEAR(Fecha_Ingreso) = 2021;

/*	4.-Indicar la cantidad de encargados de docentes y de tutores. Renombrar la columna como CantEncargados. 
	Quitar la palabra ”Encargado ”en cada uno de los registros. Renombrar la columna como NuevoTipo. 
	Keywords: Encargado, tipo, Encargado_ID.*/



/*	5.- Indicar cuál es el precio promedio de las carreras y los cursos por jornada. Renombrar la nueva columna como Promedio. 
	Ordenar los promedios de Mayor a menor 
	Keywords: Tipo, Jornada, Asignaturas. */

	SELECT * FROM Asignaturas;

	SELECT AVG(Costo) AS Promedio, Jornada, Tipo
	FROM Asignaturas
	GROUP BY Jornada, Tipo
	ORDER BY Promedio DESC

/*	6.- Se requiere calcular la edad de los estudiantes en una nueva columna. Renombrar a la nueva columna Edad. 
	Filtrar solo los que son mayores de 18 años. Ordenar de Menor a Mayor 
	Keywords: Fecha de Nacimiento, Estudiantes.	*/

	SELECT * FROM Estudiantes;

	SELECT DATEDIFF(YEAR, Fecha_De_Nacimiento, GETDATE()) AS Edad
	FROM Estudiantes
	WHERE DATEDIFF(YEAR, Fecha_De_Nacimiento, GETDATE()) >= 18
	ORDER BY Edad;

/*	7.- Se requiere saber el Nombre,el correo, la camada y la fecha de ingreso de personas del staff que contienen correo .edu y 
	su DocenteID se mayor o igual que 100 
	Keywords: Staff, correo, DocentesID	*/

	SELECT * FROM Staff;

	SELECT Nombre, Correo, Camada Fecha_Ingreso
	FROM Staff
	WHERE RIGHT(Correo, 4)= '.edu' 
	AND DocentesID >= 100;

/*	8.- Se requiere conocer el documento, el domicilio, el código postal y el nombre de los primeros estudiantes que se registraron en la plataforma. 
	Keywords: Documento, Estudiantes, Fecha Ingreso.	*/

	SELECT * FROM Estudiantes;

	SELECT Documento, Domicilio, [Codigo Postal], Nombre, [Fecha Ingreso]		-- Se pone entre corchetes ya que el campo tiene espacios (mala practica)
	FROM Estudiantes
	ORDER BY [Fecha Ingreso];

/*	9.- Indicar el nombre, apellido y documento de identidad de los docentes y tutores que tienen asignaturas “UX” . 
	Keywords: Staff, Asignaturas, Nombre, Apellido.	*/

	SELECT * FROM Staff;
	SELECT * FROM Asignaturas;


	SELECT Nombre, Apellido, Documento
	FROM Staff
	WHERE Asignatura = (SELECT AsignaturasID FROM Asignaturas WHERE Nombre = '%UX%');

/*	10.- Se desea calcular el 25% de aumento para las asignaturas del área de marketing de la jornada mañana se deben traer todos los campos, mas el de 
	los cálculos correspondientes el porcentaje y el Nuevo costo debe estar en decimal con 3 digitos. 
	Renombrar el calculo del porcentaje con el nombre porcentaje y la suma del costo mas el porcentaje por NuevoCosto. 
	Keywords: Asignaturas, Costo, Área, Jornada, Nombre	*/

	--SELECT * FROM Area;
	SELECT * FROM Asignaturas;

	SELECT Nombre, Costo, ((Costo * 25)/100) AS Porcentaje, ROUND(CONVERT(float, Costo + ((Costo * 25)/100)), 3) AS Nuevo_Costo
	FROM Asignaturas
	WHERE Nombre LIKE '%Marketing%'
	AND Jornada LIKE 'Manana';
