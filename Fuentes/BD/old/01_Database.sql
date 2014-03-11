CREATE DATABASE TP3_Emergencias
GO
USE TP3_Emergencias
GO
CREATE TABLE CL_GE_ES_Turno(
       GE_TURNO         	int NOT NULL,
       GE_Horario_INI      date NULL,
       GE_Horario_FIN      date NULL

);
GO
ALTER TABLE CL_GE_ES_Turno
       ADD PRIMARY KEY (GE_TURNO);
GO

CREATE TABLE CL_ES_GE_Atencion_Médica (
       GE_CodigoAtencionMedica            int NOT NULL,
       GE_Descripcion              varchar(400) NULL,
       GE_FechaAtencion            date NULL
)
GO
ALTER TABLE CL_ES_GE_Atencion_Médica
       ADD PRIMARY KEY (GE_CodigoAtencionMedica)
GO

CREATE TABLE CL_ES_GE_Lista_Verificacion (
	   GE_CodigoVerificacion	INT identity(1,1),        
       GE_Item					varchar(50) NULL,       
       GE_CodigoInstalacion			INT not null
)
GO
ALTER TABLE CL_ES_GE_Lista_Verificacion
       ADD PRIMARY KEY (GE_CodigoVerificacion)
GO

CREATE TABLE CL_ES_GE_Instalacion (
       GE_CodigoInstalacion			INT identity(1,1),              
       GE_Nombre					varchar(100) NULL       
)
GO
ALTER TABLE CL_ES_GE_Instalacion
       ADD PRIMARY KEY (GE_CodigoInstalacion)
GO

CREATE TABLE CL_ES_GE_Evaluacion (
	   GE_CodigoEvaluacion			INT identity(1,1),            
       GE_CodigoInstalacion			INT not null,       
       GE_Disponibilidad			int NOT NULL,
       GE_Resultado					int not NULL,
       GE_Observaciones				varchar(100) NULL,
       GE_NombreEnfermeroAuxiliar	varchar(100) NULL,
       GE_FechaEvaluacion			datetime not null    
)
GO
ALTER TABLE CL_ES_GE_Evaluacion
       ADD PRIMARY KEY (GE_CodigoEvaluacion)
GO

ALTER TABLE [CL_ES_GE_Evaluacion]
	ADD CONSTRAINT [R_Evaluacion_Instalacion] FOREIGN KEY ([GE_CodigoInstalacion]) REFERENCES [CL_ES_GE_Instalacion]([GE_CodigoInstalacion])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CL_ES_GE_Lista_Verificacion]
	ADD CONSTRAINT [R_Verificacion_Evaluacion] FOREIGN KEY ([GE_CodigoInstalacion]) REFERENCES [CL_ES_GE_Instalacion]([GE_CodigoInstalacion])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TABLE CL_ES_GE_EvaluacionDetalle (
	   GE_CodigoEvaluacionDetalle			INT identity(1,1),            
       GE_CodigoVerificacion		INT not null, 
       GE_Conformidad			bit NULL,
       GE_CodigoEvaluacion		INT NOT NULL
)
GO
ALTER TABLE CL_ES_GE_EvaluacionDetalle
       ADD PRIMARY KEY (GE_CodigoEvaluacionDetalle)
GO

ALTER TABLE [CL_ES_GE_EvaluacionDetalle]
	ADD CONSTRAINT [R_EvaluacionDetalle_Evaluacion] FOREIGN KEY ([GE_CodigoEvaluacion]) REFERENCES [CL_ES_GE_Evaluacion]([GE_CodigoEvaluacion])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

CREATE TABLE CL_ES_GE_Médico_de_Turno (
       GE_CodigoMedico            int NOT NULL,
       GE_NombreMedico            varchar(100) NULL,
       GE_Especialidad            int NULL,
       GE_FechaCertificacion      varchar(100) NULL,
       GE_CentroEstudios          varchar(100) NULL,
       GE_CodigoColegiatura       varchar(20) NULL
)
GO
ALTER TABLE CL_ES_GE_Médico_de_Turno
       ADD PRIMARY KEY (GE_CodigoMedico)
