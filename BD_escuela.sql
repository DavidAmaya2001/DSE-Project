USE MASTER
--CREANDO BASE DE DATOS
CREATE DATABASE BD_escuela
USE BD_escuela
GO

--CREANDO TABLAS

--TABLA ESTADO
create table Estado
(
	id_Estado int IDENTITY(1,1),
	estado varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_estado PRIMARY KEY(id_Estado)
);

INSERT INTO Estado(estado) VALUES('activo'),('inactivo');

--TABLA Nivel
CREATE TABLE Nivel
(
	id_Nivel int IDENTITY(1,1),
	nombreNivel varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_nivel PRIMARY KEY(id_Nivel)
);
INSERT INTO Nivel(nombreNivel) VALUES('administrador'),('profesor');

--TABLA SEXO
CREATE TABLE Sexo
(
	id_Sexo int IDENTITY(1,1),
	nombreSexo varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT id_Sexo PRIMARY KEY(id_Sexo)
);
INSERT INTO Sexo(nombreSexo) VALUES('M'),('F');

--TABLA PROFESOR
create table Profesor
(
	id_Profesor int IDENTITY(1,1),
	DUI varchar(20) not null,
	NIT varchar(20) not null,
	nombreProfesor varchar(50) not null,
	apellidoProfesor varchar(50) not null,
	edadProfesor int not null,
	direccionProfesor varchar(100) not null,
	telefonoProfesor varchar(10) not null,
	correoProfesor varchar(150) not null,
	fechaNacProfesor date not null,
	fotoPerfilProfesor image,
	numeroEscalafon varchar(20) not null,
	id_Nivel int not null,
	id_Sexo int not null,
	id_Estado int not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_Profesor PRIMARY KEY(id_Profesor),
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_profesor_nivel FOREIGN KEY(id_Nivel) REFERENCES Nivel(id_Nivel),
	CONSTRAINT fk_profesor_sexo FOREIGN KEY(id_Nivel) REFERENCES Sexo(id_Sexo),
	CONSTRAINT fk_profesor_estado FOREIGN KEY(id_Estado) REFERENCES Estado(id_Estado)
);

INSERT INTO Profesor(DUI,NIT,nombreProfesor,apellidoProfesor,edadProfesor,direccionProfesor,telefonoProfesor,correoProfesor,fechaNacProfesor,fotoPerfilProfesor,numeroEscalafon,id_Nivel,id_Sexo,id_Estado) VALUES('11425','5555','Juan','Perez',15,'San Salvador','77777','correo','01/01/2000','foto','555',1,1,1);
INSERT INTO Profesor(DUI,NIT,nombreProfesor,apellidoProfesor,edadProfesor,direccionProfesor,telefonoProfesor,correoProfesor,fechaNacProfesor,fotoPerfilProfesor,numeroEscalafon,id_Nivel,id_Sexo,id_Estado) VALUES('23223','3222','Pedro','Diaz',15,'San Miguel','33333','correo','01/01/1990','foto','444',2,1,1)
INSERT INTO Profesor(DUI,NIT,nombreProfesor,apellidoProfesor,edadProfesor,direccionProfesor,telefonoProfesor,correoProfesor,fechaNacProfesor,fotoPerfilProfesor,numeroEscalafon,id_Nivel,id_Sexo,id_Estado) VALUES('89789','11111','Juan','Perez',15,'San Salvador','45552','correo','01/01/2000','foto','888',1,1,1);
select * from profesor	

--TABLA USUARIO
CREATE TABLE Usuario
(
	id_Usuario int IDENTITY(1,1),
	usuario varbinary(255) not null,
	contra varbinary(MAX) not null,
	id_Profesor int not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_Usuario PRIMARY KEY(id_Usuario)
);
INSERT INTO Usuario(usuario,contra,id_Profesor) VALUES( CAST('admin' AS VARBINARY(MAX)),CAST('123' AS VARBINARY(MAX)),1)
INSERT INTO Usuario(usuario,contra,id_Profesor) VALUES( CAST('profesor' AS VARBINARY(MAX)),CAST('123' AS VARBINARY(MAX)),2)
select * from Usuario

