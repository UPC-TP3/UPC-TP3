--Select * from BD_ClinicaInternacional..TB_SOLICITUD_MANTENIMIENTO
--Select * from BD_ClinicaInternacional..TB_ORDEN_TRABAJO
/*
update TB_ORDEN_TRABAJO
set GM_Estado='1'
*/
/*
Drop table dbo.TB_ACTIVIDADES_PLANIFICADAS
Drop table dbo.TB_DETALLE_FICHA_EQUIPO
Drop table dbo.TB_Detalle_Solicitud_Mantenimiento
Drop table dbo.TB_FICHA_EQUIPO
Drop table dbo.TB_INFORME
Drop table dbo.TB_INFORME_DET
Drop table dbo.TB_INFORME_EQUIPO/* *** */
Drop table dbo.TB_INFORME_EQUIPO_DET
Drop table dbo.TB_ORDEN_TRABAJO/* *** */
Drop table dbo.TB_PLAN_MANTENIMIENTO
Drop table dbo.TB_SOLICITUD_MANTENIMIENTO

Drop table dbo.TB_ORDEN_TRABAJO_DET
*/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_FICHA_EQUIPO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_FICHA_EQUIPO](
	[ID_Ficha_Equipo] [int] IDENTITY(1,1) NOT NULL,
	[GM_Ubicacion] [varchar](100) NULL,
	[GM_Fecha_ultimo_Mantenimiento] [char](8) NULL,
	[GM_Fecha_Ultima_Reparacion] [char](8) NULL,
	[GM_NroPeriodo_Mantenimiento] [int] NULL,
	[GM_Fecha_Proximo_Mantenimiento] [char](8) NULL,
	[GM_Caracteristicas] [varchar](100) NULL,
	[GM_Observaciones] [varchar](100) NULL,
	[GM_Numero_Equipo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Ficha_Equipo] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_DETALLE_FICHA_EQUIPO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_DETALLE_FICHA_EQUIPO](
	[GM_Detalle_Ficha_Equipo] [int] IDENTITY(1,1) NOT NULL,
	[GM_Codigo_Ficha_Equipo] [int] NULL,
	[GM_Fecha_Último_Mantenimiento] [char](8) NULL,
	[GM_Fecha_Ultima_Reparación] [char](8) NULL,
	[GM_NroPeriodo_Mantenimiento] [int] NULL,
	[GM_Fecha_Proximo_Mantenimiento] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_Detalle_Ficha_Equipo] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_ACTIVIDADES_PLANIFICADAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_ACTIVIDADES_PLANIFICADAS](
	[ID_Actividades_Planificadas] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Planificada] [char](8) NULL,
	[GM_Hora_Inicio] [int] NULL,
	[GM_Hora_Final] [int] NULL,
	[GM_Estado] [int] NULL,
	[GM_NroOrden] [int] NULL,
	[GM_Codigo_PlanMantenimiento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Actividades_Planificadas] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_SOLICITUD_MANTENIMIENTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_SOLICITUD_MANTENIMIENTO](
	[GM_NroSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Creacion] [char](8) NULL,
	[GM_CodigoSolicitante] [char](8) NULL,
	[GM_CodigoBeneficiario] [char](8) NULL,
	[Codigo_CC] [char](8) NULL,
	[GM_Tipo_Servicio] [varchar](50) NULL,
	[GM_Tipo_Mantenimiento] [varchar](50) NULL,
	[GM_Numero_Equipo] [char](8) NULL,
	[GM_FechaIncidencia] [char](8) NULL,
	[GM_Detalle_Servicio] [varchar](100) NULL,
	[GM_Observación] [varchar](100) NULL,
	[GM_Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroSolicitud] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_INFORME_EQUIPO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_INFORME_EQUIPO](
	[ID_InformeEquipo] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Informe] [char](8) NULL,
	[GM_Descripcion_Actividades] [varchar](100) NULL,
	[GM_Observaciones] [varchar](100) NULL,
	[GM_Estado] [int] NULL,
	[GM_Descripcion_Repuestos] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_InformeEquipo] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_INFORME_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_INFORME_DET](
	[GM_NroInforme_Det] [int] IDENTITY(1,1) NOT NULL,
	[GM_NroInforme] [int] NULL,
	[GM_Fecha_Ejecucion] [char](8) NULL,
	[GM_Tiempo_Ejecucion] [int] NULL,
	[GM_Motivo_Ejecucion] [varchar](100) NULL,
	[GM_Documento_adjunto] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroInforme_Det] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_PLAN_MANTENIMIENTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_PLAN_MANTENIMIENTO](
	[ID_PlanMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Creacion] [char](8) NULL,
	[GM_Periodo_Inicio] [char](8) NULL,
	[GM_Periodo_Final] [char](8) NULL,
	[GM_Estado] [int] NULL,
	[GM_Codigo_Plan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PlanMantenimiento] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_ORDEN_TRABAJO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_ORDEN_TRABAJO](
	[GM_NroOrden] [int] IDENTITY(1,1) NOT NULL,
	[GM_NroSolicitud] [int] NULL,
	[GM_Fecha_Creacion] [char](8) NULL,
	[GM_CodigoSolicitante] [varchar](100) NULL,
	[GM_Fecha_Inicio] [char](8) NULL,
	[GM_Fecha_Fin] [char](8) NULL,
	[GM_Empleados_Asociados] [varchar](200) NULL,
	[GM_Prioridad] [varchar](50) NULL,
	[GM_Comentarios] [varchar](100) NULL,
	[GM_Estado] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroOrden] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_INFORME]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_INFORME](
	[GM_NroInforme] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Informe] [char](8) NULL,
	[GM_Descripción_Actividades] [varchar](100) NULL,
	[GM_Observaciones] [varchar](100) NULL,
	[GM_Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroInforme] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_Detalle_Solicitud_Mantenimiento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_Detalle_Solicitud_Mantenimiento](
	[GM_NroDet_Solicitud] [int] IDENTITY(1,1) NOT NULL,
	[GM_NroSolicitud] [int] NULL,
	[GM_Tiempo_Atencion] [varchar](100) NULL,
	[GM_Estado] [int] NULL,
	[GM_Prioridad] [varchar](50) NULL,
	[GM_Observacion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroDet_Solicitud] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_INFORME_EQUIPO_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_INFORME_EQUIPO_DET](
	[ID_InformeEquipoDet] [int] IDENTITY(1,1) NOT NULL,
	[ID_InformeEquipo] [int] NULL,
	[GM_Fecha_Ejecucion] [char](8) NULL,
	[GM_Tiempo_Ejecucion] [int] NULL,
	[GM_Motivo_Rechazo] [varchar](100) NULL,
	[GM_Documento_adjunto] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_InformeEquipoDet] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_FICHA_EQUIPO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_FICHA_EQUIPO](
	[ID_Ficha_Equipo] [int] IDENTITY(1,1) NOT NULL,
	[GM_Ubicacion] [varchar](100) NULL,
	[GM_Fecha_ultimo_Mantenimiento] [char](8) NULL,
	[GM_Fecha_Ultima_Reparacion] [char](8) NULL,
	[GM_NroPeriodo_Mantenimiento] [int] NULL,
	[GM_Fecha_Proximo_Mantenimiento] [char](8) NULL,
	[GM_Caracteristicas] [varchar](100) NULL,
	[GM_Observaciones] [varchar](100) NULL,
	[GM_Numero_Equipo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Ficha_Equipo] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_DETALLE_FICHA_EQUIPO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_DETALLE_FICHA_EQUIPO](
	[GM_Detalle_Ficha_Equipo] [int] IDENTITY(1,1) NOT NULL,
	[GM_Codigo_Ficha_Equipo] [int] NULL,
	[GM_Fecha_Último_Mantenimiento] [char](8) NULL,
	[GM_Fecha_Ultima_Reparación] [char](8) NULL,
	[GM_NroPeriodo_Mantenimiento] [int] NULL,
	[GM_Fecha_Proximo_Mantenimiento] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_Detalle_Ficha_Equipo] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_ACTIVIDADES_PLANIFICADAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_ACTIVIDADES_PLANIFICADAS](
	[ID_Actividades_Planificadas] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Planificada] [char](8) NULL,
	[GM_Hora_Inicio] [int] NULL,
	[GM_Hora_Final] [int] NULL,
	[GM_Estado] [int] NULL,
	[GM_NroOrden] [int] NULL,
	[GM_Codigo_PlanMantenimiento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Actividades_Planificadas] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_SOLICITUD_MANTENIMIENTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_SOLICITUD_MANTENIMIENTO](
	[GM_NroSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Creacion] [char](8) NULL,
	[GM_CodigoSolicitante] [char](8) NULL,
	[GM_CodigoBeneficiario] [char](8) NULL,
	[Codigo_CC] [char](8) NULL,
	[GM_Tipo_Servicio] [varchar](50) NULL,
	[GM_Tipo_Mantenimiento] [varchar](50) NULL,
	[GM_Numero_Equipo] [char](8) NULL,
	[GM_FechaIncidencia] [char](8) NULL,
	[GM_Detalle_Servicio] [varchar](100) NULL,
	[GM_Observación] [varchar](100) NULL,
	[GM_Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroSolicitud] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_INFORME_EQUIPO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_INFORME_EQUIPO](
	[ID_InformeEquipo] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Informe] [char](8) NULL,
	[GM_Descripcion_Actividades] [varchar](100) NULL,
	[GM_Observaciones] [varchar](100) NULL,
	[GM_Estado] [int] NULL,
	[GM_Descripcion_Repuestos] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_InformeEquipo] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_INFORME_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_INFORME_DET](
	[GM_NroInforme_Det] [int] IDENTITY(1,1) NOT NULL,
	[GM_NroInforme] [int] NULL,
	[GM_Fecha_Ejecucion] [char](8) NULL,
	[GM_Tiempo_Ejecucion] [int] NULL,
	[GM_Motivo_Ejecucion] [varchar](100) NULL,
	[GM_Documento_adjunto] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroInforme_Det] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_PLAN_MANTENIMIENTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_PLAN_MANTENIMIENTO](
	[ID_PlanMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Creacion] [char](8) NULL,
	[GM_Periodo_Inicio] [char](8) NULL,
	[GM_Periodo_Final] [char](8) NULL,
	[GM_Estado] [int] NULL,
	[GM_Codigo_Plan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PlanMantenimiento] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_ORDEN_TRABAJO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_ORDEN_TRABAJO](
	[GM_NroOrden] [int] IDENTITY(1,1) NOT NULL,
	[GM_NroSolicitud] [int] NULL,
	[GM_Fecha_Creacion] [char](8) NULL,
	[GM_CodigoSolicitante] [varchar](100) NULL,
	[GM_Fecha_Inicio] [char](8) NULL,
	[GM_Fecha_Fin] [char](8) NULL,
	[GM_Empleados_Asociados] [varchar](200) NULL,
	[GM_Prioridad] [varchar](50) NULL,
	[GM_Comentarios] [varchar](100) NULL,
	[GM_Estado] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroOrden] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_INFORME]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_INFORME](
	[GM_NroInforme] [int] IDENTITY(1,1) NOT NULL,
	[GM_Fecha_Informe] [char](8) NULL,
	[GM_Descripción_Actividades] [varchar](100) NULL,
	[GM_Observaciones] [varchar](100) NULL,
	[GM_Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroInforme] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_Detalle_Solicitud_Mantenimiento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_Detalle_Solicitud_Mantenimiento](
	[GM_NroDet_Solicitud] [int] IDENTITY(1,1) NOT NULL,
	[GM_NroSolicitud] [int] NULL,
	[GM_Tiempo_Atencion] [varchar](100) NULL,
	[GM_Estado] [int] NULL,
	[GM_Prioridad] [varchar](50) NULL,
	[GM_Observacion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GM_NroDet_Solicitud] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_INFORME_EQUIPO_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TB_INFORME_EQUIPO_DET](
	[ID_InformeEquipoDet] [int] IDENTITY(1,1) NOT NULL,
	[ID_InformeEquipo] [int] NULL,
	[GM_Fecha_Ejecucion] [char](8) NULL,
	[GM_Tiempo_Ejecucion] [int] NULL,
	[GM_Motivo_Rechazo] [varchar](100) NULL,
	[GM_Documento_adjunto] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_InformeEquipoDet] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TB_INFORM__ID_In__30C33EC3]') AND parent_object_id = OBJECT_ID(N'[dbo].[TB_INFORME_EQUIPO_DET]'))
ALTER TABLE [dbo].[TB_INFORME_EQUIPO_DET]  WITH CHECK ADD FOREIGN KEY([ID_InformeEquipo])
REFERENCES [dbo].[TB_INFORME_EQUIPO] ([ID_InformeEquipo])
GO