GO


CREATE TABLE CL_CO_GE_Especialidad (
       GE_Especialidad             int NOT NULL,
       GE_Descripcion             char(40) NULL
)
GO
ALTER TABLE CL_CO_GE_Especialidad
       ADD PRIMARY KEY (GE_Especialidad)
GO

CREATE TABLE CL_CO_GE_Tipo_Examen_Medico(
	GE_TipoExamen	varchar(15)	     NOT NULL,
	GE_DescripciónGeneral	varchar(200)  NULL
)
GO
ALTER TABLE CL_CO_GE_Tipo_Examen_Medico
       ADD PRIMARY KEY (GE_TipoExamen)
GO

CREATE TABLE CL_ES_GE_Orden_Examen_Médico(
	GE_OrdenExamenMedico	varchar(15)	     NOT NULL,
	GE_FechaSolicitud	date   NULL,
	GE_Paciente			varchar(200)   NULL,
	GE_DetalleTecnico			varchar(200)   NULL,
	GE_TipoExamen			varchar(15)   NULL,
	GE_NombreMedico			varchar(50)   NULL,
	GE_CodigoOrdenExamen			int   NULL
)
GO
ALTER TABLE CL_ES_GE_Orden_Examen_Médico
       ADD PRIMARY KEY (GE_OrdenExamenMedico)
GO

CREATE TABLE CL_CO_GE_Servicio(
	GE_CodigoServicio	int	     NOT NULL,
	GE_NombreServicio	varchar(50)   NULL,
	GE_DescripcionServicio			varchar(200)   NULL,
	GE_CostoServicio			real  NULL
)
GO
ALTER TABLE CL_CO_GE_Servicio
       ADD PRIMARY KEY (GE_CodigoServicio)
GO

CREATE TABLE CL_CO_ES_Orden_Servicio(
	GE_CodigoListaServicio	int	     NOT NULL,
	GE_FechaSolicitud 	date   NULL,
	GE_Subtotal			real   NULL,
	GE_IGV 			real  NULL,
	GE_Total 			real  NULL
)
GO
ALTER TABLE CL_CO_ES_Orden_Servicio
       ADD PRIMARY KEY (GE_CodigoListaServicio)
GO

CREATE TABLE CL_CO_GE_DetOrdenServicio(
	GE_CodigoListaServicio	int	     NOT NULL,
	GE_Item 	int   NOT NULL,
	GE_Descuento			real   NULL
)
GO
ALTER TABLE CL_CO_GE_DetOrdenServicio
       ADD PRIMARY KEY (GE_CodigoListaServicio,GE_Item)
GO

CREATE TABLE CL_CO_GE_Empleado(
	E_Codigo	varchar(15)	     NOT NULL,
	E_Nombre 	varchar(100)   NULL,
	E_Apellido_Paterno			varchar(100)   NULL,
	E_Apellido_Materno 			varchar(100)  NULL,
	E_dni 			varchar(100)  NULL,
	E_Direccion 			varchar(100)  NULL,
	E_Telefono 			varchar(100)  NULL,
	E_Tipo_Empleado 			varchar(15)  NULL,
	E_Fecha_Nacimiento 			date  NULL,
	E_Correo 			varchar(100)  NULL
)
GO
ALTER TABLE CL_CO_GE_Empleado
       ADD PRIMARY KEY (E_Codigo)
GO

CREATE TABLE CL_CO_GE_Tipo_Empleado(
	E_Tipo_Empleado 			varchar(15) NOT NULL,
	E_Descripcion 			varchar(100)  NULL
)
GO
ALTER TABLE CL_CO_GE_Tipo_Empleado
       ADD PRIMARY KEY (E_Tipo_Empleado)
GO

CREATE TABLE CL_CO_GE_Informe_Adminsitrativo(
	IA_Codigo 			int NOT NULL,
	IA_Codigo_Empleado 			varchar(15)  NULL,
	IA_Tipo_de_Informe 			int  NULL,
	IA_Mensaje 			varchar(100)  NULL,
	IA_Estado 			varchar(15)  NULL
)
GO
ALTER TABLE CL_CO_GE_Informe_Adminsitrativo
       ADD PRIMARY KEY (IA_Codigo)
