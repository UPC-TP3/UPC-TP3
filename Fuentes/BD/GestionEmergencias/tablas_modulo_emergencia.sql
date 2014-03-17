CREATE DATABASE [BD_ClinicaInternacional]
GO

USE [BD_ClinicaInternacional]
GO

/****** Object:  Table [dbo].[TB_EMPLEADO]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_EMPLEADO](
	[ID_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[E_Nombre] [varchar](100) NULL,
	[E_Apellido_Paterno] [varchar](100) NULL,
	[E_Apellido_Materno] [varchar](100) NULL,
	[E_dni] [varchar](100) NULL,
	[E_Direccion] [varchar](100) NULL,
	[E_Telefono] [varchar](100) NULL,
	[E_Tipo_Empleado] [varchar](15) NULL,
	[E_Fecha_Nacimiento] [datetime] NULL,
	[E_Correo] [varchar](100) NULL,
	[Apellidos_Empleado] [varchar](100) NULL,
	[Nombres_Empleado] [varchar](100) NULL,
	[Cargo_Empleado] [varchar](100) NULL,
	[Correo_Empleado] [varchar](100) NULL,
	[Estado] [int] NULL,
	[ID_Tipo_Empleado] [int] NULL,
 CONSTRAINT [PK__TB_EMPLE__8BA57B4834C8D9D1] PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_PACIENTE]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_PACIENTE](
	[ID_Paciente] [int] IDENTITY(1,1) NOT NULL,
	[dni_paciente] [varchar](11) NOT NULL,	
	[DocumentoIdentidad] [varchar](255) NOT NULL,
	[EstadoCivil] [varchar](255) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Celular] [varchar](255) NULL,
	[TelefonoDomicilio] [varchar](255) NULL,
	[ID_Pais] [int] NULL,
	[ID_Departamento] [int] NULL,
	[ID_Provincia] [int] NULL,
	[ID_Distrito] [int] NULL,
	[Direccion] [varchar](255) NULL,
	[ID_Sexo] [int] NULL,
	[Ocupacion] [varchar](255) NULL,
	[ID_TipoDocumento] [int] NOT NULL,
	[nombres] [varchar](50) NULL,
	[ApellidoPat] [varchar](100) NULL,
	[ApellidoMat] [varchar](100) NULL,
	[ID_EstadoCivil] [int] NULL,
	[Correo] [varchar](100) NULL,
 CONSTRAINT [PK_T_CL_CO_GC_Paciente] PRIMARY KEY CLUSTERED 
(
	[ID_Paciente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MEDICO]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_MEDICO](
	[ID_Medico] [int] IDENTITY(1,1) NOT NULL,
	[nom_medico] [varchar](50) NULL,
	[ape_medico] [varchar](50) NULL,
	[num_cmp] [varchar](5) NULL,
	[email] [varchar](60) NULL,
	[telefono] [varchar](50) NULL,
	[Direccion] [varchar](255) NOT NULL,
	[Celular] [varchar](255) NULL,
	[TelefonoDomicilio] [varchar](255) NULL,
	[FechaCertificacion] [varchar](100) NULL,
	[CentroEstudios] [varchar](100) NULL,
	[CodigoColegiatura] [varchar](20) NULL,
 CONSTRAINT [PK_TB_MEDICO] PRIMARY KEY CLUSTERED 
(
	[ID_Medico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TB_Ambiente]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Ambiente](
	[ID_CodigoInstalacion] [int] IDENTITY(1,1) NOT NULL,
	[GE_Nombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CodigoInstalacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CL_ES_GE_Lista_Verificacion]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Lista_Verificacion](
	[GE_CodigoVerificacion] [int] IDENTITY(1,1) NOT NULL,
	[GE_Item] [varchar](50) NULL,
	[GE_CodigoInstalacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GE_CodigoVerificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CL_ES_GE_Evaluacion]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Evaluacion](
	[GE_CodigoEvaluacion] [int] IDENTITY(1,1) NOT NULL,
	[GE_CodigoInstalacion] [int] NOT NULL,
	[GE_Disponibilidad] [int] NOT NULL,
	[GE_Resultado] [int] NOT NULL,
	[GE_Observaciones] [varchar](100) NULL,
	[GE_NombreEnfermeroAuxiliar] [varchar](100) NULL,
	[GE_FechaEvaluacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GE_CodigoEvaluacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CL_ES_GE_EvaluacionDetalle]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_EvaluacionDetalle](
	[GE_CodigoEvaluacionDetalle] [int] IDENTITY(1,1) NOT NULL,
	[GE_CodigoVerificacion] [int] NOT NULL,
	[GE_Conformidad] [bit] NULL,
	[GE_CodigoEvaluacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GE_CodigoEvaluacionDetalle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TURNO_EMERGENCIA]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_TURNO_EMERGENCIA](
	[ID_TURNOEMERGENCIA] [int] IDENTITY(1,1) NOT NULL,
	[Mes] varchar(50),
	[Dia_inicio] varchar(20),
	[GE_Horario_INI] [datetime] NULL,
	[Dia_Fin] varchar(20),
	[GE_Horario_FIN] [datetime] NULL
 CONSTRAINT [PK__TB_TURNO__CEBCE64768487DD7] PRIMARY KEY CLUSTERED 
(
	[ID_TURNOEMERGENCIA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_TURNO_EMPLEADO]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_TURNO_EMPLEADO](
	[ID_TURNOEMERGENCIA] [int],
	[ID_Empleado] [int]

 CONSTRAINT [PK_ID_TURNOEMERGENCIA] PRIMARY KEY CLUSTERED
 (
[ID_TURNOEMERGENCIA] ASC,
[ID_Empleado]ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_SOLICITUD_DE_CAMBIO]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_SOLICITUD_DE_CAMBIO](
	[ID_SolicitudCambio] [int] IDENTITY(1,1) NOT NULL,
	[ID_Empleado] int NULL,
	[ID_Turno_Actual] [int] NULL,
	[ID_Turno_Solicitado] [int] NULL,
	[GE_Fecha_cambio] [date] NULL,
	[GE_estado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SolicitudCambio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CAMA_HISTORIA]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CAMA_HISTORIA](
	[IdCamaHistoria] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cama] [int] NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
	[EnfermeroActualizador] [varchar](255) NOT NULL,
	[Observacion] [varchar](max) NULL,
 CONSTRAINT [PK_TB_CAMA_HISTORIA] PRIMARY KEY CLUSTERED 
(
	[IdCamaHistoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CAMA]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CAMA](
	[ID_Cama] [int] IDENTITY(1,1) NOT NULL,
	[NroCama] [varchar](255) NOT NULL,
	[TipoCama] [varchar](255) NOT NULL,
	[Ubicacion] [varchar](255) NOT NULL,
	[Estado] [varchar](255) NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
	[EnfermeroActualizador] [varchar](255) NULL,
	[Observacion] [varchar](max) NULL,
 CONSTRAINT [PK_T_CL_ES_GO_Cama] PRIMARY KEY CLUSTERED 
(
	[ID_Cama] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__TB_CAMA__FechaAc__70A8B9AE]    Script Date: 03/13/2014 07:57:25 ******/
