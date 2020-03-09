CREATE DATABASE EjemploDes;

CREATE TABLE Video(
idVideo int NOT NULL,
titulo varchar(60) NOT NULL,
reproducciones int NOT NULL,
url varchar(100) NOT NULL,
creador varchar(60) NOT NULL,
CONSTRAINT PK_VideoidVideo PRIMARY KEY(idVideo)
);

drop table Video;

SELECT * FROM Video;

INSERT INTO Video
VALUES(1, 'Marselo, agachate y conocelo', 1300000, 'https://www.youtube.com/embed/pvjcPudyPq8', 'blackenedbbx');

INSERT INTO Video
VALUES(2, 'Rodrigo, chupalo y despues te lo digo', 120000, 'https://www.youtube.com/embed/Tm-ZPDxfXiw', 'Tokomochi Squad');

INSERT INTO Video
VALUES(5, 'PruebaBorrar', 654, 'youtube.com/view123', 'yo');

UPDATE Video
SET titulo='Prueba41'
WHERE idVideo=5;

--STORE PROCEDURE CREAR VIDEO
CREATE PROCEDURE spCrearVideo
	@idVideo int,
	@titulo varchar(60),
	@reproducciones int,
	@url varchar(100),
	@creador varchar(60)
AS
BEGIN
	INSERT INTO Video
	VALUES(@idVideo, @titulo, @reproducciones, @url, @creador)
END

EXECUTE spCrearVideo 10, 'video', 12, 'x', 'y'

--STORE PROCEDURE ACTUALIZAR VIDEO
CREATE PROCEDURE spActualizarVideo
@idVideo int,
@titulo varchar(60),
@reproducciones int,
@url varchar(100),
@creador varchar(60)
AS
BEGIN
	UPDATE Video
	SET titulo=@titulo, reproducciones=@reproducciones, url=@url, creador=@creador
	WHERE idVideo=@idVideo
END


EXECUTE spActualizarVideo 5, 'PruebaActualizar', 12345, 'www.youtube.com/Actualizar', 'Noel';

CREATE PROCEDURE spEliminarVideo
@idVideo int
AS
BEGIN
	DELETE FROM Video
	WHERE idVideo=@idVideo
END

EXECUTE spEliminarVideo 10;

delete from Video
WHERE idVideo=10;



CREATE PROCEDURE spMostrarVideo
AS
BEGIN
	SELECT * FROM Video
END

EXECUTE spMostrarVideo ;

DROP PROCEDURE spMostrarVideo;

DELETE FROM Video
WHERE idVideo=7;

SELECT * FROM Video;

DELETE FROM Video;

INSERT INTO Video
VALUES(10, 'X', 4654, 'Y', 'NOEL');