--TABLA ALUMNO
create table Alumno
(
	id_Alumno int IDENTITY(1,1),
	numPartida varchar(20) not null,
	NIE varchar(20) not null,
	nombreAlumno varchar(50) not null,
	apellidoAlumno varchar(50) not null,
	edadAlumno int not null,
	direccionAlumno varchar(100) not null,
	telefonoAlumno varchar(10) not null,
	fechaNacAlumno date not null,
	NombrePapaAlumno varchar(100) not null,
	NombreMamaAlumno varchar(100) not null,
	NombreEncargadoAlumno varchar(100) not null,
	fotoAlumno image not null,
	id_Sexo int not null,
	id_Estado int not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_alumno PRIMARY KEY(id_Alumno),
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_alumno_sexo FOREIGN KEY(id_Sexo) REFERENCES Sexo(id_Sexo),
	CONSTRAINT fk_alumno_estado FOREIGN KEY(id_Estado) REFERENCES Estado(id_Estado)
);
ALTER TABLE Alumno
ADD estadoMatricula int null 
--TABLA MATERIA
create table Materia
(
	id_Materia int IDENTITY(1,1),
	nombreMateria varchar(100) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_materia PRIMARY KEY(id_Materia)
);
INSERT INTO Materia(nombreMateria) 
VALUES('Lenguaje y Literatura'),('Estudios Sociales'),('Matematicas'),('Ciencias y Medio Ambiente'),('Artistica'),('Educación Fisica'),('Moral y Civica'),('Ingles');
select * from Materia

--TABLA GRADO
create table Grado
(
	id_Grado int IDENTITY(1,1),
	nombreGrado varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_grado PRIMARY KEY(id_Grado)
);
INSERT INTO Grado(nombreGrado) 
VALUES('Parvularia'),('Primero'),('Segundo'),('Tercero'),('Cuarto'),('Quinto'),('Sexto'),('Septimo'),('Octavo'),('Noveno');
select * from Grado

--TABLA SECCION
create table Seccion
(
	id_Seccion int IDENTITY(1,1),
	Seccion varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_seccion PRIMARY KEY(id_Seccion)
);
INSERT INTO Seccion(Seccion) 
VALUES('A'),('B'),('C');
select * from Seccion

--TABLA Grupo
create table Detalle_Grado_Seccion
(
	id_Detalle_Grado_Seccion int IDENTITY(1,1),
	id_Grado int not null,
	id_Seccion int not null,
	id_ProfesorEncargado int not null,
	anioEscolar varchar(10) not null,
	--LLAVES PRIMARIA
	CONSTRAINT pk_detalle_grado_seccion PRIMARY KEY(id_Detalle_Grado_Seccion),
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_detalle_grado FOREIGN KEY(id_Grado) REFERENCES Grado(id_Grado),
	CONSTRAINT fk_detalle_seccion FOREIGN KEY(id_Seccion) REFERENCES Seccion(id_Seccion),
	CONSTRAINT fk_detalle_profesor FOREIGN KEY(id_ProfesorEncargado) REFERENCES Profesor(id_Profesor)
);

INSERT INTO Detalle_Grado_Seccion(id_Grado,id_Seccion,id_ProfesorEncargado,anioEscolar) 
VALUES(1,1,1,'2021'),(1,2,1,'2021'),(1,3,1,'2021'),
(2,1,2,'2021'),(2,2,2,'2021'),(2,3,2,'2021'),
(3,1,3,'2021'),(3,2,3,'2021'),(3,3,3,'2021');


--TABLA REGISTRO_ALUMNO
create table Registro_Alumno
(
	idMatricula int identity(1,1) primary key,
	id_Detalle_Grado_Seccion int not null,
	id_Alumno int not null,
	estadoActivo int null,
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_registroAlumno_detalleSeccion FOREIGN KEY(id_Detalle_Grado_Seccion) REFERENCES Detalle_Grado_Seccion(id_Detalle_Grado_Seccion),
	CONSTRAINT fk_registroAlumno_alumno FOREIGN KEY(id_Alumno) REFERENCES Alumno(id_Alumno)
);

--TABLA CURSO
create table Curso
(
	id_Curso int IDENTITY(1,1),
	id_Detalle_Grado_Seccion int not null,
	id_Materia int not null,
	id_Profesor int not null,
	--LLAVES PRIMARIA
	CONSTRAINT pk_curso PRIMARY KEY(id_Curso),
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_detalleMateria_detalleSeccion FOREIGN KEY(id_Detalle_Grado_Seccion) REFERENCES Detalle_Grado_Seccion(id_Detalle_Grado_Seccion),
	CONSTRAINT fk_detalleMateria_materia FOREIGN KEY(id_Materia) REFERENCES Materia(id_Materia),
	CONSTRAINT fk_detalleMateria_profesor FOREIGN KEY(id_Profesor) REFERENCES Profesor(id_Profesor)
);
GO

--PROCEDIMIENTOS ALMACENADOS
--MOSTRAR NIVEL
create proc ps_mostrar_nivel_usuario
(@usuario varchar(100),
@contra varchar(100))
as
begin try
begin tran
	SELECT id_Nivel, P.id_Profesor,P.nombreProfesor FROM Profesor P 
	INNER JOIN Usuario U ON p.id_Profesor = U.id_Profesor 
	WHERE U.usuario = CAST(@usuario AS VARBINARY(100)) AND contra =  CAST(@contra AS VARBINARY(100)) AND id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar id_profesor
