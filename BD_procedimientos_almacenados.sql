    
----------------------------------------------------------------------------------------------------------
------------------------------------------ USUARIO -------------------------------------------------------
----------------------------------------------------------------------------------------------------------
/* ----------------------------------- SP Insertar Usuario  ---------------------------------------------*/

CREATE PROCEDURE usp_InsertarUsuario

@usernombre varchar(30),
@password varchar(30),
@email varchar(100),
@usertipo varchar(20),
@userRegistro varchar(20),
@estado int

AS
BEGIN
INSERT INTO usuario(user_nombre,user_pasword,user_email,user_tipo,User_Registro,user_estado)
VALUES (@usernombre,@password,@email,@usertipo,@userRegistro,@estado)
END
GO 

/* ----------------------------------- SP Actualizar Usuario  ---------------------------------------------*/ 

CREATE PROCEDURE usp_ActualizarUsuario
@iduser int,
@usernombre varchar(30),
@password varchar(30),
@email varchar(100),
@usertipo varchar(20),
@userRegistro varchar(20),
@estado int
AS 
UPDATE usuario SET user_nombre=@usernombre, user_pasword=@password, 
user_email=@email,user_tipo=@usertipo,User_Registro = @userRegistro,user_estado=@estado
WHERE id_usuario = @iduser
GO

/* ----------------------------------- SP Eliminar Usuario  ---------------------------------------------*/
CREATE PROCEDURE usp_EliminarUsuario
@iduser int
AS
DELETE FROM usuario WHERE id_usuario = @iduser
GO

/* ----------------------------------- SP Consultar Usuario  ---------------------------------------------*/

CREATE PROCEDURE usp_ConsutarUsuario
@iduser int
AS
SELECT id_usuario, user_nombre,user_pasword,user_email,user_tipo,User_Registro,
CASE user_estado
WHEN 1 THEN 'Activo'
WHEN 0 THEN 'Inactivo'
END AS user_estado
FROM  usuario WHERE id_usuario = @iduser
GO


SELECT *FROM usuario;
GO

EXECUTE usp_ConsutarUsuario @iduser = '900'
GO 
/* ----------------------------------- SP Listar Usuario  ---------------------------------------------*/
CREATE PROCEDURE usp_ListarUsuario
AS
SELECT id_usuario, user_nombre,user_pasword,user_email,user_tipo,User_Registro,
CASE user_estado
WHEN 1 THEN 'Activo'
WHEN 0 THEN 'Inactivo'
END AS user_estado
FROM  usuario ORDER BY id_usuario
GO

EXECUTE usp_ListarUsuario

-- ************************************************************************************************* -------
---------------------------------------- DOCTOR ------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
----------------------- !! CORREGIR !!! --------------------------------------------------------------------
CREATE PROCEDURE [dbo].[usp_InsertarDoctor]
@vnom varchar(30),
@vape varchar(30),
@vdoc varchar(12),
@vfec date,
@vsexo integer,
@vtel varchar(20),
@vemail varchar(100),
@vturno integer,
@vest_doc integer,
@vfoto image,
@videspecialidad integer
AS
declare @vid_doc varchar(4)
declare @vcont int
set @vcont=(Select count(*) from doctor)
if @vcont=0 
		set @vid_doc = 'D001'
else
		set @vid_doc = (Select 'D' +Right(Max (Right(id_doctor,3)+ 1001 ),3) 
		From doctor)
insert into doctor values(@vid_doc,@vnom,@vape,@vdoc,@vfec,@vsexo,@vtel,@vemail,@vturno,@vest_doc,@vfoto,@videspecialidad)
GO
----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[usp_ActualizarDoctor]
@vid_doc char(4),
@vnom varchar(30),
@vape varchar(30),
@vdoc varchar(12),
@vfec date,
@vsexo char(1),
@vtel varchar(20),
@vemail varchar(100),
@vturno varchar(30),
@vest_doc int,
@vfoto image,
@videspecialidad integer
AS
Update doctor set nom_doctor=@vnom,ape_doctor=@vape,
doc_iden_doctor=@vdoc,fec_nac_doctor=@vfec,sexo_doctor=@vsexo,tel_doctor=@vtel,
email_doctor =@vemail , turno_doctor=@vemail,estado_doctor=@vest_doc, foto_doctor=@vfoto,
id_especialidad=@videspecialidad
where id_doctor=@vid_doc
GO
-----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[usp_EliminarDoctor]
@vid_doc char(4)
AS
delete from doctor where id_doctor=@vid_doc
GO
-----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[usp_ConsultarDoctor]
@vid_doc char(4)
as
SELECT id_doctor,
	nom_doctor,
	ape_doctor,
	doc_iden_doctor,
	fec_nac_doctor,
	sexo_doctor,
	tel_doctor,
	email_doctor,
	turno_doctor,
	estado_doctor,
	case estado_doctor 
			   when 1 then 'Activo'
			   when 0 then 'Inactivo'
		  end as Estado,
foto_doctor,
id_especialidad
FROM doctor
  where id_doctor=@vid_doc
GO
-----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[usp_ListarDoctor]
as
SELECT id_doctor,
	nom_doctor,
	ape_doctor,
	doc_iden_doctor,
	fec_nac_doctor,
	sexo_doctor,
	tel_doctor,
	email_doctor,
	turno_doctor,
	estado_doctor,
	case estado_doctor 
			   when 1 then 'Activo'
			   when 0 then 'Inactivo'
		  end as Estado,
foto_doctor,
id_especialidad
FROM doctor
order by nom_doctor
GO

-- ************************************************************************************************* -------
----------------------------------------------------------------------------------------------------------
------------------------------------------   SEDE  -------------------------------------------------------
----------------------------------------------------------------------------------------------------------

create procedure usp_InsertarSede
@vnom varchar(30),
@vtel varchar(20),
@vdir varchar(200),
@vnota varchar(200),
@vuser_reg varchar(20),
@vfec_reg_sede datetime,
@vid_ubigeo char(6)
AS
insert into sede
values(@vnom, @vtel, @vdir, @vnota, @vuser_reg, @vfec_reg_sede, @vid_ubigeo)
GO

---------------------------------------------------------------------------

create procedure usp_ActualizarSede
@vid_sede int,
@vnom varchar(30),
@vtel varchar(20),
@vdir varchar(200),
@vnota varchar(200),
@vuser_reg varchar(20),
@vfec_reg_sede datetime,
@vid_ubigeo char(6)
AS
Update sede set nombre_sede = @vnom,telefono_sede = @vtel,direccion_sede = @vdir,nota = @vnota,
				User_Registro = @vuser_reg,fecha_registro_sede = @vfec_reg_sede,Id_Ubigeo = @vid_ubigeo
where id_sede = @vid_sede
GO

---------------------------------------------------------------------------

CREATE PROCEDURE usp_EliminarSede
@vid_sede int
AS
delete from sede where id_sede = @vid_sede
GO

---------------------------------------------------------------------------

CREATE PROCEDURE usp_ConsultarSede
@vid_sede int
AS
select * from sede where id_sede = @vid_sede
GO

---------------------------------------------------------------------------

CREATE PROCEDURE usp_ListarSede
AS
select * from sede
GO

SELECT *FROM usp_ListarSede;

EXECUTE usp_ListarSede;
SELECT *FROM sede;
USE BD_RESERVA;