ALTER TABLE [dbo].[TB_CAMA] ADD  DEFAULT (getdate()) FOR [FechaActualizacion]
GO
/****** Object:  Table [dbo].[TB_MEDICAMENTO]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_MEDICAMENTO](
	[ID_Medicamento] [int] IDENTITY(1,1) NOT NULL,
	[GE_NombreMedicamento] [varchar](100) NULL,
	[GE_FechaVencimiento] [datetime] NULL,
	[GE_CantidadDisponible] [real] NULL,
	[Presentacion] [varchar](100) NULL,
	[GE_Costo] [real] NULL,
	[Descripcion] [varchar](100) NULL,
	[Laboratorio] [varchar](100) NULL,
	[Observaciones] [varchar](100) NULL,
 CONSTRAINT [PK__TB_MEDIC__5749D070014935CB] PRIMARY KEY CLUSTERED 
(
	[ID_Medicamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ORDEN_DE_SALIDA]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ORDEN_DE_SALIDA](
	[ID_OrdenSalida] [int] IDENTITY(1,1) NOT NULL,
	[GE_FechaSalida] [datetime] NULL,
	[ID_ATENCION] [int] NULL,	
	[GE_Observacion] [varchar](100) NULL,
 CONSTRAINT [PK__TB_ORDEN__FB4F33096C190EBB] PRIMARY KEY CLUSTERED 
(
	[ID_OrdenSalida] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_DETALLE_ORDEN_DE_SALIDA]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_DETALLE_ORDEN_DE_SALIDA](
	[ID_OrdenSalida] [int] NOT NULL,
	[GE_Cantidad] [real] NULL,
	[ID_Medicamento] [int] NOT NULL,
 CONSTRAINT [PK__TB_DETAL__811E67973C69FB99] PRIMARY KEY CLUSTERED 
(
	[ID_OrdenSalida] ASC,
	[ID_Medicamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_TIPO_EXAMEN_MEDICO]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_TIPO_EXAMEN_MEDICO](
	[ID_Tipo_Examen] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[DescripcionGeneral] [varchar](200) NULL,
 CONSTRAINT [PK_TB_TIPO_EXAMEN_MEDICO] PRIMARY KEY CLUSTERED 
(
	[ID_Tipo_Examen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ATENCION_EMERGENCIA]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ATENCION_EMERGENCIA](
	[ID_ATENCION] [int] IDENTITY(1,1) NOT NULL,
	[GE_FechaIngreso] [datetime] NOT NULL,
	[ID_Medico] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[GE_DescripcionObservaciones] [nvarchar](max) NULL,
	[GE_Estado] [varchar](200) NULL,
	[ID_Cama] [int] NULL,
 CONSTRAINT [PK_TB_GE_Atencion] PRIMARY KEY CLUSTERED 
(
	[ID_ATENCION] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ORDEN_EXAMEN_MEDICO]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ORDEN_EXAMEN_MEDICO](
	[ID_Orden_Examen_Medico] [int] IDENTITY(1,1) NOT NULL,
	[ID_ATENCION] [int] NOT NULL,
	[ID_Medico] [int] NULL,
	[ID_Orden_Interna] [int] NULL,
	[fecha] [datetime] NULL,
	[ID_Catalogo_Examen] [int] NULL,
	[estado] [varchar](1) NULL,
	[observacion] [varchar](250) NULL,
	[GE_FechaSolicitud] [datetime] NULL,
	[ID_Paciente] [int] NULL,
	[GE_DetalleTecnico] [varchar](200) NULL,
	[ID_Tipo_Examen] [int] NULL,
	[GE_NombreMedico] [varchar](50) NULL,
	[GE_CodigoOrdenExamen] [int] NULL,
 CONSTRAINT [PK_TB_ORDEN_EXAMEN_MEDICO_1] PRIMARY KEY CLUSTERED 
(
	[ID_Orden_Examen_Medico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_SERVICIOS_DE_EMERGENCIA]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_SERVICIOS_DE_EMERGENCIA](
	[ID_SERVICIO] [int] IDENTITY(1,1) NOT NULL,
	[ID_ATENCION] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
 CONSTRAINT [PK_TB_SERVICIOS_DE_EMERGENCIA] PRIMARY KEY CLUSTERED 
(
	[ID_SERVICIO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_DETALLE_SERVICIOS_EXAMENES]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_DETALLE_SERVICIOS_EXAMENES](
	[ID_SERVICIO] [int] IDENTITY(1,1) NOT NULL,
	[ID_ATENCION] [int] NOT NULL,
	[ID_EXAMEN] [int] NOT NULL,
	[STATUS] [int] NOT NULL,
	[FECHA] [datetime] NOT NULL,
 CONSTRAINT [PK_TB_DETALLE_SERVICIOS_EXAMENES] PRIMARY KEY CLUSTERED 
(
	[ID_SERVICIO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS]    Script Date: 03/13/2014 07:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS](
	[ID_SERVICIO] [int] IDENTITY(1,1) NOT NULL,
	[ID_ATENCION] [int] NOT NULL,
	[ID_MEDICAMENTO] [int] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
	[STATUS] [int] NOT NULL,
	[FECHA] [datetime] NOT NULL,
 CONSTRAINT [PK_TB_DETALLE_SERVICIOS_MEDICAMENTOS] PRIMARY KEY CLUSTERED 
(
	[ID_SERVICIO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_TB_TURNO_EMPLEADO_TB_EMPLEADO]    ******/