create proc ps_mostrar_id_profesor
(@usuario varchar(100),
@contra varchar(100))
as
begin try
begin tran
	SELECT P.id_Profesor FROM Profesor P 
	INNER JOIN Usuario U ON p.id_Profesor = U.id_Profesor 
	WHERE U.usuario = CAST(@usuario AS VARBINARY(100)) AND contra =  CAST(@contra AS VARBINARY(100)) AND id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar NombreProfesor
create proc ps_mostrar_nombre_profesor
(@usuario varchar(100),
@contra varchar(100))
as
begin try
begin tran
	SELECT P.nombreProfesor, P.apellidoProfesor FROM Profesor P 
	INNER JOIN Usuario U ON p.id_Profesor = U.id_Profesor 
	WHERE U.usuario = CAST(@usuario AS VARBINARY(100)) AND contra =  CAST(@contra AS VARBINARY(100)) AND id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar FotoProfesor
create proc ps_mostrar_foto_profesor
(@usuario varchar(100),
@contra varchar(100))
as
begin try
begin tran
	SELECT P.fotoPerfilProfesor FROM Profesor P 
	INNER JOIN Usuario U ON p.id_Profesor = U.id_Profesor 
	WHERE U.usuario = CAST(@usuario AS VARBINARY(100)) AND contra =  CAST(@contra AS VARBINARY(100)) AND id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar Alumnos
/*create proc ps_mostrar_alumnos
as
begin try
begin tran
	SELECT * FROM Alumno
commit
end try
begin catch
rollback
print error_message()
end catch;
GO*/

--Insertar grado
create proc ps_insertar_grado
@nombreGrado varchar(20)
as
begin try
begin tran
	INSERT INTO grado (nombreGrado) VALUES(@nombreGrado)
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Modificar grado
create proc ps_modificar_grado
(@idGrado int, 
@nombreGrado varchar(20))
as
begin try
begin tran
	update grado set nombreGrado=@nombreGrado
	where id_Grado=@idGrado
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Eliminar grado
create proc ps_eliminar_grado
@idGrado int
as
begin try
begin tran
	delete from grado where id_Grado=@idGrado
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar Grados
create proc ps_mostrar_grados
as
begin try
begin tran
	SELECT id_Grado as [Num], nombreGrado as [Grado] FROM Grado
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar Grados
create proc ps_buscar_grados
@nombreGrado varchar(20)
as
begin try
begin tran
	SELECT id_Grado as [Num], nombreGrado as [Grado] FROM Grado
	WHERE nombreGrado LIKE ('%'+@nombreGrado+'%')
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--SECCIONES
--Insertar una seccion
create proc ps_insertar_seccion
@nombreSeccion varchar(20)
as
begin try
begin tran
	INSERT INTO Seccion (Seccion) VALUES(@nombreSeccion)
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Modificar seccion
create proc ps_modificar_seccion
(@idSeccion int, 
@nombreSeccion varchar(20))
as
begin try
begin tran
	update Seccion set Seccion=@nombreSeccion
	where id_Seccion=@idSeccion
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Eliminar seccion
create proc ps_eliminar_seccion
@idSeccion int
as
begin try
begin tran
	delete from Seccion where id_Seccion =@idSeccion
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar secciones
create proc ps_mostrar_secciones
as
begin try
begin tran
	SELECT id_Seccion as [Num], Seccion as [Seccion] FROM Seccion
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar Secciones
create proc ps_buscar_secciones
@nombreSeccion varchar(20)
as
begin try
begin tran
	SELECT id_Seccion as [Num], Seccion as [Seccion] FROM Seccion
	WHERE Seccion LIKE ('%'+@nombreSeccion+'%')
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Crear Materia
create proc ps_insertar_materia
@nombreMateria varchar(20)
as 
begin try
begin tran
	INSERT INTO materia(nombreMateria) VALUES (@nombreMateria)
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Mostrar materias
create proc ps_mostrar_materias
as
begin try
begin tran
	SELECT id_Materia as [Num], nombreMateria as [Materia] FROM Materia
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Modificar materias
create proc ps_modificar_materia
(@idMateria int, 
@nombreMateria varchar(20))
as
begin try
begin tran
	update Materia set nombreMateria=@nombreMateria where id_Materia=@idMateria
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Eliminar materia
create proc ps_eliminar_materia
@idMateria int
as
begin try
begin tran
	delete from Materia where id_Materia = @idMateria
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar Secciones
create proc ps_buscar_materia
@nombreMateria varchar(20)
as
begin try
begin tran
	SELECT id_Materia as [Num], nombreMateria as [Materia] FROM Materia WHERE nombreMateria LIKE ('%'+@nombreMateria+'%')
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Mostrar Alumnos
create proc ps_mostrar_ma
as
begin try
begin tran
	SELECT * FROM Alumno
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar profesores
create proc ps_leer_profesores
as
begin try
begin tran
	SELECT CONCAT(nombreProfesor,' ',apellidoProfesor) as Profesor FROM Profesor
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--PS para leer detalles de grado
create proc ps_leer_detalle_Grado
as
begin try
begin tran
	select d.id_Detalle_Grado_Seccion as Codigo,  CONCAT(p.nombreProfesor,' ',p.apellidoProfesor) as Profesor, g.nombreGrado as Grado, s.Seccion as Seccion, d.anioEscolar as Año from Grado g, Profesor p, Seccion s, Detalle_Grado_Seccion d WHERE g.id_Grado =d.id_Grado AND p.id_Profesor = d.id_ProfesorEncargado AND s.id_Seccion = d.id_Seccion 
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--PS para obtener idMateria 
create proc ps_obtener_idMateria
@nombreMateria varchar(20)
as
begin try
begin tran
	SELECT id_Materia as Codigo FROM Materia WHERE nombreMateria = @nombreMateria
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--ps para obtener un grupo
create proc ps_mostrar_cursos
@id_Profesor int
as
begin try
begin tran
	SELECT CONCAT(g.nombreGrado, ' ', s.Seccion) as Curso, id_Detalle_Grado_Seccion from Detalle_Grado_Seccion as dt INNER JOIN Grado as g on dt.id_Grado=g.id_Grado INNER JOIN Seccion as s on dt.id_Seccion=s.id_Seccion WHERE id_ProfesorEncargado= @id_Profesor
