USE [BD_ClinicaInternacional]
GO
/****** Object:  Table [dbo].[TB_PACIENTE]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_PACIENTE] ON
INSERT [dbo].[TB_PACIENTE] ([ID_Paciente], [dni_paciente], [DocumentoIdentidad], [EstadoCivil], [FechaNacimiento], [Celular], [TelefonoDomicilio], [ID_Pais], [ID_Departamento], [ID_Provincia], [ID_Distrito], [Direccion], [ID_Sexo], [Ocupacion], [ID_TipoDocumento], [nombres], [ApellidoPat], [ApellidoMat], [ID_EstadoCivil], [Correo]) VALUES (1, N'43657655', N'43657655', N's', CAST(0x00007AB700000000 AS DateTime), N'98876545', N'5709876', 51, 1, 1, 1, N'av Lima 876', 1, N'analista', 1, N'Jackeline', N'Fernandez', N'Villanueva', 1, N'jackeline@gmail.com')
INSERT [dbo].[TB_PACIENTE] ([ID_Paciente], [dni_paciente], [DocumentoIdentidad], [EstadoCivil], [FechaNacimiento], [Celular], [TelefonoDomicilio], [ID_Pais], [ID_Departamento], [ID_Provincia], [ID_Distrito], [Direccion], [ID_Sexo], [Ocupacion], [ID_TipoDocumento], [nombres], [ApellidoPat], [ApellidoMat], [ID_EstadoCivil], [Correo]) VALUES (2, N'44409876', N'44409876', N's', CAST(0x00007ABB00000000 AS DateTime), N'98876576', N'5709821', 51, 1, 1, 1, N'av Aviacion 876', 1, N'analista', 1, N'Azucena', N'Hinostroza', N'Martinez', 1, N'azucena@gmail.com')
INSERT [dbo].[TB_PACIENTE] ([ID_Paciente], [dni_paciente], [DocumentoIdentidad], [EstadoCivil], [FechaNacimiento], [Celular], [TelefonoDomicilio], [ID_Pais], [ID_Departamento], [ID_Provincia], [ID_Distrito], [Direccion], [ID_Sexo], [Ocupacion], [ID_TipoDocumento], [nombres], [ApellidoPat], [ApellidoMat], [ID_EstadoCivil], [Correo]) VALUES (3, N'45781122', N'45781122', N's', CAST(0x0000794E00000000 AS DateTime), N'98872376', N'5709809', 51, 1, 1, 1, N'av Primavera 876', 1, N'analista', 1, N'Giannina', N'Pizarro', N'Rodriguez', 1, N'giani@gmail.com')
INSERT [dbo].[TB_PACIENTE] ([ID_Paciente], [dni_paciente], [DocumentoIdentidad], [EstadoCivil], [FechaNacimiento], [Celular], [TelefonoDomicilio], [ID_Pais], [ID_Departamento], [ID_Provincia], [ID_Distrito], [Direccion], [ID_Sexo], [Ocupacion], [ID_TipoDocumento], [nombres], [ApellidoPat], [ApellidoMat], [ID_EstadoCivil], [Correo]) VALUES (4, N'47865433', N'47865433', N's', CAST(0x00007F0300000000 AS DateTime), N'98872372', N'5709801', 51, 1, 1, 1, N'av el sol 876', 1, N'ingeniero', 1, N'Mirian', N'Khan', N'Rodriguez', 1, N'mkhan@gmail.com')
SET IDENTITY_INSERT [dbo].[TB_PACIENTE] OFF
/****** Object:  Table [dbo].[TB_TURNO_EMERGENCIA]    Script Date: 03/16/2014 12:39:45 ******/
/****** Object:  Table [dbo].[TB_TIPO_EXAMEN_MEDICO]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ON
INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen], [descripcion], [DescripcionGeneral]) VALUES (1, N'EXÁMEN DE SANGRE', N'')
INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen], [descripcion], [DescripcionGeneral]) VALUES (2, N'ANÁLISIS DE HECES', N'')
INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen], [descripcion], [DescripcionGeneral]) VALUES (3, N'EXÁMEN DE ORINA', N'')
INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen], [descripcion], [DescripcionGeneral]) VALUES (4, N'EXÁMEN DE CULTIVO DE GARGANTA', N'')
INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen], [descripcion], [DescripcionGeneral]) VALUES (5, N'EXÁMEN LUMBAR', N'')
INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen], [descripcion], [DescripcionGeneral]) VALUES (6, N'EXAMEN DE ELECTROCARDIOGRAMA', N'')
INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen], [descripcion], [DescripcionGeneral]) VALUES (7, N'EXAMEN DE ELECTROENCEFALOGRAMA', N'')
INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen], [descripcion], [DescripcionGeneral]) VALUES (8, N'BIOPSIA', N'')
INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ([ID_Tipo_Examen], [descripcion], [DescripcionGeneral]) VALUES (9, N'EXÁMENES DE RADIOLOGÍA', N'')
SET IDENTITY_INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] OFF
/****** Object:  Table [dbo].[TB_MEDICO]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_MEDICO] ON
INSERT [dbo].[TB_MEDICO] ([ID_Medico], [nom_medico], [ape_medico], [num_cmp], [email], [telefono], [Direccion], [Celular], [TelefonoDomicilio], [FechaCertificacion], [CentroEstudios], [CodigoColegiatura]) VALUES (1, N'Juan', N'Perez Perez', N'34567', N'jperez@cinternacional', N'5467898', N'av el polo 234', N'988767655', N'5467898', N'01/09/1985', N'UNMSM', N'5467898')
INSERT [dbo].[TB_MEDICO] ([ID_Medico], [nom_medico], [ape_medico], [num_cmp], [email], [telefono], [Direccion], [Celular], [TelefonoDomicilio], [FechaCertificacion], [CentroEstudios], [CodigoColegiatura]) VALUES (2, N'Daniela', N'Mijuca Fray', N'34565', N'dmujica@cinternacional', N'5467848', N'av el chimu 234', N'988767455', N'5467848', N'01/09/1999', N'UNMSM', N'34565')
INSERT [dbo].[TB_MEDICO] ([ID_Medico], [nom_medico], [ape_medico], [num_cmp], [email], [telefono], [Direccion], [Celular], [TelefonoDomicilio], [FechaCertificacion], [CentroEstudios], [CodigoColegiatura]) VALUES (3, N'Marilyn', N'Fernandez Valencia', N'34565', N'mfernandez@cinternacional', N'5467248', N'av el chimu 234', N'988761455', N'5467248', N'01/09/1998', N'UNMSM', N'34515')
SET IDENTITY_INSERT [dbo].[TB_MEDICO] OFF
/****** Object:  Table [dbo].[TB_MEDICAMENTO]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_MEDICAMENTO] ON
INSERT [dbo].[TB_MEDICAMENTO] ([ID_Medicamento], [GE_NombreMedicamento], [GE_FechaVencimiento], [GE_CantidadDisponible], [Presentacion], [GE_Costo], [Descripcion], [Laboratorio], [Observaciones]) VALUES (1, N'ALOPURINOL', CAST(0x0000B25800000000 AS DateTime), 36, N'tableta', 24, N'ALOPURINOL 300 MG TAB', N'Peru Farma', N'Venta por tableta')
INSERT [dbo].[TB_MEDICAMENTO] ([ID_Medicamento], [GE_NombreMedicamento], [GE_FechaVencimiento], [GE_CantidadDisponible], [Presentacion], [GE_Costo], [Descripcion], [Laboratorio], [Observaciones]) VALUES (2, N'CAPTOPRIL', CAST(0x0000B25800000000 AS DateTime), 36, N'tableta', 24, N'CAPTOPRIL 25MG TAB', N'Peru Farma', N'Venta por tableta')
INSERT [dbo].[TB_MEDICAMENTO] ([ID_Medicamento], [GE_NombreMedicamento], [GE_FechaVencimiento], [GE_CantidadDisponible], [Presentacion], [GE_Costo], [Descripcion], [Laboratorio], [Observaciones]) VALUES (3, N'CAPTOPRIL', CAST(0x0000B25800000000 AS DateTime), 36, N'tableta', 24, N'CAPTOPRIL 25MG TAB', N'Peru Farma', N'Venta por tableta')
INSERT [dbo].[TB_MEDICAMENTO] ([ID_Medicamento], [GE_NombreMedicamento], [GE_FechaVencimiento], [GE_CantidadDisponible], [Presentacion], [GE_Costo], [Descripcion], [Laboratorio], [Observaciones]) VALUES (4, N'DEXAMETASONA', CAST(0x0000B25800000000 AS DateTime), 36, N'tableta', 24, N'DEXAMETASONA 4MG TAB', N'Peru Farma', N'Venta por tableta')
INSERT [dbo].[TB_MEDICAMENTO] ([ID_Medicamento], [GE_NombreMedicamento], [GE_FechaVencimiento], [GE_CantidadDisponible], [Presentacion], [GE_Costo], [Descripcion], [Laboratorio], [Observaciones]) VALUES (5, N'LEVOTIROXINA', CAST(0x0000B25800000000 AS DateTime), 36, N'tableta', 24, N'LEVOTIROXINA 100MCG', N'Peru Farma', N'Venta por tableta')
SET IDENTITY_INSERT [dbo].[TB_MEDICAMENTO] OFF
/****** Object:  Table [dbo].[TB_Lista_Verificacion]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_Lista_Verificacion] ON
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (1, N'Estado del Biombo', 1)
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (2, N'Sistema electrico', 1)
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (3, N'Grupo electrogeno de emergencia', 1)
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (4, N'Aire acondicionado', 2)
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (5, N'Disponibilidad de tomas de corriente', 1)
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (6, N'Equipo de Radiocomunicación', 1)
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (7, N'Equipo de intubación', 2)
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (8, N'Válvula de oxígeno', 3)
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (9, N'Monitor cardiaco', 2)
INSERT [dbo].[TB_Lista_Verificacion] ([GE_CodigoVerificacion], [GE_Item], [GE_CodigoInstalacion]) VALUES (10, N'Camilla de transporte', 1)
SET IDENTITY_INSERT [dbo].[TB_Lista_Verificacion] OFF
/****** Object:  Table [dbo].[TB_EvaluacionDetalle]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_EvaluacionDetalle] ON
INSERT [dbo].[TB_EvaluacionDetalle] ([GE_CodigoEvaluacionDetalle], [GE_CodigoVerificacion], [GE_Conformidad], [GE_CodigoEvaluacion]) VALUES (1, 1, 1, 1)
INSERT [dbo].[TB_EvaluacionDetalle] ([GE_CodigoEvaluacionDetalle], [GE_CodigoVerificacion], [GE_Conformidad], [GE_CodigoEvaluacion]) VALUES (2, 2, 1, 1)
INSERT [dbo].[TB_EvaluacionDetalle] ([GE_CodigoEvaluacionDetalle], [GE_CodigoVerificacion], [GE_Conformidad], [GE_CodigoEvaluacion]) VALUES (3, 3, 1, 2)
INSERT [dbo].[TB_EvaluacionDetalle] ([GE_CodigoEvaluacionDetalle], [GE_CodigoVerificacion], [GE_Conformidad], [GE_CodigoEvaluacion]) VALUES (4, 4, 1, 2)
SET IDENTITY_INSERT [dbo].[TB_EvaluacionDetalle] OFF
/****** Object:  Table [dbo].[TB_Evaluacion]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_Evaluacion] ON
INSERT [dbo].[TB_Evaluacion] ([GE_CodigoEvaluacion], [GE_CodigoInstalacion], [GE_Disponibilidad], [GE_Resultado], [GE_Observaciones], [GE_NombreEnfermeroAuxiliar], [GE_FechaEvaluacion]) VALUES (1, 1, 1, 1, N'Obs 1', N'JUAN', CAST(0x0000A2EC01802105 AS DateTime))
INSERT [dbo].[TB_Evaluacion] ([GE_CodigoEvaluacion], [GE_CodigoInstalacion], [GE_Disponibilidad], [GE_Resultado], [GE_Observaciones], [GE_NombreEnfermeroAuxiliar], [GE_FechaEvaluacion]) VALUES (2, 1, 1, 1, N'Obs 2', N'JOSE', CAST(0x0000A2EC01802105 AS DateTime))
INSERT [dbo].[TB_Evaluacion] ([GE_CodigoEvaluacion], [GE_CodigoInstalacion], [GE_Disponibilidad], [GE_Resultado], [GE_Observaciones], [GE_NombreEnfermeroAuxiliar], [GE_FechaEvaluacion]) VALUES (3, 2, 1, 1, N'Obs 3', N'CARLOS', CAST(0x0000A2EC01802105 AS DateTime))
INSERT [dbo].[TB_Evaluacion] ([GE_CodigoEvaluacion], [GE_CodigoInstalacion], [GE_Disponibilidad], [GE_Resultado], [GE_Observaciones], [GE_NombreEnfermeroAuxiliar], [GE_FechaEvaluacion]) VALUES (4, 2, 1, 1, N'Obs 4', N'PEDRO', CAST(0x0000A2EC01802105 AS DateTime))
INSERT [dbo].[TB_Evaluacion] ([GE_CodigoEvaluacion], [GE_CodigoInstalacion], [GE_Disponibilidad], [GE_Resultado], [GE_Observaciones], [GE_NombreEnfermeroAuxiliar], [GE_FechaEvaluacion]) VALUES (5, 3, 1, 1, N'Obs 5', N'MARCO', CAST(0x0000A2EC01802105 AS DateTime))
SET IDENTITY_INSERT [dbo].[TB_Evaluacion] OFF
/****** Object:  Table [dbo].[TB_EMPLEADO]    Script Date: 03/16/2014 12:39:45 ******/
/****** Object:  Table [dbo].[TB_CAMA]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_CAMA] ON
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (2, N'101', N'1', N'SALA 1', N'2', CAST(0x0000A2EC01798C73 AS DateTime), N'Juan Perez Castro', N'prueba 1 cambio')
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (3, N'102', N'1', N'SALA 1', N'1', CAST(0x0000A2EC016F3CF2 AS DateTime), N'Juan Perez Castro', N'2')
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (4, N'103', N'2', N'SALA 1', N'1', CAST(0x0000A2EC016E71D9 AS DateTime), N'Juan Perez Castro', N'3')
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (5, N'104', N'2', N'SALA 1', N'2', CAST(0x0000A2EC01099517 AS DateTime), NULL, N'4')
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (6, N'105', N'3', N'SALA 1', N'1', CAST(0x0000A2EC016EF00D AS DateTime), N'Juan Perez Castro', N'5')
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (7, N'201', N'1', N'SALA 2', N'2', CAST(0x0000A2EC01099517 AS DateTime), NULL, N'6')
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (8, N'202', N'1', N'SALA 2', N'2', CAST(0x0000A2EC01099517 AS DateTime), NULL, N'7')
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (9, N'203', N'2', N'SALA 2', N'2', CAST(0x0000A2EC017A3E07 AS DateTime), N'Juan Perez Castro', N'observando')
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (10, N'204', N'2', N'SALA 2', N'2', CAST(0x0000A2EC01099517 AS DateTime), NULL, N'9')
INSERT [dbo].[TB_CAMA] ([ID_Cama], [NroCama], [TipoCama], [Ubicacion], [Estado], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (11, N'205', N'3', N'SALA 2', N'2', CAST(0x0000A2EC01099517 AS DateTime), NULL, N'10')
SET IDENTITY_INSERT [dbo].[TB_CAMA] OFF
/****** Object:  Table [dbo].[TB_Ambiente]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_Ambiente] ON
INSERT [dbo].[TB_Ambiente] ([ID_CodigoInstalacion], [GE_Nombre]) VALUES (1, N'Ambiente 1')
SET IDENTITY_INSERT [dbo].[TB_Ambiente] OFF
/****** Object:  Table [dbo].[TB_TURNO_EMPLEADO]    Script Date: 03/16/2014 12:39:45 ******/
/****** Object:  Table [dbo].[TB_CAMA_HISTORIA]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_CAMA_HISTORIA] ON
INSERT [dbo].[TB_CAMA_HISTORIA] ([IdCamaHistoria], [ID_Cama], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (1, 2, CAST(0x0000A2EC01770709 AS DateTime), N'Juan Perez Castro', N'prueba 1')
INSERT [dbo].[TB_CAMA_HISTORIA] ([IdCamaHistoria], [ID_Cama], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (2, 2, CAST(0x0000A2EC01796713 AS DateTime), N'Juan Perez Castro', N'prueba 1 cambio')
INSERT [dbo].[TB_CAMA_HISTORIA] ([IdCamaHistoria], [ID_Cama], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (3, 2, CAST(0x0000A2EC01798C73 AS DateTime), N'Juan Perez Castro', N'prueba 1 cambio')
INSERT [dbo].[TB_CAMA_HISTORIA] ([IdCamaHistoria], [ID_Cama], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (4, 9, CAST(0x0000A2EC0179B983 AS DateTime), N'Juan Perez Castro', N'observando')
INSERT [dbo].[TB_CAMA_HISTORIA] ([IdCamaHistoria], [ID_Cama], [FechaActualizacion], [EnfermeroActualizador], [Observacion]) VALUES (5, 9, CAST(0x0000A2EC017A3E07 AS DateTime), N'Juan Perez Castro', N'observando')
SET IDENTITY_INSERT [dbo].[TB_CAMA_HISTORIA] OFF
/****** Object:  Table [dbo].[TB_ATENCION_EMERGENCIA]    Script Date: 03/16/2014 12:39:45 ******/
SET IDENTITY_INSERT [dbo].[TB_ATENCION_EMERGENCIA] ON
INSERT [dbo].[TB_ATENCION_EMERGENCIA] ([ID_ATENCION], [GE_FechaIngreso], [ID_Medico], [ID_Paciente], [GE_DescripcionObservaciones], [GE_Estado], [ID_Cama]) VALUES (1, CAST(0x0000A2F200000000 AS DateTime), 2, 2, N'el paciente ingresa con dolores abdominales severos y mareos', N'INGRESADO', 2)
INSERT [dbo].[TB_ATENCION_EMERGENCIA] ([ID_ATENCION], [GE_FechaIngreso], [ID_Medico], [ID_Paciente], [GE_DescripcionObservaciones], [GE_Estado], [ID_Cama]) VALUES (2, CAST(0x0000A2F200000000 AS DateTime), 2, 3, N'el paciente ingresa con multiples contusiones por atropello', N'INGRESADO', 3)
INSERT [dbo].[TB_ATENCION_EMERGENCIA] ([ID_ATENCION], [GE_FechaIngreso], [ID_Medico], [ID_Paciente], [GE_DescripcionObservaciones], [GE_Estado], [ID_Cama]) VALUES (3, CAST(0x0000A2F200000000 AS DateTime), 3, 4, N'el paciente ingresa con cortes en area abdominal', N'INGRESADO', 4)