ALTER TABLE [dbo].[TB_TURNO_EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_TB_TURNO_EMPLEADO_TB_EMPLEADO] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[TB_EMPLEADO] ([ID_Empleado])
GO
ALTER TABLE [dbo].[TB_TURNO_EMPLEADO] CHECK CONSTRAINT [FK_TB_TURNO_EMPLEADO_TB_EMPLEADO]
GO
/****** Object:  ForeignKey [FK_TB_TURNO_EMPLEADO_TB_TURNO_EMERGENCIA]    ******/
ALTER TABLE [dbo].[TB_TURNO_EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_TB_TURNO_EMPLEADO_TB_TURNO_EMERGENCIA] FOREIGN KEY([ID_TURNOEMERGENCIA])
REFERENCES [dbo].[TB_TURNO_EMERGENCIA] ([ID_TURNOEMERGENCIA])
GO
ALTER TABLE [dbo].[TB_TURNO_EMPLEADO] CHECK CONSTRAINT [FK_TB_TURNO_EMPLEADO_TB_TURNO_EMERGENCIA]
GO
/****** Object:  ForeignKey [FK_TB_SOLICITUD_DE_CAMBIO_TB_EMPLEADO]    ******/
ALTER TABLE [dbo].[TB_SOLICITUD_DE_CAMBIO]  WITH CHECK ADD  CONSTRAINT [FK_TB_SOLICITUD_DE_CAMBIO_TB_EMPLEADO] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[TB_EMPLEADO] ([ID_Empleado])
GO
ALTER TABLE [dbo].[TB_SOLICITUD_DE_CAMBIO] CHECK CONSTRAINT [FK_TB_SOLICITUD_DE_CAMBIO_TB_EMPLEADO]
GO
/****** Object:  ForeignKey [FK_TB_SOLICITUD_DE_CAMBIO_TB_TURNO_EMERGENCIA_ACTUAL]    ******/
ALTER TABLE [dbo].[TB_SOLICITUD_DE_CAMBIO]  WITH CHECK ADD  CONSTRAINT [FK_TB_SOLICITUD_DE_CAMBIO_TB_TURNO_EMERGENCIA_ACTUAL] FOREIGN KEY([ID_Turno_Actual])
REFERENCES [dbo].[TB_TURNO_EMERGENCIA] ([ID_TURNOEMERGENCIA])
GO
ALTER TABLE [dbo].[TB_SOLICITUD_DE_CAMBIO] CHECK CONSTRAINT [FK_TB_SOLICITUD_DE_CAMBIO_TB_EMPLEADO]
GO
/****** Object:  ForeignKey [FK_TB_SOLICITUD_DE_CAMBIO_TB_SOLICITADO]    ******/
ALTER TABLE [dbo].[TB_SOLICITUD_DE_CAMBIO]  WITH CHECK ADD  CONSTRAINT [FK_TB_SOLICITUD_DE_CAMBIO_TB_SOLICITADO] FOREIGN KEY([ID_Turno_Solicitado])
REFERENCES [dbo].[TB_TURNO_EMERGENCIA] ([ID_TURNOEMERGENCIA])
GO
ALTER TABLE [dbo].[TB_SOLICITUD_DE_CAMBIO] CHECK CONSTRAINT [FK_TB_SOLICITUD_DE_CAMBIO_TB_SOLICITADO]
GO
/****** Object:  ForeignKey [FK_TB_CAMA_HISTORIA_TB_CAMA]    ******/
ALTER TABLE [dbo].[TB_CAMA_HISTORIA]  WITH CHECK ADD  CONSTRAINT [FK_TB_CAMA_HISTORIA_TB_CAMA] FOREIGN KEY([ID_Cama])
REFERENCES [dbo].[TB_CAMA] ([ID_Cama])
GO
ALTER TABLE [dbo].[TB_CAMA_HISTORIA] CHECK CONSTRAINT [FK_TB_CAMA_HISTORIA_TB_CAMA]
GO
/****** Object:  ForeignKey [FK_TB_ORDEN_DE_SALIDA_TB_ATENCION_EMERGENCIA]    ******/
ALTER TABLE [dbo].[TB_ORDEN_DE_SALIDA]  WITH CHECK ADD  CONSTRAINT [FK_TB_ORDEN_DE_SALIDA_TB_ATENCION_EMERGENCIA] FOREIGN KEY([ID_ATENCION])
REFERENCES [dbo].[TB_ATENCION_EMERGENCIA] ([ID_ATENCION])
GO
ALTER TABLE [dbo].[TB_ORDEN_DE_SALIDA] CHECK CONSTRAINT [FK_TB_ORDEN_DE_SALIDA_TB_ATENCION_EMERGENCIA]
GO
/****** Object:  ForeignKey [FK_TB_DETALLE_ORDEN_DE_SALIDA_TB_ORDEN_DE_SALIDA]    ******/
ALTER TABLE [dbo].[TB_DETALLE_ORDEN_DE_SALIDA]  WITH CHECK ADD  CONSTRAINT [FK_TB_DETALLE_ORDEN_DE_SALIDA_TB_ORDEN_DE_SALIDA] FOREIGN KEY([ID_OrdenSalida])
REFERENCES [dbo].[TB_ORDEN_DE_SALIDA] ([ID_OrdenSalida])
GO
ALTER TABLE [dbo].[TB_DETALLE_ORDEN_DE_SALIDA] CHECK CONSTRAINT [FK_TB_DETALLE_ORDEN_DE_SALIDA_TB_ORDEN_DE_SALIDA]
GO
/****** Object:  ForeignKey [FK_TB_DETALLE_ORDEN_DE_SALIDA_TB_MEDICAMENTO]    ******/
ALTER TABLE [dbo].[TB_DETALLE_ORDEN_DE_SALIDA]  WITH CHECK ADD  CONSTRAINT [FK_TB_DETALLE_ORDEN_DE_SALIDA_TB_MEDICAMENTO] FOREIGN KEY([ID_Medicamento])
REFERENCES [dbo].[TB_MEDICAMENTO] ([ID_Medicamento])
GO
ALTER TABLE [dbo].[TB_DETALLE_ORDEN_DE_SALIDA] CHECK CONSTRAINT [FK_TB_DETALLE_ORDEN_DE_SALIDA_TB_MEDICAMENTO]
GO
/****** Object:  ForeignKey [FK_TB_ATENCION_EMERGENCIA_TB_MEDICO]    ******/
ALTER TABLE [dbo].[TB_ATENCION_EMERGENCIA]  WITH CHECK ADD  CONSTRAINT [FK_TB_ATENCION_EMERGENCIA_TB_MEDICO] FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[TB_MEDICO] ([ID_Medico])
GO
ALTER TABLE [dbo].[TB_ATENCION_EMERGENCIA] CHECK CONSTRAINT [FK_TB_ATENCION_EMERGENCIA_TB_MEDICO]
GO
/****** Object:  ForeignKey [FK_TB_ATENCION_EMERGENCIA_TB_PACIENTE]    ******/
ALTER TABLE [dbo].[TB_ATENCION_EMERGENCIA]  WITH CHECK ADD  CONSTRAINT [FK_TB_ATENCION_EMERGENCIA_TB_PACIENTE] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[TB_PACIENTE] ([ID_Paciente])
GO
ALTER TABLE [dbo].[TB_ATENCION_EMERGENCIA] CHECK CONSTRAINT [FK_TB_ATENCION_EMERGENCIA_TB_PACIENTE]
GO
/****** Object:  ForeignKey [FK_TB_ATENCION_EMERGENCIA_TB_CAMA]    ******/
ALTER TABLE [dbo].[TB_ATENCION_EMERGENCIA]  WITH CHECK ADD  CONSTRAINT [FK_TB_ATENCION_EMERGENCIA_TB_CAMA] FOREIGN KEY([ID_Cama])
REFERENCES [dbo].[TB_CAMA] ([ID_Cama])
GO
ALTER TABLE [dbo].[TB_ATENCION_EMERGENCIA] CHECK CONSTRAINT [FK_TB_ATENCION_EMERGENCIA_TB_CAMA]
GO
/****** Object:  ForeignKey [FK_TB_ORDEN_EXAMEN_MEDICO_TB_ATENCION_EMERGENCIA]    ******/
ALTER TABLE [dbo].[TB_ORDEN_EXAMEN_MEDICO]  WITH CHECK ADD  CONSTRAINT [FK_TB_ORDEN_EXAMEN_MEDICO_TB_ATENCION_EMERGENCIA] FOREIGN KEY([ID_ATENCION])
REFERENCES [dbo].[TB_ATENCION_EMERGENCIA] ([ID_ATENCION])
GO
ALTER TABLE [dbo].[TB_ORDEN_EXAMEN_MEDICO] CHECK CONSTRAINT [FK_TB_ORDEN_EXAMEN_MEDICO_TB_ATENCION_EMERGENCIA]
GO
/****** Object:  ForeignKey [FK_TB_ORDEN_EXAMEN_MEDICO_TB_MEDICO]    ******/
ALTER TABLE [dbo].[TB_ORDEN_EXAMEN_MEDICO]  WITH CHECK ADD  CONSTRAINT [FK_TB_ORDEN_EXAMEN_MEDICO_TB_MEDICO] FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[TB_MEDICO] ([ID_Medico])
GO
ALTER TABLE [dbo].[TB_ORDEN_EXAMEN_MEDICO] CHECK CONSTRAINT [FK_TB_ORDEN_EXAMEN_MEDICO_TB_MEDICO]
GO
/****** Object:  ForeignKey [FK_TB_ORDEN_EXAMEN_MEDICO_TB_PACIENTE]    ******/
ALTER TABLE [dbo].[TB_ORDEN_EXAMEN_MEDICO]  WITH CHECK ADD  CONSTRAINT [FK_TB_ORDEN_EXAMEN_MEDICO_TB_PACIENTE] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[TB_PACIENTE] ([ID_Paciente])
GO
ALTER TABLE [dbo].[TB_ORDEN_EXAMEN_MEDICO] CHECK CONSTRAINT [FK_TB_ORDEN_EXAMEN_MEDICO_TB_PACIENTE]
GO
/****** Object:  ForeignKey [FK_TB_ORDEN_EXAMEN_MEDICO_TB_TIPO_EXAMEN_MEDICO]    ******/
ALTER TABLE [dbo].[TB_ORDEN_EXAMEN_MEDICO]  WITH CHECK ADD  CONSTRAINT [FK_TB_ORDEN_EXAMEN_MEDICO_TB_TIPO_EXAMEN_MEDICO] FOREIGN KEY([ID_Tipo_Examen])
REFERENCES [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen])
GO
ALTER TABLE [dbo].[TB_ORDEN_EXAMEN_MEDICO] CHECK CONSTRAINT [FK_TB_ORDEN_EXAMEN_MEDICO_TB_TIPO_EXAMEN_MEDICO]
GO
/****** Object:  ForeignKey [FK_TB_SERVICIOS_DE_EMERGENCIA_TB_ATENCION_EMERGENCIA]    ******/
ALTER TABLE [dbo].[TB_SERVICIOS_DE_EMERGENCIA]  WITH CHECK ADD  CONSTRAINT [FK_TB_SERVICIOS_DE_EMERGENCIA_TB_ATENCION_EMERGENCIA] FOREIGN KEY([ID_ATENCION])
REFERENCES [dbo].[TB_ATENCION_EMERGENCIA] ([ID_ATENCION])
GO
ALTER TABLE [dbo].[TB_SERVICIOS_DE_EMERGENCIA] CHECK CONSTRAINT [FK_TB_SERVICIOS_DE_EMERGENCIA_TB_ATENCION_EMERGENCIA]
GO
/****** Object:  ForeignKey [FK_TB_SERVICIOS_DE_EMERGENCIA_TB_PACIENTE]    ******/
ALTER TABLE [dbo].[TB_SERVICIOS_DE_EMERGENCIA]  WITH CHECK ADD  CONSTRAINT [FK_TB_SERVICIOS_DE_EMERGENCIA_TB_PACIENTE] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[TB_PACIENTE] ([ID_Paciente])
GO
ALTER TABLE [dbo].[TB_SERVICIOS_DE_EMERGENCIA] CHECK CONSTRAINT [FK_TB_SERVICIOS_DE_EMERGENCIA_TB_PACIENTE]
GO
/****** Object:  ForeignKey [FK_TB_DETALLE_SERVICIOS_EXAMENES_TB_SERVICIOS_DE_EMERGENCIA]    ******/
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_EXAMENES]  WITH CHECK ADD  CONSTRAINT [FK_TB_DETALLE_SERVICIOS_EXAMENES_TB_SERVICIOS_DE_EMERGENCIA] FOREIGN KEY([ID_SERVICIO])
REFERENCES [dbo].[TB_SERVICIOS_DE_EMERGENCIA] ([ID_SERVICIO])
GO
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_EXAMENES] CHECK CONSTRAINT [FK_TB_DETALLE_SERVICIOS_EXAMENES_TB_SERVICIOS_DE_EMERGENCIA]
GO
/****** Object:  ForeignKey [FK_TB_DETALLE_SERVICIOS_EXAMENES_TB_ATENCION_EMERGENCIA]    ******/
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_EXAMENES]  WITH CHECK ADD  CONSTRAINT [FK_TB_DETALLE_SERVICIOS_EXAMENES_TB_ATENCION_EMERGENCIA] FOREIGN KEY([ID_ATENCION])
REFERENCES [dbo].[TB_ATENCION_EMERGENCIA] ([ID_ATENCION])
GO
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_EXAMENES] CHECK CONSTRAINT [FK_TB_DETALLE_SERVICIOS_EXAMENES_TB_ATENCION_EMERGENCIA]
GO
/****** Object:  ForeignKey [FK_TB_DETALLE_SERVICIOS_EXAMENES_TB_ORDEN_EXAMEN_MEDICO]    ******/
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_EXAMENES]  WITH CHECK ADD  CONSTRAINT [FK_TB_DETALLE_SERVICIOS_EXAMENES_TB_ORDEN_EXAMEN_MEDICO] FOREIGN KEY([ID_EXAMEN])
REFERENCES [dbo].[TB_ORDEN_EXAMEN_MEDICO] ([ID_Orden_Examen_Medico])
GO
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_EXAMENES] CHECK CONSTRAINT [FK_TB_DETALLE_SERVICIOS_EXAMENES_TB_ORDEN_EXAMEN_MEDICO]
GO
/****** Object:  ForeignKey [FK_TB_DETALLE_SERVICIOS_MEDICAMENTOS_TB_SERVICIOS_DE_EMERGENCIA]    ******/
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_DETALLE_SERVICIOS_MEDICAMENTOS_TB_SERVICIOS_DE_EMERGENCIA] FOREIGN KEY([ID_SERVICIO])
REFERENCES [dbo].[TB_SERVICIOS_DE_EMERGENCIA] ([ID_SERVICIO])
GO
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS] CHECK CONSTRAINT [FK_TB_DETALLE_SERVICIOS_MEDICAMENTOS_TB_SERVICIOS_DE_EMERGENCIA]
GO
/****** Object:  ForeignKey [FK_TB_DETALLE_SERVICIOS_MEDICAMENTOS_TB_ATENCION_EMERGENCIA]    ******/
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_DETALLE_SERVICIOS_MEDICAMENTOS_TB_ATENCION_EMERGENCIA] FOREIGN KEY([ID_ATENCION])
REFERENCES [dbo].[TB_ATENCION_EMERGENCIA] ([ID_ATENCION])
GO
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS] CHECK CONSTRAINT [FK_TB_DETALLE_SERVICIOS_MEDICAMENTOS_TB_ATENCION_EMERGENCIA]
GO
/****** Object:  ForeignKey [FK_TB_DETALLE_SERVICIOS_MEDICAMENTOS_TB_MEDICAMENTO]    ******/
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_DETALLE_SERVICIOS_MEDICAMENTOS_TB_MEDICAMENTO] FOREIGN KEY([ID_Medicamento])
REFERENCES [dbo].[TB_MEDICAMENTO] ([ID_Medicamento])
GO
ALTER TABLE [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS] CHECK CONSTRAINT [FK_TB_DETALLE_SERVICIOS_MEDICAMENTOS_TB_MEDICAMENTO]
GO