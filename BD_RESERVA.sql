CREATE DATABASE BD_RESERVA
GO

USE BD_RESERVA
GO



/* -------------------------------------	TABLA UBIGUEO -------------------------------------------------*/

CREATE TABLE Ubigeo(
	Id_Ubigeo char(6) NOT NULL,
	IdDepa varchar(255) NULL,
	IdProv varchar(255) NULL,
	IdDist nvarchar(255) NULL,
	Departamento varchar(255) NULL,
	Provincia varchar(255) NULL,
	Distrito varchar(255) NULL,
	Cod_Ven char(3) NULL,
    CONSTRAINT PK_Ubigeo PRIMARY KEY CLUSTERED (Id_Ubigeo))
	GO


/* ---------------------------------------   TABLA  PACIENTE ----------------------------------------------*/
CREATE TABLE paciente(
id_pac int identity(1,1) NOT NULL,
nombre_pac varchar(30) NOT NULL,
apellido_pac varchar(30) NOT NULL,
doc_identidad_pac varchar(12) NOT NULL,
sexo_pac char(1) NOT NULL,
peso_pac float NOT NULL,
talla float NOT NULL,
gruposangre_pac varchar(4) NULL,
fechanacimiento_pac date NOT NULL,
telefono_pac varchar(20) NOT NULL,
email_pac varchar(100) NULL,
foto_paciente image NULL,
observaciones_pac varchar(1000) NULL,
fecha_registro_pac datetime NOT NULL,
ultima_modificacion datetime NULL,
User_Registro varchar(20) NULL,
direccion_pac varchar(100) NOT NULL,
Id_Ubigeo char(6) NOT NULL,
estado_pac INT NULL, 
CONSTRAINT PK_idpac PRIMARY KEY CLUSTERED (id_pac),
FOREIGN KEY (Id_Ubigeo) REFERENCES Ubigeo(Id_Ubigeo))
GO

ALTER TABLE [dbo].[paciente] ADD  CONSTRAINT [fecha_registro_pac]  DEFAULT (getdate()) FOR [fecha_registro_pac]
GO

ALTER TABLE [dbo].[paciente] ADD  CONSTRAINT [def_estado_pac]  DEFAULT ((1)) FOR [estado_pac]
GO


/* ------------------------------- TABLA  ESPECIALIDAD -----------------------------------------------*/
CREATE TABLE especialidad(
id_especialidad	int identity(1,1) NOT NULL,
espec_nombre varchar(30) NOT NULL,
fecha_registro_esp datetime NOT NULL,
ultima_modificacion datetime NULL,
CONSTRAINT PK_idespecialidad PRIMARY KEY CLUSTERED (id_especialidad))


ALTER TABLE [dbo].[especialidad] ADD  CONSTRAINT [def_fecha_registro_esp]  DEFAULT (getdate()) FOR [fecha_registro_esp]
GO

/* ------------------------------- TABLA  DOCTOR  ---------------------------------------------------*/
CREATE TABLE doctor(
id_doc int identity(1,1) NOT NULL,
nombre_doc varchar(30) NOT NULL,
apellido_doc varchar(30) NOT NULL,
doc_identidad_doc varchar(12) NOT NULL,
fechanacimiento_doct date NOT NULL,
sexo_doc char(1) NOT NULL,
telefono_doc varchar(20) NULL,
Id_Ubigeo char(6) NOT NULL,
direccion_doc varchar(100) NOT NULL,
email_doc varchar(100) NULL,
estado_doc int NOT NULL,
foto_doc image NULL,
fecha_registro_doc datetime NOT NULL,
ultima_modificacion datetime NULL,
User_Registro varchar(20) NULL,
id_especialidad int NOT NULL,
CONSTRAINT PK_iddoc PRIMARY KEY CLUSTERED (id_doc),
FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
FOREIGN KEY (Id_Ubigeo) REFERENCES Ubigeo(Id_Ubigeo))
GO
/*-------------------------------------------- ALTER -----------------------------------------------------*/
ALTER TABLE [dbo].[doctor] ADD  CONSTRAINT [fecha_registro_doc]  DEFAULT (getdate()) FOR [fecha_registro_doc]
GO

ALTER TABLE [dbo].[doctor] ADD  CONSTRAINT [def_estado_doc]  DEFAULT ((1)) FOR [estado_doc]
GO

/* ------------------------------- TABLA  USUARIO  ---------------------------------------------------*/

CREATE TABLE usuario(
id_usuario int identity(900,1) NOT NULL,
user_nombre varchar(30) NOT NULL,
user_pasword  varchar(30) NOT NULL,
user_email varchar(100) NOT NULL,
user_tipo varchar(20) NOT NULL,
user_fecha_registro datetime NOT NULL,
User_Registro varchar(20) NULL,
user_estado int NOT NULL,
CONSTRAINT PK_idusuario PRIMARY KEY CLUSTERED (id_usuario))
GO

ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [def_user_fecha_registro ]  DEFAULT (getdate()) FOR [user_fecha_registro ]
GO

ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [def_user_estado]  DEFAULT ((1)) FOR [user_estado]
GO



/* ------------------------------- TABLA  SEDE  ---------------------------------------------------*/
CREATE TABLE sede
(id_sede int identity(20,1) NOT NULL,
 nombre_sede varchar(30) NOT NULL,
 telefono_sede varchar(20) NOT  NULL,
 direccion_sede varchar(200) NOT NULL,
 nota varchar(200) NULL,
 User_Registro varchar(20) NULL,
 fecha_registro_sede datetime NOT NULL,
 Id_Ubigeo char(6) NOT NULL,
 CONSTRAINT PK_idsede PRIMARY KEY CLUSTERED (id_sede),
 FOREIGN KEY (Id_Ubigeo) REFERENCES Ubigeo(Id_Ubigeo))
GO

ALTER TABLE [dbo].[sede] ADD  CONSTRAINT [defuser_fecha_registro]  DEFAULT (getdate()) FOR [fecha_registro_sede]
GO


/* ------------------------------- TABLA  RESERVA  ---------------------------------------------------*/
CREATE TABLE reserva(
 id_reserva int identity(10000,1) NOT NULL,
 titulo varchar(100) NOT NULL,
 precio_reserva money NOT NULL,
 estado_reserva varchar(20),
 fecha_registro datetime NOT NULL,
 fecha_reserva date NOT NULL,
 User_Registro varchar(20) NULL,
 nota varchar(1000) NOT NULL,
 tipo_pago  varchar(20) NOT NULL, 
 ultima_modificacion datetime NULL,
 id_especialidad int NOT NULL,
 id_pac int NOT NULL, 
 turno varchar(20) NOT NULL,
 id_sede int,
 CONSTRAINT PK_idreserva PRIMARY KEY CLUSTERED (id_reserva), 
 FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
 FOREIGN KEY (id_pac) REFERENCES paciente(id_pac),
 FOREIGN KEY (id_sede) REFERENCES sede(id_sede),)
GO

ALTER TABLE [dbo].[reserva] ADD  CONSTRAINT [def_fecha_registro]  DEFAULT (getdate()) FOR [fecha_registro]
GO