--SET IDENTITY_INSERT [dbo].[TB_ATENCION_EMERGENCIA] OFF
--/****** Object:  Table [dbo].[TB_SOLICITUD_DE_CAMBIO]    Script Date: 03/16/2014 12:39:45 ******/
--/****** Object:  Table [dbo].[TB_SERVICIOS_DE_EMERGENCIA]    Script Date: 03/16/2014 12:39:45 ******/
--SET IDENTITY_INSERT [dbo].[TB_SERVICIOS_DE_EMERGENCIA] ON
--INSERT [dbo].[TB_SERVICIOS_DE_EMERGENCIA] ([ID_SERVICIO], [ID_ATENCION], [ID_Paciente]) VALUES (1, 1, 1)
--INSERT [dbo].[TB_SERVICIOS_DE_EMERGENCIA] ([ID_SERVICIO], [ID_ATENCION], [ID_Paciente]) VALUES (2, 2, 2)
--INSERT [dbo].[TB_SERVICIOS_DE_EMERGENCIA] ([ID_SERVICIO], [ID_ATENCION], [ID_Paciente]) VALUES (3, 3, 2)
--SET IDENTITY_INSERT [dbo].[TB_SERVICIOS_DE_EMERGENCIA] OFF
--/****** Object:  Table [dbo].[TB_ORDEN_EXAMEN_MEDICO]    Script Date: 03/16/2014 12:39:45 ******/
--SET IDENTITY_INSERT [dbo].[TB_ORDEN_EXAMEN_MEDICO] ON
--INSERT [dbo].[TB_ORDEN_EXAMEN_MEDICO] ([ID_Orden_Examen_Medico], [ID_ATENCION], [ID_Medico], [ID_Orden_Interna], [fecha], [ID_Catalogo_Examen], [estado], [observacion], [GE_FechaSolicitud], [ID_Paciente], [GE_DetalleTecnico], [ID_Tipo_Examen], [GE_NombreMedico], [GE_CodigoOrdenExamen]) VALUES (1, 1, 1, 1, CAST(0x0000A2EF00D2279C AS DateTime), 1, N'1', N'', CAST(0x0000A2EF00D2279C AS DateTime), 1, N'SE DEBE DE REALIZAR UN ANALISIS DE...', 1, N'', 1)
--INSERT [dbo].[TB_ORDEN_EXAMEN_MEDICO] ([ID_Orden_Examen_Medico], [ID_ATENCION], [ID_Medico], [ID_Orden_Interna], [fecha], [ID_Catalogo_Examen], [estado], [observacion], [GE_FechaSolicitud], [ID_Paciente], [GE_DetalleTecnico], [ID_Tipo_Examen], [GE_NombreMedico], [GE_CodigoOrdenExamen]) VALUES (2, 2, 2, 1, CAST(0x0000A2EF010397DC AS DateTime), 1, N'1', N'', CAST(0x0000A2EF014582DC AS DateTime), 1, N'SE DEBE DE REALIZAR UN ANALISIS DE...', 2, N'', 1)
--INSERT [dbo].[TB_ORDEN_EXAMEN_MEDICO] ([ID_Orden_Examen_Medico], [ID_ATENCION], [ID_Medico], [ID_Orden_Interna], [fecha], [ID_Catalogo_Examen], [estado], [observacion], [GE_FechaSolicitud], [ID_Paciente], [GE_DetalleTecnico], [ID_Tipo_Examen], [GE_NombreMedico], [GE_CodigoOrdenExamen]) VALUES (3, 3, 3, 1, CAST(0x0000A2EF010397DC AS DateTime), 1, N'1', N'', CAST(0x0000A2EF0155FD9C AS DateTime), 1, N'SE DEBE DE REALIZAR UN ANALISIS DE...', 3, N'', 1)
--SET IDENTITY_INSERT [dbo].[TB_ORDEN_EXAMEN_MEDICO] OFF
--/****** Object:  Table [dbo].[TB_ORDEN_DE_SALIDA]    Script Date: 03/16/2014 12:39:45 ******/
--SET IDENTITY_INSERT [dbo].[TB_ORDEN_DE_SALIDA] ON
--INSERT [dbo].[TB_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_FechaSalida], [ID_ATENCION], [GE_Observacion]) VALUES (1, CAST(0x0000A2C600000000 AS DateTime), NULL, N'Paciente de alta , se solicita programar cita en admision ambulatoria')
--INSERT [dbo].[TB_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_FechaSalida], [ID_ATENCION], [GE_Observacion]) VALUES (2, CAST(0x0000A2C600000000 AS DateTime), NULL, N'Paciente de alta , se solicita programar cita en admision ambulatoria')
--INSERT [dbo].[TB_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_FechaSalida], [ID_ATENCION], [GE_Observacion]) VALUES (3, CAST(0x0000A2C600000000 AS DateTime), NULL, N'Paciente de alta , se solicita programar cita en admision ambulatoria')
--INSERT [dbo].[TB_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_FechaSalida], [ID_ATENCION], [GE_Observacion]) VALUES (4, CAST(0x0000A2C600000000 AS DateTime), NULL, N'Paciente de alta , se solicita programar cita en admision ambulatoria')
--INSERT [dbo].[TB_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_FechaSalida], [ID_ATENCION], [GE_Observacion]) VALUES (5, CAST(0x0000A2C600000000 AS DateTime), NULL, N'Paciente de alta , se solicita programar cita en admision ambulatoria')
--SET IDENTITY_INSERT [dbo].[TB_ORDEN_DE_SALIDA] OFF
--/****** Object:  Table [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS]    Script Date: 03/16/2014 12:39:45 ******/
--SET IDENTITY_INSERT [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS] ON
--INSERT [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS] ([ID_SERVICIO], [ID_ATENCION], [ID_MEDICAMENTO], [CANTIDAD], [STATUS], [FECHA]) VALUES (1, 1, 1, 2, 0, CAST(0x0000A2C600000000 AS DateTime))
--INSERT [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS] ([ID_SERVICIO], [ID_ATENCION], [ID_MEDICAMENTO], [CANTIDAD], [STATUS], [FECHA]) VALUES (2, 1, 2, 2, 0, CAST(0x0000A2C600000000 AS DateTime))
--INSERT [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS] ([ID_SERVICIO], [ID_ATENCION], [ID_MEDICAMENTO], [CANTIDAD], [STATUS], [FECHA]) VALUES (3, 1, 3, 2, 0, CAST(0x0000A2C600000000 AS DateTime))
--SET IDENTITY_INSERT [dbo].[TB_DETALLE_SERVICIOS_MEDICAMENTOS] OFF
--/****** Object:  Table [dbo].[TB_DETALLE_SERVICIOS_EXAMENES]    Script Date: 03/16/2014 12:39:45 ******/
--SET IDENTITY_INSERT [dbo].[TB_DETALLE_SERVICIOS_EXAMENES] ON
--INSERT [dbo].[TB_DETALLE_SERVICIOS_EXAMENES] ([ID_SERVICIO], [ID_ATENCION], [ID_EXAMEN], [STATUS], [FECHA]) VALUES (1, 1, 1, 0, CAST(0x0000A2EF00AE2CAC AS DateTime))
--INSERT [dbo].[TB_DETALLE_SERVICIOS_EXAMENES] ([ID_SERVICIO], [ID_ATENCION], [ID_EXAMEN], [STATUS], [FECHA]) VALUES (2, 2, 2, 0, CAST(0x0000A2EF00BEA76C AS DateTime))
--INSERT [dbo].[TB_DETALLE_SERVICIOS_EXAMENES] ([ID_SERVICIO], [ID_ATENCION], [ID_EXAMEN], [STATUS], [FECHA]) VALUES (3, 3, 3, 0, CAST(0x0000A2EF00CF222C AS DateTime))
--SET IDENTITY_INSERT [dbo].[TB_DETALLE_SERVICIOS_EXAMENES] OFF
--/****** Object:  Table [dbo].[TB_DETALLE_ORDEN_DE_SALIDA]    Script Date: 03/16/2014 12:39:45 ******/
--INSERT [dbo].[TB_DETALLE_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_Cantidad], [ID_Medicamento]) VALUES (1, 3, 1)
--INSERT [dbo].[TB_DETALLE_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_Cantidad], [ID_Medicamento]) VALUES (1, 2, 2)
--INSERT [dbo].[TB_DETALLE_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_Cantidad], [ID_Medicamento]) VALUES (1, 3, 3)
--INSERT [dbo].[TB_DETALLE_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_Cantidad], [ID_Medicamento]) VALUES (2, 3, 1)
--INSERT [dbo].[TB_DETALLE_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_Cantidad], [ID_Medicamento]) VALUES (2, 3, 2)
--INSERT [dbo].[TB_DETALLE_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_Cantidad], [ID_Medicamento]) VALUES (2, 3, 3)
--INSERT [dbo].[TB_DETALLE_ORDEN_DE_SALIDA] ([ID_OrdenSalida], [GE_Cantidad], [ID_Medicamento]) VALUES (3, 3, 3)