commit
end try
begin catch
rollback
print error_message()
end catch;
GO
 
--PS para obtener idProfesor 
create proc ps_obtener_idProfesor
@nombreProfesor varchar(20),
@ApellidoProfesor varchar(20)
as
begin try
begin tran
	SELECT id_Profesor as CodigoP FROM Profesor WHERE nombreProfesor = @nombreProfesor AND apellidoProfesor = @ApellidoProfesor
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Insertar curso
create proc ps_insertar_curso
@idDetalle int,
@idMateria int,
@idProfesor int
as
begin try
begin tran
	INSERT INTO Curso (id_Detalle_Grado_Seccion, Id_Materia, Id_profesor) VALUES (@idDetalle, @idMateria, @idProfesor)
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

----ps para obtener los alumnos de un grupo
create proc ps_mostrar_alumnos_nombres
@grupo int 
as
begin try
begin tran
	Select a.nombreAlumno as [Nombres], a.apellidoAlumno as [Apellidos], a.edadAlumno as Edad, a.NIE as [NIE], a.telefonoAlumno as [Telefono], a.fechaNacAlumno as [Fecha de nacimiento], a.NombrePapaAlumno as [Padre], a.NombreMamaAlumno
	as [Madre], a.NombreEncargadoAlumno as [Encargado] from Registro_Alumno as ra
	INNER JOIN Alumno as a ON ra.id_Alumno=a.id_Alumno
	INNER JOIN Detalle_Grado_Seccion as dt ON ra.id_Detalle_Grado_Seccion=dt.id_Detalle_Grado_Seccion WHERE dt.id_Detalle_Grado_Seccion=@grupo
