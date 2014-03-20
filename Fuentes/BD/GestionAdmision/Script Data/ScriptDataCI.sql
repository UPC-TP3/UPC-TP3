USE [BD_ClinicaInternacional]
GO

DELETE FROM [TB_MAESTRO_TABLAS]

INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('10','00','Tipo Documento','Tipo Documento','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('20','00','Sexo','Sexo','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('30','00','Tipo Atencion','Tipo Atencion','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('40','00','Motivo','Motivo','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('50','00','Estado Civil','Estado Civil','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('60','00','Tipo Orden','Tipo Orden','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('70','00','Est Orden Hosp','Estado Orden de Hospitalizacion','','1')

INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('10','1','Dni','Dni','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('10','2','Carnet Extranjería','Dni','','1')

INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('20','1','Masculino','M','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('20','2','Femenino','F','','1')

INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('30','1','Ambulatoria','A','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('30','2','Emergencia','E','','1')

INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('40','1','Médico','A','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('40','2','Ambulatorio','E','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('40','3','Quirúrgico','E','','1')

INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('50','1','Soltero','E','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('50','2','Casado','E','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('50','3','Divorciado','E','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('50','4','Viudo','E','','1')

INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('60','1','Congénito','Congénito','','1') 
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('60','2','Adquirido','Adquirido','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('60','3','Traumático','Traumático','','1')

INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('70','1','Registrado','','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('70','2','Cancelado','','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('70','3','Activado','','','1')
INSERT INTO [dbo].[TB_MAESTRO_TABLAS]([MAS_CodTabla],[MAS_CodCampo],[MAS_DesCorta],[MAS_DesLarga],[MAS_Valor],[MAS_Estado])VALUES ('70','4','Caducado','','','1')


SET IDENTITY_INSERT [dbo].[TB_CAMA] ON
INSERT INTO [dbo].[TB_CAMA]([ID_Cama],[NroCama],[TipoCama],[Ubicacion],[Estado],[ID_Hoja_Ingreso_Hospitalizacion])VALUES(1,'101','Pedriática','201-A','1',NULL)
INSERT INTO [dbo].[TB_CAMA]([ID_Cama],[NroCama],[TipoCama],[Ubicacion],[Estado],[ID_Hoja_Ingreso_Hospitalizacion])VALUES(2,'102','Pedriática','201-A','1',NULL)
INSERT INTO [dbo].[TB_CAMA]([ID_Cama],[NroCama],[TipoCama],[Ubicacion],[Estado],[ID_Hoja_Ingreso_Hospitalizacion])VALUES(3,'103','Pedriática','201-A','1',NULL)
INSERT INTO [dbo].[TB_CAMA]([ID_Cama],[NroCama],[TipoCama],[Ubicacion],[Estado],[ID_Hoja_Ingreso_Hospitalizacion])VALUES(4,'104','Pedriática','201-A','1',NULL)
INSERT INTO [dbo].[TB_CAMA]([ID_Cama],[NroCama],[TipoCama],[Ubicacion],[Estado],[ID_Hoja_Ingreso_Hospitalizacion])VALUES(5,'105','Pedriática','201-A','1',NULL)
INSERT INTO [dbo].[TB_CAMA]([ID_Cama],[NroCama],[TipoCama],[Ubicacion],[Estado],[ID_Hoja_Ingreso_Hospitalizacion])VALUES(6,'106','Pedriática','201-A','1',NULL)
SET IDENTITY_INSERT [dbo].[TB_CAMA] OFF


SET IDENTITY_INSERT [TB_ESTADO_CITA] ON
INSERT INTO [dbo].[TB_ESTADO_CITA](ID_EstadoCita,[DesEstado]) VALUES (1,'Registrada')
INSERT INTO [dbo].[TB_ESTADO_CITA](ID_EstadoCita,[DesEstado]) VALUES (2,'Cancelada')
INSERT INTO [dbo].[TB_ESTADO_CITA](ID_EstadoCita,[DesEstado]) VALUES (3,'Activada')
SET IDENTITY_INSERT [TB_ESTADO_CITA] OFF

SET IDENTITY_INSERT [dbo].[TB_TIPO_DOCUMENTO] ON
INSERT [dbo].[TB_TIPO_DOCUMENTO] ([ID_TipoDocumento], [Nombre]) VALUES (1, N'Dni')
INSERT [dbo].[TB_TIPO_DOCUMENTO] ([ID_TipoDocumento], [Nombre]) VALUES (2, N'Pasaporte')
INSERT [dbo].[TB_TIPO_DOCUMENTO] ([ID_TipoDocumento], [Nombre]) VALUES (3, N'Carnet de Extranjería')
SET IDENTITY_INSERT [dbo].[TB_TIPO_DOCUMENTO] OFF

SET IDENTITY_INSERT [dbo].[TB_PACIENTE] ON
INSERT [dbo].[TB_PACIENTE] ([ID_Paciente], [dni_paciente], [FechaNacimiento], [Celular], [TelefonoDomicilio], [ID_Pais], [ID_Departamento], [ID_Provincia], [ID_Distrito], [Direccion], [ID_Sexo], [Ocupacion], [ID_TipoDocumento], [nombres], [ApellidoPat], [ApellidoMat], [ID_EstadoCivil], [Correo]) VALUES (1, N'41365536', CAST(0x00007A9700000000 AS DateTime), N'951292670', N'4781135', 1, 1, 1, 1, N'Av.Manuel de la Torre #846', 1, N'Sistemas', 1, N'Lolo', N'Cisneros', N'Ramos', 1, NULL)
INSERT [dbo].[TB_PACIENTE] ([ID_Paciente], [dni_paciente], [FechaNacimiento], [Celular], [TelefonoDomicilio], [ID_Pais], [ID_Departamento], [ID_Provincia], [ID_Distrito], [Direccion], [ID_Sexo], [Ocupacion], [ID_TipoDocumento], [nombres], [ApellidoPat], [ApellidoMat], [ID_EstadoCivil], [Correo]) VALUES (2, N'41362536', CAST(0x00007A9700000000 AS DateTime), N'951292670', N'4781135', 1, 1, 1, 1, N'Av.Manuel de la Torre #846', 1, N'Sistemas', 1, N'Carlos', N'Peralta', N'Ramos', 1, NULL)
INSERT [dbo].[TB_PACIENTE] ([ID_Paciente], [dni_paciente], [FechaNacimiento], [Celular], [TelefonoDomicilio], [ID_Pais], [ID_Departamento], [ID_Provincia], [ID_Distrito], [Direccion], [ID_Sexo], [Ocupacion], [ID_TipoDocumento], [nombres], [ApellidoPat], [ApellidoMat], [ID_EstadoCivil], [Correo]) VALUES (3, N'56562536', CAST(0x00007A9700000000 AS DateTime), N'951365810', N'4541135', 1, 1, 1, 1, N'Av.Manuel de la Torre #846', 1, N'Sistemas', 1, N'Lorenzo', N'Caceres', N'Correa', 2, NULL)
INSERT [dbo].[TB_PACIENTE] ([ID_Paciente], [dni_paciente], [FechaNacimiento], [Celular], [TelefonoDomicilio], [ID_Pais], [ID_Departamento], [ID_Provincia], [ID_Distrito], [Direccion], [ID_Sexo], [Ocupacion], [ID_TipoDocumento], [nombres], [ApellidoPat], [ApellidoMat], [ID_EstadoCivil], [Correo]) VALUES (4, N'41677836', CAST(0x00007A9700000000 AS DateTime), N'994542676', N'4487687', 1, 1, 1, 1, N'Av.Manuel de la Torre #846', 1, N'Sistemas', 1, N'Jose', N'Pardo', N'Diaz', 2, NULL)
INSERT [dbo].[TB_PACIENTE] ([ID_Paciente], [dni_paciente], [FechaNacimiento], [Celular], [TelefonoDomicilio], [ID_Pais], [ID_Departamento], [ID_Provincia], [ID_Distrito], [Direccion], [ID_Sexo], [Ocupacion], [ID_TipoDocumento], [nombres], [ApellidoPat], [ApellidoMat], [ID_EstadoCivil], [Correo]) VALUES (5, N'44160506', CAST(0x00007A9700000000 AS DateTime), N'976772665', N'4782445', 1, 1, 1, 1, N'Av.Manuel de la Torre #846', 2, N'Sistemas', 1, N'Camila', N'Perez', N'Costa', 1, NULL)
SET IDENTITY_INSERT [dbo].[TB_PACIENTE] OFF

SET IDENTITY_INSERT [TB_HISTORIA_CLINICA] ON
INSERT INTO [dbo].[TB_HISTORIA_CLINICA]([ID_Historia],[FechaRegistro],[Antecedentes],[Descripcion],[FechaAtencion],[ID_Paciente],[ID_GrupoSanguineo])VALUES(1,GETDATE(),'Bronquios','',GETDATE(),1,1)
INSERT INTO [dbo].[TB_HISTORIA_CLINICA]([ID_Historia],[FechaRegistro],[Antecedentes],[Descripcion],[FechaAtencion],[ID_Paciente],[ID_GrupoSanguineo])VALUES(2,GETDATE(),'Bronquios','',GETDATE(),2,1)
INSERT INTO [dbo].[TB_HISTORIA_CLINICA]([ID_Historia],[FechaRegistro],[Antecedentes],[Descripcion],[FechaAtencion],[ID_Paciente],[ID_GrupoSanguineo])VALUES(3,GETDATE(),'Bronquios','',GETDATE(),3,1)
INSERT INTO [dbo].[TB_HISTORIA_CLINICA]([ID_Historia],[FechaRegistro],[Antecedentes],[Descripcion],[FechaAtencion],[ID_Paciente],[ID_GrupoSanguineo])VALUES(4,GETDATE(),'Bronquios','',GETDATE(),4,1)
SET IDENTITY_INSERT [TB_HISTORIA_CLINICA] OFF

SET IDENTITY_INSERT [dbo].[TB_MEDICO] ON
INSERT [dbo].[TB_MEDICO] ([ID_Medico], [nom_medico], [ape_medico], [num_cmp], [email], [telefono], [Direccion], [Celular], [TelefonoDomicilio], [FechaCertificacion], [CentroEstudios], [CodigoColegiatura]) VALUES (1, N'PedroJuan', N'Molina Aguero', N'1', N'pmolina@ci.com.pe', NULL, N'Av.Rosa Toro #244', N'981102706', N'5520184', NULL, N'U.San Martín', NULL)
INSERT [dbo].[TB_MEDICO] ([ID_Medico], [nom_medico], [ape_medico], [num_cmp], [email], [telefono], [Direccion], [Celular], [TelefonoDomicilio], [FechaCertificacion], [CentroEstudios], [CodigoColegiatura]) VALUES (2, N'Alonso', N'Sotomayor Alvarez', N'98995', N'asotomayor@ci.com.pe', 5520184, N'Av.Los Sauces 588', N'981102706', N'5520184', NULL, N'U.San Martín', NULL)
INSERT [dbo].[TB_MEDICO] ([ID_Medico], [nom_medico], [ape_medico], [num_cmp], [email], [telefono], [Direccion], [Celular], [TelefonoDomicilio], [FechaCertificacion], [CentroEstudios], [CodigoColegiatura]) VALUES (3, N'Pedro', N'Rivera Fiorelaso', N'47588', N'privera@ci.com.pe', 3624796, N'Av.Los Eucaliptos 545', N'951292370', N'3624796', NULL, N'U.San Marcos', NULL)
INSERT [dbo].[TB_MEDICO] ([ID_Medico], [nom_medico], [ape_medico], [num_cmp], [email], [telefono], [Direccion], [Celular], [TelefonoDomicilio], [FechaCertificacion], [CentroEstudios], [CodigoColegiatura]) VALUES (4, N'Carlos', N'Cepeda Cabrera', N'47438', N'prcacedat@ci.com.pe', 3624796, N'Av.Los Alamos 545', N'951276570', N'3624796', NULL, N'U.San Marcos', NULL)
SET IDENTITY_INSERT [dbo].[TB_MEDICO] OFF



SET IDENTITY_INSERT [dbo].[TB_LOCAL] ON
INSERT [dbo].[TB_LOCAL] ([ID_Local], [nombre], [direccion]) VALUES (1, N'San Borja', N'Av.Guardía Civil 385')
INSERT [dbo].[TB_LOCAL] ([ID_Local], [nombre], [direccion]) VALUES (2, N'Lima', N'Av.Garcilaso de la Vega 1420')
INSERT [dbo].[TB_LOCAL] ([ID_Local], [nombre], [direccion]) VALUES (3, N'San Isidro', N'A.Paseo de la República 3058')
SET IDENTITY_INSERT [dbo].[TB_LOCAL] OFF

SET IDENTITY_INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] ON
INSERT INTO [TB_TIPO_EXAMEN_MEDICO] (ID_Tipo_Examen,descripcion) Values (1,'General')
INSERT INTO [TB_TIPO_EXAMEN_MEDICO] (ID_Tipo_Examen,descripcion) Values (2,'Resonancia Magnética')
INSERT INTO [TB_TIPO_EXAMEN_MEDICO] (ID_Tipo_Examen,descripcion) Values (3,'Tomografía')
INSERT INTO [TB_TIPO_EXAMEN_MEDICO] (ID_Tipo_Examen,descripcion) Values (4,'Radiología')
INSERT INTO [TB_TIPO_EXAMEN_MEDICO] (ID_Tipo_Examen,descripcion) Values (5,'Ecografía')
INSERT INTO [TB_TIPO_EXAMEN_MEDICO] (ID_Tipo_Examen,descripcion) Values (6,'Mamografía')
INSERT INTO [TB_TIPO_EXAMEN_MEDICO] (ID_Tipo_Examen,descripcion) Values (7,'Densitometría ósea')
INSERT INTO [TB_TIPO_EXAMEN_MEDICO] (ID_Tipo_Examen,descripcion) Values (8,'Electro encefalografía')
SET IDENTITY_INSERT [dbo].[TB_TIPO_EXAMEN_MEDICO] OFF


SET IDENTITY_INSERT [dbo].[TB_CONSULTORIO] ON
INSERT INTO [TB_CONSULTORIO] (ID_Consultorio,descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values (1,'Consultorio 1', '1-A',1,4,2)
INSERT INTO [TB_CONSULTORIO] (ID_Consultorio,descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values (2,'Consultorio 2', '2-A',1,2,2)
INSERT INTO [TB_CONSULTORIO] (ID_Consultorio,descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values (3,'Consultorio 3', '3-A',1,3,2)
INSERT INTO [TB_CONSULTORIO] (ID_Consultorio,descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values (4,'Consultorio 4', '4-A',1,4,2)
INSERT INTO [TB_CONSULTORIO] (ID_Consultorio,descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values (5,'Consultorio 5', '1-B',2,1,1)
INSERT INTO [TB_CONSULTORIO] (ID_Consultorio,descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values (6,'Consultorio 6', '2-B',2,2,1)
INSERT INTO [TB_CONSULTORIO] (ID_Consultorio,descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values (7,'Consultorio 7', '3-B',2,3,3)
INSERT INTO [TB_CONSULTORIO] (ID_Consultorio,descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values (8,'Consultorio 8', '4-B',2,4,3)
SET IDENTITY_INSERT [dbo].[TB_CONSULTORIO] OFF

SET IDENTITY_INSERT [dbo].[TB_ESPECIALIDAD] ON
INSERT [dbo].[TB_ESPECIALIDAD] ([ID_Especialidad], [descripcion]) VALUES (1, N'Traumatología')
INSERT [dbo].[TB_ESPECIALIDAD] ([ID_Especialidad], [descripcion]) VALUES (2, N'Fisioterapía')
INSERT [dbo].[TB_ESPECIALIDAD] ([ID_Especialidad], [descripcion]) VALUES (3, N'Cardiología')
INSERT [dbo].[TB_ESPECIALIDAD] ([ID_Especialidad], [descripcion]) VALUES (4, N'Neurologíaa')
SET IDENTITY_INSERT [dbo].[TB_ESPECIALIDAD] OFF

INSERT [TB_MEDICOESPECIALIDAD] ([ID_Medico], [ID_Especialidad]) VALUES (1, 1)
INSERT [TB_MEDICOESPECIALIDAD] ([ID_Medico], [ID_Especialidad]) VALUES (2, 1)
INSERT [TB_MEDICOESPECIALIDAD] ([ID_Medico], [ID_Especialidad]) VALUES (3, 3)
INSERT [TB_MEDICOESPECIALIDAD] ([ID_Medico], [ID_Especialidad]) VALUES (4, 3)
INSERT [TB_MEDICOESPECIALIDAD] ([ID_Medico], [ID_Especialidad]) VALUES (1, 4)
INSERT [TB_MEDICOESPECIALIDAD] ([ID_Medico], [ID_Especialidad]) VALUES (3, 2)

SET IDENTITY_INSERT [dbo].[TB_MOTIVO_HOSPITALIZACION] ON
INSERT INTO [dbo].[TB_MOTIVO_HOSPITALIZACION]([ID_Motivo_Hospitalizacion],[DescripcionInternamiento],[Estado])VALUES(1,'Médico',1)
INSERT INTO [dbo].[TB_MOTIVO_HOSPITALIZACION]([ID_Motivo_Hospitalizacion],[DescripcionInternamiento],[Estado])VALUES(2,'Ambulatorio',1)
INSERT INTO [dbo].[TB_MOTIVO_HOSPITALIZACION]([ID_Motivo_Hospitalizacion],[DescripcionInternamiento],[Estado])VALUES(3,'Quirúrgico',1)
SET IDENTITY_INSERT [dbo].[TB_MOTIVO_HOSPITALIZACION] OFF

SET IDENTITY_INSERT [dbo].[TB_AGENDA_MEDICA] ON
INSERT [dbo].[TB_AGENDA_MEDICA] ([ID_AgendaMedica], [Fecha], [HoraInicio], [HoraFin], [Estado], [ID_Medico], [ID_Consultorio]) VALUES (2, CAST(0x0000A2E100000000 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), 1, 1, 1)
INSERT [dbo].[TB_AGENDA_MEDICA] ([ID_AgendaMedica], [Fecha], [HoraInicio], [HoraFin], [Estado], [ID_Medico], [ID_Consultorio]) VALUES (3, CAST(0x0000A2E100000000 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), 1, 2, 3)
INSERT [dbo].[TB_AGENDA_MEDICA] ([ID_AgendaMedica], [Fecha], [HoraInicio], [HoraFin], [Estado], [ID_Medico], [ID_Consultorio]) VALUES (4, CAST(0x0000A2E100000000 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), 1, 2, 4)
INSERT [dbo].[TB_AGENDA_MEDICA] ([ID_AgendaMedica], [Fecha], [HoraInicio], [HoraFin], [Estado], [ID_Medico], [ID_Consultorio]) VALUES (5, CAST(0x0000A2E100000000 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), 1, 3, 5)
INSERT [dbo].[TB_AGENDA_MEDICA] ([ID_AgendaMedica], [Fecha], [HoraInicio], [HoraFin], [Estado], [ID_Medico], [ID_Consultorio]) VALUES (6, CAST(0x0000A2E100000000 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), 1, 4, 4)
INSERT [dbo].[TB_AGENDA_MEDICA] ([ID_AgendaMedica], [Fecha], [HoraInicio], [HoraFin], [Estado], [ID_Medico], [ID_Consultorio]) VALUES (7, CAST(0x0000A2E100000000 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), CAST(0x0000A2EA01808AC3 AS DateTime), 1, 1, 6)
SET IDENTITY_INSERT [dbo].[TB_AGENDA_MEDICA] OFF

SET IDENTITY_INSERT [dbo].[TB_CITA] ON
INSERT [dbo].[TB_CITA] ([ID_Cita], [FechaHoraCita], [Aseguradora], [Cobertura], [Estado], [OrdenAtencion], [ID_Paciente], [ID_Historia], [ID_Especialidad], [ID_Medico], [ID_AgendaMedica], [ID_EstadoCita], [ID_Cita_Reprogramada], [Des_Ubicacion_Cita]) VALUES (3, DATEADD(hour, 1, GETDATE()), N'S', 1500, N'Activo', N'1', 1, NULL, 1, 1, 2, 1, NULL, NULL)
INSERT [dbo].[TB_CITA] ([ID_Cita], [FechaHoraCita], [Aseguradora], [Cobertura], [Estado], [OrdenAtencion], [ID_Paciente], [ID_Historia], [ID_Especialidad], [ID_Medico], [ID_AgendaMedica], [ID_EstadoCita], [ID_Cita_Reprogramada], [Des_Ubicacion_Cita]) VALUES (4, CAST(0x0000A2EA01808AC3 AS DateTime), N'S', 3500, N'Activo', N'1', 2, NULL, 1, 2, 3, 1, NULL, NULL)
INSERT [dbo].[TB_CITA] ([ID_Cita], [FechaHoraCita], [Aseguradora], [Cobertura], [Estado], [OrdenAtencion], [ID_Paciente], [ID_Historia], [ID_Especialidad], [ID_Medico], [ID_AgendaMedica], [ID_EstadoCita], [ID_Cita_Reprogramada], [Des_Ubicacion_Cita]) VALUES (5, CAST(0x0000A2EA01808AC3 AS DateTime), N'S', 3000, N'Activo', N'1', 3, NULL, 1, 3, 3, 1, NULL, NULL)
INSERT [dbo].[TB_CITA] ([ID_Cita], [FechaHoraCita], [Aseguradora], [Cobertura], [Estado], [OrdenAtencion], [ID_Paciente], [ID_Historia], [ID_Especialidad], [ID_Medico], [ID_AgendaMedica], [ID_EstadoCita], [ID_Cita_Reprogramada], [Des_Ubicacion_Cita]) VALUES (6, CAST(0x0000A2EA01808AC3 AS DateTime), N'S', 1200, N'Activo', N'1', 4, NULL, 1, 2, 3, 1, NULL, NULL)
INSERT [dbo].[TB_CITA] ([ID_Cita], [FechaHoraCita], [Aseguradora], [Cobertura], [Estado], [OrdenAtencion], [ID_Paciente], [ID_Historia], [ID_Especialidad], [ID_Medico], [ID_AgendaMedica], [ID_EstadoCita], [ID_Cita_Reprogramada], [Des_Ubicacion_Cita]) VALUES (7, CAST(0x0000A2EA01808AC3 AS DateTime), N'S', 2600, N'Activo', N'1', 4, NULL, 1, 3, 4, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TB_CITA] OFF

SET IDENTITY_INSERT [dbo].[TB_CONSULTA] ON
INSERT INTO [dbo].[TB_CONSULTA]([ID_Consulta],[FechaHoraInicio],[FechaHoraFin],[Observaciones],[ID_Medico],[ID_Cita],[ID_Consultorio],[ID_Paciente],[Diagnostico])
VALUES(1,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A2EA01808AC3 AS DateTime),'El paciente tiene arta diarrea',1,7,1,1,'Crisis de colitis')
INSERT INTO [dbo].[TB_CONSULTA]([ID_Consulta],[FechaHoraInicio],[FechaHoraFin],[Observaciones],[ID_Medico],[ID_Cita],[ID_Consultorio],[ID_Paciente],[Diagnostico])
VALUES(2,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A2EA01808AC3 AS DateTime),'El paciente tiene bonrquis',2,3,3,2,'Crisis de colitis')
INSERT INTO [dbo].[TB_CONSULTA]([ID_Consulta],[FechaHoraInicio],[FechaHoraFin],[Observaciones],[ID_Medico],[ID_Cita],[ID_Consultorio],[ID_Paciente],[Diagnostico])
VALUES(3,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A2EA01808AC3 AS DateTime),'',2,3,4,4,'Crisis de colitis')
INSERT INTO [dbo].[TB_CONSULTA]([ID_Consulta],[FechaHoraInicio],[FechaHoraFin],[Observaciones],[ID_Medico],[ID_Cita],[ID_Consultorio],[ID_Paciente],[Diagnostico])
VALUES(4,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A2EA01808AC3 AS DateTime),'',2,3,4,4,'Crisis de asma')
SET IDENTITY_INSERT [dbo].[TB_CONSULTA] OFF

SET IDENTITY_INSERT [dbo].[TB_ORDEN_HOSPITALIZACION] ON

INSERT INTO [dbo].[TB_ORDEN_HOSPITALIZACION]([ID_Orden_Hospitalizacion],[FechaOrden],[Prevision],[Tratamiento],[NroDiasHospitalizacion],[ExamenesPreOperatorios],[ID_MedicoTratante],[ID_MedicoTurno],[ID_Paciente],[FechaHora],[Observaciones],[FechaHoraAlta],[ID_Motivo_Hospitalizacion],[ID_Consulta],[ID_Local],[ID_Estado])
VALUES(1001,CAST(0x0000A2E100000000 AS DateTime),'','',5,'1',1,2,1,CAST(0x0000A2EA01808AC3 AS DateTime),'',NULL,1,1,1,1)

INSERT INTO [dbo].[TB_ORDEN_HOSPITALIZACION]([ID_Orden_Hospitalizacion],[FechaOrden],[Prevision],[Tratamiento],[NroDiasHospitalizacion],[ExamenesPreOperatorios],[ID_MedicoTratante],[ID_MedicoTurno],[ID_Paciente],[FechaHora],[Observaciones],[FechaHoraAlta],[ID_Motivo_Hospitalizacion],[ID_Consulta],[ID_Local],[ID_Estado])
VALUES(1002,CAST(0x0000A2E100000000 AS DateTime),'','',13,'0',3,4,2,CAST(0x0000A4EA01817AC1 AS DateTime),'',NULL,2,3,1,1)

INSERT INTO [dbo].[TB_ORDEN_HOSPITALIZACION]([ID_Orden_Hospitalizacion],[FechaOrden],[Prevision],[Tratamiento],[NroDiasHospitalizacion],[ExamenesPreOperatorios],[ID_MedicoTratante],[ID_MedicoTurno],[ID_Paciente],[FechaHora],[Observaciones],[FechaHoraAlta],[ID_Motivo_Hospitalizacion],[ID_Consulta],[ID_Local],[ID_Estado])
VALUES(1003,CAST(0x0000A2E100000000 AS DateTime),'','',12,'0',2,3,3,CAST(0x0000A4EA01817AC1 AS DateTime),'',NULL,3,4,1,1)

INSERT INTO [dbo].[TB_ORDEN_HOSPITALIZACION]([ID_Orden_Hospitalizacion],[FechaOrden],[Prevision],[Tratamiento],[NroDiasHospitalizacion],[ExamenesPreOperatorios],[ID_MedicoTratante],[ID_MedicoTurno],[ID_Paciente],[FechaHora],[Observaciones],[FechaHoraAlta],[ID_Motivo_Hospitalizacion],[ID_Consulta],[ID_Local],[ID_Estado])
VALUES(1004,CAST(0x0000A2E100000000 AS DateTime),'','',15,'1',3,1,4,CAST(0x0000A2EA01808AC3 AS DateTime),'',NULL,3,2,2,1)

SET IDENTITY_INSERT [dbo].[TB_ORDEN_HOSPITALIZACION] OFF


SET IDENTITY_INSERT [dbo].[TB_ORDEN_DE_PROCEDIMIENTO] ON
INSERT INTO [dbo].[TB_ORDEN_DE_PROCEDIMIENTO]([ID_Orden_de_Procedimiento],[NombreOrdenProcedimiento],[FechaOrdenProcedimiento],[CartaGarantia],[ID_Paciente],[ID_Medico],[Estado],[Aseguradora])
VALUES(1,'',CAST(0x0000A2E100000000 AS DateTime),'',1,1,'1','1')
INSERT INTO [dbo].[TB_ORDEN_DE_PROCEDIMIENTO]([ID_Orden_de_Procedimiento],[NombreOrdenProcedimiento],[FechaOrdenProcedimiento],[CartaGarantia],[ID_Paciente],[ID_Medico],[Estado],[Aseguradora])
VALUES(2,'',CAST(0x0000A2E100000000 AS DateTime),'',2,1,'1','1')
INSERT INTO [dbo].[TB_ORDEN_DE_PROCEDIMIENTO]([ID_Orden_de_Procedimiento],[NombreOrdenProcedimiento],[FechaOrdenProcedimiento],[CartaGarantia],[ID_Paciente],[ID_Medico],[Estado],[Aseguradora])
VALUES(3,'',CAST(0x0000A2E100000000 AS DateTime),'',3,1,'1','1')
INSERT INTO [dbo].[TB_ORDEN_DE_PROCEDIMIENTO]([ID_Orden_de_Procedimiento],[NombreOrdenProcedimiento],[FechaOrdenProcedimiento],[CartaGarantia],[ID_Paciente],[ID_Medico],[Estado],[Aseguradora])
VALUES(4,'',CAST(0x0000A2E100000000 AS DateTime),'',2,1,'1','1')
INSERT INTO [dbo].[TB_ORDEN_DE_PROCEDIMIENTO]([ID_Orden_de_Procedimiento],[NombreOrdenProcedimiento],[FechaOrdenProcedimiento],[CartaGarantia],[ID_Paciente],[ID_Medico],[Estado],[Aseguradora])
VALUES(5,'',CAST(0x0000A2E100000000 AS DateTime),'',1,1,'1','1')
SET IDENTITY_INSERT [dbo].[TB_ORDEN_DE_PROCEDIMIENTO] OFF

SET IDENTITY_INSERT [dbo].[TB_CARTA_GARANTIA] ON
INSERT INTO [dbo].[TB_CARTA_GARANTIA](ID_Carta,[ID_Orden_de_Procedimiento],[CodPresupuesto],[ID_Paciente],[CodAseguradora],[FecINiVigencia],[FecFinVigencia],[MontoCarta],[Detalle],[Estado])
VALUES(1,1,1,1,1,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A2EA01808AC3 AS DateTime),2030.36,'',1)
INSERT INTO [dbo].[TB_CARTA_GARANTIA](ID_Carta,[ID_Orden_de_Procedimiento],[CodPresupuesto],[ID_Paciente],[CodAseguradora],[FecINiVigencia],[FecFinVigencia],[MontoCarta],[Detalle],[Estado])
VALUES(2,1,1,2,1,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A2EA01808AC3 AS DateTime),2030.36,'',1)
INSERT INTO [dbo].[TB_CARTA_GARANTIA](ID_Carta,[ID_Orden_de_Procedimiento],[CodPresupuesto],[ID_Paciente],[CodAseguradora],[FecINiVigencia],[FecFinVigencia],[MontoCarta],[Detalle],[Estado])
	VALUES(3,1,1,3,1,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A4EA01817AC1 AS DateTime),2030.36,'',1)
INSERT INTO [dbo].[TB_CARTA_GARANTIA](ID_Carta,[ID_Orden_de_Procedimiento],[CodPresupuesto],[ID_Paciente],[CodAseguradora],[FecINiVigencia],[FecFinVigencia],[MontoCarta],[Detalle],[Estado])
VALUES(4,1,1,2,1,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A4EA01817AC1 AS DateTime),2030.36,'',1)


INSERT INTO [dbo].[TB_CARTA_GARANTIA](ID_Carta,[ID_Orden_de_Procedimiento],[CodPresupuesto],[ID_Paciente],[CodAseguradora],[FecINiVigencia],[FecFinVigencia],[MontoCarta],[Detalle],[Estado])
VALUES(5,1,1,1,1,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A4EA01817AC1 AS DateTime),2030.36,'',1)

INSERT INTO [dbo].[TB_CARTA_GARANTIA](ID_Carta,[ID_Orden_de_Procedimiento],[CodPresupuesto],[ID_Paciente],[CodAseguradora],[FecINiVigencia],[FecFinVigencia],[MontoCarta],[Detalle],[Estado])
VALUES(6,1,1,2,1,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A4EA01817AC1 AS DateTime),2030.36,'',1)

INSERT INTO [dbo].[TB_CARTA_GARANTIA](ID_Carta,[ID_Orden_de_Procedimiento],[CodPresupuesto],[ID_Paciente],[CodAseguradora],[FecINiVigencia],[FecFinVigencia],[MontoCarta],[Detalle],[Estado])
VALUES(7,1,1,3,1,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A4EA01817AC1 AS DateTime),2030.36,'',1)

INSERT INTO [dbo].[TB_CARTA_GARANTIA](ID_Carta,[ID_Orden_de_Procedimiento],[CodPresupuesto],[ID_Paciente],[CodAseguradora],[FecINiVigencia],[FecFinVigencia],[MontoCarta],[Detalle],[Estado])
VALUES(8,1,1,4,1,CAST(0x0000A2E100000000 AS DateTime),CAST(0x0000A4EA01817AC1 AS DateTime),2030.36,'',1)

SET IDENTITY_INSERT [dbo].[TB_CARTA_GARANTIA] OFF





INSERT INTO dbo.TB_MAESTRO_TABLAS (MAS_CodTabla,MAS_CodCampo,MAS_DesCorta,MAS_Valor,MAS_Estado)
VALUES ('TB_PAIS','1','PERÚ','','A');

INSERT INTO dbo.TB_MAESTRO_TABLAS (MAS_CodTabla,MAS_CodCampo,MAS_DesCorta,MAS_Valor,MAS_Estado)
VALUES ('TB_DPTO','1','LIMA','1','A');

INSERT INTO dbo.TB_MAESTRO_TABLAS (MAS_CodTabla,MAS_CodCampo,MAS_DesCorta,MAS_Valor,MAS_Estado)
VALUES ('TB_PROVIN','1','LIMA','1','A');

INSERT INTO dbo.TB_MAESTRO_TABLAS (MAS_CodTabla,MAS_CodCampo,MAS_DesCorta,MAS_Valor,MAS_Estado)
VALUES ('TB_DIST','1','San Borja','1','A');

INSERT INTO dbo.TB_MAESTRO_TABLAS (MAS_CodTabla,MAS_CodCampo,MAS_DesCorta,MAS_Valor,MAS_Estado)
VALUES ('TB_DIST','2','San Luis','1','A');

INSERT INTO dbo.TB_MAESTRO_TABLAS (MAS_CodTabla,MAS_CodCampo,MAS_DesCorta,MAS_Valor,MAS_Estado)
VALUES ('TB_DIST','3','Pueblo Libre','1','A');
GO



INSERT INTO dbo.TB_MAESTRO_TABLAS (MAS_CodTabla,MAS_CodCampo,MAS_DesCorta,MAS_Valor,MAS_Estado)
VALUES ('TB_TIPADM','1','Ambulatoria','','A');

INSERT INTO dbo.TB_MAESTRO_TABLAS (MAS_CodTabla,MAS_CodCampo,MAS_DesCorta,MAS_Valor,MAS_Estado)
VALUES ('TB_TIPADM','2','Emergencia','','A');

INSERT INTO dbo.TB_MAESTRO_TABLAS (MAS_CodTabla,MAS_CodCampo,MAS_DesCorta,MAS_Valor,MAS_Estado)
VALUES ('TB_TIPADM','3','Hospitalización','','A');
GO
