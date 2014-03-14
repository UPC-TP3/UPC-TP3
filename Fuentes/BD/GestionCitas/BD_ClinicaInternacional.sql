use master
go

create database DB_SGH
go

USE [DB_SGH]
GO
/****** Object:  Table [dbo].[TB_Turno_Citas]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Turno_Citas](
	[IdTurno] [int] IDENTITY(1,1) NOT NULL,
	[HoraInicio] [datetime] NULL,
	[HoraFinal] [datetime] NULL,
 CONSTRAINT [PK_TB_TurnoCitas] PRIMARY KEY CLUSTERED 
(
	[IdTurno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Tipo_Analisis]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Tipo_Analisis](
	[CodigoTipoAnalisis] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[TipoResultado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoTipoAnalisis] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Medicamento]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Medicamento](
	[CodigoMedicamento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Laboratorio] [varchar](100) NULL,
	[Observaciones] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoMedicamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Local]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Local](
	[CodigoLocal] [int] IDENTITY(1,1) NOT NULL,
	[NombreLocal] [varchar](100) NULL,
	[DireccionLocal] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoLocal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Estado_Cita]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Estado_Cita](
	[IdEstado] [int] NOT NULL,
	[DesEstado] [varchar](20) NULL,
 CONSTRAINT [PK_EstadoCitas] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Especialidad]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Especialidad](
	[CodigoEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoEspecialidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Paciente]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Paciente](
	[CodigoPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[ApellidoPat] [varchar](100) NULL,
	[ApellidoMat] [varchar](100) NULL,
	[Direccion] [varchar](100) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Telefono] [varchar](15) NULL,
	[TelefonoCasa] [varchar](15) NULL,
	[Dni] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoPaciente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Orden_Hopitalizacion]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Orden_Hopitalizacion](
	[CodigoOrden] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Observaciones] [varchar](100) NULL,
	[FechaHoraAlta] [datetime] NULL,
	[CodigoMotivo] [int] NOT NULL,
	[CodigoConsulta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoOrden] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Motivo_Hospitalizacion]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Motivo_Hospitalizacion](
	[CodigoMotivo] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionInternamiento] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoMotivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Medico]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Medico](
	[CodigoMedico] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[CodigoEspecialidad] [int] NULL,
	[NumeroColegiatura] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoMedico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Consultorio]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Consultorio](
	[CodigoConsultorio] [int] IDENTITY(1,1) NOT NULL,
	[NumeroConsultorio] [varchar](20) NULL,
	[Piso] [varchar](20) NULL,
	[CodigoLocal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoConsultorio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Agenda_Medica]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agenda_Medica](
	[CodigoAgenda] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[HoraInicio] [datetime] NULL,
	[HoraFin] [datetime] NULL,
	[Estado] [bit] NOT NULL,
	[CodigoMedico] [int] NOT NULL,
	[NumeroConsultorio] [nchar](10) NULL,
	[IdTurno] [int] NOT NULL,
 CONSTRAINT [PK__TB_Agend__797B03C87F60ED59] PRIMARY KEY CLUSTERED 
(
	[CodigoAgenda] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Cita]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Cita](
	[CodigoCita] [int] IDENTITY(1,1) NOT NULL,
	[FechaCita] [date] NULL,
	[CodigoPaciente] [int] NOT NULL,
	[CodigoMedico] [int] NOT NULL,
	[CodigoAgenda] [int] NOT NULL,
	[IdEstado] [int] NULL,
	[AtencionLocal] [bit] NULL,
	[DireccionDomicilio] [varchar](100) NULL,
	[ReferenciaDomicilio] [varchar](max) NULL,
	[SintomasPaciente] [varchar](max) NULL,
	[Aseguradora] [varchar](50) NULL,
	[Cobertura] [money] NULL,
 CONSTRAINT [PK__Cita__D97C79B007020F21] PRIMARY KEY CLUSTERED 
(
	[CodigoCita] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Consulta]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Consulta](
	[CodigoConsulta] [int] IDENTITY(1,1) NOT NULL,
	[FechaHoraInicio] [datetime] NOT NULL,
	[FechaHoraFin] [datetime] NULL,
	[Observaciones] [varchar](100) NULL,
	[CodigoMedico] [int] NOT NULL,
	[CodigoCita] [int] NOT NULL,
	[CodigoConsultorio] [int] NOT NULL,
	[CodigoPaciente] [int] NOT NULL,
	[Diagnostico] [varchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoConsulta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Prescripcion_Medica]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Prescripcion_Medica](
	[CodigoReceta] [int] IDENTITY(1,1) NOT NULL,
	[Dosis] [varchar](50) NULL,
	[Frecuencia] [varchar](50) NULL,
	[CodigoMedicamento] [int] NOT NULL,
	[CodigoConsulta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoReceta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Analisis]    Script Date: 03/13/2014 15:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Analisis](
	[CodigoAnalisis] [int] IDENTITY(1,1) NOT NULL,
	[FechaSolicitud] [datetime] NULL,
	[FechaAnalisis] [datetime] NULL,
	[Resultado] [varchar](50) NULL,
	[Observaciones] [varchar](100) NULL,
	[CodigoConsulta] [int] NOT NULL,
	[CodigoTipoAnalisis] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoAnalisis] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__TB_Agenda__Codig__32E0915F]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Agenda_Medica]  WITH CHECK ADD  CONSTRAINT [FK__TB_Agenda__Codig__32E0915F] FOREIGN KEY([CodigoMedico])
REFERENCES [dbo].[TB_Medico] ([CodigoMedico])
GO
ALTER TABLE [dbo].[TB_Agenda_Medica] CHECK CONSTRAINT [FK__TB_Agenda__Codig__32E0915F]
GO
/****** Object:  ForeignKey [FK__TB_Agenda__Codig__33D4B598]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Agenda_Medica]  WITH CHECK ADD  CONSTRAINT [FK__TB_Agenda__Codig__33D4B598] FOREIGN KEY([CodigoMedico])
REFERENCES [dbo].[TB_Medico] ([CodigoMedico])
GO
ALTER TABLE [dbo].[TB_Agenda_Medica] CHECK CONSTRAINT [FK__TB_Agenda__Codig__33D4B598]
GO
/****** Object:  ForeignKey [FK_TB_Agenda_Medica_TB_Turno_Citas]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Agenda_Medica]  WITH CHECK ADD  CONSTRAINT [FK_TB_Agenda_Medica_TB_Turno_Citas] FOREIGN KEY([IdTurno])
REFERENCES [dbo].[TB_Turno_Citas] ([IdTurno])
GO
ALTER TABLE [dbo].[TB_Agenda_Medica] CHECK CONSTRAINT [FK_TB_Agenda_Medica_TB_Turno_Citas]
GO
/****** Object:  ForeignKey [FK__TB_Analis__Codig__34C8D9D1]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Analisis]  WITH CHECK ADD FOREIGN KEY([CodigoTipoAnalisis])
REFERENCES [dbo].[TB_Tipo_Analisis] ([CodigoTipoAnalisis])
GO
/****** Object:  ForeignKey [FK__TB_Analis__Codig__35BCFE0A]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Analisis]  WITH CHECK ADD FOREIGN KEY([CodigoConsulta])
REFERENCES [dbo].[TB_Consulta] ([CodigoConsulta])
GO
/****** Object:  ForeignKey [FK__TB_Analis__Codig__36B12243]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Analisis]  WITH CHECK ADD FOREIGN KEY([CodigoTipoAnalisis])
REFERENCES [dbo].[TB_Tipo_Analisis] ([CodigoTipoAnalisis])
GO
/****** Object:  ForeignKey [FK__TB_Analis__Codig__37A5467C]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Analisis]  WITH CHECK ADD FOREIGN KEY([CodigoConsulta])
REFERENCES [dbo].[TB_Consulta] ([CodigoConsulta])
GO
/****** Object:  ForeignKey [FK__Cita__CodigoAgen__33D4B598]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Cita]  WITH CHECK ADD  CONSTRAINT [FK__Cita__CodigoAgen__33D4B598] FOREIGN KEY([CodigoAgenda])
REFERENCES [dbo].[TB_Agenda_Medica] ([CodigoAgenda])
GO
ALTER TABLE [dbo].[TB_Cita] CHECK CONSTRAINT [FK__Cita__CodigoAgen__33D4B598]
GO
/****** Object:  ForeignKey [FK__Cita__CodigoMedi__36B12243]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Cita]  WITH CHECK ADD  CONSTRAINT [FK__Cita__CodigoMedi__36B12243] FOREIGN KEY([CodigoMedico])
REFERENCES [dbo].[TB_Medico] ([CodigoMedico])
GO
ALTER TABLE [dbo].[TB_Cita] CHECK CONSTRAINT [FK__Cita__CodigoMedi__36B12243]
GO
/****** Object:  ForeignKey [FK__Cita__CodigoPaci__37A5467C]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Cita]  WITH CHECK ADD  CONSTRAINT [FK__Cita__CodigoPaci__37A5467C] FOREIGN KEY([CodigoPaciente])
REFERENCES [dbo].[TB_Paciente] ([CodigoPaciente])
GO
ALTER TABLE [dbo].[TB_Cita] CHECK CONSTRAINT [FK__Cita__CodigoPaci__37A5467C]
GO
/****** Object:  ForeignKey [FK_Cita_EstadoCita]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_EstadoCita] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[TB_Estado_Cita] ([IdEstado])
GO
ALTER TABLE [dbo].[TB_Cita] CHECK CONSTRAINT [FK_Cita_EstadoCita]
GO
/****** Object:  ForeignKey [FK__Consulta__Codigo__3B75D760]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Consulta]  WITH CHECK ADD  CONSTRAINT [FK__Consulta__Codigo__3B75D760] FOREIGN KEY([CodigoCita])
REFERENCES [dbo].[TB_Cita] ([CodigoCita])
GO
ALTER TABLE [dbo].[TB_Consulta] CHECK CONSTRAINT [FK__Consulta__Codigo__3B75D760]
GO
/****** Object:  ForeignKey [FK__TB_Consul__Codig__3D5E1FD2]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Consulta]  WITH CHECK ADD FOREIGN KEY([CodigoPaciente])
REFERENCES [dbo].[TB_Paciente] ([CodigoPaciente])
GO
/****** Object:  ForeignKey [FK__TB_Consul__Codig__3E52440B]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Consulta]  WITH CHECK ADD FOREIGN KEY([CodigoConsultorio])
REFERENCES [dbo].[TB_Consultorio] ([CodigoConsultorio])
GO
/****** Object:  ForeignKey [FK__TB_Consul__Codig__3F466844]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Consulta]  WITH CHECK ADD FOREIGN KEY([CodigoMedico])
REFERENCES [dbo].[TB_Medico] ([CodigoMedico])
GO
/****** Object:  ForeignKey [FK__TB_Consul__Codig__403A8C7D]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Consulta]  WITH CHECK ADD FOREIGN KEY([CodigoPaciente])
REFERENCES [dbo].[TB_Paciente] ([CodigoPaciente])
GO
/****** Object:  ForeignKey [FK__TB_Consul__Codig__412EB0B6]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Consulta]  WITH CHECK ADD FOREIGN KEY([CodigoConsultorio])
REFERENCES [dbo].[TB_Consultorio] ([CodigoConsultorio])
GO
/****** Object:  ForeignKey [FK__TB_Consul__Codig__4222D4EF]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Consulta]  WITH CHECK ADD FOREIGN KEY([CodigoMedico])
REFERENCES [dbo].[TB_Medico] ([CodigoMedico])
GO
/****** Object:  ForeignKey [FK__TB_Consul__Codig__4316F928]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Consultorio]  WITH CHECK ADD FOREIGN KEY([CodigoLocal])
REFERENCES [dbo].[TB_Local] ([CodigoLocal])
GO
/****** Object:  ForeignKey [FK__TB_Consul__Codig__440B1D61]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Consultorio]  WITH CHECK ADD FOREIGN KEY([CodigoLocal])
REFERENCES [dbo].[TB_Local] ([CodigoLocal])
GO
/****** Object:  ForeignKey [FK__TB_Medico__Codig__44FF419A]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Medico]  WITH CHECK ADD FOREIGN KEY([CodigoEspecialidad])
REFERENCES [dbo].[TB_Especialidad] ([CodigoEspecialidad])
GO
/****** Object:  ForeignKey [FK__TB_Medico__Codig__45F365D3]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Medico]  WITH CHECK ADD FOREIGN KEY([CodigoEspecialidad])
REFERENCES [dbo].[TB_Especialidad] ([CodigoEspecialidad])
GO
/****** Object:  ForeignKey [FK__TB_Prescr__Codig__46E78A0C]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Prescripcion_Medica]  WITH CHECK ADD FOREIGN KEY([CodigoConsulta])
REFERENCES [dbo].[TB_Consulta] ([CodigoConsulta])
GO
/****** Object:  ForeignKey [FK__TB_Prescr__Codig__47DBAE45]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Prescripcion_Medica]  WITH CHECK ADD FOREIGN KEY([CodigoMedicamento])
REFERENCES [dbo].[TB_Medicamento] ([CodigoMedicamento])
GO
/****** Object:  ForeignKey [FK__TB_Prescr__Codig__48CFD27E]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Prescripcion_Medica]  WITH CHECK ADD FOREIGN KEY([CodigoConsulta])
REFERENCES [dbo].[TB_Consulta] ([CodigoConsulta])
GO
/****** Object:  ForeignKey [FK__TB_Prescr__Codig__49C3F6B7]    Script Date: 03/13/2014 15:24:40 ******/
ALTER TABLE [dbo].[TB_Prescripcion_Medica]  WITH CHECK ADD FOREIGN KEY([CodigoMedicamento])
REFERENCES [dbo].[TB_Medicamento] ([CodigoMedicamento])
GO