commit
end try
begin catch
rollback
print error_message()
end catch;
GO
----ps para obtener el id de detalle grado-seccion
create proc ps_mostrar_alumnos_curso
@nombreGrado varchar(20),
@nombreSeccion varchar(20)
as
begin try
begin tran
	SELECT id_Detalle_Grado_Seccion as Codigo FROM Detalle_Grado_Seccion d, Grado g, Seccion s WHERE g.id_Grado = d.id_Grado AND s.id_Seccion = d.id_Seccion AND g.nombreGrado = @nombreGrado AND  s.Seccion = @nombreSeccion
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--PROCEDIMIENTOS ALMACENADOS PARA PROFESOR*****************************************
--Modificar profesor
create proc ps_modificar_profesor
(@idProfesor int,
@dui varchar(20),
@nit varchar(20),
@nombreProfesor varchar(50),
@apellidoProfesor varchar(50),
@direccionProfesor varchar(100),
@telefonoProfesor varchar(10),
@correoProfesor varchar(150),
@fechaNacProfesor date,
@fotoPerfilProfesor image,
@numeroEscalafon varchar(20),
@sexo varchar(20))
as
begin try
begin tran
	update Profesor set DUI=@dui,NIT=@nit,nombreProfesor=@nombreProfesor,apellidoProfesor=@apellidoProfesor, edadProfesor = (select (cast(datediff(dd,@fechaNacProfesor,GETDATE()) / 365.25 as int))),
	direccionProfesor=@direccionProfesor, telefonoProfesor=@telefonoProfesor,correoProfesor=@correoProfesor,fechaNacProfesor=@fechaNacProfesor,fotoPerfilProfesor=@fotoPerfilProfesor,numeroEscalafon=@numeroEscalafon,
	id_Sexo=CONVERT(INT,(select id_Sexo from Sexo where nombreSexo = @sexo))
	where id_Profesor = @idProfesor
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Eliminar profesor
create proc ps_eliminar_profesor
@idProfesor int
as
begin try
begin tran
	update Profesor set id_Estado = 2  where id_Profesor = @idProfesor
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Buscar Profesores
create proc ps_buscar_profesores
@filtro varchar(200)
as
begin try
begin tran
	SELECT id_Profesor as [Num], nombreProfesor as [Nombres],apellidoProfesor as [Apellidos], fechaNacProfesor as [Fecha de nacimiento]
	, telefonoProfesor as [Teléfono], correoProfesor as [Correo], DUI as [DUI], NIT as [NIT], numeroEscalafon as [Escalafon], direccionProfesor as [Dirección]
	, S.nombreSexo as [Sexo], edadProfesor as [Edad] FROM Profesor P
	INNER JOIN Sexo S ON S.id_Sexo = P.id_Sexo
	WHERE nombreProfesor LIKE ('%'+@filtro+'%') OR apellidoProfesor LIKE ('%'+@filtro+'%') OR fechaNacProfesor LIKE ('%'+@filtro+'%') OR telefonoProfesor LIKE ('%'+@filtro+'%') 
	OR correoProfesor LIKE ('%'+@filtro+'%') OR DUI LIKE ('%'+@filtro+'%') OR NIT LIKE ('%'+@filtro+'%') OR numeroEscalafon LIKE ('%'+@filtro+'%') OR direccionProfesor LIKE ('%'+@filtro+'%')
	OR S.nombreSexo LIKE ('%'+@filtro+'%')
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar profesores
create proc ps_mostrar_profesor
as
begin try
begin tran
	SELECT id_Profesor as [Num], nombreProfesor as [Nombres],apellidoProfesor as [Apellidos], fechaNacProfesor as [Fecha de nacimiento]
	, telefonoProfesor as [Teléfono], correoProfesor as [Correo], DUI as [DUI], NIT as [NIT], numeroEscalafon as [Escalafon], direccionProfesor as [Dirección]
	, S.nombreSexo as [Sexo], edadProfesor as [Edad] FROM Profesor P
	INNER JOIN Sexo S ON S.id_Sexo = P.id_Sexo
	WHERE id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Insertar Profesores
create proc ps_insertar_profesor
(@dui varchar(20),
@nit varchar(20),
@nombreProfesor varchar(50),
@apellidoProfesor varchar(50),
@direccionProfesor varchar(100),
@telefonoProfesor varchar(10),
@correoProfesor varchar(150),
@fechaNacProfesor date,
@fotoPerfilProfesor image,
@numeroEscalafon varchar(20),
@sexo varchar(20))
as 
begin try
begin tran
	INSERT INTO Profesor(DUI,NIT,nombreProfesor,apellidoProfesor,edadProfesor,direccionProfesor,telefonoProfesor,correoProfesor,fechaNacProfesor,fotoPerfilProfesor,numeroEscalafon,id_Nivel,id_Sexo,id_Estado)
	VALUES(@dui,@nit,@nombreProfesor,@apellidoProfesor,(select (cast(datediff(dd,@fechaNacProfesor,GETDATE()) / 365.25 as int))),@direccionProfesor,@telefonoProfesor,@correoProfesor,@fechaNacProfesor,@fotoPerfilProfesor,@numeroEscalafon,2, CONVERT(INT,(select id_Sexo from Sexo where nombreSexo = @sexo)) ,1);
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Extraer foto de profesor con ID
create proc ps_extraer_foto_profesor
@idProfesor varchar(20)
as
begin try
begin tran
	SELECT fotoPerfilProfesor FROM Profesor
	WHERE id_Profesor =  @idProfesor
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--TRIGGER Crear usuario al insertar profesor
CREATE TRIGGER trg_nuevo_usuario
ON Profesor
AFTER INSERT
AS
	IF EXISTS(SELECT * FROM inserted)
	BEGIN
	INSERT INTO Usuario(usuario,contra,id_Profesor) VALUES( CAST((SELECT i.nombreProfesor FROM inserted i) AS VARBINARY(MAX)),CAST((SELECT i.numeroEscalafon FROM inserted i) AS VARBINARY(MAX)),(SELECT i.id_Profesor FROM inserted i))
	END
GO
--FIN PROCEDIMIENTOS ALMACENADOS PARA ALUMNO*****************************************

