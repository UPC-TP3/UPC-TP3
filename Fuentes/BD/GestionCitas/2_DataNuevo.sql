
insert into TB_Especialidad (Descripcion) values ('Pediatría')
insert into TB_Especialidad (Descripcion) values ('Dermatología')
insert into TB_Especialidad (Descripcion) values ('Urología')
insert into TB_Especialidad (Descripcion) values ('Medicina General')


insert into TB_Local (NombreLocal,DireccionLocal) values ('Local 1','Direccion 1')
insert into TB_Local (NombreLocal,DireccionLocal) values ('Local 2','Direccion 2')
insert into TB_Local (NombreLocal,DireccionLocal) values ('Local 3','Direccion 3')
insert into TB_Local (NombreLocal,DireccionLocal) values ('Local 4','Direccion 4')
insert into TB_Local (NombreLocal,DireccionLocal) values ('Local 5','Direccion 5')

insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('100','1',1)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('101','1',1)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('102','1',1)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('200','2',1)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('201','2',1)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('202','2',1)

insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('100','1',2)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('101','1',2)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('102','1',2)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('200','2',2)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('201','2',2)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('202','2',2)

insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('100','1',3)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('101','1',3)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('102','1',3)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('200','2',3)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('201','2',3)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('202','2',3)

insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('100','1',4)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('101','1',4)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('102','1',4)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('200','2',4)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('201','2',4)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('202','2',4)

insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('100','1',5)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('101','1',5)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('102','1',5)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('200','2',5)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('201','2',5)
insert into TB_Consultorio (NumeroConsultorio,Piso,CodigoLocal) values ('202','2',5)

insert into TB_TipoAnalisis (Descripcion,TipoResultado) values ('Tipo analisis 1', 'TipoResultado 1')
insert into TB_TipoAnalisis (Descripcion,TipoResultado) values ('Tipo analisis 2', 'TipoResultado 2')
insert into TB_TipoAnalisis (Descripcion,TipoResultado) values ('Tipo analisis 3', 'TipoResultado 3')
insert into TB_TipoAnalisis (Descripcion,TipoResultado) values ('Tipo analisis 4', 'TipoResultado 4')
insert into TB_TipoAnalisis (Descripcion,TipoResultado) values ('Tipo analisis 5', 'TipoResultado 5')


insert into TB_Medicamento (Descripcion, Laboratorio, Observaciones) values ('Medicamento 1','Laboratorio 1','Obs 1')
insert into TB_Medicamento (Descripcion, Laboratorio, Observaciones) values ('Medicamento 2','Laboratorio 2','Obs 2')
insert into TB_Medicamento (Descripcion, Laboratorio, Observaciones) values ('Medicamento 3','Laboratorio 3','Obs 3')
insert into TB_Medicamento (Descripcion, Laboratorio, Observaciones) values ('Medicamento 4','Laboratorio 4','Obs 4')
insert into TB_Medicamento (Descripcion, Laboratorio, Observaciones) values ('Medicamento 5','Laboratorio 5','Obs 5')


insert into TB_MotivoInternamiento (DescripcionInternamiento) values ('Motivo 1')
insert into TB_MotivoInternamiento (DescripcionInternamiento) values ('Motivo 2')
insert into TB_MotivoInternamiento (DescripcionInternamiento) values ('Motivo 3')
insert into TB_MotivoInternamiento (DescripcionInternamiento) values ('Motivo 4')
insert into TB_MotivoInternamiento (DescripcionInternamiento) values ('Motivo 5')


insert TB_Estado_Cita  values (1,'Registrado')
insert TB_Estado_Cita  values (2,'Cancelado')

insert TB_Medico values('Cesar','Cueto Garcia',1,'45612333')
insert TB_Medico values('Manuel','Cespedez Reaño',3,'CP456789') 

insert TB_Paciente values('Pedro','Lozano','Huaman',NULL,NULL,NULL,NULL,'10048380')
insert TB_Paciente values('Joaquin','Quispe','Lopes',NULL,NULL,NULL,NULL,'456789743')
insert TB_Paciente values('Karina','Solorzano','Fernandez',NULL,NULL,NULL,NULL,'82012799')
insert TB_Paciente values('Luis','Zapata','Soto',NULL,NULL,NULL,NULL,'36975466')
insert TB_Paciente values('Jose','Reaño','Mera',NULL,NULL,NULL,NULL,'459133832')
 
 
insert TB_Agenda_Medica values('10/03/2014','09:00','09:30',1,1,15)
insert TB_Agenda_Medica values('10/03/2014','09:30','10:00',1,1,15)
insert TB_Agenda_Medica values('10/03/2014','10:00','10:30',1,1,15)
insert TB_Agenda_Medica values('10/03/2014','10:30','11:00',1,1,15)
insert TB_Agenda_Medica values('10/03/2014','11:00','11:30',1,1,15)

insert TB_Agenda_Medica values('12/03/2014','16:00','16:30',1,2,25)
insert TB_Agenda_Medica values('12/03/2014','16:30','17:00',1,2,25)
insert TB_Agenda_Medica values('12/03/2014','17:00','17:30',1,2,25)
insert TB_Agenda_Medica values('12/03/2014','17:30','18:00',1,2,25)
insert TB_Agenda_Medica values('12/03/2014','18:00','18:30',1,2,25)