GO

CREATE TABLE CL_ES_GE_Tipo_Informe_Administrativo(
	IA_Tipo_de_Informe 			int NOT NULL,
	IA_Descripcion 			varchar(100)  NULL
)
GO
ALTER TABLE CL_ES_GE_Tipo_Informe_Administrativo
       ADD PRIMARY KEY (IA_Tipo_de_Informe)
GO

CREATE TABLE CL_CO_GE_Area(
	GE_Area 			int NOT NULL,
	GE_Nombre 			varchar(100)  NULL,
	GE_Ubicacion 			varchar(100)  NULL
)
GO
ALTER TABLE CL_CO_GE_Area
       ADD PRIMARY KEY (GE_Area)
GO

CREATE TABLE CL_CO_GE_Medicamento(
	GE_CodigoMedicamento 			varchar(15) NOT NULL,
	GE_NombreMedicamento 			varchar(100)  NULL,
	GE_FechaVencimiento 			date  NULL,
	GE_CantidadDisponible			real NULL,
	GE_Costo						real NULL
)
GO
ALTER TABLE CL_CO_GE_Medicamento
       ADD PRIMARY KEY (GE_CodigoMedicamento)
GO

CREATE TABLE CL_ES_GE_Orden_de_Pedido(
	GE_NroOrdenPedido 			varchar(15) NOT NULL,
	GE_FechaPedido 			date  NULL,
	GE_Observacion			varchar(100) NULL
)
GO
ALTER TABLE CL_ES_GE_Orden_de_Pedido
       ADD PRIMARY KEY (GE_NroOrdenPedido)
GO

CREATE TABLE CL_ES_GE_Detalle_Orden_de_Pedido(
	GE_NroOrdenPedido 		varchar(15) NOT NULL,
	GE_NroItem 			int NOT NULL,
	GE_Cantidad 		real  NULL
)
GO
ALTER TABLE CL_ES_GE_Detalle_Orden_de_Pedido
       ADD PRIMARY KEY (GE_NroOrdenPedido,GE_NroItem)
GO

CREATE TABLE CL_ES_GE_Orden_de_Salida(
	GE_NroOrdenSalida 			varchar(15) NOT NULL,
	GE_FechaSalida 			date  NULL,
	GE_Observacion			varchar(100) NULL
)
GO
ALTER TABLE CL_ES_GE_Orden_de_Salida
       ADD PRIMARY KEY (GE_NroOrdenSalida)
GO

CREATE TABLE CL_ES_GE_Detalle_Orden_de_Salida(
	GE_NroOrdenSalida 		varchar(15) NOT NULL,
	GE_NroItem 			int NOT NULL,
	GE_Cantidad 		real  NULL
)
GO
ALTER TABLE CL_ES_GE_Detalle_Orden_de_Salida
       ADD PRIMARY KEY (GE_NroOrdenSalida,GE_NroItem)
GO

CREATE TABLE CL_ES_GE_Cronograma_Emergencia(
	GE_ANIOMES 		int NOT NULL,
	GE_TURNO 			int NOT NULL,
	GE_DIAS 		varchar(15)  NULL,
	GE_Empleado 		varchar(15)  NULL
)
GO
ALTER TABLE CL_ES_GE_Cronograma_Emergencia
       ADD PRIMARY KEY (GE_ANIOMES,GE_TURNO)
GO

CREATE TABLE CL_ES_GE_Solicitudes_De_Cambio(
	GE_SolicitudCambio 		int NOT  NULL,
	GE_Empleado 		varchar(15)  NULL,
	GE_Turno_Actual 		int NULL,
	GE_turno_cambiar 			int  NULL,
	GE_Fecha_cambio  		date  NULL,
	GE_APROBACION  		varchar(1)  NULL
)
GO
ALTER TABLE CL_ES_GE_Solicitudes_De_Cambio
       ADD PRIMARY KEY (GE_SolicitudCambio)
GO