--Procedimiento para leer cursos
create proc ps_leer_cursos
as
begin try
begin tran
	SELECT c.id_Curso as Codigo_Curso, c.id_Detalle_Grado_Seccion as Codigo_Detalle, m.nombreMateria as Materia, CONCAT(p.nombreProfesor,' ',p.apellidoProfesor ) as Profesor FROM Curso c, Materia m, Profesor p WHERE m.id_Materia = c.id_Materia AND p.id_Profesor = c.id_Profesor
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Procedimiento para obtener los cursos de un profesor
create proc ps_mostrar_cursos_profesor
@id_Profesor int,
@anio int
as
begin try
begin tran
	select m.nombreMateria as [Materia],g.nombreGrado as [Grado], s.Seccion as [Sección], dt.anioEscolar as [Año Escolar], COUNT(Ra.id_Alumno) as [Cantidad de alumnos]
	from Curso as C 
	INNER JOIN Materia as M on C.id_Materia=M.id_Materia 
	INNER JOIN Profesor as P on P.id_Profesor=C.id_Profesor
	INNER JOIN Detalle_Grado_Seccion  as DT on c.id_Detalle_Grado_Seccion=DT.id_Detalle_Grado_Seccion
	INNER JOIN Seccion as S on DT.id_Seccion=s.id_Seccion
	INNER JOIN Grado as G on dt.id_Grado=g.id_Grado
	INNER JOIN Registro_Alumno as Ra on dt.id_Detalle_Grado_Seccion=ra.id_Alumno
	WHERE p.id_Profesor=@id_Profesor and anioEscolar=@anio Group by m.nombreMateria,g.nombreGrado,s.Seccion,dt.anioEscolar 

commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar Grados
create proc ps_buscar_grados_curso
@nombreGrado varchar(20),
@idprofesor int
as
begin try
begin tran
	select m.nombreMateria as [Materia],g.nombreGrado as [Grado], s.Seccion as [Sección], dt.anioEscolar as [Año Escolar], COUNT(Ra.id_Alumno) as [Cantidad de alumnos]
	from Curso as C 
	INNER JOIN Materia as M on C.id_Materia=M.id_Materia 
	INNER JOIN Profesor as P on P.id_Profesor=C.id_Profesor
	INNER JOIN Detalle_Grado_Seccion  as DT on c.id_Detalle_Grado_Seccion=DT.id_Detalle_Grado_Seccion
	INNER JOIN Seccion as S on DT.id_Seccion=s.id_Seccion
	INNER JOIN Grado as G on dt.id_Grado=g.id_Grado
	INNER JOIN Registro_Alumno as Ra on dt.id_Detalle_Grado_Seccion=ra.id_Alumno
	WHERE p.id_Profesor=@idprofesor and nombreGrado LIKE ('%'+@nombreGrado+'%') Group by m.nombreMateria,g.nombreGrado,s.Seccion,dt.anioEscolar 
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Procedimiento para eliminar cursos
create proc ps_eliminar_curso
@idCurso int 
as
begin try
begin tran
	DELETE FROM Curso WHERE id_Curso = @idCurso
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Procedimiento para modificar cursos
create proc ps_modificar_curso
@idCurso int,
@idMateria int,
@idProfesor int
as
begin try
begin tran
	UPDATE Curso  set id_Materia = @idMateria, id_Profesor = @idProfesor WHERE id_Curso = @idCurso
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--PROCEDIMIENTOS ALMACENADOS PARA ALUMNO*****************************************

--Modificar Alumno
create proc ps_modificar_alumno
(@idAlumno int,
@nombreAlumno varchar(50),
@apellidoAlumno varchar(50),
@numPartida varchar(20),
@NIE varchar(20),
@direccionAlumno varchar(100),
@telefonoAlumno varchar(10),
@fechaNacAlumno date,
@fotoAlumno image,
@NombrePapaAlumno varchar(100),
@NombreMamaAlumno varchar(100),
@NombreEncargadoAlumno varchar(100),
@sexo varchar(20))
as
begin try
begin tran
	update Alumno set nombreAlumno=@nombreAlumno,apellidoAlumno=@apellidoAlumno,numPartida=@numPartida,NIE=@NIE, direccionAlumno = @direccionAlumno,
	telefonoAlumno=@telefonoAlumno, fechaNacAlumno=@fechaNacAlumno,fotoAlumno=@fotoAlumno,NombrePapaAlumno=@NombrePapaAlumno,NombreMamaAlumno=@NombreMamaAlumno,NombreEncargadoAlumno=@NombreEncargadoAlumno,
	id_Sexo=CONVERT(INT,(select id_Sexo from Sexo where nombreSexo = @sexo)), edadAlumno = (select (cast(datediff(dd,@fechaNacAlumno,GETDATE()) / 365.25 as int)))
	where id_Alumno = @idAlumno
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Eliminar Alumno
create proc ps_eliminar_alumno
@idAlumno int
as
begin try
begin tran
	update Alumno set id_Estado = 2  where id_Alumno = @idAlumno
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Buscar Alumno
create proc ps_buscar_alumno
@filtro varchar(200)
as
begin try
begin tran
	SELECT id_Alumno as [Num], nombreAlumno as [Nombres],apellidoAlumno as [Apellidos], fechaNacAlumno as [Fecha de nacimiento]
	, telefonoAlumno as [Telefono], edadAlumno as [Edad], NIE as [NIE] , numPartida as [Num. Partida],  direccionAlumno as [Direccion]
	, S.nombreSexo as [Sexo], NombrePapaAlumno as [Padre], NombrePapaAlumno as [Madre], NombreEncargadoAlumno as [Encargado] FROM Alumno A
	INNER JOIN Sexo S ON S.id_Sexo = A.id_Sexo
	WHERE ( nombreAlumno LIKE ('%'+@filtro+'%') OR apellidoAlumno LIKE ('%'+@filtro+'%') OR fechaNacAlumno LIKE ('%'+@filtro+'%') OR telefonoAlumno LIKE ('%'+@filtro+'%') 
	OR NIE LIKE ('%'+@filtro+'%') OR numPartida LIKE ('%'+@filtro+'%') OR edadAlumno LIKE ('%'+@filtro+'%') OR NombrePapaAlumno LIKE ('%'+@filtro+'%') OR NombreMamaAlumno LIKE ('%'+@filtro+'%')
	OR NombreEncargadoAlumno LIKE ('%'+@filtro+'%') OR direccionAlumno LIKE ('%'+@filtro+'%')
	OR S.nombreSexo LIKE ('%'+@filtro+'%') ) AND id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Mostrar Alumno
create proc ps_mostrar_alumno
as
begin try
begin tran
	SELECT id_Alumno as [Num], nombreAlumno as [Nombres],apellidoAlumno as [Apellidos], fechaNacAlumno as [Fecha de nacimiento]
	, telefonoAlumno as [Telefono], edadAlumno as [Edad], NIE as [NIE] , numPartida as [Num. Partida],  direccionAlumno as [Direccion]
	, S.nombreSexo as [Sexo], NombrePapaAlumno as [Padre], NombreMamaAlumno as [Madre], NombreEncargadoAlumno as [Encargado] FROM Alumno A
	INNER JOIN Sexo S ON S.id_Sexo = A.id_Sexo
	WHERE id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Insertar Alumno
create proc ps_insertar_alumno
(@nombreAlumno varchar(50),
@apellidoAlumno varchar(50),
@numPartida varchar(20),
@NIE varchar(20),
@direccionAlumno varchar(100),
@telefonoAlumno varchar(10),
@fechaNacAlumno date,
@fotoAlumno image,
@NombrePapaAlumno varchar(100),
@NombreMamaAlumno varchar(100),
@NombreEncargadoAlumno varchar(100),
@sexo varchar(20))
as 
begin try
begin tran
	INSERT INTO Alumno(nombreAlumno,apellidoAlumno,numPartida,NIE,direccionAlumno,telefonoAlumno,fechaNacAlumno,fotoAlumno,NombrePapaAlumno,NombreMamaAlumno,NombreEncargadoAlumno,id_Sexo,edadAlumno, id_Estado, estadoMatricula)
	VALUES(@nombreAlumno,@apellidoAlumno,@numPartida,@NIE,@direccionAlumno,@telefonoAlumno,@fechaNacAlumno,@fotoAlumno,@NombrePapaAlumno,@NombreMamaAlumno,@NombreEncargadoAlumno, 
	CONVERT(INT,(select id_Sexo from Sexo where nombreSexo = @sexo)),(select (cast(datediff(dd,@fechaNacAlumno,GETDATE()) / 365.25 as int))),1,0);
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--drop procedure ps_insertar_alumno
--Extraer foto de ALUMNO con ID
create proc ps_extraer_foto_alumno
@idAlumno varchar(20)
as
begin try
begin tran
	SELECT fotoAlumno FROM Alumno
	WHERE id_Alumno =  @idAlumno
commit
end try
begin catch
rollback
print error_message()
end catch;
GO
--FIN DE PROCEDIMIENTOS ALMACENADOS PARA ALUMNO*****************************************

--Leer detalle de grados y secciones
create proc ps_leer_detalle_Grado_Seccion
as
begin try
begin tran
	SELECT d.id_Detalle_Grado_Seccion as Codigo_Grupo ,g.nombreGrado as Grado, s.Seccion as Seccion, CONCAT(p.nombreProfesor,' ',p.apellidoProfesor ) as Profesor_Encargado, d.anioEscolar as Año
	FROM Grado g, Seccion s, Profesor p, detalle_grado_seccion d
	WHERE g.id_Grado = d.id_Grado AND s.id_Seccion =d.id_Seccion AND p.id_Profesor = d.id_ProfesorEncargado
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Leer grados
create proc ps_leer_Grados
as
begin try
begin tran
	SELECT nombreGrado as Grado FROM Grado
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Leer Secciones
create proc ps_leer_Secciones
as
begin try
begin tran
	SELECT Seccion as Seccion FROM Seccion
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Leer Secciones
create proc ps_leer_nombre_Profesores
as
begin try
begin tran
	SELECT CONCAT(p.nombreProfesor,' ',p.apellidoProfesor) as Profesor FROM Profesor p
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Obtener id Seccion
create proc ps_obtener_idSeccion
@seccion varchar(20)
as
begin try
begin tran
	SELECT id_seccion as Codigo FROM Seccion WHERE Seccion = @seccion
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Obtener id grado
create proc ps_obtener_idGrado
@grado varchar(20)
as
begin try
begin tran
	SELECT id_Grado as Grado FROM Grado WHERE nombreGrado = @grado
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Insertar detalle grado seccion
create proc ps_insertar_detalle_grado
@idGrado int,
@idSeccion int,
@idProfesor int,
@anio varchar(20)
as
begin try
begin tran
	INSERT INTO detalle_grado_seccion (id_Grado,id_Seccion, id_ProfesorEncargado, anioEscolar) VALUES (@idGrado, @idSeccion,@idProfesor, @anio)
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Eliminar detalle grado seccion
create proc ps_eliminar_grupo
@idGrupo int
as
begin try
begin tran
	DELETE FROM Detalle_Grado_Seccion WHERE id_Detalle_Grado_Seccion = @idGrupo
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--modificar detalle grado seccion
create proc ps_modificar_grupo
@idGrupo int,
@idGrado int,
@idSeccion int,
@idProfesor int,
@anio varchar(20)
as
begin try
begin tran
	UPDATE Detalle_Grado_Seccion 
	SET id_Grado = @idGrado, id_Seccion = @idSeccion, id_ProfesorEncargado = @idProfesor, anioEscolar = @anio 
	WHERE id_detalle_Grado_Seccion = @idGrupo
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar alumnos NO matriculados 
create proc ps_mostrar_alumnos_noMatriculados
as
begin try
begin tran
	 SELECT id_Alumno as [Num], nombreAlumno as [Nombres],apellidoAlumno as [Apellidos], fechaNacAlumno,
	 edadAlumno as [Edad], NIE as [NIE] , numPartida as [Num. Partida] FROM Alumno A
	INNER JOIN Sexo S ON S.id_Sexo = A.id_Sexo
	WHERE id_Estado = 1 AND estadoMatricula = 0
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar alumnos NO matriculados 
create proc ps_mostrar_Grupos
@anioActual int 
as
begin try
begin tran
	SELECT CONCAT(g.nombreGrado,' ',s.Seccion) AS [Grupo] 
	FROM  Grado g, Seccion s, Detalle_Grado_Seccion d 
	WHERE g.id_Grado = d.id_Grado AND s.id_Seccion = d.id_Seccion AND d.anioEscolar = @anioActual
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar alumnos NO matriculados 
create proc ps_matricular
@idAlumno int ,
@idDetalle int
as
begin try
begin tran
	INSERT INTO registro_alumno(id_Detalle_Grado_Seccion, id_Alumno, estadoActivo) VALUES(@idDetalle, @idAlumno, 1)
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar alumnos NO matriculados 
create proc ps_actualizar_estado_matricula
@idAlumno int 
as
begin try
begin tran
	UPDATE Alumno set estadoMatricula = 1 WHERE id_Alumno  = @idAlumno
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar alumnos NO matriculados 
create proc ps_obtener_matricula
as
begin try
begin tran
	SELECT a.nombreAlumno, a.apellidoAlumno  FROM Alumno a, detalle_grado_seccion d, grado g, seccion s 
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Mostrar registros de matricula
create proc ps_leer_matriculas
as
begin try
begin tran
	SELECT CONCAT(g.nombreGrado, ' ',s.Seccion) as [Grupo], a.nombreAlumno as [Nombre], a.apellidoAlumno as [Apellido], a.id_Alumno as [Codigo], ra.idMatricula as [Codigo Matricula]
	FROM Alumno a, Seccion s, detalle_Grado_seccion d, registro_alumno ra, Grado g
	WHERE a.id_Alumno = ra.id_Alumno AND g.id_Grado = d.id_Grado AND s.id_Seccion = d.id_Seccion 
	AND d.id_Detalle_Grado_Seccion = ra.id_Detalle_Grado_Seccion AND ra.estadoActivo = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Actualizar matricula
create proc ps_modificar_matricula
@idDetalle int,
@idMatricula int
as
begin try
begin tran
	UPDATE registro_alumno SET id_detalle_grado_seccion = @idDetalle WHERE idMatricula = @idMatricula
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Actualizar matricula
create proc ps_dardeBaja
@idAlumno int
as
begin try
begin tran
	UPDATE Alumno SET estadoMatricula = 0 WHERE id_Alumno = @idAlumno
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Actualizar matricula
create proc ps_actualizar_estado_activo_matricula
@idMatricula int
as
begin try
begin tran
	UPDATE registro_alumno SET estadoActivo = 0 WHERE idMatricula = @idMatricula
commit
end try
begin catch
rollback
print error_message()
end catch;
GO